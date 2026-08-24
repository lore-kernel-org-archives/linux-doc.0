Received: from zg8tmtyylji0my4xnjqumte4.icoremail.net (zg8tmtyylji0my4xnjqumte4.icoremail.net [162.243.164.118])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A15C373BF3;
	Mon, 24 Aug 2026 04:38:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.243.164.118
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787546333; cv=none; b=M9RlFWKDZDngYmO4lL/5OLaRXIE4H1LWQbq8fxSGjbvUGh4WxsqPfh54FJ1Nql/LWowx6o7xTOpSwgWq0EH2za0Vi41dgUS4cjlxYfepdap2yEqGWp7IuQR4mQMkPvenqs39bmqV+zga22NLcOiKvj7Y7mdN1PlOQ+uuLRiQK4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787546333; c=relaxed/simple;
	bh=41DPfQf6IcHqSvxpm8UEBpdDS7VlscKDBO3q4QgWtVM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Tsnuzlx6fyWupctjMsJYq4mL1Rz+wSMcMYGjKsk+gO6cstPg7f5IbmfX8+D3agHaoM9+xqDjdgQbBFpt66U6D1wCRbWLfk37IO21iLdu7MUJ8Ls59A3Eq4SXO4WxoZJep4Q8v16mYgsGo5yQbLBdJ2ts2Mmf4mL0WWdP6o9VlOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=stu.cdut.edu.cn; spf=none smtp.mailfrom=stu.cdut.edu.cn; dkim=fail (0-bit key) header.d=stu.cdut.edu.cn header.i=@stu.cdut.edu.cn header.b=x00xirba reason="key not found in DNS"; arc=none smtp.client-ip=162.243.164.118
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=stu.cdut.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=stu.cdut.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=stu.cdut.edu.cn header.i=@stu.cdut.edu.cn header.b="x00xirba"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=stu.cdut.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
	Message-ID:In-Reply-To:References:MIME-Version:Content-Type:
	Content-Transfer-Encoding; bh=LCYUl6N7ueW67d7NXkbznj+AYQ6DXEgslN
	wNtLa0s9s=; b=x00xirbakWZJI/CrTp03SW/4BQ4GTZYyz+Xd4wPwmt9Ssja+Kg
	IVevI1MTHBhyQR96XYm6ofzP2LQyS6WYYenc6Iq9dF3jP9DA37pVRgQL0mcFwHs2
	RFvOWbcSSDctVuT/a+szeCjFCK2es1eabGvqhXFycUyWE4+rE9+3tyo6o=
Received: from anka-20eya00ycd (unknown [182.139.166.197])
	by hzbj-edu-front-4.icoremail.net (Coremail) with SMTP id BrQMCkB22cTAyotq7CuVAA--.65162S7;
	Mon, 24 Aug 2026 12:38:46 +0800 (CST)
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
Subject: [PATCH v5 5/5] docs/zh_CN: Add LSM/SELinux secid Chinese translation
Date: Mon, 24 Aug 2026 12:38:04 +0800
Message-ID: <20260824043806.46731-6-anka@stu.cdut.edu.cn>
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
X-CM-TRANSID:BrQMCkB22cTAyotq7CuVAA--.65162S7
X-Coremail-Antispam: 1UD129KBjvJXoW7Aw15Zr47ZFyxGFyfCr1Utrb_yoW8tw4DpF
	1DKrWfGa1xWryxt397Gr17Gr15GF4xuw45Gr1xX3ZYqr95J3W0yrnrtrWqkryxKrWIyFW3
	XF4rKrW5Wry0y37anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUPqb7Iv0xC_Ar1lb4IE77IF4wAFF20E14v26rWj6s0DM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI
	8067AKxVWUAVCq3wA2048vs2IY020Ec7CjxVAFwI0_Xr0E3s1l8cAvFVAK0II2c7xJM28C
	jxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVWUCVW8JwA2z4x0Y4vE2Ix0cI
	8IcVCY1x0267AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv67AKxVW8JVWxJwA2z4x0Y4vEx4A2
	jsIEc7CjxVAFwI0_Gr0_Gr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64
	kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm
	72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lc7CjxVAaw2AFwI0_Jw0_GFylc2
	xSY4AK67AK6r45MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E
	5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtV
	W8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1I6r4UMIIF0xvE2Ix0cI8IcVCY
	1x0267AKxVWxJVW8Jr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14
	v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x
	0zil_MxUUUUU=
X-CM-SenderInfo: ysqsjiqyqsiiiqr623vxofv3vwohv3gofq/1tbiAQUPCWqLNzJhsgACs3

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
index 000000000000..94d9e7fb5d13
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
+LSM/SeLinux secid
+=================
+
+flowi 结构体：
+
+flowi 结构体中的 secid 成员在 LSM（如 SELinux）中用于表示该流的标签。
+该流的标签目前用于选择相匹配的带标签 xfrm。
+
+若为出向流，标签派生自套接字（若有）；如果该流是为响应某个入站报文而生成的，
+则标签派生自相应的入站报文（例如 TCP 复位、timewait ACK 等）。
+在特殊情况下，也可酌情让标签派生自其他来源，如进程上下文、设备等。
+
+若为入向流，标签派生自报文所使用的 IPSec 安全关联（若存在）。
-- 
2.53.0

