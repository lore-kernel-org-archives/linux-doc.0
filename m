Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F15303E5ED5
	for <linux-doc@vger.kernel.org>; Wed, 18 Mar 2026 15:03:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773846205; cv=none; b=k17L5a44AbPregEuiTIDGbOcdjRZWM1cv5kwAq5gDY3QZP8+rZMXoLOwSRGbobYJYn3ZszYxHXk/S7Qo9RkzE840jOzFbm5t5/aPE5BD+UsTI0H7J1ykQ3Av5+/5bOG/t599gePio4Hdp+V4inCW2qpw2FyFFrnqpBI0BzGK/Io=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773846205; c=relaxed/simple;
	bh=kmwCimBJS+SWU8B61KoU5L9nhpuZjJHve7vQIDv7gNY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aRgd+2/lXjLXT6b68rRw+O3W5mT0L/g0U/MnefCSlNgfDB2tTYJZRyY+vNaYKheYmELppLaG07uHrGEgPZ0qAi+0jaZtffpUSYyAS83zkKYSJFHZ4hVo8hTaky76BWa5iBmSbaYO0+WomyS3R57evhedKT2eoNwk4KSi2fNy14k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fomichev.me; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fomichev.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-2beab594d8eso18446eec.0
        for <linux-doc@vger.kernel.org>; Wed, 18 Mar 2026 08:03:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773846202; x=1774451002;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yuVySmXB1N20uvWlkE4WXWJqrOPMyoG70opz84fOKRg=;
        b=VW+zIf6+DwMKfMj/reJSsJU6jCc8WLdHG+DHBIT+fegAPS28AByLbOAYtZy7uHfVEC
         ZlnSokXofW+hJYZCwZiGJDiInJ0Rq6GBdx2Q9wBL2VxjFD0Hd8K+6VvPkXvtfRcuKPiL
         ioVM21p8/ise2hBrePBvS2qGm/VedQeeEnjtDQbKtVn/P7Qsm+Bco2WQlLpXKXkz0a5u
         NRTNXiVKZGWUB8NFNLbfEfWp3Yy6ZfbbKpYxnKZ25BL/UG3WXDc0pss5lcGgSaKmGbhu
         XjITpNeus4biq0fZT018u1/lXJSfYdh3UtXfuHpHR/arBYxNKMdOZlYOxUV0Yfk+R07E
         Sr2Q==
X-Forwarded-Encrypted: i=1; AJvYcCWZMSkUVWpIrrzfwQPF4sMyp8p5wGJRBaQznrwrsIeyyOjJcd7Iug5nqAzkXwLfTWAfIBi0UJG9YP8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxLuf9DDCksaSZ3IdcFZJk0YhBM3UbhGwvKStJeOGq0nyOvB3Je
	+vMprPBpJwa7Oe5QSGHhYn+hLAkKu3fcoZpAFG+4s+RVOJULT/gcJwY=
X-Gm-Gg: ATEYQzyqsMxdzb8Z4ROjDPStn+3EuSfbmbWPzFqJUEUPwubZVckD7mfIN99G9FBdSmW
	NAGK4sy2csWWQtp4nzvuUp7vb2Ryn7Xlm+/1uf4qvRUglhHwNlvuEgu4lGuaw8uxCjfPJXKqFeD
	qmN3k2f8iqnSAL129KLx+hyd/jVPz1chV6Hvx0SL954IpKEQewHmVcD8ozbd3lmdAhDjAiLQfR+
	W0uunMT3QtYrqwdDXFkl5e1HWYX/uu0VLmtKgjzI3UPTNr8NJrcixtH9xhBVkLi+ZhLyaZo1hFQ
	3UmOZPUIdUuKRbLaRk9015JwRC7nTkkVgyWWnYBURigylyPH8hC3D/D5szcZG0K/Go7er72Q3F5
	ydkSGJA0KkJei45g4ObPrd2lCFOH0XHua2Qdfm51YqLgS0rdAI9D2es6tBrQnlPGCbY15/PVXyR
	eG2yJyX4+q9zh0p1Bf5x2Ai+Qpcdvx0aBAaZYPGcXahBg9UEAw0wLhUPG9/PcPRx0U5Ps06VQ13
	/80fpqBSe6EofSFug==
X-Received: by 2002:a05:7300:ec11:b0:2c0:c96a:a4db with SMTP id 5a478bee46e88-2c0e4f5b6b3mr1808937eec.4.1773846201496;
        Wed, 18 Mar 2026 08:03:21 -0700 (PDT)
Received: from localhost (c-76-102-12-149.hsd1.ca.comcast.net. [76.102.12.149])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c0e55ca0f6sm4007492eec.25.2026.03.18.08.03.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 08:03:20 -0700 (PDT)
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
Subject: [PATCH net-next v2 08/13] bnxt: use snapshot in bnxt_cfg_rx_mode
Date: Wed, 18 Mar 2026 08:03:00 -0700
Message-ID: <20260318150305.123900-9-sdf@fomichev.me>
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

With the introduction of ndo_set_rx_mode_async (as discussed in [0])
we can call bnxt_cfg_rx_mode directly. Convert bnxt_cfg_rx_mode to
use uc/mc snapshots and move its call in bnxt_sp_task to the
section that resets BNXT_STATE_IN_SP_TASK. Switch to direct call in
bnxt_set_rx_mode.

0: https://lore.kernel.org/netdev/CACKFLi=5vj8hPqEUKDd8RTw3au5G+zRgQEqjF+6NZnyoNm90KA@mail.gmail.com/

