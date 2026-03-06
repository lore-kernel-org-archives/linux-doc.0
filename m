Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E490349B02
	for <linux-doc@vger.kernel.org>; Fri,  6 Mar 2026 21:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772834215; cv=none; b=f7TwkK+nnFKfX5wHiQJc/qkHFvhKFAjJlTmjw1DmjyVEHFh5LUBNNXoYyzo6TI8W9jCMTQkpdelbPctawoeXg7mZH1mIlNQq/oSD9qTGEXJMnlHgpbnRccdLfh8LTN7wxETwWqlJPFryKRaO5J0S+Ez2XYhLLrN/zdVs5bxYXiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772834215; c=relaxed/simple;
	bh=XP/2CtHaBwe5aH4eJhaWt5QXLcd6F7ms7f5rp0yRVZ0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=M1sIrplg01AMGi1TJU92NSsneniv/ZN5ehFNohYHlNfVq3h6iH+0jFlAP6V4XhgdY8zUr/tpL8iWvN/T+nGikSBC/BPsBNuPNvC67CWZ9q9lesmcZumr7GdU7ZW6B3WUqGA0P0ERCnyrj4HTOo20AcwBHAcLlez/qtvTVQHsAwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lwPro++u; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lwPro++u"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-b9358bc9c50so1087325966b.1
        for <linux-doc@vger.kernel.org>; Fri, 06 Mar 2026 13:56:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772834212; x=1773439012; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=35KQxB0Jsk2c/EVSHuq57nHn/4x2hHiu2AGGQP2gI/U=;
        b=lwPro++udrgdZf00+glVrTr5Hj0sy9RalPJWJOpP7c/TMcZUBJPxuo9HBCPdMyNvgd
         OLZeu6gXORF+ZyJt4mREwKj03VxDiM7vhzzRnsZophIe9PXSbKXNXdQYBa94R9DKGjm7
         HHfMAb9zCc0tORKO0MUVdcISgHcDW+iU2jrLL7k5UFJJiun96IfuGw3xNHWn45hPHZu0
         EyPWK/zpONsrj9PE7lK2NMDaVei+hcErjdMxZXVTWCS9/cY20Az/10S2xcSdW8C9wXCB
         1A9NSTu1siuQ/bAhjRHXtgPczO3bExQdwzaOnBWTZDGH6itPZzL8Cs1JYKQ5T4Eg0HbC
         ZS/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772834212; x=1773439012;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=35KQxB0Jsk2c/EVSHuq57nHn/4x2hHiu2AGGQP2gI/U=;
        b=cWh8OKHKnj6oQdj+F/5sPphzDM5iZvHQ7OXNrLT4hzT/8T4McITN4+1/fOOrPe1YM6
         5quclW+44DvSgRpOH3BnFmlI23CWpH2I39tzvU2hCjuMGwVRx03ZTOumvotuPQPpuP1C
         rTkRAFRIigtpOzqOGR2REWMQUewfLG33gWd8z1yrhLNw6L/12xxhBKoQl4pHtQyNouCS
         m6rmbc8dtA+/VfX7hoPHZeNxvffnXlV/AIG1yv47oLqYI5gpPtFGYW0/45AIpQmK9Gqd
         qwcVsklinyta/JIFbQt2IJLFgCzRJlfrpWhzjzMZCSobxSir90P8SAJSpXXOI81HcvP4
         qvAg==
X-Forwarded-Encrypted: i=1; AJvYcCV700ttxZG89trK/32dCFqsXL5j9dWCxtY8YcQwk9HILnB+PVtKdXExuyP6igkDJbX/7pxgdTRVIaY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxGtXBF1tY9m2oPERu/iqTIF9zV6c0d2CoPIy3Q4WiFT242Me8j
	08gQDwNngfTOhaiAIsRFdEfrm/3Rqx4tHxlD/POj5LMYDKcCJ/mmbzzV
