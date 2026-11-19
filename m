Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795052353;
	b=ZLf9Ho8rHjh5DDyCojTmD1kF1IVEEdqDGl0gzflR8KinwTT8Mg1KndT9FT1N8aNxc/wq
	 WJykNPusfWGqLChgAtwBlmBwicyJlFzOzTejrw7Uf2w0MUgI9gZtbq1hNPYIYlOZuKMjw
	 N4huYSOcN5t9TvSy4t+tbGlRcb7R0LAGie3met3qG3SLHWtyEp7RrW35bFWMKmJmN+HOy
	 klm4Ll2W4Xv/EP2dl+4I/hh9vemPBiFHlQIGZctrY4Cv1EDQPXGIA/Ma8Y3YMxi3qlJCN
	 Hozcu5YPnMUdBgXHcLlO4q4sgGla7Jh0T7YHHjBGCwV7Ri6tUgXhXDvZ4DOdTHvjP2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795052353;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=iBPC28pXNUc65LCOCKjuf1PqILruKyYBZIqYbx1Wulw=;
	b=HGxtzDwrNqOU+V7UkGrM6S3HOrm1LVQ18GopSpw4NhsJlIjC/s54ijL1oIpoZDiPmAP0
	 1/uYk4k0XGSlx0aUTQhAm5N/qY+ZfcfiWjVBjps8B8gwsxaozg06o+UuUCCKDkyUQnZCR
	 PBLt6cZx7IdMGaaBGubbUXD0Gn47ZFj3WXH2hN/2LWOqLM4ho9m+Sv4XmjvKO7e/+RBU5
	 mw3/RKY9Rx8a+7qd+rnlqYXX2j7JgBGzttbqk4FuIgua1B33MRdErSqUkX5rfkds4yiPW
	 T6lZVQPuzV2WXmW6OoAFgQO7zVIRovNTgw+Lb9lESIItaIllTfaqjbKl/VQ3EvkEH6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cloudflare.com;
	spf=pass smtp.mailfrom=cloudflare.com;
	dkim=pass header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=MqbRm099;
	arc=none smtp.remote-ip=209.85.218.43
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3450060A2638
	for <linux-doc@vger.kernel.org>; Thu, 19 Nov 2026 01:39:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3450060A2638
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=MqbRm099
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c4322d310e7so268211466b.0
        for <linux-doc@vger.kernel.org>; Wed, 18 Nov 2026 17:39:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1795052351; x=1795657151; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iBPC28pXNUc65LCOCKjuf1PqILruKyYBZIqYbx1Wulw=;
        b=MqbRm099WN/Cr7Dh4cVNZTyBKEIODRpZuiVj4miyHNlNXt7w87E9NnSDF/KI+KmnO4
         SWUxi+nalK1M9EEvGQy4XUiRNrP1TTxeWMavR2HtOoUo7geQHGgKEr3zB7f25OOWouRX
         AgNhTLOgRc7ygt8yLIoJpwucARceJcn1hjwoWDK2winZ30ockidP6knzrnYOTu/ZyZRP
         5u4KMTUh/YQTFu/WomnjY2nU4pxE964HIw3foRzZZQwdDww55a2q8gINydUxJcBFCvCq
         dRTnQ0zYQv2pkEqeTDqJLbCHOswflRuae8/r8NRRAJ15Pr2ak3iyrhxzQ0vv8KlcN9Ym
         ozoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795052351; x=1795657151;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iBPC28pXNUc65LCOCKjuf1PqILruKyYBZIqYbx1Wulw=;
        b=wjHu7LeC0dQgc0ufgBZY0ZZzU8aKI6cB0DUYCEM2lhQClRpvm7pMEmhjtV8e6k8bf6
         olzw7L2n/ahGipZrTyZFDFtPG3w+yTpNM7cUsx4ce8peD1AL9TKM/105fJ6+EvXinGuF
         8CHp9m7BUM90dPyblEmbhIkBKKBW4dQcVzt+RHBQCMyeFvfxwLKTk4Dq5wRs2fM1yU56
         dcnlcj8FHoRK4SPKjFVD9+q9cAfWRC4gEPe6TyTu+3LMvxW0fPM2Rfqra5rZAR3d7nsm
         vFYq4UE7kOixJoPMD1D66cfy3s+71dI2wnt59iJA9r7v3LDyclnT/tJoJqt/zKdSs5FI
         mhSw==
