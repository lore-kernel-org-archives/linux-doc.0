Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DBF23AEB39
	for <linux-doc@vger.kernel.org>; Wed, 19 Aug 2026 14:58:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787151525; cv=none; b=lik9pe4rOD6/WCtlRKgI92lV+r4O6PupmdtspehY75Vmwyk2blSAlb8G7pISTyov/B3xeYBPp2INGfYQv8bsmEObpUND6Hb5w4FP+3OPq7ceMTon37o22Q41ze9XsJYKAu2B3KHBhukkfB/KzJwfL6sVTYwMPv4L1WvEESEwrrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787151525; c=relaxed/simple;
	bh=JaJiHSEe+76QfMDTtUF5+n6D95vY6bt9zMx0l4JiPMw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dCAQ9/aRBSFbbd2lkygykx/Mw0JhI+fmL4JM+IJF+9ytpwa/oQ77djsQXMOieTLYB7XpNeTsBNduAqXBMkinWXy6cZM1+mILJDkMeVkz2ZC3j5Gz6Qi5TssKn3F0ihquezJxSEexdidWeeFmmoPRjMDtCwx8fUJ2iJ5FPvk4sj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LRvDDkZl; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LRvDDkZl"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2cf4c37dbe6so800555ad.2
        for <linux-doc@vger.kernel.org>; Wed, 19 Aug 2026 07:58:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787151518; x=1787756318; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6mimETtNFfvK7cST5Sc8JY4J9P0ngLFb4wMXV87KYRk=;
        b=LRvDDkZl3h1GDZfW+Ks1mC3apVIlBjWBc2f0FS9SJqflCKuBD6g7gZvKaeR0LUqr0O
         CaSOpBjkHTpJssjlraZNOpQQNea4DB7yUjLf6c9xw/EZThhu9pLZqyM0+PJPZ5/e7ads
         U0n02mIfyaedg7WwSXP0ZqbfnYTLVQ4iO8S4JR51knTNMNlhs1T1Jf4C8xZQGMP/pGHG
         m/HjKX85RuBnvTZdQTWFXAWKIODGK0ewfpJd281ZnFN5WBCzmcVzjNeIM/dEVLaQyqkr
         fABuq/+6toM0THOHLqskTLphSS583Si09AtRp7ZyqzGkqgc8PYZNG5eMg8jGThTkZGQ9
         LUGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787151518; x=1787756318;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6mimETtNFfvK7cST5Sc8JY4J9P0ngLFb4wMXV87KYRk=;
        b=EwYpPvMJmqoFC2xeMzZattB0/1aHfA8IPdp64SBug3gRxNh5zqsvoOAUzgqyfei+oR
         5nJB3D4W5VJIuoC/r7P2PhjRqfhX9P8GDZwFO3zeX1V514wKdBjkdp6awwVMYV++x7xv
         QXV7XjfwqECNNxRMNnI+vdt5ur8QiV7T9Dtfuey2Wur6fBW3uRjsiS0ZqKvtQiLMu9/S
         F0rV35L1g8J2bgm7gFfgBgUnawQS4yLbMTV9M5+FhvvY25fJWbUNK7KuWAH5Ll3U5Ljn
         x3dV69CtE3LTII94A87TQCgdQhz6tjadt/Gt8z54L0mSam+G+1Zy2YVs+CK2vSgFrkfQ
         GWVQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr2KWS91uKx94NAEI3JOhCZqa8m0XgeTaC+hvOntzw3pVptUhhxOPLr57qiN5czD5WlfZf0jJ2StC4=@vger.kernel.org
X-Gm-Message-State: AFuF++l5RroiFUyjJHaitM52mRDfIjW0PZUyWrHYNqeEX7G7YQf30sZ4
	eWtCU1Mw3Dd5SSPeKemqBaSsJDMU4vYf7Tm4S6TGii/Filcl+YXnRTKZ
X-Gm-Gg: AR+sD104Ak7jyOBlkBOFpGH7G4e3oXlt/14sVa8Iknll+S2eA5mav4CBqwoWpy9LgxA
	APjXUynAgUgWt5xVYhQl7wWq6YgZ76XloYCBYkV6u4rgfSy268cDQPsKEmdJikFQ4zfv42dQXAj
	mCiI76Y/YH54rHtFyYXMrvzz+au8LaiNRP3oLZjMWTg1m9fuGFARFGoAGEjONpRooyyjnzO5aRo
	GtgakdzMY2vzJpFPGljrWZohH7uZ5IQ5y+rU4thg+80tWfQrpIsbRQfUB4GgRK28rErvIgYImef
	0w/OjJgaCsHs/jPl7fivroNZSHDk4WCQJc2CFOWMr6RneFifHU4Z3b2SdT34vQvTJUCzOaSCJ9g
	v+9UgO2Xd7m52p2vVINZuW+WwBzGZGz7zk9aKDLr0OKwNc/xI+/9Z8Z+ZXLUCl/qD2nvFfmLjMw
	Txpd0Bch93M2QDC5cxMP1ruTaokLouretyzl0MJcB8xbm/K3mJabJMw7rFwXfvc53X+q1veEj9W
	vMUw15WZEV6IZz6cUWk6L6xfy12CQtlqKF8wRyOgi4AL2Gt
X-Received: by 2002:a17:903:40d1:b0:2cc:f4d4:29a0 with SMTP id d9443c01a7336-2d5fd734bc2mr51610405ad.3.1787151518099;
        Wed, 19 Aug 2026 07:58:38 -0700 (PDT)
