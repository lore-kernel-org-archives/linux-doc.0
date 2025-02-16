Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A9989450
	for <linux-doc@vger.kernel.org>; Sun, 16 Feb 2025 16:10:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739722226; cv=none; b=lgW1zTfisDwSw5fJpWlmPjTWDfrKWHzh2NhjSWpWhnwBd0LQ+TxXvHJtqeWWMsBWENbVrkjerEUMQYzJ2gF3zQ9rww4zv5P3hSU96LbAP0ErUBAIAOE95RspaqZsEeOuey3LqKE4X87u3KQ2OVOroVGdbtHp9JBdnavSWd2Lpt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739722226; c=relaxed/simple;
	bh=0kKmwSj+hJQN6M0V+u8/sTVrdsuLYGQdO99jfcWp4QA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oXbGTB7s7/LZB+cmGXzutWwfS3rhUnuSjzmy5GzZjhfUWq5F1VmzRqm1nGz1i+rf4ISfTZIFK6FNGPeS4wMCsNKCKUmj2owAsPUj4Aqru2ErM2elkSw/YoM8wMjbmP8Egiu6p8WO401bH0nye5ulGYrLRRe/7GVth0Dd+ZWkFAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZRkRHQAb; arc=none smtp.client-ip=209.85.219.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZRkRHQAb"
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-6e66a7e2754so14243836d6.3
        for <linux-doc@vger.kernel.org>; Sun, 16 Feb 2025 08:10:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739722224; x=1740327024; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=w0iGBnUzWKtf1EK9klDa6tmMyw3DNfwLBrM3N1TRfdE=;
        b=ZRkRHQAbWBpyYKlu2kq2iSjKKR1lXYo+jBcoGMe3qgAefNhCBeewmHw/Jh+Hsq5Czp
         AIqrkk651g29yt/Mr6IdJNIqwZQqw8dYmVNl3sHpkwaL8Yr31iqAP42I9lfX6qjCkL5b
         2yampQdpli2yqhIYJGvjbeOxc5qzkSxolDUtWhsbWQBpKACKZMRZ9sm6LWi7joPoTJdu
         DiAO3SRtTN0B6AlzOYmqwqcm+YO/R+cfra/kYcJ/RlOO8lIl+jjBo47lXRYfrlUKLqfs
         1EULe7pdzwNAGvQn5IQLHml2hdJWB+qOy3vj9jlfXyU4v0oXgxdXFWKbdWnLjYlolkvF
         b+BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739722224; x=1740327024;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w0iGBnUzWKtf1EK9klDa6tmMyw3DNfwLBrM3N1TRfdE=;
        b=t7Rlx5MU/HeiX6Q6+i++XIY5CxVQDZbFOO/tanfq5rj5wnp3NIxtU9w7FocR8SSoUW
         Mpbvos0u2pB/7UXjWgnA/xrlbsQV+IxdVID2HiR62tUZCtYuGoPJrClIAMvxQiAIbPQY
         9BF5njumoJ9gTz3PAN2jvFVmEnwM76og9HSVgz1q1uXCS9zJ819wLc2ZQNZK24MOHiSj
         6x3wJ38Vc8LXXZErrB4RIau4c3Jb7T4NMEFVTowBwNUyB7z+XehofaMmOqB21DJHSfsz
         idjmOEkwsvpi5lncDoFF4DOKBDEJ8k9GmlHJZJrPc2A1E+U3DWRWFWjVwoXAby4D+6ci
         4ywA==
X-Gm-Message-State: AOJu0YxnkISdjwcdz8aZs9rAQghZmZeNE0XBQZ6HK2HAH1Drxtf6+s29
	0FMK3xr+fMlPm1suuMnW6zhxU+28qsdY59sgr6bcz6jOx5KCOwfpV5EUSpZ7
X-Gm-Gg: ASbGnctn5xc4+LBGKNVbJ6AAidsaFpZf7zmntbo46rs5FK1bipplWu0F9/kLIDCbGLx
	O3uKNi2X30UFVrxCYENiEmQ7Kkwgusx92cPLWU47acUon56FefqAB3LuHO7zN6b4T8Bf4uJA+Ce
	sLDm+7UUNiQjUo/6SAikt2zHFR31nBUNn8P60cvJiLC8ayw3LSahxv5rqtNcg5NE0ehp7aJUc8G
	h4T8R0prbf62Q+qwbZQ9i5s6wz0FHCkYb8QN4zU3yPuqQ39FH/eaYSilbvguaK1VGa6CWtj3cG6
	zj+J4jnCfOO3fCAg
X-Google-Smtp-Source: AGHT+IG796M4XI+K4yvDKQgtgxNuNCYkWjgBxX01rPYzT0+AY4WxRBzIsRRVb+zQF0QgaDizqNLTeQ==
X-Received: by 2002:a05:6214:e81:b0:6e4:4164:8baa with SMTP id 6a1803df08f44-6e66cc8a68fmr90582486d6.6.1739722223710;
        Sun, 16 Feb 2025 08:10:23 -0800 (PST)
Received: from iman-pc.home ([184.148.73.125])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c07c5f35b2sm433856985a.11.2025.02.16.08.10.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Feb 2025 08:10:23 -0800 (PST)
From: Seyediman Seyedarab <imandevel@gmail.com>
X-Google-Original-From: Seyediman Seyedarab <ImanDevel@gmail.com>
To: linux-doc@vger.kernel.org
Cc: airlied@gmail.com,
	simona@ffwll.ch,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	Seyediman Seyedarab <ImanDevel@gmail.com>
Subject: [PATCH] drm/doc: fix minor grammatical issues
Date: Sun, 16 Feb 2025 11:10:51 -0500
Message-ID: <20250216161051.12539-1-ImanDevel@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

- Corrected subject-verb agreement
- Replaced incorrect noun "setup" with the correct verb form "set up."

Signed-off-by: Seyediman Seyedarab <ImanDevel@gmail.com>
---

Resending this patch to the correct maintainers as the initial
submission was sent to the wrong recipients.

Regards,
Seyediman

 Documentation/gpu/drm-kms.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/gpu/drm-kms.rst b/Documentation/gpu/drm-kms.rst
index abfe220764e1..6a3ae069c829 100644
--- a/Documentation/gpu/drm-kms.rst
+++ b/Documentation/gpu/drm-kms.rst
@@ -6,7 +6,7 @@ Drivers must initialize the mode setting core by calling
 drmm_mode_config_init() on the DRM device. The function
 initializes the :c:type:`struct drm_device <drm_device>`
 mode_config field and never fails. Once done, mode configuration must
-be setup by initializing the following fields.
+be set up by initializing the following fields.
 
 -  int min_width, min_height; int max_width, max_height;
    Minimum and maximum width and height of the frame buffers in pixel
@@ -253,7 +253,7 @@ rollback:
   should not interfere, and not get stalled due to output routing changing on
   different CRTCs.
 
-Taken all together there's two consequences for the atomic design:
+Taken all together there are two consequences for the atomic design:
 
 - The overall state is split up into per-object state structures:
   :c:type:`struct drm_plane_state <drm_plane_state>` for planes, :c:type:`struct
-- 
2.48.1

