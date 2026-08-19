Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C03D2DCBE3
	for <linux-doc@vger.kernel.org>; Wed, 19 Aug 2026 14:58:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787151516; cv=none; b=qmVUp8Myx2+ty7RylTwdgAhQukgTmMUeddU/hvquw/Wv5ZrnuosT3USmUSpVl87TT2RJAkhVvjYGSxuoPK35jklozOieC+28NuhTuXZw7C4nKs/HULJaduSwn87kEyEGKJEDNYZBWpzVa5R/UfSd2SGym3OjugDKBVfVyjMPCZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787151516; c=relaxed/simple;
	bh=hZVTh9ZP8XkLbCmS9NLsrtEBd9dbnbPx3FBaYqa8IU4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=P1POQQqUIFhV6SO+KgbB96zlPkbQ24M0RzfIFfjAigyqXA46ceoSrNpcfvX2amuNxddwG/VXjOx3NqICCoMQ3t6UAClH3zNDHKoxPESq6Y+sCZKEcG9oYNAWvC0SzU4Au4kivafjTi26SrrtAk6vHteL4/T76ddVFKkguBMyD78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lsRtEwaU; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lsRtEwaU"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2d027b7c8easo2399735ad.3
        for <linux-doc@vger.kernel.org>; Wed, 19 Aug 2026 07:58:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787151505; x=1787756305; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MrQ9qbiVJO0wCI5MzBoEULaDhQY79Do3U17uE5rIZrM=;
        b=lsRtEwaUw+3Mwvhd4RJllQ/tBhJGxzSyFXGEVS7m9rdQj8439V90E0AeMMdPFH/e9t
         g65Vn466faZlJnQDjdGshrt1hq5BrCyhrkbhoWHdlPNEYM6mhdBBUFxvWYv/x1nQEdGl
         v4E3rn12YF4bDHuPkMaLdQwhVZ+ujbvYLRROvK8J/7HVIcFnbnHblxIf5uQ+iynPDp7O
         O4iLdzvGy1ftNAlLvyC0IFe20HklJUVsbXRrrKWdelbHTAKQtBjM5FKBfYItiOms12Sd
         yg/JzQ7HucRR52nUC0JLvVt0Y6FgvOiLsNbKGszNIHsTmaY0HKPb9KN8vkVDn6H9SMca
         Rj2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787151505; x=1787756305;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MrQ9qbiVJO0wCI5MzBoEULaDhQY79Do3U17uE5rIZrM=;
        b=gQwCrjHRHKF7JoQYpCDBVCMkWcKrCCkRge6mF+AGtThZn2feBGoH4rUFhLc4T0UG+S
         +7e1+Hmd2dJ8W16V9Ifyi0ToFIJ4diH73nhSY0O5jqcihGlbJGWag29Hfzw66yv51dql
         0neq49WNks3gA8+cjUNZP5Bh4sMFNsObjky9hYZQCU2qUA9qK614pccgAAAl0/1ilPtN
         BGg1O4+rqLrPyE3dYn5oB3+pkkzJhm6bbl1C5e+yMTZLPilbsMRPcLXQrvvKO8bz95kr
         M2Q5AzduOtJtxdi09BlSUqakCdn6uB8NEe2pits3wSZFd8g2CmyVLs8+ve2dtv7/V3Eh
         9P+A==
X-Forwarded-Encrypted: i=1; AHgh+Rq3kA/xywCzrg/mSCSDNBd8B+yEfATwb9IHegrYYL3PfWJOHOifU11zL+nlRA5S1iU0IEqNO/GHN4Q=@vger.kernel.org
X-Gm-Message-State: AFuF++lCQhsF0uJceCAFeinsLYEaGzgrqjarPluCxtjeSuz6OVACR/j5
	FvblxGuzZQ+nibqCfuN06NzeT33QvH2BC7ktfKJ3xnntZN0Yxm+tUK+X
