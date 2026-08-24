Received: from zg8tmtyylji0my4xnjqumte4.icoremail.net (zg8tmtyylji0my4xnjqumte4.icoremail.net [162.243.164.118])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C906035AC09;
	Mon, 24 Aug 2026 04:38:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.243.164.118
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787546332; cv=none; b=GURmXaBySkM9jg4LezkusQ/uo9FxxjIGcc5CQZ3KlhBHOvGlbWmttAKtOO7GuwmmISQbCAO+WSvsbXRQear1AYpFGF0PlVqGcN6/F0qqHPqUpnhpjm9ey/1z3sbBnHWpRslM6eWsy62Kyv3DqFSKrGTsb4+n4Nbs1cw9FYy4WoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787546332; c=relaxed/simple;
	bh=CGAICcSRseD7Wf+MuVYGKawnvakWII93NoigH/ccd5I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=NcYE67LioJH6bVI0XjlILBVXMeYeeiAvn8QIw/9fKQm1y3rhCen7BsPbBpunHAGEf+2yGjWINiRWK4Wgz92MBf1Ifz6+lU+/b9fLRZRyH6+uytohB91+2p+3fNDFT98yx51q8Hye5ISfPM+NBfV+k8ONjjwljg3DLeY1KDv5vZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=stu.cdut.edu.cn; spf=none smtp.mailfrom=stu.cdut.edu.cn; dkim=fail (0-bit key) header.d=stu.cdut.edu.cn header.i=@stu.cdut.edu.cn header.b=ROoEJp7P reason="key not found in DNS"; arc=none smtp.client-ip=162.243.164.118
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=stu.cdut.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=stu.cdut.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=stu.cdut.edu.cn header.i=@stu.cdut.edu.cn header.b="ROoEJp7P"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=stu.cdut.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
	Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=1YfWsKMQb296UCv3w/zzf60InRM1HBO9ym3Q+Fz/PgQ=; b=ROoEJp7PyCiDS
	4nyTleSghvF/NZmp8zj0jNixPRzGqPRwRyx4oJEol+VD1sj2mBKQcHTuB35G3q94
	yR/X2XePVi5KB4mUJVp6AY6WuspQ5hIRDbb2NnhB6aoIV7Y/iAc/m5HY+bH1lAHP
	V+4YDdSVruUXGktKIyYt3jc9XDU3JM=
Received: from anka-20eya00ycd (unknown [182.139.166.197])
	by hzbj-edu-front-4.icoremail.net (Coremail) with SMTP id BrQMCkB22cTAyotq7CuVAA--.65162S2;
	Mon, 24 Aug 2026 12:38:25 +0800 (CST)
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
Subject: [PATCH v5 0/5] docs/zh_CN: Add Chinese translations for five networking documents
Date: Mon, 24 Aug 2026 12:37:59 +0800
Message-ID: <20260824043806.46731-1-anka@stu.cdut.edu.cn>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:BrQMCkB22cTAyotq7CuVAA--.65162S2
X-Coremail-Antispam: 1UD129KBjvJXoWxXFyfZF47ZFyUXF47CF43GFg_yoW5Wr1Dpa
	15KrWfJ3W7AF17tws7Gw47ZF1rA3WxG39xGw12qwnYqrs0yFyrtr42yF9I9asIqrW0qFy5
	XF4SkFy5uryUArJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvFb7Iv0xC_Zr1lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8JVWxJwA2z4x0Y4vEx4
	A2jsIEc7CjxVAFwI0_Gr0_Gr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI
	64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8Jw
	Am72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lc7CjxVAaw2AFwI0_Jw0_GFyl
	c2xSY4AK67AK6r45MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I
	0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWU
	tVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcV
	CY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAF
	wI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvj
	xU4ZjjDUUUU
X-CM-SenderInfo: ysqsjiqyqsiiiqr623vxofv3vwohv3gofq/1tbiAgUPCWqLOJRfWAAAsL

From: Siwei Chen <businiaoanka@anka1.top>

This series adds Simplified Chinese translations for five documents
under Documentation/networking/:

  - team.rst: Team devices driven from userspace via libteam
  - sriov.rst: NIC SR-IOV APIs (switchdev model and legacy API)
  - driver.rst: Softnet driver issues (probing, close/stop,
    transmit path guidelines, and extack error reporting)
  - ipv6.rst: ipv6 module parameters (disable, autoconf,
    disable_ipv6)
  - secid.rst: LSM/SELinux secid usage in the flowi structure

Changes in v5:
  - Use direct link instead of ":ref:" to fix the warning of 
    "undefined label" in the translation of "sriov.rst" since "switchdev" 
    documentation has no translation in the same directory.
  - Revise the commit title: "SeLinux" -> "SELinux".
  - Translate "flowi structure" and "flow structure" into 
    "flowi structure" uniformly in the translation of "secid.rst".
  - Link to v4: https://lore.kernel.org/linux-doc/20260817021340.17318-1-anka@stu.cdut.edu.cn/

Changes in v4:
  - Fix two minor issues in the translation of "ipv6.rst" and "secid.rst".
  - Link to v3: https://lore.kernel.org/linux-doc/20260811071200.54062-1-anka@stu.cdut.edu.cn/

Changes in v3:
  - Remove spaces before and after "（".
  - Add a missing space after "IPv6".
  - Update the translation of "secid".
  - Link to v2: https://lore.kernel.org/linux-doc/20260727073538.56951-1-anka@stu.cdut.edu.cn/

Changes in v2:
  - Add translated documents to corresponding index file.
  - Link to v1: https://lore.kernel.org/linux-doc/cover.1784866896.git.businiaoanka@anka1.top/

Siwei Chen (5):
  docs/zh_CN: Add networking team documentation Chinese translation
  docs/zh_CN: Add NIC SR-IOV APIs Chinese translation
  docs/zh_CN: Add Softnet Driver Issues Chinese translation
  docs/zh_CN: Add ipv6 Chinese translation
  docs/zh_CN: Add LSM/SELinux secid Chinese translation

 .../translations/zh_CN/networking/driver.rst  | 138 ++++++++++++++++++
 .../translations/zh_CN/networking/index.rst   |  10 +-
 .../translations/zh_CN/networking/ipv6.rst    |  76 ++++++++++
 .../translations/zh_CN/networking/secid.rst   |  24 +++
 .../translations/zh_CN/networking/sriov.rst   |  34 +++++
 .../translations/zh_CN/networking/team.rst    |  16 ++
 6 files changed, 293 insertions(+), 5 deletions(-)
 create mode 100644 Documentation/translations/zh_CN/networking/driver.rst
 create mode 100644 Documentation/translations/zh_CN/networking/ipv6.rst
 create mode 100644 Documentation/translations/zh_CN/networking/secid.rst
 create mode 100644 Documentation/translations/zh_CN/networking/sriov.rst
 create mode 100644 Documentation/translations/zh_CN/networking/team.rst

-- 
2.53.0

