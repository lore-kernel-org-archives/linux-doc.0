Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1516379C30
	for <linux-doc@vger.kernel.org>; Sat, 16 May 2026 21:01:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778965313; cv=none; b=BKl9B5zNvZplY1taFHuypybtPIbR+NgfuBS+Cj+7Z59nHfhTGgbJz0DJZF7w9bi3hI/po2swfRSPNGyQOU7SyaqvyD3uAkMNNPiqhGDw0yYc8B/XEvqFLWeGhOHyb7XajnAf84Jy/UO75Am6ALZISvv/gJVaDA4MFVhghpCJD0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778965313; c=relaxed/simple;
	bh=dyF7ldMiT6uwrrrLE8OQqnvGlL9IyUqdJlcyglPv5k8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=c1aBwic9z6pxdHCANLxE0wBXWfyHhBhfRhgsWEt7k92+WMusU5GtejgU87lk9BeStQ5dguckJOcKDnGlY+lh4IwpM2SB3IFLz9HSETbHzegDREo23odEHV0vNAm8h9dN/lTvlim41h9sCG7H2pkOeAxg6qGgZRfgpFZG4kUxptc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CNwG5oZP; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CNwG5oZP"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4891e86fabeso12922245e9.1
        for <linux-doc@vger.kernel.org>; Sat, 16 May 2026 14:01:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778965309; x=1779570109; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=c9ekvX0DWIiiJWYzSLMlzJT6YU8iYAyRXmqi1P20r90=;
        b=CNwG5oZPEtUKkvJlro+Nnr4g5a256QtCJUZl8AEFleyhVv+lbozswP+/3ErouNNZp9
         oF1l1oeNgEMnhLkrK7hyZHGKIC+lUT2TW2eGE52JMpsI0EidAlSGvvFfKjT0RkGBGReg
         VdMB51iFcsBlDXkVnJQzB1uDvPeHFCjen/UjpsHqOmX1sQWGrMt12lli6e7A+6IOjBfh
         0CPPiBsZaLKSsIIyzcBil4gt6sawudCS0eS7vF9rAt9aDExyC3p7QUvkipWkiY1JbF/P
         8tGgtj+VaZUg3kOl3aXi01FFYOadJkKC0OekPc+EhQJWmFgt/+SdTpmLOIkJe096/21A
         s+dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778965309; x=1779570109;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c9ekvX0DWIiiJWYzSLMlzJT6YU8iYAyRXmqi1P20r90=;
        b=Rvrmo6F2iJSg/O7u76o3GZWvuV2Jobajhhx24TDDcjEFl7XqjFI1QhsR+FuzSAkTuY
         7lGrLSJCs6nE8rf+rv7ZVH42brfQwqdg9sMYKeifza8vUZCipLWFyFgrz8hI4coPO08e
         0aeX8P5bZg+BaiGOxGRA5z/OB4KI4zN0AKzYRX6XBEMO3fpE/IgRb5YrSF5uTc4R6Kjq
         ajjWSgjz0EKVEKi9aIpPeHyz+K4wU2BW+2g0+px6lstqKnfvNx0KNtqQU8KMQUbfWqnk
         kH+ps+qJlekuq/pp3BpVPF5qiGtIceLtlgADA78jqqLORbfCRRqw8ggPvUpeiye87OSa
         lj7A==
X-Forwarded-Encrypted: i=1; AFNElJ8hu1uYa3/G7ivp8QdtDDcPNExPjoI51nBdxfrwED5eRrxAUd3E6Ikg9CYYcoDgxsgd+kmKZmG9rWA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+XziNbw3xnIJg1zoCekF1J6Onbo2zMK1rUmosUI5DgOt6fNlD
	mN5PUPAtwV9peuvmYEVmYJbORIerKS2JadWw55VWyD9C7rbxc9Pz1srI
X-Gm-Gg: Acq92OGaYn4vORRws/tetoyU14zIDvwFREsfEk6MCGRzrf5aZBejNN9/MwR2iw5QHmv
	A76QNe7EQ96FWt8JH2qS/27n9MfLNG7dDjUP/HRJReYhxwaGtHVcdPXUxlBTwvr+mPojUnEU7Ke
	Z8tlOEopUps71YJV3pObK8BDIEKwNkWccJfPWaHtFzArxNbbMedfhkC8uit+lc85xMR3ZU3aCbY
	VYnZ57vqsZkk7pqS4ReXw/eGmnZ3jVVKqxT96BhJUCi1fCGhTVJZN2bUgjT1mSa8Lh3mDZYqS39
	hs+E/svy4SXFOYHFCXs5vqP4/QbsF8FQ+tr2GN5J4xsLmD1p/eEmOaaqWBbu6fI+KgdEilGHVrs
	BY3CqfFfeR5fn0bQ86CbRcMKXwJYUko/rf56321t70BFa5C1Akh+AiqEGKLk5ctWVulOe+FBrzl
	X0YynwcjIdfjXRAx/v3mvo0k9QohKpxoDz
X-Received: by 2002:a05:600c:34cc:b0:48e:635a:18d7 with SMTP id 5b1f17b1804b1-48fe59b047bmr142612965e9.0.1778965308595;
        Sat, 16 May 2026 14:01:48 -0700 (PDT)
Received: from Godswill ([102.90.99.61])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fe5694fcasm131254605e9.5.2026.05.16.14.01.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 May 2026 14:01:48 -0700 (PDT)
From: Godswill Onwusilike <onwusilikegodswill@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Shuah Khan <skhan@linuxfoundation.org>,
	dri-devel@lists.freedesktop.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Godswill Onwusilike <onwusilikegodswill@gmail.com>
Subject: [PATCH] docs: gpu: todo: fix spelling of "fucntion"
Date: Sat, 16 May 2026 22:01:41 +0100
Message-ID: <20260516210141.42971-1-onwusilikegodswill@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct the spelling of "fucntion" to "function" in todo.rst
documentation

Signed-off-by: Godswill Onwusilike <onwusilikegodswill@gmail.com>
---
 Documentation/gpu/todo.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
index 841e4e986c48..7526ed31b0af 100644
--- a/Documentation/gpu/todo.rst
+++ b/Documentation/gpu/todo.rst
@@ -1001,4 +1001,4 @@ DRM driver that can run X11 and Weston.
 
 Contact: Thomas Zimmermann <tzimmermann@suse.de>
 
-Level: Advanced
+Level: Advanced
\ No newline at end of file
-- 
2.53.0

