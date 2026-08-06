Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8688486BAB
	for <linux-doc@vger.kernel.org>; Thu,  6 Aug 2026 18:20:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786040403; cv=none; b=H/vkwbq94ZRf4WZnwZC9WiCmnupiO5sgeHOubjojCmFDRQml/K9XGxdnxZ6herqIhKob4uRCSLXS81+6bxtcrtWjqSCwBMpKXNEjPPzZYiwKD94VP8A2LmFOC8GThw/CphOtPUBfpFvNtUkhugX5lTu+zyj3Dy59jqzO4sfdiRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786040403; c=relaxed/simple;
	bh=f6GKu9WS6V3yO05WgjoDyY7SLjM+EN0x2Lpe1MyOu9s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=FFQddvPyJLU/CgWjeS/MR3+LaKSTWrAaW3qOjk2/4qIiJ8/JSBSP7MW50O5r32WlwvU5vfzYcCpK4z6IwMN/Zpeox8+4xdEHt+FKVEzd4CHpCtPBGX3JeKqA9bifDs9+EYd14S+N7FX7bY0fCwtPQjsrPSS1EaUGpWeeG6bCIT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pjEZ7Wva; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pjEZ7Wva"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3856d4015e0so281907a91.2
        for <linux-doc@vger.kernel.org>; Thu, 06 Aug 2026 11:20:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786040401; x=1786645201; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/IoGtrLKJqilcY6YKJ96aiWWZYZIJnGrQNKKKHA3Gp8=;
        b=pjEZ7WvaH51YbG07C4gL1TQlsG778bgG8wrs6yzq2+DsITbv5I6bn0jnEdkKE08Csp
         PLN8hTrUNQio6ap35YxXMfjMWpCp3b+0ldcPvWjGzkbYZeYAPx2yHxFCB7vtF6F0WMEK
         QbNG5W+8Kr/biMErz+Q2Xi39kXkmjzuDqQR2dlBq2JoJMhy8CQtDpq0yb7JGe2uK+NLO
         gHiIT5l+ZJEd+S43RgmnGtoJHveoyY9FX11Z5E1Us2eUia5Gnvukqy/4dslBK9cQiVHk
         /7EYCjKEfPRQvme/18n3mpuwebm5Mg6Mv0Ow73KZzHtGwS22s6rUzj4TTn8mwUsOnemH
         xhxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786040401; x=1786645201;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/IoGtrLKJqilcY6YKJ96aiWWZYZIJnGrQNKKKHA3Gp8=;
        b=d/BbQ8GI/btaI+IeTmZmsXZFsJ8VcqDoO6QahdXvGob0BOScjwujkW2N6bAk9O+2u3
         CZLttAM565dOHCiFJ/+k63fEw4IQourSwXJ18bwY3teQGPaIfIMIvP9N9SksQmZGSSBJ
         dX1Hiu+uFBMNiAMMgF4lj9AWfsw69jjJeTF04DLoERznkHUCURatNWj8hdBpRqSBDTJU
         vT/by1hdsBmGyYZBB0uVYftTjbsTdX9gbyKb3UjXmkOBmq5637Y4p0Hi6rQ6PTvLAE2t
         wz2YxfKyNWybzR8WvX3GcwmDEueuWJFdx7QNlXDSHW3rGTvXTHn3SQlBOXjDcP42LJot
         WwKA==
X-Forwarded-Encrypted: i=1; AHgh+RpwWuFnVeHAiN7BhK6IaWu/j/wTXpNwCFQS7SbwfVHgYdQEtPgRJD9xKZbUZ+K2E+eU3jt9YBbhmNQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxsFFq8qAL6S0OznTdMbMwh+vYNx6DUfDMAv4wA736PkD1xpqHC
	6G8WIEcmy/pRwWDvKt74S3i6qBlwWy++XGBlNsLeUDZhyr9j8WmDpCAq
