Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795052335;
	b=Py9mTMbvJxHT5GuMByIM4udRqV/Et1r/2nWuWc6adFnIi042FtZCIYTYFyhf2nBEq5CU
	 2po8LlXGTxmkgu4vfFUrr0/gxBSqGgDKYZKA/h8C0+9lte3argY6yvc7IDfGquNeRePP5
	 FceC8GqCdlNEqIf9OSITxfjdC3Xzci9xB3/r0O7mE68E1zCXuSOqREfXR9bQzn+Bg69X/
	 +V87f6tW/Z29dicdjh4EAaT2a5pb5bTRzdbOi1nYadjCGOvW8IKN0oRVn47BftTqKMImL
	 CBXW7Js4/WpZOkGL5cEkKK3k7qzizJR0V264EDKQmFXk9D1ivT5gY+q2rPqsteNDuaQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795052335;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=70IyT03vVEKmbE3A8jTiSAC1UuYRra24djwihgvA+zw=;
	b=2ujiJ0AhQTepBOBtXGkz4rBp3BDYlElhtf72iKXcMJ5wflLuZm1+e2ss4Kx+ml5ps5Am
	 dL1l2ScXIy1dahHC2ykOLkBrTtRlZgKCBpV6hi4nCWzyJ6VuMXpfiKgcn7x+vGqo3Axlt
	 msYPfKV40ZAupSATs/4xU39dGF8rkGWDamwUIbPIDUc4glowSaB4Ywk2QKbWWdNTD+YAn
	 SGNMAPzvf4vZAumNTcTJBd8uAdzjM58C+/KQgTNd3AoehevnCrWQbXm1xeLmVVjhNhT4P
	 bIIHGW6j7uFUBL7GHjAyrJQa24MzFlozaFdDEJF8bfgfB/Ohn8ngis4g5SUPYyo8rFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cloudflare.com;
	spf=pass smtp.mailfrom=cloudflare.com;
	dkim=pass header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=OccZeeSi;
	arc=none smtp.remote-ip=209.85.218.52
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1219160A2611
	for <linux-doc@vger.kernel.org>; Thu, 19 Nov 2026 01:38:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1219160A2611
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=OccZeeSi
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c511cdd5a82so151147866b.3
        for <linux-doc@vger.kernel.org>; Wed, 18 Nov 2026 17:38:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1795052333; x=1795657133; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=70IyT03vVEKmbE3A8jTiSAC1UuYRra24djwihgvA+zw=;
        b=OccZeeSifJv9/qm6PHsRQLFJm46St0Z8WU09Jae/SiLHBRkw8AC7ibXeVgBSvSTZK/
         V9KV5UMH8NxCqQPJjxlJZnUuFPFpzGxp4KWy7vgP1hZz0FP7w5HyzKzrew9qLZErkSUt
         o2cEmPzHDXLG92C3Ar7iX3blApGSN4N4K10IgotL0gOrB/BdLofTg1i3+LMrgRNM5YPA
         7lVrniS1Pdmoho8ENmXNw7GAS2NDbs2C+p08kWLhIn3ioV+NOhY+F9GeRv9TYB50369K
         f4F9Ast68X1b+58hXvB6ZCe/be/lBTKDb3+ksRqOcCAcJhRCXnyGv8tRE96L3nt8+jIo
         PJJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795052333; x=1795657133;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=70IyT03vVEKmbE3A8jTiSAC1UuYRra24djwihgvA+zw=;
        b=crGHPZjxU9xUyy5eMDVhUbid9VxaHGTOOChx8wQstD24c9LMUbiMwraOX4JadRvQ0i
         JeUIcikMEcBthRa5h217PiFjk0pPGt+YqYV47BQx+q0XPJHjz0HdMpwFF/Jump8DbvBz
         a9gGiOl2oWD6dTCc7QeI+bRGRtXrlkMturzQIIqlGAGoQTkE0KBbWUBA2WJEW/JjiNy8
         l0qP5J93TRg5xP5xxCayxuczW46LMpYjsB5CdTKPeZD4ySBGe0UZrk302mIrQMyezaYf
         H4XL2LD11wkt97RxNBzUrEw08TkUc4hiTfKTpXVZQ/Ncdvm4WyoK5Z37ODWq5D9YDHBf
         7p2w==
