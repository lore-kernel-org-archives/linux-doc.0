Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795543140;
	b=UD5YihBZohr5UJos/EPykiTKgShA5GA5kGzc/wbfgX6hwHzRyrdasMxcH6nGzcru55TP
	 Hoqx34dxdAfwWG+3V3kQ3a3P5LRq45x1G7Z+M14Vzuk3IjYPxzvkzCNvBKh04dJYlhsay
	 72EG+e/gE+1ocfw8qCsue0Ar+2oMUgERVVOquR69THBw9BrckkjVtNDIoyLWtNISJehtD
	 pkZ/rTUriC7xy4ZolT6ht2bZjCdqD898lTbAe3wKMrAWSDFFxzjAER1PrP1ynJWA0TtzO
	 ztKFEuw+clBNR7DGvN5bgUrT2KSsIfDfqnTfUsb+6ctBK8zMcRIaGoIiX614Z4duFzg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795543140;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=bohhXAU7tFCgOgXzIKgR9vv6uOs8poL4HtEoBRHXmXw=;
	b=k6ECacmRpPQ0BxYm96HWT0vfE7ueZWUp3Pk3QwPxKRchVq49EC5r/qQZrDFuTLuceXnB
	 4al9ImIsRNu9hpHGWKYBfeefwAh8gF8kY0eVd4zQbFb64QmApEWVynE0kCF9fsRhNXcam
	 IZ9KX4E/zM/fqc9MUj7GPqkHR8VvXiNwVLNZcSRgOXAtcGti7NVEhu38UCeOGyqT5CXbB
	 b3cGMOZiSzMgE/BZYjZG8nBEHBF/JPKphhAwOaLobG+dcc4AiF0qtgjlpg46ZJNvW5Tlv
	 I0+1L9j5J3iUJU/V41+QHD+WUhya3sxjkGHC+FDgkIvFxxjQjdsX2OGVACnrdoBCb3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cloudflare.com;
	spf=pass smtp.mailfrom=cloudflare.com;
	dkim=pass header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=FNCLkt0+;
	arc=none smtp.remote-ip=209.85.208.52
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9904606A323
	for <linux-doc@vger.kernel.org>; Tue, 24 Nov 2026 17:58:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C9904606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=FNCLkt0+
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6baa6f27904so3620198a12.0
        for <linux-doc@vger.kernel.org>; Tue, 24 Nov 2026 09:58:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1795543138; x=1796147938; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bohhXAU7tFCgOgXzIKgR9vv6uOs8poL4HtEoBRHXmXw=;
        b=FNCLkt0+X74F8TZpGwPJ9My784ujCrxM6ZfPnrYHMenzKjY8dmDndskgj849rlsJi1
         LYWBxXpF98Oj9PVPZmkemu0wbHqFguw1N+7GJae/hdyzuykfYYBMUIPDatFBxTzN90Zm
         kroq07brpFUwpVripCnyotNy3p4BcxO4TPwy7b+lwa7LwvB+krZC5HVulnzTZTVcUcdZ
         7dggCwe+5nYhDs3AWVeTTaX574POT0GKb7RCj5gh8k/jem6IYzVia3rVfzPSlc1Xyo9p
         F7W+EXEdY76NzGcCyEe38J55jF9TroasSlvMSB+M6RsisPWiGh6C13Hgs9iFSW8Xq4qJ
         gkxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795543138; x=1796147938;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bohhXAU7tFCgOgXzIKgR9vv6uOs8poL4HtEoBRHXmXw=;
        b=VHrUkd83Xt02L8fstcxZbyRTsH3H+SM0b2eVACoe6HN3oPFkv03Ns/yhDcH6KFnKWa
         7T2l+IbA/WbtlMPCJ8FIUUiIL9fdmI5yCL8orJQ7P+PcT2VUm1uTS5Th8BHRknbKjpvf
         H+c0qy95ubZTQ6BVHkyjoNK2asvfexkE025tWfisH3Nfh7xxlXFtgIyQiXsSJuBfO622
         Lc57iUOElu1x/5ZT0Aq4XzS3ke+9GxPyMOMb3mKyfSxulCiSBc32nCwGvQ5qdbJ2BqNE
         C6WPUGFBEUGElD3D23nSOAoVe5CTaWbW0JcyG9oz/VDt9DyCAFIRojrCe+r9LSIdM5mG
         4AkA==
