Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 731D624A7C0;
	Thu, 16 Jan 2025 04:59:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=207.54.90.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737003573; cv=none; b=cN8+WXXrnutFJXxflNb7M465t61triZ+90WVwcfUZlqp7i49Pit8o8i+R3vN5I7RxMDxr2HtQEAosPntRHyK7Qaxla/O2z2Agc/pHxrZLJMmyC9juU6/DLG8T/7LsxiSRiYCVD31GJr6NW2K2KoJcx+Rd7hy3874ImJ63fmPoRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737003573; c=relaxed/simple;
	bh=2mAQQo2S97LPir2JTuEGQGrwuI/BTWwVJ1Jqv9AaU5M=;
	h=From:To:Subject:Date:Message-Id:MIME-Version; b=HxZcNVMfMnPMPydetGnaLC3tvcSWmwhRlyvxubdRfDV5eJ8ReaFIs3vb9hPc/XdxvyDnnS2DS5VSj861scYOh/Njnj1X0uPVOxbKBrLy3CUMlIUD5d4tYhmgSb3mc/lEwSlbNmi4EwESvwLhi+QnVOFXXiiyh7WG156SAh25lJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fujitsu.com; spf=pass smtp.mailfrom=fujitsu.com; dkim=pass (2048-bit key) header.d=fujitsu.com header.i=@fujitsu.com header.b=VeeCtB/Q; arc=none smtp.client-ip=207.54.90.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fujitsu.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fujitsu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fujitsu.com header.i=@fujitsu.com header.b="VeeCtB/Q"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1737003573; x=1768539573;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=2mAQQo2S97LPir2JTuEGQGrwuI/BTWwVJ1Jqv9AaU5M=;
  b=VeeCtB/QTiC0tW3lWgQY7vTT8zb8S2Dq2JPnsQIS6Im2+cC1DH4on8BG
   61lpd7chzMApchQ5LVZtAMKhc2rRubm8DmYCZDY0r+7DNb5nAt5cSFM9J
   1gTeKwBwRi2udSGcBTt0JDrG5UpoL/WytgsaqJeDE+7IbdHf88Fjk0tKC
   t9wOuz89hY+9bbBgAYMyWcGIv3T9C6V1pQHOr8AiBCtT/rQ+ry/OojwTp
   DO8JmREtfuHxQNosR7O1pK8b3vMgll8RWjOOX6zMh8YJV6/qU3VaoFY6o
   gGHTUtSoZhtynlb8f1+3NN7QQNoFkjjhTaPJOQYScQFb3u9hdBYAxGHOr
   A==;
X-CSE-ConnectionGUID: l8JY1CmXReGYcIlw1T/GAQ==
X-CSE-MsgGUID: J+UN/IMdT6Og2VcgWonlDg==
X-IronPort-AV: E=McAfee;i="6700,10204,11316"; a="186673931"
X-IronPort-AV: E=Sophos;i="6.13,208,1732546800"; 
   d="scan'208";a="186673931"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2025 13:59:24 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 57266C2269;
	Thu, 16 Jan 2025 13:59:20 +0900 (JST)
Received: from yto-om4.fujitsu.com (yto-om4.o.css.fujitsu.com [10.128.89.165])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 1FB46D4C14;
	Thu, 16 Jan 2025 13:59:20 +0900 (JST)
Received: from sm-x86-mem01.ssoft.mng.com (sm-x86-stp01.soft.fujitsu.com [10.124.178.20])
	by yto-om4.fujitsu.com (Postfix) with ESMTP id 0CDBB40054BA4;
	Thu, 16 Jan 2025 13:59:19 +0900 (JST)
From: Yoshihiro Furudera <fj5100bi@fujitsu.com>
To: Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Catalin Marinas <catalin.marinas@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	Bjorn Andersson <quic_bjorande@quicinc.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Peter Zijlstra <peterz@infradead.org>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yoshihiro Furudera <fj5100bi@fujitsu.com>
Subject: [PATCH v4 0/2] perf: Fujitsu: Add Uncore MAC/PCI PMU driver
Date: Thu, 16 Jan 2025 04:59:09 +0000
Message-Id: <20250116045911.3382537-1-fj5100bi@fujitsu.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This adds two new dynamic PMUs to the Perf Events framework to program
and control the Uncore MAC/PCI PMUs in Fujitsu chips.

These drivers were created with reference to drivers/perf/qcom_l3_pmu.c.

These drivers export formatting and event information to sysfs so they can
be used by the perf user space tools with the syntaxes:

perf stat -e mac_iod0_mac0_ch0/ea-mac/ ls
perf stat -e mac_iod0_mac0_ch0/event=0x80/ ls

perf stat -e pci_iod0_pci0/ea-pci/ ls
perf stat -e pci_iod0_pci0/event=0x80/ ls

FUJITSU-MONAKA Specification URL:
https://github.com/fujitsu/FUJITSU-MONAKA

Changes in v4:
- Change the enablement conditions of the Kconfig option so that
  compilation is not performed in environments other than ARM64
  (kernel test robot)
- Link to v3: https://lore.kernel.org/all/20250109054544.2342442-2-fj5100bi@fujitsu.com/

Yoshihiro Furudera (2):
  perf: Fujitsu: Add the Uncore MAC PMU driver
  perf: Fujitsu: Add the Uncore PCI PMU driver

 .../admin-guide/perf/fujitsu_mac_pmu.rst      |  75 +++
 .../admin-guide/perf/fujitsu_pci_pmu.rst      |  50 ++
 Documentation/admin-guide/perf/index.rst      |   2 +
 drivers/perf/Kconfig                          |  18 +
 drivers/perf/Makefile                         |   2 +
 drivers/perf/fujitsu_mac_pmu.c                | 573 ++++++++++++++++++
 drivers/perf/fujitsu_pci_pmu.c                | 553 +++++++++++++++++
 7 files changed, 1273 insertions(+)
 create mode 100644 Documentation/admin-guide/perf/fujitsu_mac_pmu.rst
 create mode 100644 Documentation/admin-guide/perf/fujitsu_pci_pmu.rst
 create mode 100644 drivers/perf/fujitsu_mac_pmu.c
 create mode 100644 drivers/perf/fujitsu_pci_pmu.c

-- 
2.34.1

