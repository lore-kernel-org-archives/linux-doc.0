Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC9FC19CD03
	for <linux-doc@vger.kernel.org>; Thu, 16 Apr 2026 02:17:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776305858; cv=none; b=ZG7+doetpiaV6YfdZMt85m6/WnJpXrLF7Q6lpu5UD7xNh2C0gXivCI2YT+CtZeO7UWTbgNOXBhe5V784k0nj4fQgCOSPRpd2Wa/jmLQ3zKH2kUh9qISv7Rlg4IUrIuFrcyTy6fF10wssl2b5d2QU+ersQ0kJNwT/PXO3wseACX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776305858; c=relaxed/simple;
	bh=IBhVK8pOaRwLdXuw8xdFQ0lvY2/HqSpim1WWTKwj9WM=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=obfwW1Sbgau0VQLNsvfl6xuLE9glzyGpyYqOSIbxdUPgtRHzEcM/Zstf372ZlNM0IyDuzk94puTaBITk2QN8gC6Z1XUx+VMO3SJ6J0D3wLEfKgPbu2f+LermBST5+RF6CIRPrWPjB2fXjYv4wH51q++fLnnk/K5/592/r3xQZho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J/xDdVuM; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J/xDdVuM"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2a8fba3f769so34109185ad.2
        for <linux-doc@vger.kernel.org>; Wed, 15 Apr 2026 19:17:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776305857; x=1776910657; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=YiM99jgiXcT6WCgvh8nGGr5bdaeTxUPbaDjRT/oKk8M=;
        b=J/xDdVuM/zTV9z4yWlm29prytVkd+nzeuO/0rw6ybVkHgrtXNXXMExztiQgLE/tzr8
         yB53aRktOapkXLpYk60XF7xj9K2CguOxwtoJCBbPAfZhe4UUl2i5N4kLx1UBnhx0QJEt
         O7SJl7Xw7ypqMmZnM+Gv8Xsn83Cpj6/JnKy9L5bRUUUS3YsYTIIvsJgR0qeJruv88YKJ
         bLEKDF6gJrICT0/Xzi09gPDdi54mWNhQucnyJRlIqvnNweSIu5hhLonm6+7UEww31oLj
         ZWBgTlLDXvgakCEIux43O1FLmWjmW9YGILlW62+y16R1gpbHQ53BuhRZPxecM4BW4uNj
         ShRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776305857; x=1776910657;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YiM99jgiXcT6WCgvh8nGGr5bdaeTxUPbaDjRT/oKk8M=;
        b=pBFLT0m8/TeVgLZBjC7UZjtMsqfTJdOGsu2WejBM07ZZzelt6FJXyBxd1e+XWwMpxB
         jBpSJhtiSPKSALqFD05VbSmTV2xpFD9RzYVPdJ6JxOn6x4RIISBWvRvDri8SteN6dPGN
         VVU779ikP8N0btURJRwxlyPCj9mpjjxcYebLkRCdbZKJKwSuAZDi/miCe2Bf7ONYR8vw
         LrKnWuXKc69dCSR/CDMszAAE3zlLeAU/d29DPqNaEe8dyFB8di+no8mQPuU89aueTdhy
         n8dOODfTmVmAjAaPcnSFqjIo09vofiadP5Z63r+Ft5oZBSZEihEB5H5lxIqLLgkxy67J
         UyqQ==
X-Forwarded-Encrypted: i=1; AFNElJ8JKPgaw1dkv3jHy2hKqxLD/2kMCwRPf/A+6XZr54rRzAF36bSrqcAIPpOqs+VS+2COjXfVaxmt0yY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzY+AcaeLGcFPsJxvGfnDAPQd+fg0fTlvv4erZUkYh3ezicUZoa
	eROkrPUhz/eD55y9Y5OHO7sKC8nH/ThfLJM89UJ70a14GgnSLDmn/aZ/
X-Gm-Gg: AeBDietgf/NSANcwM4erHA8Ltd7prC1YzmtdPL22wiQAw4zxgFcTxW+4C0atu3T+821
	RdktiVNQR6nKdxwpUPOaI3dJ+5Eu8W4FDGLzr4RwOEcraNTkSQ5LIQDZNaLtP2DaeDfgc3I5CCK
	JVAYteH0Ga5KoIVmtMlKz7TPrfHDLAU3r2UOwzZSFq8qWiZfnLKAa4uZ6F3pYv+3ELVjMxShpKo
	rGcpDZLlxccE4CsexMP/REEcdpYTM2jNNjwD3onujKA6RJekROI6ST/SxtIFXUur7DaiWUncMc0
	2IvNRYJEmoSx6bEEPD8eSyQHmr3wvZUEJOql+sr6TM8jo+61p2n5Zi9DA4pHRmCZNOaP0ki2pUo
	iGwyu1m5gTp89XtDTAG/a77cO5IlQ7lPcamoJTeCiXZENaenkF7phAqU7BnsrP3Pj23YO9ZKMux
	Om+JDDmJyCnCxj1dzhHM2DPI5obEYTPGCTV+A4+M14IoQ=
X-Received: by 2002:a17:902:7001:b0:2b2:4e5c:69a9 with SMTP id d9443c01a7336-2b2d59411a0mr157321785ad.5.1776305857115;
        Wed, 15 Apr 2026 19:17:37 -0700 (PDT)
