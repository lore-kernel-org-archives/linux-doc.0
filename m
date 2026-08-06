Received: from out-172.mta0.migadu.com (out-172.mta0.migadu.com [91.218.175.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0100738E8A6
	for <linux-doc@vger.kernel.org>; Thu,  6 Aug 2026 01:31:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785979867; cv=none; b=QrJgeRArzG1vTQwXkkq92waLEAVmDiRKc4x4KeFLx7BgDavH2O1Al4QyANfEXwlC1UGDbzNlTcs5Ke8kaA33La1MymZzqXHV8E1WdEDrZID7A9emh+vNyE3dgZW9m1sRlv4AWZqHnqNnbYG4/AE68aerKruy+/1/QcvSGPJrf+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785979867; c=relaxed/simple;
	bh=zxWjcb4X1Iw9tXimIVoDts6LOLbhiIXv7ohDFx0fCa8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=BMMN/TKwYXetmetwuiNNQiQNJRf1dJpcPjX5k8jw0E3pEf46vDwv6HpsXTlkdOyvgAZXLmP0OXwcKOLL32pZ+L40MiuUg8sMqDPNOHs+GTRS8ACXb5ZLylL7HrutjfL0zvI1gPEiGHzhanMjT1tOtdO9TaEU6SqloXeZ2cYl15k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=hiAM6j6d; arc=none smtp.client-ip=91.218.175.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="hiAM6j6d"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1785979861;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=97O2rgb7/Rt9aFUmLp5hoCt8bE+pGi8HovBA2l4IRR4=;
	b=hiAM6j6dtnreiKNgEseMfGUMBjLobCrz6PcTAj1gOENH90tAMG749sgZD6PM8ozc9VAVTb
	8eZJmH7l8PfcPhYvua6U/abETBnarhOXYvuiauahrye7QFGD5aCOzYxkVffeFJmhnyz7n0
	FGyMbIH2M2AqdVTUkuvCxpf2nu6qhZE=
From: Ye Liu <ye.liu@linux.dev>
To: Alex Shi <alexs@kernel.org>,
	Yanteng Si <si.yanteng@linux.dev>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Ye Liu <liuye@kylinos.cn>,
	Dongliang Mu <dzm91@hust.edu.cn>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] docs/zh_CN: sync page_table_check.rst translation
Date: Thu,  6 Aug 2026 09:30:55 +0800
Message-Id: <20260806013055.2690464-1-ye.liu@linux.dev>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

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

