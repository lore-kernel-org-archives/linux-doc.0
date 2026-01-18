Received: from LO0P265CU003.outbound.protection.outlook.com (mail-uksouthazon11022105.outbound.protection.outlook.com [52.101.96.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4702C30B529;
	Sun, 18 Jan 2026 23:10:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.96.105
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768777819; cv=fail; b=JRSuoKdQf+0H2jbzD0RBYnrkIRJh9gSXHPKKI6jcIDI/RwB+2XfPr+fDUlgxAy/WE5VIJTBLI0oCXRgxnQx3hHErsAxzn59ltdbJjkw7RsL4Tg278xHMLVQhORADYy0f6JpL0FWDiDAEvie1AzVbVtRGg3D6CSqPmVNLp072uMo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768777819; c=relaxed/simple;
	bh=422C1ZziwOSy8n97vo+PcmKDWwCcRTjZZXh5x1bwizM=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=q+yKRSPOib59AEIf4k7lUAiKqeKrL585j6aoeEjt4uSaGXnJt7PriLxrkM+yMADtijz1pNqvKC7WxuLb8iE/5aDP/bn6yYUWMNvIdf5aMsDyT7rxOg4Khx6bpPZDkkekEQsRtxyFXbjPGePZGFnFqyoSHOeaSQM3VWVIGVgkZw4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomlin.com; spf=pass smtp.mailfrom=atomlin.com; arc=fail smtp.client-ip=52.101.96.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=atomlin.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f0LlON6/6kxthFtkUXk3N0WoDIwenTaQTNkeRSd49P0KaeTYxzHXVZ9/mkIx3g52/RuCTOLT9W4cvEFWz4SOjzrrQIaE9nW+YxXN7R7mNKOYkrzz9Rhd5sCnSqQ65x+6va0bNdhM5gl9UhyZyzKDX4Cz6sEgT+mpU2z82VGpAGdlNJ5PHmTyQB3K+PCq5169eO3GyvJjDgCPr/fWLuIRssYnN71PdRZ3dA0htJy2RonqY1r13JvpjfJ7QKqSPQXfy7pxVgoFcRVBI1g20ZhdaEuR/hFmPcxSAOlTl0kh0HfKFe54CcuWXX6JSv29Xvt0ET04xFtyaVMMfXX8ujFCZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L5ZG979JF7g9myK5WavfHZ2/eJy68obWDdM2tFNuiKg=;
 b=KUwYrq++wN0wGLPQThk8KgE/42mgWvvZAFi5KPWixs4cYnnNitwTqkxwqW/MydkwB+egA1V86opYsVQIQEKSLqCr2xF0gQ/+Bao6K7MXY5Gr/esXvmJLiWAPA//PJ/TGY2yFr2gT7AS+X77ofm2SEmhh93oqARXfzOnljU1F0tCiMcQaAmOs5w9Kcbilkio481dv7j+uOjsoC6E1Uv2v+MBvrAiVwK872ED48B97esL86KqzgvwIAaqZiVJyC35lNsYxXA3AIGdN1iHxlVBrLteCnojvP33YKN7PSBjxeym/NylHbLriN0AfQK8vG3yCdbl3IwuJ+bcMnKk897No/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=atomlin.com; dmarc=pass action=none header.from=atomlin.com;
 dkim=pass header.d=atomlin.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=atomlin.com;
Received: from CWLP123MB3523.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:70::10)
 by LOYP123MB3088.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:ef::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.10; Sun, 18 Jan
 2026 23:10:15 +0000
Received: from CWLP123MB3523.GBRP123.PROD.OUTLOOK.COM
 ([fe80::de8e:2e4f:6c6:f3bf]) by CWLP123MB3523.GBRP123.PROD.OUTLOOK.COM
 ([fe80::de8e:2e4f:6c6:f3bf%5]) with mapi id 15.20.9520.011; Sun, 18 Jan 2026
 23:10:13 +0000
From: Aaron Tomlin <atomlin@atomlin.com>
To: corbet@lwn.net,
	anna-maria@linutronix.de,
	frederic@kernel.org,
	tglx@kernel.org,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com
Cc: x86@kernel.org,
	hpa@zytor.com,
	akpm@linux-foundation.org,
	pawan.kumar.gupta@linux.intel.com,
	feng.tang@linux.alibaba.com,
	kees@kernel.org,
	elver@google.com,
	arnd@arndb.de,
	fvdl@google.com,
	lirongqing@baidu.com,
	bhelgaas@google.com,
	peterz@infradead.org,
	brgerst@gmail.com,
	kai.huang@intel.com,
	benjamin.berg@intel.com,
	andrew.cooper3@citrix.com,
	oleg@redhat.com,
	neelx@suse.com,
	atomlin@atomlin.com,
	sean@ashe.io,
	mproche@gmail.com,
	chjohnst@gmail.com,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] x86/idle: Mark "idle=poll" as deprecated
