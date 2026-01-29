Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D7E237A4AA
	for <linux-doc@vger.kernel.org>; Thu, 29 Jan 2026 07:30:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769671829; cv=none; b=FoR9t/0sJ+aMvzH32dG6QCqT6omP937jnmF+ioEe5dn1/GRApy/DYpLfDXzC75A1zi3KSMqA7AQX1HY4sF+osJg26lT6ST2yppZeNXXND5XnLU843sX3WVHD/6uPXYzzk3QboayyDM14ohEMwO3F3yTn7IXKUSXWypqP2HCSMmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769671829; c=relaxed/simple;
	bh=Q08HlvjkeK2NTVb0SUqaUm7zfYAR9pDG4Jx8zb5yZoM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=g/H7FIqwk1fRqn9J416Jl//4j5Xu7/kTV0y9D4aRZ8DQxLXKhFrO03ywm2oxKN/G89z+DqDJrensBbK/Kb7QAxJ3yV3fURhOtX368TuxmL0pORh6rhZFZV5Nv/teHFXgnmRPKatCeAuZVndDGtaFQS8UGyGvBYDAJYeNfJXmj6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FvDg3jFb; arc=none smtp.client-ip=209.85.210.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FvDg3jFb"
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-7d1890f5cafso197315a34.1
        for <linux-doc@vger.kernel.org>; Wed, 28 Jan 2026 23:30:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769671827; x=1770276627; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7h3bLXzeM6mWSjiJcGUgMMMhzyq4pD1tO2973ypLisk=;
        b=FvDg3jFbV4cO51PiqpBRQByiECOycuk/2s3uuv2MrXmnmITAMm4fCY8rOm09PIehw5
         92BWuwFAe+bqSyLffNbj6+NH8zQV2pqPL73HIRxRhsARFZEqmQD9ZFa5pN4SFrXymymD
         H9QKMJZiPOXHusYOhImvLqYNkNkr1hzgh+SgOG8rEFh8qEoYuMGRTtgcNY1I73evliYb
         Kx2ObSHkGL2QADVrhkcWvKco08CVZxdFh6ihJ0cM2nQZC6sXi8Nj9ttV1KVqFTpr2wEg
         4+Qvjysx6PZHyIDNxwHhUqhj3qSvs6xi6P9PNMnnMzr5B7K1ojePU+MBoPHCxquFrHQ6
         0MKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769671827; x=1770276627;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7h3bLXzeM6mWSjiJcGUgMMMhzyq4pD1tO2973ypLisk=;
        b=wk72N3lCVrNat4+jKsPafIYpIqlXaw5LFvBH9Mdfhor/0C7SRPPJK3h59v7ep9MNM+
         hkypBTUdiYbudSSmFRe+lqafplzxi2Zes0rjizE/rPcn8ULdMHxRMYRMfwDycdzB5k8j
         fPkSTWEa6SOJQCPL2AK0xQeqGsMYSA9ncpEkSZWIUwfY5WkbQJB4DAgcTmiH180+2tQO
         pnDZVv8AWPX/g2Rr61EwfL/i/sXgDOR9oPQj1OIHpZTMIch44Kw8VjO4yD6PAKAXQrB+
         z8ZU3xVw9sTqZo6iCyC12gDjRAfT31m9EEatWTL+CsEYiQ/kJ1lq1uwyC1I9Kvzfn9Ky
         wE6Q==
X-Forwarded-Encrypted: i=1; AJvYcCXcE+amnmt4grn9g9zSVLwTANK8yEC1KE0NGGIHDgYFCyekB6MptIGKxGEDJAHwu0wP5eaU+pS9Kc4=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywq7ttEN/INN03cX5ppmOxYXllPrqCY/fURgs6oOkLVpZ4PhT4D
	RtVh/fra1kRR/Soo6OAwpp42CVC7YyZ1Yl61WQmtLHBv796v4nB01CU6sRIfwO15
X-Gm-Gg: AZuq6aIakafhrVTzPIKg7BopR4X/2Xe50unVV2lhYxHdSvNRSidBNwUQA9poSPFzReC
	aHSOpjzRGEhSnkR7gH9UVi4WHjZcZ26l/4CY88VjFZiRcPY+5zOy0j6ikZvFW2ES/bHGVeIoNwa
	GoJO00ZSASkOqLpGsJbTACoW5rNW6vOX2+IsBfrL/Be+Opi+QyU/LpXzTd3wjPPHWncSRADENVq
	glCKtq8hZcoOi70M9qgXXdtYEeYaH/jJvR9wzIgWFuiZ0Whp/iGaOhMv6Y3+FBfNLosIXkoIVTK
	UG86T/DT5PlCxdmMj9HMkMzIZISdT8D2lBfSdILoJpE8Jifevt6sp62+wn7s34/4g5sHDRtNVpJ
	D18gvEkN16nXL+c7hvPG51bAVaC18BQkVyg4ZjZDwLhrHZUqBjd0ZEqyudlscOrdquJYPJXQAV1
	4rzYScvRWt3L18Lq2WTgN5Mj9K+uUrkxnbO7KUd+Tv
X-Received: by 2002:a05:6830:4985:b0:7c7:e3b:488a with SMTP id 46e09a7af769-7d18512ac73mr4516959a34.30.1769671826941;
        Wed, 28 Jan 2026 23:30:26 -0800 (PST)
Received: from godzilla (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
        by smtp.googlemail.com with ESMTPSA id 46e09a7af769-7d18c7ffbedsm3173982a34.21.2026.01.28.23.30.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 23:30:26 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Jim Cromie <jim.cromie@gmail.com>,
	Jason Baron <jbaron@akamai.com>,
	=?UTF-8?q?=C5=81ukasz=20Bartosik?= <ukaszb@chromium.org>,
	Louis Chauvet <louis.chauvet@bootlin.com>,
	Bagas Sanjaya <bagasdotme@gmail.com>,
	Dave Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	dri-devel@lists.freedesktop.org,
	Petr Mladek <pmladek@suse.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-doc@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v9 10/32] dyndbg: tweak pr_fmt to avoid expansion conflicts
Date: Thu, 29 Jan 2026 00:28:56 -0700
Message-ID: <20260129072932.2190803-11-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260129072932.2190803-1-jim.cromie@gmail.com>
References: <20260129072932.2190803-1-jim.cromie@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Disambiguate pr_fmt(fmt) arg, by changing it to _FMT_, to avoid naming
confusion with many later macros also using that argname.

no functional change

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 lib/dynamic_debug.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index 1d13e3ee3e12..fbe18b1f0b73 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -11,7 +11,7 @@
  * Copyright (C) 2013 Du, Changbin <changbin.du@gmail.com>
  */
 
-#define pr_fmt(fmt) "dyndbg: " fmt
+#define pr_fmt(_FMT_) "dyndbg: " _FMT_
 
 #include <linux/kernel.h>
 #include <linux/module.h>
-- 
2.52.0

