Received: from zg8tmtyylji0my4xnjqumte4.icoremail.net (zg8tmtyylji0my4xnjqumte4.icoremail.net [162.243.164.118])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E04283515C9;
	Fri, 24 Jul 2026 05:14:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.243.164.118
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784870061; cv=none; b=YvHFuMrX9tpOb/46xo4ynO1rcxmvWMseFm8mvRzFWmaHqvJuL9HdpCx+fdcovcBT+szkDD2DGBjk21zJA1v55g/PFQUTN9bkjUzi/sqtX2/ppJ/Q/9d6Gk89aBuPmRPcKPL8ZKaZ8Ac0cVzXvUTN84PIM/OjBJAgqbogb29rT0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784870061; c=relaxed/simple;
	bh=86AVRuJP7xsmA0x6YnxXFzYhg7oS95a1j7cnpUeIipc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Kw+uS2N/x32265ZVHoESqAXRcU4wS9nWio5vA7HfxNYze7+g9tvVj9yExI2YXT7hh8NrOi/vmEJZqxj+wSwubSJp3blFx6Jb54rxN2oeuvF5ORvcF5cbCEx3lKVv9ZAfTH0iHOpSyaxJocDk3t3qZrvKKXvzZ8HPt+uZkDDuAAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=stu.cdut.edu.cn; spf=none smtp.mailfrom=stu.cdut.edu.cn; dkim=fail (0-bit key) header.d=stu.cdut.edu.cn header.i=@stu.cdut.edu.cn header.b=xdZRBnrK reason="key not found in DNS"; arc=none smtp.client-ip=162.243.164.118
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=stu.cdut.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=stu.cdut.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=stu.cdut.edu.cn header.i=@stu.cdut.edu.cn header.b="xdZRBnrK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=stu.cdut.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
	Message-ID:In-Reply-To:References:MIME-Version:Content-Type:
	Content-Transfer-Encoding; bh=WAkqaYiqlbMRnmsQc230mFolXTuY0pXRzH
	R9TwGW98U=; b=xdZRBnrKEHB3IPmDgzt06AW/uRU5PKkYYZgE8TYF0RUAaBSXLn
	kpRSeNMVQyZB+FHuymwhnxRND6WoD1ptq/I4Smpi9VcAsBV9V4ZF419KelO863fY
	z9JIdv7ZxlhcePjYWSlS6iUrhdgzSMnTJDrJWjmPkNVxexuL2gDffztFA=
Received: from anka-20eya00ycd (unknown [125.71.206.65])
	by hzbj-edu-front-4.icoremail.net (Coremail) with SMTP id BrQMCkCWuQ+Z9GJqNR5nAQ--.32373S3;
	Fri, 24 Jul 2026 13:14:06 +0800 (CST)
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
Subject: [PATCH 1/5] docs/zh_CN: Add networking team documentation Chinese translation
Date: Fri, 24 Jul 2026 13:13:37 +0800
Message-ID: <2aa998eee1428ef5bcaeb9673ecbe0693e8a790c.1784866896.git.businiaoanka@anka1.top>
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
X-CM-TRANSID:BrQMCkCWuQ+Z9GJqNR5nAQ--.32373S3
X-Coremail-Antispam: 1UD129KBjvdXoWrKFy8Cw4rJr4UCr1kXF4DXFb_yoWkurgEk3
	4vqFWkCa18ZF10ga18JF18Jry8CF4xCr10qF4Yya98Aw4qywsrJFnrXwn7tF1vgwsrury3
	CrZrWr1fXr12gjkaLaAFLSUrUUUU1b8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbk8YjsxI4VWxJwAYFVCjjxCrM7AC8VAFwI0_Xr0_Wr1l1xkIjI8I
	6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l82xGYIkIc2x26280x7
	IE14v26r18M28IrcIa0xkI8VCY1x0267AKxVWUCVW8JwA2ocxC64kIII0Yj41l84x0c7CE
	w4AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6x
	kF7I0E14v26r4j6F4UM28EF7xvwVC2z280aVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv6xkF
	7I0E14v26r4j6r4UJwAaw2AFwI0_Jrv_JF1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4
	xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v2
	6r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCY1x0262kKe7AKxV
	WUtVW8ZwCY02Avz4vE14v_GrWl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_
	Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17
	CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0
	I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I
	8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73
	UjIFyTuYvjxU4l4iUUUUU
X-CM-SenderInfo: ysqsjiqyqsiiiqr623vxofv3vwohv3gofq/1tbiAgUECWpiL-pkqwAAsY

From: Siwei Chen <businiaoanka@anka1.top>

Translate .../networking/team.rst into Chinese.

Update the translation through commit aa8a6ee3e3fc
("docs: networking: convert team.txt to ReST")

Signed-off-by: Siwei Chen <businiaoanka@anka1.top>
---
 .../translations/zh_CN/networking/team.rst       | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 Documentation/translations/zh_CN/networking/team.rst

diff --git a/Documentation/translations/zh_CN/networking/team.rst b/Documentation/translations/zh_CN/networking/team.rst
new file mode 100644
index 000000000000..e6cf19a245a1
--- /dev/null
+++ b/Documentation/translations/zh_CN/networking/team.rst
@@ -0,0 +1,16 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+.. include:: ../disclaimer-zh_CN.rst
+
+:Original: Documentation/networking/team.rst
+
+:翻译:
+
+	陈思为 Siwei Chen <businiaoanka@anka1.top>
+
+====================
+Team（网络接口聚合）
+====================
+
+Team 设备由用户空间通过 libteam 库驱动，该库位于：
+	https://github.com/jpirko/libteam
-- 
2.53.0