X-Forwarded-Encrypted: i=1; AL+hErHLboJjI56hUDLs00vhCt0KJdXhK2qNauifxBkxGHGaCJzuiDdd1lAC8ud8WYPdaey7sAGIP31o+GI=@vger.kernel.org
X-Gm-Message-State: APuU4Z9PZcDKOBJlFgUEnHHTdTEVDa8K8ByJIQzEBkLFaG9JxqniFuP2
	/bxjipty52l6sfrkgBNVXJ1nfpdmWv/xotur/psOJJH1GbMF6WTDentyIoVh8CJuYEo=
X-Gm-Gg: AZFdTZchJvbmKqtgpiQ6jgj3/S+8lIaQXI3qRm/zbaDsJeiC73wzJlRaruy54iPv+A/
	8rpqHR6q0nt3HBiCZMP4oWp9VXY4ILVoP8QhmXEuKiVl3n2MrQSd9RgBxDY1YPkyrY+ynhXo0t3
	weS0gRZW5KXGvEkCeRr2HniuYeuUW9LJhqxGihN98btoVjz53exclwRXpbdkXN2SExtoCq8LJeO
	QGE/+OblKXBpqeoc7NOxqVsZHF4I/reQU7dYnC4+vxvtaQB9A4AvnKc6dgcRwTRt+awH6/X+xgI
	QFQYVQpfikz94HP9GJKZj/bXTdW5ASTJg66EGP+DS5+WKPQHNcOcv46ToYc3rUM2PpRks55ozee
	zq/b8zP/ztSO2LWdf89RL4ZP75OeToiHQ9GJlL/3uBIJqc6IQwwI4VQ41SesgYq6vIwLnOin/wr
	DjM9XYpRIEjaqaZLU+c86/MM9Le9GbAkX4jZGcQxYnCCH5OotsBIwzmD8zJbHVLf9jaOCJIw8SL
	DNYd+hF8ctSiTucy1VMOybvP3fRvSiPH23PPJYqaHXEjRxTHLMVCdpRctd/xrSiDMXNPBT6BRlD
	OkGcPb6QQuzHEDpqoq0cfpb3+R16ylz8Ke6ilp21YAu/s74=
X-Received: by 2002:a05:6402:2714:b0:6ba:45a3:c7de with SMTP id 4fb4d7f45d1cf-6ba45a3ca22mr10545737a12.9.1795543138120;
        Tue, 24 Nov 2026 09:58:58 -0800 (PST)
Received: from L9JK9NPFH9 ([2a09:bac6:37ad:1e5a::306:5])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba3711ad52sm7205762a12.35.2026.11.24.09.58.51
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 24 Nov 2026 09:58:57 -0800 (PST)
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
	Stephen Hemminger <stephen@networkplumber.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	"Remy D. Farley" <one-d-wide@protonmail.com>,
	Amery Hung <ameryhung@gmail.com>,
	Andrii Nakryiko <andrii@kernel.org>,
	Andy Roulin <aroulin@nvidia.com>,
	Anil Kaushik <anilkaushikwireless@gmail.com>,
	Demos Ra <demosthenes.ra@gmail.com>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Emil Tsalapatis <emil@etsalapatis.com>,
	Hangbin Liu <hangbin.liu@linux.dev>,
	Ihor Solodrai <ihor.solodrai@linux.dev>,
	Jiayuan Chen <jiayuan.chen@linux.dev>,
	Jiri Olsa <jolsa@kernel.org>,
	Joe Damato <joe@dama.to>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Li RongQing <lirongqing@baidu.com>,
	Louis Scalbert <louis.scalbert@6wind.com>,
	Marc Kleine-Budde <mkl@pengutronix.de>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Martin Karsten <mkarsten@uwaterloo.ca>,
	Matt Bobrowski <mattbobrowski@google.com>,
	Michael Bommarito <michael.bommarito@gmail.com>,
	Nikolay Aleksandrov <razor@blackwall.org>,
	Runyu Xiao <runyu.xiao@seu.edu.cn>,
	Song Liu <song@kernel.org>,
	Thorsten Leemhuis <linux@leemhuis.info>,
	Wang Zhan <wang.zhan@smartx.com>,
	Yonghong Song <yonghong.song@linux.dev>,
	Zhou Qiuyue <n0ps1edzz@gmail.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Jeff Layton <jlayton@kernel.org>,
	Tianyi Gao <tianyi.gao@linux.dev>,
	Tianyi Gao <tianyi@cloudflare.com>
Subject: [PATCH net-next v3 04/11] selftests: net: add flag to send a frame in xdp_helper
Date: Tue, 24 Nov 2026 17:58:17 +0000
Message-ID: <20261124175824.60470-5-tianyi@cloudflare.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261124175824.60470-1-tianyi@cloudflare.com>
References: <20261124175824.60470-1-tianyi@cloudflare.com>
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
helper also creates a TX ring, sends the frame and exits. It returns 1
if sendto() fails. Without -t, nothing changes.

