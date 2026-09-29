Received: from mail-pj2-f39.google.com (mail-pj2-f39.google.com [74.125.227.167])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 233155208D2
	for <linux-doc@vger.kernel.org>; Tue, 29 Sep 2026 13:11:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.167
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790687513; cv=none; b=ZzRMn+yCHCbNFxN0U43R6PUFnBbS/3B8V5LGQXWOsatxlStR66UrdVGE6oHd09FJUnsbFiWNL0dLwXCAs7T5BQ/OyTSaSO8d00ekQ5l9to2146K1ywtjosoVffoCHELC4p98OWv1LlXBLs7Bfjkqs9ZnJ5d1OaUJoyc7iJV23JE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790687513; c=relaxed/simple;
	bh=R6kFxCZVX72XrWiajw8nRAAiIuYHm0i+6cXR/3YROXE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=BMIWeSA/BHO92t3U36gLjtYl+uvBA1tSxFyUj0ICKgmGC7we/IRRCkqSHkOZ8Ir95yL0GozUybnE8hdY8dR9b+sLsheDtGxsZgZcc7hhYsxu4q6Ix+eRlL7u6gP9DCBVQ75z8CfbBP+I+7+Dth4Fjq39gvcR9x2x6lua7lQ35IM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NuGXzFGr; arc=none smtp.client-ip=74.125.227.167
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NuGXzFGr"
Received: by mail-pj2-f39.google.com with SMTP id 98e67ed59e1d1-3a49902b607so115208a91.1
        for <linux-doc@vger.kernel.org>; Tue, 29 Sep 2026 06:11:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790687510; x=1791292310; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0uGrOClVLUVSeKZG/0dZ4YmywGDt3y47Ha22ocFOhKk=;
        b=NuGXzFGrXco0otUoioz/EvhIQ2hmF6KrJQrD7+BpYWmLcPWGPrhOK6K/c4fCjfYS00
         pMRBa7TOu4eNx7L599jApJdAx3jjHd/+1tvtydWggQQuplm3rOzRQ9Sc+g9tOotaMB5S
         m80KcvuU5m/6fa3jECPoRSqTIuOX2XNvf1xgBP7oq9KeguvP2iiWqsSKQ5bt3vnNFsyw
         oscK0pvxOE2YkYu1DN6VrDh5g7+7KeIQNB9sW4EHMFIInbmWpy0inWlp8EK9jK692+j8
         RwdnIHZC523QkkSlaUeHyu+Po1IVtqdaaw8kU32TfLOPqQBRMbRzZ4anynFKfPQG3GOS
         LshQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790687510; x=1791292310;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0uGrOClVLUVSeKZG/0dZ4YmywGDt3y47Ha22ocFOhKk=;
        b=EvNWC4jPAxv8/2xgSA1RyU8CoCZGzegyVtVXrvzBB8BDv0/JIvynBEsTOIZT54sOPO
         njK7+HWj7Ahd/OY711ZzB0tu/DloOkqRyMZdfAzjPIdfMZbJZeScdbppXdEopbI1U1/Q
         rd+BcoavWdUr9rbEIMv4W2KZQt3YiS3s3g5uVmKll6iLCRbRf3Vn3JFzQyCazjvNMzwt
         U5/s63gcGQSOlZeFglod4fMdrUgk0SKMzdZTJ6t0kLhZeDB71uPoPeaDqVKnHss/9poi
         z0lOs3LwENfrtRSihsttMvdUf8zqOI499B6eCmKUJmRFDdgHp7S81DnRPd6vS44eUKfm
         09Tg==
X-Forwarded-Encrypted: i=1; AKwUvByEWzkWJ9RWk1tkmVNBA/lnXz7yDDxSByRe2tCp2zf9tcdxKKEsI6f0H9EOqn0BAu1S4Hd0rMQtWXM=@vger.kernel.org
X-Gm-Message-State: AFq9FYIN2Xe79zcao6GC4MyX1kQxRLMt3wruhQ8QQWWXoaREZ3RcgWtI
	Ny006j1TX4gdQvsvjw84BJdxfYe6yGwLlhAw/vcBPXmxemtZUDps7Q5Y
