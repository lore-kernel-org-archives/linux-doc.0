Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDC163AB46F
	for <linux-doc@vger.kernel.org>; Wed, 19 Aug 2026 14:58:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787151510; cv=none; b=Ohli4pWnre0B/7Jfy7wqotvUC/b8y+27h4adoT2VD9RO4iXboXMcxV/Gvb6rvglJeJBP7YQNgfcUnkiOpEBH3/8jUh9Du8XfSkWiMfIEzJhuQ+ODLfgnz9qkYJbKqxYKljRzQVdrvyQOd+44PI3NK9KQhAe7WMP8nYf9ztvH1tk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787151510; c=relaxed/simple;
	bh=whr53ajgT0NGoMvqGmcTEQlvZh5dm76fg8a7I/q6beA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JTih9dzXnjNAZn5YVXg42+xItRsHZheBVWla2vhxSk9aVv+/1tXOCUY2A1gqEwjeSXR8rDDcVnOoBfwr7mZnfPOBxTKjHdgiy7ROpKNEMXw2UOBCThMQydjzPHJS/NG2XrgS/YA4P/0zXp36FX1XSqnlH9qN+oELOzkL3KPattY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hdCF/dEP; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hdCF/dEP"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2d590f4c291so2341145ad.0
        for <linux-doc@vger.kernel.org>; Wed, 19 Aug 2026 07:58:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787151501; x=1787756301; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+T4Wz0jz1xdoXkYfQJUCntUwdKQ07YgPwLqE6CG8IUo=;
        b=hdCF/dEPbvfU9XCUNDCW4SCo+3rcb4htIBzf0fjcj4pGoASyreA8Sh8BTB8kFfdjyG
         nmyTdq5xoWXoNYFPPwURCxEI+6fhjr0lRQ+aEDTofqaRxnzsG2Ox468Q7YoIi2bbKmB0
         9cpB0K8UuSl4f2XaY+H0Ac7+Y3QSQBSE8d27mvJNG8KgYzK96Fun5LTf1EpWssYVoz3b
         1qkcsPTCdAu7JrQaj5yYFKU8J+sUfR6GKnQZ6R1jxKJKEdVMdiLF46lP+1WjUi7XmeIf
         6vOLd3DXux+44jI6p6SjrsmJZSxeVoyCjO3zPToMm8AGJj5gb+1BjwCLtQRfeBNaH/QA
         w40A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787151501; x=1787756301;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+T4Wz0jz1xdoXkYfQJUCntUwdKQ07YgPwLqE6CG8IUo=;
        b=ofiMilPhEE3BWz8x7jt4Fzvwh91G6mzivksaytbBA2vc0/kn5t+ztGd3DgYRCWrJnZ
         irv64aa7hKbawkN6KCYk3OI94U4AQ0Gk84cCeXj5G8lZXSQBDndtyRZNIFUBIzlWQ6nP
         2QidcRB7j/9FZOcVf32MpSPbxCzCXbPTs6rpTEXd5LDqh+oxFyQLWwXbqi5EwQ+gKbxu
         qMLWu6xYs7ou+Ofad2zRzFW1gjfA1bK4+QderFh07zHPsTBMiJnLyi0smvoTcKYCJ3H6
         1lPr0ulA/lXYjGvkynV3C0Am6L8NfnowvJZ+LOJ4MtyyUFFlYSE/ANDEoV+9HVrnuLZW
         bpMg==
X-Forwarded-Encrypted: i=1; AHgh+RpFysVHWgHf2dhxqTfiefu9/cB+amUGPlUwV9q22amTkGUXabcwwsUMRUPjUwg+CB5O+jF7y/s6gRk=@vger.kernel.org
X-Gm-Message-State: AFuF++nKCdx6OzB79jMUNXGMIE0QRkZQTdXYbZJ3a4FqD0naGcYnvOiI
	D4QdFj3R84Y69KtgnHrLTxRAYkyEv4hkUyvWJ4JkYTw/J3WIJmDYZXSk