Received: from chenyou.. ([140.116.39.229])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d5c1e528b3sm25429145ad.46.2026.08.19.07.58.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 07:58:37 -0700 (PDT)
From: Chen-Yu Yeh <chenyou910331@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Alex Shi <alexs@kernel.org>
Cc: Dongliang Mu <dzm91@hust.edu.cn>,
	Weijie Yuan <wy@wyuan.org>,
	Yanteng Si <si.yanteng@linux.dev>,
	Hu Haowen <srcres258@furdevs.cn>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chen-Yu Yeh <chenyou910331@gmail.com>
Subject: [PATCH 6/7] docs/zh_TW: cpu-freq: remove maintainer contact information
Date: Wed, 19 Aug 2026 22:58:05 +0800
Message-ID: <20260819145808.291567-7-chenyou910331@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260819145808.291567-1-chenyou910331@gmail.com>
References: <20260819145808.291567-1-chenyou910331@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The zh_TW translations duplicate, in every file, contact information
that MAINTAINERS already records.  Those addresses have been churned
repeatedly: the listed zh_TW maintainer address alone appears in 58
files and there have now been three attempts to update it across the
tree.  Jon Corbet's conclusion in the MAINTAINERS discussion was that,
rather than rewriting all of them again, the best thing is simply to
remove them.

Most of the names in the credit blocks belong to the zh_CN translators:
the zh_TW tree was produced by converting zh_CN, so the credits came
across with the text.  Of the addresses removed here, nearly all also
appear in Documentation/translations/zh_CN/, several in more than a
hundred files.  They credit the simplified-Chinese translation, not
zh_TW work.

Remove the :Translator:/:翻譯:/:校譯:/:譯者: credit blocks and the
"please contact the ... maintainer" prose that introduces them, and
drop the maintainer metadata lines (M:, zh_CN:, zh_TW:, Maintainer:,
Chinese maintainer:, Traditional Chinese maintainer:) from the legacy
headers.  The translated bodies of the legacy files, including their
own credit lines, are left untouched.

Attribution for past work is preserved in the git history.

Signed-off-by: Chen-Yu Yeh <chenyou910331@gmail.com>
---
 Documentation/translations/zh_TW/cpu-freq/core.rst        | 8 --------
 Documentation/translations/zh_TW/cpu-freq/cpu-drivers.rst | 8 --------
 .../translations/zh_TW/cpu-freq/cpufreq-stats.rst         | 8 --------
 Documentation/translations/zh_TW/cpu-freq/index.rst       | 4 ----
 4 files changed, 28 deletions(-)

diff --git a/Documentation/translations/zh_TW/cpu-freq/core.rst b/Documentation/translations/zh_TW/cpu-freq/core.rst
index 4f98d1e9f34b..8a2c835b5c50 100644
--- a/Documentation/translations/zh_TW/cpu-freq/core.rst
+++ b/Documentation/translations/zh_TW/cpu-freq/core.rst
@@ -3,14 +3,6 @@
 
 :Original: Documentation/cpu-freq/core.rst
 
-:翻譯:
-
- 司延騰 Yanteng Si <siyanteng@loongson.cn>
-
-:校譯:
-
- 唐藝舟 Tang Yizhou <tangyeechou@gmail.com>
-
 ====================================
 CPUFreq核心和CPUFreq通知器的通用說明
 ====================================
diff --git a/Documentation/translations/zh_TW/cpu-freq/cpu-drivers.rst b/Documentation/translations/zh_TW/cpu-freq/cpu-drivers.rst
index 7f751a7add56..0e4ae51916d3 100644
--- a/Documentation/translations/zh_TW/cpu-freq/cpu-drivers.rst
+++ b/Documentation/translations/zh_TW/cpu-freq/cpu-drivers.rst
@@ -4,14 +4,6 @@
 
 :Original: Documentation/cpu-freq/cpu-drivers.rst
 
-:翻譯:
-
- 司延騰 Yanteng Si <siyanteng@loongson.cn>
-
-:校譯:
-
- 唐藝舟 Tang Yizhou <tangyeechou@gmail.com>
-
 =======================================
 如何實現一個新的CPUFreq處理器驅動程序？
 =======================================
diff --git a/Documentation/translations/zh_TW/cpu-freq/cpufreq-stats.rst b/Documentation/translations/zh_TW/cpu-freq/cpufreq-stats.rst
index 01ec8c837fe9..dbaa9df781e3 100644
--- a/Documentation/translations/zh_TW/cpu-freq/cpufreq-stats.rst
+++ b/Documentation/translations/zh_TW/cpu-freq/cpufreq-stats.rst
@@ -4,14 +4,6 @@
 
 :Original: Documentation/cpu-freq/cpufreq-stats.rst
 
-:翻譯:
-
- 司延騰 Yanteng Si <siyanteng@loongson.cn>
-
-:校譯:
-
- 唐藝舟 Tang Yizhou <tangyeechou@gmail.com>
-
 ==========================================
 sysfs CPUFreq Stats的一般說明
 ==========================================
diff --git a/Documentation/translations/zh_TW/cpu-freq/index.rst b/Documentation/translations/zh_TW/cpu-freq/index.rst
index a9df16870b21..c32c618dd972 100644
--- a/Documentation/translations/zh_TW/cpu-freq/index.rst
+++ b/Documentation/translations/zh_TW/cpu-freq/index.rst
@@ -4,10 +4,6 @@
 
 :Original: Documentation/cpu-freq/index.rst
 
-:翻譯:
-
- 司延騰 Yanteng Si <siyanteng@loongson.cn>
-
 .. _tw_index.rst:
 
 =======================================================
-- 
2.43.0

