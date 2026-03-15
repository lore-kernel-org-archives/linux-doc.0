Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E336E372EE9
	for <linux-doc@vger.kernel.org>; Sun, 15 Mar 2026 17:05:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773594337; cv=none; b=M05BOYpmIktTqM35fv8jJWZjj/vy0SwCxI+1wev3cK42/GOW7VZBHYp3rSn/P7+jNhZ+z0NNH3DZWp0buTqrfDZcIgdU4O/6gyDOSb8JnYPWS6+qGQMhEl18c7bQbVKC8Ikzn9Y32v0iVQpjchJ5zgZQBTN72kcibQItubFCb5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773594337; c=relaxed/simple;
	bh=Bv2OLW/Vchc/gE91lkWHzWe+7TflcXwA6xJ4VFROjJ8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LqyI8BY2bHkXnKPXswcCGbST4vUKkRw6TKf4kpg6iNf/VVmzH/reh6uu5SWCokloonkn0M7P2Usz9KAaLvvfYLgi/FXL1i3FqYtPJc6RECOzjygio3oyZWSA0Lu/hRPB87gP1fdFbYul/wwQygm4Y4id/LA7tOv5k8mnhDrNH1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VlKcoQ7O; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VlKcoQ7O"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4852e09e23dso31567905e9.0
        for <linux-doc@vger.kernel.org>; Sun, 15 Mar 2026 10:05:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773594333; x=1774199133; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gHroprhvg+fpngeHfJ3NjeX26vEJq4IP0GoYK2XSOWo=;
        b=VlKcoQ7OIH1fnEoskeLjxfaKUTy8rGFQKLheL4DAAN+KYkPB6VQGNJOw1bk4h/OMpH
         PJMqXD1cBU3M9ysT3Yfecy2vX0/ZdSRqg3KQAYvM0wdaj31M+z6BXxlzoOKF3IdTf267
         6oIwOKblnlhI8trUzW0xpW41e1gZpHkENyUIUGeF0eVFImn73WHFUPJkQ/YFfYDF6eDD
         2FIo4lU/Cvv2VCiCAJ+BVKLBybkx6gzy5OUBnF9XM+i0BkhTl/MNtm0gFLLYnJeRnSsJ
         JKzNh0lnoptb3Ti50BbxzE/ne7towNXveGkMWqme7/0GG8VuSKjpU7cjCo5MRf5S3dAl
         KyUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773594333; x=1774199133;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gHroprhvg+fpngeHfJ3NjeX26vEJq4IP0GoYK2XSOWo=;
        b=n++pFAALadB7G4NamPK/tuoveNIbeTqmWoRgoXoL8pkWtUbgeKptl+psrMTdWoudhb
         35bXQXulD9QDrx6/ua0RfDILpm/4GaRhfN8q9B5oUtm3QEERg7iWg/vn6vhB54jr0adp
         7H7R48XODI9lU4EKcU+qaTs7oVhndvxqxwJr5am6kpesf70bOJg4fJ2tW4fTlv30yLnJ
         TXgfe4EF3Xb+Lb7wyA7vY1xzQZPK+bbX5RKof0nYGBhRPrZK0/lAM1/7tRqdXAIZNVfk
         lyIBMagYc121SquDZ2PatjU03/EbZ0T7rNNLWHg4LWuLegaqi1s3GekxZLGtx5xQwRhn
         vj3Q==
X-Forwarded-Encrypted: i=1; AJvYcCXsPzLcuCL23YeNh1XU7roQXNotleVplU2vjVy4uJmXXeDEZSSVBxocmaWRfPoP6rCuo+dj/YOoKmc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yypvx4e7h2FdRfJD8pLGyTNpdZ7tWf1ti3Apj/6IuYeSHk2T2Z0
	RYJ05X+/cbHE92JbCqFje6FMp0ZetCwpn7LOoEJGC6+fGnuaq5D4dqya
X-Gm-Gg: ATEYQzyNj/KNeBBfNapihYvcdOvBgf6fp8/3IfbYkiDkcbva7C3yYiuRspfOEeFoZjY
	u42WBVdvGFzPCAU0dTzgv07IcxmR6K7gB1HQqs3/xMTr2AsKZZ7L0Vke0Jlsit7B7d6wOnS47vw
	WcBXfXhJtDcRSN+NElErEyt3C4VTBAlDA6/mP0SFzcUmsfpYEJUaHyf/DNjqXXmhAT6Z6kxyoUe
	a2tCYkwwpj0T9vLP/SNzUvaetI5LfnzU9HCceiZK4za6HBTZniOlycunpbfWOwRe/nRlKmWn2iy
	462E+ndpDLqebIDFPoSGkhk3DlLc9T5rFHf5HrtKoQwA4tAaCIDAVf2VC+ufqs60jiCmE4cvmwI
	eoCdV5CAs7Kf6XsvRyin2oTSUOvC8eRXlTT6ehhcgmoEhc0qzfcuiNnaOJUGpegbZpEJGOk0TNE
	esMrNHbXydd9Y6BWcn3kjbvmTPwsScfgKMYONHqppHs1fMA81o35u5djTveW4Awc37Glr8Zdn+P
	WB+STElkuiCybSKy/YBWdYL9lOi3Vn/MzhXfuKl
