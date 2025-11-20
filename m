Received: from mail-m1973178.qiye.163.com (mail-m1973178.qiye.163.com [220.197.31.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D7F92D595F
	for <linux-doc@vger.kernel.org>; Thu, 20 Nov 2025 02:27:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763605656; cv=none; b=Obe4JuKUNK56z3V3CzIVyns2uezmpfimVCfMLhMioEJHKvTmcriDiyqUTbutk4uqY5c2sHsxafKIcu3tPCodDfOC2Y7k1k+PTQQPuy8j0kn4lD0geBrAa2WosN77cyR8TRnil9kmeKorWVCVQmkRZu4VTfVH5PGeDHcPbWe/3QQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763605656; c=relaxed/simple;
	bh=mcYFRI9Lz4z7Wt4Tn/6ria47SlCFkUnpnl391XRukaE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=FG+U1+/4fc3bfcSKOn/EPHb+b+CT6yNlFMJFluHZVqPpgvEfZPsNHBjDC/VTM+E8Xpgb02CJBo/vMi9cFRvQzUozPyTlVhhUQXRK5i9nurGyAhrY8rBEGhKn//sTkY1cJkq7YnSfDTuLgTlnzkU69pOJ4amTLGfOK7GpV3Vnysg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leap-io-kernel.com; spf=pass smtp.mailfrom=leap-io-kernel.com; dkim=pass (2048-bit key) header.d=leap-io-kernel.com header.i=@leap-io-kernel.com header.b=SSjfxKXm; arc=none smtp.client-ip=220.197.31.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leap-io-kernel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leap-io-kernel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leap-io-kernel.com header.i=@leap-io-kernel.com header.b="SSjfxKXm"
Received: from localhost.localdomain (unknown [1.203.157.252])
	by smtp.qiye.163.com (Hmail) with ESMTP id 2a36cea83;
	Thu, 20 Nov 2025 10:27:28 +0800 (GMT+08:00)
From: ke zijie <kezijie@leap-io-kernel.com>
To: alexs@kernel.org,
	si.yanteng@linux.dev
Cc: dzm91@hust.edu.cn,
	corbet@lwn.net,
	linux-doc@vger.kernel.org,
	wangyuli@aosc.io,
	doubled@leap-io-kernel.com
Subject: [PATCH v6 0/3] Add chinese translation for block
Date: Thu, 20 Nov 2025 10:27:25 +0800
Message-Id: <cover.1763605033.git.kezijie@leap-io-kernel.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9a9f16940a09d8kunm7a5293773a3420
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkZT0JKVktCTEtKSUlLSkJNSVYVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlKVUlLSFVKTkxVSU5JWVdZFhoPEhUdFFlBWU9LSFVKS0lCQ0NMVUpLS1
	VLWQY+
DKIM-Signature: a=rsa-sha256;
	b=SSjfxKXmQypHO3Z6ytcBhK6kNi7M/ltN43Y/iDyemMnCd8WXDKIj0nb8mjJcAj7RNvbVoDqxsTmBZNbPXLNhAbZ3wakLyFVbojRdGj+TMp2d2yknFsrxh5HinnOHgxkqYOkO4oSOfQ9pvG8P3l8s3/KfG4x4iK40Nw84GeFo13IlsBoXbhTuUz4lmnKfsYjE5IQg8Yk3mRlXC9pWzdiHJD7fufuvt4gC99Vcn/bH3q7RZw0MVUtmmFX8kydVRF+LGKWHnfv9nFzmyKScEIeTqVUQrQ0LW3shMmOus8NkwNccvBkVIvH8q+Oln1M8AG6AdnjFuvD8PcVw4gEv2uRrXQ==; c=relaxed/relaxed; s=default; d=leap-io-kernel.com; v=1;
	bh=NA0nWgCw9BjBeMh0iZSwOIy6Xcg+8PS5QIWx/vQDJic=;
	h=date:mime-version:subject:message-id:from;

This patch set adds chinese translations for the BLOCK documentation.

Changes in v6:
 - No content changes
 - Add missing Reviewed-by tag from Yanteng Si to patches 1/3 and 2/3
 - Link to v5: https://lore.kernel.org/linux-doc/cover.1763535919.git.kezijie@leap-io-kernel.com/

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