Received: from ehlo.thunderbird.net ([2401:4900:78f0:5b08::e2d:a51])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b47826e23dsm43589825ad.39.2026.04.15.19.17.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Apr 2026 19:17:36 -0700 (PDT)
Date: Thu, 16 Apr 2026 07:47:32 +0530
From: Sanjay Chitroda <sanjayembeddedse@gmail.com>
To: airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, corbet@lwn.net,
 skhan@linuxfoundation.org
CC: dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH=5D_Documentation/gpu=3A_resolve_?=
 =?US-ASCII?Q?kerneldoc_duplicate_declaration_warning?=
User-Agent: Thunderbird for Android
In-Reply-To: <20260318143612.2533863-1-sanjayembedded@gmail.com>
References: <20260318143612.2533863-1-sanjayembedded@gmail.com>
Message-ID: <A2B5F0ED-8C58-4A88-A4EA-8DA50289ECB5@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable



On 18 March 2026 8:06:12=E2=80=AFpm IST, Sanjay Chitroda <sanjayembeddedse=
@gmail=2Ecom> wrote:
>From: Sanjay Chitroda <sanjayembeddedse@gmail=2Ecom>
>
>kernel-doc build with `make htmldocs` reports following WARNINGS=2E
>
>  Documentation/gpu/drm-kms:360: =2E=2E/drivers/gpu/drm/drm_fourcc=2Ec:39=
7:
>  WARNING: Duplicate C declaration, also defined at gpu/drm-kms:35=2E
>  Declaration is '=2E=2E c:function::
>  const struct drm_format_info * drm_format_info (u32 format)'=2E
>
>  Documentation/gpu/drm-kms:491: =2E=2E/drivers/gpu/drm/drm_modeset_lock=
=2Ec:377:
>  WARNING: Duplicate C declaration, also defined at gpu/drm-kms:48=2E
>  Declaration is '=2E=2E c:function:: int drm_modeset_lock
>  (struct drm_modeset_lock *lock, struct drm_modeset_acquire_ctx *ctx)'=
=2E
>
>  Documentation/gpu/drm-uapi:607: =2E=2E/drivers/gpu/drm/drm_ioctl=2Ec:92=
3:
>  WARNING: Duplicate C declaration, also defined at gpu/drm-uapi:69=2E
>  Declaration is '=2E=2E c:function::
>  bool drm_ioctl_flags (unsigned int nr, unsigned int *flags)'=2E
>
>Add :no-identifiers: to prevent duplicate identifier generation and
>keep the function documented at its implementation site=2E
>
>No functional change=2E
>
>Link: https://lore=2Ekernel=2Eorg/oe-kbuild-all/202512302319=2E1PGGt3CN-l=
kp@intel=2Ecom/
>Signed-off-by: Sanjay Chitroda <sanjayembeddedse@gmail=2Ecom>
>---
> Documentation/gpu/drm-kms=2Erst  | 2 ++
> Documentation/gpu/drm-uapi=2Erst | 3 ++-
> 2 files changed, 4 insertions(+), 1 deletion(-)
>
>diff --git a/Documentation/gpu/drm-kms=2Erst b/Documentation/gpu/drm-kms=
=2Erst
>index 2292e65f044c=2E=2E0f0f90b3186d 100644
>--- a/Documentation/gpu/drm-kms=2Erst
>+++ b/Documentation/gpu/drm-kms=2Erst
>@@ -356,6 +356,7 @@ Format Functions Reference
>=20
> =2E=2E kernel-doc:: include/drm/drm_fourcc=2Eh
>    :internal:
>+   :no-identifiers: drm_format_info
>=20
> =2E=2E kernel-doc:: drivers/gpu/drm/drm_fourcc=2Ec
>    :export:
>@@ -487,6 +488,7 @@ KMS Locking
>=20
> =2E=2E kernel-doc:: include/drm/drm_modeset_lock=2Eh
>    :internal:
>+   :no-identifiers: drm_modeset_lock
>=20
> =2E=2E kernel-doc:: drivers/gpu/drm/drm_modeset_lock=2Ec
>    :export:
>diff --git a/Documentation/gpu/drm-uapi=2Erst b/Documentation/gpu/drm-uap=
i=2Erst
>index d98428a592f1=2E=2E73b49e0dcda8 100644
>--- a/Documentation/gpu/drm-uapi=2Erst
>+++ b/Documentation/gpu/drm-uapi=2Erst
>@@ -603,6 +603,7 @@ DRM specific patterns=2E Note that ENOTTY has the sli=
ghtly unintuitive meaning of
>=20
> =2E=2E kernel-doc:: include/drm/drm_ioctl=2Eh
>    :internal:
>+   :no-identifiers: drm_ioctl_flags
>=20
> =2E=2E kernel-doc:: drivers/gpu/drm/drm_ioctl=2Ec
>    :export:
>@@ -761,4 +762,4 @@ Stable uAPI events
> From ``drivers/gpu/drm/scheduler/gpu_scheduler_trace=2Eh``
>=20
> =2E=2E kernel-doc::  drivers/gpu/drm/scheduler/gpu_scheduler_trace=2Eh
>-   :doc: uAPI trace events
>\ No newline at end of file
>+   :doc: uAPI trace events

Hi all,

Requesting your input on the change=2E
Is there anything that I missed or required correction ?