X-Forwarded-Encrypted: i=1; AL+hErFpOEh3JKUqBF5ulVW5CJzDu+ME8Z/xnH3XZGE80ddV87KPTXin7cBSO7AgggFwFAntp+P8a53hKbY=@vger.kernel.org
X-Gm-Message-State: APuU4Z9i/EoWlpH9pgHXR12Y0y5vpJAy59dkeXcaz2AR/1KQNYXmsK/K
	1troF6Lp7mHs/nJ1LoBkq2Js5smQ8Bs2qt6KlQB1yy2oEOgN1RGX4QmBEuRp/LqtyV4=
X-Gm-Gg: AYBFou3cZTePHPNwourYxLH72Q+Nx8w7DtETmLhW1kHj3jP8WUSs+a15c/FUzL1dVvw
	5HTzAcKJZI4akgAifBROMAegCH76N5u+6KWP7CH8woRjoctHoK6iGyllA4W5xRmPGtaY9RcswKV
	+AkOFsXONPKE3l7jC9x3Jy23w+LUhu0627TeYAKB9gctJ/9rUUWy8fAsrgPaAroeV7qPVStE24x
	Q0aK79/kjV3/cmHUwNRez7m8u+/06Hei0sDocaYzSDKPhJPrVUf08A9b7mN9qLH09Hjm8hroIA8
	I/q422ZZdTHztzdrJf4y8QP6IoosDBBC9DtfSwRXqu7dzbI6kBNC7DHN++/QUPu+pgbaKiV57/z
	JoGOrpknz13wJaun9E1GjfHafjGwCJH+5NGHV4Be0uvI6wqSKhOqUKayXZyCw3yHUAWuE5Exw8d
	oJhC0WrEdH9751/PQJiLgaog8haRecJrhqxRm/G8L+kHl0ET7Z8bqzuU9cYjNHEwFYLWplILpfg
	HeaoNJ4PGnEBnTVdv6jlhZLmIYaUWLejkGFywtNtHH6f0vPnnVYiX+2CMAYY5ELiKhy/jMIJBXR
	ilH2oQSr5Li4VCOA6vUWFAF1uLB7ukdtL60frxdfsLWhTo/3zvYiwMgdZw==
X-Received: by 2002:a17:907:1c85:b0:c16:4e5:944a with SMTP id a640c23a62f3a-c510e2de6fcmr393876766b.21.1795052333364;
        Wed, 18 Nov 2026 17:38:53 -0800 (PST)
Received: from L9JK9NPFH9 ([104.28.20.56])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c51233c4080sm59785966b.16.2026.11.18.17.38.49
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 18 Nov 2026 17:38:51 -0800 (PST)
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
	Tianyi Gao <tianyi.gao@linux.dev>,
	Tianyi Gao <tianyi@cloudflare.com>
Subject: [PATCH net-next v2 05/11] selftests: net: add tx_extra_headroom test
Date: Thu, 19 Nov 2026 01:38:24 +0000
Message-ID: <20261119013830.36935-6-tianyi@cloudflare.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261119013830.36935-1-tianyi@cloudflare.com>
References: <20261119013830.36935-1-tianyi@cloudflare.com>
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

Generic XDP copies an skb with less than XDP_PACKET_HEADROOM (256 bytes)
of headroom. When XDP is attached to one end of a veth pair, the kernel
now sets tx_extra_headroom of the other end. A locally generated packet
then has enough headroom, and generic XDP no longer copies it.

Test this for six senders. Each one allocates the skb in a different
place: UDP over IPv4 and IPv6, raw sockets with IPPROTO_RAW over IPv4
and IPv6, AF_PACKET and AF_XDP in copy mode. xdp_helper -t sends the
AF_XDP frame. The peer runs xdp_dummy in generic mode.

tx_extra_headroom.bpf.c is a TC program. For the test packet it records
needed_headroom and tx_extra_headroom of skb->dev, and skb->pp_recycle.
For a frags program, generic XDP copies a packet into a page_pool page.
At TC ingress of the peer, pp_recycle then shows whether the packet was
copied. A packet socket for ETH_P_ALL on the sender holds a clone of the
skb, which forces a copy. This checks that pp_recycle detects the copy.

