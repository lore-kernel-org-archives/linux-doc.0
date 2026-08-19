Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE167425CF7
	for <linux-doc@vger.kernel.org>; Wed, 19 Aug 2026 14:58:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787151512; cv=none; b=f9iVv6QoYQ5aMlHyMp6g0ZwNGf78mTUgaS6IsfNmNYT/2Q33ZMS6F2I5sGEWepj4lu3IF6E6Vh4eBc+ocjXNiyFDO/cXTsdEx2tBiyXZ9AC3ismfGFxFD/USt/e/ConslsQJn9NNL7AywHw3bFZUbcsUMGnLgVqXKJRt7pwizig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787151512; c=relaxed/simple;
	bh=EhPFCCCAOzw+rLhy2SSnid19QfBuTanSX1tqxTYjciY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=JAvIIm/DQ5Do4kM9uAgxL82Req2RzqtlMuFG65q78kdyawgrFKt9CUXbA6seIHugrFXzwMEZeZD9Xd4/2p4lMo62Bxg3y4slwcVv4wFo80+8hovWH4qGrXELeQcYA67sFGneqreogDKbqSkaclHQ7YzF5aCj8lZnwLgKLXb5mrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QhttVQA0; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QhttVQA0"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2d5862bc921so2982475ad.1
        for <linux-doc@vger.kernel.org>; Wed, 19 Aug 2026 07:58:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787151498; x=1787756298; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nCig+oXgmxEM5vDa8SFrPZN53jNkDPVbwMVUQQw586Y=;
        b=QhttVQA08J13fllO4KVJHglmIPUkiMM1Bvoxwvie5DhPc7d7lQqeFwqmK3ybROkGye
         qkjWXrTBGtvfeNvFbQ3cMDtfF5f9v5E2P4WBKz8KHTLCbqTPelpZuVXN3v5hFHWFHH4b
         +P6j8zoSVuL2v1Iq/Nx0Xmqb8/kexnL0YvwHjGSuXV1X91YSJ6roz8mxW+GDt8efnjsl
         kKeNRBOWeOQieRORHxzcTqJ8bE12iVTcpGPdhc4eef54E2swFGAMpY6TBoZHyBrtz5mf
         /03ZhZ0eWNkup6wr4GMhgVsulPlEY0kZYsLkFmQLMqJSAbfknT/ZU6qpuxBVu+eqqqJf
         vTbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787151498; x=1787756298;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nCig+oXgmxEM5vDa8SFrPZN53jNkDPVbwMVUQQw586Y=;
        b=fnyyXxmKi1VbyiSCcded4Vv1rTJh6h3CJEXrUD2n05XLE07J5pvtALs4L3RJY/GM2K
         JPQkAN7qVBDZR8W9cJtQXF/B2zF/Bm6VAo8trJfkjK4G3j3bYdU/fjcGtU3jj/FlyXCx
         d7YIBiS/DaLrNZLXSKaAFV2QKgr+dkSDDwlcifH09IuE7nLDbcwpVt9huBHkZURPIQ1i
         PkiyE47HZCnUi8fBDRaUseyVMD883XLKZSj+nINKupe5MP2qDlmgku2CSmSL/7mRt6rT
         iqSd4iKJIwnv7X6iPED5/BgSqNedDJmh6d2Af6u2EB5nybzEC7b/aAocOFxm8Y8NBmEx
         Z/lA==
X-Forwarded-Encrypted: i=1; AHgh+RqEIBL0qVN4Yq9rBq0gtH4r27NEYjWdR21DrvDjae0pgTXxGpGLV/CWaghV9SYWtuZlARLrrHEqVX0=@vger.kernel.org
X-Gm-Message-State: AFuF++lYhJU5Hcf3ozxI8HfNHPXn6u3kLAbWoqPYP9Bke4Vt1PqZB8VC
	LIRF1icE/VAjLvl07V6s7H/P1j1eYrpFVzvz+xD5dHnDXHg5LGEk7qYk
X-Gm-Gg: AR+sD11BAWPNLMQcHBxsTVN4XpBNPVr6Tn+OQOlQ1jnWNmkiEjAo3rmmvPTCsB4VQtd
	6nMSNJVzenbwsHbll6kpP4eM8f2Ee6KpJNkmw14obm+0TrQnEMb7nWyNaR+blayBENp4vNNS9gQ
	QQ8sbRNUX2bJExlFlNb4+vlpivw/J+OXTBye/Jruic/VPrmOnzi2ONLqtF5VU4M1ArC09SOlUXd
	a8Je3tBnWfkV+rjYulz7bdbqFF89DlNhWuCnvuA6IgLQ7PCM2jBru1LppMHd5J2puH4czeNG0C/
	yCCw3W7r1AaS6oRSwPZ4rIQhOCZrQF+0tPbxfy5YrHPxZYuVysmcvlsckHIC4ZKgSdAFW8vLnsJ
	EnHgXweP8arp0H2SLHnXbNN5tq2iMnsJ9xwM7f/DISDUfa5fQBv216dDHfrlp/fU4T665QF5nbu
	gL2NAIV5g/xxlDWrglX0BWciSRsKreDzZdYColLDoJdSa/YUrnu1vtEOIVgAo5R2qomALmDbcMZ
	8jQ1BOtBASU32H7zQyUXoM6c+NxWBmBgN+MaPtV3CcVzar2
