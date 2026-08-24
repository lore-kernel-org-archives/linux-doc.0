Received: from zg8tmtyylji0my4xnjqumte4.icoremail.net (zg8tmtyylji0my4xnjqumte4.icoremail.net [162.243.164.118])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8FD734F27F;
	Mon, 24 Aug 2026 04:38:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.243.164.118
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787546332; cv=none; b=E58PFYYum7qa/0ibTG2t0uzVpEoj/7I6Qiqt/8YI8ApzhWSFzNK84wqLVa3FyBlPqlrJSfBaE31Th1KWp4pJvvWVbqrXCDHGeaftJa9fRitLVDbryXWYIOetj/r61NvYBareGXVZA/g8QA0dmxgPnH8K9nieigN3TqNsU1B+/ns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787546332; c=relaxed/simple;
	bh=xkS/AwMZNnEIvqwdFOunV3t2q2jmCRKWQXEZjuIIICY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WJ4yx70j0IrY6uwdNsqt1e7TDQD7nm1DjDUPzghSfwyWL1c/FIiI9n2dE/qOKuQKTrjKtalsyS8VR93gkJn2FaKJGueKEiskjNS5g3tt7ZP72e3z85zQHIrf6hPlN3xFbM5YVMJFU5aw6jyE+J752WRre2hkW2z37pSdB3HkXhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=stu.cdut.edu.cn; spf=none smtp.mailfrom=stu.cdut.edu.cn; dkim=fail (0-bit key) header.d=stu.cdut.edu.cn header.i=@stu.cdut.edu.cn header.b=0+qKWL3e reason="key not found in DNS"; arc=none smtp.client-ip=162.243.164.118
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=stu.cdut.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=stu.cdut.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=stu.cdut.edu.cn header.i=@stu.cdut.edu.cn header.b="0+qKWL3e"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=stu.cdut.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
	Message-ID:In-Reply-To:References:MIME-Version:Content-Type:
	Content-Transfer-Encoding; bh=5fyT5sOueIWHaqazumg69cEbPEfDiJAKEa
	4e6qAPR7I=; b=0+qKWL3esa/rHH/JXJZk8yVGhDlABrgaHFjlVWrPCtZUI9t2aS
	JXs+paLSS1+WeahrafwI0429sBk7VwVzIueLDC5ORhixx3HZzuKnHsFG0ffInI0z
	azOzqAXLvo7h1BMemy67BDPX2ZHcewR7QmPv+0YwUMJkLQgDGKt3VHJ2w=
Received: from anka-20eya00ycd (unknown [182.139.166.197])
	by hzbj-edu-front-4.icoremail.net (Coremail) with SMTP id BrQMCkB22cTAyotq7CuVAA--.65162S3;
	Mon, 24 Aug 2026 12:38:34 +0800 (CST)
From: Siwei Chen <anka@stu.cdut.edu.cn>
To: alexs@kernel.org,
	si.yanteng@linux.dev,
	dzm91@hust.edu.cn,
	corbet@lwn.net,
	skhan@linuxfoundation.org
Cc: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	wy@wyuan.org,
	Siwei Chen <businiaoanka@anka1.top>
Subject: [PATCH v5 1/5] docs/zh_CN: Add networking team documentation Chinese translation
Date: Mon, 24 Aug 2026 12:38:00 +0800
Message-ID: <20260824043806.46731-2-anka@stu.cdut.edu.cn>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260824043806.46731-1-anka@stu.cdut.edu.cn>
References: <20260824043806.46731-1-anka@stu.cdut.edu.cn>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:BrQMCkB22cTAyotq7CuVAA--.65162S3
X-Coremail-Antispam: 1UD129KBjvJXoW7Aw15XFy5tw1ftw4kCFyUKFg_yoW8AF4fpF
	Z8KryxKFs7WFy7A3yxGr17Gr15GF4xCw4UGr1xX3Zaqr4Dt3WvvrnFqr9Ikr17KrW0yFW5
	ZF4rtrW5Wryjy3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUPFb7Iv0xC_Cr1lb4IE77IF4wAFF20E14v26ryj6rWUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI
	8067AKxVWUGwA2048vs2IY020Ec7CjxVAFwI0_JFI_Gr1l8cAvFVAK0II2c7xJM28CjxkF
	64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVWUJVWUCwA2z4x0Y4vE2Ix0cI8IcV
	CY1x0267AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIE14v26r4j6F4UM28EF7xvwVC2z280aVCY
	1x0267AKxVW8JVW8Jr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I
	8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCF
	s4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCY1x0262kKe7AKxVWUtVW8ZwCY02Avz4
	vE14v_Gryl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG
	67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MI
	IYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E
	14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJV
	W8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUxF1v
	DUUUU
X-CM-SenderInfo: ysqsjiqyqsiiiqr623vxofv3vwohv3gofq/1tbiAQUPCWqLNzJhrAAAsr

From: Siwei Chen <businiaoanka@anka1.top>

Translate .../networking/team.rst into Chinese.

Update the translation through commit aa8a6ee3e3fc
("docs: networking: convert team.txt to ReST")

Signed-off-by: Siwei Chen <businiaoanka@anka1.top>
---
 .../translations/zh_CN/networking/index.rst      |  2 +-
 .../translations/zh_CN/networking/team.rst       | 16 ++++++++++++++++
 2 files changed, 17 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/translations/zh_CN/networking/team.rst

diff --git a/Documentation/translations/zh_CN/networking/index.rst b/Documentation/translations/zh_CN/networking/index.rst
index 333e9f6cafff..fcb8dc8f2c72 100644
--- a/Documentation/translations/zh_CN/networking/index.rst
+++ b/Documentation/translations/zh_CN/networking/index.rst
@@ -29,6 +29,7 @@
    alias
    mptcp-sysctl
    generic-hdlc
+   team
    timestamping
 
 Todolist:
@@ -136,7 +137,6 @@ Todolist:
 *   tc-queue-filters
 *   tcp_ao
 *   tcp-thin
-*   team
 *   tipc
 *   tproxy
 *   tuntap
diff --git a/Documentation/translations/zh_CN/networking/team.rst b/Documentation/translations/zh_CN/networking/team.rst
new file mode 100644
index 000000000000..e6cf19a245a1
--- /dev/null
+++ b/Documentation/translations/zh_CN/networking/team.rst
@@ -0,0 +1,16 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+.. include:: ../disclaimer-zh_CN.rst
+
+:Original: Documentation/networking/team.rst
+
+:翻译:
+
+	陈思为 Siwei Chen <businiaoanka@anka1.top>
+
+====================
+Team（网络接口聚合）
+====================
+
+Team 设备由用户空间通过 libteam 库驱动，该库位于：
+	https://github.com/jpirko/libteam
-- 
2.53.0

