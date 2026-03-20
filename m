Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B3C62DF142
	for <linux-doc@vger.kernel.org>; Fri, 20 Mar 2026 01:25:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773969913; cv=none; b=JPYTAd1Amzz1f9Dm5L+N8JOH43wo2/4wbCMeVtSPqL41BEHFTpE6ENJffCd0kfnaZWo+srsZMFxRMmDGKVjA9C+VmBnbvdTkTKfCvSL0g2kLimoufErlEU8wJtOTr3Aog/FxbRtN0CKA2MIyd+kx6g3YfQFkFJ/RM76rxlOc/io=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773969913; c=relaxed/simple;
	bh=tlKgbNIWgXjZ/slb5MPH0/mHqdsJA6vJ0LluTcLD1PQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Y2MKgMMbY3PkqHzWcZpUPcGOEjUzPbrOqCQLKlMsxKSQNfJ65z7fbEumXFhCimBM05xTOz/GLR4Fd7j6bqo71dFJanQO1L3bM/V9PgsFxN5oarUrJVhU+pi5++cw//gYEIN5iUfwVDNbqWJOnYQUbSfEQXbMqjJ61whWFjJI970=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fomichev.me; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.82.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fomichev.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-12732e6a123so2874788c88.1
        for <linux-doc@vger.kernel.org>; Thu, 19 Mar 2026 18:25:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773969910; x=1774574710;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IJxOxbLkNxTNWsN6hAmdg1mKxCY8QyUuCBIp5EpuSIA=;
        b=Ezd9embezZOmQabsSJ4Is/7xdoVAre3McQc1ONMvtwiTS2ZFbtmCC/ZkSmBkVTCoKi
         7j5gKPWsli7TDbiRESQfK/0AZsv5CDQ8ToHPCkZ92HMvgyGORBWGSNFCVHd+r3BeKGOi
         2GvTqhzWePrwJP/oVxeXqfQJrKOQiRgIyigQrwMWB1rAz9DRWBBXj7ZhedJnoWQrGCLp
         LGwAiQ1gb++qW14eHimCJvzsqD64UG8vFoc+ABAbYR/eehVgSXmiam6aH1ljujGgm1wN
         T3QHu1SevstO39O2vlLL9jlAVWPq3GGN4h9bfMXzUxSNye5mnN+jIjbEQfT+Bv1nhBB/
         GDkg==
X-Forwarded-Encrypted: i=1; AJvYcCV6qEanmTquhdZNXJ1nTDFqNgTwCTPC8NJOQMJTgkWFWuMaWfUYnChtTuD9WZUmqLlWy29tx6CTURk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2PMpGIfddP71X4wkLpnCCW3T5DlkptFiTMKYARwFi/7u2O2B4
	4DoW0u2RQ7SaKGyS/vh7PfhgEaKgOrUD9nnPGhTVojHGUviWfxziTKo=
X-Gm-Gg: ATEYQzwXaUCaTbFCwuTRbG9ho8JvKt5D2mF7nGtnpT9AkPnRd0egrNqfYqTYFSt07kH
	h1Awv/AWHtpS0HCDqdk1XskNp8ceoqXBvqYvikAwT717jniL4v2mhsEAAudM/af4yJatmGsAzdY
	lIHWH4RbdXic5Rwt0XK9vCuuCnk7h2B04JtVCzgl8Uo+F91mYY/BM7d2Rrl2fOOIvBLvhWWYZbV
	kjDievMQ38cANfamXLELYRebg1eolvcdKdP2vR+FMUmjOLEZdDsbcpcNtHF6PW4yZCorsqADtyi
	oRHYYBWzf40uLT/WhuqiW04TQslC/8j7q55B20XvhrgB2BP1fdmMMH0ZWXSPZy70CW5crA5hLUf
	k/p3UCEB3T+d1CJsavdO92oxLhhtP+HhrT6Hib4vKgliDGpX0b5j18MvZDdKfy7+B3OWFMfBoxW
	Eomy3rVl9Swul5hT/1iVhPIeJgPjPA5O3lSATriTxph+Gg6gzNcTVvxIwBQgszGCdI3Ur18jBDW
	IQG/dv7V/Qb5YmaCA==
X-Received: by 2002:a05:7022:fa1:b0:123:2d38:929a with SMTP id a92af1059eb24-12a726f86c3mr611130c88.38.1773969909296;
        Thu, 19 Mar 2026 18:25:09 -0700 (PDT)