X-Gm-Gg: AYBFou1rLQh5jmd3qASDWKVc0+xVa8XnS6T2FE1SGwDitd5J3aV6lkHh/Yp3tkBSMOZ
	PTeaORthT1lZFR8HUnUA8SxgH2upAaPYwwuLsnKslMm6PRzcBXgD7F/GXfvXUJlZJkBpT+KWbUU
	RhmuT8+EWMnqaaM76mdABnTURtQp1zTPzX8mAcGcfSBd2dLyUWfIXPT2USPwNhXIFJwtCxI/HlG
	V3D0R3PAhvUhCbr+/VSbClyU8aaikQXWByvO+X/wMmS0YcUyfJd1Igkn8Y1pH3pm24c/yUmIbGd
	XfkFRd1fhKit5bZuSkYwV0DYQ/m5HedEvOE3BARbIXeW/BjhPGHta5m5I0ko/XvL200AilU2Pzg
	dS/5DIOvRwijME9ONDv8Yi1c7ibGldu+adQPFeZ4lIktwlNJu7m4TDC7bWFq6M3mzqC+fZlPMJC
	rMAfbjmwdI5quBSdYzLvZ9n7CyeuhtOJwoeUKRd8Mjzcq71E1E8dGG7pKGkpP4Ht7OrWKI9ELne
	z8h5BpfVF0e40dW3jrpJTZkm5k/mqFGVUm2pGUsJw/xABqkyuMNb29d4w==
X-Received: by 2002:a17:90a:da8d:b0:3a4:9fcd:6189 with SMTP id 98e67ed59e1d1-3a49fcd6271mr2463240a91.2.1790687510139;
        Tue, 29 Sep 2026 06:11:50 -0700 (PDT)
Received: from chenyou.. ([140.116.39.229])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a4985fed22sm5582137a91.9.2026.09.29.06.11.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 06:11:49 -0700 (PDT)
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
Subject: [PATCH 0/3] docs/zh_TW: mark translations that are not kept in sync
Date: Tue, 29 Sep 2026 21:11:37 +0800
Message-ID: <20260929131142.266819-1-chenyou910331@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

As agreed in the zh_TW scope discussion [1], process/ is the part of
zh_TW that is kept current; everything else now says in the file
itself that nobody keeps it in sync, and points readers at the English
original.  The rule is per file: the two documents that moved into
process/ with the relocation series are marked until someone updates
them.

  1/3 adds the notice and applies it to those two files
  2/3 applies it to the other 58 translations (one line each)
  3/3 links filesystems/ and cpu-freq/, which nothing linked before, via
      a translated subsystem-apis.rst, as the English tree does

The notice deliberately has no :orphan: marker: included after
disclaimer-zh_TW.rst, a second one renders as an empty "orphan" field.
(Two existing pages already show that field, because something precedes
the disclaimer include: a stray byte-order mark in
process/kernel-enforcement-statement.rst and a highlight directive in
gdb-kernel-debugging.rst.  Not fixed here.)

One consequence worth knowing: checktransupdate.py reads the "update to
commit" line of a translation's latest commit only, so any tree-wide
patch like 2/3 makes it report every touched file as current.  The
contact-block cleanup already had that effect on most of the tree.
Fixing it belongs in the tool, not in the translations.

This applies on top of the relocation series sent alongside it,
"[PATCH 0/4] docs/zh_TW: relocate translations to follow the English
layout".

[1] https://lore.kernel.org/linux-doc/CAKspUhJAbCWoxgh2eq8R5g_MiNK=oXgKPUWqGOpHh0w1-Fv74A@mail.gmail.com/

