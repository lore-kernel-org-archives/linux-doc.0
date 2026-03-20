Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 903072FE071
	for <linux-doc@vger.kernel.org>; Fri, 20 Mar 2026 01:25:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773969917; cv=none; b=h2HmM2hby/EeYgWuGHU+8hzLNW5NajkGwMHLWsXSmPVAsSizx6OUXReya2StpUDhgaFKCTGthUFWAynONqD1SlArE6LBRdyaaXOWWVDxPyoI5F8AzUq05yr4dGyQ4OYaF1JgPHC25DSDS8BG7gKdcrt+rR/BN4ieRSx5dFQnbks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773969917; c=relaxed/simple;
	bh=tpq4CPEg4PF7xY4vX/qaHiEsjc2ICDqk3bHyi4H6/ME=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qGRyfiMoWRQoDNPsfKqI8/+NS0ssoegpie5MKyYOgiGQ3bNAzgT09Q4dybCOapIf/cQF6uHUnMA7NJ2b3sDc+t+JsqKv8H6TnY1e9y1ZppeyB7eIgUmdq6aEBw3uIn9Oh7O2tUuAZr7QnY6s27te0kyXVl5Wx8GlNB+4DX8rHh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fomichev.me; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.82.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fomichev.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-12a695044a4so2685037c88.0
        for <linux-doc@vger.kernel.org>; Thu, 19 Mar 2026 18:25:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773969914; x=1774574714;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZI1/cLnyDnVOs4qvF1/y00bhWF98dmH7Q3P7jVrTCz8=;
        b=eFvyLM2WLbptvPVsle5JA78zKuxxgpCsZI4zcLt6nuRKhyIgbf6UCqdLcD+pOGrxvl
         pRopCcDLhJxX9O9iq0mQziMYRMCM6rtSBlzBAnwQKXA4x9JHyjR49zBMuOgjNOA24szq
         u7wuEnnlS1Q34Rt6nugzs0JsYGu7ksycDIGdx5pq7GwfMRmeq0ACvJou+QnRUZYzBZHk
         AN2xbmKhywKOCb5WmcUmjjXcjTL4I+bjPGilKJmUwcqc3W+k49qkQbiCq48B5u1gcSim
         NwAhcT3rGWs2bPm1afFi5X716QV7GhbRefQU/jRAsFH/qtCmh3Vrmrt9Vu0/BNp9VczG
         rPGQ==
X-Forwarded-Encrypted: i=1; AJvYcCWrnM1xEUIqlZmKYUYRsTvb+wB28+1vxi7CEUtmUa8VqjAh+GmF5rVIOr1fA2PUQ7efZOqcfJ03i8E=@vger.kernel.org
X-Gm-Message-State: AOJu0YwXJOKgWxfmXphUQiECbD5QLGN4UDG9IJelmg4auYyNMBVML9gM
	OSSwM9y5/W+7rxn0VD+WJ2Q9pKtROgDIb1w4ShXp//lah+i/uzScez8=
X-Gm-Gg: ATEYQzzwxQJGm8NEO9t3N1Ph0Wmx94QemkszfTaXh12nWb8ZWmNEamHFJiOEU0U/ste
	cnmzPPnVkCxaiFD1N8lCU9Ao1UZCzrdWh8BPmcvBIfRDL84OVkom8jw58pSwlWOrFfDni2CBMaF
	0zxE9/mxhCS3hvNDE8NyaejQtKy+7mBmiwXQ165gUkTH5bbKHTZOt0BLuYF5awWuWx2hTf6C6Ik
	k0MPnBWSCnpZ5fqLRCMr6hqvYZT+oJAiYW/rlQ24YIn3ZBw0mVW/IXZrhQeDx9a+cP8rB8cEoPy
	xn9sl63dxA+30QhG5wXZoHzGpG6igCVMYZf6rVQJvnl3MyEN8d5hVX28Pa8IZBu8xMEXLjEiFt5
	h/Qo1vLbOlXE7kg+7VsnbS6gAeUUESm8gcUw0GBnPliM1Ov1WlFL8OmZdKhEB+wvGaVfkUmdk2T
	emsgoZW/XRKcjdMU7+loWVwMv5PXJ6mqv9etA0vuX1hDGhmTbiuNc91+CyE3RO4Uxeqkgq4RsnV
	f3n5aIj3FGd3IIWZr3i8K0qMVPO
