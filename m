Received: from zg8tmtyylji0my4xnjqumte4.icoremail.net (zg8tmtyylji0my4xnjqumte4.icoremail.net [162.243.164.118])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F02DC3515DE;
	Fri, 24 Jul 2026 05:14:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.243.164.118
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784870067; cv=none; b=XJq+LMIx26sNvYAdVGYDGByGXDm6nGItPN/6YkGE462wSRu7ve+EK4BeS75MHi8AAuUV8ROOShw8/TYgW25vQu1tjXDZORvqeJgQLSyHscrWEoZ6tdjGCZ1+Oem9CYxYa0ece8oBSOyPrp+w7p9uM/3FeG/9yPZr4CPZDys6vA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784870067; c=relaxed/simple;
	bh=sUWP3umBmirc42AKEQ488du12DF2Qa9/WGUCAl6Y2e4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=J7wsUC56u8aQKHbYAC7S8j1CHe0wRwjWukkhKKf1uQsto9SP8WDDzjIWOFp6M8xGSlwtSDeQf0Y2J5eXJc7/psuLK8wfed+2ZI6iMc7I9/Vtol54YAA8cF6j9m4i0Xt8PE9gf9pIvK2hLIk+BIu7DiYYbmlNl96tnyPy83+bJeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=stu.cdut.edu.cn; spf=none smtp.mailfrom=stu.cdut.edu.cn; dkim=fail (0-bit key) header.d=stu.cdut.edu.cn header.i=@stu.cdut.edu.cn header.b=umPa61Kc reason="key not found in DNS"; arc=none smtp.client-ip=162.243.164.118
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=stu.cdut.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=stu.cdut.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=stu.cdut.edu.cn header.i=@stu.cdut.edu.cn header.b="umPa61Kc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=stu.cdut.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
	Message-ID:In-Reply-To:References:MIME-Version:Content-Type:
	Content-Transfer-Encoding; bh=K1wok1MAInPOddevCILJ6ZpHBqwWEfXeDr
	ZNB6izGMU=; b=umPa61KcnK3w3VvjYwiOqXqDIxnUracJbrN5PTargIglE/i02K
	MbhDTLa6IbKoqRsa3jKYL2F+VjBEtP3aAXwwLp60TZmfS5uSns0uc9+JGVjR4iHZ
	kmu8xOlecNlGqEG+cZchCSI4SIwKtJTJwlaobBFIp+eiWppbfdgU4hEjM=
Received: from anka-20eya00ycd (unknown [125.71.206.65])
	by hzbj-edu-front-4.icoremail.net (Coremail) with SMTP id BrQMCkCWuQ+Z9GJqNR5nAQ--.32373S7;
	Fri, 24 Jul 2026 13:14:16 +0800 (CST)
From: Siwei Chen <anka@stu.cdut.edu.cn>
To: alexs@kernel.org,
	si.yanteng@linux.dev,
	dzm91@hust.edu.cn,
	corbet@lwn.net,
	skhan@linuxfoundation.org
Cc: wy@wyuan.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Siwei Chen <businiaoanka@anka1.top>
Subject: [PATCH 5/5] docs/zh_CN: Add LSM/SeLinux secid Chinese translation
Date: Fri, 24 Jul 2026 13:13:41 +0800
Message-ID: <51e5bef10ab3af01a0dcca9697dd94e386a5f7f1.1784866896.git.businiaoanka@anka1.top>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1784866896.git.businiaoanka@anka1.top>
References: <cover.1784866896.git.businiaoanka@anka1.top>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:BrQMCkCWuQ+Z9GJqNR5nAQ--.32373S7
X-Coremail-Antispam: 1UD129KBjvJXoW7Aw15Zr47ZFyxGFyfCr1Utrb_yoW8WFW5pF
	n8KrWfAF4xWryxKrZrGr13Gw15AF4xuw45Gr1xX3Zaqr95t3WFkrnFyFWqyryxK3y0yFWa
	qF4ftrW5uFy8A37anT9S1TB71UUUUUJqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUmIb7Iv0xC_Ar1lb4IE77IF4wAFF20E14v26rWj6s0DM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI
	8067AKxVWUAVCq3wA2048vs2IY020Ec7CjxVAFwI0_Xr0E3s1l8cAvFVAK0II2c7xJM28C
	jxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVWUCVW8JwA2z4x0Y4vE2Ix0cI
	8IcVCY1x0267AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv67AKxVW8JVWxJwA2z4x0Y4vEx4A2
	jsIEc7CjxVAFwI0_Gr0_Gr1UM2kKe7AKxVWUXVWUAwAS0I0E0xvYzxvE52x082IY62kv04
	87Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280
	aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxkF7I0En4
	kS14v26r1q6r43MxkIecxEwVAFwVW8WwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkE
	bVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67
	AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUCVW8JwCI
	42IY6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCw
	CI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnI
	WIevJa73UjIFyTuYvj4RBq2NUUUUU
X-CM-SenderInfo: ysqsjiqyqsiiiqr623vxofv3vwohv3gofq/1tbiAgUECWpiL-pkrgACsf

From: Siwei Chen <businiaoanka@anka1.top>

Translate .../networking/secid.rst into Chinese.

Update the translation through commit de1fd4a7b0f2
("docs: networking: convert secid.txt to ReST")

Signed-off-by: Siwei Chen <businiaoanka@anka1.top>
---
 .../translations/zh_CN/networking/secid.rst   | 24 +++++++++++++++++++
 1 file changed, 24 insertions(+)
 create mode 100644 Documentation/translations/zh_CN/networking/secid.rst

diff --git a/Documentation/translations/zh_CN/networking/secid.rst b/Documentation/translations/zh_CN/networking/secid.rst
new file mode 100644
index 000000000000..0168feddcc3d
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
+若为出向流，标签派生自套接字（若有），或派生自本流作为响应而生成的入站报文
+（如 TCP 复位、timewait ACK 等）。在特殊情况下，也可酌情让标签派生自其他
+来源，如进程上下文、设备等。
+
+若为入向流，标签派生自报文所使用的 IPSec 安全关联（若存在）。
-- 
2.53.0

