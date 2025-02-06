Received: from mail-m49202.qiye.163.com (mail-m49202.qiye.163.com [45.254.49.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87E112144BE
	for <linux-doc@vger.kernel.org>; Thu,  6 Feb 2025 09:53:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738835628; cv=none; b=rVaxfxgp76sMx7qdJiVGCsd7DX4vcA2z2VVZagW7GbS19E1s57OTtMT5XWS+lDfCpzMcL+sY7L1om/WiClOgCw3dIolWA9yhhvEG0vZOP/q2hDrVEVerPC/008zka19zuCVnehKcg01em4QVynE/dtriHoUEiTntiiMuuDFjHnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738835628; c=relaxed/simple;
	bh=bd1Il8YhNCdOT6718Q/PR3th7wvdnj0ntGqZigJvrLc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ways6/AaeOZTYLLUCcf4tD1Kig6Zcxb5gNYV2CnsKs53AuqPRUwENLtRpWxQbBaVxmonVueSyrrvOWmYVhycUOHsnOr0oIdokWGQ0FphO0RY9eYF/axq6fUqqX69WgoebRl7vwris13Nkk5U6005jJBpWRZnzmhezb9GpJMymrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cqsoftware.com.cn; spf=pass smtp.mailfrom=cqsoftware.com.cn; dkim=pass (1024-bit key) header.d=cqsoftware.com.cn header.i=@cqsoftware.com.cn header.b=CqDC276V; arc=none smtp.client-ip=45.254.49.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cqsoftware.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cqsoftware.com.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cqsoftware.com.cn header.i=@cqsoftware.com.cn header.b="CqDC276V"
Received: from localhost.localdomain (unknown [1.193.57.36])
	by smtp.qiye.163.com (Hmail) with ESMTP id a51dddc6;
	Thu, 6 Feb 2025 17:38:25 +0800 (GMT+08:00)
From: zhangwei <zhangwei@cqsoftware.com.cn>
To: alexs@kernel.org,
	si.yanteng@linux.dev,
	corbet@lwn.net
Cc: zhaoshuo@cqsoftware.com.cn,
	zhaoyuehui@cqsoftware.com.cn,
	maoyuxian@cqsoftware.com.cn,
	linux-doc@vger.kernel.org,
	zhangwei <zhangwei@cqsoftware.com.cn>
Subject: [PATCH v3 2/3] Translate .../security/keys/index.rst into Chinese
Date: Thu,  6 Feb 2025 17:38:05 +0800
Message-ID: <6ec3aa295a0215bf9115267b865e4cbf19c4556d.1738833099.git.zhangwei@cqsoftware.com.cn>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <cover.1738833098.git.zhangwei@cqsoftware.com.cn>
References: <cover.1738833098.git.zhangwei@cqsoftware.com.cn>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlDQkgZVkgYSk1CHk5CTUweSFYVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlKVUpCSFVOTFVITVlXWRYaDxIVHRRZQVlPS0hVSktJT09PSFVKS0tVSk
	JLS1kG
X-HM-Tid: 0a94da9ffb6e03abkunma51dddc6
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Ok06Fjo*LTIWEghIKzYzHxFJ
	FjZPCRFVSlVKTEhDQ0hPTEtNSUNCVTMWGhIXVQETGhUcDB4SOxgKCBQdDwwaCR5VGBQWVRgVRVlX
	WRILWUFZSlVKQkhVTkxVSE1ZV1kIAVlBSktLTjcG
DKIM-Signature:a=rsa-sha256;
	b=CqDC276VqpHlqfHdto/8koe/teOb77ebj+jYNn5Lw177oiwuc63ulYJ6YgW0BhIeVxjt5E4L8mFubcDu73lVKOdkfLwiZcCpqngNcgFUhZg02dDZi59m+Sh0WoCzb/RUlOqbKar/EpFCypz8I5ci4Oll0ExDO3WWLMg3CyBT7+8=; s=default; c=relaxed/relaxed; d=cqsoftware.com.cn; v=1;
	bh=dpehSJBsa8IU0NdyN1OhvXROjRdVBmBYZBrUpA/9ECo=;
	h=date:mime-version:subject:message-id:from;

Update the translation through commit 5395d312dff0
("doc: ReSTify keys-trusted-encrypted.txt")

Signed-off-by: zhangwei <zhangwei@cqsoftware.com.cn>
---
 .../zh_CN/security/keys/index.rst             | 24 +++++++++++++++++++
 1 file changed, 24 insertions(+)
 create mode 100644 Documentation/translations/zh_CN/security/keys/index.rst

diff --git a/Documentation/translations/zh_CN/security/keys/index.rst b/Documentation/translations/zh_CN/security/keys/index.rst
new file mode 100644
index 000000000000..0bec149efc7d
--- /dev/null
+++ b/Documentation/translations/zh_CN/security/keys/index.rst
@@ -0,0 +1,24 @@
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
+
-- 
2.47.1

