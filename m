Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6582399018
	for <linux-doc@vger.kernel.org>; Wed, 19 Aug 2026 14:58:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787151525; cv=none; b=sDzq+4cC5qVWGCL3FlfiwEXnA7qfaRzv/Mtw4OrTrjXqC8T1zatVFGDxVAVLtxRfJHet+jpJdlbSCb/QuDn+02AulEzhcMG68bG2VkonJlccBYiJKsAdH8SzGjcTrvjkciMeu8CR+XptJmDH23s8eeAJrWDyeXCYk6uj/J27XGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787151525; c=relaxed/simple;
	bh=iQKwDikHOD0CUqJFYx7pdzPSWea1ab5joCxWf8JxNKo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZXSbOi0IiAepi1NAB+ItE/EMFVkWq9QRwGgph/vSW36kQ7vwFhfuJINB6nA0xw86uXn6kaZrtGca2Jpt6wiNa8ZqlZmI8PrdzVWcDbI+0Gmp7O7sfEu/3Kn5lX7YodoO/4xQIawHlJOqF1dM/fsylyOaT8gXVm/XGGVg5uBEswI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FBzOmZhg; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FBzOmZhg"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2cffd93cdedso1149275ad.3
        for <linux-doc@vger.kernel.org>; Wed, 19 Aug 2026 07:58:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787151511; x=1787756311; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=z7lj8YCpXSPD3OmTO/x3aTlqCRY4br+atpJ/33+Xz1c=;
        b=FBzOmZhgDsZXSAnZa93PekJWVMVUR+vEqyOk9OJy0UHw4XztIsBRqq6iPJjDUTdSQc
         SUm3sxmuoewTlocWOY0TsCV8kX8F2Yth0NMeqLFwxr0nZRUBJ2CWwxH344Os6jZrEK3d
         ESNqIwk47Yw5lm98z5JeMSNj4FnBylTbX2btbmAqoP+Z//NS2jBAyTtVnvxJmC/HRXkC
         Lsv77aseFIfUj+Gwi07xk6wU9xZBZBziOQKfSA2zQbeCYDdqmP78etiwYVcEHjV/cUeJ
         beYNRZD2Exzjkxv1r659bv934juk0tRkWJ+zmpJpm1BikbHr/2yX3wT6dYHngbzlIG1w
         5wVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787151511; x=1787756311;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z7lj8YCpXSPD3OmTO/x3aTlqCRY4br+atpJ/33+Xz1c=;
        b=AM/XHu52z+7eAO423gA31qImnVtiaVYcx7go52aIwZyMaowAnpA04pnENohKc2dSav
         NFHIOjyaNJZI5gtA+QlU+VLClEIFxDtoaCDSoH6/an5ko36Zj/uU0zrR0WB4AGzIW97a
         dsmKNZSNpuJc7wT+SEVBLCMJ/5Kl4yTIh7M9HA8AE+iOO94eCgJWR4EeqJMIgDvPIvcd
         sm5Z89RRSoGZbuS+PoR1hom4Lru4Lfo0eZ0YoMOvIY6z6ScUvUzVZRmukWsLa3fvtITs
         S25n2RxYIhVrfq6DLASeNMKis0JXBQftNSPt5Qhxe/S/pi7c8MdbQRn7QZ9s7CsG2N5k
         h0wQ==
X-Forwarded-Encrypted: i=1; AHgh+RovshDkgtzo4T7KFD5Rsz4mUOxeW/+W3Zm2zPA7FHO8sknnKfB4LANXuWx6m+jvxlGvNWlwjx5st6o=@vger.kernel.org
X-Gm-Message-State: AFuF++nlhiCY8eaImMUk362x93mymD1JTDnZIYzcMCAZvtj/ctaPyxWx
	LVN3eVJDX3TD3WjMDKfXyR8rHPQEUBS2u43Sf+xjHDZlNQdisP4TKpBN
X-Gm-Gg: AR+sD12yujjJlM7RjckxqV8W2Psn4qzWvvavouzvMMzN85eTT4Ffmf5zpT/ejg1zMVd
	2pZr5FhXJh6/oqGoTINkQ8b9X68gvFW7lKeAMxquWve/ejnUnrah7BhAXjpN7OB50NadDIAtm8F
	nX8WQLuTPjnlTaXwI5uDv8E8dbNdrCOzMCmavuvWrugswreaJ9qF6wy/2OPrsDHpzaCPxHBjTot
	nYjY2KF4w4kGh8DNEuuTRB5wbz/nDTwtG7CDh+6ZElqlgEgyXSUSTNxWcrwrN3+z5Xvs6W/KMKH
	xhEeN7FSYlgRmoWfDCaggnji7DRkIEuxG7PMhNUtYpmEfYK+e1acnCWnKIMiIG1hGLd+ad6bm6b
	p1hv1UdeR44eQanxp0tYAReyqMuoOrn/OaPbr+vvp2bjFTIvTJEvrjb1URoVLULwHG5+liwQh3t
	ERMbfCcOvoWO7h/EODA5nuzPL5cPcsMNneYjt/jHFUL8sbAo7C7BbI8yLMCMTHF/E9RpRuIw3+8
	thyWyeQiI/wTAHlFwxEBnwdr9KshiPvA/jBBQdq1o/W1KMKB43csRemP6k=
X-Received: by 2002:a17:902:ec8a:b0:2c7:ef84:c58e with SMTP id d9443c01a7336-2d5fd47ba46mr50907595ad.1.1787151511325;
        Wed, 19 Aug 2026 07:58:31 -0700 (PDT)
