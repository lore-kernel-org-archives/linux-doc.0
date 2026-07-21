Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8447542DFEC
	for <linux-doc@vger.kernel.org>; Tue, 21 Jul 2026 21:55:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784670953; cv=none; b=uF4uXsoui3zOtuD+PdSCy9TDlpyGE8pfgp0mvGVLojiGl5HJQDzA0RtS3kyHVRETONcQ0XMZPFcDQC+bVbeUqwkkxlNW2B+ZrsN4KoHurK7Mh33Luz0oZPwBiP2VcLj3gBvWStgyhzD9i5f0VVSnZu5Uw/wDwykngCLSeeyxN9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784670953; c=relaxed/simple;
	bh=7IX6sTZ9uoh4JcyuiFFUm1/R83+MwsqcFFX21YeSkPk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=WfJN3i7FTa5uY5XNnLAHXBAbUJVXBJIOYmyQyVuQW1y/TdKx7D7yy88mZW3Y/PEtF1274FPXY137dlYJMag1AQ0glCs5UtsS/MTFM05CJUOAfHVMDQ43OdNeQJH5rYO5mc8qnAHo8sMbdGFDNwRx55vfkzpZHQm3WMhq4wezWs8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SZ2g2fQ8; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SZ2g2fQ8"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2cad68425a7so16948555ad.1
        for <linux-doc@vger.kernel.org>; Tue, 21 Jul 2026 14:55:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784670951; x=1785275751; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KR2ZmokLIKjMAWHhrn+iBhwYSMA4SMI4rjPnpQ304Ks=;
        b=SZ2g2fQ8IHTe0qCnmkiFNqMKUYqFxLvvvxIrNs/8so9J5HVwMvfJfBHpiG/xBtEkQp
         dPpD/iOnvaNa+iNAduWXMywSRTJYhqEJRDsPotK70tfPz9JEki2vgq71YU9RiiETzHaA
         lSmzZa0svA+Xz34dE+3++969z3uiidcmrvmqb1fOpAsc04LMiIqz+tnUSLJ2t4UalvIW
         igvLF72aGKaB7cFXLqRegCLudQHgNDrgj8GFc6CUlRfH6PEu5s194zn9C01FeCF15D/4
         DVtJ4yAP45mIJkhue6EIfEVW6tHMhujXrOXddgj8aCPCkm72cNG0ASslHc3AOqijGmtp
         c5jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784670951; x=1785275751;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KR2ZmokLIKjMAWHhrn+iBhwYSMA4SMI4rjPnpQ304Ks=;
        b=Tok3tORNwpHbzIz8L9ETuiagGc9SWvWyzoEb8iE0/byg+fpHXaeuAOoeptgylmHc5j
         hoCl+E22bSoNwVHR+HXZVwDIXEnaQ+632edc5cEthEo76THfR14KXXBfjpPQwXh5V+2T
         DiL+r5RcVSQzzn8aqsgQOz/aVEkk8fgHdBpg8nrjl6BuhH2ammAagBMLO/Kw19l8YSkL
         KPhM9t+SzYId446Z8bGzlQjOz1s7uQ9nydDX1heImhy/bOvV0H3eF/WoapNOvALjXrPj
         cRF8DBcB08uBNWazgNFjq/WyLzBIMJ12XIOrVAX28TGC1EAeWKsOZlLJb+DISJVOVDzu
         jF+g==
X-Forwarded-Encrypted: i=1; AHgh+Rps4PcSDs6x9Cw5C5cK5Shlq+V0d3d9CITHgWAAMhOxq+I2L9GPFTihTAQEc27OlbZomS0j8lr+N0k=@vger.kernel.org
X-Gm-Message-State: AOJu0YyNyWFGPqk6fsvuiJcBN71PoCwtfw/8561Jxdm8V8Qd0PC4JBQb
	ho8GExF8TF2t/WCUvQA9+ZR9Nz0Py0FANzJx8lZNy2uYSkTYVtPMoHIX
X-Gm-Gg: AR+sD12bfvcwNVJ4a6ppcZnsLvRY+v4snqVdk1FWbnF5J6dhSRTrQdWvss+dK3y3jji
	1p2bR/SV0+oolYL0oGiAL/C2qJQZjv5nd9JqaaoROdDh8SZ82/LXDOCexsL8syWyy7nRG2ZMp63
	PbMYzZhdtYEmpdN/vKbZSJc7OrKPkrh+jK5n+oF9bssCI0Uiix3Rf4OanbcJMDNlap3LrltEgKb
	zTLKWv3GfDh2gBDsgOjbIv+M3J2/hq6VCPgsyymFMDq5LvruXaUAyT+QXywpnxzhsg4Jq1k1jNT
	N3AkjpdXRCv+Ov9f0jLukXGUv45IoeeNQa/6gpBQ0gtsEcnnCSXZ/APj6AAVQiCn1jb/pCpT6V1
	JpSChrBK0LztOezE9yHyQQkEhM+7CwUz69VeUQ691JaYdkIa1aekCL4S+59OBl/ZzMATmoLdw7b
	zn2yBIJgJNDHnuVCmLw8Ef4annmd2Afnoomxl6G3o082rYz19sVOHK1oSoCkESRsIDBQ3MgrQUX
	KKdieha78TMwvCHPFGhQd4rKrFabPtL6M4FxRGN
X-Received: by 2002:a17:902:d48c:b0:2cc:7d4a:3f59 with SMTP id d9443c01a7336-2cf805b00d7mr40517485ad.6.1784670951452;
        Tue, 21 Jul 2026 14:55:51 -0700 (PDT)