The test passes the whole frame in hex, so xdp_helper does not need to
know about IP or UDP.

-t binds the socket in copy mode. Copy mode sends the frame within
sendto(), so the helper can exit right after it. In zerocopy mode,
sendto() only wakes up the driver, which may send the frame after the
helper has exited and closed the socket. Also, the extra headroom is
added when copy mode allocates an skb for the frame in xsk_build_skb().

send_frame() follows tools/testing/selftests/net/lib/xsk/xsk.c and
tools/testing/selftests/bpf/prog_tests/xdp_metadata.c. XDP_PGOFF_TX_RING
(0x80000000) does not fit in a 32-bit off_t. xsk.c also passes it to
mmap() without _FILE_OFFSET_BITS, so xdp_helper does not define it
either.

Signed-off-by: Tianyi Gao <tianyi@cloudflare.com>
---
v3:
- Bind in copy mode with -t (Sashiko).

v2:
- Exit after sendto() and do not wait for the TX completion, as
  xdp_metadata.c does.
- Drop the _FILE_OFFSET_BITS define, as xsk.c does.
---
 tools/testing/selftests/net/lib/xdp_helper.c | 83 ++++++++++++++++++--
 1 file changed, 75 insertions(+), 8 deletions(-)

diff --git a/tools/testing/selftests/net/lib/xdp_helper.c b/tools/testing/selftests/net/lib/xdp_helper.c
index eb025a9f35b1..e17768816032 100644
--- a/tools/testing/selftests/net/lib/xdp_helper.c
+++ b/tools/testing/selftests/net/lib/xdp_helper.c
@@ -19,15 +19,65 @@
 
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
+	if (!len || len > 2048 || strlen(hex) % 2)
+		return -1;
+	for (i = 0; i < len; i++)
+		if (sscanf(hex + 2 * i, "%2hhx", &buf[i]) != 1)
+			return -1;
+	return len;
+}
+
+static int send_frame(int sock_fd, __u32 len)
+{
+	struct xdp_mmap_offsets off;
+	socklen_t optlen = sizeof(off);
+	struct xdp_desc *desc;
+	size_t tx_sz;
+	int ret = 0;
+	char *tx;
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
+	desc = (struct xdp_desc *)(tx + off.tx.desc);
+	desc->addr = 0;
+	desc->len = len;
+	__atomic_store_n((__u32 *)(tx + off.tx.producer), 1, __ATOMIC_RELEASE);
+
+	if (sendto(sock_fd, NULL, 0, MSG_DONTWAIT, NULL, 0) < 0) {
+		perror("sendto failed");
+		ret = 1;
+	}
+
+	munmap(tx, tx_sz);
+	return ret;
 }
 
 /* this is a simple helper program that creates an XDP socket and does the
  * minimum necessary to get bind() to succeed.
  *
- * this test program is not intended to actually process packets, but could be
- * extended in the future if that is actually needed.
+ * without -t it does not process packets. with -t it sends one frame
+ * through the TX ring and exits.
  *
  * it is used by queues.py to ensure the xsk netlinux attribute is set
  * correctly.
@@ -37,13 +87,15 @@ int main(int argc, char **argv)
 	struct xdp_umem_reg umem_reg = { 0 };
 	struct sockaddr_xdp sxdp = { 0 };
 	int num_desc = NUM_DESC;
+	int frame_len = 0;
 	void *umem_area;
 	int retry = 0;
 	int ifindex;
 	int sock_fd;
 	int queue;
+	int i;
 
-	if (argc != 3 && argc != 4) {
+	if (argc < 3) {
 		print_usage(argv[0]);
 		return 1;
 	}
@@ -94,9 +146,21 @@ int main(int argc, char **argv)
 	sxdp.sxdp_queue_id = queue;
 	sxdp.sxdp_flags = 0;
 
-	if (argc > 3) {
-		if (!strcmp(argv[3], "-z")) {
-			sxdp.sxdp_flags = XDP_ZEROCOPY;
+	for (i = 3; i < argc; i++) {
+		if (!strcmp(argv[i], "-z")) {
+			sxdp.sxdp_flags |= XDP_ZEROCOPY;
+		} else if (!strcmp(argv[i], "-t") && i + 1 < argc) {
+			sxdp.sxdp_flags |= XDP_COPY;
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
@@ -119,6 +183,9 @@ int main(int argc, char **argv)
 		}
 	}
 
+	if (frame_len)
+		return send_frame(sock_fd, frame_len);
+
 	ksft_ready();
 	ksft_wait();
 
-- 
2.56.0

