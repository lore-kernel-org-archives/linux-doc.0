Received: from zg8tmtyylji0my4xnjqumte4.icoremail.net (zg8tmtyylji0my4xnjqumte4.icoremail.net [162.243.164.118])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C1F23B14BA;
	Tue, 11 Aug 2026 07:12:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.243.164.118
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786432380; cv=none; b=RWPuUN9Z2XgcIuMSqWeVEbK2mcxbOB0znXsGrvvPtZJ17OuWUAqryfwX7lTCd2T+kWaZX7akf/XLNvV/W1H4dPL2tBosFGYGV0SxE7jULGhIvFVcZhg6hmqVlmqxGBov3iSrhYFLHldZFAfTm9+ANF/u5nFTZEt9CwSgL6nfYYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786432380; c=relaxed/simple;
	bh=LqezzVomYRXRANba0jOtnYdqHL+ndD0TDk30vtC4rOY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=X9i2NkhTK1qwbDREHFP467qY8mKg0MQVIc70Yd76ZpbQdsyKMKKYyrLx4PyC5wM/Ucrl4TuHzxDSBBokRocoRUjhMRJcjzlteOPAW4QTWGa4BV1GqcF2SCPCmMfhyyL2sXibs5+fdHoY7J/7ibslmHqe7T7LE3SVq9o4UIlkQ3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=stu.cdut.edu.cn; spf=none smtp.mailfrom=stu.cdut.edu.cn; dkim=fail (0-bit key) header.d=stu.cdut.edu.cn header.i=@stu.cdut.edu.cn header.b=36PLeEzs reason="key not found in DNS"; arc=none smtp.client-ip=162.243.164.118
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=stu.cdut.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=stu.cdut.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=stu.cdut.edu.cn header.i=@stu.cdut.edu.cn header.b="36PLeEzs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=stu.cdut.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
	Message-ID:In-Reply-To:References:MIME-Version:Content-Type:
	Content-Transfer-Encoding; bh=WsczyxmxNyMUEb3+xH4lN2iTUTGevuwzJh
	d3hYJzsNs=; b=36PLeEzsBZyjUIma+juh75/T9CyV3L86BZkkD+TL0gtGgz+c65
	Ut+blZjudLbIaHxkw3Duxh9wt2nGCNGaH6TJuUd3Ly5FPn0yye4LvuIcVw2vSg6c
	w1GUpn/g8DH5DLO/2HqmuJa79IBEr2QXNkkSphRzqRKAdvp18+uYZFTCs=
Received: from anka-20eya00ycd (unknown [182.139.166.32])
	by hzbj-edu-front-2.icoremail.net (Coremail) with SMTP id BLQMCkBmLxdcy3pqOiwhAA--.43334S7;
	Tue, 11 Aug 2026 15:12:49 +0800 (CST)
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
Subject: [PATCH v3 5/5] docs/zh_CN: Add LSM/SeLinux secid Chinese translation
Date: Tue, 11 Aug 2026 15:11:58 +0800
Message-ID: <20260811071200.54062-6-anka@stu.cdut.edu.cn>
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
X-CM-TRANSID:BLQMCkBmLxdcy3pqOiwhAA--.43334S7
X-Coremail-Antispam: 1UD129KBjvJXoW7Aw15Zr47ZFyxGFyfCr1Utrb_yoW8tw4fpF
	1DKryfGa1xWryxt397GF17Gr15GF4xuw45Gr1xX3ZYqrn5J3WFyrnrtrWqkryxKrWIyFW3
	XF4rKrW5WFW0y37anT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUPmb7Iv0xC_Cr1lb4IE77IF4wAFF20E14v26rWj6s0DM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI
	8067AKxVWUAVCq3wA2048vs2IY020Ec7CjxVAFwI0_Xr0E3s1l8cAvFVAK0II2c7xJM28C
	jxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVWUCVW8JwA2z4x0Y4vE2Ix0cI
	8IcVCY1x0267AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv67AKxVWxJVW8Jr1l84ACjcxK6I8E
	87Iv6xkF7I0E14v26r4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2
	IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4U
	McvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCY1x0262kKe7AKxVWUtVW8Zw
	CY02Avz4vE14v_GF4l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2Iq
	xVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r
	1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_JFI_Gr1lIxAIcVC0I7IYx2IY
	6xkF7I0E14v26F4j6r4UJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aV
	AFwI0_Gr0_Cr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZE
	Xa7IU8T89tUUUUU==
X-CM-SenderInfo: ysqsjiqyqsiiiqr623vxofv3vwohv3gofq/1tbiAgUCCWp6FRFpTAAAs9

From: Siwei Chen <businiaoanka@anka1.top>

Translate .../networking/secid.rst into Chinese.

Update the translation through commit de1fd4a7b0f2
("docs: networking: convert secid.txt to ReST")

Signed-off-by: Siwei Chen <businiaoanka@anka1.top>
---
 .../translations/zh_CN/networking/index.rst   |  2 +-
 .../translations/zh_CN/networking/secid.rst   | 24 +++++++++++++++++++
 2 files changed, 25 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/translations/zh_CN/networking/secid.rst

diff --git a/Documentation/translations/zh_CN/networking/index.rst b/Documentation/translations/zh_CN/networking/index.rst
index cd768d0a2837..bf22d22b64db 100644
--- a/Documentation/translations/zh_CN/networking/index.rst
+++ b/Documentation/translations/zh_CN/networking/index.rst
@@ -24,6 +24,7 @@
    driver
    ipv6
    napi
+   secid
    vxlan
    netif-msg
    xfrm_proc
@@ -126,7 +127,6 @@ Todolist:
 *   representors
 *   rxrpc
 *   sctp
-*   secid
 *   seg6-sysctl
 *   smc-sysctl
 *   statistics
diff --git a/Documentation/translations/zh_CN/networking/secid.rst b/Documentation/translations/zh_CN/networking/secid.rst
new file mode 100644
index 000000000000..c6ec07e1759c
--- /dev/null
+++ b/Documentation/translations/zh_CN/networking/secid.rst
@@ -0,0 +1,24 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+.. include:: ../disclaimer-zh_CN.rst
+
+:Original: Documentation/networking/secid.rst
+
+:翻译:
+
+	陈思为 Siwei Chen <businiaoanka@anka1.top>
+
+=================
+LSM/SELinux secid
+=================
+
+flowi 结构体：
+
+flow 结构体中的 secid 成员在 LSM（如 SELinux）中用于表示该流的标签。
+该流的标签目前用于选择相匹配的带标签 xfrm。
+
+若为出向流，标签派生自套接字（若有）；如果该流是为响应某个入站报文而生成的，
+则标签派生自相应的入站报文（例如 TCP 复位、timewait ACK 等）。
+在特殊情况下，也可酌情让标签派生自其他来源，如进程上下文、设备等。
+
+若为入向流，标签派生自报文所使用的 IPSec 安全关联（若存在）。
-- 
2.53.0

