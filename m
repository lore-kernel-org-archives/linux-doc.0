Received: from zg8tmtyylji0my4xnjqumte4.icoremail.net (zg8tmtyylji0my4xnjqumte4.icoremail.net [162.243.164.118])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 677183624CC;
	Mon, 24 Aug 2026 04:38:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.243.164.118
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787546332; cv=none; b=jFv/0QpW4PWE3TpS0F9IPv1NsZcxBtmgJVtEpuOYWZjrR2DkPt5XYqgPOyJve81CWO6nVqfTum+tOjCWAPMaNnJOUyMCkfkJ8HxrS3/CYFnehqLyeP1bO34Bd/vXLe468voKx7NiPOIkDa9Z0/ROR0SN1FFy3YDQceqxcMMPoJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787546332; c=relaxed/simple;
	bh=zxykR1De5NGPNu9+xK99LUMTCxnkA8IygQZsxw9tXMw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FcUu46iqQIkQ/pi6a7UCN4EdD7kiOjIZqL1DLC6Sbc7gZjwf3LU7AXPCs9SDBASdXUI5DRaxvVjwsBrsLAyaGw+rhG9DvPSZHacFEnBGaL8W417hE7fz1A4mRa7B7AcjMOII3oJV1mKHNTIuFN23MN++FPMkqjaDLsoiLC7xZCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=stu.cdut.edu.cn; spf=none smtp.mailfrom=stu.cdut.edu.cn; dkim=fail (0-bit key) header.d=stu.cdut.edu.cn header.i=@stu.cdut.edu.cn header.b=ol3TAopg reason="key not found in DNS"; arc=none smtp.client-ip=162.243.164.118
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=stu.cdut.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=stu.cdut.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=stu.cdut.edu.cn header.i=@stu.cdut.edu.cn header.b="ol3TAopg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=stu.cdut.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
	Message-ID:In-Reply-To:References:MIME-Version:Content-Type:
	Content-Transfer-Encoding; bh=7j4i2C59zaZFqjbTRxFIC3uoVZPuQfPYiJ
	oHF/bOG/c=; b=ol3TAopgRH/DnCBGlQlECGT1yVgf0izWzRm+QUGIgARjlHYt8P
	Fvy2Kf5GACq1OndPSQ9PYA9Y1UY5HPA69zQ/XecN72gWZoXaKxzG3H3Fnc1wD/NI
	6jHBlB6g92D3+UyEI/6Wpqm8ifLeCo0YO7clNndiba4m+wcJmlGlCVLy0=
Received: from anka-20eya00ycd (unknown [182.139.166.197])
	by hzbj-edu-front-4.icoremail.net (Coremail) with SMTP id BrQMCkB22cTAyotq7CuVAA--.65162S6;
	Mon, 24 Aug 2026 12:38:43 +0800 (CST)
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
Subject: [PATCH v5 4/5] docs/zh_CN: Add ipv6 Chinese translation
Date: Mon, 24 Aug 2026 12:38:03 +0800
Message-ID: <20260824043806.46731-5-anka@stu.cdut.edu.cn>
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
X-CM-TRANSID:BrQMCkB22cTAyotq7CuVAA--.65162S6
X-Coremail-Antispam: 1UD129KBjvJXoWxAw1xJrWxXrWUXr45WrW8Crg_yoW5ZFW3pF
	ZIgFyxGa17A3WYkFsxGF1UJF15K3WxCanrGFnrZ3ZYqrs5Ja92kw12kFyq9Fy3Kr92yFW5
	ZrWrArWrArW0kaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUPab7Iv0xC_Cr1lb4IE77IF4wAFF20E14v26rWj6s0DM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI
	8067AKxVWUAVCq3wA2048vs2IY020Ec7CjxVAFwI0_Xr0E3s1l8cAvFVAK0II2c7xJM28C
	jxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVWUJVWUCwA2z4x0Y4vE2Ix0cI
	8IcVCY1x0267AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIE14v26r4j6F4UM28EF7xvwVC2z280
	aVCY1x0267AKxVW8JVW8Jr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4
	CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvj
	eVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCY1x0262kKe7AKxVWUtVW8ZwCY02
	Avz4vE14v_Gryl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAq
	x4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r
	43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF
	7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxV
	WUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxU
	4eMNUUUUU
X-CM-SenderInfo: ysqsjiqyqsiiiqr623vxofv3vwohv3gofq/1tbiAQUPCWqLNzJhsgABs0

From: Siwei Chen <businiaoanka@anka1.top>

Translate .../networking/ipv6.rst into Chinese.

Update the translation through commit 19093313cb04
("docs: networking: convert ipv6.txt to ReST")

Signed-off-by: Siwei Chen <businiaoanka@anka1.top>
---
 .../translations/zh_CN/networking/index.rst   |  2 +-
 .../translations/zh_CN/networking/ipv6.rst    | 76 +++++++++++++++++++
 2 files changed, 77 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/translations/zh_CN/networking/ipv6.rst

diff --git a/Documentation/translations/zh_CN/networking/index.rst b/Documentation/translations/zh_CN/networking/index.rst
index 4675d23a7f28..cd768d0a2837 100644
--- a/Documentation/translations/zh_CN/networking/index.rst
+++ b/Documentation/translations/zh_CN/networking/index.rst
@@ -22,6 +22,7 @@
 
    msg_zerocopy
    driver
+   ipv6
    napi
    vxlan
    netif-msg
@@ -89,7 +90,6 @@ Todolist:
 *   ip_dynaddr
 *   ipsec
 *   ip-sysctl
-*   ipv6
 *   ipvlan
 *   ipvs-sysctl
 *   kcm
diff --git a/Documentation/translations/zh_CN/networking/ipv6.rst b/Documentation/translations/zh_CN/networking/ipv6.rst
new file mode 100644
index 000000000000..3726b6fdc460
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
+	指定是否在加载 IPv6 模块的同时禁用其全部功能。当另一模块依赖于 IPv6
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
+	指定是否在所有接口上启用 IPv6 地址自动配置。当不希望根据路由器通告
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