X-Gm-Gg: AR+sD10DIOM8ZQFaXpSawKp2cCC1kfWcGk8kWTguSOLC14DId9YyM+3Cq+QCQ6KUCqu
	0qW4sfER6i5rnbV/7UGmTtywFv+pqP4oNxyF7MA5phrHTay5dG3+aWVsFoN2Z1vy3wtRJxQAbum
	QuCwrVhzrO7G46K/Mej1dUWfocSMf7HjtUtFAA+31S54DhY5tF6g6XiuisrioBydZWK2WT5BjG2
	ZNGhJeVVOAxHUETmUCv6/b5ajpzNh+1cC4SwgChkrRv7g3ed8VjIFllpnE9iHwL1mOhr2jnxzPv
	OYz+b+Z6v4UF9nCEmRfew1CjGT60+SZNoN8IuIaeJfLP9YJEA+NKoSIYpSY2DcGorxp4LLkRy24
	a2UYE1TuOSzRiVokEAZXkekS9nSrdpcQpmGr+VqberEtrBOMVQBpEsk3aXDgzavx75YS6qn/mYp
	tuOnsSHWbNH0NKrqlcu2inzATRwB6+i/jCUSRZBNDVFWaz765z8kdNaKfQUZlpBoTpfwFVFiwfs
	iYEbMos1woNFPESqKPJeqyYCsLxh/99kIftXtjh8od/pY1WyXStMhgbXb3f4rBY50AlDAuWrZrK
	SPvG7LvbcGy6j8ruvsHWvn0=
X-Received: by 2002:a17:90b:1848:b0:381:77cd:38ca with SMTP id 98e67ed59e1d1-3903c7395b1mr12630979a91.4.1786040400799;
        Thu, 06 Aug 2026 11:20:00 -0700 (PDT)
Received: from chenyou.R15NEW (112-104-169-66.adsl.dynamic.seed.net.tw. [112.104.169.66])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39085f2b2easm2003356a91.11.2026.08.06.11.19.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 11:20:00 -0700 (PDT)
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
Subject: [PATCH v3 00/16] docs/zh_TW: localize terminology and sync process/ documents
Date: Fri,  7 Aug 2026 02:19:33 +0800
Message-ID: <20260806181949.65648-1-chenyou910331@gmail.com>
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

On tooling: this series was prepared with LLM assistance -- an
assistant drafted the initial localization of each document and the
glossary, and I then reviewed every line by hand, checking each
terminology choice as a native speaker, verifying the "update to
commit" baselines against git log, and building the docs. That review
is where the substantive fixes came from, including the two glossary
corrections below. The patches carry Assisted-by: trailers
accordingly.

Two items are deliberately left for after this series, as noted by
Weijie during review: a legal disclaimer for the DCO translation
(which affects all locales), and the rendering of "Linux Foundation
Fellow".

Changes since v2:
  - Collected review tags; every patch except 2.Process now carries
    Weijie Yuan's Reviewed-by or Acked-by. The tag for 2.Process has
    simply not arrived yet.
  - Added an Assisted-by: trailer to every patch, per
    Documentation/process/coding-assistants.rst.
  - glossary: corrected two entries in the zh_CN reference column
    (建置 -> 构建, 账户 -> 帐户) after checking every term against
    Documentation/translations/zh_CN/ by occurrence count, and added a
    note recording that provenance (Alex Shi).
  - glossary: documented the CJK/ASCII spacing convention.
  - code-of-conduct-interpretation: two wording improvements in the
    "Enforcement for Unacceptable Behavior" section (加以糾正 instead of
    作出彌補, and 對這類報告進行調查並予以處理 instead of 調查並解決
    這些報告) (Weijie Yuan).
  - 2.Process: dropped the space in 維護 staging樹, following the
    CJK/ASCII spacing rule now documented in the glossary. The zh_TW
    tree is 2581 occurrences without a space to 721 with (Weijie Yuan).

