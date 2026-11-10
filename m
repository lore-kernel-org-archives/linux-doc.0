Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794283078;
	b=kCLf7zV1aJwDLFFHvbWwE9qStAwiX7uInGh0Vyyo2SSgzsj03G+SdW/7T6RC8V9TkDcf
	 vseIxhVTIq1ZPyKq/xiaA8RvJQi7jJ0UPrKxFUXdVbuxjsvYvYCZW0PB/fIaSVWs3y3MV
	 6eRYHaFkd+CCaenJsCeCQnIfLL6V/64drsTv0wdBcOPoYYjFJ+Cve+ui+/lzkzkjYB1zd
	 wzRHR5lF/QWw9oEqkSMJIvzPL9Rw1CNCo26gi6n4IwBCu22ym9sDSXtKwrOsBlRCz/bK1
	 4zIlLlmv9OxKEF4BSeVRhRdX4zqT+3cA2PJ5nuPeDn4yc8YSSpyh0KG7v53UJSAUOvA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794283078;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=6mXUjSsb+h9m7vI0sEcfo3uXfUjeQTfFxyZorh+4fbw=;
	b=3eLE5dxIQkMwmvOXDgNWErGJV7TjD9PGG71TeECwUNQYCymHXMmEiWX9qEUS0ci4h+w5
	 DandDfusZtH3boAf17ebo9jhUfY4fCo3Ls4H2qGqQpbNPP89K1ELtUSp9kCo1vtiQP22t
	 wkv/kjjKEWzcUA/eyz697fqZMqzn/of5H4OvwIHnP8DeiLAbAe0wBGXTzfzMB+fmpYG0Y
	 yWAMheUPMF4nruF1dngH2gLFgVPtiW2rO1EVeNZ3IbByJ/2A6k2JVcIxJ2n15LKOEszqt
	 1aA4/c2Ou7Dx0P665u0BoIDoJ8qDUMWqRU7nZKI4S0brKYGHHth9pvzRnSHB9DihB3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cloudflare.com;
	spf=pass smtp.mailfrom=cloudflare.com;
	dkim=pass header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=XC8BC+yO;
	arc=none smtp.remote-ip=209.85.208.49
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 118F260A263D
	for <linux-doc@vger.kernel.org>; Tue, 10 Nov 2026 03:57:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 118F260A263D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=XC8BC+yO
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6b581b6b0e9so344102a12.2
        for <linux-doc@vger.kernel.org>; Mon, 09 Nov 2026 19:57:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1794283076; x=1794887876; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6mXUjSsb+h9m7vI0sEcfo3uXfUjeQTfFxyZorh+4fbw=;
        b=XC8BC+yOwXmRJEMz+SM144v83trM0hc8QUlojPPlg5jn8c13A/9q5ZCk/vIzUT+F25
         DWvg8DJpjS8mDFhVpYJUyE+t6CDTvsIgpAITPaN1+ke7wDqVgQWIi394d+qZ3VZn3mR9
         Leih8+JD2KIGKLtFyQRNUpOBj7iVjdfXO9Ifmhcd8F1Dle0HFGmWHpXyG1NfEqTAOo8H
         1rbygOI8fumV3nvSGGQMCf0ZRWrwvb9oTZWI7hsjSAHJ0AHX0OCN/ziEzFqWvPUSHj+/
         oUMOv8OpT7GMGQ1i/eTLCoyR0xW29XxQugD8wBBLBfIUrptzTyjEQCqk/L1DEfmmUH5v
         JrRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794283076; x=1794887876;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6mXUjSsb+h9m7vI0sEcfo3uXfUjeQTfFxyZorh+4fbw=;
        b=juj13YOv67SEHQQWPYE3lD1M9pXj0KM764+ccEWucqqrcuSV16yARNeN1zc4zSi4l3
         rkBFGB5GTLQpMMx1WOJe9Xl9JvjRP+ELlTgIfrqaSZA1WwKAXJpzaV4CDEJr1Kt6wNT3
         XyqeiQIa41GraA2SoMCVCRpIOCpWZVwyBrUIcL9uCos3vhn2lFvSh2zQDZN4qJaG2dkN
         i2TB1ZWTa9fKQawyxAYpGahshVS6J+/VCx60lMAiaDJ5LC6jXB/zPsBXVpSc9bFJzrca
         KsnRcIcvOaiXWge0Qki+52PVe/oqhQ5Mas94196fi7vDOY83mGgBrnPRP/8fItKbQt5D
         11jw==
X-Forwarded-Encrypted: i=1; AL+hErF5og3/0Fv1KBZ2yrZx2eaEC3mrjcQbZVx5cQwAbehYBQ3G7aQ4Szl3PijBSbvNLNxy4mZxwF+uFyE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+LFEApmJr3lqyUWZZvIu3IBnJXFlrlMvOyUW56MAjXKoFudehd
	2d7VUC5IFDP6YOrd83lHIoJfB6XZpKf9Qoruu8y/EXoAhPh67l2UG86/KGao0yClML4=
