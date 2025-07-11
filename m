Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49A697494
	for <linux-doc@vger.kernel.org>; Fri, 11 Jul 2025 03:02:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752202927; cv=none; b=Kyc1lVjFZ9W99fLKgpi3gNaaNQmcaSBpZET57J3UWF0oJnPy1oHvby2ajEQqzZKZM/vmKfOZ9NSAK4Xlidc6JlkuFuV5UzdMCrEG+IOwRtMKxzXJgrC2PLEn89WHs2HgMbJ4HK5yVp0H0pMHlgkx0dCa6YgCGl7TPy5Uu8sb/7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752202927; c=relaxed/simple;
	bh=LGWAtyXrM2PxxMeZprVLJBwaxJToCaYtQ/uTGw3d918=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SktCry4als3S8cAWqPPSHYqndL4T4lYMSjIizaCS1Wcdclf4elo3HXfK7T2w1RP+LWsBBgSvgDQ1/J95h+FFTDa9LMHGEpylVKuW5KJBgwwz3fi9OlbSN4Gr7wLX/oQX+H5CyJLDvox2WijV/oC8MKcE+CoLubLosse/GhjjEhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=brighamcampbell.com; spf=pass smtp.mailfrom=brighamcampbell.com; dkim=pass (2048-bit key) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b=KZD5bMDF; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=brighamcampbell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=brighamcampbell.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b="KZD5bMDF"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-23526264386so15686335ad.2
        for <linux-doc@vger.kernel.org>; Thu, 10 Jul 2025 20:02:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brighamcampbell.com; s=google; t=1752202924; x=1752807724; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Sadpaz8PrWvHMkbxmc3mROAwLmTsdYFXlPsL8N6jUTo=;
        b=KZD5bMDF74gWp434LcIvPJx3Pe5rLUkY3df7/onhWNTp19WhDKNaWXosGoCcQROZBn
         mY9RY6XKyQF0RHFO+bpr92ql2+3LnJBsrEakbkCsSJCPqGuxQoAl7QSQAy0DvM89IkOL
         /3FUQVgZxjbJGzYZeTPPZO5TJ6n1c5Dsee0b33GIimWpXgsIRRD5fphu2cqqyXLg/kZc
         LIozeLQZD7VsFy+ofnouHUOial79M3Cl+hLEFnAXSTKUQO5qXvNHaSYzaVkGiCI/cnBX
         Sf2E5WnubCgrfRrl3Ek7U971gKpvHQM3UF6pMJgkU/Uih72cvrSpoyE7IKVcnBS8YgVG
         aVBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752202924; x=1752807724;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Sadpaz8PrWvHMkbxmc3mROAwLmTsdYFXlPsL8N6jUTo=;
        b=OSVaQNmBo4AEkBcd+UekJ0hFIARoCdSA6XBF8ozEWnulPJ8mjqp2GiTKSquLcoUVm0
         cmyqe6QXABJVbl/WXLLQAaG22tnD6CvhnaQ+y763rvg0OQSTP4Y6LSzlE4F9y4Np+Ver
         mhbvOVXSMorJTI6Lo57VUAXYmM/b7peHR+MEZJr0uB26dxas9/DDhZ1ucJc5BP6INpWz
         3wLYVLEp1NRmvpbvb5BQOnLfy8yHHn5eVSChCvM3tNOLcVDrNrlU828CvvqUUIEkBg0x
         4cgSTQA3pXYlYJvUikJ8JEDhGvy5En9gQzxymSeubWil99AUSx9i/9UI22bXFOoiDEQ3
         QSEw==
X-Forwarded-Encrypted: i=1; AJvYcCWP/gSfCWoL5qgV7ZrfC0waapZiv1nXIxMPYvLSsNPSKqLijtXFJTb8R5RbBeRrhmLyvXpRLZpFAM8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyijLApTJbNV7LwjOhW6YC4CzGoGAss2DZTkCkYJ7oPHdpbMvbo
	+Y//flHCfvzd497nnlRm5mTG14995bDDzZe9k8E0lhjDHgf40NAZsi7jnCoKhx3AC1U=