Chen-Yu Yeh (3):
  docs/zh_TW: add a notice for translations not kept in sync
  docs/zh_TW: mark translations outside the maintained set
  docs/zh_TW: link filesystems/ and cpu-freq/ from the index

 .../translations/zh_TW/admin-guide/README.rst |  1 +
 .../zh_TW/admin-guide/bootconfig.rst          |  1 +
 .../zh_TW/admin-guide/bug-bisect.rst          |  1 +
 .../zh_TW/admin-guide/bug-hunting.rst         |  1 +
 .../zh_TW/admin-guide/clearing-warn-once.rst  |  1 +
 .../zh_TW/admin-guide/cpu-load.rst            |  1 +
 .../zh_TW/admin-guide/cputopology.rst         |  1 +
 .../translations/zh_TW/admin-guide/index.rst  |  1 +
 .../translations/zh_TW/admin-guide/init.rst   |  1 +
 .../zh_TW/admin-guide/lockup-watchdogs.rst    |  1 +
 .../zh_TW/admin-guide/mm/damon/index.rst      |  1 +
 .../zh_TW/admin-guide/mm/damon/lru_sort.rst   |  1 +
 .../zh_TW/admin-guide/mm/damon/reclaim.rst    |  1 +
 .../zh_TW/admin-guide/mm/damon/start.rst      |  1 +
 .../zh_TW/admin-guide/mm/damon/usage.rst      |  1 +
 .../zh_TW/admin-guide/mm/index.rst            |  1 +
 .../translations/zh_TW/admin-guide/mm/ksm.rst |  1 +
 .../zh_TW/admin-guide/reporting-issues.rst    |  1 +
 .../admin-guide/reporting-regressions.rst     |  1 +
 .../translations/zh_TW/admin-guide/sysrq.rst  |  1 +
 .../zh_TW/admin-guide/tainted-kernels.rst     |  1 +
 .../zh_TW/admin-guide/unicode.rst             |  1 +
 .../translations/zh_TW/arch/arm64/amu.rst     |  1 +
 .../zh_TW/arch/arm64/elf_hwcaps.rst           |  1 +
 .../zh_TW/arch/arm64/hugetlbpage.rst          |  1 +
 .../translations/zh_TW/arch/arm64/index.rst   |  1 +
 .../translations/zh_TW/arch/arm64/perf.rst    |  1 +
 .../translations/zh_TW/arch/index.rst         |  2 +
 .../zh_TW/arch/loongarch/booting.rst          |  1 +
 .../zh_TW/arch/loongarch/features.rst         |  1 +
 .../zh_TW/arch/loongarch/index.rst            |  1 +
 .../zh_TW/arch/loongarch/introduction.rst     |  1 +
 .../zh_TW/arch/loongarch/irq-chip-model.rst   |  1 +
 .../translations/zh_TW/arch/mips/booting.rst  |  1 +
 .../translations/zh_TW/arch/mips/features.rst |  1 +
 .../translations/zh_TW/arch/mips/index.rst    |  1 +
 .../zh_TW/arch/mips/ingenic-tcu.rst           |  1 +
 .../zh_TW/arch/openrisc/index.rst             |  1 +
 .../zh_TW/arch/openrisc/openrisc_port.rst     |  1 +
 .../translations/zh_TW/arch/openrisc/todo.rst |  1 +
 .../zh_TW/arch/parisc/debugging.rst           |  1 +
 .../translations/zh_TW/arch/parisc/index.rst  |  1 +
 .../zh_TW/arch/parisc/registers.rst           |  1 +
 .../translations/zh_TW/cpu-freq/core.rst      |  1 +
 .../zh_TW/cpu-freq/cpu-drivers.rst            |  1 +
 .../zh_TW/cpu-freq/cpufreq-stats.rst          |  1 +
 .../translations/zh_TW/cpu-freq/index.rst     |  1 +
 .../translations/zh_TW/dev-tools/gcov.rst     |  1 +
 .../translations/zh_TW/dev-tools/index.rst    |  1 +
 .../translations/zh_TW/dev-tools/kasan.rst    |  1 +
 .../translations/zh_TW/dev-tools/sparse.rst   |  4 +-
 .../zh_TW/dev-tools/testing-overview.rst      |  1 +
 .../zh_TW/filesystems/debugfs.rst             |  1 +
 .../translations/zh_TW/filesystems/index.rst  |  1 +
 .../translations/zh_TW/filesystems/tmpfs.rst  |  1 +
 .../zh_TW/filesystems/virtiofs.rst            |  1 +
 Documentation/translations/zh_TW/index.rst    |  6 +-
 .../debugging/gdb-kernel-debugging.rst        |  1 +
 .../zh_TW/process/security-bugs.rst           |  1 +
 .../translations/zh_TW/staging/index.rst      |  1 +
 .../zh_TW/staging/magic-number.rst            |  1 +
 .../translations/zh_TW/subsystem-apis.rst     | 99 +++++++++++++++++++
 .../translations/zh_TW/unmaintained-zh_TW.rst |  6 ++
 63 files changed, 173 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/translations/zh_TW/subsystem-apis.rst
 create mode 100644 Documentation/translations/zh_TW/unmaintained-zh_TW.rst

-- 
2.43.0

