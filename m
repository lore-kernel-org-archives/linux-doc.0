Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 364052F2D;
	Thu,  9 Jan 2025 05:51:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=139.138.61.253
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736401875; cv=none; b=BkntlmQ72mn4PV4nOvhKY6MIOTwu3AvSbehznTkOL5s4nGLbxfgVyDSgKD6sSDFQIgZl4f2NZO3nTzGGDEyYSPmfU3v5h+fMmEpRqL9AOrxTUxjn2otfbMW0vjz5BwrJ4gf9nNtxflSEu1Gnoow7Qd2Tv8pYmzfZLo3BRWBo830=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736401875; c=relaxed/simple;
	bh=gdDR9InM8NXZDYA6aFu8uoVuRC7m3iROwvyJa1EVu3Q=;
	h=From:To:Subject:Date:Message-Id:MIME-Version; b=cRuqr8wFYVW+wMlyVWa2Tf/R2qGmguDrbJR0Bg071d4HDhNf7XFpZ18RQDkaSnqhzKnxa1M/RLfVFz8uCeLQOG922t+Ytb8GQNsdxpgTpLUjOKTvy7AGeGnIpVQpc0AyQ7y78NOQlfNAh36HSVcEvMpwutrJ49gDG0h6OWxBGN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fujitsu.com; spf=pass smtp.mailfrom=fujitsu.com; dkim=pass (2048-bit key) header.d=fujitsu.com header.i=@fujitsu.com header.b=YMpCMPbD; arc=none smtp.client-ip=139.138.61.253
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fujitsu.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fujitsu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fujitsu.com header.i=@fujitsu.com header.b="YMpCMPbD"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1736401873; x=1767937873;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=gdDR9InM8NXZDYA6aFu8uoVuRC7m3iROwvyJa1EVu3Q=;
  b=YMpCMPbDaXosV3bRm4M+x+ahnyIM2MvHhfQu4oyYSn4zfiHEA6vazp46
   Vib4pvxE1Ntlc14C3/qjqwRkR41T4bFR4uFbskdUzPzqceuezFxpsGHfo
   iZ63PvaY9iugODPWPNJUH3A7gnfIANJnMSVSgXJAnIt1FwbZYvvQh9OwX
   qaHhsmr9YSGNtAFDKqB+cd/+Hf4V/J8KtokI9SdsfoAp2elCCo0rWpwSj
   N52g66VIz+oL5iMVabbUo2ssCXBAksk9ms1m4zq6zJOKNx4s/HFnvxJOh
   1GTPCgrbdyVVPR4w+EFOqKxldxd8Iocd6uh6XA+Y0vwy5rkYuT3gJPZ9K
   Q==;
X-CSE-ConnectionGUID: OwekcYRqRuauxbw2cKZ4LA==
X-CSE-MsgGUID: R/95gevGRB+SOvmL4ugf0w==
X-IronPort-AV: E=McAfee;i="6700,10204,11309"; a="174031328"
X-IronPort-AV: E=Sophos;i="6.12,300,1728918000"; 
   d="scan'208";a="174031328"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2025 14:51:05 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 9DBFFD480A;
	Thu,  9 Jan 2025 14:51:03 +0900 (JST)
Received: from yto-om1.fujitsu.com (yto-om1.o.css.fujitsu.com [10.128.89.162])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 6D9BDD7017;
	Thu,  9 Jan 2025 14:51:03 +0900 (JST)
Received: from sm-x86-mem01.ssoft.mng.com (sm-x86-stp01.soft.fujitsu.com [10.124.178.20])
	by yto-om1.fujitsu.com (Postfix) with ESMTP id E50AC40059F08;
	Thu,  9 Jan 2025 14:51:02 +0900 (JST)
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
Subject: [PATCH v3 0/2] perf: Fujitsu: Add Uncore MAC/PCI PMU driver
Date: Thu,  9 Jan 2025 05:45:42 +0000
Message-Id: <20250109054544.2342442-1-fj5100bi@fujitsu.com>
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

Changes in v3:
- Change to use CPUHP_AP_ONLINE_DYN for cpuhp state (Jonathan Cameron)
- Modify the code as suggested (Jonathan Cameron)
- Link to v2: https://lore.kernel.org/all/20241122061753.2598688-1-fj5100bi@fujitsu.com/

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