X-Gm-Gg: AR+sD13fkSAerF2NjaLQar/51fgmgu4EKc6IuFLABS5bb/936ed3J1Wk+I8ZHS1wzUO
	hQQ1I2lImCicTlm24Ll4M68qvdKI0HmPOwZ2EqDCNvEl0p/4uP5Me4FvoLoFcLh+EZJ0LJsPxEN
	ShY4IM+HtkhVcHV7P43JkC38Pxv57cHfXpFJU1TnuVgeQ+PhF5FCrwy3ZQ6W+TU6pL9Z22oSebk
	/I9bCwGy9LAEysuuv96ImBZQzynbEDD8UCbinVa1P7FQ4ZSrjQFkkRc8i4YSpIAPYQwTvWzUDyH
	0cIomr7OGTWMR+pUAkTkcUWXmQNrOJxku2Om29/xyodlx2bjjIJdcVmJd93Hm/Gg7kBDEmboT8X
	DiKE1kWO/agqQdmjP6IQrN1vw8/qec00MglspvETA5/IYN1nUEmEZTDiOZ28G3GVPoQ5pyeShaR
	91kUR/p3boLaWP55DVYQLO9PpagHGoSFS5s8GLXCqo0p/VFsnsFdUgznATRiJktvfN2SnBl23t7
	oK1xjnqCIGJYFTVtvI3NFdz1+wDy/pgQqROmcCYOQaubGbW
X-Received: by 2002:a17:903:3c6d:b0:2cf:7dfa:7f56 with SMTP id d9443c01a7336-2d601d84869mr49137355ad.2.1787151501079;
        Wed, 19 Aug 2026 07:58:21 -0700 (PDT)
Received: from chenyou.. ([140.116.39.229])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d5c1e528b3sm25429145ad.46.2026.08.19.07.58.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 07:58:20 -0700 (PDT)
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
Subject: [PATCH 1/7] docs/zh_TW: process: remove maintainer contact information
Date: Wed, 19 Aug 2026 22:58:00 +0800
Message-ID: <20260819145808.291567-2-chenyou910331@gmail.com>
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

This series conflicts with the pending zh_TW process/ series [1], which
adds a translator entry to the same blocks in fifteen of these files.
Please apply that one first; I will respin this on top if it lands in a
different shape.

[1] https://lore.kernel.org/linux-doc/20260806181949.65648-1-chenyou910331@gmail.com/

 .../translations/zh_TW/process/1.Intro.rst      |  9 ---------
 .../translations/zh_TW/process/2.Process.rst    |  9 ---------
 .../zh_TW/process/3.Early-stage.rst             |  9 ---------
 .../translations/zh_TW/process/4.Coding.rst     |  9 ---------
 .../translations/zh_TW/process/5.Posting.rst    |  9 ---------
 .../zh_TW/process/6.Followthrough.rst           |  9 ---------
 .../zh_TW/process/7.AdvancedTopics.rst          |  9 ---------
 .../translations/zh_TW/process/8.Conclusion.rst |  8 --------
 .../process/code-of-conduct-interpretation.rst  |  2 --
 .../zh_TW/process/code-of-conduct.rst           |  2 --
 .../translations/zh_TW/process/coding-style.rst | 13 -------------
 .../zh_TW/process/development-process.rst       |  2 --
 .../zh_TW/process/email-clients.rst             | 11 -----------
 .../zh_TW/process/embargoed-hardware-issues.rst |  2 --
 .../translations/zh_TW/process/howto.rst        | 17 -----------------
 .../translations/zh_TW/process/index.rst        |  2 --
 .../zh_TW/process/kernel-driver-statement.rst   |  2 --
 .../process/kernel-enforcement-statement.rst    |  2 --
 .../zh_TW/process/license-rules.rst             |  2 --
 .../translations/zh_TW/process/magic-number.rst |  8 --------
 .../zh_TW/process/management-style.rst          |  2 --
 .../zh_TW/process/programming-language.rst      |  2 --
 .../zh_TW/process/stable-api-nonsense.rst       | 10 ----------
 .../zh_TW/process/stable-kernel-rules.rst       | 11 -----------
 .../zh_TW/process/submit-checklist.rst          |  4 ----
 .../zh_TW/process/submitting-patches.rst        | 11 -----------
 .../process/volatile-considered-harmful.rst     | 12 ------------
 27 files changed, 188 deletions(-)

