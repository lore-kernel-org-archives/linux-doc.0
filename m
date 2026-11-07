Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794022497;
	b=5ZobiR3GjegT451MI63zx+oztClOWPvwY9IGqh9mChPSjeiCZ3x99bw7nt/7pe7WGSjQ
	 BDlTfE9UpInoEc5dkVrS7i1nzMLHLXXLIPmExFI1JgRU/+MuajsmELEtO8h9Xkq6rVtIk
	 C5GWNb2s5mjV+rIVgyEtxieEQ2n2E8Tk9mvu1mEKTPjWHu/iwYy6VCpz95X+j0QP61G/m
	 P5fLGmc7q2vlEkEsd1W4FtUEKY0uwjqb8T2A6rKACwDNc0MWR4ydxxATUQFxjYateiyh+
	 xd2g8HwRLYMY/pDqpwfjWHajzIhHTj8ADWGzSqW0ZXO858XXuLwzmz285aDwDEswQuA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794022497;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=oFRJqIHH4Uu0/GgveZRmx8TIDB+Hixs9HbJY1cYzKxM=;
	b=di4TZAA7bTM/52ZDuq/4FKBVHwHsO77cQYYWVvvuEgqAazb22Vg5mbEvkFAK7AqrBE0k
	 2Vv4a042Hp+J5dZWIeOZgm0vxpIJRXVMNV5ulNRIQvWWu+osQ1yfnPxQ7wbld+ubfqbIN
	 ftTpiYYGhlhYHiJfBBJN/5gPlAuU3vP5PZOBJrjr1kliVPpmetTSK/TIqUlCon3njhcZs
	 FwIbn7+vXDl7jJ7xB4LBQx7DNaoFBM5+b/qHIi79VtZ4IXtm5nZS7bOu0IcAeVvESSKZ1
	 3i+tBrhizdPiBTGfBtRMqoY3d3IGkG6FT8Fv6ETge6Vugz6UnRR93NGQxeGqSSMzQuA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cloudflare.com;
	spf=pass smtp.mailfrom=cloudflare.com;
	dkim=pass header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=CuGsq7jQ;
	arc=none smtp.remote-ip=209.85.218.43
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A6E7606A32D
	for <linux-doc@vger.kernel.org>; Sat,  7 Nov 2026 03:34:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3A6E7606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=CuGsq7jQ
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c34bff61551so203667766b.2
        for <linux-doc@vger.kernel.org>; Fri, 06 Nov 2026 19:34:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1794022496; x=1794627296; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oFRJqIHH4Uu0/GgveZRmx8TIDB+Hixs9HbJY1cYzKxM=;
        b=CuGsq7jQiUwc8uwFzNw/ENZ6f2KjpuUGfKt+Ii/xdmbNtAYmRgsjFbRInOfPysbQUS
         yANdYNbxm3MDT0b8iGW7xxCOA1Kqu8ga8LgD0ARmCfHh33r5FVAaN6MOirGkBsBXpSOV
         mm+ZX2N24PTap4EXGvt97sQdlx+0kKtpBNVx5DBhVkK6KGxHKToFhOSUXTnxX3JwjblU
         eyDPWSCzZIgPdQ84KJWhWZxCOiUtZJ52kPwEQ1ti4gx9DC83S8phs+apvii2AtJkvazi
         vJsoS7aG9IQMc27oyvQX3/kf1KBEGX7428fQczrws3mrU0pqRcWpa3E6O2ty4rHoBCZK
         JpgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794022496; x=1794627296;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oFRJqIHH4Uu0/GgveZRmx8TIDB+Hixs9HbJY1cYzKxM=;
        b=xiOV/sct54Lm4fssRonpA36n5oVxd7BIqgaFtwEU+eKJqmHCQ0Q8REMZ/wHxI+pz8x
         wwoc5k3v6IvaFQnm9WN5qVbqvh1sbJ9HJcJWsIUZOxtx6Xa5kTUqcv0ufy7PJc/dn/wJ
         7kvD+zjDLmFL1PcnFdXECLIuDHJd+dtRySKarm35iqXsX1N61/fAM4uShABWO+7ctHdS
         0FPJOcy8YRTemVPKohsJMzn70mJHuRK+lnz4DLG8qlMtWCn19MX6IBvwJ8NXFFLyXQOY
         SvXc+dkNXZmzGwuoHvZH95bgOVccVX81X/yaiU00sUb8e89v3KGKb5zAJvdb9/Dl5LPL
         w64g==
