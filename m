Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DCA03E557B
	for <linux-doc@vger.kernel.org>; Wed, 18 Mar 2026 15:03:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773846211; cv=none; b=c7O88xbuGwA9zdYLekK2hkAapnPPfTFNjQGyawMKtBKRjOK43rL2vznmIxP+U5U4Dzt6oFP6cAmpbvJy02VtNq10C6WFG+6UaIe6oEU+u+Az7iq5G/IK+S4CJC6XWJbh+RALurAf7kMg8gZbJqQD0JKT2UrJ0WJ0KZ+6mXSIFY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773846211; c=relaxed/simple;
	bh=5NcsxaHVIQ2NmCj9OLQh+nSLlXz0JVUjSv0mBYVb1MM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=f0XemmF8DN34QQjF0MPdMZVQhEx/8sCc3Ktai8/6SNMd14fjTUUw96H+GaGh+AASpRhUUAc6l/50v8XkUAnxhBvwQAPcAKDtk+1LlrNQyLwLa29Y9b7WYSUDN1xh7W5VumOn+2Eg6OvLQnX64G4JuW1Ic1qWblHSPwr00Sf/17g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fomichev.me; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.82.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fomichev.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-128ebee22caso5018974c88.0
        for <linux-doc@vger.kernel.org>; Wed, 18 Mar 2026 08:03:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773846206; x=1774451006;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HbyBRqP1dM0VO6fEJ4blZH7JfwL0DV5fAiX12aFZ5no=;
        b=YV5fIjkwLJCdcpMgBc5UcdT+y1Z6IiVlIJZVZ2DGbsE+jYm+n0wTM/iCxXwuasoXcF
         JRkQuNC9H1qfxnJ/U209O2/YAr0g906m41c6rtFfTnkP4pYDgN27fNog5LvDxzRmxtj3
         0n/SHadmLlhjYi35zqFSbKoIPLReSOfZRzZgQrOAJKqRbXTJSGpc8Wz+36RH2h3ZWNat
         VoZExvFTrvIGBqUTMr/0WQntm+hukdK7mqXSTVDoOiRfIM/kHvW4vHuzxDd8VRlRgZuU
         tSkZjJABqfoYFjnaWSsTDvLZK8mYDGWheH8+jTOpJ0fvmofKJ9aUkNE9hHVVX3hOWNsT
         rhWQ==
X-Forwarded-Encrypted: i=1; AJvYcCW959R49kGfcdjb35y67mvPhBiswHsEIXa1TNPsimoOdk3FyCH1zWh/GO46Z2kJJMtUhSIlmgmDqyU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyXJkVivXDt6VgwqVakuGmll+K6tQL/KDjanzc/LiaofDEBw5+z
	f9nIR5sU253Hw288X7KxdfERhBumvqK5gVSdsg1pO/bhyHmclI3CuzE=
X-Gm-Gg: ATEYQzwO4L1Rx/IyWcJH7H6rlQb0VTOUt0KBQ8t+qjH7ls7wL1PLEUBEcAD5gLNFSop
	ma+J+jOvy24wYigo/ONTfRLQTYk7ySxKZvGZC/EVbMdkjoJ6F68qbZOBoP+g6JIkWVL7xXPeEUL
	F5MVzmLCagdTk29iOsSUfo7S1Gzr9L0yAf6pWGDYSHZlb5NHhm0ZwX0uj0O956m35p0czyDmVd1
	9idSXO+ggUTdPIZixlMdrt9DmmiOJfDk+0iXKaSpGapuaLB561j/MjJZig0WF5cRUtnjUpgNXxa
	YJQw+TlPOlYjBu9Rm7Tb1CtyhilVGCiFFb1ZBc7AW+nB27b8BvHpqHdtkfRPVxdk7YsfGkJOpnv
	/S0d6nLpaY1zbgbLzXTUw/dC8rehgG8OoKGZbxacGyWeKn/OERLjPPXQVqdzwSeElzmo7Q3xYkz
	1acyqaIAI0DROUxgu4/J5KTzaicHPLXOhcRdY7NaP2T/YZx+da3ZAVivwXFk3VZYf7/HJJf5uUE
	lx0xAVdZi/DJh4UrA==
X-Received: by 2002:a05:7022:b9f:b0:128:d51a:5161 with SMTP id a92af1059eb24-129a715e828mr2027441c88.27.1773846205882;
        Wed, 18 Mar 2026 08:03:25 -0700 (PDT)
Received: from localhost (c-76-102-12-149.hsd1.ca.comcast.net. [76.102.12.149])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-129b41271aasm3384562c88.11.2026.03.18.08.03.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 08:03:25 -0700 (PDT)
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
Subject: [PATCH net-next v2 11/13] dummy: convert to ndo_set_rx_mode_async
Date: Wed, 18 Mar 2026 08:03:03 -0700
Message-ID: <20260318150305.123900-12-sdf@fomichev.me>
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

Convert dummy driver from ndo_set_rx_mode to ndo_set_rx_mode_async.
The dummy driver's set_multicast_list is a no-op, so the conversion
is straightforward: update the signature and the ops assignment.

Signed-off-by: Stanislav Fomichev <sdf@fomichev.me>
---
 drivers/net/dummy.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/net/dummy.c b/drivers/net/dummy.c
index d6bdad4baadd..f8a4eb365c3d 100644
--- a/drivers/net/dummy.c
+++ b/drivers/net/dummy.c
@@ -47,7 +47,9 @@
 static int numdummies = 1;
 
 /* fake multicast ability */
-static void set_multicast_list(struct net_device *dev)
+static void set_multicast_list(struct net_device *dev,
+			       struct netdev_hw_addr_list *uc,
+			       struct netdev_hw_addr_list *mc)
 {
 }
 
@@ -87,7 +89,7 @@ static const struct net_device_ops dummy_netdev_ops = {
 	.ndo_init		= dummy_dev_init,
 	.ndo_start_xmit		= dummy_xmit,
 	.ndo_validate_addr	= eth_validate_addr,
-	.ndo_set_rx_mode	= set_multicast_list,
+	.ndo_set_rx_mode_async	= set_multicast_list,
 	.ndo_set_mac_address	= eth_mac_addr,
 	.ndo_get_stats64	= dummy_get_stats64,
 	.ndo_change_carrier	= dummy_change_carrier,
-- 
2.53.0