Cc: Michael Chan <michael.chan@broadcom.com>
Cc: Pavan Chebbi <pavan.chebbi@broadcom.com>
Signed-off-by: Stanislav Fomichev <sdf@fomichev.me>
---
 drivers/net/ethernet/broadcom/bnxt/bnxt.c | 24 ++++++++++++++---------
 1 file changed, 15 insertions(+), 9 deletions(-)

diff --git a/drivers/net/ethernet/broadcom/bnxt/bnxt.c b/drivers/net/ethernet/broadcom/bnxt/bnxt.c
index 225217b32e4b..ce430690efb5 100644
--- a/drivers/net/ethernet/broadcom/bnxt/bnxt.c
+++ b/drivers/net/ethernet/broadcom/bnxt/bnxt.c
@@ -11039,7 +11039,8 @@ static int bnxt_setup_nitroa0_vnic(struct bnxt *bp)
 	return rc;
 }
 
-static int bnxt_cfg_rx_mode(struct bnxt *);
+static int bnxt_cfg_rx_mode(struct bnxt *, struct netdev_hw_addr_list *,
+			    struct netdev_hw_addr_list *);
 static bool bnxt_mc_list_updated(struct bnxt *, u32 *,
 				 const struct netdev_hw_addr_list *);
 
@@ -11135,7 +11136,7 @@ static int bnxt_init_chip(struct bnxt *bp, bool irq_re_init)
 		vnic->rx_mask |= mask;
 	}
 
-	rc = bnxt_cfg_rx_mode(bp);
+	rc = bnxt_cfg_rx_mode(bp, &bp->dev->uc, &bp->dev->mc);
 	if (rc)
 		goto err_out;
 
@@ -13610,11 +13611,12 @@ static void bnxt_set_rx_mode(struct net_device *dev,
 	if (mask != vnic->rx_mask || uc_update || mc_update) {
 		vnic->rx_mask = mask;
 
-		bnxt_queue_sp_work(bp, BNXT_RX_MASK_SP_EVENT);
+		bnxt_cfg_rx_mode(bp, uc, mc);
 	}
 }
 
-static int bnxt_cfg_rx_mode(struct bnxt *bp)
+static int bnxt_cfg_rx_mode(struct bnxt *bp, struct netdev_hw_addr_list *uc,
+			    struct netdev_hw_addr_list *mc)
 {
 	struct net_device *dev = bp->dev;
 	struct bnxt_vnic_info *vnic = &bp->vnic_info[BNXT_VNIC_DEFAULT];
@@ -13623,7 +13625,7 @@ static int bnxt_cfg_rx_mode(struct bnxt *bp)
 	bool uc_update;
 
 	netif_addr_lock_bh(dev);
-	uc_update = bnxt_uc_list_updated(bp, &dev->uc);
+	uc_update = bnxt_uc_list_updated(bp, uc);
 	netif_addr_unlock_bh(dev);
 
 	if (!uc_update)
@@ -13642,7 +13644,7 @@ static int bnxt_cfg_rx_mode(struct bnxt *bp)
 	if (netdev_uc_count(dev) > (BNXT_MAX_UC_ADDRS - 1)) {
 		vnic->rx_mask |= CFA_L2_SET_RX_MASK_REQ_MASK_PROMISCUOUS;
 	} else {
-		netdev_for_each_uc_addr(ha, dev) {
+		netdev_hw_addr_list_for_each(ha, uc) {
 			memcpy(vnic->uc_list + off, ha->addr, ETH_ALEN);
 			off += ETH_ALEN;
 			vnic->uc_filter_count++;
@@ -14600,6 +14602,7 @@ static void bnxt_ulp_restart(struct bnxt *bp)
 static void bnxt_sp_task(struct work_struct *work)
 {
 	struct bnxt *bp = container_of(work, struct bnxt, sp_task);
+	struct net_device *dev = bp->dev;
 
 	set_bit(BNXT_STATE_IN_SP_TASK, &bp->state);
 	smp_mb__after_atomic();
@@ -14613,9 +14616,6 @@ static void bnxt_sp_task(struct work_struct *work)
 		bnxt_reenable_sriov(bp);
 	}
 
-	if (test_and_clear_bit(BNXT_RX_MASK_SP_EVENT, &bp->sp_event))
-		bnxt_cfg_rx_mode(bp);
-
 	if (test_and_clear_bit(BNXT_RX_NTP_FLTR_SP_EVENT, &bp->sp_event))
 		bnxt_cfg_ntp_filters(bp);
 	if (test_and_clear_bit(BNXT_HWRM_EXEC_FWD_REQ_SP_EVENT, &bp->sp_event))
@@ -14680,6 +14680,12 @@ static void bnxt_sp_task(struct work_struct *work)
 	/* These functions below will clear BNXT_STATE_IN_SP_TASK.  They
 	 * must be the last functions to be called before exiting.
 	 */
+	if (test_and_clear_bit(BNXT_RX_MASK_SP_EVENT, &bp->sp_event)) {
+		bnxt_lock_sp(bp);
+		bnxt_cfg_rx_mode(bp, &dev->uc, &dev->mc);
+		bnxt_unlock_sp(bp);
+	}
+
 	if (test_and_clear_bit(BNXT_RESET_TASK_SP_EVENT, &bp->sp_event))
 		bnxt_reset(bp, false);
 
-- 
2.53.0

