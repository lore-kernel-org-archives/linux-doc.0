Received: from mail-m3295.qiye.163.com (mail-m3295.qiye.163.com [220.197.32.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3CCF80BFF
	for <linux-doc@vger.kernel.org>; Fri,  7 Feb 2025 10:19:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738923558; cv=none; b=ND6Lf2pco4u+Z0yqf1Xj/eAQa7MiRs4UnZTmSZ4/LaQ7UO8kk90dAStbAE1oR02ZHslhf8hlf7zG1O1Y7Da8OD0LcwKgMr8SVjktUigHuq2WAiSia+WGi214t1KgXDvJdBLnS+NZHMjfPQ++4GOYmNiP4Uv47NG3QWRqH9h/ozA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738923558; c=relaxed/simple;
	bh=Eg9Iy6P4nhfZd0y7KRhFmlmaJbeE8N74sLffuETqaSY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rDE7P7QQNnsVbJb4PwHvaD5yqmJVFh9E+dFrFKoa7zxXr7dPPoxhwEyoc+6GtgWU2zGgOZk+KxVXFOsQnNJcjFQeJitneMJ+1fGjZmh2tttS16Uz6ciU2aRTRew6CtZQhXssLdf52M0sATLfBoyiwzTBv0ShdpMy0uFPSzzpcBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cqsoftware.com.cn; spf=pass smtp.mailfrom=cqsoftware.com.cn; dkim=pass (1024-bit key) header.d=cqsoftware.com.cn header.i=@cqsoftware.com.cn header.b=d15PdozT; arc=none smtp.client-ip=220.197.32.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cqsoftware.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cqsoftware.com.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cqsoftware.com.cn header.i=@cqsoftware.com.cn header.b="d15PdozT"
Received: from localhost.localdomain (unknown [1.193.57.36])
	by smtp.qiye.163.com (Hmail) with ESMTP id a6b57c90;
	Fri, 7 Feb 2025 18:19:10 +0800 (GMT+08:00)
From: zhangwei <zhangwei@cqsoftware.com.cn>
To: alexs@kernel.org,
	si.yanteng@linux.dev,
	corbet@lwn.net
Cc: zhaoshuo@cqsoftware.com.cn,
	zhaoyuehui@cqsoftware.com.cn,
	maoyuxian@cqsoftware.com.cn,
	linux-doc@vger.kernel.org,
	zhangwei <zhangwei@cqsoftware.com.cn>
Subject: [PATCH v5 2/3] docs/zh_CN: Add keys index Chinese translation
Date: Fri,  7 Feb 2025 18:18:56 +0800
Message-ID: <6e55a93d889871a872a3449cb186c28fb38fd3df.1738923258.git.zhangwei@cqsoftware.com.cn>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <cover.1738923258.git.zhangwei@cqsoftware.com.cn>
References: <cover.1738923258.git.zhangwei@cqsoftware.com.cn>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkaQ09OVklCS0hPThlDGEIdT1YVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlKVUpCSFVOTFVITVlXWRYaDxIVHRRZQVlPS0hVSktJT09PSFVKS0tVSk
	JLS1kG
X-HM-Tid: 0a94dfeba8df03abkunma6b57c90
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6PS46ISo*HzITHgwDLilPDQwD
	VhkaC1FVSlVKTEhDQklITk5KTEJMVTMWGhIXVQETGhUcDB4SOxgKCBQdDwwaCR5VGBQWVRgVRVlX
	WRILWUFZSlVKQkhVTkxVSE1ZV1kIAVlBSktLTTcG
DKIM-Signature:a=rsa-sha256;
	b=d15PdozTU6jMgdBz5JKq7NfrAZYQ3XPbWh7QEYhihNzLuXJxJLNvAuyzM3qZY9VNabLfBrGPx3yfKUUq1YEmM9K7CiyYEJisZqxnOrhEB6+m///smr+oebSEYEtV1d/vvGlNTAuRzpnZcLrcqpOOx0CuSixVsAxuE2A2EN8vfzI=; s=default; c=relaxed/relaxed; d=cqsoftware.com.cn; v=1;
	bh=9wIjgq5fk9CUAg1ix5cwRvBTEUEyRBzpwEyuZANejbQ=;
	h=date:mime-version:subject:message-id:from;

Translate .../security/keys/index.rst into Chinese

Update the translation through commit 5395d312dff0
("doc: ReSTify keys-trusted-encrypted.txt")

Signed-off-by: zhangwei <zhangwei@cqsoftware.com.cn>
---
 .../zh_CN/security/keys/index.rst             | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 Documentation/translations/zh_CN/security/keys/index.rst

diff --git a/Documentation/translations/zh_CN/security/keys/index.rst b/Documentation/translations/zh_CN/security/keys/index.rst
new file mode 100644
index 000000000000..7c28d003fb0a
--- /dev/null
+++ b/Documentation/translations/zh_CN/security/keys/index.rst
@@ -0,0 +1,22 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+.. include:: ../../disclaimer-zh_CN.rst
+
+:Original: Documentation/security/keys/index.rst
+
+:翻译:
+
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