X-Gm-Gg: AR+sD13dvltM41V2RxIgXUPsv3MxbPp+YiavVCnPBiLDU8/LWgHt+oWv97gsSyLuAzu
	O368IiIymCsa0axrPXptjoOlMBjm5H0ahsspfvcv0EdRGkn9rGWJpuv5MvCY+Edlz25pd8ksGs+
	XR1iWfkrSmH43L+9N1ZglsD9LAnx2hOJOTp/JzyBQgNtYwHLtEnUjTGiUMshuF42ubLHnXny41A
	HTrzkDCQxQkzvbR+5JrJDtO7j7HvvFpm3VQ/SZrVw347VazKAF/hc9DrPvTVjp4E0Tk7bhPmPnE
	gqy5VC4baXX+KA6sFRWMSi/KIPkb2iInwroOITJ3HfWr9PwL9Qf8M8/uzfC8dADv9WoeNYAdbZu
	rx8ep3Kk00YZ8IJH4RM5XwAe+AiJkOMSe9KokJGVv6zNZw213gP9Q8jIu+TAgsuoaS3/ZQoOvmJ
	E50N8qfGRxfEtkirLmcYRwkiSZc7tgdL+WsGHpRyqCjF3PyhYoNaMXC2VvSQ/hUFsV1ov57uxza
	ejUOOFef4a+4rFZJMNwpmTJiHWVo2clDC3CBybrFNYuQKko
X-Received: by 2002:a17:902:ef11:b0:2c4:397:dd7a with SMTP id d9443c01a7336-2d601865ac0mr52889485ad.4.1787151504623;
        Wed, 19 Aug 2026 07:58:24 -0700 (PDT)
Received: from chenyou.. ([140.116.39.229])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d5c1e528b3sm25429145ad.46.2026.08.19.07.58.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 07:58:24 -0700 (PDT)
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
Subject: [PATCH 2/7] docs/zh_TW: admin-guide: remove maintainer contact information
Date: Wed, 19 Aug 2026 22:58:01 +0800
Message-ID: <20260819145808.291567-3-chenyou910331@gmail.com>
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
 Documentation/translations/zh_TW/admin-guide/README.rst   | 5 -----
 .../translations/zh_TW/admin-guide/bootconfig.rst         | 2 --
 .../translations/zh_TW/admin-guide/bug-bisect.rst         | 5 -----
 .../translations/zh_TW/admin-guide/bug-hunting.rst        | 5 -----
 .../translations/zh_TW/admin-guide/clearing-warn-once.rst | 2 --
 Documentation/translations/zh_TW/admin-guide/cpu-load.rst | 2 --
 .../translations/zh_TW/admin-guide/cputopology.rst        | 4 ----
 Documentation/translations/zh_TW/admin-guide/index.rst    | 2 --
 Documentation/translations/zh_TW/admin-guide/init.rst     | 5 -----
 .../translations/zh_TW/admin-guide/lockup-watchdogs.rst   | 1 -
 .../translations/zh_TW/admin-guide/mm/damon/index.rst     | 6 ------
 .../translations/zh_TW/admin-guide/mm/damon/lru_sort.rst  | 6 ------
 .../translations/zh_TW/admin-guide/mm/damon/reclaim.rst   | 6 ------
 .../translations/zh_TW/admin-guide/mm/damon/start.rst     | 6 ------
 .../translations/zh_TW/admin-guide/mm/damon/usage.rst     | 6 ------
 Documentation/translations/zh_TW/admin-guide/mm/index.rst | 5 -----
 Documentation/translations/zh_TW/admin-guide/mm/ksm.rst   | 5 -----
 .../translations/zh_TW/admin-guide/reporting-issues.rst   | 6 ------
 .../zh_TW/admin-guide/reporting-regressions.rst           | 5 -----
 .../translations/zh_TW/admin-guide/security-bugs.rst      | 5 -----
 Documentation/translations/zh_TW/admin-guide/sysrq.rst    | 8 --------
 .../translations/zh_TW/admin-guide/tainted-kernels.rst    | 5 -----
 Documentation/translations/zh_TW/admin-guide/unicode.rst  | 5 -----
 23 files changed, 107 deletions(-)

