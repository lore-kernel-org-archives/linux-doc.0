Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B9E73E1D0F
	for <linux-doc@vger.kernel.org>; Wed, 18 Mar 2026 15:03:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773846200; cv=none; b=fSwwAvk7NM6w3rZWK2UDzKDQsenS9L2cieNzijdI83tVrfnECeab6XjX1XsCin/f37CbdQAzISXbeuQT76LQvu9P5eZb4o2ZTHrkJnp9tDvvSp7YhgON5+ou6uB3hAipQZFwdMof+hKXAXtICNSkRHptTvvcj6B7KmUB0FuFwEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773846200; c=relaxed/simple;
	bh=4NH5F9UrZZRv67H096Ecg+wmusilA5EZ4o5TxZuzEHw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AmWRl72FXu37MpNkgVcuTfUnu7LKfqBQDe3EPiufjkbiILecSg+xAtgY3m/WTzp+k9/+z2OjIjF85Z19c4KUbZT5nFD5pRVcI0MjnjM6yxlNKcvtjAwxl1dqy3BwzhnpqrE4/aEAI8awnGN8eLhlSVxQ0frPa8nANiC3hvEE7eY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fomichev.me; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.82.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fomichev.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-12732e6a123so2419409c88.1
        for <linux-doc@vger.kernel.org>; Wed, 18 Mar 2026 08:03:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773846194; x=1774450994;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=N5GGovMWPDFF8AAhYqWq6WCuZYPSvbfMRDbyACSGUuM=;
        b=D49SoZMjwgtrZ582tT2/VkVyqgXvW0e3Stt1uI77qr5bhoebVePSKcFBz7iQTYhnpA
         fe4QaIrW0r4XN7Nb1yAY5MHNUDN5R2D1uNNrud2wqFzacQZxzwcaos6SQC0T0DkKyjpa
         COYEKGeq1Ehnk7WDjPIE2Q9v+t+5/2cHTXiqah0QNb1RWlemm3gdek+GOIrYz89cMRji
         vCrcwYv7lhnxCN95TQjvJcWdg61oBHjuf/UqL/4RyM0AbC0W5xJ9dxqXFhWT838HSDTr
         AoPytQw2yvzc8kjZcCDypj5FkLBKPsTYLdARMGmGj4rR0wdhLCPnoPe5py6ru083fMas
         Wp/w==
X-Forwarded-Encrypted: i=1; AJvYcCVoc1qMm01rPF+YqG1m2yoXxurTcqFz0yHyzXuO1Pjm0Q2iMu0YetSVH7tz6Qm9l3xJPYMHHW28Wf4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyHzv+k89e/AcrYfGohLbBRXgcE9y7UQ3RCCmCtUBFEVuR0w6SW
	N5DigqKXGLwrO1fsrHAIgIb6WGcu4U1OF6Tf9zEBdDJMvwxS1XlMQwo=
X-Gm-Gg: ATEYQzzwa9rT0PafYAt0WKNDG3SpnsO6aEtCHBTy26wDKiPGIuA+bacDCU+gBu+m8vt
	/9K0tW9uHcgFVUo5HNxr+fj1H/0Vde2JN5uBPouHzHt5DUj81qAGYes/d4oWaVaRMfGDmgSPmjh
	5JYSKIQL2qxTdtnzpGNPB55vhAo4wyCfn+pLFeYuk80t1AdW0IwvR3b/j0jOtaJXBnvI2IbZwaw
	OHueOZ9xxw9yVMeR1Ak+OViieAkdWxBsZBphShWez3CyfSKM9P2zMD7mfudRb94SR9sfMLUaxS0
	BHsmNkXpXNpm+oLGx/DlcWmmSWT7dQBywE7Bhyk/Z7I5zSwHgn5Yx/aqPXZTM022RLq5Chh+6Qp
	3dF8vY81S/W+vtQzKtuGH0i6MLaOnwWtCoLiWH/phEQZMdueOxs77ubGM/xHHMVbuU3+r1NHYI4
	K81WN9ZQUu+FUwCxkyNkMalj/UFmaYxKx0o1uuyFS5RK2a4XnUNUnhJr8k7SSbaqCPhbZmpv9F7
	G13Gsv5JDbCNmUUUVekJQmbx+hT
X-Received: by 2002:a05:7301:1691:b0:2bd:d3f3:b0be with SMTP id 5a478bee46e88-2c0e503eb7bmr2177414eec.20.1773846193273;
        Wed, 18 Mar 2026 08:03:13 -0700 (PDT)