diff --git a/Documentation/translations/zh_TW/process/1.Intro.rst b/Documentation/translations/zh_TW/process/1.Intro.rst
index 345c4cbe9b55..fc2044b36ad1 100644
--- a/Documentation/translations/zh_TW/process/1.Intro.rst
+++ b/Documentation/translations/zh_TW/process/1.Intro.rst
@@ -4,15 +4,6 @@
 
 :Original: :ref:`Documentation/process/1.Intro.rst <development_process_intro>`
 
-:Translator:
-
- 時奎亮 Alex Shi <alex.shi@linux.alibaba.com>
-
-:校譯:
-
- 吳想成 Wu XiangCheng <bobwxc@email.cn>
- 胡皓文 Hu Haowen <2023002089@link.tyut.edu.cn>
-
 .. _tw_development_process_intro:
 
 引言
diff --git a/Documentation/translations/zh_TW/process/2.Process.rst b/Documentation/translations/zh_TW/process/2.Process.rst
index f45ddba6238f..810437d1da7e 100644
--- a/Documentation/translations/zh_TW/process/2.Process.rst
+++ b/Documentation/translations/zh_TW/process/2.Process.rst
@@ -4,15 +4,6 @@
 
 :Original: :ref:`Documentation/process/2.Process.rst <development_process>`
 
-:Translator:
-
- 時奎亮 Alex Shi <alex.shi@linux.alibaba.com>
-
-:校譯:
-
- 吳想成 Wu XiangCheng <bobwxc@email.cn>
- 胡皓文 Hu Haowen <2023002089@link.tyut.edu.cn>
-
 .. _tw_development_process:
 
 開發流程如何進行
diff --git a/Documentation/translations/zh_TW/process/3.Early-stage.rst b/Documentation/translations/zh_TW/process/3.Early-stage.rst
index a58fc9e0ea99..7d7ecf9658e5 100644
--- a/Documentation/translations/zh_TW/process/3.Early-stage.rst
+++ b/Documentation/translations/zh_TW/process/3.Early-stage.rst
@@ -4,15 +4,6 @@
 
 :Original: :ref:`Documentation/process/3.Early-stage.rst <development_early_stage>`
 
-:Translator:
-
- 時奎亮 Alex Shi <alex.shi@linux.alibaba.com>
-
-:校譯:
-
- 吳想成 Wu XiangCheng <bobwxc@email.cn>
- 胡皓文 Hu Haowen <2023002089@link.tyut.edu.cn>
-
 .. _tw_development_early_stage:
 
 早期規劃
diff --git a/Documentation/translations/zh_TW/process/4.Coding.rst b/Documentation/translations/zh_TW/process/4.Coding.rst
index 233e8718ed41..423d51f4b3de 100644
--- a/Documentation/translations/zh_TW/process/4.Coding.rst
+++ b/Documentation/translations/zh_TW/process/4.Coding.rst
@@ -4,15 +4,6 @@
 
 :Original: :ref:`Documentation/process/4.Coding.rst <development_coding>`
 
-:Translator:
-
- 時奎亮 Alex Shi <alex.shi@linux.alibaba.com>
-
-:校譯:
-
- 吳想成 Wu XiangCheng <bobwxc@email.cn>
- 胡皓文 Hu Haowen <2023002089@link.tyut.edu.cn>
-
 .. _tw_development_coding:
 
 使代碼正確
diff --git a/Documentation/translations/zh_TW/process/5.Posting.rst b/Documentation/translations/zh_TW/process/5.Posting.rst
index 38f3a6d618eb..92de0a0fff1f 100644
--- a/Documentation/translations/zh_TW/process/5.Posting.rst
+++ b/Documentation/translations/zh_TW/process/5.Posting.rst
@@ -4,15 +4,6 @@
 
 :Original: :ref:`Documentation/process/5.Posting.rst <development_posting>`
 
-:Translator:
-
- 時奎亮 Alex Shi <alex.shi@linux.alibaba.com>
-
-:校譯:
-
- 吳想成 Wu XiangCheng <bobwxc@email.cn>
- 胡皓文 Hu Haowen <2023002089@link.tyut.edu.cn>
-
 .. _tw_development_posting:
 
 發佈補丁