X-Gm-Gg: AYBFou1A8OXstXCaTLuGZM6af43SIl8qSwMtaT/KMkdRFOqGkV2M72jzA5bPZigr8r8
	N4VQUlGOE6XWhX7zJv9p7BP2DJroTqAkDbqrd5uZF6Ksimge/TUng7TvrxHBP/FkjoJiV8Jn3ry
	NkREVPQlHNo+P0eqlkjgHsGX1G9DAndAsodmNgpLvZEQOdOCUIMbdinZDjG9DVW4ieNaLcuZB/s
	f0FrcE2A6nXPoVlkZv2qjXLHwcmoKCzyY+VYZktRNWOWC1IJg3LfaLUTkgszl6B5b7iN3FTedr5
	DHQUQ5ecr9BMGmtdN2yq8rFZYEd0KmGipNq8JTwCO56DE853lOhoHDUfAjS/8SUq5WLLmVn2DCU
	nmfSSjHFu0oy9R/XK29bVsclFgHwG/k03pj41ByFvKr8O8sJvJc/MFXqCeg2X7yYew+Vch7h2A9
	Yq2CLC/NZ/WKecuBjIC2FG6VCE85VYFdWRxnTg5wrOyzSVPcsObXfwJc0M3ubKjR71fEdXgrfAs
	0pheJu3tOF8SFnzz/+v+SRy3ORfFgUsfMoP0IiK9rbNBuh0asAMeqYW7DBR4FmbPMCG3UDTLZp8
	IWxaIXTWUO+QeXl4WumXnspP7ZZVM57iaDYeqX2yBX20c+PHom1gxEnGjQqxabA=
X-Received: by 2002:a05:6402:214b:b0:6b3:c320:8858 with SMTP id 4fb4d7f45d1cf-6b756ae734emr681477a12.24.1794283076584;
        Mon, 09 Nov 2026 19:57:56 -0800 (PST)
Received: from L9JK9NPFH9.lan ([104.28.20.56])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b7579047c9sm548801a12.33.2026.11.09.19.57.52
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 09 Nov 2026 19:57:54 -0800 (PST)
From: Tianyi Gao <tianyi@cloudflare.com>
To: bpf@vger.kernel.org,
	netdev@vger.kernel.org,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Jakub Kicinski <kuba@kernel.org>,
	Jesper Dangaard Brouer <hawk@kernel.org>
Cc: John Fastabend <john.fastabend@gmail.com>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Vladimir Vdovin <deliran@verdict.gg>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Donald Hunter <donald.hunter@gmail.com>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Jiri Olsa <jolsa@kernel.org>,
	Emil Tsalapatis <emil@etsalapatis.com>,
	Ihor Solodrai <ihor.solodrai@linux.dev>,
	Tony Nguyen <anthony.l.nguyen@intel.com>,
	Przemek Kitszel <przemyslaw.kitszel@intel.com>,
	Maciej Fijalkowski <maciej.fijalkowski@intel.com>,
	Alexander Lobakin <aleksander.lobakin@intel.com>,
	Magnus Karlsson <magnus.karlsson@intel.com>,
	Tushar Vyavahare <tushar.vyavahare@intel.com>,
	Jason Xing <kerneljasonxing@gmail.com>,
	Nikolay Aleksandrov <razor@blackwall.org>,
	Madalin Bucur <madalin.bucur@nxp.com>,
	Ioana Ciornei <ioana.ciornei@nxp.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Shuah Khan <shuah@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Chris J Arges <carges@cloudflare.com>,
	Jakub Sitnicki <jakub@cloudflare.com>,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	intel-wired-lan@lists.osuosl.org,
	llvm@lists.linux.dev,
	kernel-team@cloudflare.com,
	Tianyi Gao <tianyi@cloudflare.com>
Subject: [PATCH bpf-next 10/15] xdp: warn on XDP_PASS with stored values when XDP runs on an skb
Date: Tue, 10 Nov 2026 03:57:08 +0000
Message-ID: <15f830924c4d06d3d8c7e41fb8a9f8c29b63d9a7.1794281983.git.tianyi@cloudflare.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <cover.1794281983.git.tianyi@cloudflare.com>
References: <cover.1794281983.git.tianyi@cloudflare.com>
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

On XDP_PASS, when XDP runs on an skb, the stored values are lost, because
the skb already exists. This happens in bpf_prog_run_generic_xdp() for
generic XDP and for cpumap and devmap programs on an skb. It also
happens in veth_xdp_rcv_skb() when veth receives an skb from its peer.
veth has the skb-ext-pass feature, so bpf_prog_run_xdp() does not warn
for it.

Add xdp_skb_ext_warn_skb(). bpf_prog_run_generic_xdp() and
veth_xdp_rcv_skb() call it on XDP_PASS with stored values, whatever the
device features.

Generic XDP also runs bpf_prog_run_xdp(). On a native XDP device without
the feature, it would warn twice. So xdp_skb_ext_warn_pass() skips
generic XDP.

Signed-off-by: Tianyi Gao <tianyi@cloudflare.com>
---
Tested on virtio_net and veth: generic XDP prints only the new warning,
and BPF_PROG_RUN without live frames prints none.
---
 drivers/net/veth.c |  2 ++
 include/net/xdp.h  |  2 ++
 net/core/dev.c     |  2 ++
 net/core/xdp.c     | 21 ++++++++++++++++++++-
 4 files changed, 26 insertions(+), 1 deletion(-)

