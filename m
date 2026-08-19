Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB8D0388396
	for <linux-doc@vger.kernel.org>; Wed, 19 Aug 2026 14:58:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787151525; cv=none; b=QCoR+bHndv7+oz0765YukZBkUjUUoAjThHfw7ocy1jiDP9BY+2P1AXma8B1jVrEZGDCSa2DzmnW85VhhIGL3AMnGJJtoPlZuI8QCEyK2KGCYDPzQrh2IewzHsjUTDmkUXkhMjGH87LpTN6beDk18f7Ud0uTQRowlRHEzCk14nIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787151525; c=relaxed/simple;
	bh=/7regp4mgEOI9uPgtZt33oCkWOUybDqX+LBbu3cS8vk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tqk5jkkuNwmy3VwxdgQobuZkZOFVsC7ygSh4XrUt5SY10qGoyieTjTj+cR40dcQTHj2a3wyJE3xT1DjvdeUQWLuGd+kGYvUvwgVSzF6rnRToxPmT/+Gz9ExjaZNjPPnbltGdAWB4kQktaUqg4fkRGDksPXbk109SdlXDRSyhtko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Daiv6iF6; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Daiv6iF6"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2d01548ac96so2107355ad.3
        for <linux-doc@vger.kernel.org>; Wed, 19 Aug 2026 07:58:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787151515; x=1787756315; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=29tidJaDMQRRFTj7+DkkfxxS631jE/ehjHsaivheBSY=;
        b=Daiv6iF6B1iRMjsg7SRwc9SF/SBF8PSHq2Lty1xN7WTmRgNVHizU6fPGrZQ6eqCKct
         mpUDkmrnW/VqtNA1FRV00rruEnLxag3OCCQGQoHmTb3DenOt8yY29txRctz/duwjXzH1
         qqqQISuUaaHEIt4Zx5Ky1dBPvAYjvJC5KtPNe5I4kPV710cQ83usw8eBPnNwnT5WEqJM
         6nny4IefklN/nnZkI6vKF87K63BjHi6xhs/Za++B6xdCksKLSdo1UaXt8bEltNxi/Slb
         /0sofwzTZaZwbQ4PTfYx9sNbwqBZdk99Y6k1W+hBtNM3iiM7W8TWVD4xeFP6Ygs+9vod
         nEYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787151515; x=1787756315;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=29tidJaDMQRRFTj7+DkkfxxS631jE/ehjHsaivheBSY=;
        b=gzRNwvNqr57jnRi6KggsKmlUCxkWmVW+0EYCoNnr5PnEDwVb8G9sLrJMEm8Dm2lpm5
         FFTGQkP597C9MB7fBeBrOcp10gEC37fso9DIbDcYYygkOmCeK0T42B8uOM0xwLfASmuy
         Jyv5GSmrHlSGcfBIq31lou8OC4MwjmMbATUY8jGaZdqkBvk6FQauFKs1v8wIXa6Cjeel
         chYXmNEQyqxtU+/aEvVg8SZmyTly0jBJ20JZDvKCGjbB57G7PiO6ZW8ZWGWP7PpvQAgN
         y+bV/CBvgnnkpof7Stt0V1BXcDRXuUJBBKDYruBQlW2k889SMeslcV6El+YXlYntp+RJ
         eWlA==
X-Forwarded-Encrypted: i=1; AHgh+RquIq3J6BtD5MVTSCX6s4g5Dl//l8OlB9RRMags2GtEYktSRN/JTQkB/PNstTLwza+Ye3GF/+XzV+s=@vger.kernel.org
X-Gm-Message-State: AFuF++mt16GgYwpRusSRELWkDG8V0fBipHCjb9g0fuJz0ETs9vGHOG9j
	nbpGmTFjfRLx79RTA3gPnvPJynBcYNab/JzkkiI9dPH0oiRXfgGw9mVx
X-Gm-Gg: AR+sD10QEhDbZWt+bwKoyHMBKyNes3Iv+MfV+w0pU1kU3tJcFcOCwp8HsD+hu89wMLH
	jSOzXkHfpeMHEYXyTPE7ii4RLbplR4X6aFEOXBi0axPknuOVIG5eRzUjiqPj6FOTQRtPqQN5tf0
	jInuNkwlwz1ftLwuyX77icdoMDSwcxrW+OL08Bh5I83U7LhX1SggxMxcuYwvjEi86cfP+pmCUTa
	fAUnUN49D3Sx0+7uWExze+P8ZMBtoMppnm4lGPovQgPuTMC9HPMfuVEKUv5TlT6TQdYVbNJauuQ
	ssEgbFMMqnCvtCiBAYdBvXGLa7jiqOxXmiBtklSaGI6YL4ZFGDurESl0DN04BC9vSwpM8A27taN
	AlWNEmVIFJZBrpTnGRJejUq7C1fgSwzr/wzDs6lDSl4pb/XQ06Ue2QXxnPnzU5XtwTBQWP2P5Lw
	gzPH8vAsOOaWGfbzz+41P40VmprdEXpB22iInIFNtsv+HVvBneyqZ+IElSwQQtTouuWpn2YLJPf
	/IyHUHmj/0kh9X/E4+J2PQO9aAEMSA4FNQ4WM2FwXefuSDU
X-Received: by 2002:a17:903:350c:b0:2d0:2741:f31b with SMTP id d9443c01a7336-2d601862954mr46872455ad.4.1787151514734;
        Wed, 19 Aug 2026 07:58:34 -0700 (PDT)