diff --git a/Documentation/translations/zh_TW/process/6.Followthrough.rst b/Documentation/translations/zh_TW/process/6.Followthrough.rst
index f3b195966632..76082a15677f 100644
--- a/Documentation/translations/zh_TW/process/6.Followthrough.rst
+++ b/Documentation/translations/zh_TW/process/6.Followthrough.rst
@@ -4,15 +4,6 @@
 
 :Original: :ref:`Documentation/process/6.Followthrough.rst <development_followthrough>`
 
-:Translator:
-
- 時奎亮 Alex Shi <alex.shi@linux.alibaba.com>
-
-:校譯:
-
- 吳想成 Wu XiangCheng <bobwxc@email.cn>
- 胡皓文 Hu Haowen <2023002089@link.tyut.edu.cn>
-
 .. _tw_development_followthrough:
 
 跟進
diff --git a/Documentation/translations/zh_TW/process/7.AdvancedTopics.rst b/Documentation/translations/zh_TW/process/7.AdvancedTopics.rst
index b449d67e3ad9..6d11c0d98409 100644
--- a/Documentation/translations/zh_TW/process/7.AdvancedTopics.rst
+++ b/Documentation/translations/zh_TW/process/7.AdvancedTopics.rst
@@ -4,15 +4,6 @@
 
 :Original: :ref:`Documentation/process/7.AdvancedTopics.rst <development_advancedtopics>`
 
-:Translator:
-
- 時奎亮 Alex Shi <alex.shi@linux.alibaba.com>
-
-:校譯:
-
- 吳想成 Wu XiangCheng <bobwxc@email.cn>
- 胡皓文 Hu Haowen <2023002089@link.tyut.edu.cn>
-
 .. _tw_development_advancedtopics:
 
 高級主題
diff --git a/Documentation/translations/zh_TW/process/8.Conclusion.rst b/Documentation/translations/zh_TW/process/8.Conclusion.rst
index d1634421b62c..696ac9873cbf 100644
--- a/Documentation/translations/zh_TW/process/8.Conclusion.rst
+++ b/Documentation/translations/zh_TW/process/8.Conclusion.rst
@@ -3,14 +3,6 @@
 .. include:: ../disclaimer-zh_TW.rst
 
 :Original: :ref:`Documentation/process/8.Conclusion.rst <development_conclusion>`
-:Translator:
-
- 時奎亮 Alex Shi <alex.shi@linux.alibaba.com>
-
-:校譯:
-
- 吳想成 Wu XiangCheng <bobwxc@email.cn>
- 胡皓文 Hu Haowen <2023002089@link.tyut.edu.cn>
 
 .. _tw_development_conclusion:
 
diff --git a/Documentation/translations/zh_TW/process/code-of-conduct-interpretation.rst b/Documentation/translations/zh_TW/process/code-of-conduct-interpretation.rst
index fbe66b001322..f502675cfbef 100644
--- a/Documentation/translations/zh_TW/process/code-of-conduct-interpretation.rst
+++ b/Documentation/translations/zh_TW/process/code-of-conduct-interpretation.rst
@@ -3,8 +3,6 @@
 .. include:: ../disclaimer-zh_TW.rst
 
 :Original: :ref:`Documentation/process/code-of-conduct-interpretation.rst <code_of_conduct_interpretation>`
-:Translator: Alex Shi <alex.shi@linux.alibaba.com>
-             Hu Haowen <2023002089@link.tyut.edu.cn>
 
 .. _tw_code_of_conduct_interpretation:
 
diff --git a/Documentation/translations/zh_TW/process/code-of-conduct.rst b/Documentation/translations/zh_TW/process/code-of-conduct.rst
index d24f1695bd02..0266cd74a0b1 100644
--- a/Documentation/translations/zh_TW/process/code-of-conduct.rst
+++ b/Documentation/translations/zh_TW/process/code-of-conduct.rst
@@ -3,8 +3,6 @@
 .. include:: ../disclaimer-zh_TW.rst
 
 :Original: :ref:`Documentation/process/code-of-conduct.rst <code_of_conduct>`
-:Translator: Alex Shi <alex.shi@linux.alibaba.com>
-             Hu Haowen <2023002089@link.tyut.edu.cn>
 
 .. _tw_code_of_conduct:
 
