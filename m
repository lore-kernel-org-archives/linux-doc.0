Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8FCB30C353
	for <linux-doc@vger.kernel.org>; Fri, 20 Mar 2026 01:25:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773969920; cv=none; b=B7xnZypc9/CA1yP3XJnjd81pkC9XfuYDy1maILuQsHFrQ4xp3xUUmCGQcNXwwva5qYA/S1VrLVL7DY5sNiMd7/81Ig2Djsk71ZmWhZPiaEE1DGhwDa98rlQN16YnKJGFVJaI+YSjTWRa69jpxWhh/3vzo9lufyxAMAnl13QOafA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773969920; c=relaxed/simple;
	bh=5NcsxaHVIQ2NmCj9OLQh+nSLlXz0JVUjSv0mBYVb1MM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bcC7xkPubcYfRFnzqpCInGQoXsPy/YET1bO+XVWyrCBAfM9q9qH+ZQY/GBfZe0aeIU6qF3mGfdfbtI5efKdusmHAzXx9MzWQDpChGtiK3htFa0Uwwsa2ei+At2yLME8huavH/J01JGx3CtjrQTFhB2aVf5kxra46BD12cIng8nI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fomichev.me; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fomichev.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-2ba895adfeaso1786600eec.0
        for <linux-doc@vger.kernel.org>; Thu, 19 Mar 2026 18:25:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773969917; x=1774574717;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HbyBRqP1dM0VO6fEJ4blZH7JfwL0DV5fAiX12aFZ5no=;
        b=Fc9eV5WWRkOIu7I4OIlD4z26U4pCkEopa0BiX2DUxHYPHvUrEEEy3em/uuIgRgDOJN
         XRxDv+wJa+7fzoY6/mzT7REXCkdCnQ4riktUriykHQvLLMlt7OONuQTdkmjGiPFPkJlq
         HZnREAm20pvxczc251XEPRCjsEysunyAmLo4rxMR+A5zuq8V7kNfsTQl2y9Ze6cViH08
         PG1EJvC0qD9JbuFWYogpjXreocBvR9E6JaAZPUEVLGrMdDGaH6iaSKUGu47nP6oUM0BK
         PQmYrjFmCnXvynuL2204FTw/2FLd6i7YmnuY1X1RhqidyJoIkmCvpLCWY+HIqIt/yV2C
         vKPw==
X-Forwarded-Encrypted: i=1; AJvYcCXITT78sTbw6oW1HZu0dZsMR5pfinPvN1grMRbH95rgnOhS+d4bBsqTdM3DR898tcWVK8F8X1u8vvQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzz0fl0F0vFGkkanE5FOjYrA9o2ZWsHJibWeRq89ESvepJhDlAe
	R/M9TBJyJS4RyZo9gOmD4/FzQIT3mbQ4fVhHDFx2YyYRr9GHnz9meg4=
X-Gm-Gg: ATEYQzyXfvSkeLbTHsM5fdXf5McIVMiiWtGD9CAMeEzDSihgJxOeHJmJwZG0/sR/fTV
	ie2ge/1/3ikkZgJGi1RkyENgnfXSO/11semvHweLaePP62kmggbBnZOG64WEWcjbBBPVbbvCfVF
	CVQCN4PRst7Lob8PT5Hbb2oY0SgrkUd2ew9gjng3xqGHuaM+pbJUTJzvDFZPNoEbs/iotETFmEs
	t4z5qpjysr3MnpIvIBEzIy2UI+qjj6VNMxLpJM5wnw1e3nIfTZefEIvmhQJpa/vrr2fBogxlp6o
	aWh42rul4G7DkEJva4lsMtF45gOWmzPt8/6kb6Cuz5pLZKRYi5xyvQr6ZbHCJ0TURYoRo0sgX3K
	UsMibkpIBqgKQgdRXC7O7ViTQQIeS+6jWjK5icy5wcx2BEkQyCq5QQBzqbRyqu+r1Nm9lm1dwa4
	eVBcDhfeCrQHWcg8NbB3SaWsUsf5d2CadwtAD0+zwHIRG33ZxI1sV2D7xC7Wvynz4h3S+3WV0P3
	q0UU2YZqGihD5f4eg==
X-Received: by 2002:a05:7300:6da5:b0:2c0:eec6:279e with SMTP id 5a478bee46e88-2c10974fb69mr728307eec.22.1773969916878;
        Thu, 19 Mar 2026 18:25:16 -0700 (PDT)
Received: from localhost (c-76-102-12-149.hsd1.ca.comcast.net. [76.102.12.149])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c10b29c74bsm1146865eec.17.2026.03.19.18.25.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 18:25:16 -0700 (PDT)
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
Subject: [PATCH net-next v3 11/13] dummy: convert to ndo_set_rx_mode_async
Date: Thu, 19 Mar 2026 18:24:59 -0700
Message-ID: <20260320012501.2033548-12-sdf@fomichev.me>
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