X-Received: by 2002:a17:903:4588:b0:2d3:a50c:5e19 with SMTP id d9443c01a7336-2d5fd704f2fmr47192995ad.1.1787151497567;
        Wed, 19 Aug 2026 07:58:17 -0700 (PDT)
Received: from chenyou.. ([140.116.39.229])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d5c1e528b3sm25429145ad.46.2026.08.19.07.58.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 07:58:16 -0700 (PDT)
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
Subject: [PATCH 0/7] docs/zh_TW: remove duplicated maintainer contact information
Date: Wed, 19 Aug 2026 22:57:59 +0800
Message-ID: <20260819145808.291567-1-chenyou910331@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

MAINTAINERS already records who to contact about the zh_TW
translations, yet every zh_TW file repeats that information in a
per-file contact block.  The duplication has a concrete cost: the
listed zh_TW maintainer address appears in 58 files and there have now
been three separate attempts to rewrite it across the tree.  In the
MAINTAINERS discussion Jon Corbet's conclusion was that, rather than
churning all of those addresses once more, the best thing is simply to
remove them.

There is a second reason.  The zh_TW tree was produced by converting
zh_CN, and the credit blocks came across with the text: nearly every
address removed here also appears in
Documentation/translations/zh_CN/, several in more than a hundred
files.  They credit the simplified-Chinese translation rather than
zh_TW work, so keeping them would leave the wrong attribution in place.

Removed:

  - the :Translator: / :翻譯: / :校譯: / :譯者: credit blocks and the
    譯者:: literal blocks
  - the "please contact the ... maintainer" prose that introduces them
  - the 英文版/中文版/繁體中文版 維護者|翻譯者|校譯者 lines, including
    their continuation lines
  - the maintainer metadata lines in the legacy headers (M:, zh_CN:,
    zh_TW:, Maintainer:, Chinese maintainer:, Traditional Chinese
    maintainer:)

Left alone: :Original:, :作者: (the author of the English original),
:日期:, :更新:, the C: sync-commit references, copyright notices, and
every address that is part of a document body, such as
stable@vger.kernel.org and the examples in submitting-patches.

Attribution for past work is preserved in the git history.

The last patch points disclaimer-zh_TW.rst and index.rst at
MAINTAINERS.  The disclaimer is included by every zh_TW document and
was the one place naming a specific person, so it matters most here;
disclaimer-zh_CN.rst already works this way.

Built with "make SPHINXDIRS=translations htmldocs": no new warnings,
no errors.

This series conflicts with the pending zh_TW process/ series [1], which
adds a translator entry to the same blocks in fifteen of these files.
Please apply that one first; I will respin this on top if it lands in a
different shape.

[1] https://lore.kernel.org/linux-doc/20260806181949.65648-1-chenyou910331@gmail.com/


