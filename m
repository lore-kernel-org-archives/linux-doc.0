Received: from zg8tmtyylji0my4xnjqumte4.icoremail.net (zg8tmtyylji0my4xnjqumte4.icoremail.net [162.243.164.118])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B47BA8003D;
	Fri, 24 Jul 2026 05:14:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.243.164.118
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784870061; cv=none; b=GjgpfgqR163Sbmiaem/RxIvCcxQcg/nJBfVKqg+Y+T0mMBsARIWHOLV0b+uf3ZpdptCon+BK18478PXq3i1oaNNng678kjcSBVqJqw2RdKpVFnfOgHxRfYSA5p5YHn75Ml5ZXflm26wX5frhs5SyTLMtxn6wAatb03GqKTk88WM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784870061; c=relaxed/simple;
	bh=sj2+pryJtx4OO4244go0ZrGZERv3VGcFr0rgeop2xow=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fJwha+iSKo19aIen+y35U4xxbSP6Is/e6sPtHMW7T10V1GzduzCFMU+gqQsi/fTUVzH83F3RAYaIlzkGPRTOIkDVBn2je/Qz0/sJpEP2O/Kt9yEVjLUgiVfYnY84vDwZHsdb/Gqhj+iwrzIqtXjJgjo6rqLCJk4yq+ASxWjinH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=stu.cdut.edu.cn; spf=none smtp.mailfrom=stu.cdut.edu.cn; dkim=fail (0-bit key) header.d=stu.cdut.edu.cn header.i=@stu.cdut.edu.cn header.b=ytJrs2Wr reason="key not found in DNS"; arc=none smtp.client-ip=162.243.164.118
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=stu.cdut.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=stu.cdut.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=stu.cdut.edu.cn header.i=@stu.cdut.edu.cn header.b="ytJrs2Wr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=stu.cdut.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
	Message-ID:In-Reply-To:References:MIME-Version:Content-Type:
	Content-Transfer-Encoding; bh=6AWcSnoBtiEP/Qp9VmiLHT3GURCQXr+BYv
	4GbhjiSHs=; b=ytJrs2Wr8H4oH6I4hhA6ClukIMuUPlXQ1SV4KRBpsGVhjRpkUw
	HICeg85hicZwsm6nqAyoD5Q9/pohsc0VIkK8a6mUqNiS+9CgBTHgnZgRJ6SZU03m
	PoKipdy5oeLsAQJFW6U9liAI2DocVnUig+LBiDDDPqUL8N2PQlG8322Es=
Received: from anka-20eya00ycd (unknown [125.71.206.65])
	by hzbj-edu-front-4.icoremail.net (Coremail) with SMTP id BrQMCkCWuQ+Z9GJqNR5nAQ--.32373S6;
	Fri, 24 Jul 2026 13:14:14 +0800 (CST)
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
Subject: [PATCH 4/5] docs/zh_CN: Add ipv6 Chinese translation
Date: Fri, 24 Jul 2026 13:13:40 +0800
Message-ID: <5c8524623ad3faf1eb9eff13c2ed9813672aa351.1784866896.git.businiaoanka@anka1.top>
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
X-CM-TRANSID:BrQMCkCWuQ+Z9GJqNR5nAQ--.32373S6
X-Coremail-Antispam: 1UD129KBjvJXoWxAw1xJrWxXF4xKr1UXF17Awb_yoW5Xr1rpa
	nIgF1fJwsFy3Z8KFsxGF10qF15t3W8CanrKFnrZ3ZYqrs5ta92k3429Fyq9FW3Kr92yFZ8
	ZryrArWfArW0kaUanT9S1TB71UUUUUJqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUmFb7Iv0xC_Cr1lb4IE77IF4wAFF20E14v26rWj6s0DM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI
	8067AKxVWUAVCq3wA2048vs2IY020Ec7CjxVAFwI0_Xr0E3s1l8cAvFVAK0II2c7xJM28C
	jxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVWUJVWUCwA2z4x0Y4vE2Ix0cI
	8IcVCY1x0267AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIE14v26r4j6F4UM28EF7xvwVC2z280
	aVCY1x0267AKxVW8JVW8Jr1ln4kS14v26r1Y6r17M2AIxVAIcxkEcVAq07x20xvEncxIr2
	1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv
	67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lc7CjxVAaw2
	AFwI0_Jw0_GFylc2xSY4AK67AK6r4rMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY
	6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17
	CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF
	0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIx
	AIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2
	KfnxnUUI43ZEXa7IU8Q18PUUUUU==
X-CM-SenderInfo: ysqsjiqyqsiiiqr623vxofv3vwohv3gofq/1tbiAgUECWpiL-pkrgABsc

From: Siwei Chen <businiaoanka@anka1.top>

Translate .../networking/ipv6.rst into Chinese.

Update the translation through commit 19093313cb04
("docs: networking: convert ipv6.txt to ReST")

Signed-off-by: Siwei Chen <businiaoanka@anka1.top>
---
 .../translations/zh_CN/networking/ipv6.rst    | 76 +++++++++++++++++++
 1 file changed, 76 insertions(+)
 create mode 100644 Documentation/translations/zh_CN/networking/ipv6.rst

diff --git a/Documentation/translations/zh_CN/networking/ipv6.rst b/Documentation/translations/zh_CN/networking/ipv6.rst
new file mode 100644
index 000000000000..5246d8588cf6
--- /dev/null
+++ b/Documentation/translations/zh_CN/networking/ipv6.rst
@@ -0,0 +1,76 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+.. include:: ../disclaimer-zh_CN.rst
+
+:Original: Documentation/networking/ipv6.rst
+
+:翻译:
+
+	陈思为 Siwei Chen <businiaoanka@anka1.top>
+
+====
+IPv6
+====
+
+
+ipv6 模块的选项在加载时以参数形式提供。
+
+模块选项可作为 insmod 或 modprobe 命令的命令行参数给出，但通常在
+``/etc/modules.d/*.conf`` 配置文件中，或在发行版特定的配置文件中指定。
+
+可用的 ipv6 模块参数如下所列。若未指定某参数，则使用其默认值。
+
+参数如下：
+
+disable
+
+	指定是否加载 IPv6 模块，但禁用其全部功能。当另一模块依赖于 IPv6
+	模块已加载，但又不需要任何 IPv6 地址或操作时，可使用此选项。
+
+	可选值及其效果如下：
+
+	0
+		启用 IPv6。
+
+		这是默认值。
+
+	1
+		禁用 IPv6。
+
+		接口不会添加 IPv6 地址，也无法打开 IPv6 套接字。
+
+		需要重启才能启用 IPv6。
+
+autoconf
+
+	指定是否在所有接口上启用 IPv6地址自动配置。当不希望根据路由器通告
+	（Router Advertisement）中收到的前缀自动生成地址时，可使用此选项。
+
+	可选值及其效果如下：
+
+	0
+		所有接口均禁用 IPv6 地址自动配置。
+
+		仅添加 IPv6 回环地址（::1）与链路本地地址。
+
+	1
+		所有接口均启用 IPv6 地址自动配置。
+
+		这是默认值。
+
+disable_ipv6
+
+	指定是否在所有接口上禁用 IPv6。
+	当不需要任何 IPv6 地址时，可使用此选项。
+
+	可选值及其效果如下：
+
+	0
+		在所有接口上启用 IPv6。
+
+		这是默认值。
+
+	1
+		在所有接口上禁用 IPv6。
+
+		接口不会添加 IPv6 地址。
-- 
2.53.0

