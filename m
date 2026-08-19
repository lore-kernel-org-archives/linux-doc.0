Received: from mta0.migadu.com (out-39.mta0.migadu.com [91.218.175.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ED5B3BFE24
	for <linux-doc@vger.kernel.org>; Wed, 19 Aug 2026 02:55:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.39
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787108154; cv=none; b=PKLgvuet5Xj3aAatoFfEDdb7pDO7ugkovzVaCgLs+5+mc+j+zyalhG1zKgrD/t0WFEelTpTfVdwnn5kGg3pTsV4LMyYa2f1FVfzkNcjk+CIvWFBguj8WUaULn7RwWZL3ZJQoHJ4uCBkoJXLn6MKggEbcZbmFDvzmBE08pFTP850=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787108154; c=relaxed/simple;
	bh=zxWjcb4X1Iw9tXimIVoDts6LOLbhiIXv7ohDFx0fCa8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=flEEi4j8UTTuEFbD8vi3MxjABa1IG0YHnsSNgBDXsu3ai3BLPb34P/wPADdMzTcPBT06zDsNBUh/7KoyAj95F/HFTEfjvPPWIselZBv4Fk/d1ig7LFGtHazppVXGAZI8vByevp0GnaBSaymYbTDC/FhPXkHFr4XZobS/Piji1J4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=SDIKdXl2; arc=none smtp.client-ip=91.218.175.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="SDIKdXl2"
X-Envelope-To: linux-doc@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=zxWjcb4X1Iw9tXimIVoDts6LOLbhiIXv7ohDFx0fCa8=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1787108149; v=1; x=1787712949;
 b=SDIKdXl2fq8ANlBBFAtxxJbeUU+i1rqia9kd5WHla/+tRVi7j1/Q6eKxVV7lw4QTFH8T9spu
 MkVV1qUjWGVe1CHFoNs5SzDXgFDWM03L/ScfaATb9bo0RW0Np8AQnYs054MOQoSF4Ry2FaPbA5w
 Gh+6dFLJuqewr/O4mYxLJPJw=
X-Envelope-To: linux-doc@vger.kernel.org
Received: from localhost.localdomain (223.70.160.239)
	by smtp.migadu.com with ESMTPS id 3fd91cf08250d7bf;
	Wed, 19 Aug 2026 02:55:49 +0000
X-Migadu-Flow: FLOW_OUT
From: Ye Liu <ye.liu@linux.dev>
To: Alex Shi <alexs@kernel.org>,
	Yanteng Si <si.yanteng@linux.dev>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Ye Liu <liuye@kylinos.cn>,
	Dongliang Mu <dzm91@hust.edu.cn>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [RESEND PATCH v2] docs/zh_CN: sync page_table_check.rst translation
Date: Wed, 19 Aug 2026 10:55:35 +0800
Message-Id: <20260819025535.2967566-1-ye.liu@linux.dev>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Ye Liu <liuye@kylinos.cn>

Update the translation of page_table_check.rst to reflect changes in
the English original, including the clarification on corruption
detection and the new paragraph about userfaultfd wr-protect
verification.

Update the translation through commit 8430557fc584
("mm/page_table_check: support userfault wr-protect entries")

Signed-off-by: Ye Liu <liuye@kylinos.cn>
---
v2:
 - Update the commit message.

 .../translations/zh_CN/mm/page_table_check.rst         | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/Documentation/translations/zh_CN/mm/page_table_check.rst b/Documentation/translations/zh_CN/mm/page_table_check.rst
index dc34570dceff..7ba5a39db487 100644
--- a/Documentation/translations/zh_CN/mm/page_table_check.rst
+++ b/Documentation/translations/zh_CN/mm/page_table_check.rst
@@ -21,9 +21,13 @@
 当新的页面可以从用户空间访问时，页表检查通过将它们的页表项（PTEs PMD等）添加到页表中来执行额外
 的验证。
 
-在检测到损坏的情况下，内核会被崩溃。页表检查有一个小的性能和内存开销。因此，它在默认情况下是禁用
-的，但是在额外的加固超过性能成本的系统上，可以选择启用。另外，由于页表检查是同步的，它可以帮助调
-试双映射内存损坏问题，在错误的映射发生时崩溃内核，而不是在内存损坏错误发生后内核崩溃。
+在检测到大多数类型的损坏时，内核会崩溃。页表检查有一个小的性能和内存开销。因此，它在默认情况下是
+禁用的，但是在额外的加固超过性能成本的系统上，可以选择启用。另外，由于页表检查是同步的，它可以帮
+助调试双映射内存损坏问题，在错误的映射发生时崩溃内核，而不是在内存损坏错误发生后内核崩溃。
+
+页表检查还可用于对各种标志进行页表项检查，在检测到非法的标志组合时输出警告。目前，userfaultfd 是
+唯一的使用者，用于对 wr-protect 位与任何可写标志进行一致性检查。在这种情况下，非法的标志组合不会
+立即直接导致数据损坏，但会使只读数据变为可写，从而在后续修改页面内容时导致损坏。
 
 双重映射检测逻辑
 ================
-- 
2.25.1

