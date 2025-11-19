Received: from mail-m3293.qiye.163.com (mail-m3293.qiye.163.com [220.197.32.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2DDD2D3EDF
	for <linux-doc@vger.kernel.org>; Wed, 19 Nov 2025 07:09:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763536194; cv=none; b=MUzV9EvP+srqok+Uj9NmRrx4nrW9SSNwDNxiwPdRKfD1HzuaqBeG1ArJUuD2VxvUr9KfwtQNOSRo76pY1tMQfDm0KvpLbJz5+JWd9Ttou4eHusutptslBlyoSYEPfx/fKj+64L7r78LQHVB2GPCXs42ovStEiz8xR8EFnKjyBjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763536194; c=relaxed/simple;
	bh=V9aPmCUbcEsFukaL+aWeCn+oUrdTl+FlFiXylBu8JwI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=bPneDr4GZJkmCPpZcFnRGuF6M9YbuOkLeqm7xh0xZP95l2dPbujU6ktNWYRd20KsfHrHIhCaTMoEZmVZup90Qk7M1XWn1cAoxjN2OYhccQKVQJtuavhrBjnysqCRaSYXsNOHsy+hBgi9TfI/HfvoqBh8CQnijfogmiKXigy6jkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leap-io-kernel.com; spf=pass smtp.mailfrom=leap-io-kernel.com; dkim=pass (2048-bit key) header.d=leap-io-kernel.com header.i=@leap-io-kernel.com header.b=BTc4pl7x; arc=none smtp.client-ip=220.197.32.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leap-io-kernel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leap-io-kernel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leap-io-kernel.com header.i=@leap-io-kernel.com header.b="BTc4pl7x"
Received: from localhost.localdomain (unknown [1.203.157.252])
	by smtp.qiye.163.com (Hmail) with ESMTP id 2a1aef7de;
	Wed, 19 Nov 2025 15:09:38 +0800 (GMT+08:00)
From: ke zijie <kezijie@leap-io-kernel.com>
To: alexs@kernel.org,
	si.yanteng@linux.dev
Cc: dzm91@hust.edu.cn,
	corbet@lwn.net,
	linux-doc@vger.kernel.org,
	wangyuli@aosc.io,
	doubled@leap-io-kernel.com
Subject: [PATCH v5 0/3] Add chinese translation for block
Date: Wed, 19 Nov 2025 15:09:34 +0800
Message-Id: <cover.1763535919.git.kezijie@leap-io-kernel.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9a9af28c4c09d8kunmdeaeea3a58943e8
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkZHxhLVkhDSE8ZSENNGh0dGVYVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlKVUlLSFVKTkxVSU5JWVdZFhoPEhUdFFlBWU9LSFVKS0lCQ0NMVUpLS1
	VLWQY+
DKIM-Signature: a=rsa-sha256;
	b=BTc4pl7xQ3QBgWnTU3Cl5djnbHwxIqsquXU3Nq0qRAVYt+K/2tGMQGNXNyjSF/9QtxpHt1X6rL8Z9vgTJZxT8AR0xLg8xG9y+m6UaqRKhKToPwTKNZqDkdyaiXwMu+sXoYWUjRKenHTrDTsjkGt8DU5mTrh3HzdXNPeIZR+SYXZPzvnJ7HevBVYTz5nru34Nv7buKhAlY2omGRY5cNzX8UY3K41fSY6JMc8X/sbVsYJ/PbqW4gU4Ds5m8AKI/BG05+SitiW5kWA+ZCSIVA+Dmu7a1fIRpRmDM1iVgpOQV3aFXoJJbhZp3fDRWHOqh15x/SoP/61sRQbHFuHiXt7vug==; c=relaxed/relaxed; s=default; d=leap-io-kernel.com; v=1;
	bh=sKFSk0LfMWD/uOSnWa/t0VOUoSjTTtrBp+iD8ffukwE=;
	h=date:mime-version:subject:message-id:from;

This patch set adds chinese translations for the BLOCK documentation.

Changes in v5:
 - Add Reviewed-by tag from Yanteng Si
 - Link to v4: https://lore.kernel.org/linux-doc/cover.1763519072.git.kezijie@leap-io-kernel.com/

Changes in v4:
 - Fix formatting and translation issues (reported by Yanteng Si)
 - Link to v3: https://lore.kernel.org/linux-doc/cover.1763366835.git.kezijie@leap-io-kernel.com/

Changes in v3:
 - Add Reviewed-by tag from Wang Yuli
 - Link to v2: https://lore.kernel.org/linux-doc/cover.1763350407.git.kezijie@leap-io-kernel.com/

Changes in v2:
 - Fix Chinese/English spacing issues (suggested by Wang Yuli)
 - Fix make htmldocs warning: "Duplicate C declaration"
 - Adjust blk-mq translation wording
 - Link to v1: https://lore.kernel.org/linux-doc/cover.1763105050.git.kezijie@leap-io-kernel.com/

ke zijie (3):
  docs/zh_CN: Add block/index.rst translation
  docs/zh_CN: Add blk-mq.rst translation
  docs/zh_CN: Add data-integrity.rst translation

 .../translations/zh_CN/block/blk-mq.rst       | 130 ++++++++++++
 .../zh_CN/block/data-integrity.rst            | 192 ++++++++++++++++++
 .../translations/zh_CN/block/index.rst        |  35 ++++
 .../translations/zh_CN/subsystem-apis.rst     |   1 -
 4 files changed, 357 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/translations/zh_CN/block/blk-mq.rst
 create mode 100644 Documentation/translations/zh_CN/block/data-integrity.rst
 create mode 100644 Documentation/translations/zh_CN/block/index.rst

--
2.25.1

