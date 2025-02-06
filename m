Received: from mail-m21472.qiye.163.com (mail-m21472.qiye.163.com [117.135.214.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 577F9524C
	for <linux-doc@vger.kernel.org>; Thu,  6 Feb 2025 07:03:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.214.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738825427; cv=none; b=IDGJ4Y/bTuyLwQj8vRCUcoBM28TGn1MSYIeJ/UxWtLzWfEi67TOsXlo3iUqlprN9gxwwoInD/o9zmatOXW5ks742ff5n/Kr6WRMAwHpkZaHWLpfMj7rTqC5PUw1SBpMgK+lHhENnli1xPRy+1yDq0u1alwSmYZ7w6ifzPmeBil8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738825427; c=relaxed/simple;
	bh=3FS7a7B4CGvxIl1bxQXd2Sj9A1R0zNw0wSdXnN8KDQg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=n3DqvnVhUa1vrpcPPz+BD4Xkx8xA2PFufuvlxqQstJczCDDRTtOoyTENQx5vYV0zNjGBW9C+dcwy93d0gdZI6hyP/kgRe2j5g19LGda388ipq7Tajh+SOHBnvP5AB2+C5hgNnp9Dy5szenjiQIjKvLl9W5VFEO3n3K3S5EPU2Jc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cqsoftware.com.cn; spf=pass smtp.mailfrom=cqsoftware.com.cn; dkim=pass (1024-bit key) header.d=cqsoftware.com.cn header.i=@cqsoftware.com.cn header.b=Y/CZrlOh; arc=none smtp.client-ip=117.135.214.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cqsoftware.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cqsoftware.com.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cqsoftware.com.cn header.i=@cqsoftware.com.cn header.b="Y/CZrlOh"
Received: from localhost.localdomain (unknown [1.193.57.36])
	by smtp.qiye.163.com (Hmail) with ESMTP id a46ac897;
	Thu, 6 Feb 2025 10:27:42 +0800 (GMT+08:00)
From: zhangwei <zhangwei@cqsoftware.com.cn>
To: alexs@kernel.org,
	si.yanteng@linux.dev,
	corbet@lwn.net
Cc: zhaoshuo@cqsoftware.com.cn,
	zhaoyuehui@cqsoftware.com.cn,
	maoyuxian@cqsoftware.com.cn,
	linux-doc@vger.kernel.org,
	zhangwei <zhangwei@cqsoftware.com.cn>
Subject: [PATCH 3/3] Translate .../security/secrets/index.rst into Chinese
Date: Thu,  6 Feb 2025 10:26:48 +0800
Message-ID: <3e62158115e2e2bae2a14ab92f8334331b201434.1738807847.git.zhangwei@cqsoftware.com.cn>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <cover.1738807847.git.zhangwei@cqsoftware.com.cn>
References: <cover.1738807847.git.zhangwei@cqsoftware.com.cn>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkZHk9IVkxIS01PShpISUMfS1YVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlKVUpCSFVOTFVITVlXWRYaDxIVHRRZQVlPS0hVSktJT09PSFVKS0tVSk
	JLS1kG
X-HM-Tid: 0a94d915a70e03abkunma46ac897
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6MCo6Eww*ITIKHgkoLlYdKjEz
	LBZPCQNVSlVKTEhDQ0tDQ01IT0pDVTMWGhIXVQETGhUcDB4SOxgKCBQdDwwaCR5VGBQWVRgVRVlX
	WRILWUFZSlVKQkhVTkxVSE1ZV1kIAVlBQkxMNwY+
DKIM-Signature:a=rsa-sha256;
	b=Y/CZrlOhibNFVngQziH5NkytSTLsUJ6yogJOEIzRQMoaCPboc9+t+Jk03QcU+1jVhy6aAKtMAHW2ls4ysfQ4voV4elPEKhDxLbS7uW5lG5uuVEzibxS1AGwuv9wbYg93xoh5SJjEiv6DSwxG1sxFX5w68NqDOx8nBP9Q6enRBFo=; s=default; c=relaxed/relaxed; d=cqsoftware.com.cn; v=1;
	bh=ZE8oydAjAa283gxpQGc+8YS5Zu14A1NjqWhrZEosJbQ=;
	h=date:mime-version:subject:message-id:from;

Update the translation through commit 7419995a331c
("docs: security: Add secrets/coco documentation")

Signed-off-by: zhangwei <zhangwei@cqsoftware.com.cn>
---
 .../zh_CN/security/secrets/index.rst           | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 Documentation/translations/zh_CN/security/secrets/index.rst

diff --git a/Documentation/translations/zh_CN/security/secrets/index.rst b/Documentation/translations/zh_CN/security/secrets/index.rst
new file mode 100644
index 000000000000..bc360522135e
--- /dev/null
+++ b/Documentation/translations/zh_CN/security/secrets/index.rst
@@ -0,0 +1,18 @@
+.. SPDX-License-Identifier: GPL-2.0
+.. include:: ../../disclaimer-zh_CN.rst
+
+:Original: Documentation/security/secrets/index.rst
+
+:翻译:
+ 张巍 Wei Zhang <zhangwei@cqsoftware.com.cn>
+
+=====================
+密钥文档
+=====================
+
+.. toctree::
+
+
+TODOLIST:
+
+* coco
-- 
2.47.1

