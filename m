Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794925171;
	b=OgU79bSUtOBX9PMhTNUd2HSGPHc85/13sKehzr22gmgpWW/AN+Y5gv5Te6v8WLCDmPmG
	 +/cRbWUYvfvyKRgtqZYeKzs1UoP2h6+oHQPHu8P0SgttlxbNbO6hzok1F2vnZ3B/nC/o2
	 46JVmxT/n2WfZ3didf/yPElY+qxjp4L6OBPwnJrLSwExkqbIXJiznQQp9ikHAfXGO8sLB
	 HECFOr7gthzVi5puWlDhrw2x59JEkCa9ypN+SoHqhWSJFBbu19Iv5ZLk1R6LmSeg7hxkT
	 H/LCSDVPuKa+wy4ePMdmg8CMdL9SKLBCMDFtuJbwO/FA+31BzPXLiG12YQiSybv3YlQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794925171;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=iaB9hwFTSxbEro9At2R1C8vW7OhVr4aClggEkaR4UDw=;
	b=foFeK7/yY0iHvdl3ddc70AxX6Lz4JU3iS4m31Nijl0+unyQoq6SetVBYxIAqWwBX67OQ
	 k/Hlh6CiRLfr8g+VImRIyhEbcVxjig+FeXvJq4PQ3rBBXqkKx+coxPjnBchusBb3Xuco8
	 cX0bDn6yPjNoFjWJOfeMlezKJ/uw5OjfxqPxLBQNkahWSIS1YoURtrrrE2vR0CO+T2C2f
	 W0aB5d0bfliAAGZRDyjVUHhz597FYK6BPTEz+FzNu2E/TKC732bPC68UOpdlGILnBGxAB
	 e1/kiaGyWLzBGnMoqAeDG/EedXrgUVsmSUOkRT+VSDsIL9h4bM2Pmqwsc3S+hK6Zg4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HRbrY6Um;
	arc=none smtp.remote-ip=209.85.218.53
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91AA1606A890
	for <linux-doc@vger.kernel.org>; Tue, 17 Nov 2026 14:19:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 91AA1606A890
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HRbrY6Um
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c4cd28978b8so58255266b.3
        for <linux-doc@vger.kernel.org>; Tue, 17 Nov 2026 06:19:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794925169; x=1795529969; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iaB9hwFTSxbEro9At2R1C8vW7OhVr4aClggEkaR4UDw=;
        b=HRbrY6UmZISE8CVaY8K5O/ehOFUyP/gjVnkMQYf3P0SxFU/L/P9NjsOAzdUDB2AHAt
         8gAG/AOuGwPluCrgqTyW8v9bn3IIMSWvWhTnXZdQYHvPYlJq9Q/FA+rEogfg9J91uVY/
         i6AB6Ry4XbB/Qey1CnJKIYaxt9vEPtALzhn2BgAwVQwk6qCbXTPu6rAl0jJ9zCHNac7s
         08llEzPif1cX9YQlMSrXesgi2NL5aFTYTmYJbK7sKFIVW/q2jC/Mkc/Q+KJN96nulpD9
         NdOJYUmQwe80vtCtKpdit8/MVsKWho/9V5uNqaFh5INpuVRu4NO7t0EUZ05sF5lD+kKH
         OMAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794925169; x=1795529969;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iaB9hwFTSxbEro9At2R1C8vW7OhVr4aClggEkaR4UDw=;
        b=xKee6YVEW+zUMvzbYtljoIC4iAcq7tM4wbp3ESyelG6V7gAnt6XwonTuAK73034aqx
         O+m0W1ZUxPvI0TctUAHmNMmqCvKzxgSwk4eqyHy+VWr6C1i8aUws43Cm2MclxJfqJHD9
         Px5rhJgaafXXgsVMCp1D2D+bJRFO6NFNVHCqxEcZB6zOU+I9OHlOU/a25rSDZ/rTyS8b
         z65s+n9OrRcFEQekGOLJr+Lr3pjHTdNIAikKbWn6/3tAhEvWszz28sft3oYGqT7y8c91
         gf5ykfajxDg5HjchRziFkB7qgZ3LR0ksY0X+TjYx1lvk9uP/c+Bidjd4MTujCSPsHxC9
         W/PQ==
X-Forwarded-Encrypted: i=1; AL+hErHnRL1J3GZL2qsGAZY2kxyDDBWRG58Zo2QvpfHsfAq9T8hmk/5tCOsOGBfy8BPBarjAxZ7KNLRSVTw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/0UFP48k9pqSOal/AShOzr7FPVnSDyaSMYYn3e4cDpKVih8L//
	jmzuOE+jrpE+B7alYXz+DHwPC7o3RjixGcH0bpWx2AHbYPdC9ZfkVBbf
