Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F621524AEF
	for <linux-doc@vger.kernel.org>; Wed, 14 Oct 2026 13:30:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791984612; cv=none; b=ScgluH7EmnU/WCenU82yDgjAstVUVTdbJ9TDcm+ufSrb30mvCK8C52AvlG3O3JhehBJLamf0WuuMmfmNpYWmEdERzL+vKs4BMhitLRuRuSKl27eCBtChMCwA2O5n+PruE9Xh3eannGDRPwjKL7KBX/6h52lNnib/rfGvNck8eF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791984612; c=relaxed/simple;
	bh=+yMU48ccOQTDJqcL+wYe+JjnvkSW+/MtKgVT1KqC1QI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OTqOD8ou/BHSoyZbzbMbbWIL6hU7R8Lq+IPOha1kq0NPK3lEZjT2CqOXoNFyiZpSMhK+BI6D2Mkqum+KvFtbifdVmE2hKtqm+4SfwrOIBG15loPrrVh5ZMFHjrIkXHIIx4trHdWQnNYfvuImNy40Pw2E3ThFdDi6+eSRYvg9im0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GlnJRd80; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=F+Jl2IO4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GlnJRd80";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="F+Jl2IO4"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69EBG4W53366064
	for <linux-doc@vger.kernel.org>; Wed, 14 Oct 2026 13:30:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=WPKkYivj8JUBz6V608J8AiLTN9VSzh8FXI9
	487Jr7wY=; b=GlnJRd803VKB8zt2rm3j33IoLgFkmEEZPHedUKVBMJV1Boaq38U
	L4th1hQ4JO2esuvRjFaI5b7u5yWtim/p/3wzVmPQb9xAqJzrLRWpxtaQ8q/D74h1
	hVGPR6svXiKiUr4IFxBaarVAE9XlMa8TYFweDbXlzpfOkPqPXrvUMwgOjL90zhuf
	jsBU9Es4cYSMdhNyMcUwXeRSflNH424El/bMj222yE16+u01Owd1rFBgB9qxG5/V
	MMaHXJ6t3AewG3UiqRHy2ucqhtR1t6Z3RhzGkUGTzLg/XQuWvKbhgMrwWIjtFrWM
	oNlE8Fg60anK3iKiDWdcaGVtImo6Ea4qoXg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ha4621sqm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Wed, 14 Oct 2026 13:30:03 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93dea1b6c89so787809285a.2
        for <linux-doc@vger.kernel.org>; Wed, 14 Oct 2026 06:30:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791984602; x=1792589402; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=WPKkYivj8JUBz6V608J8AiLTN9VSzh8FXI9487Jr7wY=;
        b=F+Jl2IO4vh1jQDJRHPE47fgaGvpnSq84YYOf5XEqowFl0xXIw0psjAN1MarauMgG5E
         H5qfcPe4WHpNBFUU+5ly2H3oDkFbKMUHm2x/2b0yXEozb5uD5iEspPkyJFL95mVZxDKy
         wntu9LbH475rmiswRZ051iC2qhhRypZ+8JwbYTPNI7XRu5KqY2jtckWgozGig/L01oub
         oVmPDB1dfsXXWqEFMM3vtStQCTUNUy6ILq1kW3XbgONv6BLQOqjlXVISlRMlK0Tcm+Qt
         MBlh/ox1fLB6wawFmLZEts9Hgs3bZSsL+6rZFaUxh/sHu/m3ux0VvE8YYRqczu6Z3fR+
         UIbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791984602; x=1792589402;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WPKkYivj8JUBz6V608J8AiLTN9VSzh8FXI9487Jr7wY=;
        b=U7wgvy7lt4roIfgt9Q83J+JZwGAmV4yK/HEDcU5TWPuDyKkMxPW8RCBkMSYrmKTlZT
         i0BLAAn+m2IDYn9WHz8BKAwnmuxkeSOzbCaYeb8Op7v/D6+T0Vv5hqL2r/tSVrXMgSkI
         t0csSQv6tZ9nOmY1yrxhhUZGHld53hmks+anvh0K7OwofLrcy2RftywGsiKiiT4HC1Lz
         9n+PQ++6au2zEpcDFneThZvJqFQLmj3LhZAMLLIUA9lqstxTTTJGZjQh48xMs+Z4qZ8I
         j2l11iTy+Sdmz9SX3sFDiqnKTe5136uK2Om/cSQRdZb0Ctaq1yuD4tZI/aR4XMhIonTH
         auew==
