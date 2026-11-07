Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794089153;
	b=h5g7Rpsus48NS9rdvl+ZMxLM4gSI0VpbQVQS5Q4H+8Jxa1aBW8K++74KqVPlmVMmeAqz
	 7Fln5O1n7bzrpwdsHgDyQ8yEn4rkUbh38rIHkZccnxNUnDGrdhOsYkM3NnbNouA5xMAyj
	 SSPJbUEhght1ENTN2IReUMf+hXnrU9Rsrn3Kjr77d96Cla6ltuNbCYyTDING2LxN2UNMm
	 VYRX4D8i3MwNd4yrpq+d3hqLvgFHZw7b2MOdVjzkFJu3sSXre74yc7+lpMWkkmJhTUn/g
	 vFEpa1pEK0eO3ro390AJbPipvehFDTQespQifxvhDk5c8Xkm/1j0leLxE3wbxWSTroQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794089153;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=o1pO3FI9SOBYYvkg+MBD2TAnUJ2M6o/1RUC4kcI07rA=;
	b=wiuQswQ/5cQhlDmtzze5m/0hGo/nHP6MPEJD7ZTQXtnQfiou+lwQnRh+sJXKQv0k8jhz
	 dBkTQ+uGrLRxrp2O6OV/IT1jCDRk+ZODulGHL9HvhX4KpTOTQo5tRXDgkpWuRxzEUQhUi
	 sb91HxUjyLb1NX3QUdJcRGgtjJI9w4CR8/gR72ikZc/z9a1z3yVYYtBsS+O+cV2vB+kfF
	 vnXVtqCqI7wb7NB7ZUeNKrpZA+wrktNbvNL64C4glD+CwGcJ4ay95kerFofarrmbqVQKh
	 pj5w4lVWOZgEHl2RLu1Bh5TN15S4kQZTFQ57PgNwrtC4Ww8AryLthsqW+yQxWVwP9Wg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oZsDTN0W;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC517606D821
	for <linux-doc@vger.kernel.org>; Sat,  7 Nov 2026 22:05:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CC517606D821
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oZsDTN0W
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48df4f7ccf4so3509f8f.1
        for <linux-doc@vger.kernel.org>; Sat, 07 Nov 2026 14:05:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794089151; x=1794693951; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o1pO3FI9SOBYYvkg+MBD2TAnUJ2M6o/1RUC4kcI07rA=;
        b=oZsDTN0W0J+cCHYlqYk304NV4Io5TrQI5j6vjoAwTxTegwN4vf/PbhSeZMx5hZPABK
         oSwGuAIyCWm6SOH9hPei7o2NPwvkPQ0+rJ1Z+fJe0XSgWOvUZ02YVVI9fYgo6iHvRHrk
         p3Ulnv1pkjrNxYKIzZKQXpphHCatfMnGSZ9CIGqkpNcmxJc5a+lsjC3QqUz6Un3a6kMO
         NiygdCz4mLnUd17Epd5srEhPiquhHxISALhl5O/wtD8dtxQjKmo8RvZrtViULfYTKzpE
         p5ysBbd8sY1PFEUGghA+3MEmQtZJtl2a5Vh4O8MfR1NeM+XHzYRcqNK7gODzpVD2eoSp
         VzrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794089151; x=1794693951;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=o1pO3FI9SOBYYvkg+MBD2TAnUJ2M6o/1RUC4kcI07rA=;
        b=Gtk8KTT29jpN+ZArzOcFqkz+i9W4OIu8PbzzPfzCvk+IIqha+rntsc/wet0izCikkg
         kGQYe9ymrXkeM0/pCFjMX4Nsj/N1SqHsrrrbJn8ktTCBydPvGBvUwLWKLhNZ8AmuhqX/
         DKwsHNL+KcFD0VNhiyBCwL8u2cTKsmZdZ+4NYOFWvAxUPEcW1vJ25X9UT2e9IFmlaaxo
         nrxNxIThlTAUERqpwBolohNe/PVkKZEcTdy9VcoyIbZ5p48tV90vGQBEFNgfTb59Q94s
         nJy7Z2KBeFz6svt1Efptu/ciL1/5iRG6+e5QI5UKB81KDtjzsKpu38Kr14REJLwLT3iu
         bEQw==