X-Forwarded-Encrypted: i=1; AKwUvBxndTTx5YeuPlKZF8Blqqlwgl3v0A2o4rZxxIqzjBltexDIscw1PSMU1EY43COUvHcj3/wai2lPnYQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/l/sgxievIpG5EbsmcclQARaCpquPOs3X/Rq4CFk5CRD1sosY5
	H1KAL1cqpN627nsYXV47cNlnUuGD1WFVknIQf0HRPQ6MKiXipESM5fb28dOt1u/no0c=
X-Gm-Gg: AYBFou3yulnyMPpe0hk5qMtgmQ0sZFBt/ayTkzn9Atdi7hTLJkeegOJM7nx+suGvCQ7
	f99jPJ1F9kVeZZorK0bTip8e2pJTjAIgc1xDNVYVwQevUR5RglaSjw+tw9ldSMOhgwmTSnP423m
	OssyVuV0PhEWGSgK80hKfcQc/w2/+oUGuSBXsRfhQydP0G/SfIOyrPmU8IKVdxngFHnd3hYlTJ7
	QoigcSNtITxAqx1FvMVeH0YsCI6kwynwicshVSpsOBGztqPTj4yfDx2yqs3ybkPlUYI95/ThFlO
	SFVA4n7meHGOyuPGNTmUUPbgORirGNylSSkdcfa24r/1MtF6W9mIh9wQpmzbrlR7wdY2xfWxrSS
	udUuzHGHcplbDtna/przFXB89Zv8fwzNeTxBbaRD3oiY4VAnJX5SNSh2gQXWR0TjmA13JfZ8uoL
	8aBWiXsobPS5Meoa6YoX4QG6avQlxoqesB6yZkwhlqQd6UGTom8kVwowTlyoQw82Bx4CT+ZjTna
	LX0eFAD4LeJ1bpFh/DG5/pW3EnkrxyWIJ1Lqfz27oV+WkeOhW9jQCHD65OEEMBgVIUuEHAqDQE0
	gY9qngL1fwQ4KJ2fdeywCEOsszlLqCbW9kGHQ5RAFQOJO4hTswnj9C+U3PvFyrU=
X-Received: by 2002:a17:906:f58c:b0:c48:1977:e1bf with SMTP id a640c23a62f3a-c4d34cc020dmr370526966b.24.1794022495830;
        Fri, 06 Nov 2026 19:34:55 -0800 (PST)
Received: from L9JK9NPFH9.lan ([104.28.20.56])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d3562e00dsm121104166b.21.2026.11.06.19.34.52
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 06 Nov 2026 19:34:54 -0800 (PST)
From: Tianyi Gao <tianyi@cloudflare.com>
To: netdev@vger.kernel.org,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Eric Dumazet <edumazet@kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>,
	Simon Horman <horms@kernel.org>,
	David Keogh <dkeogh@amazon.com>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	David Woodhouse <dwmw2@infradead.org>,
	Dragos Tatulea <dtatulea@nvidia.com>,
	Nimrod Oren <noren@nvidia.com>,
	Alasdair McWilliam <alasdair@mcwilliam.dev>,
	Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
	Maciej Fijalkowski <maciej.fijalkowski@intel.com>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Magnus Karlsson <magnus.karlsson@intel.com>,
	David Ahern <dsahern@kernel.org>,
	Ido Schimmel <idosch@nvidia.com>,
	Alexei Starovoitov <ast@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>,
	Donald Hunter <donald.hunter@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Shuah Khan <shuah@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Breno Leitao <leitao@debian.org>,
	=?UTF-8?q?Asbj=C3=B8rn=20Sloth=20T=C3=B8nnesen?= <ast@fiberby.net>,
	Danielle Ratson <danieller@nvidia.com>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	bpf@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	kernel-team@cloudflare.com,
	nh-open-source@amazon.com,
	Tianyi Gao <tianyi@cloudflare.com>