diff --git a/Documentation/translations/zh_TW/process/coding-style.rst b/Documentation/translations/zh_TW/process/coding-style.rst
index 63c78982a1af..45f7c9acc571 100644
--- a/Documentation/translations/zh_TW/process/coding-style.rst
+++ b/Documentation/translations/zh_TW/process/coding-style.rst
@@ -6,19 +6,6 @@
 
 .. _tw_codingstyle:
 
-:譯者:
- - 張樂 Zhang Le <r0bertz@gentoo.org>
- - Andy Deng <theandy.deng@gmail.com>
- - 吳想成 <bobwxc@email.cn>
-
-:校譯:
- - 王聰 Wang Cong <xiyou.wangcong@gmail.com>
- - wheelz <kernel.zeng@gmail.com>
- - 管旭東 Xudong Guan <xudong.guan@gmail.com>
- - Li Zefan <lizf@cn.fujitsu.com>
- - Wang Chen <wangchen@cn.fujitsu.com>
- - Hu Haowen <2023002089@link.tyut.edu.cn>
-
 Linux 內核代碼風格
 ==================
 
diff --git a/Documentation/translations/zh_TW/process/development-process.rst b/Documentation/translations/zh_TW/process/development-process.rst
index 305d9472b017..1d22aa0d3711 100644
--- a/Documentation/translations/zh_TW/process/development-process.rst
+++ b/Documentation/translations/zh_TW/process/development-process.rst
@@ -3,8 +3,6 @@
 .. include:: ../disclaimer-zh_TW.rst
 
 :Original: :ref:`Documentation/process/development-process.rst <development_process_main>`
-:Translator: Alex Shi <alex.shi@linux.alibaba.com>
-             Hu Haowen <2023002089@link.tyut.edu.cn>
 
 .. _tw_development_process_main:
 
diff --git a/Documentation/translations/zh_TW/process/email-clients.rst b/Documentation/translations/zh_TW/process/email-clients.rst
index 4543c447d797..704f06942d70 100644
--- a/Documentation/translations/zh_TW/process/email-clients.rst
+++ b/Documentation/translations/zh_TW/process/email-clients.rst
@@ -6,17 +6,6 @@
 
 :Original: Documentation/process/email-clients.rst
 
-:譯者:
- - 賈威威  Harry Wei <harryxiyou@gmail.com>
- - 時奎亮  Alex Shi <alexs@kernel.org>
- - 吳想成  Wu XiangCheng <bobwxc@email.cn>
-
-:校譯:
- - Yinglin Luan <synmyth@gmail.com>
- - Xiaochen Wang <wangxiaochen0@gmail.com>
- - yaxinsn <yaxinsn@163.com>
- - Hu Haowen <2023002089@link.tyut.edu.cn>
-
 Linux郵件客戶端配置信息
 =======================
 
diff --git a/Documentation/translations/zh_TW/process/embargoed-hardware-issues.rst b/Documentation/translations/zh_TW/process/embargoed-hardware-issues.rst
index 93d21fd88910..af7c57906864 100644
--- a/Documentation/translations/zh_TW/process/embargoed-hardware-issues.rst
+++ b/Documentation/translations/zh_TW/process/embargoed-hardware-issues.rst
@@ -3,8 +3,6 @@
 .. include:: ../disclaimer-zh_TW.rst
 
 :Original: :ref:`Documentation/process/embargoed-hardware-issues.rst <embargoed_hardware_issues>`
-:Translator: Alex Shi <alex.shi@linux.alibaba.com>
-             Hu Haowen <2023002089@link.tyut.edu.cn>
 
 被限制的硬件問題
 ================
diff --git a/Documentation/translations/zh_TW/process/howto.rst b/Documentation/translations/zh_TW/process/howto.rst
index 80c416483e73..34397c156320 100644
--- a/Documentation/translations/zh_TW/process/howto.rst
+++ b/Documentation/translations/zh_TW/process/howto.rst
@@ -6,18 +6,6 @@
 
 :Original: :ref:`Documentation/process/howto.rst <process_howto>`
 
