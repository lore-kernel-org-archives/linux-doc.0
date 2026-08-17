Received: from zg8tmtyylji0my4xnjqumte4.icoremail.net (zg8tmtyylji0my4xnjqumte4.icoremail.net [162.243.164.118])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDDCB25E469;
	Mon, 17 Aug 2026 02:14:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.243.164.118
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786932877; cv=none; b=UhreTkDfYvuVkOp5BDhbNZRjmPPrkLPeSK0ZWPmk3ys6eggcPzdCgvJjeE2WdsKXIW0pV8S/Blo47+lzExAdhFIIAsdoLeK9rdcLCBcRvDTlxDJlADeWDlX47FQA3JbmrVw7B482DrQEOjIYlFsd9b7v1PIbRK9D8lnMBHE8Rrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786932877; c=relaxed/simple;
	bh=zxykR1De5NGPNu9+xK99LUMTCxnkA8IygQZsxw9tXMw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nVMh156995Ztn2DxUyuPUiglpY2uCiajxEv9pSivpjscqWjVavTmylnakIXNGmDCO/BAYOjSX84MtABWlkwnMqShPck1JVgrWezZo2hmGxyA5eC9cEuBLcwcvYaga6K1GmT2pYjJzK2RFqU0JVa+l1Xj1m0FPp5AHELgAjS6znI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=stu.cdut.edu.cn; spf=none smtp.mailfrom=stu.cdut.edu.cn; dkim=fail (0-bit key) header.d=stu.cdut.edu.cn header.i=@stu.cdut.edu.cn header.b=5xZrvMk2 reason="key not found in DNS"; arc=none smtp.client-ip=162.243.164.118
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=stu.cdut.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=stu.cdut.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=stu.cdut.edu.cn header.i=@stu.cdut.edu.cn header.b="5xZrvMk2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=stu.cdut.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
	Message-ID:In-Reply-To:References:MIME-Version:Content-Type:
	Content-Transfer-Encoding; bh=7j4i2C59zaZFqjbTRxFIC3uoVZPuQfPYiJ
	oHF/bOG/c=; b=5xZrvMk2HCFgZ0KU+26pYMbuzSfkdkjlPbFjOW0XbzFn7KPUr3
	1jmNeoRdYtWIkUIkjkn8Gr0ijLzwKX7zgpVsjbfJboeIr2TUoI4otEgWU4mnlKyN
	YZOoMWvOiPn4ArRt99M0Wr8UMc08xW0CUcxLMI/wfAbMS054BSEyIMAhA=
Received: from anka-20eya00ycd (unknown [182.139.166.85])
	by hzbj-edu-front-4.icoremail.net (Coremail) with SMTP id BrQMCkBmycR2boJq_v1jAA--.23758S6;
	Mon, 17 Aug 2026 10:14:28 +0800 (CST)
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
Subject: [PATCH v4 4/5] docs/zh_CN: Add ipv6 Chinese translation
Date: Mon, 17 Aug 2026 10:13:38 +0800
Message-ID: <20260817021340.17318-5-anka@stu.cdut.edu.cn>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260817021340.17318-1-anka@stu.cdut.edu.cn>
References: <20260817021340.17318-1-anka@stu.cdut.edu.cn>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:BrQMCkBmycR2boJq_v1jAA--.23758S6
X-Coremail-Antispam: 1UD129KBjvJXoWxAw1xJrWxXrWUXr45WrW8Crg_yoW5ZFW3pF
	ZIgFyxGa17A3WYkFsxGF1UJF15K3WxCanrGFnrZ3ZYqrs5Ja92kw12kFyq9Fy3Kr92yFW5
	ZrWrArWrArW0kaUanT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUPqb7Iv0xC_Cr1lb4IE77IF4wAFF20E14v26rWj6s0DM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI
	8067AKxVWUAVCq3wA2048vs2IY020Ec7CjxVAFwI0_Xr0E3s1l8cAvFVAK0II2c7xJM28C
	jxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0cI
	8IcVCY1x0267AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv67AKxVW8JVWxJwA2z4x0Y4vEx4A2
	jsIEc7CjxVAFwI0_Gr0_Gr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64
	kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r106r15McIj6I8E87Iv67AKxVWUJVW8JwAm
	72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lc7CjxVAaw2AFwI0_Jw0_GFylc2
	xSY4AK67AK6r4UMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E
	5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtV
	W8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r4j6ryUMIIF0xvE2Ix0cI8IcVCY
	1x0267AKxVWxJVW8Jr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14
	v26r4j6F4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x
	07URpB-UUUUU=
X-CM-SenderInfo: ysqsjiqyqsiiiqr623vxofv3vwohv3gofq/1tbiAgUICWqB-hMt-AAGsX

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

