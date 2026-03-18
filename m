Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 492E13DBD47
	for <linux-doc@vger.kernel.org>; Wed, 18 Mar 2026 14:36:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773844581; cv=none; b=Os1Css0l6bNOuxomfZrydZf7U/NE6YiH9qnHBnw7x3r0MpTgd+ASNCybpxTq3xgAqNIyBsH6fOwheczerArHRIb1Z513iAHW2cjTyewFa9yzQhoIqea8nvhudV0ZnOfMK66iTMvmgjvn2haXo13Jn1I5EpVf/JHUJtC3XpLHlfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773844581; c=relaxed/simple;
	bh=zt6n+MHwPLaSkNTNZKSy9t6IW5UBBrzEBFha3Girfko=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=U9odE2eGzK2OuXUFmJ0irOV8o/h3G4/nzlBSiIZEEOvUhCyCf2xA1u/Xu9dof0MSPLF+LTedvgx6pTGtbH3jhzV/vZcYiA0v3MifSrPaT8y5vw/eSCex9AIViT/MqaFGNQ608t1mDbscLW296/FS3AJcjIAv9yLK55ZkrfpStEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TyfmiS+7; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TyfmiS+7"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-829928e512aso3595512b3a.2
        for <linux-doc@vger.kernel.org>; Wed, 18 Mar 2026 07:36:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773844579; x=1774449379; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=T/zERP7+K/iV+VDILg//lKZjo5Bu+2vkBPqMNeIXFFg=;
        b=TyfmiS+7sfxik0G/LGctrep97eHi0rBISeWUotJGwh/axtTnR6MdTSl7OQ89K5Q+MZ
         zw2J7VQ5+UvjMFMAIs+BU6czoP+pA9Ar2AbIZP1+N4+BQQtfEQRcNAE40fwj54lxf7Lu
         rqUovsPb3fr/vYRtklQi9t7VFSUzTzmKP9+r7zfHAcnpCBhNZwZhVPtEDWvwfBry+te+
         xiI5goEZ/kjc+yiUH4AC4dp5IVDe8jDMzgft5r/LavB7VjAOUyIc1lFbalabBRCbe+F3
         sjuh6YeCK1WQm16xXItAuu4/GttmcTZVwMFrUcommYmJPZsmQ6/YcSWnfj2fIF4U1VKg
         NvrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773844579; x=1774449379;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T/zERP7+K/iV+VDILg//lKZjo5Bu+2vkBPqMNeIXFFg=;
        b=HjPLmPsLyVmnko+Zdob9O0D/HL4iqeqmWSe0SEZV6HIHFL74v+BgFTUwTKHrH+4Am3
         KpiRbxSINVin6a4uOhR9wwAVWkj9YXN3iBfit3trsOupkhyYs/9MRqWL7mHoN7fMxxHY
         IdLsDS1avfbL1UE1WkILxa+t/vcmDUASOOE6KIHcBVRUhVyG3c987Nk1+mAPnYY55h1r
         +kDNTL5Hvb/+Gxb5ixPJ+quzTaODrtrbgrL+8mhxywDounu/Wvch8YbxjQQqSAZqonYc
         FCmOYOi28T7WmuWEqFgwsDhosOBSUzDBc9rw4oaQwT1zqIsZF2mSvjBz6vUrNJRzJuCz
         b0EQ==
X-Forwarded-Encrypted: i=1; AJvYcCVQBNAMT0+6QH40CYucQNnztAtDODesbJyd0XU01/RnzVOWHP8nfXZemZRIO6fk6G83YD7O+8uqXeE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxJz9MaQ4Ldwb+tmgj/b+DfRJ5phZN+PRQlLAbS8Qb97NIGVi0E
	O5tTZ/ULKOzFIlHid2CvcZ3s9FHeNSmdtNp+ZZOggQeFb3RpgtpK4CUn
X-Gm-Gg: ATEYQzx3sNx2qHgaPOhzFIdlgaykFANKobbnHQndHrwCMN4FkcwzJr9S6LQAzQoBNzG
	aU/KgkF2VCmCXdHdnTP0KY1h8EP8Y0WVDfI5V/JbMaMM8IG8zSLPKntCGdBXs9+/dmSGJVLJJxK
	x2v5X+SqDtzwMdHUscPGDw/pUMlyKaR1Emme6wv7KJTWULZAb8Rn8LQZfuWmre3PWkN+nLp1gk0
	LnLRddJ6HRnjWOfGTYIsrMZg78RiYJYFbJP25b0A7sPaglttptYLkMMBfJmK42onBH6gjeJ1VHK
	NkQ9EG8khcGqbOnQ287dLSZ3XdiHwzNuh/h/3vFUODIivaSA6lwSEsF5mU6la+FdgnAIXtkUI0n
	UoT69NQQlld+4CXEjplcJkSO7vUbznnpxaeQfcPXIfJ0NRMdqnLLgsoPr7mSehU37jS2uLeFORE
	2uSOK/+b5pMKp74PQPbJ2BriVewAW0HayOODkrQThTNcDQMBIU
