Received: from mail-m1973175.qiye.163.com (mail-m1973175.qiye.163.com [220.197.31.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 544E12417F5
	for <linux-doc@vger.kernel.org>; Fri,  7 Feb 2025 02:29:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.75
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738895350; cv=none; b=F49k0YJ9cgJl6qOIVe9SWzjtvuNF/Rv9LVHPh08aO8jKZs66fpdpVOLxYN/EcMUFoehOBcUGzEOBYbiNZb8+YgYcWBf5PN2h8fZV6FnpZO7gCJV31V6gEVdMizSRhLqrNFTvUQCI6IxtKbiLO1oHelSC669VmpHDQMLQjJnZBs0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738895350; c=relaxed/simple;
	bh=iBENFk4M0P/Xib62oE/44Ole1AZlHf9cEbvlrje9H5w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iPxCzE7MnhkIAxD6qRjyNph+PO2xI16Mow+swk/u+pf/JOcc1uqrnFnXIy+eJ6Pdh/xMJpwnYlYaZi4pfV8ZGsct+gDycp0jU/Uu65qpGUXMrJFsVljxL7bFd7kneymnz5k/b2qvpRumrtkrLodCPT998yefyyjPxUjVgCgCK0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cqsoftware.com.cn; spf=pass smtp.mailfrom=cqsoftware.com.cn; dkim=pass (1024-bit key) header.d=cqsoftware.com.cn header.i=@cqsoftware.com.cn header.b=Azp9QQEA; arc=none smtp.client-ip=220.197.31.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cqsoftware.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cqsoftware.com.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cqsoftware.com.cn header.i=@cqsoftware.com.cn header.b="Azp9QQEA"
Received: from localhost.localdomain (unknown [1.193.57.36])
	by smtp.qiye.163.com (Hmail) with ESMTP id a5ec2cb4;
	Fri, 7 Feb 2025 10:23:49 +0800 (GMT+08:00)
From: zhangwei <zhangwei@cqsoftware.com.cn>
To: alexs@kernel.org,
	si.yanteng@linux.dev,
	corbet@lwn.net
Cc: zhaoshuo@cqsoftware.com.cn,
	zhaoyuehui@cqsoftware.com.cn,
	maoyuxian@cqsoftware.com.cn,
	linux-doc@vger.kernel.org,
	zhangwei <zhangwei@cqsoftware.com.cn>
Subject: [PATCH v4 2/3] docs/zh_CN: Add keys index Chinese translation
Date: Fri,  7 Feb 2025 10:23:26 +0800
Message-ID: <02843f1e6bcab0fdf5b2433bc3762b51f84a963c.1738835231.git.zhangwei@cqsoftware.com.cn>
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
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkaSkJLVh4YSUsfSk9ISB4YH1YVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlKVUpCSFVOTFVITVlXWRYaDxIVHRRZQVlPS0hVSktJT09PSFVKS0tVSk
	JLS1kG
X-HM-Tid: 0a94de3873c303abkunma5ec2cb4
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6MC46Nhw6SzIJNA4VFxBNAUMK
	IhIKFApVSlVKTEhDQ0JOS0hLSkhNVTMWGhIXVQETGhUcDB4SOxgKCBQdDwwaCR5VGBQWVRgVRVlX
	WRILWUFZSlVKQkhVTkxVSE1ZV1kIAVlBSktOTTcG
DKIM-Signature:a=rsa-sha256;
	b=Azp9QQEABlnfvJy+UQV25hJ05zzxIkiw4GARr6Bm/rkJUiNA/ym1JmoSzP8jQy2QP3t/b/j4qwn5OMM2tX/WUips0mBN6wMEL8+K/DgDCFS2skA5wyez8ljFu1BEfA4ZGMPUfvZ0h2HvsQc4Cv7L2/kLQ2DkgTPBrJ/+9QDWVP0=; s=default; c=relaxed/relaxed; d=cqsoftware.com.cn; v=1;
	bh=PKcueO0TANPZ2mnZnluzK5icW291Igu5G40++cDYlCI=;
	h=date:mime-version:subject:message-id:from;

Translate .../security/keys/index.rst into Chinese

Update the translation through commit 5395d312dff0
("doc: ReSTify keys-trusted-encrypted.txt")

Signed-off-by: zhangwei <zhangwei@cqsoftware.com.cn>
---
 .../zh_CN/security/keys/index.rst             | 23 +++++++++++++++++++
 1 file changed, 23 insertions(+)
 create mode 100644 Documentation/translations/zh_CN/security/keys/index.rst

diff --git a/Documentation/translations/zh_CN/security/keys/index.rst b/Documentation/translations/zh_CN/security/keys/index.rst
new file mode 100644
index 000000000000..1c26e027aed1
--- /dev/null
+++ b/Documentation/translations/zh_CN/security/keys/index.rst
@@ -0,0 +1,23 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+.. include:: ../../disclaimer-zh_CN.rst
+
+:Original: Documentation/security/keys/index.rst
+
+:翻译:
+
+  张巍 Wei Zhang <zhangwei@cqsoftware.com.cn>
+
+========
+内核密钥
+========
+
+.. toctree::
+   :maxdepth: 1
+
+
+TODOLIST:
+* core
+* ecryptfs
+* request-key
+* trusted-encrypted
-- 
2.47.1

