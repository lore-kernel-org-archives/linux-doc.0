Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792882588;
	b=BMN5uVMHkiqwWU47f62S8v5WyHJQz+qZpGw86bCEYUK5A2BXONStzh1yn/o+cldTUtq9
	 T2pg3NDoPjDGl652Ub+aq1hL39+GTZT2mh2TfPVJ0PLftO5javH6RlWoGssLRbwAClfFF
	 gCmQBZQGxx8h4iMjdEiilGGiK35gycC7cmbMqwAB/LVmuJ/+vsyS5srWyRRopuevqbwc1
	 Icst/vItPxReNlOwx1ljZwdDzTSvFiFIK0MEY75zM3cpSYEm9SQpqe5pJ2YYgxd4bC25U
	 HBknAiAnvxfoBxjTU+jlQ/jntFLkrjEXl4B+C7dp/v19D9j51G+NKLYoDqlqq6ERX1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792882588;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=8fvxyNQZ5b4bLD4RC7y6CYqh2r/ByifqUJni81S43tk=;
	b=Dg8GLIZ641GAEEmlyNq/OTVfys8QUojgInLvvbXJ1lDFqJEjlJy/Cz34tsRLTiGAQQLr
	 z49BwfBrPTyM+G7g0soqRzFCtmtmkCHCQbaFK1dbJE8k5iusoAIZ75U2d+mrKKeChQ6mM
	 v74Tl7NIwzW/pNlkrq6jOAwYqbLEk9VxXcxOT85cArtU4Ji0xAUHACTbqGSCqF4OnUi+l
	 t9W+NrpWT5urt3P0VCAS6jFgARpQBYaF60Trl97jqTUV0QiuLDPv2qVKYw4xlHtTguGq9
	 0A6XOPhONL0VV+R4f1A+sPO4LriPvwfsxEERsD4eiSNgeYBuW7jvrgeb+XdurYOjd0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jEwLjJxc;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=D6cJ82w0;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F953606A31B
	for <linux-doc@vger.kernel.org>; Sat, 24 Oct 2026 22:56:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2F953606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jEwLjJxc;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=D6cJ82w0
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69OLbGTR3758086
	for <linux-doc@vger.kernel.org>; Sat, 24 Oct 2026 22:56:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=8fvxyNQZ5b4
	bLD4RC7y6CYqh2r/ByifqUJni81S43tk=; b=jEwLjJxcdtlV02+oQg+kPxFjrHQ
	Y0Cr6i9yYap1AzhLgTW8O+54JotFeSHa5zXYz4sRiI2sCIA8uDrj0B1A0J5s3ME5
	2AdgbRqgQgVHt5T/WxMfVAHcopDiN7DMXrKZIZMluRFEqsbExdtbpkTaAbDOMSff
	dsB4bIt4eOv/bYbdvlGy/zn/dRIi1QgFOhiAufpJg9Yk6nQmalYoOWhHPMDrgx/p
	rlR0SFUK2gtrR742/LSuu4Rp+8uiH4RjWBdkHhV1fkEJNb3E5oddLJwKxB+m/+N3
	teNPonjz5yHIQ7RpAnr3csbUMncZ2flBkMXzM4Qu4AavdJ5wJkcohZvrH1A==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgjcgtaax-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Sat, 24 Oct 2026 22:56:26 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-9179a556c43so45195376d6.3
        for <linux-doc@vger.kernel.org>; Sat, 24 Oct 2026 15:56:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792882585; x=1793487385; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8fvxyNQZ5b4bLD4RC7y6CYqh2r/ByifqUJni81S43tk=;
        b=D6cJ82w0LxHM3BBAsXr7TOzjq0dnbkJ+8qUNEx1M6ME+yR6D8aIlmgfOag1nPqpst6
         7aHm/ir5bIe43np3f8wDNlARdLndNBy/xasmYGHfMTr8WBw39CQRy7i8LxzzW4/TnRhq
         D+Lpg1yDiArT+9BsDVA3g7Dz7uCDiSDNgN6FZYCwKAbSp/cMt0ZLsKnL23TFBnuTqn52
         1sxyukZi6nRPXBadUAxhDWzcdS6BfAF0ZF4q0Ixcbyq48YEFB+StqBjdFWoMWFPxt7py
         nK++7uPGopWhorZeuMbwYI79J/cBm7L/haTQNXx0K7pJCGT5TgODytyvjS5NcxZJcD4E
         nXRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792882585; x=1793487385;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8fvxyNQZ5b4bLD4RC7y6CYqh2r/ByifqUJni81S43tk=;
        b=fM6eGodOxpEL1Zj1eUpOxjSPqE2g+K9dL/kiGEVc9Ud4kKfpsE0vYrP9NQWKAES5Mc
         iW0327XL4ZG5FiJP/WnDAgEjvBSz8uPA8YNTw6NMgkaQ0EmRLqavebrJtsyf7/5BqAc/
         jwN/mWKqsqlMcMonKVY8SJxqfFcVJhdsFkHU5Tb+hYI7VKrbvsJpPTZdt2imz0eKRNtt
         RZiB2lYAXiTtabQroR0wluTByfGm3P61lvIH6stumTHcAgsWnsuQyjJpmnfCxkGr6dc+
         QVmm8fixokFKFGIFIg+k2Njo9qLhex2T5d6Nnhf/4P0BJkqVycDS0goPZ61iOVn5S4yi
         p6ow==
