Received: from zg8tmtyylji0my4xnjqumte4.icoremail.net (zg8tmtyylji0my4xnjqumte4.icoremail.net [162.243.164.118])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C2973B14BE;
	Tue, 11 Aug 2026 07:12:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.243.164.118
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786432377; cv=none; b=CD8OZowpcNoiTS1U0RB3E02JdUdKnC8a8Q7YKI5l2S8tRgZv3mLYOHHUCKNN6PJx30KyVo46/0IgD3QQ2ThA/+JoDrdghF/8yDBGNFFvH4d8VFJaGsODgGNbeAla+g/how/JZ2hxmkkMJSYWKm4iS7WUt5CH9RG//XXLS/k6Dso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786432377; c=relaxed/simple;
	bh=xkS/AwMZNnEIvqwdFOunV3t2q2jmCRKWQXEZjuIIICY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uHSmocbVfScayFGlcaMSwmpmLs9kRv9Uf8jwff6uVLjVGmIEN0eQLFJ+kK2GJ/2MCDk0xUmpHXFbOULGh+BN5I3uDm185sQfQBqthJakABA3DfdfpAUpzv91ddMvMoZuqVJ4NsOu47hnI6nwdA8HqktXhCCX5nkZbEy2rRlXV2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=stu.cdut.edu.cn; spf=none smtp.mailfrom=stu.cdut.edu.cn; dkim=fail (0-bit key) header.d=stu.cdut.edu.cn header.i=@stu.cdut.edu.cn header.b=3N8M+ZRF reason="key not found in DNS"; arc=none smtp.client-ip=162.243.164.118
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=stu.cdut.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=stu.cdut.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=stu.cdut.edu.cn header.i=@stu.cdut.edu.cn header.b="3N8M+ZRF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=stu.cdut.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
	Message-ID:In-Reply-To:References:MIME-Version:Content-Type:
	Content-Transfer-Encoding; bh=5fyT5sOueIWHaqazumg69cEbPEfDiJAKEa
	4e6qAPR7I=; b=3N8M+ZRFsjhCBvQxUJ27yLj9kJtjiqpxov8mq9vzY7rpcazTWe
	8abX2nNoRW/7l9XYIfvQ2+gZXw9BdG/o00K7M2U54g1ka3TzN0h/ZmXqaEaBM+72
	rjAVI6LkHQ+91DH7OsKP+tVnLfF/TsnhpUh9eoj8dLZfQix7/G+xIVVzY=
Received: from anka-20eya00ycd (unknown [182.139.166.32])
	by hzbj-edu-front-2.icoremail.net (Coremail) with SMTP id BLQMCkBmLxdcy3pqOiwhAA--.43334S3;
	Tue, 11 Aug 2026 15:12:34 +0800 (CST)
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
Subject: [PATCH v3 1/5] docs/zh_CN: Add networking team documentation Chinese translation
Date: Tue, 11 Aug 2026 15:11:54 +0800
Message-ID: <20260811071200.54062-2-anka@stu.cdut.edu.cn>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260811071200.54062-1-anka@stu.cdut.edu.cn>
References: <20260811071200.54062-1-anka@stu.cdut.edu.cn>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:BLQMCkBmLxdcy3pqOiwhAA--.43334S3
X-Coremail-Antispam: 1UD129KBjvJXoW7Aw15XFy5tw1ftw4kCFyUKFg_yoW8AF4fpF
	Z8KryxKFs7WFy7A3yxGr17Gr15GF4xCw4UGr1xX3Zaqr4Dt3WvvrnFqr9Ikr17KrW0yFW5
	ZF4rtrW5Wryjy3DanT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUP2b7Iv0xC_Cr1lb4IE77IF4wAFF20E14v26ryj6rWUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI
	8067AKxVWUGwA2048vs2IY020Ec7CjxVAFwI0_JFI_Gr1l8cAvFVAK0II2c7xJM28CjxkF
	64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVWUJVWUCwA2z4x0Y4vE2Ix0cI8IcV
	CY1x0267AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIE14v26F4j6r4UJwA2z4x0Y4vEx4A2jsIE
	c7CjxVAFwI0_Gr0_Gr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c
	02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE
	4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lc7CjxVAaw2AFwI0_Jw0_GFylc2xSY4
	AK67AK6r4xMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8C
	rVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8Zw
	CIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x02
	67AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr
	0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU8ds
	qJUUUUU==
X-CM-SenderInfo: ysqsjiqyqsiiiqr623vxofv3vwohv3gofq/1tbiAgUCCWp6FRFmBgAEs8

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