diff --git a/drivers/net/veth.c b/drivers/net/veth.c
index b402f8ed5096..f0d279e2da6a 100644
--- a/drivers/net/veth.c
+++ b/drivers/net/veth.c
@@ -826,6 +826,8 @@ static struct sk_buff *veth_xdp_rcv_skb(struct veth_rq *rq,
 
 	switch (act) {
 	case XDP_PASS:
+		if (unlikely(xdp_buff_has_skb_ext(xdp)))
+			xdp_skb_ext_warn_skb(xdp_prog, xdp);
 		break;
 	case XDP_TX:
 		veth_xdp_get(xdp);
diff --git a/include/net/xdp.h b/include/net/xdp.h
index 7148e8ef00e1..596261ed9cca 100644
--- a/include/net/xdp.h
+++ b/include/net/xdp.h
@@ -511,6 +511,8 @@ static __always_inline void *xdp_skb_ext_end(const struct xdp_buff *xdp)
 void xdp_skb_ext_to_skb(struct sk_buff *skb, const struct xdp_skb_ext *ext);
 void xdp_skb_ext_warn_pass(const struct bpf_prog *prog,
 			   const struct xdp_buff *xdp);
+void xdp_skb_ext_warn_skb(const struct bpf_prog *prog,
+			  const struct xdp_buff *xdp);
 
 void __xdp_return(netmem_ref netmem, enum xdp_mem_type mem_type,
 		  bool napi_direct, struct xdp_buff *xdp);
diff --git a/net/core/dev.c b/net/core/dev.c
index 3bf00e7e1a85..e37c881d968b 100644
--- a/net/core/dev.c
+++ b/net/core/dev.c
@@ -5705,6 +5705,8 @@ u32 bpf_prog_run_generic_xdp(struct sk_buff *skb, struct xdp_buff *xdp,
 	orig_eth_type = eth->h_proto;
 
 	act = bpf_prog_run_xdp(xdp_prog, xdp);
+	if (unlikely(xdp_buff_has_skb_ext(xdp)) && act == XDP_PASS)
+		xdp_skb_ext_warn_skb(xdp_prog, xdp);
 
 	/* check if bpf_xdp_adjust_head was used */
 	off = xdp->data - orig_data;
diff --git a/net/core/xdp.c b/net/core/xdp.c
index 36d6bb38b719..984299199906 100644
--- a/net/core/xdp.c
+++ b/net/core/xdp.c
@@ -18,6 +18,7 @@
 
 #include <net/hotdata.h>
 #include <net/netdev_lock.h>
+#include <net/netdev_rx_queue.h>
 #include <net/xdp.h>
 #include <net/xdp_priv.h> /* struct xdp_mem_allocator */
 #include <trace/events/xdp.h>
@@ -1124,12 +1125,17 @@ void xdp_skb_ext_to_skb(struct sk_buff *skb, const struct xdp_skb_ext *ext)
 void xdp_skb_ext_warn_pass(const struct bpf_prog *prog,
 			   const struct xdp_buff *xdp)
 {
-	const struct net_device *dev = xdp->rxq->dev;
+	const struct xdp_rxq_info *rxq = xdp->rxq;
+	const struct net_device *dev = rxq->dev;
 
 	/* The skb is built later from the xdp_frame */
 	if (prog->expected_attach_type == BPF_XDP_CPUMAP ||
 	    prog->expected_attach_type == BPF_XDP_DEVMAP)
 		return;
+	/* Generic XDP and BPF_PROG_RUN use the netdev_rx_queue xdp_rxq */
+	if (rxq->queue_index < dev->num_rx_queues &&
+	    rxq == &dev->_rx[rxq->queue_index].xdp_rxq)
+		return;
 	/* No native XDP, so only generic XDP or BPF_PROG_RUN runs on dev */
 	if (!(dev->xdp_features & NETDEV_XDP_ACT_BASIC))
 		return;
@@ -1139,6 +1145,19 @@ void xdp_skb_ext_warn_pass(const struct bpf_prog *prog,
 }
 EXPORT_SYMBOL_GPL(xdp_skb_ext_warn_pass);
 
+/**
+ * xdp_skb_ext_warn_skb - Warn that XDP_PASS on an skb loses the stored values.
+ * @prog: The XDP program that returned XDP_PASS.
+ * @xdp: The packet, with the XDP_FLAGS_HAS_SKB_EXT flag, built on an skb.
+ */
+void xdp_skb_ext_warn_skb(const struct bpf_prog *prog,
+			  const struct xdp_buff *xdp)
+{
+	pr_warn_once("XDP_PASS on prog %s (id %u): dev %s runs XDP on an skb, the stored RX metadata is lost\n",
+		     prog->aux->name, prog->aux->id, xdp->rxq->dev->name);
+}
+EXPORT_SYMBOL_GPL(xdp_skb_ext_warn_skb);
+
 __bpf_kfunc_start_defs();
 
 /**
-- 
2.56.0