diff --git a/Documentation/translations/zh_TW/admin-guide/README.rst b/Documentation/translations/zh_TW/admin-guide/README.rst
index 9be4915ae420..bf692cc7b867 100644
--- a/Documentation/translations/zh_TW/admin-guide/README.rst
+++ b/Documentation/translations/zh_TW/admin-guide/README.rst
@@ -4,11 +4,6 @@
 
 :Original: Documentation/admin-guide/README.rst
 
-:譯者:
-
- 吳想成 Wu XiangCheng <bobwxc@email.cn>
- 胡皓文 Hu Haowen <2023002089@link.tyut.edu.cn>
-
 Linux內核6.x版本 <http://kernel.org/>
 =========================================
 
diff --git a/Documentation/translations/zh_TW/admin-guide/bootconfig.rst b/Documentation/translations/zh_TW/admin-guide/bootconfig.rst
index abac5aa60f67..e033c5bdd1eb 100644
--- a/Documentation/translations/zh_TW/admin-guide/bootconfig.rst
+++ b/Documentation/translations/zh_TW/admin-guide/bootconfig.rst
@@ -4,8 +4,6 @@
 
 :Original: Documentation/admin-guide/bootconfig.rst
 
-:譯者: 吳想成 Wu XiangCheng <bobwxc@email.cn>
-
 ========
 引導配置
 ========
diff --git a/Documentation/translations/zh_TW/admin-guide/bug-bisect.rst b/Documentation/translations/zh_TW/admin-guide/bug-bisect.rst
index 1efe913b8da0..3cec29682ce0 100644
--- a/Documentation/translations/zh_TW/admin-guide/bug-bisect.rst
+++ b/Documentation/translations/zh_TW/admin-guide/bug-bisect.rst
@@ -4,11 +4,6 @@
 
 :Original: :doc:`../../../admin-guide/bug-bisect`
 
-:譯者:
-
- 吳想成 Wu XiangCheng <bobwxc@email.cn>
- 胡皓文 Hu Haowen <2023002089@link.tyut.edu.cn>
-
 二分（bisect）缺陷
 +++++++++++++++++++
 
diff --git a/Documentation/translations/zh_TW/admin-guide/bug-hunting.rst b/Documentation/translations/zh_TW/admin-guide/bug-hunting.rst
index c677dff826f5..f85baa0e97a8 100644
--- a/Documentation/translations/zh_TW/admin-guide/bug-hunting.rst
+++ b/Documentation/translations/zh_TW/admin-guide/bug-hunting.rst
@@ -4,11 +4,6 @@
 
 :Original: :doc:`../../../admin-guide/bug-hunting`
 
-:譯者:
-
- 吳想成 Wu XiangCheng <bobwxc@email.cn>
- 胡皓文 Hu Haowen <2023002089@link.tyut.edu.cn>
-
 追蹤缺陷
 =========
 
diff --git a/Documentation/translations/zh_TW/admin-guide/clearing-warn-once.rst b/Documentation/translations/zh_TW/admin-guide/clearing-warn-once.rst
index a3e82ff9daac..95614600604c 100644
--- a/Documentation/translations/zh_TW/admin-guide/clearing-warn-once.rst
+++ b/Documentation/translations/zh_TW/admin-guide/clearing-warn-once.rst
@@ -2,8 +2,6 @@
 
 .. include:: ../disclaimer-zh_TW.rst
 
-:Translator: 胡皓文 Hu Haowen <2023002089@link.tyut.edu.cn>
-
 清除 WARN_ONCE
 --------------
 
diff --git a/Documentation/translations/zh_TW/admin-guide/cpu-load.rst b/Documentation/translations/zh_TW/admin-guide/cpu-load.rst
index 4c25a2105b39..20ec5bcd5f18 100644
--- a/Documentation/translations/zh_TW/admin-guide/cpu-load.rst
+++ b/Documentation/translations/zh_TW/admin-guide/cpu-load.rst
@@ -2,8 +2,6 @@
 
 .. include:: ../disclaimer-zh_TW.rst
 
-:Translator: 胡皓文 Hu Haowen <2023002089@link.tyut.edu.cn>
-
 ========
 CPU 負載
 ========
