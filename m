Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84ED1439905
	for <linux-doc@vger.kernel.org>; Tue, 21 Jul 2026 20:57:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784667440; cv=none; b=o7LLqW/e7RFh3FlBJdcuigDYd09P0XqDMSTJSsp9OCjTKmpAeqG6Fq/tXMin1rBhejmg0F2Kmj++/0wscB+2xObrCWSRPt4RvlpY0ODBOXyaLUCsg32SrAL3SNrgli+oDc2pmmJE5mB+7fBmYjAwXXm0VHIOjO89LWWeTP0QZ5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784667440; c=relaxed/simple;
	bh=krCb8u5AazdMsEF9z+e+5QeJqi85jxNa/cGvt6tyuY0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CMxlfM3qnVZMifu9l3hKp0dG49Oz9m/bgU8GDag2Lwh8hOKvOZaiEGwqT64Fj3KpeS3fj3WcdiNhQRGCL+qrp+l9HhjrpkYT8fF83ff64OltB2hurXRC7h9xnCned++Cb23Zip0lq+9E8fUxn3qV0MYQ85DJLCSSVN8EK2zV3k4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mGsA3j3F; arc=none smtp.client-ip=209.85.161.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mGsA3j3F"
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-6a379b68f76so4615850eaf.3
        for <linux-doc@vger.kernel.org>; Tue, 21 Jul 2026 13:57:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784667436; x=1785272236; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=T319eudiwbUhIX801T9R3taNsc3hT1nhhg5oWUNGgcw=;
        b=mGsA3j3FH39ACXBT3416tVAp0esh19rrTZG2S6eqaNw1V0ig97hwwNGeFeiIA2U3cl
         KYVNTAwqE933qnSvxjmX5dcpi3CvWCeFOu2YZZJ+7MUqQj8t/N0dexhmBJsoYyH5K8Tt
         Pml1ojwnGeFidqcapO+N336jT7HnHIsdYsjT8boDLJVGRdarq/RLO4lcTMaC+RdDK/FZ
         YIJH6/BlDYrVORAQNz8gwZwM3RDojwxRbkHRAEEIosLl4qYn1tImFA7LbFk4azHd24fL
         hYeRkwhgZHi/movrcRWs8c8vIw1nvh3OzQuhdOy/rmMeJZsLGv1AxqRgpJy69FPKHhtc
         yP8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784667436; x=1785272236;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=T319eudiwbUhIX801T9R3taNsc3hT1nhhg5oWUNGgcw=;
        b=CjdVnDZVJbGogqNPJ+hCGtOUuqzIdPU/Y+qKGIE4ZF3KOTxighsvsIRWg+49Q+o5sc
         jS3fA1x8x1aB7eXlOBT9RWmtInXERiwTzo9g2ZCwjx6OYsQIUuPp8s4cRFkspEVpZ647
         ewP65ODH8bDOxZ7RzEMFRculAnfjSwaW3Zd046epO4MDY4MaouU7/AVCusUeSm8LDOsi
         oHlbIXmm2Nu8Rk0MqbXtZl4JO8v5wtZL8JpWqYEvQkW6w41Ga4R9CiLNK/LJrVmPKCO1
         PO7M9M7TiBlF+pzlD65ZSk42Qmembp4U/eiHrfbOwAEnt9yUeS95nVycJH31pKByh/IN
         WDuw==
X-Forwarded-Encrypted: i=1; AHgh+Rr8c4AaLspHSf1q/RqKHI7cnQScCcLpPXsv9zNppqsoLGEGK+QJoXKp6UIlixR0JvU9Z+nJ8dTeycc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyWtPDObtkq+YNqtK+Jlv23ecVTXpSremjqzcp0Q+IvYAKKy+gD
	zUbRcAp/ktJCOyeQZ4TOVzbdVXkqbyxzphXvGjS3yo/GJ4hbiNx/GHbD