Date: Sun, 18 Jan 2026 18:10:09 -0500
Message-ID: <20260118231009.3194039-1-atomlin@atomlin.com>
X-Mailer: git-send-email 2.51.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BN9PR03CA0595.namprd03.prod.outlook.com
 (2603:10b6:408:10d::30) To CWLP123MB3523.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:400:70::10)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CWLP123MB3523:EE_|LOYP123MB3088:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b5a9af9-56e3-4e80-f1b8-08de56e6bc43
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?K+koifVPgOBwNIfCTFf+r0tWYqr/Um5MJYhks7A3CfNsVsYZyADFpvo+U8l1?=
 =?us-ascii?Q?rUT7lfVEo3bq0/rIyWIlMUV6qnZxG1w4qtW3E3EeiXr9DGwwHGeB+3DfHYi/?=
 =?us-ascii?Q?l8I/EUOhbV8NTIcbid50pGG2xAWic0J07lQ0EeMMc7lZTdrqy1petPPpGPFU?=
 =?us-ascii?Q?7v1yq28ULsUCB+BN+ifAE8d4UeZ+8cIkS3JVHCLwmF004YyvrnAwEZdfG3Bj?=
 =?us-ascii?Q?YTaQVvjQqC7dmV4ldnIb2LLtof3hzmpsNrGrr9EQjOxvFkSVHvGTwwcLyjcF?=
 =?us-ascii?Q?EQ3sjducIkXlhj3BmD9iLQbAEGPFepAq+GbmBczEyT7/M9vOuE1nBthOJU/q?=
 =?us-ascii?Q?rmrLdnUcp8MVTDDYLm6Fni3KxC/tibgWZmf9NOlT7nhib4PJQcjz3/KQU2kW?=
 =?us-ascii?Q?jeF/8ZB4Lzi3w+JVLHAk1FbCD3mvr+uRbi116EMbVwif91HSxOP0yKhHbOXU?=
 =?us-ascii?Q?JeJ7KvjQGBqhMI0zjXIyjSPXWNMIfnWBlsnAn+ftnDL6i+RL/IrGMPyzTfFS?=
 =?us-ascii?Q?lx5dZhv68m3YGR7l5nL/woebR4tSYnlrC4KXoLPnTfcHqlNI+mD1pKtQHhQi?=
 =?us-ascii?Q?d3wYRsSg/jqr3jdkWiHaaXFfkInGVwmm+3Il05aeMazOWp9tfAgSBFS9gvVb?=
 =?us-ascii?Q?BBvzitlvqnuKES47VzeWz84DZyEPx7FRFzQA4EjTBKfoBU1ItQVfF9c2FFqE?=
 =?us-ascii?Q?DUmtmA8K2z8cCpiXJnpHrE4OeObMPMadN/s3bLhYnfdwpbGD/hs2jFxoOZQs?=
 =?us-ascii?Q?oafmc9yxQg7GlhUC3AQQkuh5RTjfejN5x3ASJNcvQkl7gvDO0GlG/z8CCue3?=
 =?us-ascii?Q?G5r316QyVs8HSPCsDWYBFzFd5Klgod2qd3OB8rE34KMwOke+VdEIxW7Z5IoC?=
 =?us-ascii?Q?ZbUsAwAOdPGMTVi5tMzFZmXKCFzTWnGcMw8yrgObqPQMdRtSXQrzlRrYVWn3?=
 =?us-ascii?Q?dMnOXSYblinW4QCI6Zyew+hbJiVtc4Kkze4ELdLpD+fYcKDzaeK+qqHG2GnF?=
 =?us-ascii?Q?eoNUoSAg7J7PWgo/vtyYNFU5YK/C9jotBrXbFQpqmVuq444X5ZmkqX4ZyvXB?=
 =?us-ascii?Q?Oj09wrueqkabQQoGdpc3YyAK268CzrI7yauVqvrGXXw4b3xzF5aoS5MUm0Mi?=
 =?us-ascii?Q?hxSp/zW9Omoh/QW0c70pypjILL/57aEHZEeU9jp47Z7NFwVkJDA5B4mTgGRo?=
 =?us-ascii?Q?2xMTShY6hvewqzlDHUVplhah4mLWhayFFM4hXlBKBC1VMjz1YJFB13Kzc0Ly?=
 =?us-ascii?Q?v3cEQzW5QQXRQfKlhHqNlKrpJHp0K1gbUb33LItIjxxq/eNk1kb91sHdTA9U?=
 =?us-ascii?Q?Ds9BsH6Cp/LJ9OPYS9Tp8o/G32j1pREf3GZV/KJE6pYgxhvsxDNazXvz4qXo?=
 =?us-ascii?Q?3cGTFaSgHawlfZy/e//35DvV2NCydNcA446vISpeALC6lNIqihtuu5byB2Kj?=
 =?us-ascii?Q?i1siRxrTOOzn5Foql1ADX+CjwRHGo6YAyqGqhTNCW4i/+63jkIoz34DbqPwX?=
 =?us-ascii?Q?UIHsD+MStQW1FSziG1ZyZ6KT+z1ir1mrNiDvym3CnE0fKQZfVHoxQtjFLNei?=
 =?us-ascii?Q?I5OGVEN4ziLSsrNgBeI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CWLP123MB3523.GBRP123.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?rsn+fGWhhxVA7lO2AirXNf+L57FVEC/fZwpF3OtWFx4ukv2UNrAxb09Y4TiC?=
 =?us-ascii?Q?qjzsxDBtj70/xtqTV9Bl0zUfQvGjGq/jArEfge0SE/3ZQLwLb4z92rlgaSQq?=
 =?us-ascii?Q?0CtruPlUqZqh29r2/lLhOLfd0nIe74LEqi2GhFnA21HvkRsPwGJJmFTmbDd7?=
 =?us-ascii?Q?buQ7xmBv2KcvkwiLEgwBGp2S2/VVq2t26A6I9Ey3GXvCtnkStqMIIUTqQDfY?=
 =?us-ascii?Q?AzSoFbOLOyUTd67/AJSZr7heW5xz8/Uz4acsrVlqP9XF9jMkAX2i9xz83+1M?=
 =?us-ascii?Q?Ca/o35IfmmxvHoRwrijKjDDffF+PjOcqBBtMnROociqG3iJv+ZwDPd+P0Bmo?=
 =?us-ascii?Q?ioxKTTo/B/PBDinVjtIGDdgfG8Vi5N1nAkbAC9chOoy40YpDQYvip8BA102D?=
 =?us-ascii?Q?l+6Yd3sS77YQjdDhk76f98jJeS9bG5D2g/SLlaczRfzK6bG2coxVI6D64hu4?=
 =?us-ascii?Q?CPM/PCCN0zFA7AdSP3vNGHxsya4yxkTY79fYnFBy7eJrsMcbVevY8xMC/VTy?=
 =?us-ascii?Q?/OKdl8CkVUtwQGDjwSK4wKBIxOW1YniMPEPfSKccSkZHNUroxrwKUsfgQq24?=
 =?us-ascii?Q?8e+HPtNxuREiYTkr7l3siyUESaG0on2+5x7w5su5zAVXzbxT4VZuOKQrgoad?=
 =?us-ascii?Q?nm5xLMOf4B5SV0aQdlkZwtELIDXwx+u9Zu7vvnd57jyN0Y3yWxkASxIp76er?=
 =?us-ascii?Q?GSGX/DGFUgh3mPKMgEEHDb81lUJWScdxplFpoTEmC6b8Z4LrwmYqgPp79O+K?=
 =?us-ascii?Q?DvrI45nJBCd5BGGUstz7wWD/1R2fQor9RtGB+eyUXcVAnvEHI2Xhze6CCEtJ?=
 =?us-ascii?Q?Ds5TClwXvbu3lUkUvxtl/D7XaMdkmI78n7pq1WLEnCll1QQ93D0Ep5a0sz68?=
 =?us-ascii?Q?avCc/Wl6pSk0giyEdqA19UzLbp6taNFaUd9jBL0UcNHZ/ROZbp+lFcao7xF7?=
 =?us-ascii?Q?R/M3MbA26483740IsGF6otpPYlXrR4ljumZE76eoEvPRBuThf/6pcbVsYA83?=
 =?us-ascii?Q?j8GeY/I/L7w2oDZ4o8uDuSbGIABRAc6MEVYwbZ6xnmrE66+IxllPyY7XXQ9Q?=
 =?us-ascii?Q?AZd+tcTGttSMyBEekFmsAABeCmTB9oe7HpKzpNrBU/0dgbtiezs6cOfTIbQP?=
 =?us-ascii?Q?wO+IsgGrCiOJdFO+CMRzhaObFGI/68N9RrOVjIAbhtE3huH5NjBQ18Qm6rIj?=
 =?us-ascii?Q?O6zvxXvOfRwzBo2oOvVjVnicHbbg18PELVIRfQiI+BsKKywo6uV1fHPWLyo7?=
 =?us-ascii?Q?YUw4/CtAWr/p1oWrLI5h6F32YSPmiCBmhzGTioTvs7zpmF4z/VmRwB6JciEu?=
 =?us-ascii?Q?gqkoeOJYCkozUEhzDd3G5rHsOCwifRjpl4X7IIOCczRFshUjlggomTBdxaU3?=
 =?us-ascii?Q?7XiQZy8jmuyGkA5tKA2Y3Hv8v2Q+qwk3YCImPPIiVn4MVanafwrdyb0bKdt9?=
 =?us-ascii?Q?Xr6TrFoAenaZP3Ay54uFc2j+REdCMbDfsEDHd5zRPli7pOw6ThDjmeSMKkVv?=
 =?us-ascii?Q?WiQt4yQImwnKBf5L0f/sr5bl080Qn05/ksoufWXZm5tit7c9TKyjlIILYBbU?=
 =?us-ascii?Q?2HG2UtuN3u6JjOBo4ADBQdfVdxQdpOW5Za6WSYWDKcwI/x+tKtl7ZqdDnxXq?=
 =?us-ascii?Q?AuZ4z0dwvZ6UO99dqfywkRexkrhIZM4brQmdGHT6Y0FrQyGqnT9bOiy6Tyos?=
 =?us-ascii?Q?Yrp/aIKSKe/LN4LWBpPh1TmcDSXrS83WZzttYKsnWTYdf8wCsfWNIyqpfvNS?=
 =?us-ascii?Q?rwsT1XbBzg=3D=3D?=
