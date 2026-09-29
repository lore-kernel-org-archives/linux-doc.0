Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 999CA5275A7
	for <linux-doc@vger.kernel.org>; Tue, 29 Sep 2026 13:10:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790687437; cv=none; b=iqsH2zdaghake6+BD4tZQL5blH3WRRLIl+AOa39BVAomdnJAhl9rOLC8hLslw9iXWDtpQwcGVzfynbG0smN3CVQBHzBO/vD83L0ptU+iYSnnip692KoJ85vlsFRMmGaWlUjOF54lkOpBWzuBY4XXbIhGfhyX4JFvxcjivNuvL94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790687437; c=relaxed/simple;
	bh=9JkFDyFnne60cZKI99Tde/fBYbl8bUP5ZX0SoTB8IfM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LTOI6M20HVUo2VWxVxNEw20KarEk49/8no7PDvzG8RXHNMDNKTimRQP1C4P5Ei9AVF5+viinTWt45tfSAayOB7EPD1Ub4ntmD8VNqub1N4tKX1QjW0eFWjHPoQw14ZiLeoMAehsOCFjcq3+KyHf2hNJF3P/CinvTov01LYoyVM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CtUpRFtf; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CtUpRFtf"
Received: by mail-pj2-f43.google.com with SMTP id d9443c01a7336-2dd89b59dccso3557355ad.2
        for <linux-doc@vger.kernel.org>; Tue, 29 Sep 2026 06:10:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790687435; x=1791292235; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DnI3VRJUJJQ2XaVm2Yzhi0zxE983U0SkBlKpcLF8eCo=;
        b=CtUpRFtfwX96vCKnnyeQCnE0F27yspmZAz8R9rfmHlKJTnDgAjQDS4UOOs3pjCeIKI
         c+nGnKUHjTsLhneLgbrGzS4VuHjcsTaM99L2SxQKNQ1iTDSKFO7MzN0Rjs2pF+Y2tACc
         +GX8bSfuBzkMUE4u1BVcmrwsmhHtMXG8+A69Bv/5u4XJzkuGMxe4FLE/cLPjUOC/D9+F
         7/Tk+CPC8xDtC5pq3VqOYEMN92ofvLoQLzT2Wcie4kxqt28nzg7M2WxCrAC0lY34hT4L
         VcroM8uErB8rlu7Zvtnk4fJyknaoEMUeSYsHtslsv97WiXWga6YqoQokNAmhJeRXgsnz
         Snlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790687435; x=1791292235;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DnI3VRJUJJQ2XaVm2Yzhi0zxE983U0SkBlKpcLF8eCo=;
        b=lgyTHdGrzkqahan3I9JySy+gXy7AO0BwrKNuAkINUnS8xyf+TQ910l3u52rU7qEi3A
         cREovu19aFM6e3VaErdu9lO1YdfWshNGM2N4h6MsHd4YvWJKzX9yj+c0Vh0bSCGW/k/g
         FAdBKqwZx4anq6RDeMv5hBkoJnK3tJuy8iHa/bzB2fK5bNFVFFD2l9VdHjUF+bPRLLyO
         Q2419sJONr41GVoKowAJEAuv90gTOK+r4wjHyjSK/8ncWZ7UG9qFX+V5LNQmLXZU1xpl
         Ij5zc0u0pTP8A4Y9glOj4BaapdaelloTteARfz7YDL27UEa+uoSDK1xGuIRDzNxUYC4a
         VW9g==
X-Forwarded-Encrypted: i=1; AKwUvBy75zaSiUdIW+1W0++i8Cw6wKW6poSBQgmKt8pZ2MuEmoAyyfbMno+K2CEvLCxTNPaKES0DmvhYTpY=@vger.kernel.org
X-Gm-Message-State: AFq9FYKORKSZnTllX/7w5p6xKx1OQFBlsigQnQXPM7M8DALQAeLelXRM
	2aZuBmy2HviKuaN4HMVt32O56aXJ/l6PaSH2uj3sf8oNxMpZieS8LQZV
X-Gm-Gg: AYBFou25CTQy8hPp/6VhCUEAQlpQMKVf7qGnwglSEGCy1PKLhD52KbPCNx6Ps5bQuVA
	CV++xO2mSJqS2m+pr5KnzZnhL+tB7OfjZSJOF6FBEfHqlJrxKk7vqDpXaMPgGUsU9WYhyLJvchN
	Vfhn3/hZurMlahr42/T8qRwTIcAvbwnfUALL6uV9lH5PB0vW38J/P55Fv7huHpng9W0ELHxoSYq
	TuLkmPTEXmK8EpFcipxVEehABEYEAzqUiSWb3BlL5RJXCnpelMQVv9SZP4p0P1Buy/bOQ5ZG3c1
	O+UV9VTElf0nfpjOsZkPtd+hw4uTOigqyApJU9O375Q0Ix0p0qcCLnHbzxgT6+dGtSZ6VQSxY6u
	xlSj8lA5CfOyxyCTDjhuqKr6j4iz7dnrtcBJc0/d4M4mJNwXPvOKBCdqFJ8j9aOzPeWGjsmYMgY
	YA+M+ibyXD1uE5MUKEGC0X/ZUsKO+jxp3zDmnQRZw+oIey6un8tCgkGQ5DNH6AdDsITcF3VLyH/
	f2vb+2DN8H2DtWE5NRTmkWFw7430PhL/mvSNpxE22JRSKYWX+vuyqgC9g==
