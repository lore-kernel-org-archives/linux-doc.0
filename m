Received: from mail-m49203.qiye.163.com (mail-m49203.qiye.163.com [45.254.49.203])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A827226CFD
	for <linux-doc@vger.kernel.org>; Mon, 17 Nov 2025 03:46:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.203
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763351182; cv=none; b=XADiRtEpNz/YIFhd2DsHOx/jRXVuk+D3b3OHKS1lz3wdJcp3H8U27wvkUDNbMh7ECjptNgunSexKze1iNGMKCJaC6Z/3eddPqfXfou/HBK2WX072tCDFwnHT8qNpAHYWTVuCzfIdG3xAaO+fqAfofKJq0+IVX7Wt+qdxFEbZ56I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763351182; c=relaxed/simple;
	bh=92j1eQ2Lwg95zKDFnniVX9unUcEuR8nPaqOwwnw/QNc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=K97wPw8NCxXqViMdKYPa3EKdyeRttrFtB8Ymik3CVSEpM0VxvTwVQtK+rP06xNTZJqgreyf2Y9wpU7LCaLXMA0hSx9lTwTx5wZOxzcmEINQxhJykJfkJ1hih805eJwQe2NKzF3qJyrZS4XZC2OVNrV6zD3jlfl7or8UmgLNdXSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leap-io-kernel.com; spf=pass smtp.mailfrom=leap-io-kernel.com; dkim=pass (2048-bit key) header.d=leap-io-kernel.com header.i=@leap-io-kernel.com header.b=YKA6JY/J; arc=none smtp.client-ip=45.254.49.203
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leap-io-kernel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leap-io-kernel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leap-io-kernel.com header.i=@leap-io-kernel.com header.b="YKA6JY/J"
Received: from localhost.localdomain (unknown [1.203.157.252])
	by smtp.qiye.163.com (Hmail) with ESMTP id 29c9141de;
	Mon, 17 Nov 2025 11:46:11 +0800 (GMT+08:00)
From: ke zijie <kezijie@leap-io-kernel.com>
To: alexs@kernel.org,
	si.yanteng@linux.dev
Cc: dzm91@hust.edu.cn,
	corbet@lwn.net,
	linux-doc@vger.kernel.org,
	wangyuli@aosc.io,
	doubled@leap-io-kernel.com
Subject: [PATCH v2 1/3] docs/zh_CN: Add block/index.rst translation
Date: Mon, 17 Nov 2025 11:46:08 +0800
Message-Id: <dceb4c59bc0d9a02246386cfed31a543d6a943b8.1763350407.git.kezijie@leap-io-kernel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1763350407.git.kezijie@leap-io-kernel.com>
References: <cover.1763350407.git.kezijie@leap-io-kernel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9a8feb921109d8kunm4b5bfed13c77289
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlCSEJJVkxOGR1ISEpPGUtDSVYVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlKVUlLSFVKTkxVSU5JWVdZFhoPEhUdFFlBWU9LSFVKS0lCQ0NMVUpLS1
	VLWQY+
DKIM-Signature: a=rsa-sha256;
	b=YKA6JY/JuZO+4MsW+Q5qNeP1XBvwuWX5HQS9IMDo5zbEY5RrIo9ed8eElqNnDEUecl7kpsNlukWKonXIhBknWHXYn6TWk+9pUIj3OyESfuE07Shf6Snku/ePSKceDAX7c1MQIEV4QYGPoOAUAuqOwlabYAuM3SR5Da+knz8ZbwEIKUzAu4DK7LoKeY9pOZqGOSqDXi9JNvfRZNy5peJDwud6FCi8LKK07L+MHvfOw04xgDfZ/shenqgf3TLBJWfdLVd8gfv22P/JXAuCKEb7CCxb883SALEee6IyAOrLD+j8VoAmVYFbXaff2QfwMGCwf7eIiun2wtTvacspWdFWTw==; c=relaxed/relaxed; s=default; d=leap-io-kernel.com; v=1;
	bh=r3t2+sDKsOuCSrzwyDlFLNX+l9rXXatPmI7WVgx/fFc=;
	h=date:mime-version:subject:message-id:from;

Translate .../block/index.rst into Chinese and update subsystem-apis.rst
translation.

Update the translation through commit 56cdea92ed91
("Documentation/block: drop the request.rst file")

Signed-off-by: ke zijie <kezijie@leap-io-kernel.com>
---
 .../translations/zh_CN/block/index.rst        | 36 +++++++++++++++++++
 .../translations/zh_CN/subsystem-apis.rst     |  1 -
 2 files changed, 36 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/translations/zh_CN/block/index.rst

diff --git a/Documentation/translations/zh_CN/block/index.rst b/Documentation/translations/zh_CN/block/index.rst
new file mode 100644
index 000000000000..45172f6d2659
--- /dev/null
+++ b/Documentation/translations/zh_CN/block/index.rst
@@ -0,0 +1,36 @@
+.. SPDX-License-Identifier: GPL-2.0
+.. include:: ../disclaimer-zh_CN.rst
+
+:Original: Documentation/block/index.rst
+
+:翻译:
+
+ 柯子杰 kezijie <kezijie@leap-io-kernel.com>
+
+:校译:
+
+
+
+=====
+Block
+=====
+
+.. toctree::
+   :maxdepth: 1
+
+TODOList:
+* bfq-iosched
+* biovecs
+* blk-mq
+* cmdline-partition
+* data-integrity
+* deadline-iosched
+* inline-encryption
+* ioprio
+* kyber-iosched
+* null_blk
+* pr
+* stat
+* switching-sched
+* writeback_cache_control
+* ublk
\ No newline at end of file
diff --git a/Documentation/translations/zh_CN/subsystem-apis.rst b/Documentation/translations/zh_CN/subsystem-apis.rst
index 0f121f9b0f70..830217140fb6 100644
--- a/Documentation/translations/zh_CN/subsystem-apis.rst
+++ b/Documentation/translations/zh_CN/subsystem-apis.rst
@@ -75,7 +75,6 @@ TODOList:

 TODOList:

-* block/index
 * cdrom/index
 * target/index

--
2.25.1