Subject: [PATCH net-next 6/8] selftests: net: add flag to send a frame in xdp_helper
Date: Sat,  7 Nov 2026 03:34:25 +0000
Message-ID: <feab5dcef8743856ff1681f9a6ba62137d845c43.1794020868.git.tianyi@cloudflare.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <cover.1794020868.git.tianyi@cloudflare.com>
References: <cover.1794020868.git.tianyi@cloudflare.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

xdp_helper only binds an XDP socket and waits. Tests in selftests/net
have no way to send a frame through the AF_XDP TX path.

Add a -t option that takes one Ethernet frame in hex. With -t, the
helper also creates a TX ring and sends the frame. It then waits for
the frame on the completion ring and exits. It returns 1 if sendto()
fails or no completion arrives within one second. Without -t, nothing
changes.

The test passes the whole frame in hex, so xdp_helper does not need to
know about IP or UDP. veth has no AF_XDP zerocopy support, so the
socket runs in copy mode. In copy mode the kernel allocates an skb for
the frame in xsk_build_skb(), which uses the extra headroom.

xdp_helper now maps the completion ring at
XDP_UMEM_PGOFF_COMPLETION_RING (0x180000000). This offset does not fit
in a 32-bit off_t, so define _FILE_OFFSET_BITS to 64.

Signed-off-by: Tianyi Gao <tianyi@cloudflare.com>
---
 tools/testing/selftests/net/lib/xdp_helper.c | 113 +++++++++++++++++--
 1 file changed, 106 insertions(+), 7 deletions(-)

diff --git a/tools/testing/selftests/net/lib/xdp_helper.c b/tools/testing/selftests/net/lib/xdp_helper.c
index eb025a9f35b1..5f4dec4408d9 100644
--- a/tools/testing/selftests/net/lib/xdp_helper.c
+++ b/tools/testing/selftests/net/lib/xdp_helper.c
@@ -1,4 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0
+#define _FILE_OFFSET_BITS 64
 #include <errno.h>
 #include <stdio.h>
 #include <stdlib.h>
