Received: from zg8tmtyylji0my4xnjqumte4.icoremail.net (zg8tmtyylji0my4xnjqumte4.icoremail.net [162.243.164.118])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E04A93515DC;
	Fri, 24 Jul 2026 05:14:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.243.164.118
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784870060; cv=none; b=ZxTXQxXx7KVOm8HhEE7qOkAqDdFlYCbUX3HR42QtgEPZvDNhCicpnCCPGPUPxXzfVTNT6YBVapGSYACTKIRo3XV/YEUvGeZji1ff/aaXQFo+7frtojLEMR2zzosaZ04cb4anzuMNAzNtaowRcH3X6CL6waEt62+dZQw3C5vc8uA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784870060; c=relaxed/simple;
	bh=+SgIy9B88btKNEu+H1lDCv7oMZMXInXzj4ew9XtynfU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IuyKW58y7fY0cK+DlbxpXDcXhD4B+HV4UD36b5sgAckzppD3f3fBQ30WsqTF5OnOeQ7Ir7UqcdkjAv0Vl5bgWqw2h4OzPzi29dQggaOP5RXyFb02ZrSovHm/10jLDvZMq3mpHs7HirTzX/7PjVPLLxATPmCjNHjXN1mMP3KXBuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=stu.cdut.edu.cn; spf=none smtp.mailfrom=stu.cdut.edu.cn; dkim=fail (0-bit key) header.d=stu.cdut.edu.cn header.i=@stu.cdut.edu.cn header.b=asWG7CA9 reason="key not found in DNS"; arc=none smtp.client-ip=162.243.164.118
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=stu.cdut.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=stu.cdut.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=stu.cdut.edu.cn header.i=@stu.cdut.edu.cn header.b="asWG7CA9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=stu.cdut.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
	Message-ID:MIME-Version:Content-Transfer-Encoding; bh=+w6U08F+Il
	uTNMgPACAfS8fbdS6++9y32bI6MrSKyJM=; b=asWG7CA9snTtDCa1+3vYHVLxHU
	9PJZLv/h++gF4BLnL1VpV4+5OBUZD0ReUGSvCfogFj3Dr3MUvSW7UVnBwrfVBNEh
	EzqwBCsQHT1o2QgzYkoTNk8xMj0nitQEW30ZGbjdYGXNAbP4pgQQFzCCD9zHrbvk
	he7CMBu4KrV3QUV+c=
Received: from anka-20eya00ycd (unknown [125.71.206.65])
	by hzbj-edu-front-4.icoremail.net (Coremail) with SMTP id BrQMCkCWuQ+Z9GJqNR5nAQ--.32373S2;
	Fri, 24 Jul 2026 13:14:02 +0800 (CST)
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
Subject: [PATCH 0/5] docs/zh_CN: Add Chinese translations for five networking documents
Date: Fri, 24 Jul 2026 13:13:36 +0800
Message-ID: <cover.1784866896.git.businiaoanka@anka1.top>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:BrQMCkCWuQ+Z9GJqNR5nAQ--.32373S2
X-Coremail-Antispam: 1UD129KBjvJXoW7uFy8Zw47GFy5Jr4DZw1UWrg_yoW8WF18p3
	W5KryfJa1UCF17tws7GF47AF1rA3WxG39xKw17XwnYqrs5tFWrtrsrtr9I9a4ftry0qFyY
	qrsakr15WFWjyrJanT9S1TB71UUUUUJqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU90b7Iv0xC_Cr1lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8JVWxJwA2z4x0Y4vEx4
	A2jsIEc7CjxVAFwI0_Gr0_Gr1UM2kKe7AKxVWUXVWUAwAS0I0E0xvYzxvE52x082IY62kv
	0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z2
	80aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxkF7I0E
	n4kS14v26r1q6r43MxkIecxEwVAFwVW8WwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7x
	kEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E
	67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCw
	CI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1x
	MIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIda
	VFxhVjvjDU0xZFpf9x07jY-erUUUUU=
X-CM-SenderInfo: ysqsjiqyqsiiiqr623vxofv3vwohv3gofq/1tbiAQUECWpiMGtl+QAAsG

From: Siwei Chen <businiaoanka@anka1.top>

This series adds Simplified Chinese translations for five documents
under Documentation/networking/:

  - team.rst:  Team devices driven from userspace via libteam
  - sriov.rst: NIC SR-IOV APIs (switchdev model and legacy API)
  - driver.rst: Softnet driver issues (probing, close/stop,
    transmit path guidelines, and extack error reporting)
  - ipv6.rst:  ipv6 module parameters (disable, autoconf,
    disable_ipv6)
  - secid.rst: LSM/SELinux secid usage in the flowi structure

Siwei Chen (5):
  docs/zh_CN: Add networking team documentation Chinese translation
  docs/zh_CN: Add NIC SR-IOV APIs Chinese translation
  docs/zh_CN: Add Softnet Driver Issues Chinese translation
  docs/zh_CN: Add ipv6 Chinese translation
  docs/zh_CN: Add LSM/SeLinux secid Chinese translation

 .../translations/zh_CN/networking/driver.rst  | 138 ++++++++++++++++++
 .../translations/zh_CN/networking/ipv6.rst    |  76 ++++++++++
 .../translations/zh_CN/networking/secid.rst   |  24 +++
 .../translations/zh_CN/networking/sriov.rst   |  31 ++++
 .../translations/zh_CN/networking/team.rst    |  16 ++
 5 files changed, 285 insertions(+)
 create mode 100644 Documentation/translations/zh_CN/networking/driver.rst
 create mode 100644 Documentation/translations/zh_CN/networking/ipv6.rst
 create mode 100644 Documentation/translations/zh_CN/networking/secid.rst
 create mode 100644 Documentation/translations/zh_CN/networking/sriov.rst
 create mode 100644 Documentation/translations/zh_CN/networking/team.rst

-- 
2.53.0