X-Gm-Gg: AYBFou3XhJG6zA2+eUOLULqtFpVjPtunG7ZAlEqfLWeN76GHfm4u4aEq63VLQJUODWs
	vB66s0a/5E11eI7FK+r/XnuDZN4Q8NJ2Z0YsxzCJxUevgGGWxmkyNwdO9rRot9TGKYKJ7cIv5Wf
	KjbHvVct/Z/55RMMdUYrX4CDpMIWpGNa2aPvXSjL605fHsp/7Wrs4pSa+UK2pF345r3wBTn68/6
	PEVD1+L5GXf0zdMC8huEmIVm0PCp2IsAR/3DlgTpXq91RSAmxPIMIVYsHndLJG2abHTp0p10MTq
	phRl3fO/uJyF2F8J/TQEpP+aDf+1/dMC6c1i4Mo4isf24m/MQGeheufRxL7BUdmlMMnBdLKyjF3
	bKsZLbDC3Wdk+h1Em5GK9Jnsqd7uLcjwgcjTVTAtzLwmOXOcVqD4B6pi7YxCnPccAs6j5ql7gjm
	ZeRY8kfvwHTD8+ZZ1Mjb4I2Lj+eQS+WHuI/RKnCEaTLVEvAChzuofW0LCLB/xpxr1HEu/U/WvF0
	DZjz2QAikihYU/JCRt7kGKnj3A89qwEppuLkDcBUI5mWdkpzF+tq3lxmc0ELeBRLebtK0rQdCq7
	+STM8badSDL0Vw2wvKxYPC2sQ/lVKpV8Z4DtuTfsAFx4rwj1SBlyn/d92QzpnPOsfEixHYxv1q2
	HyfHaalTFLs8X+47Ccs7xguDmPRvTTGC3sF/OOYlUxHO7fhfC7zOGUiBgvGOc
X-Received: by 2002:a17:907:76e1:b0:c50:a6c8:2606 with SMTP id a640c23a62f3a-c50a6c826c9mr1249591966b.0.1794925168788;
        Tue, 17 Nov 2026 06:19:28 -0800 (PST)
Received: from L-022584.energy.envision.com (dynamic-077-184-154-007.77.184.pool.telefonica.de. [77.184.154.7])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095a5abf3sm545215166b.12.2026.11.17.06.19.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 06:19:27 -0800 (PST)
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
	linux-doc@vger.kernel.org,
	sunwenbo@cmss.chinamobile.com
Subject: [PATCH net v10 1/4] net: hsr: keep GRO disabled on HSR/PRP ports
Date: Tue, 17 Nov 2026 15:19:19 +0100
Message-ID: <20261117141922.20-2-xiexinet@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261117141922.20-1-xiexinet@gmail.com>
References: <20261117141922.20-1-xiexinet@gmail.com>
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
the BUG_ON() in napi_enable(). A GRO request on a member is dropped,
not kept pending: while GRO stays off, the legacy ETHTOOL_SFEATURES
ioctl returns no ETHTOOL_F_WISH for it, and the netlink reply still
shows the request as not applied. As for LRO disabled by an upper
device, GRO is not restored when the port leaves; ethtool can turn it
back on.
The rule covers every direct member, PRP ports and ports with HSR
offload included: one simple rule is preferred to per-port exceptions,
at some cost in receive throughput.

The attach fails if software GRO stays active. A failed attach does
not restore the GRO request either. The next patch checks all ports
before any of them is changed, so only a failure at run time, for
example a driver that cannot turn GRO off or the upper device nesting
limit (-EMLINK), leaves a port with its GRO request dropped.
GSO skbs can still arrive, for example from a stacked member whose
lower device runs GRO; a later patch segments them.

Fixes: 5055cccfc2d1 ("net: hsr: Provide RedBox support (HSR-SAN)")
Signed-off-by: Xin Xie <xiexinet@gmail.com>
Reviewed-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
 .../networking/net_cachelines/net_device.rst  |  1 +
 include/linux/netdevice.h                     |  8 +++
 net/core/dev.c                                | 15 ++++++
 net/hsr/hsr_slave.c                           | 54 +++++++++++++++++++
 4 files changed, 78 insertions(+)