Received: from chenyou.R15NEW (112-104-169-66.adsl.dynamic.seed.net.tw. [112.104.169.66])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf8edea703sm3697115ad.0.2026.07.21.14.55.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 14:55:50 -0700 (PDT)
From: Chen-Yu Yeh <chenyou910331@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Alex Shi <alexs@kernel.org>
Cc: Dongliang Mu <dzm91@hust.edu.cn>,
	Yanteng Si <si.yanteng@linux.dev>,
	Weijie Yuan <wy@wyuan.org>,
	Hu Haowen <2023002089@link.tyut.edu.cn>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chen-Yu Yeh <chenyou910331@gmail.com>
Subject: [PATCH 00/16] docs/zh_TW: localize terminology and sync process/ documents
Date: Wed, 22 Jul 2026 05:55:26 +0800
Message-ID: <20260721215542.98435-1-chenyou910331@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The zh_TW (Traditional Chinese) translations were originally converted
from the zh_CN tree, so they still use mainland Chinese terminology
(e.g. 內核, 軟件, 接口) that reads unnatural to Taiwanese readers, and
most of the process/ documents have fallen behind their English
originals.

This series localizes the terminology of the existing zh_TW process/
documents to Taiwanese Mandarin and, in the same pass, syncs each
document with its current English original, so that the "update to
commit" markers stay honest for tools/docs/checktransupdate.py.

Each patch covers one document and does both the terminology
localization and the content sync for it. Notable content syncs
include:

  - code-of-conduct-interpretation: new "Enforcement for Unacceptable
    Behavior" section and updated TAB voting language
  - stable-kernel-rules: retranslated from the heavily restructured
    English text (three submission options, stable tag variants)
  - submitting-patches: interleaved-reply etiquette, reworked Acked-by
    semantics, tagging-people permission rules, Assisted-by:, canonical
    patch format subsections and the b4 tooling section
  - embargoed-hardware-issues: "Early access" section and the current
    ambassadors list
  - index: mirrors the reworked English process index layout
  - programming-language: Rust is no longer experimental

The final patch adds Documentation/translations/zh_TW/glossary.rst,
which documents the terminology mapping used across the series (with
zh_CN equivalents for cross-reference) so that reviewers can check the
replacements against a single reference, and future translations can
stay consistent.

A short summary of the main mappings (English / zh_TW / old zh_CN-style):

  kernel      核心   (內核)      software    軟體   (軟件)
  interface   介面   (接口)      memory      記憶體 (內存)
  process     行程   (進程)      queue       佇列   (隊列)
  network     網路   (網絡)      server      伺服器 (服務器)
  default     預設   (默認)      user        使用者 (用戶)
  code        程式碼 (代碼)      file        檔案   (文件)
  community   社群   (社區)      documentation 文件 (文檔)

  - 8.Conclusion: carries a Reviewed-by from an earlier standalone
    review; see the note under --- in that patch for what changed since.

The zh_TW documents were built with "make SPHINXDIRS=translations
htmldocs" without new warnings, and tools/docs/checktransupdate.py -l
zh_TW now reports the series' documents as up to date.

Chen-Yu Yeh (16):
  docs/zh_TW: process: localize terminology in 7.AdvancedTopics.rst
  docs/zh_TW: process: localize terminology in 1.Intro.rst
  docs/zh_TW: process: localize terminology in
    code-of-conduct-interpretation.rst
  docs/zh_TW: process: localize terminology in license-rules.rst
  docs/zh_TW: process: localize terminology in email-clients.rst
  docs/zh_TW: process: localize terminology in programming-language.rst
  docs/zh_TW: process: localize terminology in coding-style.rst
  docs/zh_TW: process: localize terminology in stable-kernel-rules.rst
  docs/zh_TW: process: localize terminology in 5.Posting.rst
  docs/zh_TW: process: localize terminology in 2.Process.rst
  docs/zh_TW: process: localize terminology in howto.rst
  docs/zh_TW: process: localize terminology in
    embargoed-hardware-issues.rst
  docs/zh_TW: process: localize terminology in submitting-patches.rst
  docs/zh_TW: process: localize terminology in 8.Conclusion.rst
  docs/zh_TW: process: localize terminology in index.rst
  docs/zh_TW: Add a glossary for Traditional Chinese translations

 Documentation/translations/zh_TW/glossary.rst | 145 +++++
 Documentation/translations/zh_TW/index.rst    |   5 +-
 .../translations/zh_TW/process/1.Intro.rst    | 211 +++----
 .../translations/zh_TW/process/2.Process.rst  | 304 +++++----
 .../translations/zh_TW/process/5.Posting.rst  | 226 ++++---
 .../zh_TW/process/7.AdvancedTopics.rst        | 103 ++--
 .../zh_TW/process/8.Conclusion.rst            |  51 +-
 .../code-of-conduct-interpretation.rst        | 162 +++--
 .../zh_TW/process/coding-style.rst            | 580 +++++++++---------
 .../zh_TW/process/email-clients.rst           | 184 +++---
 .../process/embargoed-hardware-issues.rst     | 194 +++---
 .../translations/zh_TW/process/howto.rst      | 343 +++++------
 .../translations/zh_TW/process/index.rst      |  99 ++-
 .../zh_TW/process/license-rules.rst           | 200 +++---
 .../zh_TW/process/programming-language.rst    |  94 ++-
 .../zh_TW/process/stable-kernel-rules.rst     | 256 ++++++--
 .../zh_TW/process/submitting-patches.rst      | 503 ++++++++-------
 17 files changed, 2125 insertions(+), 1535 deletions(-)
 create mode 100644 Documentation/translations/zh_TW/glossary.rst

-- 
2.43.0