X-Forwarded-Encrypted: i=1; AL+hErGdDeEAG9w+X3h8qHysdDmnAGWu+j+WiHhEQKM5BMIViea51T0Ka2aIJZk+TrPPEt7AD0c04ZDOaLg=@vger.kernel.org
X-Gm-Message-State: APuU4Z+OP3q4tZbT8VSkSrNJg61A+p+TeroYPQzBqH93DuNK/Si2NL3H
	cU32iAEwXDpO58x8EQYqsJbY7cpcYxQElBV6AmnlMNjGN62Q7fiuUZsv
X-Gm-Gg: AYBFou26Cr2TzIp56+WBSr4wZlFRZy8cHFV7IFWi2d8n3DwukC0IwJyav+CvqcmAvan
	JATrjMd0DVLuhuOdOiQpQUELK5ioHVvImwweB1smxyBtmu2NSzNWIsJyHph9AEQmbyIfrBe8Um/
	TLwgKBHJaZZlV/hA+w0crwivtSkDefiMuy59hYyA5UvhCjtkR582hixqT+2qlC4h08sZdn2wJlC
	MxBMfnVh1vfiP1Q7gSb7bxkENS5YDkD1dFXELxKMIBC4dZIQcC/vO0BuTTRF7dhDKkR9vSsNnLP
	cJu36CbXqqL44qRyjGLQZi7RvReZsypskZew+WYp6U+b1L8KJpRBiCTJ0xgbUoXITeCTF0BEyA/
	4JMxLK8U5DAOdFQRGOP1qTOhLYAqYjJ8gpA2i+TY/EKituHi/stNaJyNoYb9dr7XYpOiHeKM0Ul
	vqySop5s7YdoXCjzh58l7dXCjUj557VEebwct+Yp4XgVDmZbH9Yy5PLX+WG8rfmys5YTYLmejli
	8waEn56QnhzqN4YQDSf9rOnknG5SeqprrR1tz2cvjDTXNagdh2ZxsygtfHIYX4mLrlmi7nHfeAQ
	zwpzGnytKB0cNeQI5mQaK4JU4ogp0GZxQKGITXnic63PeBMGxiW+rX+O2ufRSGSNvJVtd9ksLrq
	dwjvUGMInDmKNTvMF8rlDb8KlZexj3GX71iguUDc0VrgReqV4w9wfXbLgL4IB5uI=
X-Received: by 2002:a05:6000:98f:b0:48c:6611:82 with SMTP id ffacd0b85a97d-4957f409ce4mr490500f8f.1.1794089151127;
        Sat, 07 Nov 2026 14:05:51 -0800 (PST)
Received: from L-022584.energy.envision.com (dynamic-077-189-161-157.77.189.pool.telefonica.de. [77.189.161.157])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49597b1f969sm358958f8f.50.2026.11.07.14.05.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 14:05:49 -0800 (PST)
From: Xin Xie <xiexinet@gmail.com>
To: netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	andrew+netdev@lunn.ch,
	shuah@kernel.org,
	kees@kernel.org,
	petr.wozniak@gmail.com,
	qingfang.deng@linux.dev,
	fmaurer@redhat.com,
	luka.gejak@linux.dev,
	bigeasy@linutronix.de,
	xiaoliang.yang_1@nxp.com,
	skhawaja@google.com,
	liuhangbin@gmail.com,
	stable@vger.kernel.org,
	sdf.kernel@gmail.com,
	xiexinet@gmail.com,
	lukma@denx.de,
	fmancera@suse.de,
	danishanwar@ti.com,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	linux-doc@vger.kernel.org
Subject: [PATCH net v8 1/4] net: hsr: keep GRO disabled on HSR/PRP ports
Date: Sat,  7 Nov 2026 23:05:40 +0100
Message-ID: <20261107220544.20-2-xiexinet@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261107220544.20-1-xiexinet@gmail.com>
References: <20261107220544.20-1-xiexinet@gmail.com>
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

HSR and PRP tag and de-duplicate each wire frame separately. GRO on a
member device merges several frames into one skb that cannot get valid
per-frame metadata, and userspace can turn GRO back on at any time.

