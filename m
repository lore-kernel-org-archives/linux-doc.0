Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFE3E3E7155
	for <linux-doc@vger.kernel.org>; Wed, 18 Mar 2026 15:03:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773846207; cv=none; b=YSayX4/izLkPLUyso2pN3adddit6XWwBBvnbEF3trHsevFu8fd7kZJoxajeCprIKOcy/GBxU3YnTwSIQ+tCDq2Y+0KZ6RgHYWj89RFQ99bcQb1QbMZTT8hPvm5d0t2Oa9CGCt164lzbuGzIYUXVqllbRe7meEB4NiFefedC+H1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773846207; c=relaxed/simple;
	bh=tpq4CPEg4PF7xY4vX/qaHiEsjc2ICDqk3bHyi4H6/ME=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Q8l3a3AuSIjDsx8bRKGrhoMNbTB0e+XcMPlx9PdfE5ldJGF2HaD49xuT19wJ/QxNqZ9tCNvCVwJOiSON2kjha7IaHZTiBEIqQ1wyNNQMBmoWmghBGR9m4bw3k2yUXV9ipraosUt93xJf9DDOdhcW2x34bjERY+TKtnhnOVxQQkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fomichev.me; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.82.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fomichev.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-1271195d2a7so56828c88.0
        for <linux-doc@vger.kernel.org>; Wed, 18 Mar 2026 08:03:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773846204; x=1774451004;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZI1/cLnyDnVOs4qvF1/y00bhWF98dmH7Q3P7jVrTCz8=;
        b=aA77kNn0Ozi2kzV9YXXr7U7tdci4ya3WOGEd7ONgAJaF0sV6NVVmqUHHZVDmjOHqqs
         4UH574VZeM2OhVqyrWVf9WYfzw0JtNz953RASuDC83q3K+98rgJHuBCUKXoR2NzBfdy/
         +JWnVqXAnr6ZrLVXF6ZXzytwklkBjeSbhlXXg0+arJ7c7KdtR5C1NU28IWnihEZMsEUL
         nKFLuTc79bV02tvM39Z7Qmu3KommJ+rvKxEfQ8MF6bfucjRliKX8Zl721eUayUxs4iMw
         LOQ7pqKNAzSvcoUNTmxsoUIWyyGzBifBbHmPzFPdzoSmkcigR7zS+qslYxvt0yKVC4Nl
         xcIg==
X-Forwarded-Encrypted: i=1; AJvYcCUv1tZAjUvfVo4vktZ685SHb2aqdXelW6Icig4AOlRbdyHwzHAZCA+9ENEKzqUUsi7brHWEwmmrz+Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YyycUlS2hNQy7kH/MaN1CpSlvGe3vDemeobb0XWlH0Yc6Uqn8NY
	8BdMLmIU5pIv+Tn9i40g3u0nICm1bUMnMQHgoBJpUiQAxinsb4GLlt0=
X-Gm-Gg: ATEYQzyhXmE4MleVkR/HUVf0JXTBM9n6KPzEolPZvpfSMTmjJS0ZhCjj7anVMPLYqLB
	16l4vl+HAsauiYMHObBwjwKdIC5nKuiMZwfMy4WRXd6QzuFHTFmk8FVbyr0qPUdaAznDRuDgvXr
	n64oCavbwznRGjqbAb41GDcxdv/SuM9c8gx0YcsUqmqzyEtzIaDnQpRVlZkQPNTqJwJGQ0i0tY1
	G9L9d69HDAylhJXdHHwLquE/kObgTWfHwaQhCpYgi98dwOUjKVojsXxEf2G3It6XqxzRQlV9BY/
	hpCw1uUMITCziza6NlcqC+uT1XV9WO8A64LzJP+x8TswxdL4i/bl4YynRY7snMY6JGsBSd4Gy79
	JpAc6f1bUe8zXgtBWIlUDRo2TtNPu48YBddAoZUVLQIkaT5hew3pthbJl9d9ewY41kX6RT69b7e
	o3t9efJCXfAfActKX7UmO/7xT0gC14C6652DJ5bcSuZ664hkPpn8yAAWDJiNAumheOwuBufvM7/
	uIWeVyNGx/M0lHoIA==
X-Received: by 2002:a05:7300:3724:b0:2be:126c:e335 with SMTP id 5a478bee46e88-2c0e5011ac8mr1873924eec.10.1773846202672;
        Wed, 18 Mar 2026 08:03:22 -0700 (PDT)
Received: from localhost (c-76-102-12-149.hsd1.ca.comcast.net. [76.102.12.149])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c0e56062e4sm4123423eec.30.2026.03.18.08.03.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 08:03:22 -0700 (PDT)
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
Subject: [PATCH net-next v2 09/13] iavf: convert to ndo_set_rx_mode_async
Date: Wed, 18 Mar 2026 08:03:01 -0700
Message-ID: <20260318150305.123900-10-sdf@fomichev.me>
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