Received: from chenyou.. ([140.116.39.229])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d5c1e528b3sm25429145ad.46.2026.08.19.07.58.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 07:58:34 -0700 (PDT)
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
Subject: [PATCH 5/7] docs/zh_TW: filesystems: remove maintainer contact information
Date: Wed, 19 Aug 2026 22:58:04 +0800
Message-ID: <20260819145808.291567-6-chenyou910331@gmail.com>
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
 .../translations/zh_TW/filesystems/debugfs.rst         | 10 ----------
 Documentation/translations/zh_TW/filesystems/index.rst |  2 --
 Documentation/translations/zh_TW/filesystems/sysfs.txt | 10 ----------
 .../translations/zh_TW/filesystems/virtiofs.rst        |  8 --------
 4 files changed, 30 deletions(-)

diff --git a/Documentation/translations/zh_TW/filesystems/debugfs.rst b/Documentation/translations/zh_TW/filesystems/debugfs.rst
index cda7d0e18b9b..17e12fc57400 100644
--- a/Documentation/translations/zh_TW/filesystems/debugfs.rst
+++ b/Documentation/translations/zh_TW/filesystems/debugfs.rst
@@ -8,16 +8,6 @@
 Debugfs
 =======
 
-譯者
-::
-
-	中文版維護者： 羅楚成 Chucheng Luo <luochucheng@vivo.com>
-	中文版翻譯者： 羅楚成 Chucheng Luo <luochucheng@vivo.com>
-	中文版校譯者:  羅楚成 Chucheng Luo <luochucheng@vivo.com>
-	繁體中文版校譯者: 胡皓文 Hu Haowen <2023002089@link.tyut.edu.cn>
-
-
-
 版權所有2020 羅楚成 <luochucheng@vivo.com>
 
 
diff --git a/Documentation/translations/zh_TW/filesystems/index.rst b/Documentation/translations/zh_TW/filesystems/index.rst
index 88f0e632bfe2..87307a291c8e 100644
--- a/Documentation/translations/zh_TW/filesystems/index.rst
+++ b/Documentation/translations/zh_TW/filesystems/index.rst
@@ -3,8 +3,6 @@
 .. include:: ../disclaimer-zh_TW.rst
 
 :Original: :ref:`Documentation/filesystems/index.rst <filesystems_index>`
-:Translator: Wang Wenhu <wenhu.wang@vivo.com>
-             Hu Haowen <2023002089@link.tyut.edu.cn>
 
 .. _tw_filesystems_index:
 
diff --git a/Documentation/translations/zh_TW/filesystems/sysfs.txt b/Documentation/translations/zh_TW/filesystems/sysfs.txt
index d1cee02ef1de..8509776dc3cc 100644
--- a/Documentation/translations/zh_TW/filesystems/sysfs.txt
+++ b/Documentation/translations/zh_TW/filesystems/sysfs.txt
@@ -8,22 +8,12 @@ communicating in English you can also ask the Chinese maintainer for
 help.  Contact the Chinese maintainer if this translation is outdated
 or if there is a problem with the translation.
 
-Maintainer: Patrick Mochel	<mochel@osdl.org>
-		Mike Murphy <mamurph@cs.clemson.edu>
-Chinese maintainer: Fu Wei <tekkamanninja@gmail.com>
 ---------------------------------------------------------------------
 Documentation/filesystems/sysfs.rst 的中文翻譯
 
 如果想評論或更新本文的內容，請直接聯繫原文檔的維護者。如果你使用英文
 交流有困難的話，也可以向中文版維護者求助。如果本翻譯更新不及時或者翻
 譯存在問題，請聯繫中文版維護者。
-英文版維護者： Patrick Mochel	<mochel@osdl.org>
-		Mike Murphy <mamurph@cs.clemson.edu>
-中文版維護者： 傅煒 Fu Wei <tekkamanninja@gmail.com>
-中文版翻譯者： 傅煒 Fu Wei <tekkamanninja@gmail.com>
-中文版校譯者： 傅煒 Fu Wei <tekkamanninja@gmail.com>
-繁體中文版校譯者：胡皓文 Hu Haowen <2023002089@link.tyut.edu.cn>
-
 
 以下爲正文
 ---------------------------------------------------------------------
diff --git a/Documentation/translations/zh_TW/filesystems/virtiofs.rst b/Documentation/translations/zh_TW/filesystems/virtiofs.rst
index 704a0ee44fd2..f3a682094266 100644
--- a/Documentation/translations/zh_TW/filesystems/virtiofs.rst
+++ b/Documentation/translations/zh_TW/filesystems/virtiofs.rst
@@ -4,14 +4,6 @@
 
 :Original: :ref:`Documentation/filesystems/virtiofs.rst <virtiofs_index>`
 
-譯者
-::
-
-	中文版維護者： 王文虎 Wang Wenhu <wenhu.wang@vivo.com>
-	中文版翻譯者： 王文虎 Wang Wenhu <wenhu.wang@vivo.com>
-	中文版校譯者： 王文虎 Wang Wenhu <wenhu.wang@vivo.com>
-	繁體中文版校譯者：胡皓文 Hu Haowen <2023002089@link.tyut.edu.cn>
-
 ===========================================
 virtiofs: virtio-fs 主機<->客機共享文件系統
 ===========================================
-- 
2.43.0