diff --git a/Documentation/translations/zh_TW/admin-guide/cputopology.rst b/Documentation/translations/zh_TW/admin-guide/cputopology.rst
index 5c46d1b3b065..7da38b685ae3 100644
--- a/Documentation/translations/zh_TW/admin-guide/cputopology.rst
+++ b/Documentation/translations/zh_TW/admin-guide/cputopology.rst
@@ -3,10 +3,6 @@
 
 :Original: Documentation/admin-guide/cputopology.rst
 
-:翻譯:
-
-  唐藝舟 Tang Yizhou <tangyeechou@gmail.com>
-
 ==========================
 如何通過sysfs將CPU拓撲導出
 ==========================
diff --git a/Documentation/translations/zh_TW/admin-guide/index.rst b/Documentation/translations/zh_TW/admin-guide/index.rst
index 9335c0e9105d..a6e8564ba68f 100644
--- a/Documentation/translations/zh_TW/admin-guide/index.rst
+++ b/Documentation/translations/zh_TW/admin-guide/index.rst
@@ -3,8 +3,6 @@
 .. include:: ../disclaimer-zh_TW.rst
 
 :Original: :doc:`../../../admin-guide/index`
-:Translator: Alex Shi <alex.shi@linux.alibaba.com>
-             胡皓文 Hu Haowen <2023002089@link.tyut.edu.cn>
 
 Linux 內核用戶和管理員指南
 ==========================
diff --git a/Documentation/translations/zh_TW/admin-guide/init.rst b/Documentation/translations/zh_TW/admin-guide/init.rst
index 4cef1994c650..b68a5f58ce78 100644
--- a/Documentation/translations/zh_TW/admin-guide/init.rst
+++ b/Documentation/translations/zh_TW/admin-guide/init.rst
@@ -4,11 +4,6 @@
 
 :Original: :doc:`../../../admin-guide/init`
 
-:譯者:
-
- 吳想成 Wu XiangCheng <bobwxc@email.cn>
- 胡皓文 Hu Haowen <2023002089@link.tyut.edu.cn>
-
 解釋“No working init found.”啓動掛起消息
 =========================================
 
diff --git a/Documentation/translations/zh_TW/admin-guide/lockup-watchdogs.rst b/Documentation/translations/zh_TW/admin-guide/lockup-watchdogs.rst
index f65b0c96e8e3..6c5282c62461 100644
--- a/Documentation/translations/zh_TW/admin-guide/lockup-watchdogs.rst
+++ b/Documentation/translations/zh_TW/admin-guide/lockup-watchdogs.rst
@@ -1,7 +1,6 @@
 .. include:: ../disclaimer-zh_TW.rst
 
 :Original: Documentation/admin-guide/lockup-watchdogs.rst
-:Translator: Hailong Liu <liu.hailong6@zte.com.cn>
 
 .. _tw_lockup-watchdogs:
 
diff --git a/Documentation/translations/zh_TW/admin-guide/mm/damon/index.rst b/Documentation/translations/zh_TW/admin-guide/mm/damon/index.rst
index a472eb3c708b..ed6eaca13ce1 100644
--- a/Documentation/translations/zh_TW/admin-guide/mm/damon/index.rst
+++ b/Documentation/translations/zh_TW/admin-guide/mm/damon/index.rst
@@ -3,12 +3,6 @@
 
 :Original: Documentation/admin-guide/mm/damon/index.rst
 
-:翻譯:
-
- 司延騰 Yanteng Si <siyanteng@loongson.cn>
-
-:校譯:
-
 ============
 監測數據訪問
 ============
diff --git a/Documentation/translations/zh_TW/admin-guide/mm/damon/lru_sort.rst b/Documentation/translations/zh_TW/admin-guide/mm/damon/lru_sort.rst
index 1ffc4b6b1d12..2a5b87f1e4f6 100644
--- a/Documentation/translations/zh_TW/admin-guide/mm/damon/lru_sort.rst
+++ b/Documentation/translations/zh_TW/admin-guide/mm/damon/lru_sort.rst
@@ -3,12 +3,6 @@
 
 :Original: Documentation/admin-guide/mm/damon/lru_sort.rst
 