diff --git a/Documentation/networking/net_cachelines/net_device.rst b/Documentation/networking/net_cachelines/net_device.rst
index 8eceaa80b686..a9a7a52c8a16 100644
--- a/Documentation/networking/net_cachelines/net_device.rst
+++ b/Documentation/networking/net_cachelines/net_device.rst
@@ -166,6 +166,7 @@ struct lock_class_key*              qdisc_tx_busylock
 bool                                proto_down
 unsigned:1                          wol_enabled
 unsigned_long:1                     see_all_hwtstamp_requests
+unsigned_long:1                     hsr_port
 unsigned_long:1                     change_proto_down
 unsigned_long:1                     netns_immutable
 unsigned_long:1                     fcoe_mtu
diff --git a/include/linux/netdevice.h b/include/linux/netdevice.h
index 435be7880d7e..ad63f0540c64 100644
--- a/include/linux/netdevice.h
+++ b/include/linux/netdevice.h
@@ -2107,6 +2107,7 @@ enum netdev_reg_state {
  *			ndo_hwtstamp_set() for all timestamp requests
  *			regardless of source, even if those aren't
  *			HWTSTAMP_SOURCE_NETDEV
+ *	@hsr_port:	direct HSR/PRP member (slave A/B or interlink)
  *	@change_proto_down: device supports setting carrier via IFLA_PROTO_DOWN
  *	@netns_immutable: interface can't change network namespaces
  *	@fcoe_mtu:	device supports maximum FCoE MTU, 2158 bytes
@@ -2528,6 +2529,13 @@ struct net_device {
 
 	/* priv_flags_slow, ungrouped to save space */
 	unsigned long		see_all_hwtstamp_requests:1;
+	/* Direct HSR/PRP member: slave A/B or interlink. While set,
+	 * software GRO and configurable GRO_HW are dropped from the
+	 * request and before ndo_fix_features(); GRO_HW that the driver
+	 * keeps on is left alone. Kernel role state only; no user ABI or
+	 * offload capability.
+	 */
+	unsigned long		hsr_port:1;
 	unsigned long		change_proto_down:1;
 	unsigned long		netns_immutable:1;
 	unsigned long		fcoe_mtu:1;
diff --git a/net/core/dev.c b/net/core/dev.c
index 3c58db732761..1f51a55ff2b0 100644
--- a/net/core/dev.c
+++ b/net/core/dev.c
@@ -11289,6 +11289,21 @@ int __netdev_update_features(struct net_device *dev)
 
 	features = netdev_get_wanted_features(dev);
 
+	/* A direct HSR/PRP port needs per-frame metadata. Drop software
+	 * GRO and configurable GRO_HW from the request as well as from the
+	 * features passed to ndo_fix_features(): drivers such as veth
+	 * derive state from wanted_features and need the requested and the
+	 * active bit to agree. Fixed-on or driver-required GRO_HW is left
+	 * to the driver.
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
index a546f70f9cc8..4c4f8fe3d128 100644
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
@@ -137,6 +138,37 @@ static int hsr_check_dev_ok(struct net_device *dev,
 	return 0;
 }
 
+/* Member role and feature policy.
+ * Setting the role makes __netdev_update_features() clear GRO
+ * and configurable GRO_HW from the request and before
+ * ndo_fix_features(). A macvlan follows GRO on its lower device,
+ * which can turn it back on later. Only the role and feature
+ * update run under the device ops lock; unlink, promiscuous
+ * updates and the master recompute stay outside.
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
+	 * the request while the role was set and is not requested
+	 * again; the user can turn it back on with ethtool. A dying
+	 * device just drops the role, a netns move stays registered and
+	 * is recomputed.
+	 */
+	if (dev->reg_state == NETREG_REGISTERED)
+		netdev_change_features(dev);
+	netdev_unlock_ops(dev);
+}
+
 /* Setup device to be added to the HSR bridge. */
 static int hsr_portdev_setup(struct hsr_priv *hsr, struct net_device *dev,
 			     struct hsr_port *port,
@@ -169,6 +201,22 @@ static int hsr_portdev_setup(struct hsr_priv *hsr, struct net_device *dev,
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
@@ -177,7 +225,12 @@ static int hsr_portdev_setup(struct hsr_priv *hsr, struct net_device *dev,
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
@@ -253,6 +306,7 @@ void hsr_del_port(struct hsr_port *port)
 			eth_hw_addr_set(port->dev, port->original_macaddress);
 			call_netdevice_notifiers(NETDEV_CHANGEADDR, port->dev);
 		}
+		hsr_portdev_role_clear(port->dev);
 	}
 
 	kfree_rcu(port, rcu);
-- 
2.53.0

