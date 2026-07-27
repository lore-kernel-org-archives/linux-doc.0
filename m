Received: from zg8tmtyylji0my4xnjqumte4.icoremail.net (zg8tmtyylji0my4xnjqumte4.icoremail.net [162.243.164.118])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4288C233949;
	Mon, 27 Jul 2026 07:36:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.243.164.118
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785137786; cv=none; b=tkognhFTY3z4jfGsuWdEuyj5LeVG4Wuzsf5hjB6gTVUQeITeWK5c732mAqNWIJqePFprHz8zyrVAEoSCjoRu7ptqwki4e4QiFSIN9Ur2xxvLaT+cUJRq2BEgGrch6f41wZiYTeLeKMe+P3yurm3kp9e4igxDD4lWsUHtLQlONAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785137786; c=relaxed/simple;
	bh=MQVVOvu1ROlaB/v0DXQb75i3gq9wo90WC7AROW8Skr8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NSKreFZDxANYC98RBYBLdalR6yDJJbR/J/3TtHv1MzpXyKlMO9F4S/wxpQ6EIOZ2rR0yfzdVrEh3Axq1wCnE0Ux8UhU5sEbXv+xurvZOne1wIvD/8sQfrdPlE4AERJr2/dx6opMlbfe3EL0tERlRiR7yEsrmceOEelotX5a//e8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=stu.cdut.edu.cn; spf=none smtp.mailfrom=stu.cdut.edu.cn; dkim=fail (0-bit key) header.d=stu.cdut.edu.cn header.i=@stu.cdut.edu.cn header.b=gmDoqRoM reason="key not found in DNS"; arc=none smtp.client-ip=162.243.164.118
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=stu.cdut.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=stu.cdut.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=stu.cdut.edu.cn header.i=@stu.cdut.edu.cn header.b="gmDoqRoM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=stu.cdut.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
	Message-ID:MIME-Version:Content-Transfer-Encoding; bh=6pFtalzaF/
	rUqRM7y6D2+XBEot7ISunaTddMHK5fx44=; b=gmDoqRoMGENCz8HqI8TWhulA86
	hvoR+K5vxlZtu61QvtCSkT/7SdSHTZNfgV4V7yUorAc5aBwCFmRodyP6YjK4Qfpg
	d9v1ZyBs5k3q6H1jKXZFVpec3Q+eetaCKfXrNyUISeX2bchBp/0eB2FZGsCl+6pK
	agwetILrGeLUgEY+w=
Received: from anka-20eya00ycd (unknown [182.139.167.230])
	by hzbj-edu-front-4.icoremail.net (Coremail) with SMTP id BrQMCkCGpw1lCmdqR_CFAQ--.59332S2;
	Mon, 27 Jul 2026 15:36:06 +0800 (CST)
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
Subject: [PATCH v2 0/5] docs/zh_CN: Add Chinese translations for five networking documents
Date: Mon, 27 Jul 2026 15:35:31 +0800
Message-ID: <20260727073538.56951-1-anka@stu.cdut.edu.cn>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:BrQMCkCGpw1lCmdqR_CFAQ--.59332S2
X-Coremail-Antispam: 1UD129KBjvJXoW7uFy8Zw47GFy5Jr4DZw1UWrg_yoW8CFyrpa
	15KryfJa1UCF12yws7GF4UAF1rC3WxG39xGw17XwnYqrsYyFWrtrsrtr9I9a4xtrW0qFyY
	vrsakr15WFyjyrJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUv2b7Iv0xC_Zr1lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8JVWxJwA2z4x0Y4vEx4
	A2jsIEc7CjxVAFwI0_Gr0_Gr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI
	64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8Jw
	Am72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lc7CjxVAaw2AFwI0_Jw0_GFyl
	c2xSY4AK67AK6r4xMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I
	0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWU
	tVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcV
	CY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAF
	wI0_Gr0_Cr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa
	7IU89vtJUUUUU==
X-CM-SenderInfo: ysqsjiqyqsiiiqr623vxofv3vwohv3gofq/1tbiAQUHCWpmJOxeBAAAsU

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

Changes in v2:
  - Add translated documents to corresponding index file.
  - Link to v1: https://lore.kernel.org/linux-doc/54B9FF7CF7DE776B+6294277.lOV4Wx5bFT@anka-20eya00ycd/T/#t

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

