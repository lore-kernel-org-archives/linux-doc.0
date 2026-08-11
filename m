Received: from zg8tmtyylji0my4xnjqumte4.icoremail.net (zg8tmtyylji0my4xnjqumte4.icoremail.net [162.243.164.118])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D81A33439A;
	Tue, 11 Aug 2026 07:12:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.243.164.118
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786432377; cv=none; b=QJeO7kWb2Tb35BEaja92953nk+k3q4AC7ylsF8S6zv5Lc4q2HCvfta89H3Ex3g/5iCeaCphkTCJTRVmoC+JXjf6zW4HpgjyqLabEsqMa/qXUw6eySx351QI8bRP7LNHESyNNJz6C7fbnhmktXba7XuPl8Ib7rfULonJct3to8oM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786432377; c=relaxed/simple;
	bh=AcyJVZCdSC5oCObdz4d5LxfPL4T1sGMWOEyhiXDPU7s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=F1RGR2V6ncLH4NTGvrAcZEbH7LQUmqQ58AOKZEFPJQrpsM+jAc9j+2hDBjJrZJWO9yGR7qkyHJJKIjo7f603N3Po3eM9YVOKbk5rk0XuJl+m/VaGmnI4F2tT38raasXuo7qECqDLI2pejUqv59NxStx35cb0kPtxBxtkIehWeCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=stu.cdut.edu.cn; spf=none smtp.mailfrom=stu.cdut.edu.cn; dkim=fail (0-bit key) header.d=stu.cdut.edu.cn header.i=@stu.cdut.edu.cn header.b=sp/t9CqA reason="key not found in DNS"; arc=none smtp.client-ip=162.243.164.118
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=stu.cdut.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=stu.cdut.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=stu.cdut.edu.cn header.i=@stu.cdut.edu.cn header.b="sp/t9CqA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=stu.cdut.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
	Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=8YLFfBDNUIRrNNLW96K4+c8l4Je5usQu1/4bUfc3SXY=; b=sp/t9CqAPDXz+
	664ZdJsRcUCcHT7m6idk2LNhjM0dGpA4vJnQPlzS03EY1n6aPtKVoDOjE8SzR9B2
	IzWaIi6FHAH1ifMv5WCREBIaFXGRwlQlB9WJUCw9UgRCuO6ISwAOU3qlOaLMMVP3
	hF4KU/JV7gtliALbCUOYSFFoqV3z6Q=
Received: from anka-20eya00ycd (unknown [182.139.166.32])
	by hzbj-edu-front-2.icoremail.net (Coremail) with SMTP id BLQMCkBmLxdcy3pqOiwhAA--.43334S2;
	Tue, 11 Aug 2026 15:12:30 +0800 (CST)
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
Subject: [PATCH v3 0/5] docs/zh_CN: Add Chinese translations for five networking documents
Date: Tue, 11 Aug 2026 15:11:53 +0800
Message-ID: <20260811071200.54062-1-anka@stu.cdut.edu.cn>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:BLQMCkBmLxdcy3pqOiwhAA--.43334S2
X-Coremail-Antispam: 1UD129KBjvJXoW7uFy8Zw47GFy5Jr4DZw1UWrg_yoW8uF17pa
	15KryfJ3W7CF12yws7GF47AF1rG3WxG39xKw17XwnYqrs8tFyrtrsrtr9I9a43trW0qFy5
	XFsakFW5WFyjyrJanT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvIb7Iv0xC_Zr1lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJVW8Jr1l84ACjcxK6I
	8E87Iv6xkF7I0E14v26r4j6r4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC
	0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr
	1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxkF7I0En4kS14v26r1q6r43
	MxkIecxEwVAFwVW8CwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s
	026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_
	Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20x
	vEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE
	14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf
	9x07jYmhrUUUUU=
X-CM-SenderInfo: ysqsjiqyqsiiiqr623vxofv3vwohv3gofq/1tbiAgUCCWp6FRFmBgADs7

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
  - Link to v1: https://lore.kernel.org/linux-doc/cover.1784866896.git.businiaoanka@anka1.top/

Changes in v3:
  - Remove spaces before and after "（".
  - Add a missing space after "IPv6".
  - Update the translation of "secid".
  - Link to v2: https://lore.kernel.org/linux-doc/20260727073538.56951-1-anka@stu.cdut.edu.cn/

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