X-Forwarded-Encrypted: i=1; AKwUvBzeN3VKBRcA0aZESIYgYE2oGq5yMuY9hkBxEnYkt/dJ1tSo9QC7hNjWqan488JkS7v4Kb3tuLDvN+Q=@vger.kernel.org
X-Gm-Message-State: AFq9FYLh+lVenTXIV7dhxAChrY0sxV2baTtVLWiw+6PxnzCPKKERPnoW
	EMR7EoSY+dE4iYIzt9E5e3a0IGHQYZa7gzZdUqL5v5v6WYbzkuLMmpXswenXGv2HElxN2URRFf6
	KmQYDQv77ORxeTaH7ZECYCMVwlVLoGQkMP7JhfQGAjf13uuZtIQkW8OUe0tC1ivY=
X-Gm-Gg: AYBFou2NHTSjWXfPz7RAaldAAVF/6ChiQeDH5N2ItKnc7yQZF6HFAS8MNkTRdibn7Jf
	+i/F7T+EjlUMzEpvF59yh/V72r7DOxwVviDrgf+5xyMlA8L0eWuoxMlDX/FuFHTJxDHwT5dfwf7
	kjyclPtWjD0XJwsDGvNsIcRyIsXNTRKyf8LFMnZ9HJhBhoUdX6nhmmGrakeIVNrNX4rIJ8DOdPE
	yDU/xcccgWMsLdJb5mITZoy1bOg1UfNn2gUUMquud4PoBc+2dmqdrqALNgm8woJnZv9AmVmbAIs
	phO+vrVZP7QOul7GGhbYdjJ1xicfPoh/4e3Tfb3i8SCqw2c46DqGHauRbheZExvBOwpJy0LJM86
	Xxg6bL+e30tBLTih7r04Hqdo4040=
X-Received: by 2002:a05:620a:4493:b0:93e:592d:f5a2 with SMTP id af79cd13be357-93ebd0df023mr2426215085a.11.1791984602169;
        Wed, 14 Oct 2026 06:30:02 -0700 (PDT)
X-Received: by 2002:a05:620a:4493:b0:93e:592d:f5a2 with SMTP id af79cd13be357-93ebd0df023mr2426208085a.11.1791984601485;
        Wed, 14 Oct 2026 06:30:01 -0700 (PDT)