X-OriginatorOrg: atomlin.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b5a9af9-56e3-4e80-f1b8-08de56e6bc43
X-MS-Exchange-CrossTenant-AuthSource: CWLP123MB3523.GBRP123.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2026 23:10:13.7104
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e6a32402-7d7b-4830-9a2b-76945bbbcb57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /vzRStb2N6ml+pvofsMQx+nosSpXZf8Zc7eXyrBByYpJBaiDyCq8CYw/J9uf/Wq3uq1bVSQYPK47t34ph1a0Bw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LOYP123MB3088

The "idle=poll" boot parameter is a blunt instrument that forces all
CPUs in the system into a continuous "polling" state. While effective
at eliminating wake-up latency, this global override is architecturally
obsolete and inefficient on modern multicore systems.

It suffers from several significant drawbacks:

    1.  Lack of Granularity: It prevents "housekeeping" CPUs from
        entering power-saving states, leading to unnecessary energy
        waste and thermal throttling that can negatively impact the very
        latency-sensitive tasks it aims to protect

    2.  Resource Contention: On SMT systems, a polling sibling thread
        actively consumes execution resources, potentially degrading the
        performance of the primary thread on the same physical core.

The Power Management Quality of Service (PM QoS) subsystem now provides
a superior, granular alternative.
By writing special value "n/a" to the per-CPU sysfs node
/sys/devices/system/cpu/cpuN/power/pm_qos_resume_latency_us, userspace
can force a specific CPU to poll without imposing this cost globally.
Writing "0" to the same file removes the constraint, allowing the
governor to freely select the deepest applicable C-state.