X-Forwarded-Encrypted: i=1; AKwUvBz7QqzJMe36cQyBOfHuVJHuywjMsU4JUxMU6Pbw6Z9vuOQ80ExXtAw8nJDpTGA2IByoYy2YQ+6Gtd4=@vger.kernel.org
X-Gm-Message-State: AFq9FYLJCNmKkpBn+h1vBqBTj3egQh28uIZfJsJ174yOOCMc7cYy7NH0
	dFTeOJnNM6x4G43LQVzqWpKaU1nqDNhckRARhMfiyS6t3vKluFnHQhbgS1KVzlB3Olmvg1DlZZN
	QC+iezlt3JWQQx4icMDcCPKJecN8QdUEA8zH1H29NqOqJT6eADvrW7kuNi9NQek4=
X-Gm-Gg: AYBFou1a7MlV/8VQpl7V9fQVmbX0eHr51pPTCgzI5oMFty++1W3bQBA+a6jHg53AfU9
	gm7LsrgUf3YsoAXTfiWqeRpU6DcrgVYSS6fKPyLHRYIvoh+ClEM8mrW03vEevINk/oFRri8ZJf0
	ZlL2JwfsYGW/dtbseRx8yNk3ZwduD3Bq8UUZ9QZdw35MQnqHR3LIoIew0Kr9yMsLz2JumwemfTn
	GUZcNboPyubUlaNDHEYtb14MOm6HXk7K4v0/d6Awkfohce7eGV/hvE+bOnh4REQ8WCsV8AA/FyU
	dD90ar77bmoOoKKiJAqoCKdzbfYtC/+eo09wY8V+kW1bWiAe/zwA4nyr4Bh8iTneC9NuB1Opwsc
	bJNR1J/NwKc8/6uXgL+8KDbeqjOU=
X-Received: by 2002:a05:620a:3910:b0:93f:3bb5:545d with SMTP id af79cd13be357-940ef914f1cmr445004485a.27.1792882585034;
        Sat, 24 Oct 2026 15:56:25 -0700 (PDT)
X-Received: by 2002:a05:620a:3910:b0:93f:3bb5:545d with SMTP id af79cd13be357-940ef914f1cmr445001085a.27.1792882584462;
        Sat, 24 Oct 2026 15:56:24 -0700 (PDT)
