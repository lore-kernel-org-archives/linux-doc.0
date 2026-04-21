Received: from CWXP265CU008.outbound.protection.outlook.com (mail-ukwestazon11020111.outbound.protection.outlook.com [52.101.195.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC9C4223707;
	Tue, 21 Apr 2026 15:09:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.195.111
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776784164; cv=fail; b=dUghETQu1pgiJ115k+ZDTJ8/xH7hyXX32DEPa8tVYW7JpXVKP4eIIv3GAJClM5+yPthyn55mC+HG8knQfmeI4T/e+dT0+gKPQrJJ/Onq5T+xMhH4CXSRbt9J8nTZVFzAy1BEScxu4dCdr0HJW0QFAAmXvYmqiL/FPjITJxOejs4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776784164; c=relaxed/simple;
	bh=Ou6XDmGU/+yf6PkVQsY/pgWaSnpk9SM9Or7u9OYcngE=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=MPfRg5lPHzJRDGKdHVXkvtVF7A9oSD5mguc7q16ROo4NTC+F2hlMMYkOdmqsuwNlLMgF5ktFmr+nCCwFpdlMPc6z8QahfJe++Wvy5Lc2nliiYuNn3cdXbVtphga5KWZH0puXxsOCv1r6YOk6N/9jyG/trj5OLxRj3BdQSa1xIcU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomlin.com; spf=pass smtp.mailfrom=atomlin.com; arc=fail smtp.client-ip=52.101.195.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=atomlin.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kF4eHOc+tQtNNBlvDzShuKB2eDUq3er9l9j2sl3sUDRBeJQxiYY88qNMNyGWjGRlNf/DQG1eXQ71OVNQAXGIsn/XOe1rwCIgpTmuHqaAW+fDmUraipBgc3oECBCPlKW/7TYMI1eU9qTRx6cKPz0kUnZEOEZ0VNg3I0IxeToq1MxbXj5UNrW6R8rs0J8DpYmlX1CT2zjmhjEJTr5Vb3aQMgDwZ01lSBsZKhnB/ZRX5f3NYkLBxMBisHtXqBtkkAOQdzWxVymioq8K5734yWpIw8DCBcBJHEE1z5txkR5FPA18ZT0UShe+5HSiUMUptxPOJqkkAmO2piOVtfofpTCndQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=or5MawNv8W1aR61bNaB6qLQf+0Ki6N0X5rxvjFHA5RM=;
 b=c3g412UXRBSZtVXy12CRQBFdDs9qbKygWMXiqWMrX0uU3jIM0B+ic8RZGiuQbDrsvvyAn+XsFSNJTgYNk21o395yQgHULjVv1gWE1NNnJLpN2rK/SBJbRlFS69TOiwZ3CC1AMM4qZcPrU2VtqVSKNCn6tRYxMrcUABgAxF0t1mfo8/WOSBr1ZKTHyaZclQ4mmfo83tWeSVJC/ZmGZ/zIgWbcbbuTSG11YwIdWGnjf3L88qQosWUsLC+UgKeFjNNOEiOF94/Xi6LnqUylpNwwv6HClW5YkbMBwLp8Vi2F2FO2UJGSSafGckiTL+YOQ4i4thVhHXIGUMRq/MYv5GP77w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=atomlin.com; dmarc=pass action=none header.from=atomlin.com;
 dkim=pass header.d=atomlin.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=atomlin.com;
Received: from CWLP123MB3523.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:70::10)
 by LO8P123MB7795.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:3dd::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.16; Tue, 21 Apr
 2026 15:09:17 +0000
Received: from CWLP123MB3523.GBRP123.PROD.OUTLOOK.COM
 ([fe80::de8e:2e4f:6c6:f3bf]) by CWLP123MB3523.GBRP123.PROD.OUTLOOK.COM
 ([fe80::de8e:2e4f:6c6:f3bf%2]) with mapi id 15.20.9846.016; Tue, 21 Apr 2026
 15:09:17 +0000
From: Aaron Tomlin <atomlin@atomlin.com>
To: corbet@lwn.net,
	skhan@linuxfoundation.org
Cc: tglx@kernel.org,
	akpm@linux-foundation.org,
	bp@alien8.de,
	rdunlap@infradead.org,
	dave.hansen@linux.intel.com,
	feng.tang@linux.alibaba.com,
	pawan.kumar.gupta@linux.intel.com,
	dapeng1.mi@linux.intel.com,
	kees@kernel.org,
	elver@google.com,
	paulmck@kernel.org,
	lirongqing@baidu.com,
	bhelgaas@google.com,
	bigeasy@linutronix.de,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] docs: kernel-parameters: document scope of irqaffinity= parameter