X-Gm-Gg: AfdE7ckbGfnhCnGJWHIx7M7BV4Hhro6JPrUCQ6VYJCzSJLXl0MpHMMkj5yyzyWfPT5L
	Y7fulzLr7K6k4X0ml0Guiad/YTg1DKsF3hQDl+zRllbKQrvLBzyWvD4qkcmYNyISlkEgSVHNhz/
	CvjJ2EVYja2gT6R/Xts9CLe0HF4LR7iMsex79Fboxe4Zdhtc4YhcqiW9k8im1scDQ6mkGCU6Qsr
	HPvQXPxQDzgojAofL0NP9pxdpqJQHp4JJVWUh+peJqtI62BYRlgxKvQYwXf6bYC/0CIE+5+R2B0
	A6SwyZi+6UH3Zpx5fgoH4yJXBEUN0w0+XniiBC5o2XP4fmYiGuyd+tN2L0qFIXO87Maq31HYiy5
	QW4Hpu+CaNy29k+CKeZiDLJ2iymZ6q1VCg6S5knvFQI957Kw0Q5PPvcNbHEeP7aDfEAW2RuNdZ/
	Fnnqj7mwKOAS8iEEPczCdIKxhq9jyqmB7IWWcn22hEgABaeWECb+e4tEHtRFO/VJAcDTiYe+tiU
	Anv90rM9JsdRnr12OJAXJY0ug==
X-Received: by 2002:a05:6820:6ae4:b0:6aa:9be1:4844 with SMTP id 006d021491bc7-6aa9be14d0bmr55047eaf.5.1784667436247;
        Tue, 21 Jul 2026 13:57:16 -0700 (PDT)
Received: from [192.168.0.245] (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
        by smtp.googlemail.com with ESMTPSA id 46e09a7af769-7edaf94a494sm11134501a34.13.2026.07.21.13.57.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 13:57:15 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
Date: Tue, 21 Jul 2026 14:56:53 -0600
Subject: [PATCH v7 04/29] drm: fix config dependent unused variable
 warning.
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260721-dd-maint-2-v7-4-010fbe73b311@gmail.com>
References: <20260721-dd-maint-2-v7-0-010fbe73b311@gmail.com>
In-Reply-To: <20260721-dd-maint-2-v7-0-010fbe73b311@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>, 
 Jason Baron <jbaron@akamai.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Shuah Khan <skhan@linuxfoundation.org>, Simona Vetter <simona@ffwll.ch>, 
 Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>
Cc: linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-arch@vger.kernel.org, 
 linux-modules@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Jim Cromie <jim.cromie@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784667429; l=1088;
 i=jim.cromie@gmail.com; s=20260203; h=from:subject:message-id;
 bh=krCb8u5AazdMsEF9z+e+5QeJqi85jxNa/cGvt6tyuY0=;
 b=4M1ooBzHTgHpKgFhIU2vZ89NHilgFq/cQh/hvWXLai2vEDkjLvu3XSirc+eK0dRZWMohPAFVL
 Zfn8h9XTG/6CWHI77V78nTlSjqAbqe9MSXYq7/3dAJFbL+3xt8Yvtzu
X-Developer-Key: i=jim.cromie@gmail.com; a=ed25519;
 pk=C6E5ODlPQo7ZBynATXH9wg7K6HxP0pIXyf4s38Qw0XE=

__drm_printfn_dbg() does
  int category = p->category;
then does:
  if (drm_debug_enabled(category))

When CONFIG_DRM_USE_DYNAMIC_DEBUG=y, that macro doesn't reference the
category arg, because its optimized away, as not needed when dyndbg's
static-key is under the callsite.  Silence the warning by passing
p->category directly.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/drm_print.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_print.c b/drivers/gpu/drm/drm_print.c
index ded9461df5f2..ac0288dabfc0 100644
--- a/drivers/gpu/drm/drm_print.c
+++ b/drivers/gpu/drm/drm_print.c
@@ -216,9 +216,8 @@ void __drm_printfn_dbg(struct drm_printer *p, struct va_format *vaf)
 {
 	const struct drm_device *drm = p->arg;
 	const struct device *dev = drm ? drm->dev : NULL;
-	enum drm_debug_category category = p->category;
 
-	if (!__drm_debug_enabled(category))
+	if (!__drm_debug_enabled(p->category))
 		return;
 
 	__drm_dev_vprintk(dev, KERN_DEBUG, p->origin, p->prefix, vaf);

-- 
2.55.0