Received: from chenyou.. ([140.116.39.229])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d5c1e528b3sm25429145ad.46.2026.08.19.07.58.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 07:58:30 -0700 (PDT)
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
Subject: [PATCH 4/7] docs/zh_TW: dev-tools: remove maintainer contact information
Date: Wed, 19 Aug 2026 22:58:03 +0800
Message-ID: <20260819145808.291567-5-chenyou910331@gmail.com>
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
 Documentation/translations/zh_TW/dev-tools/gcov.rst          | 1 -
 .../translations/zh_TW/dev-tools/gdb-kernel-debugging.rst    | 1 -
 Documentation/translations/zh_TW/dev-tools/index.rst         | 1 -
 Documentation/translations/zh_TW/dev-tools/kasan.rst         | 1 -
 Documentation/translations/zh_TW/dev-tools/sparse.rst        | 5 -----
 .../translations/zh_TW/dev-tools/testing-overview.rst        | 1 -
 6 files changed, 10 deletions(-)

diff --git a/Documentation/translations/zh_TW/dev-tools/gcov.rst b/Documentation/translations/zh_TW/dev-tools/gcov.rst
index 39ac3fff44cd..69965427a51a 100644
--- a/Documentation/translations/zh_TW/dev-tools/gcov.rst
+++ b/Documentation/translations/zh_TW/dev-tools/gcov.rst
@@ -1,7 +1,6 @@
 .. include:: ../disclaimer-zh_TW.rst
 
 :Original: Documentation/dev-tools/gcov.rst
-:Translator: 趙軍奎 Bernard Zhao <bernard@vivo.com>
 
 在Linux內核裏使用gcov做代碼覆蓋率檢查
 =====================================
diff --git a/Documentation/translations/zh_TW/dev-tools/gdb-kernel-debugging.rst b/Documentation/translations/zh_TW/dev-tools/gdb-kernel-debugging.rst
index 4fd1757c3036..8faa87f26c6a 100644
--- a/Documentation/translations/zh_TW/dev-tools/gdb-kernel-debugging.rst
+++ b/Documentation/translations/zh_TW/dev-tools/gdb-kernel-debugging.rst
@@ -3,7 +3,6 @@
 .. include:: ../disclaimer-zh_TW.rst
 
 :Original: Documentation/process/debugging/gdb-kernel-debugging.rst
-:Translator: 高超 gao chao <gaochao49@huawei.com>
 
 通過gdb調試內核和模塊
 =====================
diff --git a/Documentation/translations/zh_TW/dev-tools/index.rst b/Documentation/translations/zh_TW/dev-tools/index.rst
index 0d38e5f80e54..915449762d1a 100644
--- a/Documentation/translations/zh_TW/dev-tools/index.rst
+++ b/Documentation/translations/zh_TW/dev-tools/index.rst
@@ -3,7 +3,6 @@
 .. include:: ../disclaimer-zh_TW.rst
 
 :Original: Documentation/dev-tools/index.rst
-:Translator: 趙軍奎 Bernard Zhao <bernard@vivo.com>
 
 ============
 內核開發工具
diff --git a/Documentation/translations/zh_TW/dev-tools/kasan.rst b/Documentation/translations/zh_TW/dev-tools/kasan.rst
index 27fb7645174d..7728b50aa4b6 100644
--- a/Documentation/translations/zh_TW/dev-tools/kasan.rst
+++ b/Documentation/translations/zh_TW/dev-tools/kasan.rst
@@ -3,7 +3,6 @@
 .. include:: ../disclaimer-zh_TW.rst
 
 :Original: Documentation/dev-tools/kasan.rst
-:Translator: 萬家兵 Wan Jiabing <wanjiabing@vivo.com>
 
 內核地址消毒劑(KASAN)
 =====================
diff --git a/Documentation/translations/zh_TW/dev-tools/sparse.rst b/Documentation/translations/zh_TW/dev-tools/sparse.rst
index 55f0ad2c0beb..7a3487a7b2c7 100644
--- a/Documentation/translations/zh_TW/dev-tools/sparse.rst
+++ b/Documentation/translations/zh_TW/dev-tools/sparse.rst
@@ -6,17 +6,12 @@ communicating in English you can also ask the Chinese maintainer for
 help.  Contact the Chinese maintainer if this translation is outdated
 or if there is a problem with the translation.
 
-Traditional Chinese maintainer: Hu Haowen <2023002089@link.tyut.edu.cn>
--------------------------------------------------------------------------
 Documentation/dev-tools/sparse.rst 的繁體中文翻譯
 
 如果想評論或更新本文的內容，請直接聯繫原文檔的維護者。如果你使用英文
 交流有困難的話，也可以向繁體中文版維護者求助。如果本翻譯更新不及時或
 者翻譯存在問題，請聯繫繁體中文版維護者。
 
-繁體中文版維護者： 胡皓文 Hu Haowen <2023002089@link.tyut.edu.cn>
-繁體中文版翻譯者： 胡皓文 Hu Haowen <2023002089@link.tyut.edu.cn>
-
 以下爲正文
 -------------------------------------------------------------------------
 
diff --git a/Documentation/translations/zh_TW/dev-tools/testing-overview.rst b/Documentation/translations/zh_TW/dev-tools/testing-overview.rst
index 3b08aad1da00..140f4f946833 100644
--- a/Documentation/translations/zh_TW/dev-tools/testing-overview.rst
+++ b/Documentation/translations/zh_TW/dev-tools/testing-overview.rst
@@ -3,7 +3,6 @@
 .. include:: ../disclaimer-zh_TW.rst
 
 :Original: Documentation/dev-tools/testing-overview.rst
-:Translator: 胡皓文 Hu Haowen <2023002089@link.tyut.edu.cn>
 
 ============
 內核測試指南
-- 
2.43.0