Date: Tue, 21 Apr 2026 11:09:11 -0400
Message-ID: <20260421150911.42404-1-atomlin@atomlin.com>
X-Mailer: git-send-email 2.51.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: CH2PR11CA0022.namprd11.prod.outlook.com
 (2603:10b6:610:54::32) To CWLP123MB3523.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:400:70::10)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CWLP123MB3523:EE_|LO8P123MB7795:EE_
X-MS-Office365-Filtering-Correlation-Id: 149839a2-3017-41d7-ef8d-08de9fb7f4a6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|366016|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	g/Z6BD6JrJ+zDxhZklHOV5tYlhFMZa1gK7yPGLN80mIkMtzZyWlbZ8uT3K6cLrOEpYip7OVmNnQa3Uf6C73Q3Oj29G3hxrCROWZu08JaDy9Romt1JzyqlcJ53qc+U6CD3+82XV2Wxxu/gFdUkUrhmLzwBWsQTqS/I8WZBnSVz2ip9vU9QdcZPj6B3cS7V60eT9/E5x6Adt1KRHTO/OO9gzkhmgf5s0miAqSnp+yiaqdzB6B2w+K9pHbKKFgZ6tmg/GrLKdf14CohZujNl0pxAf5ZnFUJjycht8vtnwdvs1Yknx46jnS4hB9lLZ6GGw485i6dVmpKRhGO9+FoZVD6VJWBAgLPFdLlBo331grMIk1N/dSJnCp+boK1L2JbtgqN+QwsDHPevKZ98xgLULQ9fEdBGH0Pr/pfPDS64tNxMocE4BIkd+l5VUcpKZVwSBg5vzy32BFA+fUMTmnpgfggv+S28G3Au6OpRsuhs/eks5Ew1+6jmu6U73dSJkW2ckM7fiCVQzQqN/GiQIUblnAA43yesKgJt+R0CowS+mji6yZmAbvUhSVYsgw8RwlmU5fqyZAButs9W8KTIxuzl7kWFlrJfiT+SqaJH21XTXdE1GIARyyo0CQmYnZgHvAcdzPTWGbsPkbtudNIvtzTAhs1JNAE7DXwCKxb+bO+4zLQj6uOj6iJjf5PMbearPykIRZLwGAq3HvsiWYCVwesnYGhmNUiGJBbT+ei1giYWzY00j0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CWLP123MB3523.GBRP123.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(18002099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?nHcyRLe+WTfMfiXdRSiBT/2Zm+TsfDgYrkw2fNgAlVo72i/HmJfA30IxV3sO?=
 =?us-ascii?Q?zjpfkTSIFYle9lzz4YtnrsXBLAnyI0Ja8hCxSsk2H2APLVshATQjFbVMVws0?=
 =?us-ascii?Q?jSvKM1artd1l2mwmjIwzwWu6/goJ087x+9e0gy5Z5pYuiahai30ShHuof8Zl?=
 =?us-ascii?Q?cwmqcoRvPD3NxW8lAQEHN8pQct9tD2iykr0+/XM9VIbaL4lQLkdsDUF4d601?=
 =?us-ascii?Q?eawou2e7RfufP5Y2ZvNKtYshSEHQ5aYAhP2grIhshtzgxnXyC3XJF/WP1zMQ?=
 =?us-ascii?Q?1TLTryqbcdnBViM9jjjj25uIOEk9B1dVV0vivdOA0M1fEJ2tF2IwktrhQ/Tk?=
 =?us-ascii?Q?ZFnt9oNLSLZDSSB96bBNC6F29w0M+tYu88BFDAgzXt01VX8oSDSWBWTu2PcV?=
 =?us-ascii?Q?mSR0PjpnOnSCpwCF16vlXQL+c952ok9S24XmxGekXNgoni+NA+xtKaRfbndp?=
 =?us-ascii?Q?XyllRqbp//gR7rgu5SOrNJSIQrrhvSjovzXXwyxEI24A22e/7GXUFyi7RBSj?=
 =?us-ascii?Q?2Ql7Iyc89M0bm7oCXHebiGGRsYMNqvBuQuQKHGzRptwr9cr573v8HsjP9cfQ?=
 =?us-ascii?Q?rvT6Vuqrdmi4OVXYPPcgpcWAHtTr4vC6+vuymldgclgRpU5Z/8fJcmWbsL9T?=
 =?us-ascii?Q?hyo3KLRc9nIjR/khIf6dq83DQcTbgcLmk1xT+MJml/Ze2A39hkgYdL2KqZj/?=
 =?us-ascii?Q?DOdx0svMB3DC1M9zkJTwRqhShnnkVeNulok+amuj1PnN4HfBFtrZYMeqZNfy?=
 =?us-ascii?Q?cBIDjYGKmMRSp8HcSnmO1P446FKovcZqNW4Nxm+WBONuy0RxUlNpBYZ3PmP3?=
 =?us-ascii?Q?2OA8TTooG93s3G1jqFeA4DgVjkBGtVmkzEs0w8C2R9Afg4OO5nYKnHJvpExm?=
 =?us-ascii?Q?rVcOaZPZVgJ3IGRvpoNC9JrcmeFFFJ4lhFwD8SamGGfWmed5WY1/hW+nuJZG?=
 =?us-ascii?Q?bR82QHPTKBlyMrdBMXXe31yAVelxzTE74YEqWky4N/D4t96wTL1GMT8JZawm?=
 =?us-ascii?Q?xOgnXIXTpN6HHpN9usgrUMmuQtzSPGzbx8n4hRMJektl/r/sna/EL403zYGU?=
 =?us-ascii?Q?R+Of4wioLgVASkYIM2WBQ6HIOAU+yzSZowtRq7+5thyrStqoddQ19Nyd2T2G?=
 =?us-ascii?Q?l/RGIh4+jpvJ+l8KuMg8600KjnaZSAFSzF0y7XRUTIXBSMzak6juKUkpFUAU?=
 =?us-ascii?Q?DigZJHpKbyn4Nicf8TW+MfpeOb99cKVcTuVm2CphzJzOv/O8v1g9gDsY+ppV?=
 =?us-ascii?Q?CIjgKxrQK2ddt0GKBY514eRHtI6NrNu0o9OXDOeWlgyGVHWa3vhV2TXfDsO7?=
 =?us-ascii?Q?LEJTy5GUVyw+XCIUa5jezCT8iAapskPzADlVPL4bvRgRT9cstLIw/AqHbr0r?=
 =?us-ascii?Q?yOo3D4ANrP1UctbgtXw8I4tGERJbyBklIKU48GxLy51eAoK+/ejD+hI+4OWv?=
 =?us-ascii?Q?25s/5+09cskV5eNCo+ptDOFHfeaJJyuqNuUUwVt13kKx3milomiO3+KvBqpd?=
 =?us-ascii?Q?wgJrtXPGHqnqWwF0YxEy9rzGOa6GyJAm+W+zs03YGJvS3mRYPU9lX9dSrcW5?=
 =?us-ascii?Q?jPpAgASKUUH/GLuzjk/pt84owgalQLJX+5WCBzoB1tKYknIU2ugSJVkp3CbX?=
 =?us-ascii?Q?xm2YHqpB1JtSyMLOK8u7ACNdSrxbMNGUvy4ogVBPYEsnIKQ9MRbJOC9VtA+s?=
 =?us-ascii?Q?z/YHhXjPmLDnVP0e+jbn+H9v9lEATva4v/sQXsuVP94naFsr1qMVZat41DMo?=
 =?us-ascii?Q?6tike7FBvQ=3D=3D?=
X-OriginatorOrg: atomlin.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 149839a2-3017-41d7-ef8d-08de9fb7f4a6
X-MS-Exchange-CrossTenant-AuthSource: CWLP123MB3523.GBRP123.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2026 15:09:16.9038
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e6a32402-7d7b-4830-9a2b-76945bbbcb57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LnMNYGDonAUzWigfHI9cOYJVpQmX4RFXxV0VOR68W2g49c2LadL92jJxrOlu2+eHVGaNwi0AxgjCubgwkUoahw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO8P123MB7795

There is a common misconception that the "irqaffinity=" boot parameter
acts as a global override for all hardware interrupts. In reality, it
only sets the irq_default_affinity mask, which is explicitly ignored
by managed interrupts (e.g., modern multiqueue storage controllers).

This patch updates kernel-parameters.txt to document this limitation,
directs users to "isolcpus=managed_irq" and
Documentation/core-api/irq/managed_irq.rst for further details.
Additionally, it updates managed_irq.rst to provide a debugfs example
demonstrating the IRQD_AFFINITY_MANAGED state flag.

Signed-off-by: Aaron Tomlin <atomlin@atomlin.com>
---
Changes in v1 [1]:
 - Provided an example of a managed IRQ using CONFIG_GENERIC_IRQ_DEBUGFS
 - Referenced Documentation/core-api/irq/managed_irq.rst

[1]: https://lore.kernel.org/lkml/20260414200245.1153919-1-atomlin@atomlin.com/
---
 .../admin-guide/kernel-parameters.txt         | 11 ++++
 Documentation/core-api/irq/managed_irq.rst    | 53 ++++++++++++++++++-
 2 files changed, 62 insertions(+), 2 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index cf3807641d89..365c4931700a 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -2726,6 +2726,17 @@ Kernel parameters
 	irqaffinity=	[SMP] Set the default irq affinity mask
 			The argument is a cpu list, as described above.
 
+			Note: This parameter only sets the default affinity
+			for unmanaged interrupts (e.g., legacy single-queue
+			devices or unmanaged pre/post vectors). It is
+			explicitly ignored by managed interrupts, such as
+			those utilised by modern multiqueue storage
+			controllers. To isolate CPUs from managed
+			interrupts, see "isolcpus=managed_irq".
+
+			For further details see:
+			Documentation/core-api/irq/managed_irq.rst
+
 	irqchip.gicv2_force_probe=
 			[ARM,ARM64,EARLY]
 			Format: <bool>
diff --git a/Documentation/core-api/irq/managed_irq.rst b/Documentation/core-api/irq/managed_irq.rst
index 05e295f3c289..8e973a7d1bd1 100644
--- a/Documentation/core-api/irq/managed_irq.rst
+++ b/Documentation/core-api/irq/managed_irq.rst
@@ -80,9 +80,58 @@ The following examples assume a system with 8 CPUs.
     /proc/irq/48/effective_affinity_list:0
     /proc/irq/48/smp_affinity_list:7
 
-  This can be verified via the debugfs interface
-  (/sys/kernel/debug/irq/irqs/48). The dstate field will include
+  If the Linux kernel was built with Kconfig CONFIG_GENERIC_IRQ_DEBUGFS
+  enabled, this can be verified via the debugfs interface (e.g.,
+  /sys/kernel/debug/irq/irqs/48). The dstate field will include
   IRQD_IRQ_DISABLED, IRQD_IRQ_MASKED and IRQD_MANAGED_SHUTDOWN.
+  A managed IRQ will also include IRQD_AFFINITY_MANAGED. For example:
+
+    # cat /sys/kernel/debug/irq/irqs/87
+    handler:  handle_edge_irq
+    device:   0000:41:00.0
+    status:   0x00000000
+    istate:   0x00004000
+    ddepth:   0
+    wdepth:   0
+    dstate:   0x19601200
+		IRQD_ACTIVATED
+		IRQD_IRQ_STARTED
+		IRQD_SINGLE_TARGET
+		IRQD_AFFINITY_SET
+		IRQD_AFFINITY_MANAGED
+		IRQD_AFFINITY_ON_ACTIVATE
+		IRQD_HANDLE_ENFORCE_IRQCTX
+    node:     0
+    affinity: 9
+    effectiv: 9
+    pending:
+    domain:  IR-PCI-MSIX-0000:41:00.0-12
+     hwirq:   0x8
+     chip:    IR-PCI-MSIX-0000:41:00.0
+      flags:   0x430
+		 IRQCHIP_SKIP_SET_WAKE
+		 IRQCHIP_ONESHOT_SAFE
+
+      address_hi: 0x00000000
+      address_lo: 0xfee00000
+      msg_data:   0x00000008
+     parent:
+	domain:  AMD-IR-3-14
+	 hwirq:   0x41000000
+	 chip:    AMD-IR
+	  flags:   0x0
+	 parent:
+	    domain:  VECTOR
+	     hwirq:   0x57
+	     chip:    APIC
+	      flags:   0x0
+	     Vector:    33
+	     Target:     9
+	     move_in_progress: 0
+	     is_managed:       1
+	     can_reserve:      0
+	     has_reserved:     0
+	     cleanup_pending:  0
 
 - A QEMU instance is booted with "-device virtio-scsi-pci,num_queues=2"
   and the kernel command line includes:
-- 
2.51.0

