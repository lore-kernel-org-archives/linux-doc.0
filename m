Received: from mail-m1973172.qiye.163.com (mail-m1973172.qiye.163.com [220.197.31.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EB932581
	for <linux-doc@vger.kernel.org>; Mon, 17 Nov 2025 08:27:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763368064; cv=none; b=fQw+c/kdxze8jAGIyMGngCfJgr8sPv7YMDTa8XOEhoAXoCfJgRd+s+x4xALNmq0rk22qjMc3kYTckxIZ1LYvZy8BBEl8eIedwh36NRFc/1FjPFuGhaQ7OgO8zJVFLmB0+b16H52aOGjQk2wuu1orVn9lVfsaZ+nEmjD7wiCKqMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763368064; c=relaxed/simple;
	bh=Rj8Pg4Smx8EPxJMdRDOunJm8diH8XXoYeNGkQrCI2/Y=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=PswukR5dOqupxDb/OlehlBpNlL/NDtQYAJ6AULU3pfGFDgfoji+dMdfLSPPgKx5KcupJhO3bXqj/IEBapIJlqUF5gt9DfffYWX5/jV9b+uEGlBx2qynUjdTZpZg72RzwSRMhDRa17nWo9qdTLKAryTnVftNIDkPapE3RR4BrtPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leap-io-kernel.com; spf=pass smtp.mailfrom=leap-io-kernel.com; dkim=pass (2048-bit key) header.d=leap-io-kernel.com header.i=@leap-io-kernel.com header.b=EoyKnkZO; arc=none smtp.client-ip=220.197.31.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leap-io-kernel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leap-io-kernel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leap-io-kernel.com header.i=@leap-io-kernel.com header.b="EoyKnkZO"
Received: from localhost.localdomain (unknown [1.203.157.252])
	by smtp.qiye.163.com (Hmail) with ESMTP id 29d39b811;
	Mon, 17 Nov 2025 16:27:36 +0800 (GMT+08:00)
From: ke zijie <kezijie@leap-io-kernel.com>
To: alexs@kernel.org,
	si.yanteng@linux.dev
Cc: dzm91@hust.edu.cn,
	corbet@lwn.net,
	linux-doc@vger.kernel.org,
	wangyuli@aosc.io,
	doubled@leap-io-kernel.com
Subject: [PATCH v3 0/3] Add chinese translation for block
Date: Mon, 17 Nov 2025 16:27:33 +0800
Message-Id: <cover.1763366835.git.kezijie@leap-io-kernel.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9a90ed368009d8kunma1c7246a3f20a58
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlDSk5JVh5DSksZTRkYQxgdSlYVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlKVUlLSFVKTkxVSU5JWVdZFhoPEhUdFFlBWU9LSFVKS0lCQ0NMVUpLS1
	VLWQY+
DKIM-Signature: a=rsa-sha256;
	b=EoyKnkZOHe6qj0BFvTTEtGrE2rFAo2dWgf/rfXZd+VfUulMOeAIgWqPhEyqiVEtoPobGYmJSNfca2MlhWc9ao4KQAvMciVbIP8b7kGTzYgpyMwp12sV0UNK3rK1haGxTNUoleQje6hTCRB+V0923ICTxZBPdsOszDlluIy4Ir/TUXNc7ImSv1XXUZRNoZqjnkDorAQY1J9abwfwQlP9JwVIVJoUivcZB6i3Fzu+jwttMyhqxZzdal4r7w2w3oyVYRPOv4qOdT3SDScKkPo3eFR0zYVgYHNkuO7IRLtQiIvdvYmNtcNV4IcppGjITh6LW98vPDnTKIINw8bUV7ZXN5Q==; c=relaxed/relaxed; s=default; d=leap-io-kernel.com; v=1;
	bh=6d0NKDcJuRXfd/DxQMp8+xiMu6w3TTODQYmSPQBeMtk=;
	h=date:mime-version:subject:message-id:from;

This patch set adds chinese translations for the BLOCK documentation.

Changes in v3:
 - Add Reviewed-by tag from Wang Yuli
 - Link to v2: https://lore.kernel.org/linux-doc/cover.1763350407.git.kezijie@leap-io-kernel.com/

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

