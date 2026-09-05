Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8186B3B7760
	for <linux-doc@vger.kernel.org>; Sat,  5 Sep 2026 10:35:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788604550; cv=none; b=SA/UXpGJL6RCFUGwHk8unVo2sZDSGB55NsB9j7qQFx4O7lwwJHiEvOu+aIpwPVvFj+EgjOa7U/bCYABW60i20hZj27Fs2amD3lHBjAnQ6+Ln1iB9UCxytKo3nD0nXUIj9jWFNqz03Myc7+HaEGWTLrfoWCkiFatr3H3FEuv2IBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788604550; c=relaxed/simple;
	bh=vEQ6uNADgDyjjYA7jGSSZvW3yEIHk0sAp477mswMZUc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=dghV5BKdjHeQgoYDhOIXfbfI/Zhgu7kto4pC/HXx2AW++apePwyLKgZfbF6+QFMeKvmNwJepECB8fHKLgTKhRNKvenlfMzPEtTyJbxLcN/IABOMEe8UNUmvASt4/KiTuLS8QJx20Mp7ZYfQBD0qXbmTgHoEpeNn2pNEc0FLisZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ff52N6Su; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ff52N6Su"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48436216a98so1235285f8f.0
        for <linux-doc@vger.kernel.org>; Sat, 05 Sep 2026 03:35:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788604547; x=1789209347; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=VJDdbsg84+qh/sWYdUP/IhYfrbB3wqJKGfShDqyhgkw=;
        b=Ff52N6SusdnQ7INmTwTMk8RRT6aqT8fC+0mNMre+frWmQftd1qCqNLDKKAIbZwBWHt
         6sNO5phXcQPS9INAr1P7e4pWz+0vLDT17hOK1AwapbudqmxgvnWjPCcQS0CnEe33h3Ug
         dq0t2S9gF53IwsvzJVtnb6goi4f5/Ehv8Gter3vLBvixcY6IgSIC3bfnWJ+7SmvrGFhs
         OipIK8+Tc/lg4GVhCoS/hev5W+wjLWGMkAqMqbnImEGhu/eWA+O9kDLgMVWl/ykOI6+X
         7AfxxD1DVFVY4tCbkqdPyCwDflgRsnWchAmw4ubYUlAWvLGo4S/UNPJm1egHjZYbAaVz
         4png==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788604547; x=1789209347;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VJDdbsg84+qh/sWYdUP/IhYfrbB3wqJKGfShDqyhgkw=;
        b=A0C/iuLk4gWSjVQRAXI0o9EUklizzgxmrLbk9EPkBgqH/MkpJIxu+tyEGBStm62Ffk
         eAx00xQlo4/nolwVQLkaIRlsSUw5AmQNJ/5DuS+C1+j1Q591Rh4bIZ5w4he888vkpDYT
         LgevavwZEFr+6iyLRPIzJXAa8sgl1xyQneRYG4V5Ptg9tZQe7cRONzkV24VfOjTfODF+
         npvDBAdzHzqiP9kvlulO6lFT54E+2TtmY1Dvk3ZapEmgWofO+7bPy6s9cITdPjNKrAaQ
         FofKWsTGisDLqqtq3pLk1cmMSa9IhdwtRKLAWlbriZwLqfJKcaBpxAlzBgDyvX2ZsLe3
         tAPA==
X-Forwarded-Encrypted: i=1; AKwUvBzzfpgWKZnTzOTFxkDU2NJS+yZIUfevzQKoLy/Ly5Y6MaN22bk7VfjBv4DgBF4RWjV4KtbEwtn+EPM=@vger.kernel.org
X-Gm-Message-State: AFuF++m7tcQjoHnHMnPIDFqmD4bPaTAZWXTsz8OuWMAlIgfA2JJTFRua
	GmvNaoDLpsWPQB5pNLV7/zivtoKrT6WjVBi8ZyDcX+NTuIDzOcldEdT2
X-Gm-Gg: AYBFou1ciRoWMz+qgWvaYbD0NaLEtCYGbbbqRNXpmJtxcyjWjAlrG3znX6ZzH5xbcI4
	y4AMLOu0zno7ai2RyedWzh1CKF3OeE9tFQMg0iExB/MN5nI0ol41YlzkBYYN7faYLmIlFNeY65b
	OYx3yJUqoSEdn8pOYjp6MyzlZBqsu74ypBwE8XBPKV8HJsosOHEHnvvIBy3ihpmItxYSHR7sCp2
	bvoNjqH/WLIy6T/lZJmv25kcsLmut/3u9DIHmRy6mI9Qt4b3wpku8/3cJXJvdurZxXEE6C34ZG2
	Yvt1T1Vl0pyYRd5iT3Ke2c4FvnkowpftCMCS/+MXUQnjjyrBopL1ikwDpRovZpe+JTuUJc0+XkT
	+vOSGbUPN+fvl90FeUZTT6FUBWuel0YM/Bwnk/5RywAv8OS+j95YzY4Zz9k3qDzs7C/qbsLzWiX
	3BfNBJPlsTF8XF1Ha8UGQljuMCViXkWfM1TtKz1REK8Pi552cI/AB+ts8qGQAPKBThxkR6utfqF
	eY5QGCwnkaVEuL+IDNR1bFpRqWdnVTs2aqJA2Hl83meBdSI4P4H37TRIos0aKvsCNt+3ng+ySSh
	GJn8unIIfqzqtKOxEIyePdyNefoQB+yy2YLZaYKd0/LOPxfgCcrzbWcn5TDCUPtHZNI7ts1LnnZ
	l3g==
X-Received: by 2002:a05:6000:2287:b0:485:8c17:975c with SMTP id ffacd0b85a97d-4858c179908mr8526206f8f.30.1788604546381;
        Sat, 05 Sep 2026 03:35:46 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a4eb-3001-c06d-af27-9fa2-ea53.310.pool.telefonica.de. [2a02:3100:a4eb:3001:c06d:af27:9fa2:ea53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485881353e8sm13302083f8f.1.2026.09.05.03.35.45
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 05 Sep 2026 03:35:45 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	dri-devel@lists.freedesktop.org,
	Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH] drm/doc: drm_wait_vblank is a union
Date: Sat,  5 Sep 2026 12:35:42 +0200
Message-Id: <20260905103542.43360-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

drm_wait_vblank is a union of the request and the reply
(include/uapi/drm/drm.h), not a structure, and has been since before
commit 2d2ef822758e ("drm: add initial DRM developer documentation")
wrote the sentence.

Say union.

Fixes: 2d2ef822758e ("drm: add initial DRM developer documentation")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 Documentation/gpu/drm-uapi.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/gpu/drm-uapi.rst b/Documentation/gpu/drm-uapi.rst
index 93df92c4ac8c..b08d731a093f 100644
--- a/Documentation/gpu/drm-uapi.rst
+++ b/Documentation/gpu/drm-uapi.rst
@@ -707,7 +707,7 @@ VBlank event handling
 The DRM core exposes two vertical blank related ioctls:
 
 :c:macro:`DRM_IOCTL_WAIT_VBLANK`
-    This takes a struct drm_wait_vblank structure as its argument, and
+    This takes a union drm_wait_vblank as its argument, and
     it is used to block or request a signal when a specified vblank
     event occurs.
 
-- 
2.53.0

