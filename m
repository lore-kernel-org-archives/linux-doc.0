Received: from mail-lf2-f12.google.com (mail-lf2-f12.google.com [74.125.229.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACF13380FC5
	for <linux-doc@vger.kernel.org>; Sat,  5 Sep 2026 20:21:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.204
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788639700; cv=pass; b=aDUGPKMYs0uMKZcFtStprwF/K7UP4aTmm+NcnVsGbWePObuicRxbSvobKJnFbczN5wlbvSbqm+uIK7nQL6TYZ59X+eR0lYfbtXj3BH0J6bIEpD/fP7FWs4DDWuh0layqchDXK/b4jLORw+d+/0E9NiyqFIdGOBnniYEBmlc3ZNo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788639700; c=relaxed/simple;
	bh=6AQITRXd6Wp6duEJtujH+2UeLQvmngXloLqvtX7gMAU=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=gdyvovaf14R9GasH6lgyX913slJ4RwzrAZVwvG7qQTZzPVln5OIK+V6sJ+XUVfg+sz+sTc8jloU2co9Sgz9ZLQS8FZtD6FoAEj+wCDG716zbnUVQb54gaTnf2mKyMdjsV/yIqM/qtCcjDmtoBcwB01KYGyEPkhXgnn0d7/QiKiQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m0WqKA2K; arc=pass smtp.client-ip=74.125.229.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m0WqKA2K"
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b4a0b1a4fbso79631e87.3
        for <linux-doc@vger.kernel.org>; Sat, 05 Sep 2026 13:21:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788639697; cv=none;
        d=google.com; s=arc-20260327;
        b=mKDqiytEY2dBaOdC3eiR832z8IzPb/SPcxi+t8WnXzBwmHVszd9Y4xSDsKc/6JRw0/
         FCFYOUWi5hJkryF0vH0kF6glsUZr/Hi9h5yvH0rKgTkByWIudcJD0fCkGAJJ/3HVMfZ4
         R1Ypjytp2tCDsLPU3qJ9sLP5Ly4bhs858iYd6fpNtobhwo8Co7f+giyJVMydH71fq/X+
         T5eTAqHx3Xd/uepD8yu3dA6Ve2IZ9dD7mJH5oie3FQSYH/XQPXcjrw77b5nhhaTsxtto
         nzqdQQZ07GeFtxIAaaExib7vBLjMzasHhDef3GSsUh1pSu08p31ReiWgMyBt/3HcUOFl
         cAdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=BVonS4yok8Cfq5NwlbIfxbsqlSRtOeAsOMKarECMFeg=;
        fh=xcgQviueEq+nyxukPb6XB3FtHNU7nSWEge/p8rLMTwg=;
        b=UDWo7S/zdyYsmh/tYA4aACZS3g2Oi0UC7FvaaK/D4r8lCpKLzrXpqJwDfKR/vnBXSR
         AReGVQtgyIAVL07WiM25kdpyFzKQQaWALGLnibMXOPZyY864oL0zLgTjLRxI+bwzNzU4
         /FdV8zEqjLaW0IrzGZJGMOIPaK/FqyoFBlDFRgeYDyFcRP3VOLkOnHZGmISlAgdXnT5A
         iZaF5Ulv3BD1h4GxBP4S6Zj6KGrxOEz5ElTxzFQyzJhsEkJNVXTepU8lFHvd93D3coDO
         yuFffWpNQH2IGMwFhwZAky+kV9MCoE2lTQA11JZwlupN6uOMYSEcNurghCZq7qxzp79p
         BRaw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788639697; x=1789244497; darn=vger.kernel.org;
        h=content-type:to:subject:message-id:date:from:mime-version:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=BVonS4yok8Cfq5NwlbIfxbsqlSRtOeAsOMKarECMFeg=;
        b=m0WqKA2KL/i7EVfO0snDghjtKbXyaaB6awtdMSfkbuZiAW8n9y/uCaZJmHwFhB7MeZ
         XqS07l1KbSmMsfYCS0CMao4uHz3dJ3LIlDf3JHKyyFuDkofl+rcaFPXXeGabrJdwKBYF
         6YZquHX8S83GMcp+iatY04T9ZsgNJ4sYWzHzEn/VspxW95sGK+2NB5VxAY1JIKhiSVD/
         l09YZEGSFmgmiYYkEw29CDZ700Az3ZQOY519Kv8PxjSqZUR2bR5UdUzMvnGMVsv1SGt6
         7B/lomauWmoH5eP5sGzBAHZSFoJ7/AWW/ocBeuV9hu8Az+3A7V45pomIXz3eK0ollFr6
         kjfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788639697; x=1789244497;
        h=content-type:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BVonS4yok8Cfq5NwlbIfxbsqlSRtOeAsOMKarECMFeg=;
        b=DqPo2GxkHagC3R9YhWFjzuXER3S2ZlgPqleBLCV0eKo7fWJJ2/ARNX2VdatZxe26oB
         jUnPpuf9eixD2XSSxdLHn16YAdwnooRH/6tII6NTgjDvvxeaONrzTFyKOT3lcBfy3dXg
         UlcA0gbL8B7hkKhocchezXrScRE4rAIoDWM77Y2N0EE2XD4ALOz1kUgZ7MfV9BFZQqi1
         wlZppIpJEJyhSNu4NnRiMtD3pFhBdJcy/k4Qk7Pm+hvHjlRdu63INcYDB8LoDg/5p5B1
         K8guTfSbpgMfG8sWo+LUe9AojocJwZIGUyAsy1YQmvi+h/deuxOv6K8cZKEb4IiiQVd2
         0OmA==
X-Forwarded-Encrypted: i=1; AKwUvBwRVAMewqzcUTgrdjLRhc8U8dRUv6jvpbV2fD+ej1sYvfSt+/daef2hPj2nW2PR4OW9ugef6BhnRSA=@vger.kernel.org
X-Gm-Message-State: AFuF++nIDZLc8KLPYPHnyo9RnPo8nxJv9mPx0aq9e0k6muZSAVfyABde
	hX6EX7LEbRIWrREUEIrdkQVAt1wVJ6giJun9lJBr82BCRFv13LjSlYFgKGZO6AqH3HeptGauek9
	w8/bw6iCsBYZOuluWWqzd0Dhm+svbsAc=
X-Gm-Gg: AYBFou2x08w3wgNg+s3yGg74X4/orZhJ9MBDFMx0uJDRGp6z3S2AfdziFksfMyqCZx/
	xfU++5qNNQHQKJHB8a8oadbDxwu9EUuIs0tDsUfCc9H9Dt/LqMKv1VYlb6dCsaU+SItQtebzfog
	m6C3XoPkxGtlP0gC+t/Tm/OE//1JXe8yygmW5mrqt+FiBY9dZoPIu4b5IqTUvuCdmrWCC3VoTtJ
	4UvSva4tJ5iz1CFS7fmcsMWnjA5gtiwPWzxOhdWzpSQBNiq8qF0TAH1oceByj9piygorogUq4yE
	oTvMfqV+KCAcyw7/q2D+qGgwE+6Y2BIP+B3WoAkhMNwgvRQdPEJA7WjqL9EWsxYxl1F15OIlQGt
	wRIDP03RUANlahK/UCIYBI2NJceyZ
X-Received: by 2002:a05:6512:685:b0:5ae:b2df:c11a with SMTP id
 2adb3069b0e04-5b74d4055d3mr1015881e87.0.1788639696294; Sat, 05 Sep 2026
 13:21:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: =?UTF-8?B?6JGJ5a645L2R?= <chenyou910331@gmail.com>
Date: Sun, 6 Sep 2026 04:21:24 +0800
X-Gm-Features: AcwNN1XEzWflJfCxLUhxnRWx5xGHYodF6pdW-4pqy8fw7hinbVQWIDAaQVYvvS8
Message-ID: <CAKspUhJAbCWoxgh2eq8R5g_MiNK=oXgKPUWqGOpHh0w1-Fv74A@mail.gmail.com>
Subject: Subject: [RFC] docs/zh_TW: defining a maintainable scope for the
 Traditional Chinese translation
To: "To: Jonathan Corbet" <corbet@lwn.net>, Alex Shi <alexs@kernel.org>, 
	"Cc: Dongliang Mu" <dzm91@hust.edu.cn>, Weijie Yuan <wy@wyuan.org>, Yanteng Si <si.yanteng@linux.dev>, 
	Hu Haowen <srcres258@furdevs.cn>, linux-doc@vger.kernel.org, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi all,

Now that zh_TW has maintainers again, the next question is what we can
credibly promise to keep current.  The tree holds 97 files, and a survey
of them says: not all of them.  I would rather narrow the scope openly
than leave readers to find out which pages lie to them.

This follows on from Jon's question in the contact-block cleanup thread
[1], where I said the wider question of what to do with the stale
translations deserved its own discussion.

This mail is the survey plus a proposal.  Comments welcome, particularly
from the zh_CN maintainers: most of these files were converted from
zh_CN, so some of the same questions apply there.

All figures below are measured against mainline, so they can be
reproduced; where a pending series changes them, I say so.

[1] https://lore.kernel.org/all/87cxve80yy.fsf@trenco.lwn.net/

1. How the tree got here
========================

zh_TW was added in July 2021 as a conversion of zh_CN, and most of it has
not been touched since:

  - 24 of 97 files have exactly one commit: the import.
  - Most of the remaining commits are two tree-wide mechanical passes: a
    character conversion in late 2023, and link/typo fixes.
  - The listed maintainer address stopped answering zh_TW mail about two
    years ago, which is what left the tree in this state.

2. Translations whose original moved out from under them
========================================================

This is the part that worries me most, because it is invisible to a
reader and to most tooling: the translation looks fine, but the English
document it mirrors has been relocated, so nobody working on the English
side has any reason to look at us.

  ==================================  =========================================
  zh_TW file                          English original now lives at
  ==================================  =========================================
  admin-guide/security-bugs.rst       process/security-bugs.rst
  process/magic-number.rst            staging/magic-number.rst
  dev-tools/gdb-kernel-debugging.rst  process/debugging/gdb-kernel-debugging.rst
  arch/arm/Booting                    arch/arm/booting.rst
  ==================================  =========================================

The moves upstream were:

  2023-03-05  Documentation/security-bugs: move from admin-guide/ to process/
  2024-06-24  Docs: Move magic-number from process to staging
  2024-12-09  Documentation: move dev-tools debugging files to
process/debugging/

All three translations still sit in the old location, and all three are
still linked from a zh_TW index, so a reader is pointed at a file that
mirrors a document which has since been filed somewhere else.

Two more translate content that was restructured rather than moved:

  - IRQ.txt renders an old version of core-api/irq/index.rst.  That file
    is now a twelve-line toctree; the prose it translates lives in
    core-api/irq/concepts.rst.
  - io_ordering.txt is in the same position relative to
    driver-api/io_ordering.rst.

Six files carry no :Original: field at all, so
tools/docs/checktransupdate.py cannot tell what they mirror and skips
them silently:

  index.rst, arch/index.rst, disclaimer-zh_TW.rst,
  dev-tools/sparse.rst, admin-guide/clearing-warn-once.rst,
  admin-guide/cpu-load.rst

There is a second reason this matters.  Where the :Original: marker is
missing, checktransupdate.py falls back to comparing author dates, which
means any mechanical tree-wide pass over the translations resets the
apparent baseline: after such a pass the tool reports those files as up
to date, because the translation is newer than every English change.  I
ran into this while preparing this survey -- measured on top of my own
pending contact-block cleanup, which touches most of the tree, the
number of stale files drops from 51 to 2.  None of that staleness went
away; it just stopped being visible.  A tree without :Original: fields
cannot be measured reliably at all.

Whatever else we decide, I would like to fix these two classes first:
move the misplaced files so they mirror the current English layout, and
give every translation an :Original: field.  That is what makes the rest
of the tree checkable at all.

3. How far behind the rest is
=============================

Using tools/docs/checktransupdate.py over all 87 .rst files:

  ============================  =====
  Upstream commits not applied  Files
  ============================  =====
  1-3                              30
  4-9                              13
  10-19                             7
  20 or more                        1
  ============================  =====

51 files are behind, by 245 commits in total.  The other 36 are level
with their originals only because those originals have not changed
either; nobody is actively keeping any of them current.

The process/ series currently on the list accounts for 66 of those 245
commits and brings all of process/ to zero.  Excluding it, the worst
remaining cases are:

  ===================================  ==============
  File                                 Commits behind
  ===================================  ==============
  admin-guide/mm/damon/usage.rst                   33
  filesystems/index.rst                            17
  arch/arm64/elf_hwcaps.rst                        13
  admin-guide/index.rst                            12
  dev-tools/index.rst                              11
  admin-guide/mm/damon/lru_sort.rst                10
  ===================================  ==============

4. Documents no reader can reach
================================

18 files are not referenced from any toctree.  Sphinx still renders them,
but nothing links to them, so they are unreachable unless you already
know the URL:

  - nine pre-RST files kept in the old plain-text format: IRQ.txt,
    io_ordering.txt, arch/arm/Booting, arch/arm/kernel_user_helpers.txt,
    arch/arm64/{booting,legacy_instructions,memory,silicon-errata,
    tagged-pointers}.txt
  - filesystems/ (5 files, one of which is a tenth plain-text file,
    sysfs.txt) and cpu-freq/ (4 files), which have index.rst files of
    their own that the top-level zh_TW index never links to

disclaimer-zh_TW.rst is also outside the toctree, but deliberately so:
it is marked :orphan: because it is included rather than linked.  It is
not counted above.

5. Per-area summary
===================

  ==============  =====  ===========  ======  ==============
  Area            Files  Unreachable  Behind  Commits behind
  ==============  =====  ===========  ======  ==============
  process            27            0      14              66
  arch               28            7      12              35
  admin-guide        23            0      15              99
  dev-tools           6            0       5              16
  filesystems         5            5       3              21
  cpu-freq            4            4       1               1
  top level           4            2       1               7
  ==============  =====  ===========  ======  ==============

Within those, admin-guide/mm/damon (5 files) accounts for 55 of
admin-guide's 99, and arch/arm64 (10 files) for 23 of arch's 35.

6. Proposal
===========

I would rather do one area properly than all of them badly, so I propose
we start narrow and grow the supported set as people show up.

Step 1, now: process/ becomes the supported set.

  27 files, no unreachable documents, and the pending series already
  brings it to zero commits behind.  It is also what a Taiwanese reader
  starting kernel work reads first.  Committing to keep this current is a
  promise we can keep today.

  As part of this, fix the structural problems in section 2: relocate the
  misplaced translations and add the missing :Original: fields, so
  checktransupdate covers the whole tree.

Step 2, next: the 70 files outside process/ are marked as not currently
maintained.

  That is most of the tree, so to be explicit about what it means: the
  files stay where they are and readers can still find them, but each one
  says plainly that it is not kept in sync and points at the English
  original.

  Rather than inventing a mechanism, reuse the one the tree has: a short
  notice included at the top of the file, the way disclaimer-zh_TW.rst is
  included today.  If people would rather leave the files untouched, the
  same information could live in the index instead.

  Areas would move out of this set as they find someone to look after
  them, rather than being promised anything up front.

Step 3, to decide here: the nine unreachable plain-text files.

  They are unreachable, they use a format the rest of the tree left
  behind years ago, and two of them describe content that no longer
  exists upstream in that shape.  I lean towards removing them: nothing
  links to them, so no reader loses anything.

  filesystems/sysfs.txt is in the same old format but is reachable from
  filesystems/index.rst, so I have left it out of this step.

Open question: filesystems/ and cpu-freq/ (9 files) are unreachable only
because the top-level index never links them.  We can link them and mark
them unmaintained, or drop them.  I lean towards linking, since the
translations themselves are not in bad shape.

7. What I am not proposing
==========================

I am not proposing to touch zh_CN, and I am not proposing to remove
anything a reader can currently reach, apart from the nine plain-text
files in step 3.  I am also not asking anyone to review Chinese text; the
decisions here are about scope, not translation quality.

Sequencing: the two pending zh_TW series should land first, so this
discussion is not competing with them.  What I would like out of this
thread is agreement on the shape, after which I will send the
relocations, the :Original: fixes, and the notices as separate series.

Thanks,
Chen-Yu Yeh