X-Received: by 2002:a05:6a00:1992:b0:829:8aa3:2ebf with SMTP id d2e1a72fcca58-82a6ac3955dmr3503745b3a.2.1773844579411;
        Wed, 18 Mar 2026 07:36:19 -0700 (PDT)
Received: from hu-ckantibh-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82a6bf0cf5fsm3767592b3a.61.2026.03.18.07.36.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 07:36:18 -0700 (PDT)
From: Sanjay Chitroda <sanjayembeddedse@gmail.com>
X-Google-Original-From: Sanjay Chitroda <sanjayembedded@gmail.com>
To: airlied@gmail.com,
	simona@ffwll.ch,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	corbet@lwn.net,
	skhan@linuxfoundation.org
Cc: dri-devel@lists.freedesktop.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] Documentation/gpu: resolve kerneldoc duplicate declaration warning
Date: Wed, 18 Mar 2026 20:06:12 +0530
Message-Id: <20260318143612.2533863-1-sanjayembedded@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Sanjay Chitroda <sanjayembeddedse@gmail.com>

kernel-doc build with `make htmldocs` reports following WARNINGS.

  Documentation/gpu/drm-kms:360: ../drivers/gpu/drm/drm_fourcc.c:397:
  WARNING: Duplicate C declaration, also defined at gpu/drm-kms:35.
  Declaration is '.. c:function::
  const struct drm_format_info * drm_format_info (u32 format)'.

  Documentation/gpu/drm-kms:491: ../drivers/gpu/drm/drm_modeset_lock.c:377:
  WARNING: Duplicate C declaration, also defined at gpu/drm-kms:48.
  Declaration is '.. c:function:: int drm_modeset_lock
  (struct drm_modeset_lock *lock, struct drm_modeset_acquire_ctx *ctx)'.

  Documentation/gpu/drm-uapi:607: ../drivers/gpu/drm/drm_ioctl.c:923:
  WARNING: Duplicate C declaration, also defined at gpu/drm-uapi:69.
  Declaration is '.. c:function::
  bool drm_ioctl_flags (unsigned int nr, unsigned int *flags)'.

Add :no-identifiers: to prevent duplicate identifier generation and
keep the function documented at its implementation site.

No functional change.

Link: https://lore.kernel.org/oe-kbuild-all/202512302319.1PGGt3CN-lkp@intel.com/
Signed-off-by: Sanjay Chitroda <sanjayembeddedse@gmail.com>
---
 Documentation/gpu/drm-kms.rst  | 2 ++
 Documentation/gpu/drm-uapi.rst | 3 ++-
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/gpu/drm-kms.rst b/Documentation/gpu/drm-kms.rst
index 2292e65f044c..0f0f90b3186d 100644
--- a/Documentation/gpu/drm-kms.rst
+++ b/Documentation/gpu/drm-kms.rst
@@ -356,6 +356,7 @@ Format Functions Reference
 
 .. kernel-doc:: include/drm/drm_fourcc.h
    :internal:
+   :no-identifiers: drm_format_info
 
 .. kernel-doc:: drivers/gpu/drm/drm_fourcc.c
    :export:
@@ -487,6 +488,7 @@ KMS Locking
 
 .. kernel-doc:: include/drm/drm_modeset_lock.h
    :internal:
+   :no-identifiers: drm_modeset_lock
 
 .. kernel-doc:: drivers/gpu/drm/drm_modeset_lock.c
    :export:
diff --git a/Documentation/gpu/drm-uapi.rst b/Documentation/gpu/drm-uapi.rst
index d98428a592f1..73b49e0dcda8 100644
--- a/Documentation/gpu/drm-uapi.rst
+++ b/Documentation/gpu/drm-uapi.rst
@@ -603,6 +603,7 @@ DRM specific patterns. Note that ENOTTY has the slightly unintuitive meaning of
 
 .. kernel-doc:: include/drm/drm_ioctl.h
    :internal:
+   :no-identifiers: drm_ioctl_flags
 
 .. kernel-doc:: drivers/gpu/drm/drm_ioctl.c
    :export:
@@ -761,4 +762,4 @@ Stable uAPI events
 From ``drivers/gpu/drm/scheduler/gpu_scheduler_trace.h``
 
 .. kernel-doc::  drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
-   :doc: uAPI trace events
\ No newline at end of file
+   :doc: uAPI trace events
-- 
2.34.1

