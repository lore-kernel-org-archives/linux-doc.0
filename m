Received: from mail-m3297.qiye.163.com (mail-m3297.qiye.163.com [220.197.32.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 596ED44C94
	for <linux-doc@vger.kernel.org>; Thu,  6 Feb 2025 02:27:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.97
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738808866; cv=none; b=n6Ik4kLsXGGcCzYZigb5Xq0DQS4opPujG/JCW6lpVh0iGgUE7R4+34l9Zqk0ru/hcSdP4vcLkxZgWB1fR4p+ohw8KNp3EP5mfaywy360b4Di6AAU1RRFnYtWre+O2w0x5M7rP7Np3qVigd8OPTmjbsImCy8dVJaealhwv5cab7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738808866; c=relaxed/simple;
	bh=bd1Il8YhNCdOT6718Q/PR3th7wvdnj0ntGqZigJvrLc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ekPkmexw1oKfKKW/3SQ5HqVG9IUIEKn6lokGU9xKtvcvEbZgro++/7Zxlwei9ejJ6ATUc+AJm0hlisFhHRMl3y3juO+X9WGy3HW+FLs1GqgwIugvxXDoQxMZAEQ43Jt82aEe7oiFpJvYfSoD8gKjstfVMZegy7R/RmM6E5E9Whw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cqsoftware.com.cn; spf=pass smtp.mailfrom=cqsoftware.com.cn; dkim=pass (1024-bit key) header.d=cqsoftware.com.cn header.i=@cqsoftware.com.cn header.b=LY+r4xQa; arc=none smtp.client-ip=220.197.32.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cqsoftware.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cqsoftware.com.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cqsoftware.com.cn header.i=@cqsoftware.com.cn header.b="LY+r4xQa"
Received: from localhost.localdomain (unknown [1.193.57.36])
	by smtp.qiye.163.com (Hmail) with ESMTP id a46ac88e;
	Thu, 6 Feb 2025 10:27:39 +0800 (GMT+08:00)
From: zhangwei <zhangwei@cqsoftware.com.cn>
To: alexs@kernel.org,
	si.yanteng@linux.dev,
	corbet@lwn.net
Cc: zhaoshuo@cqsoftware.com.cn,
	zhaoyuehui@cqsoftware.com.cn,
	maoyuxian@cqsoftware.com.cn,
	linux-doc@vger.kernel.org,
	zhangwei <zhangwei@cqsoftware.com.cn>
Subject: [PATCH 2/3] Translate .../security/keys/index.rst into Chinese
Date: Thu,  6 Feb 2025 10:26:47 +0800
Message-ID: <6ec3aa295a0215bf9115267b865e4cbf19c4556d.1738807847.git.zhangwei@cqsoftware.com.cn>
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
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlCGRpJVhgdTB1DSkMYTh5JT1YVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlKVUpCSFVOTFVITVlXWRYaDxIVHRRZQVlPS0hVSktJT09PSFVKS0tVSk
	JLS1kG
X-HM-Tid: 0a94d9159d3a03abkunma46ac88e
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6PVE6GCo5SjIOLAkBUUouKjod
	PR1PCUxVSlVKTEhDQ0tDQ01KS0pMVTMWGhIXVQETGhUcDB4SOxgKCBQdDwwaCR5VGBQWVRgVRVlX
	WRILWUFZSlVKQkhVTkxVSE1ZV1kIAVlBSktLTjcG
DKIM-Signature:a=rsa-sha256;
	b=LY+r4xQayxu4eaypEeiOw5lcWN2eN6JaPbuIuqspFpmMvAhwIvfFN/ADwo93xUh4s0haDaPsNmH900k7I4tc7D3ZbeB2D+OA7UxQyKgqmZeXmQJmsybHRe6/Flo8FRMe3L20Ztl6zK55GnxuhtpPOC8TsiOa1TaOQDz3nUb5gjw=; s=default; c=relaxed/relaxed; d=cqsoftware.com.cn; v=1;
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

