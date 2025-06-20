Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 275F330E830
	for <linux-doc@vger.kernel.org>; Fri, 20 Jun 2025 18:03:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750442591; cv=none; b=M3dba6pKNNbsPEjSSKnDeelgIfHi1Sr71NK6DzKBNz1s81ByyXbzD1sjXlrf1A6saA8M+C9Yf5p8BqqkB/Yjpc4NWa6e5Ge+gdPkwzHfnimT+cviE2o4xBlqekr5ldf5kqyt83X7SyIOeOP8SujDSfifwXuNiGWsj2uqfIo3YQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750442591; c=relaxed/simple;
	bh=jFX7Zn97NNqcIpZJHQJ1GlN7HXgR2NyfxKF/YU5EaSc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TGgOe6bhU3JFDeoUTg+MJb/rfZTOIswBEVoNss/5vSzLZnJsJpaxCvQEpgZ/sXwaDQhYcFKDveLlCm/tqMe8qUmjHDOf0F614fvGM1cq3EsCIbJYzi9S6q0tq6JxredYczvdx8L/benTsBZGaEbvSvi73nufUHIv+DHmpzhdMDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=brighamcampbell.com; spf=pass smtp.mailfrom=brighamcampbell.com; dkim=pass (2048-bit key) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b=OftwhLSt; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=brighamcampbell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=brighamcampbell.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b="OftwhLSt"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-748fe69a7baso1819726b3a.3
        for <linux-doc@vger.kernel.org>; Fri, 20 Jun 2025 11:03:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brighamcampbell.com; s=google; t=1750442589; x=1751047389; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LASqD0oWUo5WFt/+IQjzZizw1Tgw6LTsbm7AdZ6Fm7Q=;
        b=OftwhLStxMF0iVL+ILcb4NxJj9Q7SNR/4Pt5EYD2GKlbeSkx51BDywP0b1/SY7lPpH
         BSIvg/MrEI8wI0Ly9vd36dYIbFC9vXKfFfUEuqUyr27Tnoft+19gWIiF1PHs3lXjr5T6
         1S3knnjH77N2/uNEsGsK1psEvdkEBgD7uwIlH3zgHoJWH/2HmsnwdgE7yREGELsi/mYT
         F+SaFBg8ZNchJI9E0kxrlGvquUfg8+EsAL+jfzdPSXejIbzs5boG2RXL77jwMJUITkeW
         4bVOTohjwUVSbW4EVrwTsrjQrXuFN4DDD2agedTQOkH3sa0gPGctnFgCyg4rEBg2VBQ4
         8AZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750442589; x=1751047389;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LASqD0oWUo5WFt/+IQjzZizw1Tgw6LTsbm7AdZ6Fm7Q=;
        b=AFpP4P1hcPlMz90lYV9BcDgV4RwjMZaN7L79I2RoM/SZUWHMKkQQKg68BYGkY6lONC
         6fqeeal/xvNw0sFlAvdZFeu71Ip25oW03ppUKv8vtLIkPWBGIDWdSnYIxQl+AOIyynXv
         vQiGNeF8WWH7rOZZESYoYEmatB3BBK/uyxRzaDZ30jqAa+u4j6XGlsihAekpC1I7m7Ag
         iUdyHL7qq2M6e2IuKz5hDHGQu22oJ69bn1UF6jWkqhrgK2FsR4scllcfs9eoW2Jppuqr
         7fwFY1+WmbxnIh/G2pmnVU31r9Jp0wLLYyzp/tnuQpI1Jn22RTcoLoMwLel9baeTODe+
         q1Mw==
X-Forwarded-Encrypted: i=1; AJvYcCV0q513nky7qbHCYAN/tH5IfYMk1w/7y/C1q/ISo40dkrnHr+3MHpXEJtCM3fIVC4bQDgeCzMnEbQ8=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywoez4ZO80DKCLtXF4QLEN+EHai3ZkRyYBf2el1NCINpvpdzkX4
	RgiWccfhisD4frw5K/ZWDAjQ1nv4nogikQNDKfvqAe0/1OqnUB+GyPR4OMN1vjNbwE0=
X-Gm-Gg: ASbGncsysqk62XKqzYaU9Ww1NMWW9GRImSS+sEm2JgTaGaVzLHc8ZBzPbWUX3eJ9lUq
	5+hYksWOtTIMBZPrpL66M8lYBzd0+4V7dreez6XJuUEY+H8P2no8ZX/Y3bsTr0v3R4CgnFI30Qi
	JTfD/IzH6JxqXkNtl70Ibl4PL2kG1p6dW8oINe69qO/6ac5PlfzfhxjQwOzrg7X7vjtJPFfEbzs
	1VZuC9sxNqmArZsXRmLRe/QnEAUK0/6NNHTYxTNZ/4su0HT68irOLswuhsNrfa+tHa9tnoOvCs2
	m22E5jQdnFpDTIw7yOXl235mrhbhwUY2k7Xs9B/sWcQxXLlyEjvt3T70pcl4eS8OMayBvFGXnVE
	GhLfzYcK04xtwlTYdHA==
X-Google-Smtp-Source: AGHT+IFlM8cNRiBkGT187wOeWcfkfeb30/gPkHi7Ft0d5GjTVFgLhRQpzSohSUSYFxFeTwX7y0TLjg==
X-Received: by 2002:a05:6a20:72a5:b0:203:bb65:995a with SMTP id adf61e73a8af0-22026f007fcmr6414483637.30.1750442589385;
        Fri, 20 Jun 2025 11:03:09 -0700 (PDT)
Received: from mystery-machine.brighamcampbell.com ([64.71.154.6])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b31f1256f03sm2131724a12.51.2025.06.20.11.03.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 11:03:08 -0700 (PDT)
From: Brigham Campbell <me@brighamcampbell.com>
To: skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Jonathan Corbet <corbet@lwn.net>,
	dri-devel@lists.freedesktop.org (open list:DRM DRIVERS),
	linux-doc@vger.kernel.org (open list:DOCUMENTATION),
	linux-kernel@vger.kernel.org (open list)
Cc: Brigham Campbell <me@brighamcampbell.com>
Subject: [PATCH] Fix typo in drm docs
Date: Fri, 20 Jun 2025 12:02:58 -0600
Message-ID: <20250620180258.132160-1-me@brighamcampbell.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix typo in Documentation/gpu/introduction.rst

Signed-off-by: Brigham Campbell <me@brighamcampbell.com>
---
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
-- 
2.49.0

