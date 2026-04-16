Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 242A6378D79
	for <linux-doc@vger.kernel.org>; Thu, 16 Apr 2026 05:41:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776318077; cv=none; b=gg+nSAarxbdahZFPdFoIzSfamaLI6yGs3j+JCZNcjdJLtqZNjnP6/UscVLY47O7iGu7X/hzMP9smtSwTDcdWSn0FFLpM9l5CxI0e3dXm9JYU6sp4TFdzd6kr3hAnoXgRAlKZYcmenxgsYqwJhSSj0utmPLtPV6i18rbbbWQhElg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776318077; c=relaxed/simple;
	bh=IvLO3UgIfErQY6AqaYtmmRdkEYdt0UIpEUIZDMSNT/A=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=JZm9SEm0nqfigE5wiIlMvu69TotfinIlSJXLcm4sUaCfLfKZxq5QvTyh108doZFVVo/DY11y6tBVoZaWn3Q5eWVKP3kCOGfQqGzO+Aw0K4AZQkt9cixRaHq4tZIbqpCStl2Cm7BewrqW/XPUt/W0WaRVMMFtIuiTEjYsv3BoQ+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YjdyffSE; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YjdyffSE"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-35fc2b18363so3661460a91.0
        for <linux-doc@vger.kernel.org>; Wed, 15 Apr 2026 22:41:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776318075; x=1776922875; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language:subject
         :references:cc:to:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Cag2ptL6wrm0V5bGbrcQIfwBYr+GeQUuV1iySRth4GY=;
        b=YjdyffSETEAoC3gwx50GHuvyi8nz7urfr+gUq6LyAP71Xkv4imTvb46FHNbdP+fZLG
         O+B5+lr7ZyLIPmL+CVlHb158iGp062ggwaWHHuT/ztayMHU52Cy4u3y3CDZGBcIMIQsw
         Y8smB5TLS+Eu5pc/nKNKYtFEdcyY3qgC3SPd4HyHLlb1pxyQETdD4JkBTOqpe5XhESfS
         upOe+v5p0GL0HkyLcQPByv+hZMtXTOp3CW5GdEDYfcF0JERZMEoXJuMWeBnfkwUh5fZ0
         RpatPUzIvdb0MB04U82mWJDn8s/ICJ6JoEV6qA5LoGUM62Q8CalF9IwSe1es0eQchw5c
         w8+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776318075; x=1776922875;
        h=content-transfer-encoding:in-reply-to:from:content-language:subject
         :references:cc:to:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Cag2ptL6wrm0V5bGbrcQIfwBYr+GeQUuV1iySRth4GY=;
        b=tG1AVm5SBD67ywzex4vzKYNFF+KdkBDmePYcw/swDBzn3S21S41v6GXWtv1yVMzoU8
         nXgJC/fP3MW4odug/m/nSKVrWzC6ARtSetBwfs4x8o2G816Emqc3ILK+EDqqD6t1Ztwk
         Sf5MicAghTz3cd11F58hBL22ACeuodooW5fsQfR905V6ZF43Ei7pWiGy8cmmo6lvSAeD
         1Lw5nUytgRKHckQPb1sf3+SB4JIC85rCml2moyms4pp47pw7zS/s/ZHOjnPsOL7o5lB1
         yzRhztIH9pGj6ho4o+qYcWcvOje1kbC2zbbydOjseckKpsBRBxFvkW5G2u52j/iD0PFW
         uLUA==
X-Forwarded-Encrypted: i=1; AFNElJ98OguVljeAJav/I3Bs/zV6mylLIki2+BXlF4Hxei9UIwyBdx45XV9goCaGKdzhHRy7ZeX3pFXVayQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz98+WHDhBks7pD7hVDLeiHu2VsFz9O5V6P0O0zqEMvwWYFSGaY
	2V4cVPn3wEhzCpIH88o4K7JPB4PZbE//hPxvY+3217giQ27QhP6ThGdu
X-Gm-Gg: AeBDietaNIv0Vcr2fNi8Vo7gmSPIUlzKD/dMt83EYdZ4i1X+OboWYyQl+GyD6JjD7RC
	vDMq8RIRyiQvn8Le2rpdbrJl/34ISbOSfCiqoK/R0+xxGxomRyYgdDPn8Rk11nknvQ5KxV/kmdr
	7/byxe/wwIAbQVk01oEaoKN9OTQd19IS4i2gxbER+6/eWybCBNNHG1qwlyDIsg8YE/iXz9dwVmI
	490sqq3yJjJs3egDfL1tWnhEpw/X8Bbrni8mNyivv4U6B9p3GkmlRgTXeT9vG9Ni6vtXOpmGIAh
	U0rfnQE1elu/rp6vvwy9QN+jXLL2MgMtq27zRF2Kpc9CxV85undVbBuVVEsgWomnUdXqoD84ECt
	BMz6CavrJQM+9hkBu5AWYUAZIDlPE1uy5X9hmvYh0amTEZ2qWd7AvP7MrMQ5r3t3oEJEvS1TgGU
	xF9glexNgA0GbD5fUb+MJL1DLodLCrqn8bWhTgggDZBMZmelJGZZXTsYrpMOk9qMI1qN4i
X-Received: by 2002:a17:902:c94d:b0:2b2:3eec:c75f with SMTP id d9443c01a7336-2b2d5a3837emr259023135ad.28.1776318075370;
        Wed, 15 Apr 2026 22:41:15 -0700 (PDT)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b4782b6704sm55716045ad.75.2026.04.15.22.41.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Apr 2026 22:41:14 -0700 (PDT)