Received: from mai.box.freepro.com ([2a05:6e02:1041:c10:7d20:e20f:a77f:4ef7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bcf552e8sm2027155e9.13.2026.10.14.06.30.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 06:30:00 -0700 (PDT)
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
To: rafael@kernel.org
Cc: Len Brown <lenb@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Hans de Goede <hansg@kernel.org>,
        =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
        Mark Pearson <mpearson-lenovo@squebb.ca>,
        "Derek J. Clark" <derekjohn.clark@gmail.com>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Jai Luthra <jai.luthra@ideasonboard.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Armin Wolf <W_Armin@gmx.de>, Jack Wu <jackbb_wu@compal.com>,
        "Mario Limonciello (AMD)" <superm1@kernel.org>,
        linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-pm@vger.kernel.org,
        platform-driver-x86@vger.kernel.org
Subject: [PATCH v1 0/4] Make platform profiles firmware independent
Date: Wed, 14 Oct 2026 15:24:43 +0200
Message-ID: <20261014132500.3817549-1-daniel.lezcano@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: H0VcyTgDenPl39wyLfUZyEGppYKMbDAU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA1MyBTYWx0ZWRfX5CWsDZ5Q4vG0
 Us4Dm+/Axw/4s6hAX/XxHedPU1qDZ4otV9cWr5Viu5gEF2Lz8Gl+KaeuDqETVgrWbLvZOfFxGQb
 CUdPpp+POrfPcSqMM5CT93E2gVpPtNrpUpEjpfwJug1Nx3S/6F/hWi7MnCelckmgoJx6POlw7Qb
 +uv9i/ltpwg23SWd3HzMEYxwtaPprlE5sTN7wqyLcKQBnEXP3eWmcZ1d+TVCcUXdXD+DMDTQWoG
 gmw+fS8YV9RHD3T7lsvaqBou3lexOYNmVuAIq7irBVQ4T77/Uz7hZ4ckXOEVunnZJjnZThPQXr+
 lQlCARxvIQ8o1yn7BCrkjK4k+kZQs28VWxC25o2/56gyoGAEaoPdTigc5vSiR+lwTkFWZZ+MrER
 I9PKJptWil0JReblnZaGtHsiGHb5kBSPTThyIheuVOnRCGXH26jVa9CYk0TFfucoOoKCgZbVNAq
 ahoqMy/LufCYKvTG84A==
X-Authority-Analysis: v=2.4 cv=ErZHPicA c=1 sm=1 tr=0 ts=6acf83db cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=ZMhTd-B8TqveHcltUyQA:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA1MyBTYWx0ZWRfX6XzO6JH3pBxg
 T4Wfj5f+t29UJUCWeVqR0Wrie4ln0AO+QxQtkOj/XYrZdBoc32TfJs9M7Vb6PWln14NgyQs8OBm
 ZKknvTjNS4/vs477QYce95o9+sbxp8I=
X-Proofpoint-GUID: H0VcyTgDenPl39wyLfUZyEGppYKMbDAU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 bulkscore=0 impostorscore=0 adultscore=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610140053

Make platform profile selection independent of ACPI firmware.

The provider API already uses struct device, profile enums and callbacks;
it does not require an ACPI handle or firmware node. However, the core is
built under drivers/acpi/, its Kconfig symbol depends implicitly on ACPI,
initialization fails when ACPI is disabled, and the system-wide profile
interface is only exposed under /sys/firmware/acpi/.

This series moves the core to drivers/platform/profile/ and introduces
CONFIG_PLATFORM_PROFILE, updating all existing provider selectors. It
retains the tristate configuration and platform_profile module name.
Firmware-specific discovery and profile operations remain with providers.
The core can also be selected directly through its Kconfig prompt.

An optional ACPI adapter obtains the legacy sysfs kobject and is linked
into the same module. The generic core contains no ACPI types or symbols
and initializes without ACPI support or with ACPI disabled at boot.
The existing /sys/firmware/acpi/platform_profile and
/sys/firmware/acpi/platform_profile_choices attributes remain available
on active ACPI systems.

The new system-wide interface is:

  /sys/kernel/platform_profile/choices
  /sys/kernel/platform_profile/profile

Both aggregate frontends use the same callbacks, handler set and profile
semantics. The per-provider /sys/class/platform-profile/ interface is
preserved. Notifications cover both aggregate frontends and direct
per-provider writes. The new sysfs location is proposed ABI.

The first patch fixes the lock/lifetime boundary before adding another
frontend: sysfs teardown must not drain callbacks while holding the mutex
those callbacks need. A separate registration mutex serializes lifecycle
changes, while a profile-lock-protected handler list determines aggregate
membership independently of the class device's teardown state.

The second patch extracts the core and uses subsys_initcall_sync() so it
initializes after ACPI and before built-in thermal and CPUFreq consumers.
The third adds the generic aggregate interface, and the fourth documents
the interfaces and extends maintainer coverage.

Validation:

  - ARM64 built-in core with CONFIG_ACPI=n: W=1 build and sparse.
  - x86 modular core with CONFIG_ACPI=y: W=1 object build and sparse.
  - Full x86 kernel link and QEMU boot with lockdep and list debugging,
    with active ACPI and with acpi=off.
  - Firmware-less providers exercising common and hidden choices,
    profile reads/writes, invalid input, mixed profiles, cycling,
    partial callback failures, POLLPRI and legacy/generic shared state.
  - Concurrent sysfs I/O with two persistent providers while a third
    provider is registered and removed 200 times, last-provider attribute
    removal and repeated provider module reloads.

The provider API and profile names are unchanged. Aggregate writes retain
their sequential, non-transactional behavior: a failing callback does not
roll back providers already updated.

Daniel Lezcano (4):
  platform profile: Separate handler locking from sysfs lifetime
  platform profile: Extract the core from ACPI
  platform profile: Add firmware-neutral aggregate sysfs interface
  platform profile: Document firmware-independent profile selection

 .../ABI/testing/sysfs-class-platform-profile  |   2 +-
 .../ABI/testing/sysfs-kernel-platform_profile |  30 +++
 .../ABI/testing/sysfs-platform_profile        |   7 +-
 .../userspace-api/sysfs-platform_profile.rst  |  41 +++-
 MAINTAINERS                                   |   6 +
 drivers/acpi/Kconfig                          |   3 -
 drivers/acpi/Makefile                         |   1 -
 drivers/cpufreq/Kconfig.x86                   |   2 +-
 drivers/platform/Kconfig                      |  16 ++
 drivers/platform/Makefile                     |   2 +
 drivers/platform/profile/Makefile             |   5 +
 drivers/platform/profile/acpi.c               |  15 ++
 .../profile/core.c}                           | 195 +++++++++++++-----
 drivers/platform/profile/profile.h            |  17 ++
 drivers/platform/surface/Kconfig              |   6 +-
 drivers/platform/x86/Kconfig                  |  10 +-
 drivers/platform/x86/amd/pmf/Kconfig          |   2 +-
 drivers/platform/x86/dell/Kconfig             |   4 +-
 drivers/platform/x86/hp/Kconfig               |   2 +-
 drivers/platform/x86/lenovo/Kconfig           |   6 +-
 drivers/thermal/intel/int340x_thermal/Kconfig |   2 +-
 include/linux/platform_profile.h              |   3 +
 22 files changed, 288 insertions(+), 89 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-kernel-platform_profile
 create mode 100644 drivers/platform/profile/Makefile
 create mode 100644 drivers/platform/profile/acpi.c
 rename drivers/{acpi/platform_profile.c => platform/profile/core.c} (79%)
 create mode 100644 drivers/platform/profile/profile.h


base-commit: d0cd1e850e1602729dd60dc3c5fd96f80e0cdc5d
-- 
2.43.0

