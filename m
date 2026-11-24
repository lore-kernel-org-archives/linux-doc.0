Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795543133;
	b=xSmHdQ1G2q++FlEMLEG4QLO1NDxdzY0GWe/SJpBbo2YfY03Q8P0+5auLgClhcJGP5vzH
	 5tS4Z1IPOaBQxP9P4j/m3fjcLWZWrCDuARa7nL2GJGIorrEuEEB0Ou5H2VNvJH6QFEwx3
	 eVuNjVQp2qeXkJZGG0QYT8Bu7lEszfe2Ou/fJjIjKyj3DknJu29wWjUIA1RkOIOuZZjmd
	 59077SI8ZhqV7oNizNKphxfZbAyn5PvSnWyxRAXr2DCMocDMzc37OkqAbfHhBViObWA15
	 bekoxyHZmraop91Hvb9BjZMHXVoJHluphbD2f1VV+4I5pEnYG4na+a+A+iam8UW3N0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795543133;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=QVKzXmezLyb1NzGGicKlncvxhs46uSTwixCg7Ak8Quw=;
	b=Rd9YQQArtNIH/9phXFOxvVEnVeYmGMgf/wghTGoe18jO53fWcfL8Ykq0jbUZ9+lpihwX
	 vtF61yvaADVysTUEJpNZaw/532z6Daxson7pVyMVFEd54jytw9TAnV1sa0hdLfrYNN+vP
	 8UI9KBa8UemOUSWd7iL2aZvwk/Sb+mIFHGR44GpGxMDyomnROVTm3CPMjeCw39OgWQs7b
	 Nd/hFAQhUXsv0DxC6sGZSixQL1+oH6gmS5XrNwPHN1bHgPfJKFlHvD6PsjXg/erkjLuui
	 qaqNi8HwHH0C3p+2gfXMicvo9V+eK6AYh46glfqdJZGgFGvZYh76O/wHDeHws0tLvxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cloudflare.com;
	spf=pass smtp.mailfrom=cloudflare.com;
	dkim=pass header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=HEEelxGV;
	arc=none smtp.remote-ip=209.85.208.50
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E9D8606A32A
	for <linux-doc@vger.kernel.org>; Tue, 24 Nov 2026 17:58:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3E9D8606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=HEEelxGV
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6b88d143160so5962570a12.1
        for <linux-doc@vger.kernel.org>; Tue, 24 Nov 2026 09:58:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1795543131; x=1796147931; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QVKzXmezLyb1NzGGicKlncvxhs46uSTwixCg7Ak8Quw=;
        b=HEEelxGVAlLmGt/DxWizVrneUigAY07fFMkaY3Ep/SFEgMd3Ryt+1jSrCIfixu7iUx
         uHJYwgIFKg4vQs8aOD1HEF9wknQuQNpZBtZOXVeSMx2X+MsYgK5ChdL3fOWCFOBdxitW
         DLUGqEh/NBMu01TVNZVq/91qzkxU3Mqku4D+1Mat5D5pQCE9aHQy2AauJjBHQ4I8VYgi
         dV2UTiyH08i20uOC9YxOHzGjOEOR9zLF7yVlgFfFpTNhN+arT1CqD8qauOmYu0oNAKzp
         hCsm8OLxHN0eMoebxKdMk+raL4WOdXMoKXcc28WKXP2ZxYHlU1ckXJcqa7aB7fMkEX8r
         txdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795543131; x=1796147931;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QVKzXmezLyb1NzGGicKlncvxhs46uSTwixCg7Ak8Quw=;
        b=xdbTf2EJBx6bI6VjRjjFdYMqpO1vsXNfZtZCAgHI+TKS3tFnpnxpefu57/ecvBv1IE
         gac6Sfsjr3caAmSVGccOQeIWRVfa3tMe/pEwUhPvJMm8cViiwwYPzvrwnVa+OQCRiy01
         JbqH92LTJd5o56CCuzNwJXkOZ3BUFW2gKOkDoSPuUrAKWD9zvNTr6HOYTdJLP9RVnCn8
         FAL2uW97Ji42BHhKxA+HPjhV9NfiqBunyo639D99I2xYuXQqzz20+2C5Q2jQ5s6ZmekL
         OdeTw+YvbpBBbAs/S+zRXYI6TYjZ86TU6G07bFeiLBb0UEy7lsWGB2XWPwG3tTpiCnN0
         rT6g==
X-Forwarded-Encrypted: i=1; AL+hErGZ+HhOhusiZ0MoeWZnL0o+Ho4IWOmBOekHg4oIp96Yb0OV46YIBe4rW55zx7YrqhE6HitcmL5uUiw=@vger.kernel.org
X-Gm-Message-State: APuU4Z81VLH1oux+MoFLOVR8WX+h+P2kIoN2SHrkN8ulYS4K8fmxrWJ/
	oHbqvHpO9+rqK+nTeZG5SczoDAYaLC3S0dJh8QgBut5MUEKltjmJ2IzbltjRVkBIUyU=