X-Received: by 2002:a05:7022:2227:b0:128:ce44:be8f with SMTP id a92af1059eb24-12a726572c7mr659849c88.2.1773969914275;
        Thu, 19 Mar 2026 18:25:14 -0700 (PDT)
Received: from localhost (c-76-102-12-149.hsd1.ca.comcast.net. [76.102.12.149])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12a733dd8c0sm761096c88.5.2026.03.19.18.25.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 18:25:13 -0700 (PDT)
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
Subject: [PATCH net-next v3 09/13] iavf: convert to ndo_set_rx_mode_async
Date: Thu, 19 Mar 2026 18:24:57 -0700
Message-ID: <20260320012501.2033548-10-sdf@fomichev.me>
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

Convert iavf from ndo_set_rx_mode to ndo_set_rx_mode_async.
iavf_set_rx_mode now takes explicit uc/mc list parameters and
uses __hw_addr_sync_dev on the snapshots instead of __dev_uc_sync
and __dev_mc_sync.

The iavf_configure internal caller passes the real lists directly.

Cc: Tony Nguyen <anthony.l.nguyen@intel.com>
Cc: Przemek Kitszel <przemyslaw.kitszel@intel.com>
Signed-off-by: Stanislav Fomichev <sdf@fomichev.me>
---
 drivers/net/ethernet/intel/iavf/iavf_main.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/net/ethernet/intel/iavf/iavf_main.c b/drivers/net/ethernet/intel/iavf/iavf_main.c
index 7925ee152c76..6632d35ad0fe 100644
--- a/drivers/net/ethernet/intel/iavf/iavf_main.c
+++ b/drivers/net/ethernet/intel/iavf/iavf_main.c
@@ -1147,14 +1147,18 @@ bool iavf_promiscuous_mode_changed(struct iavf_adapter *adapter)
 /**
  * iavf_set_rx_mode - NDO callback to set the netdev filters
  * @netdev: network interface device structure
+ * @uc: snapshot of uc address list
+ * @mc: snapshot of mc address list
  **/
-static void iavf_set_rx_mode(struct net_device *netdev)
+static void iavf_set_rx_mode(struct net_device *netdev,
+			     struct netdev_hw_addr_list *uc,
+			     struct netdev_hw_addr_list *mc)
 {
 	struct iavf_adapter *adapter = netdev_priv(netdev);
 
 	spin_lock_bh(&adapter->mac_vlan_list_lock);
-	__dev_uc_sync(netdev, iavf_addr_sync, iavf_addr_unsync);
-	__dev_mc_sync(netdev, iavf_addr_sync, iavf_addr_unsync);
+	__hw_addr_sync_dev(uc, netdev, iavf_addr_sync, iavf_addr_unsync);
+	__hw_addr_sync_dev(mc, netdev, iavf_addr_sync, iavf_addr_unsync);
 	spin_unlock_bh(&adapter->mac_vlan_list_lock);
 
 	spin_lock_bh(&adapter->current_netdev_promisc_flags_lock);
@@ -1207,7 +1211,7 @@ static void iavf_configure(struct iavf_adapter *adapter)
 	struct net_device *netdev = adapter->netdev;
 	int i;
 
-	iavf_set_rx_mode(netdev);
+	iavf_set_rx_mode(netdev, &netdev->uc, &netdev->mc);
 
 	iavf_configure_tx(adapter);
 	iavf_configure_rx(adapter);
@@ -5150,7 +5154,7 @@ static const struct net_device_ops iavf_netdev_ops = {
 	.ndo_open		= iavf_open,
 	.ndo_stop		= iavf_close,
 	.ndo_start_xmit		= iavf_xmit_frame,
-	.ndo_set_rx_mode	= iavf_set_rx_mode,
+	.ndo_set_rx_mode_async	= iavf_set_rx_mode,
 	.ndo_validate_addr	= eth_validate_addr,
 	.ndo_set_mac_address	= iavf_set_mac,
 	.ndo_change_mtu		= iavf_change_mtu,
-- 
2.53.0