-譯者::
-
-    英文版維護者： Greg Kroah-Hartman <greg@kroah.com>
-    中文版維護者： 李陽  Li Yang <leoyang.li@nxp.com>
-    中文版翻譯者： 李陽  Li Yang <leoyang.li@nxp.com>
-                   時奎亮 Alex Shi <alex.shi@linux.alibaba.com>
-    中文版校譯者:
-                   鍾宇  TripleX Chung <xxx.phy@gmail.com>
-                   陳琦  Maggie Chen <chenqi@beyondsoft.com>
-                   王聰  Wang Cong <xiyou.wangcong@gmail.com>
-                   胡皓文 Hu Haowen <2023002089@link.tyut.edu.cn>
-
 如何參與Linux內核開發
 =====================
 
@@ -492,8 +480,3 @@ Kees Cook, Andrew Morton, Andi Kleen, Vadim Lobanov, Jesper Juhl, Adrian
 Bunk, Keri Harris, Frans Pop, David A. Wheeler, Junio Hamano, Michael
 Kerrisk和Alex Shepard的評審、建議和貢獻。沒有他們的幫助，這篇文檔是不可
 能完成的。
-
-
-
-英文版維護者： Greg Kroah-Hartman <greg@kroah.com>
-
diff --git a/Documentation/translations/zh_TW/process/index.rst b/Documentation/translations/zh_TW/process/index.rst
index 65922d9faa20..11ee809bffe3 100644
--- a/Documentation/translations/zh_TW/process/index.rst
+++ b/Documentation/translations/zh_TW/process/index.rst
@@ -8,8 +8,6 @@
 .. include:: ../disclaimer-zh_TW.rst
 
 :Original: :ref:`Documentation/process/index.rst <process_index>`
-:Translator: Alex Shi <alex.shi@linux.alibaba.com>
-             Hu Haowen <2023002089@link.tyut.edu.cn>
 
 .. _tw_process_index:
 
diff --git a/Documentation/translations/zh_TW/process/kernel-driver-statement.rst b/Documentation/translations/zh_TW/process/kernel-driver-statement.rst
index 23d5cae9685b..34bcb6f164cb 100644
--- a/Documentation/translations/zh_TW/process/kernel-driver-statement.rst
+++ b/Documentation/translations/zh_TW/process/kernel-driver-statement.rst
@@ -5,8 +5,6 @@
 .. include:: ../disclaimer-zh_TW.rst
 
 :Original: :ref:`Documentation/process/kernel-driver-statement.rst <process_statement_driver>`
-:Translator: Alex Shi <alex.shi@linux.alibaba.com>
-             Hu Haowen <2023002089@link.tyut.edu.cn>
 
 內核驅動聲明
 ------------
diff --git a/Documentation/translations/zh_TW/process/kernel-enforcement-statement.rst b/Documentation/translations/zh_TW/process/kernel-enforcement-statement.rst
index 524eb4ac26cc..d54d20529294 100644
--- a/Documentation/translations/zh_TW/process/kernel-enforcement-statement.rst
+++ b/Documentation/translations/zh_TW/process/kernel-enforcement-statement.rst
@@ -5,8 +5,6 @@
 .. include:: ../disclaimer-zh_TW.rst
 
 :Original: :ref:`Documentation/process/kernel-enforcement-statement.rst <process_statement_kernel>`
-:Translator: Alex Shi <alex.shi@linux.alibaba.com>
-             Hu Haowen <2023002089@link.tyut.edu.cn>
 
 Linux 內核執行聲明
 ------------------
diff --git a/Documentation/translations/zh_TW/process/license-rules.rst b/Documentation/translations/zh_TW/process/license-rules.rst
index 594255856b68..0e4a4d97e4ad 100644
--- a/Documentation/translations/zh_TW/process/license-rules.rst
+++ b/Documentation/translations/zh_TW/process/license-rules.rst
@@ -3,8 +3,6 @@
 .. include:: ../disclaimer-zh_TW.rst
 
 :Original: :ref:`Documentation/process/license-rules.rst <kernel_licensing>`
-:Translator: Alex Shi <alex.shi@linux.alibaba.com>
-             Hu Haowen <2023002089@link.tyut.edu.cn>
 
 .. _tw_kernel_licensing:
 
