Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AF0C386575
	for <linux-doc@vger.kernel.org>; Tue, 28 Jul 2026 09:10:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785229850; cv=none; b=KLu13SPdxLesOoGnOkupL9EmJzbwgBu2XlRF47UmQZJ7xG26qnh80tS76FI5qDkpMp2JvAa1i1EPSvqgd1Btix13pLaba+l3o9Oi0DptTgJhfsebV7HaPNYvStcR7lLbA4Xt6JM0a9SVG8D9yhFu6cHJUy+8KFAe04E41OnDZkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785229850; c=relaxed/simple;
	bh=NAqcqB5/d67yN33EShGirNBEA2tWgyEuTF6TiFFYP1Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Jse2NJ3T/urlL+K7rqqEPhRtshPd2h9hUbEmfyBz0TNsLQCYOM5ztRINsFuCvUQoOVayoskHoOMCe8zGbyZWy+pV4RmLXnfr0i/F3/+ycd03+RiOXjNMAU8RYeszbr5Taj5JxTkIX5exuBklY+7/oxHwonRPKulzI6lOq8Bf3is=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=okJlfZmk; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="okJlfZmk"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-ca957338f14so444860a12.1
        for <linux-doc@vger.kernel.org>; Tue, 28 Jul 2026 02:10:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785229848; x=1785834648; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wQRx4HxdfjM7PaGSl6ntLjzoCoZmgZxKBDY28E15k/8=;
        b=okJlfZmk6xNPovpxGi1a72xoaJzu7T+CurJ9f77quC8fiIc3tRW26kOT6vyGEWca2G
         Bukudin+aGT7Pr96hD+izcskthUzLAzacStZKq2DNMDrHRD0n/ylM7oOoPdbT9psGB9E
         Y1RhbzBbJtaJ4U6/cqgscZoAxt2adX+tTrPi2HaR7KSfssGJJ8Cab4KCsEiXB0Gptq76
         9H/bAmqv/oSzZthUW21WXqUHXRT61xKOKJOc38NFhi8nxXDJ5cWbcexHqZmM6MSfrTvC
         UGuTOJl5eNxTDUCVcmjeJJbKLGFOAaxjtaWtRGVEWsrKVppJq4zP9EAlz4vtBjt0RBgm
         i3LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785229848; x=1785834648;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wQRx4HxdfjM7PaGSl6ntLjzoCoZmgZxKBDY28E15k/8=;
        b=OwRI/MloqgmQocKLuQ7A27z65EXqZLC2RpzfJnv3wH5crhsMuKXJtVRnH0+FS/15cb
         MFoMoZpOxj+Cv1wNgl+9X/709qJQwhYbJ/dmKcTTa4UMkoIf0hALSh60BS99279Egomn
         SfmGwNSacdGPG4jqxOt/zORbSSxO0/5CE5ESBj2TMawy2m7uBuE6vN7LhU1G6n9OQMGH
         X2hXeX6g3cziXookC/FynO0v0fSgjPkt8w9RlRqBCoSbZLDdOxOZ94vxxfZcOP/JByde
         KRz4GxITGTuhWn+64MfTE9Zup47YJBfMg1dQHBRa6wHrVXmsbWvueVdVJc/0exHhOQoq
         wTqw==
X-Forwarded-Encrypted: i=1; AHgh+RokGVUKXI99QnSekQNIQHC6oJKo6VOCYJb0YEmQ4b+6GO9tGotkL09TbKSRdpjBjijPdeveP0F/m5U=@vger.kernel.org
X-Gm-Message-State: AOJu0YzqRYr4MyweYpTU2jVKw3OPA54K8oVsNj/CSkAGPYxXV98cpyXe
	IeovxeUk3FwcKXckJA2q3z5BeR1vmibLQSZ8xFXulCqn93pZSZvwT2Lh
X-Gm-Gg: AR+sD13XKM2Bg78UFcyqWC/vmYebd7ejwLIGIqeoMFo4oF3ro1wgPYpbgwn2pW2YsYk
	97xUFRbsNlGasM3HorAXRQ4tVXZJpR9Z7cgX20bk01GlhrbG1QsSuc6RilCEw1/FArS5AzxqiyZ
	lKddPNoVGApCHxWjqJcVOOhHlbOqJqeP0leuxUme8WslSxcUdZvQlICEaaPXMTgcKXAtXbMSZ/x
	QFg4Jjipo8wvOcl7vYXoH63y7Z0HKa1yJ+EW4S5OkTELkZ0n603j6FHtcUzbyB3X8aNvRVeY9/D
	poU6swnEJnWp4e8diOQIPf1ymCU0MXFdKuNihIbl4c3Wiz4k/CjmDXi//U/F9Ck1tuin81+Oi6X
	O+BxXXMrMP8NR63zffmZkG7EA8Mu7pAjGfn/eW5S9Y20e2IF1S9YSOFoNSrOulhXfIIjS6VpuJ8
	NEugwmBUAxKOHDpZSMr8FvzsPCUOqSD7WdvcCwBG27s5kKwXTGHvRuiSEYeUW9z/75GH6Fbdfkt
	msIJcSOU6MbLy24ajP1HwB/oAI1wxNWLB3Gm9lc4FTTBhMLeoI=