X-Gm-Gg: AZFdTZfcww0cpCEZXvce7N0EoAHfO0UACfPfpn0J8lw/B5NvgpsCetXAuy58lvSXEnx
	3r/T+8AV6mFfkcPPDupr6uzSScTH6JOaMpq5pf+GVtFOPgGoQorFRMHx0WL0kfezHzLO31R/yBJ
	aWELKQKe6vgAVoIESAsC4L9M13NKne6mgYJnpkP6IGYi7TmS2H6L4XIKYiimbfgzioKP6AwG+G4
	5qmpTioWuwpubb78c+xQ60RmwR2KoKDa9tIRff3AaD3uO6ZctCwyvgkjXMVzkM1HABohKH9DXm0
	D15jMJ17vlYneRxeN+bxbWFXfQhZInUK5kOV6+siCYGL8RSVQUMYDdG3/Qy7TcRKLTaljED6GSK
	9Y1KkLZakHHgaYHD2sRCGRV9eSzSn5a5eZ1lYfGUN8pN16b6gCjMsWdOuBQugXmGeC9M8kFlLnZ
	2/mmJVzN+o+HgnNVN2Ih76S07WknqML7agR8yrYOQZkrXbSAWzqpTFMJ/MPAMytRyJABV+CeSTk
	1m8xAFHy+OpW/25n0Q0HHjgdpYhriptaBAXhQGUJoyzOeNsXKT6J1lyGl+X7MzY+EoYejuQK0xX
	+BppojYjcNvYl+ilcU5Y3OBXNev6g63vcBEIsTfq7zNa2/A=
X-Received: by 2002:a05:6402:400d:b0:6b5:9849:e328 with SMTP id 4fb4d7f45d1cf-6ba37ebdda1mr10870750a12.39.1795543131550;
        Tue, 24 Nov 2026 09:58:51 -0800 (PST)
Received: from L9JK9NPFH9 ([2a09:bac6:37ad:1e5a::306:5])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba3711ad52sm7205762a12.35.2026.11.24.09.58.46
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 24 Nov 2026 09:58:51 -0800 (PST)
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
Subject: [PATCH net-next v3 03/11] net: set tx_extra_headroom of the peer on XDP attach
Date: Tue, 24 Nov 2026 17:58:16 +0000
Message-ID: <20261124175824.60470-4-tianyi@cloudflare.com>
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

XDP needs XDP_PACKET_HEADROOM (256 bytes), but locally generated packets
only get needed_headroom. XDP on the peer of a veth or netkit device
then copies every packet. Generic XDP copies it in
netif_skb_check_for_xdp(), and native XDP on veth in
veth_convert_skb_to_xdp_buff().

While the peer has an XDP program, set tx_extra_headroom of the device
to XDP_PACKET_HEADROOM minus needed_headroom.
netdev_update_tx_extra_headroom() recalculates it when an XDP program
is attached or detached, also when an upper device such as a bond
propagates its program to the peer with netif_xdp_propagate(). It does
not recalculate it:

- for IFLA_NETKIT_HEADROOM, which cannot change after the netkit
  device is created,
- in dev_xdp_uninstall(), because veth and netkit unregister both ends
  together,
- when bridge or openvswitch change needed_headroom later.

openvswitch changes needed_headroom under ovs_mutex, without RTNL.
There are three ways to handle a later change of needed_headroom:

- Recalculate tx_extra_headroom in netdev_set_rx_headroom(). This
  races with an XDP attach or detach under RTNL. The last write can
  leave tx_extra_headroom at 0 while XDP is attached.
- Do not subtract needed_headroom. This always reserves needed_headroom
  bytes more than XDP needs.
- Subtract needed_headroom only when tx_extra_headroom is recalculated.

This patch uses the last one, because it does not race and reserves
only what XDP needs. If needed_headroom shrinks later, XDP on the peer
copies packets again until the next recalculation.

This removes the copy for generic XDP. Native XDP on veth also copies a
packet whose head is not a page fragment, and a locally generated
packet has a kmalloc head. A follow-up veth patch changes this for
XDP_PASS and XDP_DROP. Until then, native XDP does not use the extra
headroom, and a packet close to the MTU gets a larger head.

tx_extra_headroom is used rather than needed_headroom, because raising
needed_headroom can regress the performance of other paths.

Signed-off-by: Tianyi Gao <tianyi@cloudflare.com>
---
v3:
- Mention in the commit message and the documentation that native XDP
  on veth still copies locally generated packets (Sashiko).

v2:
- New patch, replaces IFLA_TX_EXTRA_HEADROOM for XDP on the peer
  (Stephen).
---
 Documentation/networking/netdevices.rst | 12 ++++++++
 include/linux/netdevice.h               |  1 +
 net/core/dev.c                          | 38 +++++++++++++++++++++++++
 3 files changed, 51 insertions(+)

