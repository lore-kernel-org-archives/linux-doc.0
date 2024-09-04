Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 204271474A9
	for <linux-doc@vger.kernel.org>; Wed,  4 Sep 2024 09:48:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725443282; cv=none; b=T3friUGlr8RqUVD3J9/zSeDMarBgZZpIDjdn+54c9oOb91s1RKbDFyzy6fhuJ4hLhUFya05gWdFy9lcDi146jgtcsZqXv+POSGmj1DPYT6ixM+7pIqERN1qT22cbIda5SGXJF753f9uAC9RTKIiFqzbUb79JIcpeCVyHxM9TNXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725443282; c=relaxed/simple;
	bh=WP8t4BXUJg7dAm3OpE2RSpixMeST54d0bmiaKZz9G28=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=DSWC6yavjF9l475YNaDE4tpRz1wU/McyY/pvJLHT/w+Xl4XEwInA41jIIWIhU4XIxBthGOhH+wknDIR6hoeMpWc51iRMQetKaUJ4p9d7rwK3UI1KDTwqoYCjeLuY7ThdWeBnMz0xCJaxIwDkE5zyJEOFfCrwGiwY25QHtAOk59c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--mmaslanka.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=H7y5wWwv; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--mmaslanka.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="H7y5wWwv"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-42bb68e1706so57775645e9.3
        for <linux-doc@vger.kernel.org>; Wed, 04 Sep 2024 02:48:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1725443279; x=1726048079; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=nYlazt98je5OLdJwIQH2r48prJG16q1sBIynapL5APM=;
        b=H7y5wWwvLXw31tyDvYS0uKmLPHKbUFnEyIND7gi0o4/bUZxepK2yWXNAB9ZEcLm4bC
         knvFBYNglrpztzNzE5tp9jy1+DMYUr7VwerItGen4VNRUQW3v/jmENpCztYCVPJHNPNM
         bR/gX8UPTl3Vv2FnnZJyRhx/nyW47ID6eDWgKQE22YbtYhcJMk7sJh8I+WWo3vKcvaXn
         FbLj6vpqeUT7ReqwCh+5NDpG0OgE65tNGX7g1m2NsVJMzRaiYS9lXcVioZoBsHGTa/p5
         q/20NTXvvU6+Sq9f1+V7VzCcjsQ9iBlAtLAFZec1twh8dFbjhzcaCm62BL5rAWroePiW
         KXAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725443279; x=1726048079;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nYlazt98je5OLdJwIQH2r48prJG16q1sBIynapL5APM=;
        b=IS80v8MWksZDlLOn/LdEKA6FasiJw2hanb/rFZKAhKp5w5VuBZdja+zy+kYHBVI9Ho
         kW+euc51Nf9oYsX71PBp5vVhkHATqwF6WjtSHUuLW0a+HpZToWoYnf472s5Q7MaHdNhm
         Ft/QqW2S3F82FDr3/8CggwQgccGJEdLkaeE4IjI78iRLK528pWBnIMYvrcD7/r65wZkL
         0SF27BaY/3a6LCaFnP57ZUz4e1IUOjmd3bER6/tOnD21KXlA9sUlfqP8fHCKYIdnAWp8
         c10nbYingNqzyZeLAhF867SGwUle8hMVokIzwK797s+EXqdM+OYKScoaUQ/JcE0k9A9f
         yADQ==
X-Forwarded-Encrypted: i=1; AJvYcCXEmuk0zy129TuUnwYj5s46RYCU41v+AY2NAMoVFRXy+jihaTtm2WM8hRxmu25PpXugfTMOdyeunMs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxjva4O4rmTDeTLAaWfgtwJrrCMJ5hCtsA7rX+FPYUkVbsAs0ur
	k82TqsbMC2uZq7bJsuUzWMTw+6SGdfA0WDwAA2LmDrhM5FLilIOOCytM5ZKQifAP/vjellFAJDE
	1f6R1PvD6d5+BzA==
X-Google-Smtp-Source: AGHT+IEZbOrp49fn/uaE9iy1FzWUvCJzMm/0OCvUuCEOfiHNFzpLmlFrzBlHyx/6/s/dYAOjGH0FI9BLoVWCd9A=
X-Received: from mmaslanka2.c.googlers.com ([fda3:e722:ac3:cc00:31:98fb:c0a8:b8d])
 (user=mmaslanka job=sendgmr) by 2002:a5d:64a5:0:b0:377:884:4545 with SMTP id
 ffacd0b85a97d-37708844606mr4099f8f.6.1725443279332; Wed, 04 Sep 2024 02:47:59
 -0700 (PDT)
Date: Wed,  4 Sep 2024 09:47:53 +0000
In-Reply-To: <d5e6a9b4-f9e2-4c6a-ac2d-bba1b12d7675@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <d5e6a9b4-f9e2-4c6a-ac2d-bba1b12d7675@redhat.com>
X-Mailer: git-send-email 2.46.0.469.g59c65b2a67-goog
Message-ID: <20240904094753.1615549-1-mmaslanka@google.com>
Subject: [PATCH] platform/x86:intel/pmc: Fix comment for the
 pmc_core_acpi_pm_timer_suspend_resume function
From: Marek Maslanka <mmaslanka@google.com>
To: hdegoede@redhat.com
Cc: daniel.lezcano@linaro.org, linux-doc@vger.kernel.org, lkp@intel.com, 
	mmaslanka@google.com, oe-kbuild-all@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Change incorrect kernel-doc comment to regular comment for the
pmc_core_acpi_pm_timer_suspend_resume function.

Signed-off-by: Marek Maslanka <mmaslanka@google.com>
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202409031410.a9beukFc-lkp@intel.com/
---
 drivers/platform/x86/intel/pmc/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/intel/pmc/core.c b/drivers/platform/x86/intel/pmc/core.c
index c91c753b120e..e2b4c74ce7f6 100644
--- a/drivers/platform/x86/intel/pmc/core.c
+++ b/drivers/platform/x86/intel/pmc/core.c
@@ -1209,7 +1209,7 @@ static bool pmc_core_is_pson_residency_enabled(struct pmc_dev *pmcdev)
 	return val == 1;
 }
 
-/**
+/*
  * Enable or disable ACPI PM Timer
  *
  * This function is intended to be a callback for ACPI PM suspend/resume event.
-- 
2.46.0.469.g59c65b2a67-goog

