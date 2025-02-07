Received: from mail-m49234.qiye.163.com (mail-m49234.qiye.163.com [45.254.49.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2EA31494DD
	for <linux-doc@vger.kernel.org>; Fri,  7 Feb 2025 02:24:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738895045; cv=none; b=gqaXdRJIwIjDLVU9pok8ieDrbjNNe8HDyrS6ucoopV2HanxM0LjCwU0stBgfyZATavuh56TNz9xcxm6CTI42PDq+No63/RnENU52wyoww8CMJKtcq+54oMhY4r0Q73HcED1GuXc63pCBvjcmcYxg02yhRmH91mlbcLUZjBYBq2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738895045; c=relaxed/simple;
	bh=F0jGxwlchVG4PgGif+O6y60wgP1fAaQfuhRURNAAeBg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DrL3ArSEYiaEtsvFjMxdjBCJl4hXELH/FLkBqUvpYOLE7k5etVCQA5FBHnxR3f3lxOUz713zHtANIrqLG/ozW1yJznWCLPlAgrraJuEjfjyHnpzAMXxX/QjhN7lr5CocM7mNwVykVuGy9oY6s2/J96LwnV7CF+qF+7eLAywykRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cqsoftware.com.cn; spf=pass smtp.mailfrom=cqsoftware.com.cn; dkim=pass (1024-bit key) header.d=cqsoftware.com.cn header.i=@cqsoftware.com.cn header.b=fD6swP7T; arc=none smtp.client-ip=45.254.49.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cqsoftware.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cqsoftware.com.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cqsoftware.com.cn header.i=@cqsoftware.com.cn header.b="fD6swP7T"
Received: from localhost.localdomain (unknown [1.193.57.36])
	by smtp.qiye.163.com (Hmail) with ESMTP id a5ec2cc9;
	Fri, 7 Feb 2025 10:23:53 +0800 (GMT+08:00)
From: zhangwei <zhangwei@cqsoftware.com.cn>
To: alexs@kernel.org,
	si.yanteng@linux.dev,
	corbet@lwn.net
Cc: zhaoshuo@cqsoftware.com.cn,
	zhaoyuehui@cqsoftware.com.cn,
	maoyuxian@cqsoftware.com.cn,
	linux-doc@vger.kernel.org,
	zhangwei <zhangwei@cqsoftware.com.cn>
Subject: [PATCH v4 3/3] docs/zh_CN: Add secrets index Chinese translation
Date: Fri,  7 Feb 2025 10:23:27 +0800
Message-ID: <aa63044a75111d87086a6dfbbda7d6e608df4391.1738835231.git.zhangwei@cqsoftware.com.cn>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <cover.1738835231.git.zhangwei@cqsoftware.com.cn>
References: <cover.1738835231.git.zhangwei@cqsoftware.com.cn>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkaGUtIVkxPShlLTBpIShhKSFYVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlKVUpCSFVOTFVITVlXWRYaDxIVHRRZQVlPS0hVSktJT09PSFVKS0tVSk
	JLS1kG
X-HM-Tid: 0a94de38859403abkunma5ec2cc9
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6PU06CAw*SDIILA4LFxYSAVYv
	LlYaCU5VSlVKTEhDQ0JOS0hPQ0tKVTMWGhIXVQETGhUcDB4SOxgKCBQdDwwaCR5VGBQWVRgVRVlX
	WRILWUFZSlVKQkhVTkxVSE1ZV1kIAVlBSktITzcG
DKIM-Signature:a=rsa-sha256;
	b=fD6swP7T9Hqe3L1g+V+xXp0khpkfw4iB4mZ3bD7jfZz/OIBCcJCA+JzYuYcq1x1Q8D0X8JlFEjAV4RK4U0X9J5Ssx8SgZrt6IkFSrY7WZq6hImzTTIl/GsEA/IqWLzHWv1Bc7Lo2ORFcl0BE9V7ujI8oM29vZjIM2lDUApr90+Q=; s=default; c=relaxed/relaxed; d=cqsoftware.com.cn; v=1;
	bh=zidLHu3+xlNbTAJ+e2v8/qTnR5jSzxAUHJgxWTRq7v4=;
	h=date:mime-version:subject:message-id:from;

Translate .../security/secrets/index.rst into Chinese

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