X-Received: by 2002:a05:600c:628c:b0:485:3b34:2f51 with SMTP id 5b1f17b1804b1-485566c9440mr161880635e9.4.1773594333011;
        Sun, 15 Mar 2026 10:05:33 -0700 (PDT)
Received: from DESKTOP-TILNSD1.localdomain ([139.47.104.103])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe1a76e5sm34331721f8f.12.2026.03.15.10.05.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Mar 2026 10:05:32 -0700 (PDT)
From: Kit Dallege <xaum.io@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Shuah Khan <skhan@linuxfoundation.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH v2 1/3] docs: kernel-doc: fix stale intel_audio.c path in examples
Date: Sun, 15 Mar 2026 18:05:19 +0100
Message-ID: <20260315170521.63794-2-xaum.io@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260315170521.63794-1-xaum.io@gmail.com>
References: <20260315170521.63794-1-xaum.io@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

intel_audio.c was moved from drivers/gpu/drm/i915/ to
drivers/gpu/drm/i915/display/. Update the example paths in the
kernel-doc guide and its Chinese and Italian translations.

Assisted-by: Claude:claude-opus-4-6
Signed-off-by: Kit Dallege <xaum.io@gmail.com>
---
 Documentation/doc-guide/kernel-doc.rst                    | 4 ++--
 Documentation/translations/it_IT/doc-guide/kernel-doc.rst | 4 ++--
 Documentation/translations/zh_CN/doc-guide/kernel-doc.rst | 4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/Documentation/doc-guide/kernel-doc.rst b/Documentation/doc-guide/kernel-doc.rst
index 8d2c09fb36e4..8b579b06ba33 100644
--- a/Documentation/doc-guide/kernel-doc.rst
+++ b/Documentation/doc-guide/kernel-doc.rst
@@ -550,7 +550,7 @@ internal: *[source-pattern ...]*
 
   Example::
 
-    .. kernel-doc:: drivers/gpu/drm/i915/intel_audio.c
+    .. kernel-doc:: drivers/gpu/drm/i915/display/intel_audio.c
        :internal:
 
 identifiers: *[ function/type ...]*
@@ -588,7 +588,7 @@ doc: *title*
 
   Example::
 
-    .. kernel-doc:: drivers/gpu/drm/i915/intel_audio.c
+    .. kernel-doc:: drivers/gpu/drm/i915/display/intel_audio.c
        :doc: High Definition Audio over HDMI and Display Port
 
 Without options, the kernel-doc directive includes all documentation comments
diff --git a/Documentation/translations/it_IT/doc-guide/kernel-doc.rst b/Documentation/translations/it_IT/doc-guide/kernel-doc.rst
index bac959b8b7b9..cd8bb579d5a2 100644
--- a/Documentation/translations/it_IT/doc-guide/kernel-doc.rst
+++ b/Documentation/translations/it_IT/doc-guide/kernel-doc.rst
@@ -558,7 +558,7 @@ internal: *[source-pattern ...]*
 
   Esempio::
 
-    .. kernel-doc:: drivers/gpu/drm/i915/intel_audio.c
+    .. kernel-doc:: drivers/gpu/drm/i915/display/intel_audio.c
        :internal:
 
 identifiers: *[ function/type ...]*
@@ -587,7 +587,7 @@ doc: *title*
 
   Esempio::
 
-    .. kernel-doc:: drivers/gpu/drm/i915/intel_audio.c
+    .. kernel-doc:: drivers/gpu/drm/i915/display/intel_audio.c
        :doc: High Definition Audio over HDMI and Display Port
 
 Senza alcuna opzione, la direttiva kernel-doc include tutti i commenti di
diff --git a/Documentation/translations/zh_CN/doc-guide/kernel-doc.rst b/Documentation/translations/zh_CN/doc-guide/kernel-doc.rst
index fb2bbaaa85c1..b35f2582cd96 100644
--- a/Documentation/translations/zh_CN/doc-guide/kernel-doc.rst
+++ b/Documentation/translations/zh_CN/doc-guide/kernel-doc.rst
@@ -434,7 +434,7 @@ internal: *[source-pattern ...]*
 
   例子::
 
-    .. kernel-doc:: drivers/gpu/drm/i915/intel_audio.c
+    .. kernel-doc:: drivers/gpu/drm/i915/display/intel_audio.c
        :internal:
 
 identifiers: *[ function/type ...]*
@@ -467,7 +467,7 @@ doc: *title*
 
   例子::
 
-    .. kernel-doc:: drivers/gpu/drm/i915/intel_audio.c
+    .. kernel-doc:: drivers/gpu/drm/i915/display/intel_audio.c
        :doc: High Definition Audio over HDMI and Display Port
 
 如果没有选项，kernel-doc指令将包含源文件中的所有文档注释。
-- 
2.53.0

