Received: from mail-m1973177.qiye.163.com (mail-m1973177.qiye.163.com [220.197.31.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDC141A704B
	for <linux-doc@vger.kernel.org>; Wed, 19 Nov 2025 02:43:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763520209; cv=none; b=mLuhTHEN7husjDQc1gVzY+KWytZpnFLaDwo3tX/NJQZWgzepNEbJSbKvWKE2+Be23dmX8eJfioTC62a6YvgaL6x6hEwg4Jkd7EdCK5FGV6J+2PHFojRrkXfpHhUYxd1lPFNy6/05MddfcEr04vLsqhIxWhJosyIrtnpyy7eOK3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763520209; c=relaxed/simple;
	bh=85q8+IjLTbWvA5Yzv55LjQw4uU9YLun5v/M2HWzX8mg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=IDVxnHlQeqg6B1PJwFG8I3s6tKkBdvyCatzJ4H75xVYqq7UHgbdDT4Z0llh9Y4IGboOL7pWO4FIBpxqF18/M7SsyNFGNQRhXpxxEvxeZMjXOuCZxgf8FhSE21KgVFQcm+WQhnKtGIRMBND4RwtAPW4DyepP5oTH566krOO/zIJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leap-io-kernel.com; spf=pass smtp.mailfrom=leap-io-kernel.com; dkim=pass (2048-bit key) header.d=leap-io-kernel.com header.i=@leap-io-kernel.com header.b=MtOcVtt3; arc=none smtp.client-ip=220.197.31.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leap-io-kernel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leap-io-kernel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leap-io-kernel.com header.i=@leap-io-kernel.com header.b="MtOcVtt3"
Received: from localhost.localdomain (unknown [1.203.157.252])
	by smtp.qiye.163.com (Hmail) with ESMTP id 2a114d08c;
	Wed, 19 Nov 2025 10:38:09 +0800 (GMT+08:00)
From: ke zijie <kezijie@leap-io-kernel.com>
To: alexs@kernel.org,
	si.yanteng@linux.dev
Cc: dzm91@hust.edu.cn,
	corbet@lwn.net,
	linux-doc@vger.kernel.org,
	wangyuli@aosc.io,
	doubled@leap-io-kernel.com
Subject: [PATCH v4 0/3] Add chinese translation for block
Date: Wed, 19 Nov 2025 10:38:05 +0800
Message-Id: <cover.1763519072.git.kezijie@leap-io-kernel.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9a99f9ff0e09d8kunmf48af7c35607be9
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlDSB8aVk9LSxoZQkoeSx1IQlYVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlKVUlLSFVKTkxVSU5JWVdZFhoPEhUdFFlBWU9LSFVKS0lCQ0NMVUpLS1
	VLWQY+
DKIM-Signature: a=rsa-sha256;
	b=MtOcVtt3x3G5TR7LWhEopJ1kvPpv1f4QBIViwEBjst/QiXQv94ayzWk0GRYXVmZgZ69l0jX82un/AvkhUQHsWH1VUMLwBVgwrQ5Y0+tqcutTTJwh1GP9xMwWCGd4S2Dy3uWp6CHJ1CTJgdwy3CtW4hiCYhZ6NhLBVtZYjp3jjnLihTTQXd9D7it1kSlX4byXsMETWENbIdpswUPj4yiJKIuooz4fnsZPZAFFVpQ4AqKb1AInPzpCP+kNAw9oPPPY8eeJ8vVWEv2DSuvBnIwdZwPsSk5NPpgRfXkXnAwLLKMpkuaYfJGlPIXxJHQYw1F6kSd8mY+YT5h7XY0drjiqbg==; c=relaxed/relaxed; s=default; d=leap-io-kernel.com; v=1;
	bh=KEAGGzQBpS+Qesv6D2nkJfEvRlYKPvzxK2f7Sz9Iz2g=;
	h=date:mime-version:subject:message-id:from;

This patch set adds chinese translations for the BLOCK documentation.

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
 .../zh_CN/block/data-integrity.rst            | 193 ++++++++++++++++++
 .../translations/zh_CN/block/index.rst        |  35 ++++
 .../translations/zh_CN/subsystem-apis.rst     |   1 -
 4 files changed, 358 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/translations/zh_CN/block/blk-mq.rst
 create mode 100644 Documentation/translations/zh_CN/block/data-integrity.rst
 create mode 100644 Documentation/translations/zh_CN/block/index.rst

--
2.25.1

