Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99454345EAC
	for <linux-doc@vger.kernel.org>; Mon,  3 Aug 2026 22:16:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785795384; cv=none; b=lvFcGIi3MQEzlUBMXszwKG132uajDw5H3s1zwzIjtwSSzLPSn2HjyS0bz5+dw+cucNMnfPKEqVF/Vjt5t/wUObXCFt25PoFYTtD8k26yJ/0lxvvQlRcdiH+NvnNiHSrZzkaX4TMwKEeaHxqF5YCxtlGeS3c3nACzlBohzfBviCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785795384; c=relaxed/simple;
	bh=zSTDonIyBsR3WqojOzXln4HA3bKn7fqzEMx8iWnncMc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Q1rSBcFSJ+GDIm1S1npcakXkRq3VBCzD3uK04j7jxs3AiwAYwgroz/tW9dla0DWHUZu8WZIuH/7louy6rybDtjEty5skla715L94TsPL56bbW/+UU+6Zh2Nw5eebCqUbqzvIJFHTK9oEQ+7+8UZit2e8zYCHeSIJjhoK/CeNcQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z2VGZe+E; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z2VGZe+E"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-38dfe7eb825so2932994a91.0
        for <linux-doc@vger.kernel.org>; Mon, 03 Aug 2026 15:16:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785795382; x=1786400182; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BPAQpOydhVH6LbG4fSXhvyUlk2qXWOQA9jkrLqZQMCI=;
        b=Z2VGZe+EXmWb/UElNyHc7clTzFJ4klD4DWiShD4RN6VAFyUBGMB/AD0WLHp3xGBESk
         l7eO3R8kDiMtsahbG0B6OHj7YmqxW1PzEe3UlsTfpRDWt7lQJTIPqI90FJXhriDzRhsJ
         oyg2fZdeDBZsc3cewehF6c7725fZ8T1PcxyxOXOJPrkK9ftEJdviHIOC+2lhBlJRP3WI
         ReMlM3ofSNnMhpeBbiVREZp9Jc+kZwa088sPRI3d6qenOW7IYNzGcUcUKRzYr+gOIoqu
         GBgH5GR00jMeqUrAJ94J0qD/t1bfJebZBYd0n1RqvKrE1sNm91vnXjpKVEzmFIp3qNw1
         RGGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785795382; x=1786400182;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BPAQpOydhVH6LbG4fSXhvyUlk2qXWOQA9jkrLqZQMCI=;
        b=Lbky1/mVkdDchFylH5s0ASYlqnMjVEYi2nki4fnPxuIpKSoO7X2BnO9IEV3/fWI0sj
         yuHR9m6OLzIVraNB0ukkkJ01C+BkiI3PfF49KI+2z7PP4NMFjU1QqWG/KdvaC9/fCGuf
         tvTeCJ4OVss9KIan7BR2TrzebLWgd5dU5Dkh+wl1ieoiSJEHJaEJ/BZ8G0w68RrLrjA+
         jR67nqENgQMWaw7woaX2KGfDIS9enYHZjOtcDghK65BZPxoOqIySXRzp9XIuEjMnTNeF
         kDaMRPHuRPOUxTLOkw2sM8Qrg54AKkkL8m+92VahkZ1AzCGDtQn6OfdRzu+YerSTbHN+
         IjpQ==
X-Forwarded-Encrypted: i=1; AHgh+RoId5b0PPmEtsmFDWpzXR/HHQyROIwNrxjp6/TTDwyS7AdROfVJ+/cfDIOLpGLr+Sse3w5IiETs16s=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9wAowJq3qGnDT4F5tgT9wakiQUhc+mBZngW2EMgTZesLXymI7
	KodTMtLxKT3M45VyXFZquZdf94TCTAuX4a2IYPM9LDmSx0tWVsGBUpGo
X-Gm-Gg: AR+sD121e+bM2SAfhDfwsvnxoF1Nq9pp5UTFb9y/0QFiAt2Vm7dyCW06iP1Pqr43FhN
	S5SO8AsBvI66c1/PNPyQnBvZAeT2DC2tajfMzdbymeZUFJs/7YlQr94/582Qzv3mOnFvcyKxSxb
	K9mnxeDGzSzLa7OHDde54fzgnc9zUh+6nGgbQERl196EILElWuVf1dszNbmPWaXbBq2DfX5u6O0
	5vcYCDaYmcO9wK7XwcdkNs5P6NOQ1NhcCdy298FIkqoIRt/k5LYUO2L1BDl4SvBNPhW+CB5bd5K
	rsVSPsVjGefSrRTCF+Cx9j7jgVFjhq11sxOy1iF0s7ro6oLK1ipjRo6gpcbiux/I6WJ1JgLHYjo
	LNL0j7GVcgv88RNHy5HbPuXJeOnKf+MvIgIyQye/LQaZSE9aCYJze2iT5jm2tjtCmtnmjzvVRrC
	OGwlU3rYS9fAUDqmGu1nqVWHzskyIe+eBB36v9CmIHJgrfVlg2JNRO4kJrMQKFGvAg/53aO5ybb
	QKZJeMdAy0F87W5rAcqC0x9pTZl+79GHuL3HGVXpw==
X-Received: by 2002:a17:90b:2b86:b0:38f:240d:b857 with SMTP id 98e67ed59e1d1-38fbc3f7e4emr11504598a91.2.1785795382006;
        Mon, 03 Aug 2026 15:16:22 -0700 (PDT)
Received: from lappy (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13fab1334cfsm38685666c88.1.2026.08.03.15.16.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 15:16:21 -0700 (PDT)
From: "Derek J. Clark" <derekjohn.clark@gmail.com>
To: lkml@antheas.dev
Cc: W_Armin@gmx.de,
	corbet@lwn.net,
	hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com,
	jdelvare@suse.com,
	kuurtb@gmail.com,
	linux-doc@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	"Derek J. Clark" <derekjohn.clark@gmail.com>
Subject: [PATCH 2/6] platform/x86: msi-wmi-platform: fix: Remove unused err
Date: Mon,  3 Aug 2026 15:16:10 -0700
Message-ID: <20260803221614.59324-3-derekjohn.clark@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260803221614.59324-1-derekjohn.clark@gmail.com>
References: <20250511204427.327558-1-lkml@antheas.dev>
 <20260803221614.59324-1-derekjohn.clark@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

msi_wmi_platform_profile_setup() declares int err and leaves it
unintitialized, then returns PTR_ERR_OR_ZERO. Remove the unused
variable.

Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
---
 drivers/platform/x86/msi-wmi-platform.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/platform/x86/msi-wmi-platform.c b/drivers/platform/x86/msi-wmi-platform.c
index 33acd448f674..2439b4f0001b 100644
--- a/drivers/platform/x86/msi-wmi-platform.c
+++ b/drivers/platform/x86/msi-wmi-platform.c
@@ -1422,16 +1422,12 @@ static int msi_wmi_platform_init(struct msi_wmi_platform_data *data)
 
 static int msi_wmi_platform_profile_setup(struct msi_wmi_platform_data *data)
 {
-	int err;
-
 	if (!data->quirks->shift_mode)
 		return 0;
 
 	data->ppdev = devm_platform_profile_register(
 		&data->wdev->dev, "msi-wmi-platform", data,
 		&msi_wmi_platform_profile_ops);
-	if (err)
-		return err;
 
 	return PTR_ERR_OR_ZERO(data->ppdev);
 }
-- 
2.55.0