Changes since v1:
  - Collected the first review tags from Weijie Yuan.
  - Folded every "update to commit" line to <=72 columns (the no-wrap
    rule only applies to machine-parsed Fixes: tags; checktransupdate.py
    only greps the hash, so folding the title is safe).
  - Reflowed paragraphs that ran over the line width after localization,
    and kept the word 補丁 from splitting across a line break.
  - Wording/terminology fixes: 7.AdvancedTopics 免費->自由 (free as in
    freedom); howto restored the published book titles, fixed a 歡迎
    typo, and 存取->造訪 for "visit a website"; 2.Process
    LinusTorvalds->Linus Torvalds; embargoed-hardware-issues 行程->流程
    and 早期取得->提前取得; 8.Conclusion updated the stale LWN URLs.
  - Fixed "Greg Kroah Hartman" -> "Greg Kroah-Hartman" in 2.Process,
    embargoed-hardware-issues and 8.Conclusion (the English originals
    hyphenate it).
  - glossary: added entries for access vs visit (存取/造訪), mailing list
    (郵件列表), the -stable convention, and a note that the rendering of
    "Fellow" is still under discussion.

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

 Documentation/translations/zh_TW/glossary.rst | 168 +++++
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
 17 files changed, 2251 insertions(+), 1611 deletions(-)
 create mode 100644 Documentation/translations/zh_TW/glossary.rst