Received: from localhost (c-76-102-12-149.hsd1.ca.comcast.net. [76.102.12.149])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c0e5582dd5sm4001338eec.15.2026.03.18.08.03.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 08:03:12 -0700 (PDT)
From: Stanislav Fomichev <sdf@fomichev.me>
To: netdev@vger.kernel.org
Cc: davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	andrew+netdev@lunn.ch,
	michael.chan@broadcom.com,
	pavan.chebbi@broadcom.com,
	anthony.l.nguyen@intel.com,
	przemyslaw.kitszel@intel.com,
	saeedm@nvidia.com,
	tariqt@nvidia.com,
	mbloch@nvidia.com,
	alexanderduyck@fb.com,
	kernel-team@meta.com,
	johannes@sipsolutions.net,
	sd@queasysnail.net,
	jianbol@nvidia.com,
	dtatulea@nvidia.com,
	sdf@fomichev.me,
	mohsin.bashr@gmail.com,
	jacob.e.keller@intel.com,
	willemb@google.com,
	skhawaja@google.com,
	bestswngs@gmail.com,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	intel-wired-lan@lists.osuosl.org,
	linux-rdma@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	leon@kernel.org
Subject: [PATCH net-next v2 04/13] net: move promiscuity handling into dev_rx_mode_work
Date: Wed, 18 Mar 2026 08:02:56 -0700
Message-ID: <20260318150305.123900-5-sdf@fomichev.me>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260318150305.123900-1-sdf@fomichev.me>
References: <20260318150305.123900-1-sdf@fomichev.me>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move unicast promiscuity tracking into dev_rx_mode_work so it runs
under netdev_ops_lock instead of under the addr_lock spinlock. This
is required because __dev_set_promiscuity calls dev_change_rx_flags
and __dev_notify_flags, both of which may need to sleep.

Change ASSERT_RTNL() to netdev_ops_assert_locked() in
__dev_set_promiscuity, netif_set_allmulti and __dev_change_flags
since these are now called from the work queue under the ops lock.

Signed-off-by: Stanislav Fomichev <sdf@fomichev.me>
---
 Documentation/networking/netdevices.rst |  4 ++
 net/core/dev.c                          | 79 +++++++++++++++++--------
 2 files changed, 57 insertions(+), 26 deletions(-)

diff --git a/Documentation/networking/netdevices.rst b/Documentation/networking/netdevices.rst
index dc83d78d3b27..5cdaa1a3dcc8 100644
--- a/Documentation/networking/netdevices.rst
+++ b/Documentation/networking/netdevices.rst
@@ -298,6 +298,10 @@ struct net_device synchronization rules
 	Notes: Sleepable version of ndo_set_rx_mode. Receives snapshots
 	of the unicast and multicast address lists.
 
+ndo_change_rx_flags:
+	Synchronization: rtnl_lock() semaphore. In addition, netdev instance
+	lock if the driver implements queue management or shaper API.
+
 ndo_setup_tc:
 	``TC_SETUP_BLOCK`` and ``TC_SETUP_FT`` are running under NFT locks
 	(i.e. no ``rtnl_lock`` and no device instance lock). The rest of
diff --git a/net/core/dev.c b/net/core/dev.c
index 77fdbe836754..d50d6dc6ac1f 100644
--- a/net/core/dev.c
+++ b/net/core/dev.c
@@ -9574,7 +9574,7 @@ static int __dev_set_promiscuity(struct net_device *dev, int inc, bool notify)
 	kuid_t uid;
 	kgid_t gid;
 
-	ASSERT_RTNL();
+	netdev_ops_assert_locked(dev);
 
 	promiscuity = dev->promiscuity + inc;
 	if (promiscuity == 0) {
@@ -9610,16 +9610,8 @@ static int __dev_set_promiscuity(struct net_device *dev, int inc, bool notify)
 
 		dev_change_rx_flags(dev, IFF_PROMISC);
 	}
-	if (notify) {
-		/* The ops lock is only required to ensure consistent locking
-		 * for `NETDEV_CHANGE` notifiers. This function is sometimes
-		 * called without the lock, even for devices that are ops
-		 * locked, such as in `dev_uc_sync_multiple` when using
-		 * bonding or teaming.
-		 */
-		netdev_ops_assert_locked(dev);
+	if (notify)
 		__dev_notify_flags(dev, old_flags, IFF_PROMISC, 0, NULL);
-	}
 	return 0;
 }
 
@@ -9641,7 +9633,7 @@ int netif_set_allmulti(struct net_device *dev, int inc, bool notify)
 	unsigned int old_flags = dev->flags, old_gflags = dev->gflags;
 	unsigned int allmulti, flags;
 
-	ASSERT_RTNL();
+	netdev_ops_assert_locked(dev);
 
 	allmulti = dev->allmulti + inc;
 	if (allmulti == 0) {
@@ -9671,12 +9663,36 @@ int netif_set_allmulti(struct net_device *dev, int inc, bool notify)
 	return 0;
 }
 