X-Forwarded-Encrypted: i=1; AL+hErFeQA5fd73O5qjnyLyYhYu+t9ZJGDGVaIbn1eEeoOO+OOXTgy91y2vKvUoa9sgryXybwLJc/eRNd8E=@vger.kernel.org
X-Gm-Message-State: APuU4Z+bW3lHzfPOJqkwE6UWjIj93M3XMOLjeWgj7w10BASAs3MKd2Et
	/+PFq/8C9MZF+QNTNPOYbnIp3ohIZ0UDnQSwf9LK1PalnF66GmmjFByEzw6b7OXs9hc=
X-Gm-Gg: AYBFou23uocgsKqOcWdy+O32H6Yoa2EmI/bGtX/YxeLZqSFuMF4G6UgX9nSYqvXFD/w
	DCUTjQgSNukHOsdHJkp4e83kGeYbN5gxTPtYwQdUjNuI8uI4nh4goAvf9vZ0/QJSTwuQHPPZfdg
	qFWvQgzPacemd8ZtDJNbauJ8DXvbe/DP/hHciLC0IIotWajyViae9llz82qAJiHIZVY4rqIDeky
	yGd/uKXp8km2uNIUIOHH9yoD+d+A1uqeEoiqx8Qh6kw9aJHG5cv4zwko2OH4N1+Yd/HlE7z1KX0
	NnHUw7YD8E2JiIlBVjV6g+QK2wjKMmOcsP+0AQDegSg6PpdKSV/qigogUtdesJdGP6+NuZ6w4en
	3ZFbnkRuWXaijO/DHm0jbfcE3GgBcemnpCw9OL8VD0jj+nbp5WQH1VWBY/0MV/aK4//sAYFN+Jv
	VMQQuHG2Zzt3SHQEAYkAV7q9kkuYP4tfacCs7x4C12TvM8YGP44nlqtcWlKxQ9CDTx3iHZSpc4X
	8pVXDX8LKSC4akts2rHyAoQy8wdPNaGRI3AK6AL+iLTVetNXJ9RoGW7QAsgJBVm7z0gufEoT9mj
	x6b3IURAQr0ObDJ1RQMALw+SS7RrU1Wio89uHqGOliBCeUMHCHxRlcdNfA==
X-Received: by 2002:a17:907:9304:b0:c46:7462:6332 with SMTP id a640c23a62f3a-c510e4f9809mr385723066b.37.1795052350681;
        Wed, 18 Nov 2026 17:39:10 -0800 (PST)
Received: from L9JK9NPFH9 ([104.28.20.56])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c51233c4080sm59785966b.16.2026.11.18.17.39.08
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 18 Nov 2026 17:39:10 -0800 (PST)
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
Subject: [PATCH net-next v2 11/11] selftests: net: tx_extra_headroom: test the veth attribute
Date: Thu, 19 Nov 2026 01:38:30 +0000
Message-ID: <20261119013830.36935-12-tianyi@cloudflare.com>
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

Create a veth pair with VETH_INFO_TX_EXTRA_HEADROOM set to 64 bytes
through YNL and move the peer to another netns. Check that both ends
report 64, and that tx_extra_headroom of the sending end is 64. With XDP
on the peer it is 64 + 256, because the two values are added. Also check
that a value above 512 is rejected.

The helpers leave the RtnlFamily socket to garbage collection, as
link_netns.py does.

Signed-off-by: Tianyi Gao <tianyi@cloudflare.com>
---
v2:
- Test VETH_INFO_TX_EXTRA_HEADROOM with YNL only (Jakub). The IFLA
  tests of v1 4/8 are gone, so the patch no longer carries
  David Keogh's sign-off.
- Drop the VLAN case of v1 4/8. In v2 no code copies
  tx_extra_headroom to a stacked device.
---
 .../selftests/net/tx_extra_headroom.py        | 61 +++++++++++++++++--
 1 file changed, 57 insertions(+), 4 deletions(-)

diff --git a/tools/testing/selftests/net/tx_extra_headroom.py b/tools/testing/selftests/net/tx_extra_headroom.py
index 122a1a1b5ca9..a4e4195179fa 100755
--- a/tools/testing/selftests/net/tx_extra_headroom.py
+++ b/tools/testing/selftests/net/tx_extra_headroom.py
@@ -3,15 +3,17 @@
 
 """Tests for tx_extra_headroom."""
 