@@ -19,15 +20,91 @@
 
 static void print_usage(const char *bin)
 {
-	fprintf(stderr, "Usage: %s ifindex queue_id [-z]\n\n"
-		"where:\n\t-z: force zerocopy mode", bin);
+	fprintf(stderr, "Usage: %s ifindex queue_id [-z] [-t frame_hex]\n\n"
+		"where:\n\t-z: force zerocopy mode\n"
+		"\t-t: send one frame, given in hex, and exit\n", bin);
+}
+
+static int parse_frame(unsigned char *buf, const char *hex)
+{
+	size_t len = strlen(hex) / 2;
+	size_t i;
+
+	if (!len || len > 2048 || strlen(hex) % 2 ||
+	    strspn(hex, "0123456789abcdefABCDEF") != strlen(hex))
+		return -1;
+	for (i = 0; i < len; i++)
+		if (sscanf(hex + 2 * i, "%2hhx", &buf[i]) != 1)
+			return -1;
+	return len;
+}
+
+/* Send the frame at UMEM address 0 and wait until its descriptor shows up
+ * on the completion ring. In copy mode this happens when the skb is freed.
+ */
+static int send_frame(int sock_fd, __u32 len)
+{
+	struct xdp_mmap_offsets off;
+	socklen_t optlen = sizeof(off);
+	struct xdp_desc *desc;
+	size_t tx_sz, cq_sz;
+	char *tx, *cq;
+	int ret = 1;
+	int i;
+
+	if (getsockopt(sock_fd, SOL_XDP, XDP_MMAP_OFFSETS, &off, &optlen)) {
+		perror("getsockopt failed");
+		return 1;
+	}
+
+	tx_sz = off.tx.desc + NUM_DESC * sizeof(*desc);
+	tx = mmap(NULL, tx_sz, PROT_READ | PROT_WRITE, MAP_SHARED, sock_fd,
+		  XDP_PGOFF_TX_RING);
+	if (tx == MAP_FAILED) {
+		perror("TX ring mmap failed");
+		return 1;
+	}
+
+	cq_sz = off.cr.desc + NUM_DESC * sizeof(__u64);
+	cq = mmap(NULL, cq_sz, PROT_READ | PROT_WRITE, MAP_SHARED, sock_fd,
+		  XDP_UMEM_PGOFF_COMPLETION_RING);
+	if (cq == MAP_FAILED) {
+		perror("completion ring mmap failed");
+		goto out_tx;
+	}
+
+	desc = (struct xdp_desc *)(tx + off.tx.desc);
+	desc->addr = 0;
+	desc->len = len;
+	__atomic_store_n((__u32 *)(tx + off.tx.producer), 1, __ATOMIC_RELEASE);
+
+	if (sendto(sock_fd, NULL, 0, MSG_DONTWAIT, NULL, 0) < 0) {
+		perror("sendto failed");
+		goto out;
+	}
+
+	for (i = 0; i < 100; i++) {
+		usleep(10000);
+		if (__atomic_load_n((__u32 *)(cq + off.cr.producer),
+				    __ATOMIC_ACQUIRE)) {
+			ret = 0;
+			goto out;
+		}
+	}
+
+	fprintf(stderr, "no TX completion\n");
+out:
+	munmap(cq, cq_sz);
+out_tx:
+	munmap(tx, tx_sz);
+	return ret;
 }
 
 /* this is a simple helper program that creates an XDP socket and does the
  * minimum necessary to get bind() to succeed.
  *
- * this test program is not intended to actually process packets, but could be
- * extended in the future if that is actually needed.
+ * without -t it does not process packets. with -t it sends one frame
+ * through the TX ring and exits once the frame completes.
  *
  * it is used by queues.py to ensure the xsk netlinux attribute is set
  * correctly.
@@ -37,13 +114,16 @@ int main(int argc, char **argv)
 	struct xdp_umem_reg umem_reg = { 0 };
 	struct sockaddr_xdp sxdp = { 0 };
 	int num_desc = NUM_DESC;
+	int frame_len = 0;
 	void *umem_area;
 	int retry = 0;
 	int ifindex;
 	int sock_fd;
 	int queue;
+	int ret;
+	int i;
 
-	if (argc != 3 && argc != 4) {
+	if (argc < 3) {
 		print_usage(argv[0]);
 		return 1;
 	}
@@ -94,9 +174,21 @@ int main(int argc, char **argv)
 	sxdp.sxdp_queue_id = queue;
 	sxdp.sxdp_flags = 0;
 
-	if (argc > 3) {
-		if (!strcmp(argv[3], "-z")) {
+	for (i = 3; i < argc; i++) {
+		if (!strcmp(argv[i], "-z")) {
 			sxdp.sxdp_flags = XDP_ZEROCOPY;
+		} else if (!strcmp(argv[i], "-t") && i + 1 < argc &&
+			   !frame_len) {
+			frame_len = parse_frame(umem_area, argv[++i]);
+			if (frame_len < 0) {
+				print_usage(argv[0]);
+				return 1;
+			}
+			if (setsockopt(sock_fd, SOL_XDP, XDP_TX_RING, &num_desc,
+				       sizeof(num_desc))) {
+				perror("setsockopt XDP_TX_RING failed");
+				return 1;
+			}
 		} else {
 			print_usage(argv[0]);
 			return 1;
@@ -119,6 +211,13 @@ int main(int argc, char **argv)
 		}
 	}
 
+	if (frame_len) {
+		ret = send_frame(sock_fd, frame_len);
+		munmap(umem_area, UMEM_SZ);
+		close(sock_fd);
+		return ret;
+	}
+
 	ksft_ready();
 	ksft_wait();
 
-- 
2.56.0

