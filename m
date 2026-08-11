Received: from zg8tmtyylji0my4xnjqumte4.icoremail.net (zg8tmtyylji0my4xnjqumte4.icoremail.net [162.243.164.118])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 562C43F99F3;
	Tue, 11 Aug 2026 07:12:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.243.164.118
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786432378; cv=none; b=LaLT52ayWqa0ZGFZQvMuoDNfBJuZ+QJHzWPcSJcNbSAlYcnaqU4BNUt/HDEnARr6ZsulqIEruJaYAbADofhS8Wdf5GZkrjs3ppoTTQ84KRa28Yt+OZ0V0014hMKzhRO9FqjRWN7BemQVDoCCeDlQTURDjUetmrrP2cN+A5jzd1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786432378; c=relaxed/simple;
	bh=icwJaAWU0OUeL/4db6OjGJXk9wMChBc/Hg1WCJ18OJA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fgPhuNLXPLaT3gszNU1Eq8Lw+m+KFai8mI1ZAQjcRooAt7JLGe7ngGZb80jyFM4dQrjYJTexuK0mbZ0EDB4+S/jQxHF/n5C/yKIAq4y4MUflo7RJzC8cKyWJ4j4T875Z86ta9G2TT1BXyzAyJVLYvCI39fctzvF3llBGLOHiPmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=stu.cdut.edu.cn; spf=none smtp.mailfrom=stu.cdut.edu.cn; dkim=fail (0-bit key) header.d=stu.cdut.edu.cn header.i=@stu.cdut.edu.cn header.b=p7R+hcK8 reason="key not found in DNS"; arc=none smtp.client-ip=162.243.164.118
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=stu.cdut.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=stu.cdut.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=stu.cdut.edu.cn header.i=@stu.cdut.edu.cn header.b="p7R+hcK8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=stu.cdut.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
	Message-ID:In-Reply-To:References:MIME-Version:Content-Type:
	Content-Transfer-Encoding; bh=AFygUGe/NMRez4Rwt8Hk2T5deubKgmEEm9
	s7dej5yzY=; b=p7R+hcK8TLmzNilo7XRhYrzx5TR29u4VIsHkHoFvG4qwizijiA
	IN3ClwsD3ricrC0HPdi4EV5dsgD5mYn7dh8B66WgjkqhLpXjzs+ck2+JZn1lU0E3
	tHr65TEdHvpZs10x+bfoT5ymWpyMzpmgd+UQCt8tKrgyf2wPLyXG9Q0M0=
Received: from anka-20eya00ycd (unknown [182.139.166.32])
	by hzbj-edu-front-2.icoremail.net (Coremail) with SMTP id BLQMCkBmLxdcy3pqOiwhAA--.43334S4;
	Tue, 11 Aug 2026 15:12:36 +0800 (CST)
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
Subject: [PATCH v3 2/5] docs/zh_CN: Add NIC SR-IOV APIs Chinese translation
Date: Tue, 11 Aug 2026 15:11:55 +0800
Message-ID: <20260811071200.54062-3-anka@stu.cdut.edu.cn>
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
X-CM-TRANSID:BLQMCkBmLxdcy3pqOiwhAA--.43334S4
X-Coremail-Antispam: 1UD129KBjvJXoW7Aw15XFyfAw1DAFyxAryxKrg_yoW8Kw1xpF
	WDKryxKF4xG34UGws3GF17Jry5GF1xC3y5Wrn2q3ZYqrs5Ja40qF47KF9xt3yxWrWFvFWr
	ZFsYgFW5WrWjy37anT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUP2b7Iv0xC_Cr1lb4IE77IF4wAFF20E14v26rWj6s0DM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI
	8067AKxVWUXwA2048vs2IY020Ec7CjxVAFwI0_Gr0_Xr1l8cAvFVAK0II2c7xJM28CjxkF
	64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVWUCVW8JwA2z4x0Y4vE2Ix0cI8IcV
	CY1x0267AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIE14v26F4j6r4UJwA2z4x0Y4vEx4A2jsIE
	c7CjxVAFwI0_Gr0_Gr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c
	02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE
	4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lc7CjxVAaw2AFwI0_Jw0_GFylc2xSY4
	AK67AK6r4xMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8C
	rVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8Zw
	CIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x02
	67AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr
	0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU0oU
	DJUUUUU==
X-CM-SenderInfo: ysqsjiqyqsiiiqr623vxofv3vwohv3gofq/1tbiAgUCCWp6FRFmBgAFs9

From: Siwei Chen <businiaoanka@anka1.top>

Translate .../networking/sriov.rst into Chinese.

Update the translation through commit 4558645d139c
("docs: net: document guidance of implementing the SR-IOV NDOs")

Signed-off-by: Siwei Chen <businiaoanka@anka1.top>
---
 .../translations/zh_CN/networking/index.rst   |  2 +-
 .../translations/zh_CN/networking/sriov.rst   | 31 +++++++++++++++++++
 2 files changed, 32 insertions(+), 1 deletion(-)
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
index 000000000000..bf37e68f0534
--- /dev/null
+++ b/Documentation/translations/zh_CN/networking/sriov.rst
@@ -0,0 +1,31 @@
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
+强烈建议现代网卡专注于实现 ``switchdev`` 模型（参见 :ref:`switchdev`）
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
-- 
2.53.0