+import errno
 import socket
 import struct
 from pathlib import Path
 
-from lib.py import ksft_run, ksft_exit, ksft_eq, ksft_ge, ksft_gt
+from lib.py import ksft_run, ksft_exit, ksft_eq, ksft_ge, ksft_gt, ksft_raises
 from lib.py import KsftSkipEx, KsftFailEx
 from lib.py import ksft_busy_wait, ksft_variants, KsftNamedVariant
 from lib.py import cmd, defer, ip, bpftool, bpf_prog_map_ids
 from lib.py import NetNS, NetNSEnter
+from lib.py import Netlink, NlError, RtnlFamily
 
 BPF_OBJ = Path(__file__).parent / "tx_extra_headroom.bpf.o"
 XDP_OBJ = Path(__file__).parent / "lib/xdp_dummy.bpf.o"
@@ -37,9 +39,34 @@ def _setup_addrs(peer_ns, dev, peer):
         ip(f"neigh replace {addr} lladdr {peer_mac} dev {dev} nud permanent")
 
 
-def _setup_veth(peer_ns):
+def _add_veth(tx_extra_headroom):
+    """Create veth0 and veth1 with VETH_INFO_TX_EXTRA_HEADROOM through YNL."""
+    # Without names, the peer is created first and becomes veth0.
+    rtnl = RtnlFamily()
+    rtnl.newlink(
+        {
+            "linkinfo": {
+                "kind": "veth",
+                "data": {"tx-extra-headroom": tx_extra_headroom},
+            },
+        },
+        flags=[Netlink.NLM_F_CREATE, Netlink.NLM_F_EXCL],
+    )
+
+
+def _veth_tx_extra_headroom(name):
+    """Return VETH_INFO_TX_EXTRA_HEADROOM of veth device name."""
+    rtnl = RtnlFamily()
+    link = rtnl.getlink({"ifname": name})
+    return link["linkinfo"]["data"]["tx-extra-headroom"]
+
+
+def _setup_veth(peer_ns, tx_extra_headroom=None):
     """Create veth0 in the current netns and its peer veth1 in peer_ns."""
-    ip("link add veth0 type veth peer name veth1")
+    if tx_extra_headroom is None:
+        ip("link add veth0 type veth peer name veth1")
+    else:
+        _add_veth(tx_extra_headroom)
     ip(f"link set veth1 netns {peer_ns}")
     _setup_addrs(peer_ns, "veth0", "veth1")
 
@@ -353,6 +380,30 @@ def test_tag_max() -> None:
     ksft_eq(bss["tx_extra_headroom"], TX_EXTRA_HEADROOM_MAX)
 
 
+def test_veth_info() -> None:
+    """Check that VETH_INFO_TX_EXTRA_HEADROOM adds to tx_extra_headroom."""
+    with NetNS() as send_ns, NetNS() as peer_ns, NetNSEnter(str(send_ns)):
+        _setup_veth(peer_ns, tx_extra_headroom=64)
+        ksft_eq(_veth_tx_extra_headroom("veth0"), 64)
+        with NetNSEnter(str(peer_ns)):
+            ksft_eq(_veth_tx_extra_headroom("veth1"), 64)
+        map_id = _load_progs()
+        _attach_tcx("veth0", "egress", "record")
+        _send_udp4()
+        ksft_eq(_read_bss(map_id)["tx_extra_headroom"], 64)
+        _attach_xdp(peer_ns)
+        _send_udp4()
+        ksft_eq(_read_bss(map_id)["tx_extra_headroom"],
+                64 + XDP_PACKET_HEADROOM)
+
+
+def test_veth_info_above_max() -> None:
+    """Check that a value above the maximum is rejected."""
+    with NetNS() as ns, NetNSEnter(str(ns)), ksft_raises(NlError) as cm:
+        _add_veth(TX_EXTRA_HEADROOM_MAX + 1)
+    ksft_eq(cm.exception.error, errno.ERANGE)
+
+
 def main() -> None:
     """Run all test cases."""
     ksft_run([test_peer_xdp,
@@ -365,7 +416,9 @@ def main() -> None:
               test_push_detach,
               test_push_peer_xdp,
               test_push_two_progs,
-              test_tag_max])
+              test_tag_max,
+              test_veth_info,
+              test_veth_info_above_max])
     ksft_exit()
 
 
-- 
2.56.0