diff --git a/Documentation/translations/zh_TW/process/magic-number.rst b/Documentation/translations/zh_TW/process/magic-number.rst
index bc7eb025dd1e..af1b2d05942a 100644
--- a/Documentation/translations/zh_TW/process/magic-number.rst
+++ b/Documentation/translations/zh_TW/process/magic-number.rst
@@ -6,14 +6,6 @@
 
 :Original: :ref:`Documentation/staging/magic-number.rst <magicnumbers>`
 
-如果想評論或更新本文的內容，請直接發信到LKML。如果你使用英文交流有困難的話，也可
-以向中文版維護者求助。如果本翻譯更新不及時或者翻譯存在問題，請聯繫中文版維護者::
-
-        中文版維護者： 賈威威 Jia Wei Wei <harryxiyou@gmail.com>
-        中文版翻譯者： 賈威威 Jia Wei Wei <harryxiyou@gmail.com>
-        中文版校譯者： 賈威威 Jia Wei Wei <harryxiyou@gmail.com>
-                      胡皓文 Hu Haowen <2023002089@link.tyut.edu.cn>
-
 Linux 魔術數
 ============
 
diff --git a/Documentation/translations/zh_TW/process/management-style.rst b/Documentation/translations/zh_TW/process/management-style.rst
index 7cb912e89032..2cef0ef25ede 100644
--- a/Documentation/translations/zh_TW/process/management-style.rst
+++ b/Documentation/translations/zh_TW/process/management-style.rst
@@ -3,8 +3,6 @@
 .. include:: ../disclaimer-zh_TW.rst
 
 :Original: :ref:`Documentation/process/management-style.rst <managementstyle>`
-:Translator: Alex Shi <alex.shi@linux.alibaba.com>
-             Hu Haowen <2023002089@link.tyut.edu.cn>
 
 .. _tw_managementstyle:
 
diff --git a/Documentation/translations/zh_TW/process/programming-language.rst b/Documentation/translations/zh_TW/process/programming-language.rst
index d2c64a5599e8..85220b5cd34c 100644
--- a/Documentation/translations/zh_TW/process/programming-language.rst
+++ b/Documentation/translations/zh_TW/process/programming-language.rst
@@ -3,8 +3,6 @@
 .. include:: ../disclaimer-zh_TW.rst
 
 :Original: :ref:`Documentation/process/programming-language.rst <programming_language>`
-:Translator: Alex Shi <alex.shi@linux.alibaba.com>
-             Hu Haowen <2023002089@link.tyut.edu.cn>
 
 .. _tw_programming_language:
 
diff --git a/Documentation/translations/zh_TW/process/stable-api-nonsense.rst b/Documentation/translations/zh_TW/process/stable-api-nonsense.rst
index 4b8597fed5ae..4075db54ae50 100644
--- a/Documentation/translations/zh_TW/process/stable-api-nonsense.rst
+++ b/Documentation/translations/zh_TW/process/stable-api-nonsense.rst
@@ -7,13 +7,6 @@
 :Original: :ref:`Documentation/process/stable-api-nonsense.rst
            <stable_api_nonsense>`
 
-譯者::
-
-        中文版維護者： 鍾宇  TripleX Chung <xxx.phy@gmail.com>
-        中文版翻譯者： 鍾宇  TripleX Chung <xxx.phy@gmail.com>
-        中文版校譯者： 李陽  Li Yang <leoyang.li@nxp.com>
-                      胡皓文 Hu Haowen <2023002089@link.tyut.edu.cn>
-
 Linux 內核驅動接口
 ==================
 
@@ -154,6 +147,3 @@ Linux能成爲強壯，穩定，成熟的操作系統，這也是你最開始選
 ----
 感謝 Randy Dunlap, Andrew Morton, David Brownell, Hanna Linder,
 Robert Love, and Nishanth Aravamudan 對於本文檔早期版本的評審和建議。
-
-英文版維護者： Greg Kroah-Hartman <greg@kroah.com>
-
diff --git a/Documentation/translations/zh_TW/process/stable-kernel-rules.rst b/Documentation/translations/zh_TW/process/stable-kernel-rules.rst
index 2f8f064f8629..ff9675a05fa5 100644
--- a/Documentation/translations/zh_TW/process/stable-kernel-rules.rst
+++ b/Documentation/translations/zh_TW/process/stable-kernel-rules.rst
@@ -6,17 +6,6 @@
 
 :Original: :ref:`Documentation/process/stable-kernel-rules.rst <stable_kernel_rules>`
 
