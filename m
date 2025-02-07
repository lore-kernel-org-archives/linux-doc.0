Received: from mail-m21469.qiye.163.com (mail-m21469.qiye.163.com [117.135.214.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CBE22417E0
	for <linux-doc@vger.kernel.org>; Fri,  7 Feb 2025 02:39:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.214.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738895947; cv=none; b=ltk+t2Oo84a778f4W8er8KTBO22qf0wfWIJAqngDddi+O3/f2JlUS4/BoAXzqfw+UF3jUIxPmUlkpZqGEryxN5j6CfAKDZLN21mXCWBbNunhW0dnc52qnQVyp3OSkMbHJE12dIN2bmsO+tBMsNAbe6gCjLDTAQ68f5m4xTV3wxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738895947; c=relaxed/simple;
	bh=PQwbavfR4J9TiUN6Xx6YAXuo/1wKbtvuQy8LvcX5b8A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YYUd8LcxB9spNCrRlrUifw4tWklO6xBYti2JxQ/j+76+U/eJ1CNacEHvCrWFp6eJv4rT9+TaKm2jUYgtwm43xFU00ISrpSlHqn1iRhjUDvGQmsVznIOoTuikXTFUmrUCUHZEr4GEYTqPGPNQaKk4qRzdPPuKVhboIpiTkiTboJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cqsoftware.com.cn; spf=pass smtp.mailfrom=cqsoftware.com.cn; dkim=pass (1024-bit key) header.d=cqsoftware.com.cn header.i=@cqsoftware.com.cn header.b=BlU/RhxI; arc=none smtp.client-ip=117.135.214.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cqsoftware.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cqsoftware.com.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cqsoftware.com.cn header.i=@cqsoftware.com.cn header.b="BlU/RhxI"
Received: from localhost.localdomain (unknown [1.193.57.36])
	by smtp.qiye.163.com (Hmail) with ESMTP id a5ec2c9e;
	Fri, 7 Feb 2025 10:23:43 +0800 (GMT+08:00)
From: zhangwei <zhangwei@cqsoftware.com.cn>
To: alexs@kernel.org,
	si.yanteng@linux.dev,
	corbet@lwn.net
Cc: zhaoshuo@cqsoftware.com.cn,
	zhaoyuehui@cqsoftware.com.cn,
	maoyuxian@cqsoftware.com.cn,
	linux-doc@vger.kernel.org,
	zhangwei <zhangwei@cqsoftware.com.cn>
Subject: [PATCH v4 0/3] Translation self-protection.rst into chinese
Date: Fri,  7 Feb 2025 10:23:24 +0800
Message-ID: <cover.1738835231.git.zhangwei@cqsoftware.com.cn>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlDGUgdVkgZGkJJS0hDQkkYQ1YVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlKVUpCSFVOTFVITVlXWRYaDxIVHRRZQVlPS0hVSktJT09PSFVKS0tVSk
	JLS1kG
X-HM-Tid: 0a94de385eaf03abkunma5ec2c9e
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Nhw6DQw*QjIWQw4aPRASAU8P
	CB4aCQNVSlVKTEhDQ0JOS0lPTU9PVTMWGhIXVQETGhUcDB4SOxgKCBQdDwwaCR5VGBQWVRgVRVlX
	WRILWUFZSlVKQkhVTkxVSE1ZV1kIAVlBSktLSTcG
DKIM-Signature:a=rsa-sha256;
	b=BlU/RhxI3gJFlHK2mklOnHNvkRWlZU9+g8x04DC/jzaLHZaiJnbWhxkEHgAk9MGPc+fY0C+4ixSMb0+GDaB7GgxbXqjJGhF94XuC4Hst519eqCBglk4mXEtnmUtD9OuN/jCVy8FR3FraQbte/+zJ7Ar11gAW9kTfRSi+wyRmRXc=; s=default; c=relaxed/relaxed; d=cqsoftware.com.cn; v=1;
	bh=8yegOeIRDZjq091MOvg1vYEDH0HwrDmPoL2J1Gu93kE=;
	h=date:mime-version:subject:message-id:from;

Translate self-protection.rst into Chinese
and add index.rst under keys and secrets

Changelog
v4:
  * fix remove the blank lines in keys/index.rst

v3:
  * add index.rst under keys and secrets

v2:
  * fix remove the unnecessary blank lines


zhangwei (3):
  docs/zh_CN: Add self-protection index Chinese translation
  Translate .../security/keys/index.rst into Chinese
  Translate .../security/secrets/index.rst into Chinese

 .../translations/zh_CN/security/index.rst     |   2 +-
 .../zh_CN/security/keys/index.rst             |  23 ++
 .../zh_CN/security/secrets/index.rst          |  18 ++
 .../zh_CN/security/self-protection.rst        | 271 ++++++++++++++++++
 4 files changed, 313 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/translations/zh_CN/security/keys/index.rst
 create mode 100644 Documentation/translations/zh_CN/security/secrets/index.rst
 create mode 100644 Documentation/translations/zh_CN/security/self-protection.rst

-- 
2.47.1

