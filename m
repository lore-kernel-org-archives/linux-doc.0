Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2F58DF78
	for <linux-doc@vger.kernel.org>; Sun, 16 Feb 2025 16:07:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739722041; cv=none; b=tD28FTEYIWbHko/424icsAe0Gy8qQ8NpSlQQwSrbN0tPOvM6dtgS2PX83E4bC9gXHqwxf2Y+A3ho4A+NVOAiOnHGW6nDvQeAONGCnVv76Uv2B9Xre5gpZNy1yETet7k5IuYrVEcIHU5mtJZnc21wJ+nB+KMv2VN1bR8x5ukFGJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739722041; c=relaxed/simple;
	bh=lfy63d10TVAzvdPZgjlXe9IwI/+qYkcbIsADFxaWvYM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YBKXgG/ThQWVEQ3PqH/jR4A5wexqZDJGjKUHjCLKK8dI6RkjTwhNVJik/RAJgE24R5KZkNiSyPFBkdY/YJ3lcXHxw9zDb2P7xP7kQfku/Jo1H4VACRF8MBanMxDeCpDOGZ5SV0wBofydW2TQj0BZ3i1H047ye+3MeDWu9K0FJuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b7Gr1M4r; arc=none smtp.client-ip=209.85.219.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b7Gr1M4r"
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-e53ef7462b6so2648699276.3
        for <linux-doc@vger.kernel.org>; Sun, 16 Feb 2025 08:07:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739722038; x=1740326838; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6iPa/Xb15+WDJ2CY3q0/6SiYUGVUoPdsYuO6cqB2+Sw=;
        b=b7Gr1M4r49EOhNoR4t2BaihjgBK4rnWOgs4zJJXI2qAEvxPSoMzQmjQ/mQAIGsvkb2
         Nnv1/Z6WIaSTDbLyvBRPqLYh4oecSXI8ZAEaaK1AeitzP+U3n4ydM4UxNRFE+ZBh11mq
         BCJCkGylvVsZPoQzrrzhJ1NtNl/76CdkDilUD0730Nsx3e4BUD9E4pZqTTH97zDheV1H
         lAxA81lTHY34B24GnEIort/BROkFRNwRTEWiQWYBUHsSpiW6dLeUt+IwwY7pXK8kEXLy
         qQYhAg7a3cU1PAd09D47hYr7MdELYFG+HYE/u1k2B/yqOrx0LjGzja2/osJyT+c6Z08D
         +Anw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739722038; x=1740326838;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6iPa/Xb15+WDJ2CY3q0/6SiYUGVUoPdsYuO6cqB2+Sw=;
        b=ckP2PF5lZKxddCpOfxvI0plJKEUySLU1Nt1RzcELkY2HxW8NAtmPtnxDQmMIrCEzH4
         vq1lHbbOwsKYoMz32F7QDTIdysFGpUGjHUDlCdXr/ML51qd+RjBPTWu0gyp5P34wu77m
         YlRGw9Z0JPad6gzMPvytNGcLvEtr7psXuN0rDJO+MmZmmprfWMM1k/1U12HmtULnPGO9
         bjRSPHHFfla7tRdrchkmOznYp3PGPdHBviTyaHYHaVAl22QA+hwy8n0jIiQKyIkQlrtf
         prESLomdIc2joASHLg60nFsIYLrYyIJDVFn7qgJdbzghicYz505Cy8p0VkHPho2H98Gr
         NREA==
X-Forwarded-Encrypted: i=1; AJvYcCUsYnT3waWodaYQM2RMF0TKckwhOVhOV4+jFh4RgM3I//nMT+pBdA52+mPmfhZ7wUNWnCKRwApRT1o=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzrvrq1ECjkMXCLiaJ+3/11Df0dTBm1N0iZkhV1R1d5i//GPtbb
	8wrtGnOvuQD5TNL2gWAsc0ia8dI3DFPn45dn6jXDWW7QgKTcTU2J
X-Gm-Gg: ASbGncuATmKLXgeO6b1/HWhwgeccIH1CBzr0zmeuhx/eQf9MCgdAe91owXMeBxyEYNM
	pPE/pAQ0I2BWEt5O8yCitnXdjftv+2uaXxQ1U0Copox21sw/P5i97U2g4NtS9m40D2uCdhauJLD
	62tDOFGKdQx7QL14e5X+qDGNIv/oJ+vTbx6knh9jIZt7mp7igwjbaGDshdBMiVwCxrZ/MG7AnWY
	yt07ogNtq2Q9T07wX3ddYBJYBtNzDib8M9x+6Tw7mLeB7cEt5BECU18XV/FqR8sVSpTCStrBT7d
	ASMNDDqSVAQcn6jJ
X-Google-Smtp-Source: AGHT+IHjGvTzNIeuksBqzf/n3oqc7vFQla3r0CkTou875O+BckAZRMbc3UwuL3Am4DLP0YgqP9WKkg==
X-Received: by 2002:a05:6902:70d:b0:e5d:c7ad:fd3e with SMTP id 3f1490d57ef6-e5dc90499d2mr5289626276.16.1739722038612;
        Sun, 16 Feb 2025 08:07:18 -0800 (PST)
Received: from velo.. ([152.203.197.137])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e5dae0da252sm2193848276.43.2025.02.16.08.07.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Feb 2025 08:07:18 -0800 (PST)
From: Andres Urian Florez <andres.emb.sys@gmail.com>
To: corbet@lwn.net
Cc: Andres Urian Florez <andres.emb.sys@gmail.com>,
	skhan@linuxfoundation.org,
	linux-doc@vger.kernel.org
Subject: [PATCH] Documentation:gpu: fixed spelling mistake
Date: Sun, 16 Feb 2025 11:06:29 -0500
Message-ID: <20250216160644.18924-1-andres.emb.sys@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixed spelling mistake identified by codespell in the drm-uapi
documentation

Signed-off-by: Andres Urian Florez <andres.emb.sys@gmail.com>
---
 Documentation/gpu/drm-uapi.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/gpu/drm-uapi.rst b/Documentation/gpu/drm-uapi.rst
index 69f72e71a96e..64e002c6383c 100644
--- a/Documentation/gpu/drm-uapi.rst
+++ b/Documentation/gpu/drm-uapi.rst
@@ -518,7 +518,7 @@ ENOSPC:
 EPERM/EACCES:
         Returned for an operation that is valid, but needs more privileges.
         E.g. root-only or much more common, DRM master-only operations return
-        this when called by unpriviledged clients. There's no clear
+        this when called by unprivileged clients. There's no clear
         difference between EACCES and EPERM.
 
 ENODEV:
-- 
2.43.0