Received: from localhost (c-76-102-12-149.hsd1.ca.comcast.net. [76.102.12.149])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c10b17a7c1sm1191627eec.7.2026.03.19.18.25.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 18:25:08 -0700 (PDT)
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
	aleksandr.loktionov@intel.com,
	kees@kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	intel-wired-lan@lists.osuosl.org,
	linux-rdma@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	leon@kernel.org
Subject: [PATCH net-next v3 05/13] fbnic: convert to ndo_set_rx_mode_async
Date: Thu, 19 Mar 2026 18:24:53 -0700
Message-ID: <20260320012501.2033548-6-sdf@fomichev.me>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260320012501.2033548-1-sdf@fomichev.me>
References: <20260320012501.2033548-1-sdf@fomichev.me>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert fbnic from ndo_set_rx_mode to ndo_set_rx_mode_async. The
driver's __fbnic_set_rx_mode() now takes explicit uc/mc list
parameters and uses __hw_addr_sync_dev() on the snapshots instead
of __dev_uc_sync/__dev_mc_sync on the netdev directly.

Update callers in fbnic_up, fbnic_fw_config_after_crash,
fbnic_bmc_rpc_check and fbnic_set_mac to pass the real address
lists calling __fbnic_set_rx_mode outside the async work path.

Cc: Alexander Duyck <alexanderduyck@fb.com>
Cc: kernel-team@meta.com
Reviewed-by: Aleksandr Loktionov <aleksandr.loktionov@intel.com>
Signed-off-by: Stanislav Fomichev <sdf@fomichev.me>
---
 .../net/ethernet/meta/fbnic/fbnic_netdev.c    | 20 ++++++++++++-------
 .../net/ethernet/meta/fbnic/fbnic_netdev.h    |  4 +++-
 drivers/net/ethernet/meta/fbnic/fbnic_pci.c   |  4 ++--
 drivers/net/ethernet/meta/fbnic/fbnic_rpc.c   |  2 +-
 4 files changed, 19 insertions(+), 11 deletions(-)

diff --git a/drivers/net/ethernet/meta/fbnic/fbnic_netdev.c b/drivers/net/ethernet/meta/fbnic/fbnic_netdev.c
index b4b396ca9bce..c406a3b56b37 100644
--- a/drivers/net/ethernet/meta/fbnic/fbnic_netdev.c
+++ b/drivers/net/ethernet/meta/fbnic/fbnic_netdev.c
@@ -183,7 +183,9 @@ static int fbnic_mc_unsync(struct net_device *netdev, const unsigned char *addr)
 	return ret;
 }
 
-void __fbnic_set_rx_mode(struct fbnic_dev *fbd)
+void __fbnic_set_rx_mode(struct fbnic_dev *fbd,
+			 struct netdev_hw_addr_list *uc,
+			 struct netdev_hw_addr_list *mc)
 {
 	bool uc_promisc = false, mc_promisc = false;
 	struct net_device *netdev = fbd->netdev;
@@ -213,10 +215,10 @@ void __fbnic_set_rx_mode(struct fbnic_dev *fbd)
 	}
 
 	/* Synchronize unicast and multicast address lists */
-	err = __dev_uc_sync(netdev, fbnic_uc_sync, fbnic_uc_unsync);
+	err = __hw_addr_sync_dev(uc, netdev, fbnic_uc_sync, fbnic_uc_unsync);
 	if (err == -ENOSPC)
 		uc_promisc = true;
-	err = __dev_mc_sync(netdev, fbnic_mc_sync, fbnic_mc_unsync);
+	err = __hw_addr_sync_dev(mc, netdev, fbnic_mc_sync, fbnic_mc_unsync);
 	if (err == -ENOSPC)
 		mc_promisc = true;
 
@@ -238,18 +240,21 @@ void __fbnic_set_rx_mode(struct fbnic_dev *fbd)
 	fbnic_write_tce_tcam(fbd);
 }
 
-static void fbnic_set_rx_mode(struct net_device *netdev)
+static void fbnic_set_rx_mode(struct net_device *netdev,
+			      struct netdev_hw_addr_list *uc,
+			      struct netdev_hw_addr_list *mc)
 {
 	struct fbnic_net *fbn = netdev_priv(netdev);
 	struct fbnic_dev *fbd = fbn->fbd;
 
 	/* No need to update the hardware if we are not running */
 	if (netif_running(netdev))
-		__fbnic_set_rx_mode(fbd);
+		__fbnic_set_rx_mode(fbd, uc, mc);
 }
 
 static int fbnic_set_mac(struct net_device *netdev, void *p)
 {
+	struct fbnic_net *fbn = netdev_priv(netdev);
 	struct sockaddr *addr = p;
 
 	if (!is_valid_ether_addr(addr->sa_data))
@@ -257,7 +262,8 @@ static int fbnic_set_mac(struct net_device *netdev, void *p)
 
 	eth_hw_addr_set(netdev, addr->sa_data);
 
-	fbnic_set_rx_mode(netdev);
+	if (netif_running(netdev))
+		__fbnic_set_rx_mode(fbn->fbd, &netdev->uc, &netdev->mc);
 
 	return 0;
 }
