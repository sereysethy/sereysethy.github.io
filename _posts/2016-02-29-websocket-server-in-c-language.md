---
title: Websocket Server in C
date: 2016-02-29
category: programming
tags: 
  - websocket 
  - c 
  - base64
---

I will start my first post by describing a program that I wrote in C which implements a websocket server.
The program accepts a websocket connection from client by sending a websocket acceptation key.

If handshake is successful, server is then ready to receive message from client. The program implements the Websocket handshake protocole as described in [Request for Comments 6455](https://tools.ietf.org/html/rfc6455).

The program performs following tasks:

- Start a TCP socket server
- Waiting for a connection
- Receive a Websocket handshake message
- Send a Websocket handshake message to client
- Start receiving messages sent and dump them to stdout

I took an example of a TCP server from <a href="https://www.cs.cmu.edu/afs/cs.cmu.edu/academic/class/15213-f99/www/">CS 213: Introduction to Computer Systems, Fall 1999</a>.

The handshake message from client is something like this:

```http
GET / HTTP/1.1
Host: localhost:8080
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:44.0) Gecko/20100101 Firefox/44.0
Accept: text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8
Accept-Language: en-US,en;q=0.5
Accept-Encoding: gzip, deflate
Sec-WebSocket-Version: 13
Origin: null
Sec-WebSocket-Extensions: permessage-deflate
Sec-WebSocket-Key: BE/bv0JO2wBVnABhxQO5kQ==
Connection: keep-alive, Upgrade
Pragma: no-cache
Cache-Control: no-cache
Upgrade: websocket
```

And the server has to answer back this handshake message in return

```http
HTTP/1.1 101 Switching Protocols
Upgrade: websocket
Connection: Upgrade
Sec-WebSocket-Accept: qBPI+1rPa4lNhVJ0cztOjbvugAQ=
```

To construct the `Sec-WebSocket-Accept` value, we need to perform the following:

- Take value of `Sec-WebSocket-Key`, in this case it is `BE/bv0JO2wBVnABhxQO5kQ==` and concatenate it with Websocket GID `258EAFA5-E914-47DA-95CA-C5AB0DC85B11`
- Encrypt that concatenated string using `OpenSSL SHA1`
- Encode base64 of the encrypted string


```c 
char * encrypt_message(char * msg, char * digestname) {
  EVP_MD_CTX *mdctx;
  const EVP_MD *md;
  unsigned char md_value[EVP_MAX_MD_SIZE];
  int md_len, i;
  unsigned char * encoded;
  int nb;

  OpenSSL_add_all_digests();

  md = EVP_get_digestbyname(digestname);

  if (!md) {
    printf("Unknown message digest %s\n", digestname);
    exit(1);
  }

  mdctx = EVP_MD_CTX_create();
  EVP_DigestInit_ex(mdctx, md, NULL);
  EVP_DigestUpdate(mdctx, msg, strlen(msg));
  EVP_DigestFinal_ex(mdctx, md_value, &md_len);
  EVP_MD_CTX_destroy(mdctx);

  /* malloc of md_len */ 
  encoded = malloc(md_len);
  memcpy(encoded, md_value, md_len);
  
  /* Call this once before exit. */
  EVP_cleanup();

  return encoded;
}
```

This program will take the `str` specified by its `length` and encode it to `base64`.

```c
const char table[64] = {'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H',
                        'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P',
                        'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X',
                        'Y', 'Z', 'a', 'b', 'c', 'd', 'e', 'f',
                        'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n',
                        'o', 'p', 'q', 'r', 's', 't', 'u', 'v',
                        'w', 'x', 'y', 'z', '0', '1', '2', '3', 
                        '4', '5', '6', '7', '8', '9', '+', '/'};

int base64encode(char* encoded, const unsigned char * str, int length) {
  int i;
  char * p;

  p = encoded;

  for (i = 0; i < length; i = i + 3) {
    if (i == length - 2) {  //=
      *p++ = table[str[i] >> 2];
      *p++ = table[((str[i] << 4) & 0x30) | ((str[i+1] & 0xF0) >> 4)];
      *p++ = table[(str[i+1] << 2) & 0x3C];
      *p++ = '=';
    } else {
      if (i == length - 1) { //==
        *p++ = table[str[i] >> 2];
        *p++ = table[(str[i] << 2) & 0x30];
        *p++ = '=';
        *p++ = '=';
      } else {
        *p++ = table[str[i] >> 2];
        *p++ = table[((str[i] << 4) & 0x30) | ((str[i+1] & 0xF0) >> 4)];
        *p++ = table[((str[i + 1] << 2) & 0x3C) | (str[i+2] >> 6)];
        *p++ = table[(str[i + 2] & 0x3F)];
      }
    }
  }

  *p++ = '\0';
  return p - encoded;
}
```

This function will

- read `header`,
- compute the `length of payload data`,
- get 4 bytes of masks and
- dump message to `stdout`

```c
int read_data(int fd) {
  uint64_t i, j, length, tmp_length;;
  unsigned char c;
  unsigned char buf[BUFSIZE];
  char masks[4];
  int n;

  // init
  i = 0;
  j = 0;
  n = 0;
  length      = 0;
  tmp_length  = 0;

  /* check the payload */
  n = read(fd, buf, 2);

  /* if read error return errorno */
  if (n < 0) return n;

  /* read payload length */
  length = buf[1] & (0x7F);
  printf("Initial payload length: %llu\n", length);
 
  /* check the payload length */
  if (length  == 126) {
    n = read(fd, buf, 2);
    /* if read error return errorno */
    if (n < 0) return n;

    length = buf[0];
    length = (length << 8) | buf[1];
  } else {
    if (length == 127) {
      n = read(fd, buf, 8);
      /* if read error return errorno */
      if (n < 0) return n;

      length = buf[0];
      for (i = 1; i <= 7; i++) {
        length = ((length << 8) | buf[i]);
      }
    }
  }

  printf("Total Payload: %"PRIu64"\n", length);
  printf("Start reading character and print them out...\n\n");

  /* get masks from the next 4 bytes */
  n = read(fd, masks, 4);

  /* return error if reading is negative */
  if (n < 0) return n;

  /* save the original length */
  tmp_length = length;

  /* start dumping content to stdout */
  while (TRUE) {
    if (tmp_length < BUFSIZE) {
      n = read(fd, buf, tmp_length);
      if (n < 0) return n;
    } else {
      n = read(fd, buf, BUFSIZE);  
    }

    for (i = 0; i < n; i++) {
      c = (buf[i] ^ masks[j % 4]);
      printf("%c", c);
      j++;
    }

    tmp_length = tmp_length - n;
    
    if (j == length) break;
  }
  
  printf("\nEnd of transmitted message\n");
  return length;
}
```

Here is the client code in `html`.

```html
<html>
<body>
  <script>
    ws = new WebSocket("ws://localhost:8080");

    ws.onopen = function() {
    // Web Socket is connected. You can send data by send() method.
    console.log("connected...");
    ws.send("hello world!");
    };
  </script>
</body>
</html>
```

You can get a complete code on my github.