netkit implements ndo_get_peer_dev too, so the same holds for a netkit
pair. Test it once, with UDP over IPv4 and netkit in L2 mode.

test_detach attaches native or generic XDP to veth1. needed_headroom of
veth is 0, so tx_extra_headroom of veth0 must be XDP_PACKET_HEADROOM.
After detach it must be 0.

test_bond adds veth1 to a bond and attaches native XDP to the bond,
which propagates it to veth1. tx_extra_headroom of veth0 must again be
XDP_PACKET_HEADROOM, and 0 after detach.

test_bridge_vxlan adds veth1 to a bridge with a vxlan port. This raises
needed_headroom of both ends. Then the test attaches XDP.
needed_headroom plus tx_extra_headroom must be XDP_PACKET_HEADROOM.

The test does not check for netkit, bonding, bridge or vxlan, because
the selftests/net config enables them.

Signed-off-by: Tianyi Gao <tianyi@cloudflare.com>
---
v2:
- v1 4/8 tested IFLA_TX_EXTRA_HEADROOM and is dropped with it.
- Built from v1 7/8. Attach XDP to the peer instead of setting
  IFLA_TX_EXTRA_HEADROOM.
- Detect the copy with skb->pp_recycle instead of comparing the
  headroom before and after the attach.
- Add the cloned, netkit, detach, bond and bridge cases.
---
 tools/testing/selftests/net/Makefile          |   1 +
 tools/testing/selftests/net/lib/xdp_helper.c  |   2 +-
 .../selftests/net/tx_extra_headroom.bpf.c     |  81 +++++
 .../selftests/net/tx_extra_headroom.py        | 285 ++++++++++++++++++
 4 files changed, 368 insertions(+), 1 deletion(-)
 create mode 100644 tools/testing/selftests/net/tx_extra_headroom.bpf.c
 create mode 100755 tools/testing/selftests/net/tx_extra_headroom.py

diff --git a/tools/testing/selftests/net/Makefile b/tools/testing/selftests/net/Makefile
index c80dabbcc907..76473dc187a4 100644
--- a/tools/testing/selftests/net/Makefile
+++ b/tools/testing/selftests/net/Makefile
@@ -123,6 +123,7 @@ TEST_PROGS := \
 	test_vxlan_vnifiltering.sh \
 	tfo_passive.sh \
 	traceroute.sh \
+	tx_extra_headroom.py \
 	txtimestamp.sh \
 	udpgro.sh \
 	udpgro_bench.sh \
diff --git a/tools/testing/selftests/net/lib/xdp_helper.c b/tools/testing/selftests/net/lib/xdp_helper.c
index 1111631efd73..5deb97922e6c 100644
--- a/tools/testing/selftests/net/lib/xdp_helper.c
+++ b/tools/testing/selftests/net/lib/xdp_helper.c
@@ -80,7 +80,7 @@ static int send_frame(int sock_fd, __u32 len)
  * through the TX ring and exits.
  *
  * it is used by queues.py to ensure the xsk netlinux attribute is set
