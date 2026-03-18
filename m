Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09BC03E95B2
	for <linux-doc@vger.kernel.org>; Wed, 18 Mar 2026 15:03:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773846208; cv=none; b=eYNGS8KPAj2b6xUXC6dQRK6+bQ16OFCd/eXEbaaqFCT43p4RSi4h+rxBLSwRLvzJjhVSRiFlqBSqCtHcoUFpQQaEt9wvsTvCrYOPvsGvGj34eYu3rFm1nk0+KhttqBCJdTmDoZSZNZ0p10IBRRRVTgtLiGUYeZ+kZkLY+L946Nk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773846208; c=relaxed/simple;
	bh=FkE3aEmYq3JFi5GpqJgM6OBmxi48BQXX3kwNVt8fzXo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LGTnL26jB4PrZ3jgZ2gCPrm/y4fAT0YhdkfbWKmFE1dv/SNqgNGlkVDTpmKVUOrUiR1YuqIzim/o+0mffnMQhSG+H9LqXCjbvGp1zRHUBAsewoLH5KEwiwiKCl6K8+1lHu/raJFXN0fx8Th18FmmhPqyzLu0rB7BKmx6JRQcCAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fomichev.me; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.82.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fomichev.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-126ea4e9694so2428520c88.1
        for <linux-doc@vger.kernel.org>; Wed, 18 Mar 2026 08:03:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773846205; x=1774451005;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RnwqqwAxnRG8s2vaRYDrbUdfVznpcDcr1raRDlnvaSE=;
        b=mDYZMjX0CVwasydsFr418CLq/UVWVTd7gOgCQfdxWVFz3Mz/mu8iF0+kCbKA49oTrg
         rQqJ5014p/ZWYgnVQTyK68mQWTTb97YC4hV77w7H4Aq8ssUvLBX2Oy5SdoDNlKG8HNl2
         I3KCSsgS0nN5/+3wBLIrdfTRB20WOsb4Lv90H1npmXuiDCWqCfEgmWNLZ3rMxhqnd5FE
         D/iMcapKlH8o7IMegcA7XGVIe6OimEewJQKQF2GL4fcL0Xbfs5BsknU5vVxGwR4xHLxA
         /U/vB3URLeCKDn2bvivByxT+nTLfRSo6nA1CwW/tXmLjoPqOcRxqL4GrHgM8ePCd0rJT
         jsKg==
X-Forwarded-Encrypted: i=1; AJvYcCUS37nwAUdH87jnaow+Ff+VdRCEqynTPWdDvk5AoHg4OuEuNgzypfTavMiP5DUwxyonQN6Y/mx3QT0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyV65gZvAfz9hwOOuX6kJNvNGnZ4/41OuBfm5JIlH8RzU6t57kY
	y+DZiqSCJlehRDLKzaJdNUuPBoQpEMPtZvpDoEFCZMU24bVriyCZ4AA=
X-Gm-Gg: ATEYQzw+ZoYumhZEl7sP/96JBOxEHzQWK69EkLD5IfBqwfOGOdqrAU+vY8dnRi4Newi
	63uxYkNy5lpavuZD8QKjaqvZG/HRuZiB0blgbOUMal7uDmx4lp8qNo0c11Lum7PRPXHFIBCR4A8
	tTiVrE41Tdt6uUUEVu+kz3I21D8ai3vXYwC5zYYU3tGNzyl5TE576KeZqeidby/H9e39VY/1Sag
	E0rMRWNqF5EnbSWbiwcGV7NbshJIM6vzLfiA5lTSNnGQ3Qe33X1KrqRqF9hf+vik4XllwkoDxz6
	DEtiPxts9Gm+ZbS8w792czliqOFHIwBlegIQenRujvSb9+DI3YGaabVXwqcmq4mNpkEpa4lZ4u1
	gR87nm2bAWeX5GdVB/XnPzYL10HqRVRKk19RERvxZE4Rm9rk109XWpeIFPUOyJhSvDyTCO3RBn4
	XNUub6JlH0V1rfl4uMm6BXiyuMS0MbVosK864JCqEA2dyiKWiuvyDxXoWa6CB/pJMWKd5V/y31I
	xE9w2uPaElyIyQvDwc3jjXRdRRb
X-Received: by 2002:a05:7022:61a:b0:128:cf5c:5362 with SMTP id a92af1059eb24-129a70e0ccbmr2203458c88.12.1773846204437;
        Wed, 18 Mar 2026 08:03:24 -0700 (PDT)
Received: from localhost (c-76-102-12-149.hsd1.ca.comcast.net. [76.102.12.149])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-129b3e8d34dsm3689514c88.7.2026.03.18.08.03.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 08:03:24 -0700 (PDT)
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
Subject: [PATCH net-next v2 10/13] netdevsim: convert to ndo_set_rx_mode_async
Date: Wed, 18 Mar 2026 08:03:02 -0700
Message-ID: <20260318150305.123900-11-sdf@fomichev.me>
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

Convert netdevsim from ndo_set_rx_mode to ndo_set_rx_mode_async.
The callback is a no-op stub so just update the signature and
ops struct wiring.

Signed-off-by: Stanislav Fomichev <sdf@fomichev.me>
---
 drivers/net/netdevsim/netdev.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/net/netdevsim/netdev.c b/drivers/net/netdevsim/netdev.c
index 5ec028a00c62..9c9217792125 100644
--- a/drivers/net/netdevsim/netdev.c
+++ b/drivers/net/netdevsim/netdev.c
@@ -182,7 +182,9 @@ static netdev_tx_t nsim_start_xmit(struct sk_buff *skb, struct net_device *dev)
 	return NETDEV_TX_OK;
 }
 
-static void nsim_set_rx_mode(struct net_device *dev)
+static void nsim_set_rx_mode(struct net_device *dev,
+			     struct netdev_hw_addr_list *uc,
+			     struct netdev_hw_addr_list *mc)
 {
 }
 
@@ -641,7 +643,7 @@ static const struct net_shaper_ops nsim_shaper_ops = {
 
 static const struct net_device_ops nsim_netdev_ops = {
 	.ndo_start_xmit		= nsim_start_xmit,
-	.ndo_set_rx_mode	= nsim_set_rx_mode,
+	.ndo_set_rx_mode_async	= nsim_set_rx_mode,
 	.ndo_set_mac_address	= eth_mac_addr,
 	.ndo_validate_addr	= eth_validate_addr,
 	.ndo_change_mtu		= nsim_change_mtu,
@@ -664,7 +666,7 @@ static const struct net_device_ops nsim_netdev_ops = {
 
 static const struct net_device_ops nsim_vf_netdev_ops = {
 	.ndo_start_xmit		= nsim_start_xmit,
-	.ndo_set_rx_mode	= nsim_set_rx_mode,
+	.ndo_set_rx_mode_async	= nsim_set_rx_mode,
 	.ndo_set_mac_address	= eth_mac_addr,
 	.ndo_validate_addr	= eth_validate_addr,
 	.ndo_change_mtu		= nsim_change_mtu,
-- 
2.53.0

