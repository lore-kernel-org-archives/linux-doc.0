Received: from zg8tmtyylji0my4xnjqumte4.icoremail.net (zg8tmtyylji0my4xnjqumte4.icoremail.net [162.243.164.118])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92E47233958;
	Mon, 17 Aug 2026 02:14:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.243.164.118
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786932876; cv=none; b=lkJTerEp6sD9klf4b/i+MT3Nx49VtmQOFQR6yVFonM8ZcPYXnEyZ1nwyi+t7CHcMsqEpe5YBHT1mxxY5nJPgpNlcrSIKadf5tBe4hXMbtEt17heH0xs5y9Zw4/QLbAv6adphml7TV6HJNXCD7sgsU07n5Yqo2zk6Ksg43smmYr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786932876; c=relaxed/simple;
	bh=GK9At5MbxilRxyf5HHgFWOEXyhe6u/7Obv+VMKzfkM8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=OMEEdSbN8LqIpoJIlSzNgtwEeE2+pjDCvmw5t0f+UaDCuNa64T/2I7VN1h7Oald+C8bROWnvnnLJAMGtsm8hSeaYDFmeUCzetj+M+sv9pYxmn90HXitnWIk5c8vTcu42RkfGw4GNksS7dkLmwYFH6dalen2BIRP+qaf8+TWCT3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=stu.cdut.edu.cn; spf=none smtp.mailfrom=stu.cdut.edu.cn; dkim=fail (0-bit key) header.d=stu.cdut.edu.cn header.i=@stu.cdut.edu.cn header.b=w8bKzlXp reason="key not found in DNS"; arc=none smtp.client-ip=162.243.164.118
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=stu.cdut.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=stu.cdut.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=stu.cdut.edu.cn header.i=@stu.cdut.edu.cn header.b="w8bKzlXp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=stu.cdut.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
	Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=qtqSR/KJD1rgN3sSVES8IaqhKbdYtnO6SHbjYGi//IY=; b=w8bKzlXpMH5b9
	lgLRCMlxcEaCYP28j53JyoZ4JGo3M1R5/ueMwRYq3NgSRrIZtwDVr5K/6h/wruq4
	d22DI0unqJdsdqSfwOy3nlvtIyPfax6+r6f8znELAGO0cag4zeHdqFmlSIwY3OWr
	NiPCKjqSnVqUIdktUhPPYBSiyaKpxY=
Received: from anka-20eya00ycd (unknown [182.139.166.85])
	by hzbj-edu-front-4.icoremail.net (Coremail) with SMTP id BrQMCkBmycR2boJq_v1jAA--.23758S2;
	Mon, 17 Aug 2026 10:14:15 +0800 (CST)
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
Subject: [PATCH v4 0/5] docs/zh_CN: Add Chinese translations for five networking documents
Date: Mon, 17 Aug 2026 10:13:34 +0800
Message-ID: <20260817021340.17318-1-anka@stu.cdut.edu.cn>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:BrQMCkBmycR2boJq_v1jAA--.23758S2
X-Coremail-Antispam: 1UD129KBjvJXoW7uFy8Zw47GFy5Jr4DZw1UWrg_yoW8Kr1xpa
	15KrWfJ3W7CF17tws7Ga17AF1rG3WfG39xGw17Xwnaqrs0yFyrtrsFyr9I9asxtrW0qFyY
	qF4SkFy5uFyjyrJanT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUv2b7Iv0xC_Zr1lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8JVWxJwA2z4x0Y4vEx4
	A2jsIEc7CjxVAFwI0_Gr0_Gr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI
	64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r106r15McIj6I8E87Iv67AKxVWUJVW8Jw
	Am72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lc7CjxVAaw2AFwI0_Jw0_GFyl
	c2xSY4AK67AK6r4UMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I
	0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWU
	tVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1I6r4UMIIF0xvE2Ix0cI8IcV
	CY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAF
	wI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa
	7IU8oUDPUUUUU==
X-CM-SenderInfo: ysqsjiqyqsiiiqr623vxofv3vwohv3gofq/1tbiAgUICWqB-hMt-AACsT

From: Siwei Chen <businiaoanka@anka1.top>

This series adds Simplified Chinese translations for five documents
under Documentation/networking/:

  - team.rst: Team devices driven from userspace via libteam
  - sriov.rst: NIC SR-IOV APIs (switchdev model and legacy API)
  - driver.rst: Softnet driver issues (probing, close/stop,
    transmit path guidelines, and extack error reporting)
  - ipv6.rst: ipv6 module parameters (disable, autoconf,
    disable_ipv6)
  - secid.rst: LSM/SeLinux secid usage in the flowi structure

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
  docs/zh_CN: Add LSM/SeLinux secid Chinese translation

 .../translations/zh_CN/networking/driver.rst  | 138 ++++++++++++++++++
 .../translations/zh_CN/networking/index.rst   |  10 +-
 .../translations/zh_CN/networking/ipv6.rst    |  76 ++++++++++
 .../translations/zh_CN/networking/secid.rst   |  24 +++
 .../translations/zh_CN/networking/sriov.rst   |  31 ++++
 .../translations/zh_CN/networking/team.rst    |  16 ++
 6 files changed, 290 insertions(+), 5 deletions(-)
 create mode 100644 Documentation/translations/zh_CN/networking/driver.rst
 create mode 100644 Documentation/translations/zh_CN/networking/ipv6.rst
 create mode 100644 Documentation/translations/zh_CN/networking/secid.rst
 create mode 100644 Documentation/translations/zh_CN/networking/sriov.rst
 create mode 100644 Documentation/translations/zh_CN/networking/team.rst

-- 
2.53.0