Mark direct members (slave A/B, interlink) with a kernel role bit.
While it is set, __netdev_update_features() drops software GRO and
configurable GRO_HW from wanted_features as well as from the computed
features, before ndo_fix_features(). GRO_HW that the driver keeps on
is left alone. The request has to go too: veth adds and deletes its
NAPI instances according to wanted_features, so with GRO still
requested, closing an attached veth spins in napi_disable(), and
detaching a veth that was attached while down and then brought up hits
the BUG_ON() in napi_enable(). As for LRO disabled by an upper device,
GRO is not restored when the port leaves; ethtool can turn it back on.

The attach fails if software GRO stays active. A failed attach does
not restore the GRO request either; the next patch refuses the usual
causes before any state is changed. GSO skbs can still arrive, for
example from a stacked member whose lower device runs GRO; a later
patch segments them.

Fixes: 5055cccfc2d1 ("net: hsr: Provide RedBox support (HSR-SAN)")
Signed-off-by: Xin Xie <xiexinet@gmail.com>
---
 .../networking/net_cachelines/net_device.rst  |  1 +
 include/linux/netdevice.h                     |  7 +++
 net/core/dev.c                                | 15 ++++++
 net/hsr/hsr_slave.c                           | 52 +++++++++++++++++++
 4 files changed, 75 insertions(+)

diff --git a/Documentation/networking/net_cachelines/net_device.rst b/Documentation/networking/net_cachelines/net_device.rst
index 8eceaa80b686..0d87e4d92a58 100644
--- a/Documentation/networking/net_cachelines/net_device.rst
+++ b/Documentation/networking/net_cachelines/net_device.rst
@@ -169,6 +169,7 @@ unsigned_long:1                     see_all_hwtstamp_requests
 unsigned_long:1                     change_proto_down
 unsigned_long:1                     netns_immutable
 unsigned_long:1                     fcoe_mtu
+unsigned_long:1                     hsr_port
 struct list_head                    net_notifier_list
 struct macsec_ops*                  macsec_ops
 struct udp_tunnel_nic_info*         udp_tunnel_nic_info