X-Gm-Gg: ASbGncuIev8lNfepGhqDJMnYRge5V+QSPor8eABplquf0YSoO4OiuVO4lsDjhw4+d+H
	nhUZT5fkcTCPOs0szzLzJmVl/CmSN4L2IoouzMCmm3ci8a2qVRgPovqBdJZxcrDtHqjcoK32RXW
	yaPdZ+CoE1fK6wbrhQ3gK0aWFkyCw9Px0IXxNiZ++zQp2idMgF0Z3WUVFcgDELDLgEHv25QFxBB
	8sJURrHDRYM+69kqNg5UoNP8uKYy4MkakwQvVbg8+BT08ZIur1jCOMRcSy35gvZlWQlUOYRyLPA
	l985YlIKVWwLNt5VZ2M57AUdvzO9ZR9luAkVSFRT5BdsJ9NoOT9XKGWnvegIrVHWGpyGFwhJ1uC
	VDi7ssx4Q/6fvldNdi3iGrh5xdMSheGLHNO27afn6ZkUYRoDgVw82uw==
X-Google-Smtp-Source: AGHT+IG3BdlUocDPxEIVRsXKPoLXrNsAE7NpPAv9kznyZrwFjv8MOOYM3yOY/fwUdxGzEatLzBzkSw==
X-Received: by 2002:a17:903:f87:b0:223:619e:71da with SMTP id d9443c01a7336-23dee28523bmr21809105ad.49.1752202924535;
        Thu, 10 Jul 2025 20:02:04 -0700 (PDT)
Received: from mystery-machine.brighamcampbell.com ([64.71.154.6])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23de42ad25dsm34219115ad.64.2025.07.10.20.02.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 20:02:03 -0700 (PDT)
From: Brigham Campbell <me@brighamcampbell.com>
To: skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Jonathan Corbet <corbet@lwn.net>,
	dri-devel@lists.freedesktop.org (open list:DRM DRIVERS),
	linux-doc@vger.kernel.org (open list:DOCUMENTATION),
	linux-kernel@vger.kernel.org (open list)
Cc: Brigham Campbell <me@brighamcampbell.com>
Subject: [PATCH RESEND] drm: docs: Fix typo in introduction.rst
Date: Thu, 10 Jul 2025 21:01:57 -0600
Message-ID: <20250711030157.124778-1-me@brighamcampbell.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix typo in Documentation/gpu/introduction.rst

Link: https://lore.kernel.org/all/20250620180258.132160-1-me@brighamcampbell.com/
Signed-off-by: Brigham Campbell <me@brighamcampbell.com>
---

This patch has received no response as of June 20th. If it's
unacceptable for whatever reason, please let me know and I'll drop it.
This is the only typo I happened across while reading the document. I
scanned it for more typos when I prepared this patch, but found none.

 Documentation/gpu/introduction.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/gpu/introduction.rst b/Documentation/gpu/introduction.rst
index 3cd0c8860b94..39b4c943fa00 100644
--- a/Documentation/gpu/introduction.rst
+++ b/Documentation/gpu/introduction.rst
@@ -32,7 +32,7 @@ member, only the structure.
 
 Except in special situations (to separate locked from unlocked variants)
 locking requirements for functions aren't documented in the kerneldoc.
-Instead locking should be check at runtime using e.g.
+Instead locking should be checked at runtime using e.g.
 ``WARN_ON(!mutex_is_locked(...));``. Since it's much easier to ignore
 documentation than runtime noise this provides more value. And on top of
 that runtime checks do need to be updated when the locking rules change,

base-commit: 667efb341917bde19f5d7517b65defcdaed67c9e
-- 
2.49.0