Received: from mai.box.freepro.com ([2a05:6e02:1041:c10:7d20:e20f:a77f:4ef7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a359ff2189sm98564145e9.1.2026.10.24.15.56.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 15:56:23 -0700 (PDT)
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
To: rafael@kernel.org
Cc: Len Brown <lenb@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Hans de Goede <hansg@kernel.org>,
        =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
        Mark Pearson <mpearson-lenovo@squebb.ca>,
        "Derek J. Clark" <derekjohn.clark@gmail.com>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Armin Wolf <W_Armin@gmx.de>, Jai Luthra <jai.luthra@ideasonboard.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jack Wu <jackbb_wu@compal.com>,
        "Mario Limonciello (AMD)" <superm1@kernel.org>,
        linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-pm@vger.kernel.org,
        platform-driver-x86@vger.kernel.org
Subject: [PATCH v3 1/4] platform profile: Extract the core from ACPI
Date: Sun, 25 Oct 2026 00:34:26 +0200
Message-ID: <20261024223501.1420953-2-daniel.lezcano@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261024223501.1420953-1-daniel.lezcano@oss.qualcomm.com>
References: <20261024223501.1420953-1-daniel.lezcano@oss.qualcomm.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI0MDA5MSBTYWx0ZWRfX+vOrHQGFmSuS
 8OlAY8wDExhwRfiW9Bg3/Wj7iJ5MHIHN3KN5/gUBqWLvH4H722rKDfajHGUcHGJgeY4KfFR/Hng
 t3srU5GPQr0sgDR7fAfubr3xN5hDx7o=
X-Proofpoint-GUID: 8B-Zp3ptaEd7MsalnKO5mtxww2N3BOfy
X-Authority-Analysis: v=2.4 cv=JvhkP84C c=1 sm=1 tr=0 ts=6add379a cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8 a=8k6WQxmsAAAA:8
 a=H7UWxkn5qGMa_TAHyjEA:9 a=-Z-CRQebJS9Ciu3_:21 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI0MDA5MSBTYWx0ZWRfX2hqtV4ka6ySm
 bjshIg/FASuFgF4xLmPlinC+U+AgQGoiZVuarE6VouT6De70/je+XmZmxLL4vjsRxbXg9Dsa9zK
 9XFstLmayF4qzzwXBta6mI4WmGfufjR65tTvSnFlHScf+tvhWdJh2WeAO/LtbZD/32gbB+sctUp
 r8ZQqb2/rOW48W7acejmF0LGLZcjJeWiCfB1AQ7wWyRiyOSGT1jvW576y+8bnw/EJWebm5iay0d
 wwQXpAO9IhqyIZTe6SsgXxXfL7k1jw1L+/+a/x9IFRtqhm2TWZ/PKu4R22UDrEVDOGYh+uphgqz
 ypKvcm41R8uviJkKfrMcl4B50/1liGtozwbDU3M6EJOzOozqytsM2Nqa2OUWveBOsdped7+r29/
 jNr1e3VlmfcpcpFMG8h5ZC1h6Dsjzl8vrem6vSHrPJqrGj/OcBS37TsoUAPKzHurPB06S9dfNgK
 f3EAltb7OTXo5+VQoTw==
X-Proofpoint-ORIG-GUID: 8B-Zp3ptaEd7MsalnKO5mtxww2N3BOfy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-24_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0
 priorityscore=1501 impostorscore=0 adultscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610240091

Platform profile providers already use device-based callbacks and do not
need ACPI types. The core is nevertheless confined to the ACPI build and
refuses to initialize when ACPI is disabled.

Move the implementation to drivers/platform/profile and introduce the
firmware-independent PLATFORM_PROFILE symbol. Update all provider
selectors. Keep provider-specific ACPI dependencies and the
platform_profile module name.

Isolate access to the legacy ACPI kobject in an optional compatibility
object linked into the same module. Retain the legacy ABI on active ACPI
systems, and initialize the class even when ACPI is absent or disabled.

Use subsys_initcall_sync so the class is ready before built-in thermal
and CPUFreq providers, but after ACPI has initialized its compatibility
kobject.

Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
---
 drivers/acpi/Kconfig                          |  3 -
 drivers/acpi/Makefile                         |  1 -
 drivers/cpufreq/Kconfig.x86                   |  2 +-
 drivers/platform/Kconfig                      | 16 +++++
 drivers/platform/Makefile                     |  2 +
 drivers/platform/profile/Makefile             |  5 ++
 drivers/platform/profile/acpi.c               | 15 +++++
 .../profile/core.c}                           | 64 +++++++++++++------
 drivers/platform/profile/profile.h            | 17 +++++
 drivers/platform/surface/Kconfig              |  6 +-
 drivers/platform/x86/Kconfig                  | 10 +--
 drivers/platform/x86/amd/pmf/Kconfig          |  2 +-
 drivers/platform/x86/dell/Kconfig             |  4 +-
 drivers/platform/x86/hp/Kconfig               |  2 +-
 drivers/platform/x86/lenovo/Kconfig           |  6 +-
 drivers/thermal/intel/int340x_thermal/Kconfig |  2 +-
 16 files changed, 118 insertions(+), 39 deletions(-)
 create mode 100644 drivers/platform/profile/Makefile
 create mode 100644 drivers/platform/profile/acpi.c
 rename drivers/{acpi/platform_profile.c => platform/profile/core.c} (94%)
 create mode 100644 drivers/platform/profile/profile.h

diff --git a/drivers/acpi/Kconfig b/drivers/acpi/Kconfig
index f165d14cf61a..dd00312217de 100644
--- a/drivers/acpi/Kconfig
+++ b/drivers/acpi/Kconfig
@@ -351,9 +351,6 @@ config ACPI_THERMAL
 	  To compile this driver as a module, choose M here:
 	  the module will be called thermal.
 
-config ACPI_PLATFORM_PROFILE
-	tristate
-
 config ACPI_CUSTOM_DSDT_FILE
 	string "Custom DSDT Table file to include"
 	default ""
diff --git a/drivers/acpi/Makefile b/drivers/acpi/Makefile
index d1b0affb844f..f8af27341805 100644
--- a/drivers/acpi/Makefile
+++ b/drivers/acpi/Makefile
@@ -91,7 +91,6 @@ obj-$(CONFIG_ACPI_PROCESSOR)	+= processor.o
 obj-$(CONFIG_ACPI)		+= container.o
 obj-$(CONFIG_ACPI_THERMAL_LIB)	+= thermal_lib.o
 obj-$(CONFIG_ACPI_THERMAL)	+= thermal.o
-obj-$(CONFIG_ACPI_PLATFORM_PROFILE) 	+= platform_profile.o
 obj-$(CONFIG_ACPI_NFIT)		+= nfit/
 obj-$(CONFIG_ACPI_NHLT)		+= nhlt.o
 obj-$(CONFIG_ACPI_NUMA)		+= numa/
diff --git a/drivers/cpufreq/Kconfig.x86 b/drivers/cpufreq/Kconfig.x86
index d6190b8dde4b..9e1e3391a084 100644
--- a/drivers/cpufreq/Kconfig.x86
+++ b/drivers/cpufreq/Kconfig.x86
@@ -39,7 +39,7 @@ config X86_AMD_PSTATE
 	select ACPI_PROCESSOR
 	select ACPI_CPPC_LIB if X86_64
 	select CPU_FREQ_GOV_SCHEDUTIL if SMP
-	select ACPI_PLATFORM_PROFILE
+	select PLATFORM_PROFILE
 	select POWER_SUPPLY
 	help
 	  This driver adds a CPUFreq driver which utilizes a fine grain
diff --git a/drivers/platform/Kconfig b/drivers/platform/Kconfig
index 312788f249c9..395b75f2edf0 100644
--- a/drivers/platform/Kconfig
+++ b/drivers/platform/Kconfig
@@ -1,4 +1,20 @@
 # SPDX-License-Identifier: GPL-2.0-only
+config PLATFORM_PROFILE
+	tristate "Platform profile support"
+	help
+	  Provide a common sysfs interface for selecting platform power,
+	  performance and cooling profiles. Platform-specific provider drivers
+	  map their operating modes onto standard profile names, independently
+	  of the firmware interface they use.
+
+	  The core exposes per-provider controls under /sys/class/platform-profile/.
+	  A provider driver must register before profile attributes become
+	  available. ACPI is not required; on ACPI systems the legacy system-wide
+	  interface under /sys/firmware/acpi/ is also provided.
+
+	  To compile this as a module, choose M here: the module will be called
+	  platform_profile.
+
 source "drivers/platform/mips/Kconfig"
 
 source "drivers/platform/loongarch/Kconfig"
diff --git a/drivers/platform/Makefile b/drivers/platform/Makefile
index fa322e7f8716..b6732f2f3c85 100644
--- a/drivers/platform/Makefile
+++ b/drivers/platform/Makefile
@@ -3,6 +3,8 @@
 # Makefile for linux/drivers/platform
 #
 
+obj-$(CONFIG_PLATFORM_PROFILE)	+= profile/
+
 obj-$(CONFIG_X86)		+= x86/
 obj-$(CONFIG_LOONGARCH)		+= loongarch/
 obj-$(CONFIG_MELLANOX_PLATFORM)	+= mellanox/
diff --git a/drivers/platform/profile/Makefile b/drivers/platform/profile/Makefile
new file mode 100644
index 000000000000..ae95ba09383c
--- /dev/null
+++ b/drivers/platform/profile/Makefile
@@ -0,0 +1,5 @@
+# SPDX-License-Identifier: GPL-2.0
+obj-$(CONFIG_PLATFORM_PROFILE) += platform_profile.o
+
+platform_profile-y := core.o
+platform_profile-$(CONFIG_ACPI) += acpi.o
diff --git a/drivers/platform/profile/acpi.c b/drivers/platform/profile/acpi.c
new file mode 100644
index 000000000000..ff925dedacaf
--- /dev/null
+++ b/drivers/platform/profile/acpi.c
@@ -0,0 +1,15 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/* Compatibility with the original ACPI platform profile sysfs ABI. */
+
+#include <linux/acpi.h>
+#include <linux/kobject.h>
+
+#include "profile.h"
+
+struct kobject *platform_profile_compat_kobj(void)
+{
+	if (acpi_disabled)
+		return NULL;
+
+	return kobject_get(acpi_kobj);
+}
diff --git a/drivers/acpi/platform_profile.c b/drivers/platform/profile/core.c
similarity index 94%
rename from drivers/acpi/platform_profile.c
rename to drivers/platform/profile/core.c
index b4c91d57f3d4..57c3dad2732b 100644
--- a/drivers/acpi/platform_profile.c
+++ b/drivers/platform/profile/core.c
@@ -4,15 +4,21 @@
 
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
 
-#include <linux/acpi.h>
+#include <linux/bitmap.h>
 #include <linux/bits.h>
 #include <linux/cleanup.h>
 #include <linux/init.h>
+#include <linux/idr.h>
+#include <linux/kobject.h>
 #include <linux/list.h>
+#include <linux/module.h>
 #include <linux/mutex.h>
 #include <linux/platform_profile.h>
+#include <linux/slab.h>
 #include <linux/sysfs.h>
 
+#include "profile.h"
+
 #define to_pprof_handler(d)	(container_of(d, struct platform_profile_handler, dev))
 
 /*
@@ -24,6 +30,15 @@ static DEFINE_MUTEX(profile_lock);
 /* Serialize registration and sysfs updates without blocking sysfs callbacks. */
 static DEFINE_MUTEX(profile_registration_lock);
 static LIST_HEAD(profile_handlers);
+static struct kobject *compat_kobj;
+
+static void profile_notify(void)
+{
+	if (compat_kobj)
+		sysfs_notify(compat_kobj, NULL, "platform_profile");
+}
+
+static int profile_update(void);
 
 struct platform_profile_handler {
 	struct list_head node;
@@ -243,7 +258,7 @@ static ssize_t profile_store(struct device *dev,
 			return ret;
 	}
 
-	sysfs_notify(acpi_kobj, NULL, "platform_profile");
+	profile_notify();
 
 	return count;
 }
@@ -458,7 +473,7 @@ static ssize_t platform_profile_store(struct kobject *kobj,
 			return ret;
 	}
 
-	sysfs_notify(acpi_kobj, NULL, "platform_profile");
+	profile_notify();
 
 	return count;
 }
