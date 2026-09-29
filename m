Received: from mail-pj2-f40.google.com (mail-pj2-f40.google.com [74.125.227.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A468337BE71
	for <linux-doc@vger.kernel.org>; Tue, 29 Sep 2026 13:10:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790687430; cv=none; b=EI68yoVYwjQH0QT2FPP/E1gf6USp55RBqyso+SkuQF2ZTBTAgcEDjRZxVkvn0o5OT4uv4j5C/rUEZbARTv9tNwniSl6zG1UzUd681APQ9G5zh5sQA9eFt7qh1u+LflWXvkhHaTUrp9IDdo0bB1WVIBNnyI++Hlqk7BqniCoc0AU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790687430; c=relaxed/simple;
	bh=zEnTBTXjr/3Yq3M6DgYn2rlIFOMrPIe3fS/NqzeDWbA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UPwbx4z0NHQ4FV6YEIEYiJng9XonWitp7MRKDpE+3K6JYU8EpnqIR4f9HAVSb4sWcYzyLUbXeny2enVW6xMdi27/jh5iJcG8KP7lr2mEcKSVlqnqxZEnwnRSJuPvkMqHsRIPQL1oTDDAvrQYC27abt7CUe2ma051HqB8K6BZa/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gvtBVMDP; arc=none smtp.client-ip=74.125.227.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gvtBVMDP"
Received: by mail-pj2-f40.google.com with SMTP id d9443c01a7336-2dfae9a76c7so2329845ad.3
        for <linux-doc@vger.kernel.org>; Tue, 29 Sep 2026 06:10:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790687428; x=1791292228; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=soWPGbxjnigdj4iGcVSd7XhV9qnB/30daTVau/x4EZE=;
        b=gvtBVMDPwlTwHMleWBHmCmIJJ1pvWlY50/m1q2mkvK+O7fIGvHCrQ3ksukwQ4veAM+
         EazH0Y7unr9oOUmhO1OjbhASl4CrdBvAp8xWwWy5jdHRu3aOrEMYojIPfE1FsZH3lyN1
         Uytm5bHLwy9NY2uiW4wsbr97CPhe5vJ4S76ddNCWYWlhWzBsuO4rmB7Agq6iNhwSATYS
         5Ga4PFqo2fnr7HPSeiX8jq+nathi8PBC9uQtHkmUJ/FlVt4tN4nCGuay+vG/fKjIuveU
         pp4xHJ81Uf8QYfqOaUEUudsLl4F/gOt5pVecmYj7pwcXTTjrYdo85Cfa4kgxTpyzl3h5
         zWkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790687428; x=1791292228;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=soWPGbxjnigdj4iGcVSd7XhV9qnB/30daTVau/x4EZE=;
        b=cSEMmJdNAFVTaAYCMg3fWc/ovmRnNQPoIjzTC/LNpsxD0yuD0oF74qcz8Gj5qdOs2+
         /vnKi5gD6O2u+nOqQB/0tIbdZgzsDZzf40xowbytwz+5cK51yIQpxAxfUiPvA23vQwi7
         GLoqvUtqliQQdtehXQqApcn68xz2Q4GCkzFe2aoTRWUijxVYPUUyOyu/7zriQFM+jIZr
         ngWDafxxgtDmC9fVElfgzFPaUsup0t2Amx/AbSdBbvpdY02+ezvC08KSQunQveLHsBJo
         WeyRfSyEIaxdCkvfVs/m7eThccZldeAmpnoxCJ6R4RvMWoNOzZE2CTujV7Ev2uunHwOT
         pAhQ==
X-Forwarded-Encrypted: i=1; AKwUvBxnmS+vvGJk3sNsDdBXnli21bOE303U7LGe/7wGljMr080/pKSMGdB7oY9ZlG4TgGLDmn9tv2xnB1w=@vger.kernel.org
X-Gm-Message-State: AFq9FYJUTUPGcL1o2eexUazrKSum2OyWxCBeSyOWb7VpKEBb0Ir9Mze+
	sKtMHrUhunT06PazPgogHqWuD0V3cjxCHLhM6Rjay4WMupQgMU9Qt7ol
X-Gm-Gg: AYBFou3A97R5atGyzah3L8rBrDYdo/VBs0Ggcbezmg9/sGsT77LMAR0GNtdMuwI0nSP
	w31W5HBBQrT8Srw6X1VBxcn4JoOmQ5YFbRcZl37pEKSR0jfwisuCH5c9m1hwwaEpFa+J6ZUkThy
	Oemk+5YG7/rhZs2MHaYDVqpKLIwzW7ufjK2lJuSZzYP60uR4bhcw0JJ8mtl4UuLKKIizcr5bev9
	THHjbXez2EUFG2ySMxfW+4nSZOxihkqLLKm6oV8BFMdzGPTSNsrXsSqSnqSMkt1R/7+4gayMY+J
	M5L1Pbd2keGE1G+RYKJM2rIkhineB15d/t3ane1gWe6/UiDHh6oZQl8h3pECXsf0Ojaxgb5ZEz8
	73frKpUKAGhb+yD0OBBW4NOAw+byZNt+0bwZcoJaoSIqLU2H6VwiEo+yw6F9REz/mwfNrU0TJnS
	e61OLDBy20UHCBGOMlXvifXcQyGM/y7HEZHUbeuS1d4qJlc3vM8aotiDyVN1v4+Pc4fgdwhJ46c
	31jhP78WOFfXEAzQ3hlq/3IunjOu8vYRhdMR9Y6u2R6hCvt2EouaDzMQA==
X-Received: by 2002:a17:902:e88c:b0:2dd:6cb5:77c with SMTP id d9443c01a7336-2df8e69f277mr176586875ad.2.1790687427998;
        Tue, 29 Sep 2026 06:10:27 -0700 (PDT)
Received: from chenyou.. ([140.116.39.229])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df9142969esm57363705ad.45.2026.09.29.06.10.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 06:10:27 -0700 (PDT)
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
Subject: [PATCH 0/4] docs/zh_TW: relocate translations to follow the English layout
Date: Tue, 29 Sep 2026 21:10:14 +0800
Message-ID: <20260929131020.266120-1-chenyou910331@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Three zh_TW translations still sit where their English originals used
to live, so tools/docs/checktransupdate.py cannot find the originals at
all.  This series moves them, gives each a baseline, and adds the
:Original: fields that were missing, as proposed in the zh_TW scope
discussion:

  https://lore.kernel.org/linux-doc/CAKspUhJAbCWoxgh2eq8R5g_MiNK=oXgKPUWqGOpHh0w1-Fv74A@mail.gmail.com/

  translation                 moves to                        baseline
  admin-guide/security-bugs   process/security-bugs           44ac5abac86b
  process/magic-number        staging/magic-number            f9a4f4a0e1f5
  dev-tools/gdb-kernel-...    process/debugging/gdb-kernel-.. d5af79c05e93

Each baseline is the English move commit.  checktransupdate.py does not
follow renames, so a commit from before a move is invisible at the new
path and the tool silently falls back to reporting the file as current;
the move commit is the oldest baseline it can use.  Where that hides a
missing change, the commit message records it (6b219431037b for
gdb-kernel-debugging).

Two side effects of the tool reading one "update to commit" line per
commit, which this series does not try to paper over:

 - process/index.rst is touched by the moves and so inherits their
   baseline; the tool now lists five English index commits that the
   recent process series already applied.
 - staging/index.rst and process/debugging/index.rst are new; the latter
   is listed against a592a36e4937, which only drops the index-link
   boilerplate that translations keep anyway.

The fourth relocation named in the proposal, arch/arm/Booting, is one of
the unreachable plain-text files and is removed in a separate series
instead.

This applies on top of v2 of the contact-block cleanup:

  https://lore.kernel.org/linux-doc/20260929115956.229610-1-chenyou910331@gmail.com/

Chen-Yu Yeh (4):
  docs/zh_TW: move security-bugs to process/
  docs/zh_TW: move magic-number to staging/
  docs/zh_TW: move gdb-kernel-debugging to process/debugging/
  docs/zh_TW: add missing :Original: fields

 .../zh_TW/admin-guide/clearing-warn-once.rst  |  2 +
 .../zh_TW/admin-guide/cpu-load.rst            |  2 +
 .../translations/zh_TW/admin-guide/index.rst  |  1 -
 .../translations/zh_TW/arch/index.rst         |  2 +
 .../translations/zh_TW/dev-tools/index.rst    |  1 -
 .../translations/zh_TW/dev-tools/sparse.rst   |  4 +-
 Documentation/translations/zh_TW/index.rst    |  5 +-
 .../debugging}/gdb-kernel-debugging.rst       |  2 +-
 .../zh_TW/process/debugging/index.rst         | 70 +++++++++++++++++++
 .../translations/zh_TW/process/index.rst      |  9 +--
 .../security-bugs.rst                         |  0
 .../translations/zh_TW/staging/index.rst      | 23 ++++++
 .../{process => staging}/magic-number.rst     |  0
 13 files changed, 108 insertions(+), 13 deletions(-)
 rename Documentation/translations/zh_TW/{dev-tools => process/debugging}/gdb-kernel-debugging.rst (99%)
 create mode 100644 Documentation/translations/zh_TW/process/debugging/index.rst
 rename Documentation/translations/zh_TW/{admin-guide => process}/security-bugs.rst (100%)
 create mode 100644 Documentation/translations/zh_TW/staging/index.rst
 rename Documentation/translations/zh_TW/{process => staging}/magic-number.rst (100%)

-- 
2.43.0

