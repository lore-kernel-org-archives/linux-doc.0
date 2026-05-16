Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A89C829ACCD
	for <linux-doc@vger.kernel.org>; Sat, 16 May 2026 20:30:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778963434; cv=none; b=XQ1EvRh0w6LvxqpidXBG56dM1sbvV3b+pg6TgO7ojDYGB3m/bLjyMt1Jigo7yzfoLimJnRpeFQR89nfh2wkv+J/DvDTRZD4yqwUrEdwpYzF6VPIGR22P29m9jtr4r9QZrp+Ra8QpmALC5V2yPTi8GWh4g4pJyCSdjd7bi5EKW+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778963434; c=relaxed/simple;
	bh=NgG7c/3HifMrXF+hurQ67sFXdJackyEaDrNuCaV1jLA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BlTMzokCHMueVZbX7RD5GxLznQijZiZ4OMHWwjZsM7DoRv3G5VaPVLj1IP2NCdpt71eR1RDwB2V0p94t1BLGMMns+wrJwrSztSWKQfmV4kUwg67A0OAb4l5W/3VTe9z6RUne/u4YgJ4XSqcAD/BAUPno3CGkXCLCdjs4+uaoouo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O4rPzPP8; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O4rPzPP8"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-67be871ed3fso2713236a12.1
        for <linux-doc@vger.kernel.org>; Sat, 16 May 2026 13:30:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778963431; x=1779568231; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=A2SnpYX99cRNTw4ZpHBuGZFwe81HvPv2StYkxx5LEus=;
        b=O4rPzPP8AvcB50Ruj6z/Gum87Vt07fVRYdMSmJXXQpPCchpGmULLidYMI+YsNW/51Y
         +NKxb4M6tY/ngvpSa+8Ygr6lLPD5/8P1dyssjGUvszg6sJd5dtN+i+YSuYZsTQeK/nEJ
         rSZJTjVtOz9AaddH+jTIc9/ae6IdTMpJOB43SC0YQPLTnpzcYJMLETxVsqt6y86mpcdr
         117vQZh2YjGXincYkqHUA6SB5zpWT+wcKA6+K9zgwvpG9m1LSSDcljzZR9Zf3gnwIZnq
         iJCuA7z0EB3nQHWI1miK3MAU1N5sdgsxCQhb2IbTIE/f7koE6Dta+S2xIosXQkf5jGK8
         MiqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778963431; x=1779568231;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A2SnpYX99cRNTw4ZpHBuGZFwe81HvPv2StYkxx5LEus=;
        b=bzd3pUS4DtA+pzq0ras+35vzUMgPXvgqpKx7FsTolTyJ47ZZsTn7y3L/kMO+hcTSit
         jvNYJy6H3yvTk2NypT7VSMBn2uIja6DqymRgRWqnP3l5mmEoY8iqWyt0yTfgVqcx6VGt
         SO5SUA6c7W0D6sO8nHjmCqkp+SF4DBrcuEhPc5ehH1nULR8b3D76lj870qlldoeyPedQ
         DmSlLQkZd4ndY53HZPWu1evL6Z59HF7rD81K43bmmWEhDi3neNfQ5BcM41/z9X1hTbUt
         hSY5e7V4nW9+nLk5q4aVschQ08xfKbVXayj5xwzOcx+Ls3gl8i+HDC6qbsPqcMKKgmYF
         l6Pg==
X-Forwarded-Encrypted: i=1; AFNElJ8HC7y1rdEHWBJkJEhuvkcPbXmhTo+M6cqasIVELCHmGxaFKpJEqKITgPMpE6VbIZpo37zNlm+laD8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+/ydtXEvA2no3P915+GU3qoTMHmNJxO0sfmiAVgQeGCbI8k74
	cnl7/kJQKpzkHfceaDyYX+mfubm/7sKKQru3sBjDwyC4NdjzxrevPqYt
X-Gm-Gg: Acq92OGboYcG6Hi+/Sca3+/qtWjqZbQK/nTes8GUMb/iE/NCyTR408kAUALz7Wi7rnT
	H4xGmLPRn6VjzjG4pCXXOY/lkaowB0AbT139Aiak9o/xBOMFH2An/AlP1yX2IxGAmmuVLMnaI/o
	G4hKdz+W39hRKPp7UoWNRN6q+6xWwaOm5ucLBQIMxNTwBKscavS425/O+1znWN1qKXXNbn5ymiv
	HIzu4EbY/uqMvdTZ5CiDHWtAx+LBUew7ThmRiqQkpuoo5C0KfTtd5KCqwuR3mpwVXfAS+pxvsrB
	/7O78QnnlTnRVSNSzNQCRAhW3vMzCvfvcRAR8XPXod8tZwv0j3plclnetzwmNh6zJETg8tr1FI8
	BfBTzpyfEZSyJWVC5T3tXHITb8XT7c6w88sdcWrbbBtuJ+aiEyhXXiG8IWNdZLzITcXl4xbIQup
	7hiHhcOma4Usn9
X-Received: by 2002:a17:907:388b:b0:bcb:cc44:e144 with SMTP id a640c23a62f3a-bd517967f9cmr421444866b.24.1778963430906;
        Sat, 16 May 2026 13:30:30 -0700 (PDT)
Received: from Godswill ([102.90.99.61])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bd4f4bcf492sm382423766b.6.2026.05.16.13.30.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 May 2026 13:30:29 -0700 (PDT)
From: Godswill Onwusilike <onwusilikegodswill@gmail.com>
To: David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Shuah Khan <skhan@linuxfoundation.org>,
	dri-devel@lists.freedesktop.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Godswill Onwusilike <onwusilikegodswill@gmail.com>
Subject: [PATCH] docs: gpu: drm-uapi: fix spelling of "unprivileged"
Date: Sat, 16 May 2026 21:30:15 +0100
Message-ID: <20260516203015.33466-1-onwusilikegodswill@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct the spelling of "unpriviledged" to "unprivileged" in DRM uAPI documentation.

Signed-off-by: Godswill Onwusilike <onwusilikegodswill@gmail.com>
---
 Documentation/gpu/drm-uapi.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/gpu/drm-uapi.rst b/Documentation/gpu/drm-uapi.rst
index 579e87cb9ff7..8717744f0fec 100644
--- a/Documentation/gpu/drm-uapi.rst
+++ b/Documentation/gpu/drm-uapi.rst
@@ -568,7 +568,7 @@ ENOSPC:
 EPERM/EACCES:
         Returned for an operation that is valid, but needs more privileges.
         E.g. root-only or much more common, DRM master-only operations return
-        this when called by unpriviledged clients. There's no clear
+        this when called by unprivileged clients. There's no clear
         difference between EACCES and EPERM.
 
 ENODEV:
-- 
2.53.0