Chen-Yu Yeh (7):
  docs/zh_TW: process: remove maintainer contact information
  docs/zh_TW: admin-guide: remove maintainer contact information
  docs/zh_TW: arch: remove maintainer contact information
  docs/zh_TW: dev-tools: remove maintainer contact information
  docs/zh_TW: filesystems: remove maintainer contact information
  docs/zh_TW: cpu-freq: remove maintainer contact information
  docs/zh_TW: remove the last maintainer contact references

 Documentation/translations/zh_TW/IRQ.txt        |  8 --------
 .../translations/zh_TW/admin-guide/README.rst   |  5 -----
 .../zh_TW/admin-guide/bootconfig.rst            |  2 --
 .../zh_TW/admin-guide/bug-bisect.rst            |  5 -----
 .../zh_TW/admin-guide/bug-hunting.rst           |  5 -----
 .../zh_TW/admin-guide/clearing-warn-once.rst    |  2 --
 .../translations/zh_TW/admin-guide/cpu-load.rst |  2 --
 .../zh_TW/admin-guide/cputopology.rst           |  4 ----
 .../translations/zh_TW/admin-guide/index.rst    |  2 --
 .../translations/zh_TW/admin-guide/init.rst     |  5 -----
 .../zh_TW/admin-guide/lockup-watchdogs.rst      |  1 -
 .../zh_TW/admin-guide/mm/damon/index.rst        |  6 ------
 .../zh_TW/admin-guide/mm/damon/lru_sort.rst     |  6 ------
 .../zh_TW/admin-guide/mm/damon/reclaim.rst      |  6 ------
 .../zh_TW/admin-guide/mm/damon/start.rst        |  6 ------
 .../zh_TW/admin-guide/mm/damon/usage.rst        |  6 ------
 .../translations/zh_TW/admin-guide/mm/index.rst |  5 -----
 .../translations/zh_TW/admin-guide/mm/ksm.rst   |  5 -----
 .../zh_TW/admin-guide/reporting-issues.rst      |  6 ------
 .../zh_TW/admin-guide/reporting-regressions.rst |  5 -----
 .../zh_TW/admin-guide/security-bugs.rst         |  5 -----
 .../translations/zh_TW/admin-guide/sysrq.rst    |  8 --------
 .../zh_TW/admin-guide/tainted-kernels.rst       |  5 -----
 .../translations/zh_TW/admin-guide/unicode.rst  |  5 -----
 .../translations/zh_TW/arch/arm/Booting         |  7 -------
 .../zh_TW/arch/arm/kernel_user_helpers.txt      | 10 ----------
 .../translations/zh_TW/arch/arm64/amu.rst       |  3 ---
 .../translations/zh_TW/arch/arm64/booting.txt   |  8 --------
 .../zh_TW/arch/arm64/elf_hwcaps.rst             |  3 ---
 .../zh_TW/arch/arm64/hugetlbpage.rst            |  3 ---
 .../translations/zh_TW/arch/arm64/index.rst     |  2 --
 .../zh_TW/arch/arm64/legacy_instructions.txt    | 11 -----------
 .../translations/zh_TW/arch/arm64/memory.txt    |  9 ---------
 .../translations/zh_TW/arch/arm64/perf.rst      |  3 ---
 .../zh_TW/arch/arm64/silicon-errata.txt         |  8 --------
 .../zh_TW/arch/arm64/tagged-pointers.txt        |  9 ---------
 .../zh_TW/arch/loongarch/booting.rst            |  4 ----
 .../zh_TW/arch/loongarch/features.rst           |  1 -
 .../translations/zh_TW/arch/loongarch/index.rst |  1 -
 .../zh_TW/arch/loongarch/introduction.rst       |  1 -
 .../zh_TW/arch/loongarch/irq-chip-model.rst     |  1 -
 .../translations/zh_TW/arch/mips/booting.rst    |  4 ----
 .../translations/zh_TW/arch/mips/features.rst   |  4 ----
 .../translations/zh_TW/arch/mips/index.rst      |  4 ----
 .../zh_TW/arch/mips/ingenic-tcu.rst             |  4 ----
 .../translations/zh_TW/arch/openrisc/index.rst  |  4 ----
 .../zh_TW/arch/openrisc/openrisc_port.rst       |  4 ----
 .../translations/zh_TW/arch/openrisc/todo.rst   |  4 ----
 .../zh_TW/arch/parisc/debugging.rst             |  4 ----
 .../translations/zh_TW/arch/parisc/index.rst    |  4 ----
 .../zh_TW/arch/parisc/registers.rst             |  4 ----
 .../translations/zh_TW/cpu-freq/core.rst        |  8 --------
 .../translations/zh_TW/cpu-freq/cpu-drivers.rst |  8 --------
 .../zh_TW/cpu-freq/cpufreq-stats.rst            |  8 --------
 .../translations/zh_TW/cpu-freq/index.rst       |  4 ----
 .../translations/zh_TW/dev-tools/gcov.rst       |  1 -
 .../zh_TW/dev-tools/gdb-kernel-debugging.rst    |  1 -
 .../translations/zh_TW/dev-tools/index.rst      |  1 -
 .../translations/zh_TW/dev-tools/kasan.rst      |  1 -
 .../translations/zh_TW/dev-tools/sparse.rst     |  5 -----
 .../zh_TW/dev-tools/testing-overview.rst        |  1 -
 .../translations/zh_TW/disclaimer-zh_TW.rst     |  7 ++++---
 .../translations/zh_TW/filesystems/debugfs.rst  | 10 ----------
 .../translations/zh_TW/filesystems/index.rst    |  2 --
 .../translations/zh_TW/filesystems/sysfs.txt    | 10 ----------
 .../translations/zh_TW/filesystems/virtiofs.rst |  8 --------
 Documentation/translations/zh_TW/index.rst      |  2 +-
 .../translations/zh_TW/io_ordering.txt          |  6 ------
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
 95 files changed, 5 insertions(+), 505 deletions(-)

-- 
2.43.0