This patch marks "idle=poll" as deprecated. A warning is issued at
boot time if the parameter is used, guiding users toward the PM QoS
interface.

Signed-off-by: Aaron Tomlin <atomlin@atomlin.com>
---
 Documentation/admin-guide/kernel-parameters.txt | 9 +++++----
 Documentation/timers/no_hz.rst                  | 9 +++++++++
 arch/x86/kernel/process.c                       | 1 +
 3 files changed, 15 insertions(+), 4 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 1058f2a6d6a8..6a3d6bd0746c 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -2242,10 +2242,11 @@ Kernel parameters
 	idle=		[X86,EARLY]
 			Format: idle=poll, idle=halt, idle=nomwait
 
-			idle=poll:  Don't do power saving in the idle loop
-			using HLT, but poll for rescheduling event. This will
-			make the CPUs eat a lot more power, but may be useful
-			to get slightly better performance in multiprocessor
+			idle=poll: [Deprecated - use PM QoS]
+			Don't do power saving in the idle loop using HLT, but
+			poll for rescheduling event. This will make the CPUs
+			eat a lot more power, but may be useful to get
+			slightly better performance in multiprocessor
 			benchmarks. It also makes some profiling using
 			performance counters more accurate.  Please note that
 			on systems with MONITOR/MWAIT support (like Intel
diff --git a/Documentation/timers/no_hz.rst b/Documentation/timers/no_hz.rst
index 7fe8ef9718d8..ca7918cc169e 100644
--- a/Documentation/timers/no_hz.rst
+++ b/Documentation/timers/no_hz.rst
@@ -234,6 +234,15 @@ Known Issues
 	a.	Use PMQOS from userspace to inform the kernel of your
 		latency requirements (preferred).
 
+		This interface offers a superior and more flexible alternative to
+		global boot parameters such as "idle=poll", as it can be adjusted
+		at runtime with per-CPU granularity.
+
+		To force a specific CPU (where N is the logical CPU number) to poll
+		on idle, one can set the latency requirement to 0 microseconds:
+
+			echo "n/a" > /sys/devices/system/cpu/cpuN/power/pm_qos_resume_latency_us
+
 	b.	On x86 systems, use the "idle=mwait" boot parameter.
 
 	c.	On x86 systems, use the "intel_idle.max_cstate=" to limit
diff --git a/arch/x86/kernel/process.c b/arch/x86/kernel/process.c
index 4c718f8adc59..359b57f6272b 100644
--- a/arch/x86/kernel/process.c
+++ b/arch/x86/kernel/process.c
@@ -1000,6 +1000,7 @@ static int __init idle_setup(char *str)
 
 	if (!strcmp(str, "poll")) {
 		pr_info("using polling idle threads\n");
+		pr_warn("idle=poll is deprecated. Use the PM QoS interface instead via /sys/devices/system/cpu/cpuN/power/\n");
 		boot_option_idle_override = IDLE_POLL;
 		cpu_idle_poll_ctrl(true);
 	} else if (!strcmp(str, "halt")) {
-- 
2.51.0

