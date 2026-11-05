Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793842712;
	b=UpXvBN1M4b2sLdZUruGpPljVCuhiiSicBPjBjuYLoXPAzkF7jbHiVs86JJvupH8QkUBR
	 EJZASMDD6rtlzcYSgpZ0pk+7Dsmbv8uO1bh4rlCJ7cxAPJAgtOh/22WFDK9Sl/0j0Nr34
	 jjoM6OnFTIUD8mXnOY5KjwB1OGbh5ObNvekWi+6Ey8uu73WijvrrUSDJaSyM2/7j96f8p
	 C4A6ThYoqJxLjus8EqgC+CavHHHVrLSqpQJrvtjxJ5i+kFI2KOio9ISHxaB9X/X3r1Uoa
	 pHU1cdQ7Ml51SE1hk4gaFKVAX3jxadCLiYorqOERTFZv2TXlewvbzxG76tinr915ksw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793842712;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=DUEA+9h66ghDornvXCd/DpQs6mkffmNPjamgH4lIwY4=;
	b=boPJpe7wpBFe3f0XVRKlDyg0iG9gXgKfdLUJLyGOEOdnf9CPvETsSp6Hez/6z8c2Z6Jr
	 d/2HykfNBMNS6RjWu/pqS3lX1Zay6SL6opZiySg/IZhSXWEAp82n0G8WJ6vMclTL6e/kH
	 XABOcJ+i3tY8fnCqLv51TlzmK3u8RiDnXWQVRMHMxDfmtI7LOuFk5r77EsfNVolTnPDWs
	 8Z891c6r66DiGLTguEGnJ9VkjSQSbhj8YpUXgtmoEK/YnH0n+mqJIfizD5OeROAsxrZwN
	 l5O56MubFtnsZVOqFLVlHqfkOE26Fo4At9lt2mbNjozMFO74BeBte1UWObxcpccvqMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yiJuzisU;
	arc=none smtp.remote-ip=209.85.216.47
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C348606A31B
	for <linux-doc@vger.kernel.org>; Thu,  5 Nov 2026 01:38:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5C348606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yiJuzisU
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3ac7842c17dso938853a91.3
        for <linux-doc@vger.kernel.org>; Wed, 04 Nov 2026 17:38:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793842711; x=1794447511; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=DUEA+9h66ghDornvXCd/DpQs6mkffmNPjamgH4lIwY4=;
        b=yiJuzisUIMv9uvdqEBcv9RlsRpaCullP0dn98o9XVizIlIhRhtQHC+RSQBldn8KvUU
         zDOGaWvi7zbak+nGNnjE3OTRjjWeXVetdIrw46657KMLreVuS983MJKO3RGFndyCoCqd
         8INE5RpRQfs4Z4UKr40KUqlTW/bz4aA6y349bQuKQXVD2gDuFTLZIvL+++ufyLDjI+an
         2hff+7NzZCvWgVIOSDxpq62pnb2wN2dK7eeFRWceIe0RStJ7JwHioO4NLomnSlaRal2+
         BiW4KjnUb0iELlb9mP94B3YzQhPAssj/bgrXzOo8MMM1yoNO99hf+4mESyOVo7oTvDYF
         S9Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793842711; x=1794447511;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DUEA+9h66ghDornvXCd/DpQs6mkffmNPjamgH4lIwY4=;
        b=OxZc8CZdYUDVDnWWFEQgW1x1WN2G++vN8O8+cYzNLF1Jplex7/f24HabTpcSx/sael
         zGDDLeCarksGT8U5KBd4rivzE02Qwy8DziIwp1gT9/kIuX2q6gfNTlY4ZFGhaeKUqd03
         o++8TJGgrn7/Z5qdW8i5p+uttYRpwUNq7wSlJuciOLpOfYpiFKGdvyyWec4MxAIkab+b
         HlRAJ3cP8tbhlWlrs0A2Aq0JLsTx2z4c0cSKoVCotii0cOVdlrglCCJSyN48iUW7zs5b
         T/IysZnmt8iUw25gFmKOji1scvIblSHYK/ry0UH/ePEVjCyk4xZ7XPkAR5sh4KOE9aLV
         ZGtA==
