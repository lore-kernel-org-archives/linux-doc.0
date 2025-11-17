Received: from mail-m19731112.qiye.163.com (mail-m19731112.qiye.163.com [220.197.31.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88162156661
	for <linux-doc@vger.kernel.org>; Mon, 17 Nov 2025 03:46:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.112
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763351182; cv=none; b=hclaaISCsNoudhFrOvxHvlE11+zaG15xV8RqquvzedoqhiIPCb24sOsWmXCacc32VtE22ETq3VsnTjcffkTPEM0w0RFzL6tEJL0NcWuknWLiTNaYXyZJGYQykywXKOcHCuHRxNFxJX5VF7d9NtvB2/TuYmkYeKyDunAahs3+2GM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763351182; c=relaxed/simple;
	bh=YPjgajD213a/fOZlYSC8inbnb722/tQyhb+all0orhI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=kKuc5W9Gq0q76qxAhCpk1+brA270YKeVC7BH6pRDh0SLO4xBP3sqWLLLmXApQrnCDIkbzVzUA/krB2J4GKF6U+0jwze6x5YrE9gzb/MfarOdpIs0R64hcdnAEPBnKjYiqu6zo36pAcBgkJmzjbSYFFy5/k40OSz2AtOKvTNXu+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leap-io-kernel.com; spf=pass smtp.mailfrom=leap-io-kernel.com; dkim=pass (2048-bit key) header.d=leap-io-kernel.com header.i=@leap-io-kernel.com header.b=N4CFxSGv; arc=none smtp.client-ip=220.197.31.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leap-io-kernel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leap-io-kernel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leap-io-kernel.com header.i=@leap-io-kernel.com header.b="N4CFxSGv"
Received: from localhost.localdomain (unknown [1.203.157.252])
	by smtp.qiye.163.com (Hmail) with ESMTP id 29c9141db;
	Mon, 17 Nov 2025 11:46:10 +0800 (GMT+08:00)
From: ke zijie <kezijie@leap-io-kernel.com>
To: alexs@kernel.org,
	si.yanteng@linux.dev
Cc: dzm91@hust.edu.cn,
	corbet@lwn.net,
	linux-doc@vger.kernel.org,
	wangyuli@aosc.io,
	doubled@leap-io-kernel.com
Subject: [PATCH v2 0/3] Add chinese translation for block
Date: Mon, 17 Nov 2025 11:46:07 +0800
Message-Id: <cover.1763350407.git.kezijie@leap-io-kernel.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9a8feb8d3d09d8kunm4b5bfed13c771eb
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlDGR8ZVkNDTB4ZTUNKSE4fHlYVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlKVUlLSFVKTkxVSU5JWVdZFhoPEhUdFFlBWU9LSFVKS0lCQ0NMVUpLS1
	VLWQY+
DKIM-Signature: a=rsa-sha256;
	b=N4CFxSGvSQ7gnnMC3bWEjFXIurm0CxUPkT2VkfD1b6GqmmMq12lDivHeppNNUdENUSCM0r/Bnexa9sXgoQpzNIPbOsZB9KJjgsZm1PUaub0odXosa8QlVEJ6WhuroXjiRtmmWEgBj2N6TtkVCczr0tGu4vYJJt3WAOk/q1MSvPq2KniIuZgPRvx3TWk1kGjN1DJr9ot5jhIN0Bk/UMNunt3OhEkc96Fg5vFA4icUe/22nwv93QRtEOiUKZ1SxmAHYHuNn+x4w/QIIRdrQh+KRkHt/NgBJF+I4VBf/nsYt9rOprQeLNjpb4mPIXmvS4JpG92EXLlbsWC6KJUP4hfpqA==; c=relaxed/relaxed; s=default; d=leap-io-kernel.com; v=1;
	bh=s+WCJzvM8klU13ijTLvs5Expa49g+P0tJINScu7x9tE=;
	h=date:mime-version:subject:message-id:from;

This patch set adds chinese translations for the BLOCK documentation.

Changes in v2:
 - Fix Chinese/English spacing issues (suggested by Wang Yuli)
 - Fix make htmldocs warning: "Duplicate C declaration"
 - Adjust blk-mq translation wording
 - Link to v1: https://lore.kernel.org/linux-doc/cover.1763105050.git.kezijie@leap-io-kernel.com/

ke zijie (3):
  docs/zh_CN: Add block/index.rst translation Translate
    .../block/index.rst into Chinese and update subsystem-apis.rst
    translation
  docs/zh_CN: Add blk-mq.rst translation
  docs/zh_CN: Add data-integrity.rst translation

 .../translations/zh_CN/block/blk-mq.rst       | 130 ++++++++++++
 .../zh_CN/block/data-integrity.rst            | 193 ++++++++++++++++++
 .../translations/zh_CN/block/index.rst        |  37 ++++
 .../translations/zh_CN/subsystem-apis.rst     |   1 -
 4 files changed, 360 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/translations/zh_CN/block/blk-mq.rst
 create mode 100644 Documentation/translations/zh_CN/block/data-integrity.rst
 create mode 100644 Documentation/translations/zh_CN/block/index.rst

--
2.25.1