X-Received: by 2002:a17:903:3d10:b0:2df:8ab7:fe3a with SMTP id d9443c01a7336-2df8e751adamr161899705ad.4.1790687434548;
        Tue, 29 Sep 2026 06:10:34 -0700 (PDT)
Received: from chenyou.. ([140.116.39.229])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df9142969esm57363705ad.45.2026.09.29.06.10.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 06:10:33 -0700 (PDT)
From: Chen-Yu Yeh <chenyou910331@gmail.com>
To: corbet@lwn.net,
	alexs@kernel.org
Cc: dzm91@hust.edu.cn,
	wy@wyuan.org,
	si.yanteng@linux.dev,
	srcres258@furdevs.cn,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chen-Yu Yeh <chenyou910331@gmail.com>
Subject: [PATCH 2/4] docs/zh_TW: move magic-number to staging/
Date: Tue, 29 Sep 2026 21:10:16 +0800
Message-ID: <20260929131020.266120-3-chenyou910331@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260929131020.266120-1-chenyou910331@gmail.com>
References: <20260929131020.266120-1-chenyou910331@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The English original moved from process/ to staging/ in
commit f9a4f4a0e1f5 ("Docs: Move magic-number from process to staging"),
but the translation stayed behind.  checktransupdate.py locates the
English original from the translation's path, so it currently reports:

  Cannot find the origin path for
  Documentation/translations/zh_TW/process/magic-number.rst

Move it to match the English layout.  zh_TW has no staging/ directory
yet, so add a staging/index.rst that follows the English one, listing
the documents not translated yet under TODOList as zh_CN does, and link
it from the top-level index in place of its TODOList entry.  The content
of magic-number.rst is unchanged.

Unlike most of the tree, this translation was kept in step for a while
by the English authors themselves: the 2022 series that removed stale
magic numbers edited the translations as well, and so did
commit dd8d4bc28ad7 ("net: remove ax25 and amateur radio (hamradio)
subsystem").  The one English change it lacks is
commit cdcfc029482a ("Documentation: Fix incorrect paths/magic in magic
numbers rst"), which went in after the move.  Use the move commit as the
baseline so that change is reported; checktransupdate.py will also list
dd8d4bc28ad7, which is already reflected here.

update to commit f9a4f4a0e1f5 ("Docs: Move magic-number from process to
staging")

Signed-off-by: Chen-Yu Yeh <chenyou910331@gmail.com>
---
 Documentation/translations/zh_TW/index.rst    |  5 ++--
 .../translations/zh_TW/process/index.rst      |  5 ----
 .../translations/zh_TW/staging/index.rst      | 23 +++++++++++++++++++
 .../{process => staging}/magic-number.rst     |  0
 4 files changed, 26 insertions(+), 7 deletions(-)
 create mode 100644 Documentation/translations/zh_TW/staging/index.rst
 rename Documentation/translations/zh_TW/{process => staging}/magic-number.rst (100%)

diff --git a/Documentation/translations/zh_TW/index.rst b/Documentation/translations/zh_TW/index.rst
index fb86de03c423..1dddf5963864 100644
--- a/Documentation/translations/zh_TW/index.rst
+++ b/Documentation/translations/zh_TW/index.rst
@@ -112,9 +112,10 @@ TODOList:
 有幾份未分類的文檔似乎不適合放在文檔的其他部分，或者可能需要進行一些調整和/或
 轉換爲reStructureText格式，也有可能太舊。
 
-TODOList:
+.. toctree::
+   :maxdepth: 2
 
-* staging/index
+   staging/index
 
 術語表
 ------
diff --git a/Documentation/translations/zh_TW/process/index.rst b/Documentation/translations/zh_TW/process/index.rst
index 18653aa75d7d..de99156324df 100644
--- a/Documentation/translations/zh_TW/process/index.rst
+++ b/Documentation/translations/zh_TW/process/index.rst
@@ -113,11 +113,6 @@ TODOList:
 
 這裡是一些大多數開發者會感興趣的其他社群指南：
 
-.. toctree::
-   :maxdepth: 1
-
-   magic-number
-
 TODOList:
 
 * kernel-docs
diff --git a/Documentation/translations/zh_TW/staging/index.rst b/Documentation/translations/zh_TW/staging/index.rst
new file mode 100644
index 000000000000..556c63a17f9c
--- /dev/null
+++ b/Documentation/translations/zh_TW/staging/index.rst
@@ -0,0 +1,23 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+.. include:: ../disclaimer-zh_TW.rst
+
+:Original: Documentation/staging/index.rst
+
+未分類文件
+==========
+
+.. toctree::
+   :maxdepth: 2
+
+   magic-number
+
+TODOList:
+
+* crc32
+* lzo
+* remoteproc
+* rpmsg
+* speculation
+* static-keys
+* xz
diff --git a/Documentation/translations/zh_TW/process/magic-number.rst b/Documentation/translations/zh_TW/staging/magic-number.rst
similarity index 100%
rename from Documentation/translations/zh_TW/process/magic-number.rst
rename to Documentation/translations/zh_TW/staging/magic-number.rst
-- 
2.43.0