diff --git a/include/linux/netdevice.h b/include/linux/netdevice.h
index 435be7880d7e..818d69623456 100644
--- a/include/linux/netdevice.h
+++ b/include/linux/netdevice.h
@@ -2110,6 +2110,7 @@ enum netdev_reg_state {
  *	@change_proto_down: device supports setting carrier via IFLA_PROTO_DOWN
  *	@netns_immutable: interface can't change network namespaces
  *	@fcoe_mtu:	device supports maximum FCoE MTU, 2158 bytes
+ *	@hsr_port:	direct HSR/PRP member (slave A/B or interlink)
  *
  *	@net_notifier_list:	List of per-net netdev notifier block
  *				that follow this device when it is moved
@@ -2531,6 +2532,12 @@ struct net_device {
 	unsigned long		change_proto_down:1;
 	unsigned long		netns_immutable:1;
 	unsigned long		fcoe_mtu:1;
+	/* Direct HSR/PRP member: slave A/B or interlink. While set,
+	 * software GRO and configurable GRO_HW are dropped, requested and
+	 * active; GRO_HW that the driver keeps on is left alone. Kernel
+	 * role state only; no user ABI or offload capability.
+	 */
+	unsigned long		hsr_port:1;
 
 	struct list_head	net_notifier_list;
 
diff --git a/net/core/dev.c b/net/core/dev.c
index df1a840b0334..2916b17f4169 100644
--- a/net/core/dev.c
+++ b/net/core/dev.c
@@ -11269,6 +11269,21 @@ int __netdev_update_features(struct net_device *dev)
 
 	features = netdev_get_wanted_features(dev);
 
+	/* A direct HSR/PRP port needs per-frame metadata. Drop software
+	 * GRO and configurable GRO_HW from the request as well as from the
+	 * result, as the core does for upper-disabled features: drivers
+	 * such as veth derive state from wanted_features and need the
+	 * requested and the active bit to agree. Fixed-on or
+	 * driver-required GRO_HW is left to the driver.
+	 */
+	if (dev->hsr_port) {
+		netdev_features_t gro = NETIF_F_GRO |
+					(dev->hw_features & NETIF_F_GRO_HW);
+
+		dev->wanted_features &= ~gro;
+		features &= ~gro;
+	}
+
 	if (dev->netdev_ops->ndo_fix_features)
 		features = dev->netdev_ops->ndo_fix_features(dev, features);
 
diff --git a/net/hsr/hsr_slave.c b/net/hsr/hsr_slave.c
index a546f70f9cc8..bc340ae0b52e 100644
--- a/net/hsr/hsr_slave.c
+++ b/net/hsr/hsr_slave.c
@@ -11,6 +11,7 @@
 #include <linux/etherdevice.h>
 #include <linux/if_arp.h>
 #include <linux/if_vlan.h>
+#include <net/netdev_lock.h>
 #include "hsr_main.h"
 #include "hsr_device.h"
 #include "hsr_forward.h"
@@ -137,6 +138,35 @@ static int hsr_check_dev_ok(struct net_device *dev,
 	return 0;
 }
 
+/* Member role and feature policy.
+ * Setting the role makes __netdev_update_features() clear GRO
+ * and configurable GRO_HW from both the requested and the active
+ * features of this device. Only the role and feature update run
+ * under the device ops lock; unlink, promiscuous updates and the
+ * master recompute stay outside.
+ */
+static void hsr_portdev_role_set(struct net_device *dev)
+{
+	netdev_lock_ops(dev);
+	dev->hsr_port = true;
+	netdev_change_features(dev);
+	netdev_unlock_ops(dev);
+}
+
+static void hsr_portdev_role_clear(struct net_device *dev)
+{
+	netdev_lock_ops(dev);
+	dev->hsr_port = false;
+	/* Recompute features without the role. GRO was dropped from
+	 * the request while the role was set and stays off; the user
+	 * can turn it back on with ethtool. A dying device just drops
+	 * the role, a netns move stays registered and is recomputed.
+	 */
+	if (dev->reg_state == NETREG_REGISTERED)
+		netdev_change_features(dev);
+	netdev_unlock_ops(dev);
+}
+
 /* Setup device to be added to the HSR bridge. */
 static int hsr_portdev_setup(struct hsr_priv *hsr, struct net_device *dev,
 			     struct hsr_port *port,
@@ -169,6 +199,22 @@ static int hsr_portdev_setup(struct hsr_priv *hsr, struct net_device *dev,
 	if (res)
 		goto fail_upper_dev_link;
 
+	/* Enable the member role and recompute before the RX handler
+	 * is published, so that software GRO on this device is off
+	 * before frames can arrive. This covers the direct member
+	 * only: a stacked member receives from a lower device that
+	 * may still run GRO and can deliver merged frames as GSO skbs.
+	 * A still-active software GRO rejects the port, a remaining
+	 * GRO_HW alone does not.
+	 */
+	hsr_portdev_role_set(dev);
+	if (dev->features & NETIF_F_GRO) {
+		NL_SET_ERR_MSG_MOD(extack,
+				   "software GRO still on after feature update, cannot join");
+		res = -EBUSY;
+		goto fail_role_policy;
+	}
+
 	res = netdev_rx_handler_register(dev, hsr_handle_frame, port);
 	if (res)
 		goto fail_rx_handler;
@@ -177,7 +223,12 @@ static int hsr_portdev_setup(struct hsr_priv *hsr, struct net_device *dev,
 	return 0;
 
 fail_rx_handler:
+fail_role_policy:
+	/* Rollback order: unlink the upper, clear the role and
+	 * recompute, then undo this setup's promiscuous increment.
+	 */
 	netdev_upper_dev_unlink(dev, hsr_dev);
+	hsr_portdev_role_clear(dev);
 fail_upper_dev_link:
 	if (!port->hsr->fwd_offloaded || port->type == HSR_PT_INTERLINK)
 		dev_set_promiscuity(dev, -1);
@@ -248,6 +299,7 @@ void hsr_del_port(struct hsr_port *port)
 		if (port->type == HSR_PT_SLAVE_A || port->type == HSR_PT_SLAVE_B)
 			vlan_vids_del_by_dev(port->dev, master->dev);
 		netdev_upper_dev_unlink(port->dev, master->dev);
+		hsr_portdev_role_clear(port->dev);
 		if (hsr->prot_version == PRP_V1 &&
 		    port->type == HSR_PT_SLAVE_B) {
 			eth_hw_addr_set(port->dev, port->original_macaddress);
-- 
2.53.0