diff --git a/Documentation/networking/netdevices.rst b/Documentation/networking/netdevices.rst
index 1f4ff67eb0fc..a1c12ca704d6 100644
--- a/Documentation/networking/netdevices.rst
+++ b/Documentation/networking/netdevices.rst
@@ -458,6 +458,18 @@ Packets built by ip_append_data() or ip6_append_data(), raw packets with
 IP_HDRINCL, AF_PACKET and AF_XDP copy-mode packets reserve
 ``tx_extra_headroom``.
 
+The kernel sets ``tx_extra_headroom`` of a device to the sum of these
+values:
+
+* ``XDP_PACKET_HEADROOM`` (256 bytes) minus ``needed_headroom``, when the
+  peer of a veth or netkit device has an XDP program
+
+The kernel updates ``tx_extra_headroom`` when an XDP program is attached
+to or detached from the peer, to reserve the headroom that XDP needs.
+Native XDP on veth still copies locally generated packets, because
+their head is not a page fragment. ``tx_extra_headroom`` is not updated
+when a bridge or openvswitch changes ``needed_headroom`` later.
+
 NETDEV_INTERNAL symbol namespace
 ================================
 
diff --git a/include/linux/netdevice.h b/include/linux/netdevice.h
index c55a1cf42498..2486b0d10474 100644
--- a/include/linux/netdevice.h
+++ b/include/linux/netdevice.h
@@ -4485,6 +4485,7 @@ int netif_xdp_propagate(struct net_device *dev, struct netdev_bpf *bpf);
 int dev_xdp_propagate(struct net_device *dev, struct netdev_bpf *bpf);
 u8 dev_xdp_sb_prog_count(struct net_device *dev);
 u32 dev_xdp_prog_id(struct net_device *dev, enum bpf_xdp_mode mode);
+void netdev_update_tx_extra_headroom(struct net_device *dev);
 
 u32 dev_get_min_mp_channel_count(const struct net_device *dev);
 
diff --git a/net/core/dev.c b/net/core/dev.c
index 4fedd5765867..c1788a18f0fd 100644
--- a/net/core/dev.c
+++ b/net/core/dev.c
@@ -10671,6 +10671,7 @@ int netif_xdp_propagate(struct net_device *dev, struct netdev_bpf *bpf)
 	if (old_prog)
 		bpf_prog_put(old_prog);
 
+	netdev_update_tx_extra_headroom(dev);
 	return 0;
 }
 EXPORT_SYMBOL_GPL(netif_xdp_propagate);
@@ -10682,6 +10683,41 @@ u32 dev_xdp_prog_id(struct net_device *dev, enum bpf_xdp_mode mode)
 	return prog ? prog->aux->id : 0;
 }
 
+static void __netdev_update_tx_extra_headroom(struct net_device *dev,
+					      struct net_device *peer)
+{
+	unsigned int needed_headroom = READ_ONCE(dev->needed_headroom);
+	unsigned int tx_extra_headroom = 0;
+
+	if (peer && dev_xdp_prog_count(peer) &&
+	    needed_headroom < XDP_PACKET_HEADROOM)
+		tx_extra_headroom = XDP_PACKET_HEADROOM - needed_headroom;
+
+	WRITE_ONCE(dev->tx_extra_headroom, tx_extra_headroom);
+}
+
+/**
+ *	netdev_update_tx_extra_headroom - recalculate tx_extra_headroom
+ *	@dev: the device to check
+ *
+ *	Recalculate tx_extra_headroom of @dev and its peer. Should be called
+ *	after conditions that influence tx_extra_headroom might have changed.
+ *	The caller must hold the RTNL lock.
+ */
+void netdev_update_tx_extra_headroom(struct net_device *dev)
+{
+	struct net_device *peer = NULL;
+
+	rcu_read_lock();
+	if (dev->netdev_ops->ndo_get_peer_dev)
+		peer = dev->netdev_ops->ndo_get_peer_dev(dev);
+	__netdev_update_tx_extra_headroom(dev, peer);
+	if (peer)
+		__netdev_update_tx_extra_headroom(peer, dev);
+	rcu_read_unlock();
+}
+EXPORT_SYMBOL_GPL(netdev_update_tx_extra_headroom);
+
 static int dev_xdp_install(struct net_device *dev, enum bpf_xdp_mode mode,
 			   bpf_op_t bpf_op, struct netlink_ext_ack *extack,
 			   u32 flags, struct bpf_prog *prog)
@@ -10892,6 +10928,7 @@ static int dev_xdp_attach(struct net_device *dev, struct netlink_ext_ack *extack
 	if (cur_prog)
 		bpf_prog_put(cur_prog);
 
+	netdev_update_tx_extra_headroom(dev);
 	return 0;
 }
 
@@ -10918,6 +10955,7 @@ static int dev_xdp_detach_link(struct net_device *dev,
 	bpf_op = dev_xdp_bpf_op(dev, mode);
 	WARN_ON(dev_xdp_install(dev, mode, bpf_op, NULL, 0, NULL));
 	dev_xdp_set_link(dev, mode, NULL);
+	netdev_update_tx_extra_headroom(dev);
 	return 0;
 }
 
-- 
2.56.0