-如果想評論或更新本文的內容，請直接聯繫原文檔的維護者。如果你使用英文
-交流有困難的話，也可以向中文版維護者求助。如果本翻譯更新不及時或者翻
-譯存在問題，請聯繫中文版維護者::
-
-        中文版維護者： 鍾宇  TripleX Chung <xxx.phy@gmail.com>
-        中文版翻譯者： 鍾宇  TripleX Chung <xxx.phy@gmail.com>
-        中文版校譯者：
-            - 李陽  Li Yang <leoyang.li@nxp.com>
-            - Kangkai Yin <e12051@motorola.com>
-            - 胡皓文 Hu Haowen <2023002089@link.tyut.edu.cn>
-
 所有你想知道的事情 - 關於linux穩定版發佈
 ========================================
 
diff --git a/Documentation/translations/zh_TW/process/submit-checklist.rst b/Documentation/translations/zh_TW/process/submit-checklist.rst
index 06aa635a659c..452fecc7c425 100644
--- a/Documentation/translations/zh_TW/process/submit-checklist.rst
+++ b/Documentation/translations/zh_TW/process/submit-checklist.rst
@@ -3,10 +3,6 @@
 .. include:: ../disclaimer-zh_TW.rst
 
 :Original: Documentation/process/submit-checklist.rst
-:Translator:
- - Alex Shi <alexs@kernel.org>
- - Wu XiangCheng <bobwxc@email.cn>
- - Hu Haowen <2023002089@link.tyut.edu.cn>
 
 .. _tw_submitchecklist:
 
diff --git a/Documentation/translations/zh_TW/process/submitting-patches.rst b/Documentation/translations/zh_TW/process/submitting-patches.rst
index 64de92c07906..92fd15e1424a 100644
--- a/Documentation/translations/zh_TW/process/submitting-patches.rst
+++ b/Documentation/translations/zh_TW/process/submitting-patches.rst
@@ -6,17 +6,6 @@
 
 :Original: Documentation/process/submitting-patches.rst
 
-:譯者:
- - 鍾宇 TripleX Chung <xxx.phy@gmail.com>
- - 時奎亮 Alex Shi <alexs@kernel.org>
- - 吳想成 Wu XiangCheng <bobwxc@email.cn>
-
-:校譯:
- - 李陽 Li Yang <leoyang.li@nxp.com>
- - 王聰 Wang Cong <xiyou.wangcong@gmail.com>
- - 胡皓文 Hu Haowen <2023002089@link.tyut.edu.cn>
-
-
 提交補丁：如何讓你的改動進入內核
 ================================
 
diff --git a/Documentation/translations/zh_TW/process/volatile-considered-harmful.rst b/Documentation/translations/zh_TW/process/volatile-considered-harmful.rst
index e2723f3cbbb0..edfc83f32672 100644
--- a/Documentation/translations/zh_TW/process/volatile-considered-harmful.rst
+++ b/Documentation/translations/zh_TW/process/volatile-considered-harmful.rst
@@ -7,18 +7,6 @@
 :Original: :ref:`Documentation/process/volatile-considered-harmful.rst
            <volatile_considered_harmful>`
 
-如果想評論或更新本文的內容，請直接聯繫原文檔的維護者。如果你使用英文
-交流有困難的話，也可以向中文版維護者求助。如果本翻譯更新不及時或者翻
-譯存在問題，請聯繫中文版維護者::
-
-        英文版維護者： Jonathan Corbet <corbet@lwn.net>
-        中文版維護者： 伍鵬  Bryan Wu <bryan.wu@analog.com>
-        中文版翻譯者： 伍鵬  Bryan Wu <bryan.wu@analog.com>
-        中文版校譯者： 張漢輝  Eugene Teo <eugeneteo@kernel.sg>
-                       楊瑞  Dave Young <hidave.darkstar@gmail.com>
-                       時奎亮 Alex Shi <alex.shi@linux.alibaba.com>
-                       胡皓文 Hu Haowen <2023002089@link.tyut.edu.cn>
-
 爲什麼不應該使用“volatile”類型
 ==============================
 
-- 
2.43.0

