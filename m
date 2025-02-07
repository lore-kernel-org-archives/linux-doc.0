Received: from mail-m19731112.qiye.163.com (mail-m19731112.qiye.163.com [220.197.31.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B70DF80BFF
	for <linux-doc@vger.kernel.org>; Fri,  7 Feb 2025 10:24:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.112
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738923867; cv=none; b=I146Cqy9h3i0oh0eiof9RibuDOAsSwBnyW1X6fDc/93r9sRKNuhxyz+ELu0UJ0R230JFOzbV05jJA65FbepN3WpXSe9L/mRmP3ni2iHsqs9pIF78Z2ao7j5fJAnpXL5xMgkcOjlxiFUdSyHM/JzoCNuEk/YOCyUWT9wvXCheLoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738923867; c=relaxed/simple;
	bh=Riew5X7GyhQk7kvLncFkJGmHKYNaYBdvD8SbNfCNc64=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XaBynuI/+WkgKM60pSVcgFNWfgYWYgbBy/Fk1NlQfR04vUR0r7KuFYlU6k70kHk2LzCU48mNp7byXxoZtXLOYiJlqJoZZxhTIzEVudBO8upZS1D7eckyPIR8jxLYSlSdM5D8AeFxmbVFv905Zcs6/uydOCfBz2Xd6CaMSwLq53o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cqsoftware.com.cn; spf=pass smtp.mailfrom=cqsoftware.com.cn; dkim=pass (1024-bit key) header.d=cqsoftware.com.cn header.i=@cqsoftware.com.cn header.b=fnPOSYX3; arc=none smtp.client-ip=220.197.31.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cqsoftware.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cqsoftware.com.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cqsoftware.com.cn header.i=@cqsoftware.com.cn header.b="fnPOSYX3"
Received: from localhost.localdomain (unknown [1.193.57.36])
	by smtp.qiye.163.com (Hmail) with ESMTP id a6b57c88;
	Fri, 7 Feb 2025 18:19:07 +0800 (GMT+08:00)
From: zhangwei <zhangwei@cqsoftware.com.cn>
To: alexs@kernel.org,
	si.yanteng@linux.dev,
	corbet@lwn.net
Cc: zhaoshuo@cqsoftware.com.cn,
	zhaoyuehui@cqsoftware.com.cn,
	maoyuxian@cqsoftware.com.cn,
	linux-doc@vger.kernel.org,
	zhangwei <zhangwei@cqsoftware.com.cn>
Subject: [PATCH v5 0/3] Translation self-protection.rst into chinese
Date: Fri,  7 Feb 2025 18:18:54 +0800
Message-ID: <cover.1738923258.git.zhangwei@cqsoftware.com.cn>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkaShlMVkwaSUxNSEwfTEhJT1YVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlKVUpCSFVOTFVITVlXWRYaDxIVHRRZQVlPS0hVSktJT09PSFVKS0tVSk
	JLS1kG
X-HM-Tid: 0a94dfeb9d1f03abkunma6b57c88
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Kzo6Dio*CjIVSwwIUSkZDUgf
	GCowFBVVSlVKTEhDQklITk9DQ09NVTMWGhIXVQETGhUcDB4SOxgKCBQdDwwaCR5VGBQWVRgVRVlX
	WRILWUFZSlVKQkhVTkxVSE1ZV1kIAVlBSktPSTcG
DKIM-Signature:a=rsa-sha256;
	b=fnPOSYX3XYryzNLPeARrCxXBWhai4xyHP5k0NFLu2dakv4VZFHCt3afcN9PRs739X0c7QUyWHKzOlOgU9aoggIMeYJBFPygT714U8NPgkCMKu07mMC1r1kZwh19Dzo+benyGinWCoUH88XWkwjDIBrD0CqJ0YJYIAIhSqNAK2Wc=; s=default; c=relaxed/relaxed; d=cqsoftware.com.cn; v=1;
	bh=58zYHx4URjNyfsMPG7/Sf6nHxXvmbyWEg7woW6lzVAg=;
	h=date:mime-version:subject:message-id:from;

Translate self-protection.rst into Chinese
and add index.rst under keys and secrets

Changelog
v5:
  * Delete my signature in the index file

v4:
  * fix remove the blank lines in keys/index.rst

v3:
  * add index.rst under keys and secrets

v2:
  * fix remove the unnecessary blank lines

zhangwei (3):
  docs/zh_CN: Add self-protection index Chinese translation
  docs/zh_CN: Add keys index Chinese translation
  docs/zh_CN: Add secrets index Chinese translation

 .../translations/zh_CN/security/index.rst     |   2 +-
 .../zh_CN/security/keys/index.rst             |  22 ++
 .../zh_CN/security/secrets/index.rst          |  17 ++
 .../zh_CN/security/self-protection.rst        | 271 ++++++++++++++++++
 4 files changed, 311 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/translations/zh_CN/security/keys/index.rst
 create mode 100644 Documentation/translations/zh_CN/security/secrets/index.rst
 create mode 100644 Documentation/translations/zh_CN/security/self-protection.rst

-- 
2.47.1