+/**
+ * dev_uc_promisc_update() - evaluate whether uc_promisc should be toggled.
+ * @dev: device
+ *
+ * Must be called under netif_addr_lock_bh.
+ * Return: +1 to enter promisc, -1 to leave, 0 for no change.
+ */
+static int dev_uc_promisc_update(struct net_device *dev)
+{
+	if (dev->priv_flags & IFF_UNICAST_FLT)
+		return 0;
+
+	if (!netdev_uc_empty(dev) && !dev->uc_promisc) {
+		dev->uc_promisc = true;
+		return 1;
+	}
+	if (netdev_uc_empty(dev) && dev->uc_promisc) {
+		dev->uc_promisc = false;
+		return -1;
+	}
+	return 0;
+}
+
 static void dev_rx_mode_work(struct work_struct *work)
 {
 	struct net_device *dev = container_of(work, struct net_device,
 					      rx_mode_work);
 	struct netdev_hw_addr_list uc_snap, mc_snap, uc_ref, mc_ref;
 	const struct net_device_ops *ops = dev->netdev_ops;
+	int promisc_inc;
 	int err;
 
 	__hw_addr_init(&uc_snap);
@@ -9704,15 +9720,28 @@ static void dev_rx_mode_work(struct work_struct *work)
 		if (!err)
 			err = __hw_addr_list_snapshot(&mc_ref, &dev->mc,
 						      dev->addr_len);
-		netif_addr_unlock_bh(dev);
 
 		if (err) {
 			__hw_addr_flush(&uc_snap);
 			__hw_addr_flush(&uc_ref);
 			__hw_addr_flush(&mc_snap);
+			netif_addr_unlock_bh(dev);
 			goto out;
 		}
 
+		promisc_inc = dev_uc_promisc_update(dev);
+
+		netif_addr_unlock_bh(dev);
+	} else {
+		netif_addr_lock_bh(dev);
+		promisc_inc = dev_uc_promisc_update(dev);
+		netif_addr_unlock_bh(dev);
+	}
+
+	if (promisc_inc)
+		__dev_set_promiscuity(dev, promisc_inc, false);
+
+	if (ops->ndo_set_rx_mode_async) {
 		ops->ndo_set_rx_mode_async(dev, &uc_snap, &mc_snap);
 
 		netif_addr_lock_bh(dev);
@@ -9721,6 +9750,10 @@ static void dev_rx_mode_work(struct work_struct *work)
 		__hw_addr_list_reconcile(&dev->mc, &mc_snap,
 					 &mc_ref, dev->addr_len);
 		netif_addr_unlock_bh(dev);
+	} else if (ops->ndo_set_rx_mode) {
+		netif_addr_lock_bh(dev);
+		ops->ndo_set_rx_mode(dev);
+		netif_addr_unlock_bh(dev);
 	}
 
 out:
@@ -9739,28 +9772,22 @@ static void dev_rx_mode_work(struct work_struct *work)
 void __dev_set_rx_mode(struct net_device *dev)
 {
 	const struct net_device_ops *ops = dev->netdev_ops;
+	int promisc_inc;
 
 	/* dev_open will call this function so the list will stay sane. */
 	if (!netif_up_and_present(dev))
 		return;
 
-	if (ops->ndo_set_rx_mode_async) {
+	if (ops->ndo_set_rx_mode_async || ops->ndo_change_rx_flags) {
 		queue_work(rx_mode_wq, &dev->rx_mode_work);
 		return;
 	}
 
-	if (!(dev->priv_flags & IFF_UNICAST_FLT)) {
-		/* Unicast addresses changes may only happen under the rtnl,
-		 * therefore calling __dev_set_promiscuity here is safe.
-		 */
-		if (!netdev_uc_empty(dev) && !dev->uc_promisc) {
-			__dev_set_promiscuity(dev, 1, false);
-			dev->uc_promisc = true;
-		} else if (netdev_uc_empty(dev) && dev->uc_promisc) {
-			__dev_set_promiscuity(dev, -1, false);
-			dev->uc_promisc = false;
-		}
-	}
+	/* Legacy path for non-ops locked HW devices. */
+
+	promisc_inc = dev_uc_promisc_update(dev);
+	if (promisc_inc)
+		__dev_set_promiscuity(dev, promisc_inc, false);
 
 	if (ops->ndo_set_rx_mode)
 		ops->ndo_set_rx_mode(dev);
@@ -9810,7 +9837,7 @@ int __dev_change_flags(struct net_device *dev, unsigned int flags,
 	unsigned int old_flags = dev->flags;
 	int ret;
 
-	ASSERT_RTNL();
+	netdev_ops_assert_locked(dev);
 
 	/*
 	 *	Set the flags on our device.
-- 
2.53.0

