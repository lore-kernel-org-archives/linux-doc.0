Received: from smtpbguseast3.qq.com (smtpbguseast3.qq.com [54.243.244.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E92430DEC9
	for <linux-doc@vger.kernel.org>; Tue, 14 Oct 2025 07:28:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.243.244.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760426939; cv=none; b=lWLKafaknTz3zoHylG7DsN0XevJIMT2cmOYpWUPTa4x7r2kelZES65+n8yBTM4akdUCvI5t9dqCQ+0ioinPWIoqWWkVIPi3HqtyuhobRB8OzO/roVZomeoELGNxZhxKduwET3U71wH4fuWJCOGK66QX+T5KCvkHaYOsOwNYwgBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760426939; c=relaxed/simple;
	bh=ercN3m/lbiVZJOB815AgAGUqHGfZdPa0EZwJQwSSQyE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=KqHPanKwx02sE/WZj7VusCp29SuiZqXvbV+PPnsM9VhvKvnk6JO0rdrbnTih09TAF3+vK3AaIfYPcWWxBH0Fp5UP2wBFqrz/OUq3VDao5zMhZEQbt6SS8M2kz4v5yriKh7EUNw5HcXe80plVLq2yiRF7mY2c8UHKt8O6XBqpags=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mucse.com; spf=pass smtp.mailfrom=mucse.com; arc=none smtp.client-ip=54.243.244.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mucse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mucse.com
X-QQ-mid: zesmtpsz2t1760426847t5f145fa5
X-QQ-Originating-IP: P2rzOQ8Jqg5nbxg7tVaaQk/FzBrHBGNX/YnzTxqzzR0=
Received: from localhost.localdomain ( [203.174.112.180])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 14 Oct 2025 15:27:24 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 4723640594286060993
EX-QQ-RecipientCnt: 13
From: Dong Yibo <dong100@mucse.com>
To: davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	corbet@lwn.net,
	andrew+netdev@lunn.ch,
	danishanwar@ti.com,
	vadim.fedorenko@linux.dev
Cc: netdev@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dong100@mucse.com
Subject: [PATCH net-next v14 0/5] Add driver for 1Gbe network chips from MUCSE
Date: Tue, 14 Oct 2025 15:27:06 +0800
Message-Id: <20251014072711.13448-1-dong100@mucse.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:mucse.com:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: N4onniMhpCsWxmB52Ub7rDuDUVXkhkovMCu2gHVV9Qs6p6faBCl5/U/x
	bNKlQjKX4D8+2t+L/dkiuHuTHK3LG6bHsV/Aeb2M+HWzohxAUTCXP/0MR92sKpzYpEP0qxV
	C0AFKc7pAjToZs5g+H8wBhOBYCExdZs9Lmc1aHriCHztT1PTzD10Db4lITQ6yPQ9DFWA2up
	9CtgaxRLcetKf9ypmrqkh2QUIcOhUMix0A2yPawbMERCD5COn/fUib77HD9Xkx6aFula7Ld
	w/GoAz5XrV51hJAF/3U0fNI+VTxHBR4RuGKmWitAGrkLUVcxb51HdM8MJtowlBAJqbGy4mW
	3AGbpciYhvug/cXm3M2tVmtn7F7H/SRAk/gjMqvG1PjuCKX8gHOP8TIFl1pa/bIq2q1eaoh
	cbBp87MqgxAfgPSyz0RR2gTsOowG5w/AU4h5onqaDCZkgzMRZTdI+dqgeCc0esYaBP7VrcX
	jy+j4EQ9ODo5k8Jai9FyyMRx/iNLJQKNGQpMu6Le2EV0tbMCCDXJIwGpm0ZoOZtNIi2X3ZU
	Ih6vb7fIF+4w+UKlt4WG5a56C07p88PLNDFcFMm/VbAxACwK66v2y7fUzE1BBmH4JCgZAO2
	Ipa9bCedgfjYlhj5LzO0sZ5YjZjrhHso1nOY3pgrftUTvHt2ICQjmdsULoH8l8QMCXGxrCk
	g94Vd9QCoaNUtNX/meKmyW28bhIWjBzHkNiGpP7c9KbHXK6BnnNI8/keqmjzL4jL/cCJMun
	8Bemq6TCUUIcNH7zqPVCqItNVGpBJGBTQbU2c9maamwSPHGs45KV4tiUdQ4Mk8jlidiOHah
	QJMmGFwqVWOppw90A9w6CW2mFLAFtZQ2TebDdbJi78YCeBPkrT1qhbrBkzk1uaHBgaCCtMX
	p7E64wFrFq7OoJI5n+sAldbFJskXdvwWafPZ+d/SVHgDsYVy/HIEReJs3YRd9iLw9gvraeJ
	XvvCIsQ7Y4DR8R4/PAmFpfIW5k67O1UgSFgemMOivAayMb6P26BkxRGtmzfGQ25F0cmVOq5
	ZlOlsn8AboUK+IJ2MFtbfsGuGpr8w7J7BEodRtC53jCLUUrOSn
X-QQ-XMRINFO: OWPUhxQsoeAVDbp3OJHYyFg=
X-QQ-RECHKSPAM: 0

Hi maintainers,

This patch series adds support for MUCSE RNPGBE 1Gbps PCIe Ethernet controllers
(N500/N210 series), including build infrastructure, hardware initialization,
mailbox (MBX) communication with firmware, and basic netdev registration
(Can show mac witch is got from firmware, and tx/rx will be added later).

Series breakdown (5 patches):
 01/05: net: ethernet/mucse: Add build support for rnpgbe
       - Kconfig/Makefile for MUCSE vendor, basic PCI probe (no netdev)
 02/05: net: ethernet/mucse: Add N500/N210 chip support
       - netdev allocation, BAR mapping
 03/05: net: ethernet/mucse: Add basic MBX ops for PF-FW communication
       - base read/write, write with poll ack, poll and read data
 04/05: net: ethernet/mucse: Add FW commands (sync, reset, MAC query)
       - FW sync retry logic, MAC address retrieval, reset hw with
         base mbx ops in patch4
 05/05: net: ethernet/mucse: Complete netdev registration
       - HW reset, MAC setup, netdev_ops registration

Changelog:
v13 -> v14:
  [patch 1/5]:
  1. Update rnpgbe.rst (Remove copyright, fix out of order and remove
     support statements). (Jakub Kicinski)
  2. remove 'select PAGE_POOL' in Kconfig. (Jakub Kicinski)
  3. Fix MODULE_AUTHOR in rnpgbe_main.c. (Jakub Kicinski)
  [patch 5/5]:
  1. Remove mucse_hw_operations define, call func directly. (Jakub Kicinski)
  2. Add err_powerdown to handle erros after powerup. (Jakub Kicinski)
  3. Remove use deprecated netdev->stats.tx_dropped. (Jakub Kicinski)

links:
v13: https://lore.kernel.org/netdev/20250922014111.225155-1-dong100@mucse.com/
v12: https://lore.kernel.org/netdev/20250916112952.26032-1-dong100@mucse.com/
v11: https://lore.kernel.org/netdev/20250909120906.1781444-1-dong100@mucse.com/
v10: https://lore.kernel.org/netdev/20250903025430.864836-1-dong100@mucse.com/
v9 : https://lore.kernel.org/netdev/20250828025547.568563-1-dong100@mucse.com/
v8 : https://lore.kernel.org/netdev/20250827034509.501980-1-dong100@mucse.com/
v7 : https://lore.kernel.org/netdev/20250822023453.1910972-1-dong100@mucse.com
v6 : https://lore.kernel.org/netdev/20250820092154.1643120-1-dong100@mucse.com/
v5 : https://lore.kernel.org/netdev/20250818112856.1446278-1-dong100@mucse.com/
v4 : https://lore.kernel.org/netdev/20250814073855.1060601-1-dong100@mucse.com/
v3 : https://lore.kernel.org/netdev/20250812093937.882045-1-dong100@mucse.com/
v2 : https://lore.kernel.org/netdev/20250721113238.18615-1-dong100@mucse.com/
v1 : https://lore.kernel.org/netdev/20250703014859.210110-1-dong100@mucse.com/

Dong Yibo (5):
  net: rnpgbe: Add build support for rnpgbe
  net: rnpgbe: Add n500/n210 chip support with BAR2 mapping
  net: rnpgbe: Add basic mbx ops support
  net: rnpgbe: Add basic mbx_fw support
  net: rnpgbe: Add register_netdev

 .../device_drivers/ethernet/index.rst         |   1 +
 .../device_drivers/ethernet/mucse/rnpgbe.rst  |  17 +
 MAINTAINERS                                   |   8 +
 drivers/net/ethernet/Kconfig                  |   1 +
 drivers/net/ethernet/Makefile                 |   1 +
 drivers/net/ethernet/mucse/Kconfig            |  33 ++
 drivers/net/ethernet/mucse/Makefile           |   7 +
 drivers/net/ethernet/mucse/rnpgbe/Makefile    |  11 +
 drivers/net/ethernet/mucse/rnpgbe/rnpgbe.h    |  81 ++++
 .../net/ethernet/mucse/rnpgbe/rnpgbe_chip.c   | 143 ++++++
 drivers/net/ethernet/mucse/rnpgbe/rnpgbe_hw.h |  17 +
 .../net/ethernet/mucse/rnpgbe/rnpgbe_main.c   | 318 +++++++++++++
 .../net/ethernet/mucse/rnpgbe/rnpgbe_mbx.c    | 416 ++++++++++++++++++
 .../net/ethernet/mucse/rnpgbe/rnpgbe_mbx.h    |  20 +
 .../net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.c | 195 ++++++++
 .../net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.h | 121 +++++
 16 files changed, 1390 insertions(+)
 create mode 100644 Documentation/networking/device_drivers/ethernet/mucse/rnpgbe.rst
 create mode 100644 drivers/net/ethernet/mucse/Kconfig
 create mode 100644 drivers/net/ethernet/mucse/Makefile
 create mode 100644 drivers/net/ethernet/mucse/rnpgbe/Makefile
 create mode 100644 drivers/net/ethernet/mucse/rnpgbe/rnpgbe.h
 create mode 100644 drivers/net/ethernet/mucse/rnpgbe/rnpgbe_chip.c
 create mode 100644 drivers/net/ethernet/mucse/rnpgbe/rnpgbe_hw.h
 create mode 100644 drivers/net/ethernet/mucse/rnpgbe/rnpgbe_main.c
 create mode 100644 drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx.c
 create mode 100644 drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx.h
 create mode 100644 drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.c
 create mode 100644 drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.h

-- 
2.25.1

