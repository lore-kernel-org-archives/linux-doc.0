Received: from zg8tmtyylji0my4xnjqumte4.icoremail.net (zg8tmtyylji0my4xnjqumte4.icoremail.net [162.243.164.118])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E037B345CCD;
	Fri, 24 Jul 2026 05:14:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.243.164.118
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784870060; cv=none; b=g8g/jp5ZEKDjc5vqubOipv+hB2rsazsrMPE0GEHK5W5SBOPBvy+/Qn+uIDXz45QkzbhDK/eTKJ/dEB6LoonmpmutmDkUVEmf8di2Dw+51MtYrZJuJ/HjzsfAH1QfTbcJbxYuJoAMnmKUSlewTNErbSxxW86Hmql5vARbwQBu1B8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784870060; c=relaxed/simple;
	bh=SD33gL78Fyh1evNoCtQ34eG/5KU8y9xZBoa0jN+NXE8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KDEavWX+gx+ys8IWk27+iFwopPRqr3iaf6WcoxplPq2MmngX47CvF5KU+qdNmFcUKcgPy6r6Toy/rAt3IAQzj7stoF3mpDmKAO1eWVdmy3jz1oja8QjIq20SJURp4QqYOsEyTNlapYXGq+cjU1IkepyVaXetzE4BuONXrE0mDlg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=stu.cdut.edu.cn; spf=none smtp.mailfrom=stu.cdut.edu.cn; dkim=fail (0-bit key) header.d=stu.cdut.edu.cn header.i=@stu.cdut.edu.cn header.b=GdNidWK0 reason="key not found in DNS"; arc=none smtp.client-ip=162.243.164.118
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=stu.cdut.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=stu.cdut.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=stu.cdut.edu.cn header.i=@stu.cdut.edu.cn header.b="GdNidWK0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=stu.cdut.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
	Message-ID:In-Reply-To:References:MIME-Version:Content-Type:
	Content-Transfer-Encoding; bh=Lg7ec6v//PFlifG6DbosuRxwfavFLNmZpw
	XHjSRneqs=; b=GdNidWK0K20J6X90gQVPnAympc719Bv7cx7jxHyvLdCwb0E0bJ
	Rf1p7n0kGJLlM2K6VPXxGo55xC+pANHDWtWc3xIN43nrk8mNRnJil8kXKoL1t6VE
	OFycxwiGxBtmDwyYvn5Hjle/DsA3l/KIQBDd700mDEB+h/JCxCkuSJRbQ=
Received: from anka-20eya00ycd (unknown [125.71.206.65])
	by hzbj-edu-front-4.icoremail.net (Coremail) with SMTP id BrQMCkCWuQ+Z9GJqNR5nAQ--.32373S4;
	Fri, 24 Jul 2026 13:14:09 +0800 (CST)
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
Subject: [PATCH 2/5] docs/zh_CN: Add NIC SR-IOV APIs Chinese translation
Date: Fri, 24 Jul 2026 13:13:38 +0800
Message-ID: <e8b43e2bdb7b8000b8cc9869114dab8adaa424e7.1784866896.git.businiaoanka@anka1.top>
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
X-CM-TRANSID:BrQMCkCWuQ+Z9GJqNR5nAQ--.32373S4
X-Coremail-Antispam: 1UD129KBjvJXoW7Aw15Ww47tryUCw1kCFWrGrg_yoW8Aw4xpF
	4DKFySkF4xG3srGrs3G3W7Jry5GF1xC3y5Wr92q3ZYqrsYy3WYqF43tF9xt3y8C3yvyFyr
	ZFsa9FWY9ryUC37anT9S1TB71UUUUUJqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUmjb7Iv0xC_Cr1lb4IE77IF4wAFF20E14v26rWj6s0DM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI
	8067AKxVWUXwA2048vs2IY020Ec7CjxVAFwI0_Gr0_Xr1l8cAvFVAK0II2c7xJM28CjxkF
	64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVWUJVWUCwA2z4x0Y4vE2Ix0cI8IcV
	CY1x0267AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIE14v26r4j6F4UM28EF7xvwVC2z280aVCY
	1x0267AKxVW8JVW8Jr1ln4kS14v26r1Y6r17M2AIxVAIcxkEcVAq07x20xvEncxIr21l5I
	8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AK
	xVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lc7CjxVAaw2AFwI
	0_Jw0_GFylc2xSY4AK67AK6r4rMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j
	6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7
	AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE
	2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcV
	C2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2Kfnx
	nUUI43ZEXa7IU0aiiDUUUUU==
X-CM-SenderInfo: ysqsjiqyqsiiiqr623vxofv3vwohv3gofq/1tbiAQUECWpiMGtmAAAAs8

From: Siwei Chen <businiaoanka@anka1.top>

Translate .../networking/sriov.rst into Chinese.

Update the translation through commit 4558645d139c
("docs: net: document guidance of implementing the SR-IOV NDOs")

Signed-off-by: Siwei Chen <businiaoanka@anka1.top>
---
 .../translations/zh_CN/networking/sriov.rst   | 31 +++++++++++++++++++
 1 file changed, 31 insertions(+)
 create mode 100644 Documentation/translations/zh_CN/networking/sriov.rst

diff --git a/Documentation/translations/zh_CN/networking/sriov.rst b/Documentation/translations/zh_CN/networking/sriov.rst
new file mode 100644
index 000000000000..be9c2f271ca2
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
+强烈建议现代网卡专注于实现 ``switchdev`` 模型（ 参见 :ref:`switchdev` ）
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