-:翻譯:
-
- 臧雷剛 Leigang Zang <zangleigang@hisilicon.com>
-
-:校譯:
-
 ==================
 基於DAMON的LRU排序
 ==================
diff --git a/Documentation/translations/zh_TW/admin-guide/mm/damon/reclaim.rst b/Documentation/translations/zh_TW/admin-guide/mm/damon/reclaim.rst
index efed29c40e44..36145acdf9aa 100644
--- a/Documentation/translations/zh_TW/admin-guide/mm/damon/reclaim.rst
+++ b/Documentation/translations/zh_TW/admin-guide/mm/damon/reclaim.rst
@@ -3,12 +3,6 @@
 
 :Original: Documentation/admin-guide/mm/damon/reclaim.rst
 
-:翻譯:
-
- 司延騰 Yanteng Si <siyanteng@loongson.cn>
-
-:校譯:
-
 ===============
 基於DAMON的回收
 ===============
diff --git a/Documentation/translations/zh_TW/admin-guide/mm/damon/start.rst b/Documentation/translations/zh_TW/admin-guide/mm/damon/start.rst
index 57d36bfbb1b3..af16b730d13b 100644
--- a/Documentation/translations/zh_TW/admin-guide/mm/damon/start.rst
+++ b/Documentation/translations/zh_TW/admin-guide/mm/damon/start.rst
@@ -3,12 +3,6 @@
 
 :Original: Documentation/admin-guide/mm/damon/start.rst
 
-:翻譯:
-
- 司延騰 Yanteng Si <siyanteng@loongson.cn>
-
-:校譯:
-
 ========
 入門指南
 ========
diff --git a/Documentation/translations/zh_TW/admin-guide/mm/damon/usage.rst b/Documentation/translations/zh_TW/admin-guide/mm/damon/usage.rst
index d3fd4f850793..82633ec7d15f 100644
--- a/Documentation/translations/zh_TW/admin-guide/mm/damon/usage.rst
+++ b/Documentation/translations/zh_TW/admin-guide/mm/damon/usage.rst
@@ -3,12 +3,6 @@
 
 :Original: Documentation/admin-guide/mm/damon/usage.rst
 
-:翻譯:
-
- 司延騰 Yanteng Si <siyanteng@loongson.cn>
-
-:校譯:
-
 ========
 詳細用法
 ========
diff --git a/Documentation/translations/zh_TW/admin-guide/mm/index.rst b/Documentation/translations/zh_TW/admin-guide/mm/index.rst
index 0b04d925b68c..969780c9936a 100644
--- a/Documentation/translations/zh_TW/admin-guide/mm/index.rst
+++ b/Documentation/translations/zh_TW/admin-guide/mm/index.rst
@@ -2,11 +2,6 @@
 
 :Original:   Documentation/admin-guide/mm/index.rst
 
-:翻譯:
-
-  徐鑫 xu xin <xu.xin16@zte.com.cn>
-
-
 ========
 內存管理
 ========
diff --git a/Documentation/translations/zh_TW/admin-guide/mm/ksm.rst b/Documentation/translations/zh_TW/admin-guide/mm/ksm.rst
index 1b4944b3cf61..697545ae0fcd 100644
--- a/Documentation/translations/zh_TW/admin-guide/mm/ksm.rst
+++ b/Documentation/translations/zh_TW/admin-guide/mm/ksm.rst
@@ -2,11 +2,6 @@
 
 :Original: Documentation/admin-guide/mm/ksm.rst
 
-:翻譯:
-
-  徐鑫 xu xin <xu.xin16@zte.com.cn>
-
-
 ============
 內核同頁合併
 ============
diff --git a/Documentation/translations/zh_TW/admin-guide/reporting-issues.rst b/Documentation/translations/zh_TW/admin-guide/reporting-issues.rst
index 1d4e4c7a6750..dc2903570705 100644
--- a/Documentation/translations/zh_TW/admin-guide/reporting-issues.rst
+++ b/Documentation/translations/zh_TW/admin-guide/reporting-issues.rst
@@ -6,12 +6,6 @@
 
 :Original: Documentation/admin-guide/reporting-issues.rst
 
