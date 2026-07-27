Received: from zg8tmtyylji0my4xnjqumte4.icoremail.net (zg8tmtyylji0my4xnjqumte4.icoremail.net [162.243.164.118])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D12964908DE;
	Mon, 27 Jul 2026 07:36:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.243.164.118
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785137804; cv=none; b=MpTQ8nObCPOp2Limq4Ffs8EQ68QB8ed2CEvoEfZn5FFGjMXnbERpnfY9AVEshnul0D+PX6YD9FUQnrljLv+ZMpbGr8yjXohTmtl5tiZf4E6w8G9lpO24xiDlbFi2aY/eK0B42OzkAJJ27sdcISJVbyb471tVZ+5StuypvNte8C4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785137804; c=relaxed/simple;
	bh=lPMQ+Hz+gCHbr+LBn2U4J3LJa3VGjc5C0EntTwXo6rs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BPweSC/ezqZLDQOKhyJG+HMrrmMjr7XDwE7p22bBbEQIx+plXgKJvzWiiL4d4OBGCZ8TLdWBTYYGU1C0gVKTMK/KioAAOOlpujBGjlf/xwT0EwbqI47D/bHy/o+v5uN2w+afCS++dBrV7f2gvhWmmQitoFVHjfKX+tC151d8SbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=stu.cdut.edu.cn; spf=none smtp.mailfrom=stu.cdut.edu.cn; dkim=fail (0-bit key) header.d=stu.cdut.edu.cn header.i=@stu.cdut.edu.cn header.b=RHSGVqdV reason="key not found in DNS"; arc=none smtp.client-ip=162.243.164.118
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=stu.cdut.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=stu.cdut.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=stu.cdut.edu.cn header.i=@stu.cdut.edu.cn header.b="RHSGVqdV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=stu.cdut.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
	Message-ID:In-Reply-To:References:MIME-Version:Content-Type:
	Content-Transfer-Encoding; bh=TFIns/QARpifNjIiquBpzDDJsIDI6Y2EYW
	HneU+Of6c=; b=RHSGVqdVHT+3C0Vbq8zNEG2CSWpS36AepeHAQ+2TGmkckvn5AZ
	BX+5Brsy/s91gbmYHRNkRFmT5LPcbu2fssGxmBf3iz8Tgn/+VZeDfqM2yifj6nj0
	DJXlQ5suBRSe6a6cyKJ4uwMj72FdydSpoK810XWY2521PaBPcMhq3VmnM=
Received: from anka-20eya00ycd (unknown [182.139.167.230])
	by hzbj-edu-front-4.icoremail.net (Coremail) with SMTP id BrQMCkCGpw1lCmdqR_CFAQ--.59332S6;
	Mon, 27 Jul 2026 15:36:31 +0800 (CST)
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
Subject: [PATCH v2 4/5] docs/zh_CN: Add ipv6 Chinese translation
Date: Mon, 27 Jul 2026 15:35:35 +0800
Message-ID: <20260727073538.56951-5-anka@stu.cdut.edu.cn>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260727073538.56951-1-anka@stu.cdut.edu.cn>
References: <20260727073538.56951-1-anka@stu.cdut.edu.cn>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:BrQMCkCGpw1lCmdqR_CFAQ--.59332S6
X-Coremail-Antispam: 1UD129KBjvJXoWxAw1xJrWxXrWUXr45WrW8Crg_yoW5ZFWUpa
	9IgFyxGa17A3Z0kFsxGF1UtF15K3WxCanrGFnrZ3ZYqrs5Ja92kw12kFyq9Fy3Kr92yFW5
	ZrWrArWrArW0kaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUPqb7Iv0xC_Cr1lb4IE77IF4wAFF20E14v26rWj6s0DM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI
	8067AKxVWUAVCq3wA2048vs2IY020Ec7CjxVAFwI0_Xr0E3s1l8cAvFVAK0II2c7xJM28C
	jxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVWUCVW8JwA2z4x0Y4vE2Ix0cI
	8IcVCY1x0267AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIE14v26F4j6r4UJwA2z4x0Y4vEx4A2
	jsIEc7CjxVAFwI0_Gr1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0V
	AKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1l
	Ox8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxkF7I0En4kS14v26r1q6r43Mx
	kIecxEwVAFwVW8CwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s02
	6c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw
	0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvE
	c7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14
	v26r4j6F4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x
	07jnGYLUUUUU=
X-CM-SenderInfo: ysqsjiqyqsiiiqr623vxofv3vwohv3gofq/1tbiAgUHCWpmJHtcgQADsE

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