Message-ID: <6d754f54-d1c8-4175-a0f0-dd51eb26930d@gmail.com>
Date: Thu, 16 Apr 2026 14:41:12 +0900
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: sanjayembeddedse@gmail.com
Cc: airlied@gmail.com, corbet@lwn.net, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, simona@ffwll.ch,
 skhan@linuxfoundation.org, tzimmermann@suse.de
References: <A2B5F0ED-8C58-4A88-A4EA-8DA50289ECB5@gmail.com>
Subject: Re: [PATCH] Documentation/gpu: resolve kerneldoc duplicate
 declaration warning
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <A2B5F0ED-8C58-4A88-A4EA-8DA50289ECB5@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello,

> On 18 March 2026 8:06:12 pm IST, Sanjay Chitroda <sanjayembeddedse@gmail.com> wrote:
>>From: Sanjay Chitroda <sanjayembeddedse@gmail.com>
>>
>>kernel-doc build with `make htmldocs` reports following WARNINGS.
>>
>>  Documentation/gpu/drm-kms:360: ../drivers/gpu/drm/drm_fourcc.c:397:
>>  WARNING: Duplicate C declaration, also defined at gpu/drm-kms:35.
>>  Declaration is '.. c:function::
>>  const struct drm_format_info * drm_format_info (u32 format)'.
>>
>>  Documentation/gpu/drm-kms:491: ../drivers/gpu/drm/drm_modeset_lock.c:377:
>>  WARNING: Duplicate C declaration, also defined at gpu/drm-kms:48.
>>  Declaration is '.. c:function:: int drm_modeset_lock
>>  (struct drm_modeset_lock *lock, struct drm_modeset_acquire_ctx *ctx)'.
>>
>>  Documentation/gpu/drm-uapi:607: ../drivers/gpu/drm/drm_ioctl.c:923:
>>  WARNING: Duplicate C declaration, also defined at gpu/drm-uapi:69.
>>  Declaration is '.. c:function::
>>  bool drm_ioctl_flags (unsigned int nr, unsigned int *flags)'.
>>
>>Add :no-identifiers: to prevent duplicate identifier generation and
>>keep the function documented at its implementation site.
>>
>>No functional change.
>>
>>Link: https://lore.kernel.org/oe-kbuild-all/202512302319.1PGGt3CN-lkp@intel.com/
>>Signed-off-by: Sanjay Chitroda <sanjayembeddedse@gmail.com>
>>---
>> Documentation/gpu/drm-kms.rst  | 2 ++
>> Documentation/gpu/drm-uapi.rst | 3 ++-
>> 2 files changed, 4 insertions(+), 1 deletion(-)
>>
>>diff --git a/Documentation/gpu/drm-kms.rst b/Documentation/gpu/drm-kms.rst
>>index 2292e65f044c..0f0f90b3186d 100644
>>--- a/Documentation/gpu/drm-kms.rst
>>+++ b/Documentation/gpu/drm-kms.rst
>>@@ -356,6 +356,7 @@ Format Functions Reference
>> 
>> .. kernel-doc:: include/drm/drm_fourcc.h
>>    :internal:
>>+   :no-identifiers: drm_format_info
>> 
>> .. kernel-doc:: drivers/gpu/drm/drm_fourcc.c
>>    :export:
>>@@ -487,6 +488,7 @@ KMS Locking
>> 
>> .. kernel-doc:: include/drm/drm_modeset_lock.h
>>    :internal:
>>+   :no-identifiers: drm_modeset_lock
>> 
>> .. kernel-doc:: drivers/gpu/drm/drm_modeset_lock.c
>>    :export:
>>diff --git a/Documentation/gpu/drm-uapi.rst b/Documentation/gpu/drm-uapi.rst
>>index d98428a592f1..73b49e0dcda8 100644
>>--- a/Documentation/gpu/drm-uapi.rst
>>+++ b/Documentation/gpu/drm-uapi.rst
>>@@ -603,6 +603,7 @@ DRM specific patterns. Note that ENOTTY has the slightly unintuitive meaning of
>> 
>> .. kernel-doc:: include/drm/drm_ioctl.h
>>    :internal:
>>+   :no-identifiers: drm_ioctl_flags
>> 
>> .. kernel-doc:: drivers/gpu/drm/drm_ioctl.c
>>    :export:
>>@@ -761,4 +762,4 @@ Stable uAPI events
>> From ``drivers/gpu/drm/scheduler/gpu_scheduler_trace.h``
>> 
>> .. kernel-doc::  drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
>>-   :doc: uAPI trace events
>>\ No newline at end of file
>>+   :doc: uAPI trace events
> 
> Hi all,
> 
> Requesting your input on the change.
> Is there anything that I missed or required correction ?

Your patch is ignored because there is no duplicate in those identifiers.
As you are well aware of, you can have a function and a struct of
the same name.

It is a long-standing bug (almost 6 years now!) in Sphinx C-domain support.

Please have a look at my earlier email:

    https://lore.kernel.org/f735ce0b-db1e-49bc-86ac-b5ab8e4aec31@gmail.com/

It is dated "26 Mar 2024", but the issue remains unresolved.

I'd appreciate if you could make some contribution for fixing the Sphinx
bug.

Regards, Akira

PS: Please ignore several typos I made in the earlier email ;-)