X-Gm-Gg: ATEYQzwKP0MmCo21/C8UeK7b4K8L68ncxpGDW5LzqVVHioZhhdQSSgvZKB/KeqMi4Sv
	uL0k+GVT/pnlKHrClziyxKt7QYlbK5ZW26f1QUxMjr4MevilMNqI7P7qgz8ec3i9Kg3rM3dhojR
	z6nY77+x4Z3nZf2V8J5SDcVjWV+/cN2OrCfHr0f26cBDfguqDSh/MT25FzyyMfRIT3Rti0sP22L
	+HCsUgQk3qKl83AZt8EevjwgXDgHOZIvJ62GlpmHazF0A9cpYbxpcqe8CB30Lmbwe+tw3ylUD4f
	hn5qRlbPIhAinueBnggsf/CxBmtO7MfPWWq3zjHpbWM++ofFecNJoXNQiC7WOOcKqK1HetfdKb3
	o/7/pxhT/SbAtr6bRuHwja+HAofNEQz6i0YZ9hTWB38r0a8SWLgSXl5ExP4yvxsHEGXAz+MU27g
	iuIB6GcrgtJEJAf8Z/0h82i9P+3YDLkSuiu3QSM6RabF/DoB+RJAdBQOGDYbTqi12SIhLB6agTy
	5OEwJPvfvLMCP4rrUCDOGOqnYDmIz3NBaGMt2Sm0R3UCt8=
X-Received: by 2002:a17:907:8dc3:b0:b87:1741:a484 with SMTP id a640c23a62f3a-b942e0f391bmr211004766b.43.1772834211770;
        Fri, 06 Mar 2026 13:56:51 -0800 (PST)
Received: from localhost.localdomain (84-24-131-219.cable.dynamic.v4.ziggo.nl. [84.24.131.219])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-661a4fd5ebfsm776416a12.16.2026.03.06.13.56.50
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 06 Mar 2026 13:56:50 -0800 (PST)
From: Mikael Rothig <mrrothig@gmail.com>
To: corbet@lwn.net
Cc: airlied@gmail.com,
	simona@ffwll.ch,
	dri-devel@lists.freedesktop.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mikael Rothig <mrrothig@gmail.com>
Subject: [PATCH] docs/gpu: fix spelling mistakes in todo.rst
Date: Fri,  6 Mar 2026 22:56:05 +0100
Message-ID: <20260306215647.67980-1-mrrothig@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix three spelling mistakes in todo.rst:
- 'varios' -> 'various'
- 'implementions' -> 'implementations'
- 'complection' -> 'completion'

Signed-off-by: Mikael Rothig <mrrothig@gmail.com>
---
v3: Added CC for DRM maintainers and patch description
v2: Squashed 3 patches into one as requested
---
 Documentation/gpu/todo.rst | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
index 520da44a04a6..686a94bead07 100644
--- a/Documentation/gpu/todo.rst
+++ b/Documentation/gpu/todo.rst
@@ -269,7 +269,7 @@ Various hold-ups:
   valid formats for atomic drivers.
 
 - Many drivers subclass drm_framebuffer, we'd need a embedding compatible
-  version of the varios drm_gem_fb_create functions. Maybe called
+  version of the various drm_gem_fb_create functions. Maybe called
   drm_gem_fb_create/_with_dirty/_with_funcs as needed.
 
 Contact: Simona Vetter
@@ -294,7 +294,7 @@ everything after it has done the write-protect/mkwrite trickery:
 
       vma->vm_page_prot = pgprot_wrprotect(vma->vm_page_prot);
 
-- Set the mkwrite and fsync callbacks with similar implementions to the core
+- Set the mkwrite and fsync callbacks with similar implementations to the core
   fbdev defio stuff. These should all work on plain ptes, they don't actually
   require a struct page.  uff. These should all work on plain ptes, they don't
   actually require a struct page.
@@ -882,7 +882,7 @@ Querying errors from drm_syncobj
 ================================
 
 The drm_syncobj container can be used by driver independent code to signal
-complection of submission.
+completion of submission.
 
 One minor feature still missing is a generic DRM IOCTL to query the error
 status of binary and timeline drm_syncobj.
-- 
2.49.0