@@ -551,7 +557,7 @@ static const struct net_device_ops fbnic_netdev_ops = {
 	.ndo_features_check	= fbnic_features_check,
 	.ndo_set_mac_address	= fbnic_set_mac,
 	.ndo_change_mtu		= fbnic_change_mtu,
-	.ndo_set_rx_mode	= fbnic_set_rx_mode,
+	.ndo_set_rx_mode_async	= fbnic_set_rx_mode,
 	.ndo_get_stats64	= fbnic_get_stats64,
 	.ndo_bpf		= fbnic_bpf,
 	.ndo_hwtstamp_get	= fbnic_hwtstamp_get,
diff --git a/drivers/net/ethernet/meta/fbnic/fbnic_netdev.h b/drivers/net/ethernet/meta/fbnic/fbnic_netdev.h
index 9129a658f8fa..eded20b0e9e4 100644
--- a/drivers/net/ethernet/meta/fbnic/fbnic_netdev.h
+++ b/drivers/net/ethernet/meta/fbnic/fbnic_netdev.h
@@ -97,7 +97,9 @@ void fbnic_time_init(struct fbnic_net *fbn);
 int fbnic_time_start(struct fbnic_net *fbn);
 void fbnic_time_stop(struct fbnic_net *fbn);
 
-void __fbnic_set_rx_mode(struct fbnic_dev *fbd);
+void __fbnic_set_rx_mode(struct fbnic_dev *fbd,
+			 struct netdev_hw_addr_list *uc,
+			 struct netdev_hw_addr_list *mc);
 void fbnic_clear_rx_mode(struct fbnic_dev *fbd);
 
 void fbnic_phylink_get_pauseparam(struct net_device *netdev,
diff --git a/drivers/net/ethernet/meta/fbnic/fbnic_pci.c b/drivers/net/ethernet/meta/fbnic/fbnic_pci.c
index e3aebbe3656d..6b139cf54256 100644
--- a/drivers/net/ethernet/meta/fbnic/fbnic_pci.c
+++ b/drivers/net/ethernet/meta/fbnic/fbnic_pci.c
@@ -135,7 +135,7 @@ void fbnic_up(struct fbnic_net *fbn)
 
 	fbnic_rss_reinit_hw(fbn->fbd, fbn);
 
-	__fbnic_set_rx_mode(fbn->fbd);
+	__fbnic_set_rx_mode(fbn->fbd, &fbn->netdev->uc, &fbn->netdev->mc);
 
 	/* Enable Tx/Rx processing */
 	fbnic_napi_enable(fbn);
@@ -180,7 +180,7 @@ static int fbnic_fw_config_after_crash(struct fbnic_dev *fbd)
 	}
 
 	fbnic_rpc_reset_valid_entries(fbd);
-	__fbnic_set_rx_mode(fbd);
+	__fbnic_set_rx_mode(fbd, &fbd->netdev->uc, &fbd->netdev->mc);
 
 	return 0;
 }
diff --git a/drivers/net/ethernet/meta/fbnic/fbnic_rpc.c b/drivers/net/ethernet/meta/fbnic/fbnic_rpc.c
index 42a186db43ea..fe95b6f69646 100644
--- a/drivers/net/ethernet/meta/fbnic/fbnic_rpc.c
+++ b/drivers/net/ethernet/meta/fbnic/fbnic_rpc.c
@@ -244,7 +244,7 @@ void fbnic_bmc_rpc_check(struct fbnic_dev *fbd)
 
 	if (fbd->fw_cap.need_bmc_tcam_reinit) {
 		fbnic_bmc_rpc_init(fbd);
-		__fbnic_set_rx_mode(fbd);
+		__fbnic_set_rx_mode(fbd, &fbd->netdev->uc, &fbd->netdev->mc);
 		fbd->fw_cap.need_bmc_tcam_reinit = false;
 	}
 
-- 
2.53.0