-:譯者:
-
- 吳想成 Wu XiangCheng <bobwxc@email.cn>
- 胡皓文 Hu Haowen <2023002089@link.tyut.edu.cn>
-
-
 報告問題
 +++++++++
 
diff --git a/Documentation/translations/zh_TW/admin-guide/reporting-regressions.rst b/Documentation/translations/zh_TW/admin-guide/reporting-regressions.rst
index d7dcb2a26564..e85baccdb53b 100644
--- a/Documentation/translations/zh_TW/admin-guide/reporting-regressions.rst
+++ b/Documentation/translations/zh_TW/admin-guide/reporting-regressions.rst
@@ -5,11 +5,6 @@
 
 :Original: Documentation/admin-guide/reporting-regressions.rst
 
-:譯者:
-
- 吳想成 Wu XiangCheng <bobwxc@email.cn>
-
-
 ============
 報告迴歸問題
 ============
diff --git a/Documentation/translations/zh_TW/admin-guide/security-bugs.rst b/Documentation/translations/zh_TW/admin-guide/security-bugs.rst
index cfe1e58e116b..76a78746ca4e 100644
--- a/Documentation/translations/zh_TW/admin-guide/security-bugs.rst
+++ b/Documentation/translations/zh_TW/admin-guide/security-bugs.rst
@@ -4,11 +4,6 @@
 
 :Original: :doc:`../../../process/security-bugs`
 
-:譯者:
-
- 吳想成 Wu XiangCheng <bobwxc@email.cn>
- 胡皓文 Hu Haowen <2023002089@link.tyut.edu.cn>
-
 安全缺陷
 =========
 
diff --git a/Documentation/translations/zh_TW/admin-guide/sysrq.rst b/Documentation/translations/zh_TW/admin-guide/sysrq.rst
index 4979e5d5405f..221f05807730 100644
--- a/Documentation/translations/zh_TW/admin-guide/sysrq.rst
+++ b/Documentation/translations/zh_TW/admin-guide/sysrq.rst
@@ -2,14 +2,6 @@
 
 :Original: Documentation/admin-guide/sysrq.rst
 
-:翻譯:
-
- 黃軍華 Junhua Huang <huang.junhua@zte.com.cn>
-
-:校譯:
-
- 司延騰 Yanteng Si <siyanteng@loongson.cn>
-
 .. _tw_admin-guide_sysrq:
 
 Linux 魔法系統請求鍵駭客
diff --git a/Documentation/translations/zh_TW/admin-guide/tainted-kernels.rst b/Documentation/translations/zh_TW/admin-guide/tainted-kernels.rst
index 0d8046576d04..cdfaccfbb4ae 100644
--- a/Documentation/translations/zh_TW/admin-guide/tainted-kernels.rst
+++ b/Documentation/translations/zh_TW/admin-guide/tainted-kernels.rst
@@ -4,11 +4,6 @@
 
 :Original: :doc:`../../../admin-guide/tainted-kernels`
 
-:譯者:
-
- 吳想成 Wu XiangCheng <bobwxc@email.cn>
- 胡皓文 Hu Haowen <2023002089@link.tyut.edu.cn>
-
 受污染的內核
 -------------
 
diff --git a/Documentation/translations/zh_TW/admin-guide/unicode.rst b/Documentation/translations/zh_TW/admin-guide/unicode.rst
index f43edb2b5ed0..b9b57cc76d61 100644
--- a/Documentation/translations/zh_TW/admin-guide/unicode.rst
+++ b/Documentation/translations/zh_TW/admin-guide/unicode.rst
@@ -4,11 +4,6 @@
 
 :Original: Documentation/admin-guide/unicode.rst
 
-:譯者:
-
- 吳想成 Wu XiangCheng <bobwxc@email.cn>
- 胡皓文 Hu Haowen <2023002089@link.tyut.edu.cn>
-
 Unicode（統一碼）支持
 ======================
 
-- 
2.43.0