X-Received: by 2002:a05:6a00:a456:b0:84e:227f:8011 with SMTP id d2e1a72fcca58-84e93323656mr803463b3a.4.1785229848381;
        Tue, 28 Jul 2026 02:10:48 -0700 (PDT)
Received: from chenyou.R15NEW (112-104-169-66.adsl.dynamic.seed.net.tw. [112.104.169.66])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e5328180dsm4099303b3a.23.2026.07.28.02.10.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 02:10:47 -0700 (PDT)
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
Subject: [PATCH v2 00/16] docs/zh_TW: localize terminology and sync process/ documents
Date: Tue, 28 Jul 2026 17:10:22 +0800
Message-ID: <20260728091038.171033-1-chenyou910331@gmail.com>
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


Changes since v1:
  - Collected the review tags given on v1: Weijie Yuan reviewed
    1.Intro, programming-language, coding-style, 5.Posting and
    8.Conclusion, and acked index and glossary.
  - Folded every "update to commit" line to <=72 columns (the no-wrap
    rule only applies to machine-parsed Fixes: tags; checktransupdate.py
    only greps the hash, so folding the title is safe).
  - Reflowed paragraphs that ran over the line width after localization,
    and kept the word 補丁 from splitting across a line break.
  - Wording/terminology fixes: 7.AdvancedTopics 免費->自由 (free as in
    freedom); howto restored the published book titles, fixed a 歡迎
    typo, and 存取->造訪 for "visit a website"; 2.Process
    LinusTorvalds->Linus Torvalds and staging spacing;
    embargoed-hardware-issues 行程->流程 and 早期取得->提前取得;
    8.Conclusion updated the stale LWN URLs.
  - Fixed "Greg Kroah Hartman" -> "Greg Kroah-Hartman" (the English
    originals hyphenate it).  Weijie spotted this in 2.Process; the same
    error was inherited in embargoed-hardware-issues and 8.Conclusion,
    so all three are fixed.
  - glossary: added entries for access vs visit (存取/造訪), mailing
    list (郵件列表), the -stable convention, and a note recording that
    the rendering of "Fellow" (currently 院士) is still under
    discussion.

  8.Conclusion additionally carries a Reviewed-by from an earlier
  standalone review; see the note under --- in that patch.

Note on 06/16: programming-language.rst is the one file where two
relevant English commits (47cb33cedf47 and 9fa7153c31a3) came through
different trees and were only joined by a merge, so neither alone
works as a baseline for checktransupdate.py. I used the merge commit,
which is what the script itself treats as the file's latest commit,
and named the substantive commit in the changelog body instead. Happy
to switch if there is an established convention for this case.

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

 Documentation/translations/zh_TW/glossary.rst | 162 +++++
 Documentation/translations/zh_TW/index.rst    |   5 +-
 .../translations/zh_TW/process/1.Intro.rst    | 235 +++----
 .../translations/zh_TW/process/2.Process.rst  | 325 +++++----
 .../translations/zh_TW/process/5.Posting.rst  | 235 ++++---
 .../zh_TW/process/7.AdvancedTopics.rst        | 110 ++--
 .../zh_TW/process/8.Conclusion.rst            |  58 +-
 .../code-of-conduct-interpretation.rst        | 162 +++--
 .../zh_TW/process/coding-style.rst            | 614 +++++++++---------
 .../zh_TW/process/email-clients.rst           | 185 +++---
 .../process/embargoed-hardware-issues.rst     | 209 +++---
 .../translations/zh_TW/process/howto.rst      | 344 +++++-----
 .../translations/zh_TW/process/index.rst      |  99 ++-
 .../zh_TW/process/license-rules.rst           | 203 +++---
 .../zh_TW/process/programming-language.rst    |  98 ++-
 .../zh_TW/process/stable-kernel-rules.rst     | 256 ++++++--
 .../zh_TW/process/submitting-patches.rst      | 556 +++++++++-------
 17 files changed, 2245 insertions(+), 1611 deletions(-)
 create mode 100644 Documentation/translations/zh_TW/glossary.rst

-- 
2.43.0