@@ -484,6 +499,14 @@ static const struct attribute_group platform_profile_group = {
 	.is_visible = profile_class_is_visible,
 };
 
+static int profile_update(void)
+{
+	if (compat_kobj)
+		return sysfs_update_group(compat_kobj, &platform_profile_group);
+
+	return 0;
+}
+
 /**
  * platform_profile_notify - Notify class device and legacy sysfs interface
  * @dev: The class device
@@ -493,7 +516,7 @@ void platform_profile_notify(struct device *dev)
 	scoped_cond_guard(mutex_intr, return, &profile_lock) {
 		_notify_class_profile(dev, NULL);
 	}
-	sysfs_notify(acpi_kobj, NULL, "platform_profile");
+	profile_notify();
 }
 EXPORT_SYMBOL_GPL(platform_profile_notify);
 
@@ -540,7 +563,7 @@ int platform_profile_cycle(void)
 			return err;
 	}
 
-	sysfs_notify(acpi_kobj, NULL, "platform_profile");
+	profile_notify();
 
 	return 0;
 }
@@ -615,9 +638,9 @@ struct device *platform_profile_register(struct device *dev, const char *name,
 	scoped_guard(mutex, &profile_lock)
 		list_add_tail(&to_pprof_handler(ppdev)->node, &profile_handlers);
 
-	sysfs_notify(acpi_kobj, NULL, "platform_profile");
+	profile_notify();
 
-	err = sysfs_update_group(acpi_kobj, &platform_profile_group);
+	err = profile_update();
 	if (err)
 		goto cleanup_cur;
 
@@ -657,8 +680,8 @@ void platform_profile_remove(struct device *dev)
 	ida_free(&platform_profile_ida, pprof->minor);
 	device_unregister(&pprof->dev);
 
-	sysfs_notify(acpi_kobj, NULL, "platform_profile");
-	sysfs_update_group(acpi_kobj, &platform_profile_group);
+	profile_notify();
+	profile_update();
 }
 EXPORT_SYMBOL_GPL(platform_profile_remove);
 
@@ -706,28 +729,33 @@ static int __init platform_profile_init(void)
 {
 	int err;
 
-	if (acpi_disabled)
-		return -EOPNOTSUPP;
-
 	err = class_register(&platform_profile_class);
 	if (err)
 		return err;
 
-	err = sysfs_create_group(acpi_kobj, &platform_profile_group);
-	if (err)
-		class_unregister(&platform_profile_class);
+	compat_kobj = platform_profile_compat_kobj();
+	if (compat_kobj) {
+		err = sysfs_create_group(compat_kobj, &platform_profile_group);
+		if (err) {
+			kobject_put(compat_kobj);
+			class_unregister(&platform_profile_class);
+		}
+	}
 
 	return err;
 }
 
 static void __exit platform_profile_exit(void)
 {
-	sysfs_remove_group(acpi_kobj, &platform_profile_group);
+	if (compat_kobj) {
+		sysfs_remove_group(compat_kobj, &platform_profile_group);
+		kobject_put(compat_kobj);
+	}
 	class_unregister(&platform_profile_class);
 }
-module_init(platform_profile_init);
+subsys_initcall_sync(platform_profile_init);
 module_exit(platform_profile_exit);
 
 MODULE_AUTHOR("Mark Pearson <markpearson@lenovo.com>");
-MODULE_DESCRIPTION("ACPI platform profile sysfs interface");
+MODULE_DESCRIPTION("Platform profile sysfs interface");
 MODULE_LICENSE("GPL");
diff --git a/drivers/platform/profile/profile.h b/drivers/platform/profile/profile.h
new file mode 100644
index 000000000000..910c9f7da6a0
--- /dev/null
+++ b/drivers/platform/profile/profile.h
@@ -0,0 +1,17 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+#ifndef _PLATFORM_PROFILE_INTERNAL_H
+#define _PLATFORM_PROFILE_INTERNAL_H
+
+#include <linux/kconfig.h>
+#include <linux/kobject.h>
+
+#ifdef CONFIG_ACPI
+struct kobject *platform_profile_compat_kobj(void);
+#else
+static inline struct kobject *platform_profile_compat_kobj(void)
+{
+	return NULL;
+}
+#endif
+
+#endif
diff --git a/drivers/platform/surface/Kconfig b/drivers/platform/surface/Kconfig
index f775c6ca1ec1..08f15f72f8ed 100644
--- a/drivers/platform/surface/Kconfig
+++ b/drivers/platform/surface/Kconfig
@@ -203,12 +203,12 @@ config SURFACE_PLATFORM_PROFILE
 	tristate "Surface Platform Profile Driver"
 	depends on ACPI
 	depends on SURFACE_AGGREGATOR_REGISTRY
-	select ACPI_PLATFORM_PROFILE
+	select PLATFORM_PROFILE
 	help
-	  Provides support for the ACPI platform profile on 5th- and later
+	  Provides support for platform profiles on 5th- and later
 	  generation Microsoft Surface devices.
 
-	  More specifically, this driver provides ACPI platform profile support
+	  More specifically, this driver provides platform profile support
 	  on Microsoft Surface devices with a Surface System Aggregator Module
 	  (SSAM) connected via the Surface Serial Hub (SSH / SAM-over-SSH). In
 	  other words, this driver provides platform profile support on the
diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index 4851bf45157d..b560982d2378 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -120,7 +120,7 @@ config BITLAND_MIFS_WMI
 	depends on INPUT
 	depends on LEDS_CLASS
 	depends on POWER_SUPPLY
-	select ACPI_PLATFORM_PROFILE
+	select PLATFORM_PROFILE
 	select INPUT_SPARSEKMAP
 	help
 	  This is a driver for Bitland MiInterface based laptops.
@@ -180,7 +180,7 @@ config ACER_WMI
 	select INPUT_SPARSEKMAP
 	select LEDS_CLASS
 	select NEW_LEDS
-	select ACPI_PLATFORM_PROFILE
+	select PLATFORM_PROFILE
 	help
 	  This is a driver for newer Acer (and Wistron) laptops. It adds
 	  wireless radio and bluetooth control, and on some laptops,
@@ -279,7 +279,7 @@ config ASUS_WMI
 	select INPUT_SPARSEKMAP
 	select LEDS_CLASS
 	select NEW_LEDS
-	select ACPI_PLATFORM_PROFILE
+	select PLATFORM_PROFILE
 	help
 	  Say Y here if you have a WMI aware Asus laptop (like Eee PCs or new
 	  Asus Notebooks).
@@ -646,7 +646,7 @@ config SAMSUNG_GALAXYBOOK
 	depends on INPUT
 	depends on LEDS_CLASS
 	depends on SERIO_I8042
-	select ACPI_PLATFORM_PROFILE
+	select PLATFORM_PROFILE
 	select FW_ATTR_CLASS
 	help
 	  This is a driver for Samsung Galaxy Book series notebooks. It adds
@@ -905,7 +905,7 @@ config TOUCHSCREEN_DMI
 config INSPUR_PLATFORM_PROFILE
 	tristate "Inspur WMI platform profile driver"
 	depends on ACPI_WMI
-	select ACPI_PLATFORM_PROFILE
+	select PLATFORM_PROFILE
 	help
 	This will allow users to determine and control the platform modes
 	between low-power, balanced and performance modes.
diff --git a/drivers/platform/x86/amd/pmf/Kconfig b/drivers/platform/x86/amd/pmf/Kconfig
index ad4faf18de47..31e13d6d7e75 100644
--- a/drivers/platform/x86/amd/pmf/Kconfig
+++ b/drivers/platform/x86/amd/pmf/Kconfig
@@ -8,7 +8,7 @@ config AMD_PMF
 	depends on ACPI && PCI
 	depends on POWER_SUPPLY
 	depends on AMD_NODE
-	select ACPI_PLATFORM_PROFILE
+	select PLATFORM_PROFILE
 	depends on TEE && AMDTEE
 	depends on AMD_SFH_HID
 	depends on HAS_IOMEM
diff --git a/drivers/platform/x86/dell/Kconfig b/drivers/platform/x86/dell/Kconfig
index 9f0016056d7e..f6acf1cc2a2f 100644
--- a/drivers/platform/x86/dell/Kconfig
+++ b/drivers/platform/x86/dell/Kconfig
@@ -44,7 +44,7 @@ config ALIENWARE_WMI_WMAX
 	bool "Alienware WMAX WMI device driver"
 	default y
 	depends on ALIENWARE_WMI
-	select ACPI_PLATFORM_PROFILE
+	select PLATFORM_PROFILE
 	help
 	 Alienware WMI driver with AlienFX LED, HDMI, amplifier, deep sleep and
 	 AWCC thermal control capabilities.
@@ -120,7 +120,7 @@ config DELL_PC
 	depends on ACPI
 	depends on DMI
 	depends on DELL_SMBIOS
-	select ACPI_PLATFORM_PROFILE
+	select PLATFORM_PROFILE
 	help
 	This driver adds support for controlling the fan modes via platform_profile
 	on supported Dell systems regardless of formfactor.
diff --git a/drivers/platform/x86/hp/Kconfig b/drivers/platform/x86/hp/Kconfig
index dd51491b9bcd..81a52194ff42 100644
--- a/drivers/platform/x86/hp/Kconfig
+++ b/drivers/platform/x86/hp/Kconfig
@@ -43,7 +43,7 @@ config HP_WMI
 	depends on RFKILL || RFKILL = n
 	select POWER_SUPPLY
 	select INPUT_SPARSEKMAP
-	select ACPI_PLATFORM_PROFILE
+	select PLATFORM_PROFILE
 	select HWMON
 	help
 	  Say Y here if you want to support WMI-based hotkeys on HP laptops and
diff --git a/drivers/platform/x86/lenovo/Kconfig b/drivers/platform/x86/lenovo/Kconfig
index 516594993073..2291e1d48d13 100644
--- a/drivers/platform/x86/lenovo/Kconfig
+++ b/drivers/platform/x86/lenovo/Kconfig
@@ -12,7 +12,7 @@ config IDEAPAD_LAPTOP
 	depends on BACKLIGHT_CLASS_DEVICE
 	depends on ACPI_VIDEO || ACPI_VIDEO = n
 	depends on ACPI_WMI || ACPI_WMI = n
-	select ACPI_PLATFORM_PROFILE
+	select PLATFORM_PROFILE
 	select INPUT_SPARSEKMAP
 	select NEW_LEDS
 	select LEDS_CLASS
@@ -77,7 +77,7 @@ config THINKPAD_ACPI
 	depends on BACKLIGHT_CLASS_DEVICE
 	depends on I2C
 	depends on DRM
-	select ACPI_PLATFORM_PROFILE
+	select PLATFORM_PROFILE
 	select DRM_PRIVACY_SCREEN
 	select HWMON
 	select NVRAM
@@ -264,7 +264,7 @@ config LENOVO_WMI_GAMEZONE
 	tristate "Lenovo GameZone WMI Driver"
 	depends on ACPI_WMI
 	depends on DMI
-	select ACPI_PLATFORM_PROFILE
+	select PLATFORM_PROFILE
 	select LENOVO_WMI_EVENTS
 	select LENOVO_WMI_HELPERS
 	help
diff --git a/drivers/thermal/intel/int340x_thermal/Kconfig b/drivers/thermal/intel/int340x_thermal/Kconfig
index 4ced7bdcd62c..3026a0a8d073 100644
--- a/drivers/thermal/intel/int340x_thermal/Kconfig
+++ b/drivers/thermal/intel/int340x_thermal/Kconfig
@@ -12,7 +12,7 @@ config INT340X_THERMAL
 	select ACPI_THERMAL_LIB
 	select INTEL_SOC_DTS_IOSF_CORE
 	select INTEL_TCC
-	select ACPI_PLATFORM_PROFILE
+	select PLATFORM_PROFILE
 	select PROC_THERMAL_MMIO_RAPL if POWERCAP
 	help
 	  Newer laptops and tablets that use ACPI may have thermal sensors and
-- 
2.43.0