X-Gm-Message-State: APuU4Z+LcpyIdf2zZ6ahqLzkHbowLtL/5lW7bGvAQ7y9kKcJrkpSp1Cx
	++nvcnxY1oycZdyADgYqrUzMvxAHE8OMl6C6I9fkTfnpjkU42Q3eHHy3
X-Gm-Gg: AYBFou11Vo/l88lUJ6byiQC6vDzZWKMPsl6WdbLiYJGgXGhFOqkV3EqT7ynz0YQt22h
	4F6F+xnzCSKW5Ek57d/wQkhVVxpd++MRFZUJCq4v7fZJlHJ7DOI4dFyIt5yX54sREOmU5SAM20K
	7+jRYDas9mjFkt2jq8MvwmWg0dfnNKtMcac2BeMLBivOFO6gGNc1BL8jmeRnxK5apje4Stq6uG1
	rs6E9rfOCwVpQwTl9+Do4K1rvmkvNSGubtYCsB6S54AMMQlYxm1Q//p2QcSTuHnXntKW9Exjrpp
	Su03m8Ejas/K233yBfqDd95qcbsbc9LkMA8572Nbe1Tj4ICqQlm3kclTaq3y/VoUKs5WRwkZRDY
	rOfGjC+GhG3jxzrfi1amDWSHPgG+BwN7EF9YN+EJ6xq/ww3lrXEKMIItqTOyHj6+jQjWeRGTdp6
	LDlmsQbWhcRVpmoX5a2eLg6Vp5p3OX9YOGhyTRRRLQe9nT8rTwLJHW9alblv9ZRKnbo9lYbFPfr
	bJ9UnFM3Yvt8zrMoEfKCr6iH/8LNysqWwJ4vnhDwqhG8V6M5rJsrMgMu5+xhUNF9xFFYYC8Fb4e
	PNHpxtg5/9fDx1Okwt+vjZ5K4ToNnpzVpgho
X-Received: by 2002:a17:90a:eb03:b0:3b0:92b2:2e74 with SMTP id 98e67ed59e1d1-3b092b2333dmr2690547a91.62.1793842710498;
        Wed, 04 Nov 2026 17:38:30 -0800 (PST)
Received: from penguin.lxd ([67.223.127.112])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b31d2b5esm1164975a91.15.2026.11.04.17.38.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 17:38:29 -0800 (PST)
From: Matthew Weber <matthew.l.weber@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org,
	Shuah Khan <skhan@linuxfoundation.org>,
	Thorsten Leemhuis <linux@leemhuis.info>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>,
	linux-kbuild@vger.kernel.org,
	Dmitry Vyukov <dvyukov@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	kasan-dev@googlegroups.com,
	Matthew Weber <matthew.l.weber@gmail.com>
Subject: [PATCH v2 0/4] Documentation: Add kernel minimization guide
Date: Wed,  4 Nov 2026 19:38:19 -0600
Message-Id: <20261105013823.29741-1-matthew.l.weber@gmail.com>
X-Mailer: git-send-email 2.39.5
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi all,

This series adds documentation and a script for measuring source lines of
code (SLOC) in kernel builds, supporting developers and system integrators
who need to trim a Linux kernel.

The Workload analysis section of the admin-guide already describes tracing
a workload. This series builds on that guidance with a worked example of
using workload observations to inform kernel minimization and measure the
resulting configuration. The guide is intended for developers working on
embedded and safety-critical use cases, including work related to ELISA.

