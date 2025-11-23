Received: from mail-m19731100.qiye.163.com (mail-m19731100.qiye.163.com [220.197.31.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D481204F93
	for <linux-doc@vger.kernel.org>; Sun, 23 Nov 2025 08:49:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763887754; cv=none; b=RWTifRVnCdyctsl6bQyjaCsdS+W/WZhMuwSRc+zShW7RIBpCPY/iMSY4malw12eIeHG9aCSY/CtxphTwPbwIrVjEsl4fNlxRmSH1oscWGAf1sVLDwiarLU/wBxuutK+acN4Ohr00Ir2ZRbT8TqgYSXZ8oeXv5Hy6it2/0MNiSTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763887754; c=relaxed/simple;
	bh=BH94mwtV1K7TuWCm19bxt3B7T2nnQ0dCvKjegID5cpQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=hzyE9VoZi99INqsDhKCoqPcvnxHxlhgbASfZJXPkXVwczChbhYc0846UYMGUwOkSdHSrwuyeAMxm9iXlokc2QIfsRCSEC/XRPsCqQhT4SbJgjnIxg/QNk4lfuKtzwjEjSGFT24vJRsKQC9glIc7ollKXO6XXhWZPTzvG4142oRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leap-io-kernel.com; spf=pass smtp.mailfrom=leap-io-kernel.com; dkim=pass (2048-bit key) header.d=leap-io-kernel.com header.i=@leap-io-kernel.com header.b=oS2VhMyS; arc=none smtp.client-ip=220.197.31.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leap-io-kernel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leap-io-kernel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leap-io-kernel.com header.i=@leap-io-kernel.com header.b="oS2VhMyS"
Received: from localhost.localdomain (unknown [1.203.157.252])
	by smtp.qiye.163.com (Hmail) with ESMTP id 2a8ea84f4;
	Sun, 23 Nov 2025 16:48:59 +0800 (GMT+08:00)
From: Yujie Zhang <yjzhang@leap-io-kernel.com>
To: alexs@kernel.org,
	si.yanteng@linux.dev
Cc: dzm91@hust.edu.cn,
	corbet@lwn.net,
	linux-doc@vger.kernel.org,
	doubled@leap-io-kernel.com,
	yjzhang@leap-io-kernel.com
Subject: [PATCH v2 0/2] docs/zh_CN: Add translations for libsas and wd719x
Date: Sun, 23 Nov 2025 16:48:57 +0800
Message-Id: <cover.1763886358.git.yjzhang@leap-io-kernel.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9aafe6f34509d6kunm2b597d342f61aa
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkZSR9KVk0aSkNKQkpOGk0fSVYVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlKVUlLSFVKTkxVSU5JWVdZFhoPEhUdFFlBWU9LSFVKS0hKT0hMVUpLS1
	VKQktLWQY+
DKIM-Signature: a=rsa-sha256;
	b=oS2VhMySBn+wgJcKhCEzbGOo3/pEcWB7TI+pA2pP2nMhcF4r96+5HJ+MVhej7powuaUZk/npVZCW4pbJBJc25uvewtv/evbNLNWKnuG0Jcs7dIQK1dZtKQaBCY+bsSU1aLNNmPZFd1s9tvnFENJT+/NIFY0v5ZgamhmICGz0iqLyZhX3oPdYTJX8XkoRfMUrSBWw89ksBqpbcuhOs2vOlVEGNkV1MtFjFhFYPCb9fBOSC78B1XZijKrZSmr0Ah2EBCue2bCxnk4avQ+ASf/IizgDApa20U5c2Xkdr8aO3X8BUQTYZ+eLQ4BE4+OWqru190iQw1At5H86zRVr0EVK+w==; s=default; c=relaxed/relaxed; d=leap-io-kernel.com; v=1;
	bh=57eU/TCaptGGloQA0LNJpG2DSKcJYHFwfqqmx/25RAU=;
	h=date:mime-version:subject:message-id:from;

This series adds Chinese translations for libsas.rst and wd719x.rst
under docs/zh_CN.

Changes in v2:
 - Adjust document to follow RST syntax
 - Link to v1: https://lore.kernel.org/all/cover.1763112421.git.yjzhang@leap-io-kernel.com/

Yujie Zhang (2):
  docs/zh_CN: Add libsas.rst translation
  docs/zh_CN: Add wd719x.rst translation

 .../translations/zh_CN/scsi/index.rst         |   4 +-
 .../translations/zh_CN/scsi/libsas.rst        | 425 ++++++++++++++++++
 .../translations/zh_CN/scsi/wd719x.rst        |  35 ++
 3 files changed, 462 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/translations/zh_CN/scsi/libsas.rst
 create mode 100644 Documentation/translations/zh_CN/scsi/wd719x.rst

-- 
2.25.1

