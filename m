Received: from mail-m19731112.qiye.163.com (mail-m19731112.qiye.163.com [220.197.31.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 422C02F657A
	for <linux-doc@vger.kernel.org>; Fri, 14 Nov 2025 07:42:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.112
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763106162; cv=none; b=QcLtPxchzrRgRfflGEJz8jXO1ogtUJkCqf9wVG9eydsNdfPlVnvw6DcfzmYrDiKjoVCpxlTHNFoESuclt17C9it+BpzzRiwlSnWLitg1O/51Z/7k4/6xLQP1SVxbivxNpUBkGQEYIeRZkoozVfBJ3YXS49CcAPVdbpKClwjzTOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763106162; c=relaxed/simple;
	bh=wi+0C+ALwSmMniQx1rUNxWRBc82zA9C/vP0Cx20gTc4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Q2D15HOAgWW1hdjh7RHH8C3/Tial9Jl3uzl8HpEXLFdBysA4JFxnUZhmUtu4jf5XTGBMbbZzJAsAQRWpTQFFklR/pvxr9Hzy3Z42excthxXeJOZtBjHI9s2OsDQUC0cEGBngCwHBrZo7uCZQTAMFJMnwq1LgcxghgGH2viYLTJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leap-io-kernel.com; spf=pass smtp.mailfrom=leap-io-kernel.com; dkim=pass (2048-bit key) header.d=leap-io-kernel.com header.i=@leap-io-kernel.com header.b=OwY7ADf+; arc=none smtp.client-ip=220.197.31.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leap-io-kernel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leap-io-kernel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leap-io-kernel.com header.i=@leap-io-kernel.com header.b="OwY7ADf+"
Received: from localhost.localdomain (unknown [1.203.157.252])
	by smtp.qiye.163.com (Hmail) with ESMTP id 2994ff82b;
	Fri, 14 Nov 2025 15:37:22 +0800 (GMT+08:00)
From: ke zijie <kezijie@leap-io-kernel.com>
To: alexs@kernel.org,
	si.yanteng@linux.dev
Cc: dzm91@hust.edu.cn,
	corbet@lwn.net,
	linux-doc@vger.kernel.org,
	doubled@leap-io-kernel.com
Subject: [PATCH 0/3] Add chinese translation for block
Date: Fri, 14 Nov 2025 15:37:18 +0800
Message-Id: <cover.1763105050.git.kezijie@leap-io-kernel.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9a814c241f09d8kunme5a62dc31846276
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkZGRgfVkxNTU5MTh9PQhpOHVYVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlKVUlLSFVKTkxVSU5JWVdZFhoPEhUdFFlBWUtVS1VLVUtZBg++
DKIM-Signature: a=rsa-sha256;
	b=OwY7ADf+xb+TbwmzIZdfWSKFkXkc1GzXMt0apAJ7nwXo44YPjdNcOuL7z9d/tQGVpzcrZJ1/1ArZGhv5bk6AbzHtErKJysiByu+pGvJQ26DfcoJbKH++/v6zoYLDzMiZ1I2aAOgwY4LFBATdN0jwoxgIZjkdMHt6R+wuc6HUS1FxZGzSZUEdl5chtn4ccDZXYUfcmQlyPSZpD0+IsUUYDUhPQhXA6EFN0Z5CHROgXf92VwODeMYx81y+nENwzZKRCMiAAWb302k9wWOGllRhiaaHwPRw0hvgUFZtlRDecQyr4/no83rqyaUPj++5zB2oOqpnwwUXAJDn0q6EVcVNFQ==; c=relaxed/relaxed; s=default; d=leap-io-kernel.com; v=1;
	bh=K4iTa9pnOMSDdczjT9pzxREmc4a4eYkmseezmJ5+kCo=;
	h=date:mime-version:subject:message-id:from;

This patch set adds chinese translations for the BLOCK documentation.

ke zijie (3):
  docs/zh_CN: Add block/index.rst translation
  docs/zh_CN: Add blk-mq.rst translation
  docs/zh_CN: Add data-integrity.rst translation

 .../translations/zh_CN/block/blk-mq.rst       | 128 ++++++++++++
 .../zh_CN/block/data-integrity.rst            | 193 ++++++++++++++++++
 .../translations/zh_CN/block/index.rst        |  37 ++++
 .../translations/zh_CN/subsystem-apis.rst     |   1 -
 4 files changed, 358 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/translations/zh_CN/block/blk-mq.rst
 create mode 100644 Documentation/translations/zh_CN/block/data-integrity.rst
 create mode 100644 Documentation/translations/zh_CN/block/index.rst

-- 
2.25.1