- * correctly.
+ * correctly, and by tx_extra_headroom.py to send a frame.
  */
 int main(int argc, char **argv)
 {
diff --git a/tools/testing/selftests/net/tx_extra_headroom.bpf.c b/tools/testing/selftests/net/tx_extra_headroom.bpf.c
new file mode 100644
index 000000000000..d80f4567873a
--- /dev/null
+++ b/tools/testing/selftests/net/tx_extra_headroom.bpf.c
@@ -0,0 +1,81 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Record the headroom fields of a test packet. */
+#include <stdbool.h>
+#include <linux/bpf.h>
+#include <linux/if_ether.h>
+#include <linux/in.h>
+#include <linux/ip.h>
+#include <linux/ipv6.h>
+#include <linux/udp.h>
+#include <bpf/bpf_core_read.h>
+#include <bpf/bpf_endian.h>
+#include <bpf/bpf_helpers.h>
+
+#define UDP_TEST_PORT 9999
+
+struct net_device {
+	unsigned short needed_headroom;
+	unsigned short tx_extra_headroom;
+} __attribute__((preserve_access_index));
+
+struct sk_buff {
+	struct net_device *dev;
+	__u8 pp_recycle:1;
+} __attribute__((preserve_access_index));
+
+void *bpf_cast_to_kern_ctx(void *obj) __ksym;
+
+__u32 count;
+__u32 needed_headroom;
+__u32 tx_extra_headroom;
+bool pp_recycle;
+
+static bool is_test_packet(struct __sk_buff *skb)
+{
+	struct ipv6hdr ip6h;
+	struct udphdr udph;
+	struct iphdr iph;
+	__u32 off;
+
+	if (skb->protocol == bpf_htons(ETH_P_IP)) {
+		if (bpf_skb_load_bytes(skb, ETH_HLEN, &iph, sizeof(iph)))
+			return false;
+		if (iph.protocol != IPPROTO_UDP)
+			return false;
+		off = ETH_HLEN + sizeof(iph);
+	} else if (skb->protocol == bpf_htons(ETH_P_IPV6)) {
+		if (bpf_skb_load_bytes(skb, ETH_HLEN, &ip6h, sizeof(ip6h)))
+			return false;
+		if (ip6h.nexthdr != IPPROTO_UDP)
+			return false;
+		off = ETH_HLEN + sizeof(ip6h);
+	} else {
+		return false;
+	}
+
+	if (bpf_skb_load_bytes(skb, off, &udph, sizeof(udph)))
+		return false;
+
+	return udph.dest == bpf_htons(UDP_TEST_PORT);
+}
+
+/* Attached at tcx ingress and at tcx egress. */
+SEC("tc")
+int record(struct __sk_buff *skb)
+{
+	struct sk_buff *kskb;
+
+	if (!is_test_packet(skb))
+		return TCX_NEXT;
+
+	kskb = bpf_cast_to_kern_ctx(skb);
+	needed_headroom = kskb->dev->needed_headroom;
+	tx_extra_headroom = kskb->dev->tx_extra_headroom;
+	/* For a frags program, generic XDP copies into a page_pool page. */
+	pp_recycle = BPF_CORE_READ_BITFIELD(kskb, pp_recycle);
+	count++;
+
+	return TCX_NEXT;
+}
+
+char _license[] SEC("license") = "GPL";
diff --git a/tools/testing/selftests/net/tx_extra_headroom.py b/tools/testing/selftests/net/tx_extra_headroom.py
new file mode 100755
index 000000000000..4058d0e64fc5
--- /dev/null
+++ b/tools/testing/selftests/net/tx_extra_headroom.py
@@ -0,0 +1,285 @@
+#!/usr/bin/env python3
+# SPDX-License-Identifier: GPL-2.0
+
+"""Tests for tx_extra_headroom."""
+
+import socket
+import struct
+from pathlib import Path
+
+from lib.py import ksft_run, ksft_exit, ksft_eq, ksft_gt
+from lib.py import KsftSkipEx, KsftFailEx
+from lib.py import ksft_busy_wait, ksft_variants, KsftNamedVariant
+from lib.py import cmd, defer, ip, bpftool, bpf_prog_map_ids
+from lib.py import NetNS, NetNSEnter
+
+BPF_OBJ = Path(__file__).parent / "tx_extra_headroom.bpf.o"
+XDP_OBJ = Path(__file__).parent / "lib/xdp_dummy.bpf.o"
+XDP_HELPER = Path(__file__).parent / "lib/xdp_helper"
+PIN_DIR = Path("/sys/fs/bpf/tx_extra_headroom")
+PORT = 9999  # UDP_TEST_PORT in tx_extra_headroom.bpf.c
+ETH_P_ALL = 0x0003
+XDP_PACKET_HEADROOM = 256
+
+
+def _setup_addrs(peer_ns, dev, peer):
+    """Add addresses to dev and to peer in peer_ns, and bring both up."""
+    ip(f"addr add 192.0.2.1/24 dev {dev}")
+    ip(f"addr add 2001:db8::1/64 dev {dev} nodad")
+    ip(f"link set {dev} up")
+    ip(f"addr add 192.0.2.2/24 dev {peer}", ns=peer_ns)
+    ip(f"addr add 2001:db8::2/64 dev {peer} nodad", ns=peer_ns)
+    ip(f"link set {peer} up", ns=peer_ns)
+    peer_mac = ip(f"link show dev {peer}", json=True, ns=peer_ns)[0]["address"]
+    for addr in ("192.0.2.2", "2001:db8::2"):
+        ip(f"neigh replace {addr} lladdr {peer_mac} dev {dev} nud permanent")
+
+
+def _setup_veth(peer_ns):
+    """Create veth0 in the current netns and its peer veth1 in peer_ns."""
+    ip("link add veth0 type veth peer name veth1")
+    ip(f"link set veth1 netns {peer_ns}")
+    _setup_addrs(peer_ns, "veth0", "veth1")
+
+
+def _attach_xdp(peer_ns, mode="xdpgeneric", dev="veth1"):
+    """Attach xdp_dummy to dev in peer_ns."""
+    # For a frags program, generic XDP copies into a page_pool page.
+    ip(f"link set dev {dev} {mode} obj {XDP_OBJ} sec xdp.frags", ns=peer_ns)
+
+
+def _load_progs():
+    """Load the programs of BPF_OBJ, return the id of their .bss map."""
+    cmd(f"rm -rf {PIN_DIR}", shell=True, fail=False)
+    bpftool(f"prog loadall {BPF_OBJ} {PIN_DIR}")
+    defer(cmd, f"rm -rf {PIN_DIR}", shell=True, fail=False)
+    prog_id = bpftool(f"prog show pinned {PIN_DIR}/record", json=True)["id"]
+    return next(map_id for name, map_id in bpf_prog_map_ids(prog_id).items()
+                if name.endswith(".bss"))
+
+
+def _attach_tcx(dev, direction, prog):
+    """Attach program prog to tcx ingress or egress of dev."""
+    bpftool(f"net attach tcx_{direction} pinned {PIN_DIR}/{prog} dev {dev}")
+
+
+def _read_bss(map_id):
+    """Return the global variables of the programs as a dict."""
+    dump = bpftool(f"map dump id {map_id}", json=True)[0]
+    return {name: val for var in dump["formatted"]["value"][".bss"]
+            for name, val in var.items()}
+
+
+def _send_udp4():
+    """Send one UDP packet from veth0 to veth1."""
+    with socket.socket(socket.AF_INET, socket.SOCK_DGRAM) as s:
+        s.sendto(b"x", ("192.0.2.2", PORT))
+
+
+def _send_udp6():
+    """Send one UDP packet from veth0 to veth1 over IPv6."""
+    with socket.socket(socket.AF_INET6, socket.SOCK_DGRAM) as s:
+        s.sendto(b"x", ("2001:db8::2", PORT))
+
+
+def _csum(data):
+    """Return the Internet checksum of data."""
+    data += b"\0" * (len(data) % 2)
+    return 0xffff - sum(struct.unpack(f"!{len(data) // 2}H", data)) % 0xffff
+
+
+def _ipv4_udp():
+    """Return an IPv4 UDP packet from veth0 to veth1."""
+    udp = struct.pack("!HHHH", PORT, PORT, 9, 0) + b"x"
+    iph = struct.pack("!BBHHHBBH4s4s", 0x45, 0, 20 + len(udp), 0, 0, 64,
+                      socket.IPPROTO_UDP, 0, socket.inet_aton("192.0.2.1"),
+                      socket.inet_aton("192.0.2.2"))
+    return iph[:10] + struct.pack("!H", _csum(iph)) + iph[12:] + udp
+
+
+def _ipv6_udp():
+    """Return an IPv6 UDP packet from veth0 to veth1."""
+    src = socket.inet_pton(socket.AF_INET6, "2001:db8::1")
+    dst = socket.inet_pton(socket.AF_INET6, "2001:db8::2")
+    udp = struct.pack("!HHHH", PORT, PORT, 9, 0) + b"x"
+    pseudo = src + dst + struct.pack("!IxxxB", len(udp), socket.IPPROTO_UDP)
+    udp = udp[:6] + struct.pack("!H", _csum(pseudo + udp)) + udp[8:]
+    return (struct.pack("!IHBB", 6 << 28, len(udp), socket.IPPROTO_UDP, 64) +
+            src + dst + udp)
+
+
+def _eth_frame():
+    """Return an Ethernet frame with _ipv4_udp() from veth0 to veth1."""
+    src = ip("link show dev veth0", json=True)[0]["address"]
+    dst = ip("neigh show 192.0.2.2 dev veth0", json=True)[0]["lladdr"]
+    return bytes.fromhex((dst + src).replace(":", "") + "0800") + _ipv4_udp()
+
+
+def _send_raw4():
+    """Send one UDP packet from veth0 to veth1 with an IPv4 raw socket."""
+    with socket.socket(socket.AF_INET, socket.SOCK_RAW,
+                       socket.IPPROTO_RAW) as s:
+        s.sendto(_ipv4_udp(), ("192.0.2.2", 0))
+
+
+def _send_raw6():
+    """Send one UDP packet from veth0 to veth1 with an IPv6 raw socket."""
+    with socket.socket(socket.AF_INET6, socket.SOCK_RAW,
+                       socket.IPPROTO_RAW) as s:
+        s.sendto(_ipv6_udp(), ("2001:db8::2", 0))
+
+
+def _send_packet():
+    """Send one UDP packet from veth0 to veth1 with an AF_PACKET socket."""
+    # With protocol 0 the socket receives nothing, so the skb is not cloned.
+    with socket.socket(socket.AF_PACKET, socket.SOCK_RAW) as s:
+        s.bind(("veth0", 0))
+        s.send(_eth_frame())
+
+
+def _send_xsk():
+    """Send one UDP packet from veth0 to veth1 with an AF_XDP socket."""
+    xdp = cmd(f"{XDP_HELPER} - -", fail=False)
+    if xdp.ret == 255:
+        raise KsftSkipEx("AF_XDP unsupported")
+    if xdp.ret > 0:
+        raise KsftFailEx("unable to create AF_XDP socket")
+    ifindex = socket.if_nametoindex("veth0")
+    cmd(f"{XDP_HELPER} {ifindex} 0 -t {_eth_frame().hex()}")
+
+
+@ksft_variants([
+    KsftNamedVariant("udp4", _send_udp4),
+    KsftNamedVariant("udp6", _send_udp6),
+    KsftNamedVariant("raw4", _send_raw4),
+    KsftNamedVariant("raw6", _send_raw6),
+    KsftNamedVariant("packet", _send_packet),
+    KsftNamedVariant("xsk", _send_xsk),
+])
+def test_peer_xdp(send) -> None:
+    """Check that generic XDP on the veth peer does not copy the skb.
+
+    Each sender allocates the skb in a different function.
+    """
+    with NetNS() as send_ns, NetNS() as peer_ns, NetNSEnter(str(send_ns)):
+        _setup_veth(peer_ns)
+        map_id = _load_progs()
+        _attach_xdp(peer_ns)
+        with NetNSEnter(str(peer_ns)):
+            _attach_tcx("veth1", "ingress", "record")
+        send()
+        ksft_busy_wait(lambda: _read_bss(map_id)["count"] == 1)
+        bss = _read_bss(map_id)
+
+    ksft_eq(bss["pp_recycle"], False, "generic XDP copied the skb")
+
+
+def test_peer_xdp_cloned() -> None:
+    """Check that pp_recycle is set when generic XDP copies a cloned skb."""
+    with NetNS() as send_ns, NetNS() as peer_ns, NetNSEnter(str(send_ns)):
+        _setup_veth(peer_ns)
+        map_id = _load_progs()
+        _attach_xdp(peer_ns)
+        with NetNSEnter(str(peer_ns)):
+            _attach_tcx("veth1", "ingress", "record")
+        # A packet socket for ETH_P_ALL holds a clone of the skb, so generic
+        # XDP copies it.
+        with socket.socket(socket.AF_PACKET, socket.SOCK_RAW,
+                           socket.htons(ETH_P_ALL)) as s:
+            s.bind(("veth0", 0))
+            _send_udp4()
+            ksft_busy_wait(lambda: _read_bss(map_id)["count"] == 1)
+        bss = _read_bss(map_id)
+
+    ksft_eq(bss["pp_recycle"], True, "generic XDP did not copy the skb")
+
+
+def test_peer_xdp_netkit() -> None:
+    """Check that generic XDP on the netkit peer does not copy the skb."""
+    with NetNS() as send_ns, NetNS() as peer_ns, NetNSEnter(str(send_ns)):
+        # L2 mode has MAC addresses and ARP, as on veth.
+        ip(f"link add nk0 type netkit mode l2 peer name nk1 netns {peer_ns}")
+        _setup_addrs(peer_ns, "nk0", "nk1")
+        map_id = _load_progs()
+        _attach_xdp(peer_ns, dev="nk1")
+        with NetNSEnter(str(peer_ns)):
+            _attach_tcx("nk1", "ingress", "record")
+        _send_udp4()
+        ksft_busy_wait(lambda: _read_bss(map_id)["count"] == 1)
+        bss = _read_bss(map_id)
+
+    ksft_eq(bss["pp_recycle"], False, "generic XDP copied the skb")
+
+
+@ksft_variants([
+    KsftNamedVariant("generic", "xdpgeneric"),
+    KsftNamedVariant("native", "xdpdrv"),
+])
+def test_detach(mode) -> None:
+    """Check that XDP on the veth peer sets tx_extra_headroom until detach."""
+    with NetNS() as send_ns, NetNS() as peer_ns, NetNSEnter(str(send_ns)):
+        _setup_veth(peer_ns)
+        map_id = _load_progs()
+        _attach_tcx("veth0", "egress", "record")
+        _attach_xdp(peer_ns, mode)
+        _send_udp4()
+        ksft_eq(_read_bss(map_id)["tx_extra_headroom"], XDP_PACKET_HEADROOM)
+        ip(f"link set dev veth1 {mode} off", ns=peer_ns)
+        _send_udp4()
+        ksft_eq(_read_bss(map_id)["tx_extra_headroom"], 0)
+
+
+def test_bond() -> None:
+    """Check that XDP that a bond propagates to the veth peer counts."""
+    with NetNS() as send_ns, NetNS() as peer_ns, NetNSEnter(str(send_ns)):
+        _setup_veth(peer_ns)
+        map_id = _load_progs()
+        _attach_tcx("veth0", "egress", "record")
+        ip("link add bond0 type bond mode balance-rr", ns=peer_ns)
+        # A bond only enslaves a device that is down.
+        ip("link set dev veth1 down", ns=peer_ns)
+        ip("link set dev veth1 master bond0", ns=peer_ns)
+        _attach_xdp(peer_ns, "xdpdrv", "bond0")
+        _send_udp4()
+        ksft_eq(_read_bss(map_id)["tx_extra_headroom"], XDP_PACKET_HEADROOM)
+        ip("link set dev bond0 xdpdrv off", ns=peer_ns)
+        _send_udp4()
+        ksft_eq(_read_bss(map_id)["tx_extra_headroom"], 0)
+
+
+def test_bridge_vxlan() -> None:
+    """Check that needed_headroom counts toward the headroom for XDP."""
+    with NetNS() as send_ns, NetNS() as peer_ns, NetNSEnter(str(send_ns)):
+        _setup_veth(peer_ns)
+        map_id = _load_progs()
+        _attach_tcx("veth0", "egress", "record")
+        ip("link add br0 type bridge", ns=peer_ns)
+        ip("link set dev veth1 master br0", ns=peer_ns)
+        # The bridge raises needed_headroom of veth1, and of veth0 with it.
+        ip("link add vxlan0 type vxlan id 1 dstport 4789", ns=peer_ns)
+        ip("link set dev vxlan0 master br0", ns=peer_ns)
+        # tx_extra_headroom is not recalculated when needed_headroom
+        # changes, so attach XDP after the vxlan port.
+        _attach_xdp(peer_ns)
+        _send_udp4()
+        bss = _read_bss(map_id)
+
+    ksft_gt(bss["needed_headroom"], 0,
+            "vxlan port did not raise needed_headroom")
+    ksft_eq(bss["needed_headroom"] + bss["tx_extra_headroom"],
+            XDP_PACKET_HEADROOM)
+
+
+def main() -> None:
+    """Run all test cases."""
+    ksft_run([test_peer_xdp,
+              test_peer_xdp_cloned,
+              test_peer_xdp_netkit,
+              test_detach,
+              test_bond,
+              test_bridge_vxlan])
+    ksft_exit()
+
+
+if __name__ == "__main__":
+    main()
-- 
2.56.0