對 v2 的範圍差異：
 1:  86145e74b417 !  1:  0b1c9f30ec6a docs/zh_TW: process: localize terminology in 7.AdvancedTopics.rst
    @@ Commit message
         update to commit 5ce70894f6ca ("Doc: correct spelling and wording
         mistakes")
     
    +    Reviewed-by: Weijie Yuan <wy@wyuan.org>
    +    Assisted-by: Claude:claude-opus-5
         Signed-off-by: Chen-Yu Yeh <chenyou910331@gmail.com>
     
      ## Documentation/translations/zh_TW/process/7.AdvancedTopics.rst ##
 2:  a7e8d67386c4 !  2:  cbb74f5f80d4 docs/zh_TW: process: localize terminology in 1.Intro.rst
    @@ Commit message
         mistakes")
     
         Reviewed-by: Weijie Yuan <wy@wyuan.org>
    +    Assisted-by: Claude:claude-opus-5
         Signed-off-by: Chen-Yu Yeh <chenyou910331@gmail.com>
     
      ## Documentation/translations/zh_TW/process/1.Intro.rst ##
 3:  ab1f2e61a013 !  3:  06b80ff9c513 docs/zh_TW: process: localize terminology in code-of-conduct-interpretation.rst
    @@ Commit message
         update to commit 04c4bb90ae6e ("Documentation/CoC: Spell out the TAB
         role in enforcement decisions")
     
    +    Acked-by: Weijie Yuan <wy@wyuan.org>
    +    Assisted-by: Claude:claude-opus-5
         Signed-off-by: Chen-Yu Yeh <chenyou910331@gmail.com>
     
      ## Documentation/translations/zh_TW/process/code-of-conduct-interpretation.rst ##
    @@ Documentation/translations/zh_TW/process/code-of-conduct-interpretation.rst
     +澄清開發過程和行為準則的範圍來解決。
     +
     +不可接受的行為可能在短時間內中斷相互尊重的協作，並對社群的健康造成長期的
    -+負面影響。當個人在違規發生的場合承認自己的行為並作出彌補時，不可接受的行為
    ++負面影響。當個人在違規發生的場合承認自己的行為並加以糾正時，不可接受的行為
     +通常就能得到解決。
     +
     +當不可接受的行為未能透過社群討論解決時，行為準則委員會會收到相關報告。當
    @@ Documentation/translations/zh_TW/process/code-of-conduct-interpretation.rst
     +恢復有成效且相互尊重的協作。
     +
     +行為準則委員會有義務對報告和報告者的資訊保密。報告可能來自受害方，也可能
    -+來自目睹不可接受行為的社群成員。行為準則委員會有責任與所有相關方合作，調查
    -+並解決這些報告。
    ++來自目睹不可接受行為的社群成員。行為準則委員會有責任與所有相關方合作，對這
    ++類報告進行調查並予以處理。
     +
     +行為準則委員會與當事人合作，促使其理解以下事項的重要性：修復其行為對受害方
     +造成的傷害，以及對社群的長期負面影響。
 4:  433467e0d42d !  4:  23eccf9e4329 docs/zh_TW: process: localize terminology in license-rules.rst
    @@ Commit message
         update to commit ebf1bafd0907 ("LICENSES: Explicitly allow
         SPDX-FileCopyrightText")
     
    +    Reviewed-by: Weijie Yuan <wy@wyuan.org>
    +    Assisted-by: Claude:claude-opus-5
         Signed-off-by: Chen-Yu Yeh <chenyou910331@gmail.com>
     
      ## Documentation/translations/zh_TW/process/license-rules.rst ##
 5:  043c305381fa !  5:  d7273d32b601 docs/zh_TW: process: localize terminology in email-clients.rst
    @@ Commit message
         update to commit 4971ca2007e3 ("docs: process: email-client: add
         Thunderbird "Toggle Line Wrap" extension")
     
    +    Reviewed-by: Weijie Yuan <wy@wyuan.org>
    +    Assisted-by: Claude:claude-opus-5
         Signed-off-by: Chen-Yu Yeh <chenyou910331@gmail.com>
     
      ## Documentation/translations/zh_TW/process/email-clients.rst ##
 6:  3c0b05e83bd1 !  6:  64abaab348f5 docs/zh_TW: process: localize terminology in programming-language.rst
    @@ Commit message
          git://git.kernel.org/pub/scm/linux/kernel/git/docs/linux")
     
         Reviewed-by: Weijie Yuan <wy@wyuan.org>
    +    Assisted-by: Claude:claude-opus-5
         Signed-off-by: Chen-Yu Yeh <chenyou910331@gmail.com>
     
      ## Documentation/translations/zh_TW/process/programming-language.rst ##
 7:  8981444a4b97 !  7:  9c52e54cdf4a docs/zh_TW: process: localize terminology in coding-style.rst
    @@ Commit message
         kmalloc_objs example in coding style doc")
     
         Reviewed-by: Weijie Yuan <wy@wyuan.org>
    +    Assisted-by: Claude:claude-opus-5
         Signed-off-by: Chen-Yu Yeh <chenyou910331@gmail.com>
     
      ## Documentation/translations/zh_TW/process/coding-style.rst ##
 8:  6cdeb3a74ab2 !  8:  98bc1d2cd925 docs/zh_TW: process: localize terminology in stable-kernel-rules.rst
    @@ Commit message
         update to commit 10466b17af65 ("docs: stable-kernel-rules: fix typo
         sent->send")
     
    +    Reviewed-by: Weijie Yuan <wy@wyuan.org>
    +    Assisted-by: Claude:claude-opus-5
         Signed-off-by: Chen-Yu Yeh <chenyou910331@gmail.com>
     
      ## Documentation/translations/zh_TW/process/stable-kernel-rules.rst ##
 9:  cb394d7972ca !  9:  6929c040bd0c docs/zh_TW: process: localize terminology in 5.Posting.rst
    @@ Commit message
         testing")
     
         Reviewed-by: Weijie Yuan <wy@wyuan.org>
    +    Assisted-by: Claude:claude-opus-5
         Signed-off-by: Chen-Yu Yeh <chenyou910331@gmail.com>
     
      ## Documentation/translations/zh_TW/process/5.Posting.rst ##
10:  45c1ff334b3c ! 10:  6d6a2939330d docs/zh_TW: process: localize terminology in 2.Process.rst
    @@ Commit message
     
         update to commit 46298375477b ("linux-next: update maintainer info.")
     
    +    Assisted-by: Claude:claude-opus-5
         Signed-off-by: Chen-Yu Yeh <chenyou910331@gmail.com>
     
      ## Documentation/translations/zh_TW/process/2.Process.rst ##
    @@ Documentation/translations/zh_TW/process/2.Process.rst: Next 樹
     -目錄中還應該有一個TODO文件。TODO文件列出了驅動程序需要接受的暫停的工作，
     -以及驅動程序的任何補丁都應該抄送的人員列表。當前的規則要求，staging的驅動
     -程序必須至少正確編譯。
    -+Greg Kroah-Hartman 目前負責維護 staging樹。仍需要修正的驅動程式將發送給他，
    ++Greg Kroah-Hartman 目前負責維護staging樹。仍需要修正的驅動程式將發送給他，
     +每個驅動程式在drivers/staging/中都有自己的子目錄。除了驅動程式原始檔之外，
     +目錄中還應該有一個TODO檔案。TODO檔案列出了驅動程式需要接受的暫停的工作，
     +以及驅動程式的任何補丁都應該抄送的人員列表。當前的規則要求，staging的驅動
11:  3f31ba1537f1 ! 11:  83f29fd898fd docs/zh_TW: process: localize terminology in howto.rst
    @@ Commit message
         update to commit 413e775efaec ("Documentation: fix links to mailing list
         services")
     
    +    Reviewed-by: Weijie Yuan <wy@wyuan.org>
    +    Assisted-by: Claude:claude-opus-5
         Signed-off-by: Chen-Yu Yeh <chenyou910331@gmail.com>
     
      ## Documentation/translations/zh_TW/process/howto.rst ##
12:  53027228f3ae ! 12:  068a55b1cb6d docs/zh_TW: process: localize terminology in embargoed-hardware-issues.rst
    @@ Commit message
     
         update to commit cead34ac1ce1 ("MAINTAINERS: update ndesaulniers")
     
    +    Reviewed-by: Weijie Yuan <wy@wyuan.org>
    +    Assisted-by: Claude:claude-opus-5
         Signed-off-by: Chen-Yu Yeh <chenyou910331@gmail.com>
     
      ## Documentation/translations/zh_TW/process/embargoed-hardware-issues.rst ##
13:  96042d7d0d6d ! 13:  6892bbeca210 docs/zh_TW: process: localize terminology in submitting-patches.rst
    @@ Commit message
         代碼→程式碼, ...) and sync with the English original: subspace.kernel.org
         list info, interleaved-reply etiquette section, reworked Acked-by
         semantics with "# Suffix", tagging-people permission rules, the
    -    Assisted-by: section, canonical patch format subsections with
    +    Assisted-by tag, canonical patch format subsections with
         affiliation format and previous-version links, and the b4 tooling
         section. Cross references now point at zh_TW translations and broken
         zh_-prefixed ref targets are fixed to tw_.
    @@ Commit message
         update to commit 48c3876a6a6f ("docs: submitting-patches: Clarify that
         "reviewer" is a person")
     
    +    Reviewed-by: Weijie Yuan <wy@wyuan.org>
    +    Assisted-by: Claude:claude-opus-5
         Signed-off-by: Chen-Yu Yeh <chenyou910331@gmail.com>
     
      ## Documentation/translations/zh_TW/process/submitting-patches.rst ##
14:  08639614b887 ! 14:  2f9e8c76e5b2 docs/zh_TW: process: localize terminology in 8.Conclusion.rst
    @@ Commit message
     
         Reviewed-by: Dongliang Mu <dzm91@hust.edu.cn>
         Reviewed-by: Weijie Yuan <wy@wyuan.org>
    +    Assisted-by: Claude:claude-opus-5
         Signed-off-by: Chen-Yu Yeh <chenyou910331@gmail.com>
     
      ## Documentation/translations/zh_TW/process/8.Conclusion.rst ##
15:  19f60aa7030c ! 15:  61f97350c6bd docs/zh_TW: process: localize terminology in index.rst
    @@ Commit message
         what is and is not a security bug")
     
         Acked-by: Weijie Yuan <wy@wyuan.org>
    +    Assisted-by: Claude:claude-opus-5
         Signed-off-by: Chen-Yu Yeh <chenyou910331@gmail.com>
     
      ## Documentation/translations/zh_TW/process/index.rst ##
16:  70b566b1579c ! 16:  068c34f11fe9 docs/zh_TW: Add a glossary for Traditional Chinese translations
    @@ Commit message
         process/ documents in this series.
     
         Acked-by: Weijie Yuan <wy@wyuan.org>
    +    Assisted-by: Claude:claude-opus-5
         Signed-off-by: Chen-Yu Yeh <chenyou910331@gmail.com>
     
      ## Documentation/translations/zh_TW/glossary.rst (new) ##
-- 
2.43.0