The series builds on the ELISA Aerospace Working Group's ongoing
minimization discussions and iterations in
https://github.com/elisa-tech/wg-aerospace/pull/257. That effort explores a
generic, newcomer-oriented workflow for tracing a workload, iterating on a
kernel configuration, measuring kernel metrics, and understanding userspace
metrics. The ELISA documentation aims to present a complete containerized
workflow, with analysis steps to guide users through successive iterations.
This series contributes reusable, general-purpose kernel documentation and
tooling upstream to support that broader process. Clear upstream guidance can
also give AI-assisted tools reliable steering context as they help users
iterate on kernel configurations. One likely early application is producing
minimized release configurations for Space Grade Linux.

Rendered drafts are available online:

  Kernel minimization:
  https://matthew-l-weber.github.io/linux/admin-guide/kernel-minimization.html

  Workload tracing:
  https://matthew-l-weber.github.io/linux/admin-guide/workload-tracing.html

The series and its review discussion are in PR #1:
https://github.com/matthew-l-weber/linux/pull/1

The patches are:

  1/4 Documentation: kcov: clarify coverage example
      Clarify that the saved count bounds the printed entries while KCOV
      remains enabled until the disable ioctl. Document the relevant
      config requirements and PC symbolization.

  2/4 scripts: Add kernel-sloc helper script
      Add a helper to count source lines from compile_commands.json or
      estimate distinct source lines represented in a vmlinux DWARF line
      table.

  3/4 Documentation: admin-guide: Update workload tracing guide
      Expand workload tracing guidance with ftrace function-graph
      tracing, syscall tracing under QEMU with the GDB stub, and mapping
      observations to kernel configuration symbols. Add the Workload
      analysis MAINTAINERS entry.

  4/4 Documentation: admin-guide: Add kernel minimization guide
      Add the guide to the Workload analysis section, cross-reference it
      from the workload tracing guide, and add its MAINTAINERS coverage.

Tool-use disclosure: I used GitHub Copilot CLI while preparing this series.
It helped revise the KCOV example, edit parts of the documentation, add
MAINTAINERS entries, and integrate error-handling revisions to kernel-sloc.
I reviewed the changes and take responsibility for the series.

I checked kernel-sloc syntax and help output, and ran
checkpatch.pl --strict on all four patches in the new order. The GitHub
Actions htmldocs build completed successfully with no warnings from the
changed files; the published documentation is available at
https://matthew-l-weber.github.io/linux/admin-guide/index.html#workload-analysis.
I did not run make htmldocs locally.

Changes in v2:
  - Reorder the series so the workload tracing update precedes the kernel
    minimization guide. The guide refers to the "Tracing a minimal user
    space" and "Mapping observations to configuration" sections added by
    the tracing update, so those sections now exist before they are
    referenced (reported by Sashiko).
  - Move the cross-references from the workload tracing guide to the
    kernel minimization guide into the minimization patch, so no patch
    refers to a document added later in the series.
  - Create the Workload analysis MAINTAINERS entry in the tracing patch and
    extend it with kernel-minimization.rst in the minimization patch.
  - No other content changes.

Any feedback is appreciated.

Thanks,
Matthew

Matthew Weber (4):
  Documentation: kcov: clarify coverage example
  scripts: Add kernel-sloc helper script
  Documentation: admin-guide: Update workload tracing guide
  Documentation: admin-guide: Add kernel minimization guide

 Documentation/admin-guide/index.rst           |   1 +
 .../admin-guide/kernel-minimization.rst       | 413 ++++++++++++++++++
 .../quickly-build-trimmed-linux.rst           |   4 +
 .../admin-guide/workload-tracing.rst          | 139 +++++-
 Documentation/dev-tools/kcov.rst              |  44 +-
 MAINTAINERS                                   |  13 +
 scripts/kernel-sloc                           | 299 +++++++++++++
 7 files changed, 903 insertions(+), 10 deletions(-)
 create mode 100644 Documentation/admin-guide/kernel-minimization.rst
 create mode 100755 scripts/kernel-sloc


base-commit: a592a36e49372172d7c7551ec19ed18184c935e1
-- 
2.39.5

