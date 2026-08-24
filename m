Received: from zg8tmtyylji0my4xnjqumte4.icoremail.net (zg8tmtyylji0my4xnjqumte4.icoremail.net [162.243.164.118])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 677AA372691;
	Mon, 24 Aug 2026 04:38:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.243.164.118
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787546332; cv=none; b=MlH8GQQcD44dsytnc0BWnM94rqtsFtX5B/NozEo81luDEkGNt26JYTsZ/A6PlaaIGP47WPJR9/fDDtLq7lsKOpXhisedSeW8al64Z+PbayauSoPNXvfkGvySvq25nvL9ARgK+1FjU5LggwkyoQmnwiVTvpSNXOZwth5CgK92NME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787546332; c=relaxed/simple;
	bh=rzkVPPoFrZ0KGsQBc3+AaNr6sDvilBUZHBf4FyanzNw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=V5ns9yyzGYOZkTjrH5mbBaAx35PpnZOMbXqvkStN3Wl077n+opVlu6W3msau/NKe0/4RsUTjN2cYrDJZpuv52M4Hq4oDQu1jXjzWz2imEjiIzN+qYCL6q9t1hT8j+e/pPwvrWHyQNurUyTzsbjrxsT5hFWaT8OIVDgws1ICTWo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=stu.cdut.edu.cn; spf=none smtp.mailfrom=stu.cdut.edu.cn; dkim=fail (0-bit key) header.d=stu.cdut.edu.cn header.i=@stu.cdut.edu.cn header.b=RrGs+abk reason="key not found in DNS"; arc=none smtp.client-ip=162.243.164.118
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=stu.cdut.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=stu.cdut.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=stu.cdut.edu.cn header.i=@stu.cdut.edu.cn header.b="RrGs+abk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=stu.cdut.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
	Message-ID:In-Reply-To:References:MIME-Version:Content-Type:
	Content-Transfer-Encoding; bh=1XS9TaGF8kGbdkDehS7w616ZEFsnbeQPeL
	a/l7rsbvI=; b=RrGs+abkonO7NIO5zZYE8v8X7LLS+SdS9crRgNAev/G8JB1Hk/
	UE9Dkg1Yse09xC0KYJjWIZtYX76jDnKhP+QrK5k2SiegDRGkjQo4RM7bY83jzzb1
	RhS7iwjxc/FToCcVSOOcRz6/sCT3uzLej+G+CFRYWUzqQ1+UiuxaFf5aM=
Received: from anka-20eya00ycd (unknown [182.139.166.197])
	by hzbj-edu-front-4.icoremail.net (Coremail) with SMTP id BrQMCkB22cTAyotq7CuVAA--.65162S4;
	Mon, 24 Aug 2026 12:38:36 +0800 (CST)
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
Subject: [PATCH v5 2/5] docs/zh_CN: Add NIC SR-IOV APIs Chinese translation
Date: Mon, 24 Aug 2026 12:38:01 +0800
Message-ID: <20260824043806.46731-3-anka@stu.cdut.edu.cn>
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
X-CM-TRANSID:BrQMCkB22cTAyotq7CuVAA--.65162S4
X-Coremail-Antispam: 1UD129KBjvJXoWxAw1rWr18Gr1xuF13ZF18Krg_yoW5GF15pF
	WDKryfKF4xW34Utw4fGF1UG345GF1xCw45Wrn2q3ZYqrs5Aa48tFsrtr9xtw1xCrWFyFy5
	ZFsagFW5uryjy37anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUPFb7Iv0xC_Cr1lb4IE77IF4wAFF20E14v26rWj6s0DM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI
	8067AKxVWUXwA2048vs2IY020Ec7CjxVAFwI0_Gr0_Xr1l8cAvFVAK0II2c7xJM28CjxkF
	64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVWUJVWUCwA2z4x0Y4vE2Ix0cI8IcV
	CY1x0267AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIE14v26r4j6F4UM28EF7xvwVC2z280aVCY
	1x0267AKxVW8JVW8Jr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I
	8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCF
	s4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCY1x0262kKe7AKxVWUtVW8ZwCY02Avz4
	vE14v_Gryl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG
	67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MI
	IYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E
	14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJV
	W8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUseHq
	DUUUU
X-CM-SenderInfo: ysqsjiqyqsiiiqr623vxofv3vwohv3gofq/1tbiAgUPCWqLOJRfXQAAsO

From: Siwei Chen <businiaoanka@anka1.top>

Translate .../networking/sriov.rst into Chinese.

Update the translation through commit 4558645d139c
("docs: net: document guidance of implementing the SR-IOV NDOs")

Signed-off-by: Siwei Chen <businiaoanka@anka1.top>
---
 .../translations/zh_CN/networking/index.rst   |  2 +-
 .../translations/zh_CN/networking/sriov.rst   | 34 +++++++++++++++++++
 2 files changed, 35 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/translations/zh_CN/networking/sriov.rst

diff --git a/Documentation/translations/zh_CN/networking/index.rst b/Documentation/translations/zh_CN/networking/index.rst
index fcb8dc8f2c72..ae374c4cb144 100644
--- a/Documentation/translations/zh_CN/networking/index.rst
+++ b/Documentation/translations/zh_CN/networking/index.rst
@@ -29,6 +29,7 @@
    alias
    mptcp-sysctl
    generic-hdlc
+   sriov
    team
    timestamping
 
@@ -128,7 +129,6 @@ Todolist:
 *   secid
 *   seg6-sysctl
 *   smc-sysctl
-*   sriov
 *   statistics
 *   strparser
 *   switchdev
diff --git a/Documentation/translations/zh_CN/networking/sriov.rst b/Documentation/translations/zh_CN/networking/sriov.rst
new file mode 100644
index 000000000000..d5e16a099b07
--- /dev/null
+++ b/Documentation/translations/zh_CN/networking/sriov.rst
@@ -0,0 +1,34 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+.. include:: ../disclaimer-zh_CN.rst
+
+:Original: Documentation/networking/sriov.rst
+
+:翻译:
+
+	陈思为 Siwei Chen <businiaoanka@anka1.top>
+
+===============
+网卡 SR-IOV API
+===============
+
+强烈建议现代网卡专注于实现 ``switchdev`` 模型
+（参见 `以太网交换机设备驱动模型（switchdev）`_）
+来配置 SR-IOV 功能的转发与安全。
+
+传统 API
+========
+
+旧的 SR-IOV API 在 ``rtnetlink`` Netlink 协议族中实现，是 ``RTM_GETLINK`` 和
+``RTM_SETLINK`` 命令的一部分。在驱动侧，它由若干 ``ndo_set_vf_*`` 和
+``ndo_get_vf_*`` 回调组成。
+
+由于传统 API 与协议栈其余部分集成不佳，该 API 被视为已冻结；不再接受任何新功能或扩展。
+新驱动不应实现那些不常用的回调；
+即以下回调禁止使用：
+
+ - ``ndo_get_vf_port``
+ - ``ndo_set_vf_port``
+ - ``ndo_set_vf_rss_query_en``
+
+.. _`以太网交换机设备驱动模型（switchdev）`: https://docs.kernel.org/networking/switchdev.html#switchdev
-- 
2.53.0

