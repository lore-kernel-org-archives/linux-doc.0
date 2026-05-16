Received: from CWXP265CU009.outbound.protection.outlook.com (mail-ukwestazon11021104.outbound.protection.outlook.com [52.101.100.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3749A3E3172;
	Sat, 16 May 2026 16:28:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.100.104
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778948913; cv=fail; b=G1CZojIJ73qsOrf2g8JYVBbF8A803UUACfPOK40Z88fqHU6NbBEfIc0meYEe9m8G6x6XvZNh5hp1sPWj0n4wVkCmEdyQvdZrRzZFtHYw7Xv602Ci1E760g6Mlxn/boDtxA2z+eSdeCYPGxLGGR+afhOJiuQrUGTqQzpiatgTpKA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778948913; c=relaxed/simple;
	bh=VuSekCAxvrTYJlQLt8i3ji/maqGhOKAmNcPQRaLNrrs=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=T3XXoaVpgnlaxZKvxWYOmg6f14KgyJECsrAs3uXsAGWSCNu6ElpS6hG71W+xvh62/0oZXmT+XvJM+bGh+zuBtBJ7hK5+knVTGbVOeOayb3FhmRw+lw8nJfx88nC9JvqwsiljkmLU9N1Stm0hmvr9f7WYjQVtcYrmGSCyMa3CBgM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomlin.com; spf=pass smtp.mailfrom=atomlin.com; arc=fail smtp.client-ip=52.101.100.104
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=atomlin.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SPvsihMg0RIgervGrL5D8MZhL1OxdeZ9S9xYIdDJEJXV5JVzndKEmszH6ceVRYyIZ50sG/ZJmTJvAE39IwBwMFl5d9CUOKdPno+JYmIr0qw8CArZYmXtNYsZGG7EuSqYxQ65O6iiAcmdvF7A01ES5nc/EChcxAAUhPp13V0+6wp+JbvsPfluDCIhtWWg1zZeDXP38itrJCeCMBspdcqwk5gSkyUcXc8yEFoU73baEQwDQxJ1zXhLKtkOOdQtg4E7QMYj5KRIAlXmEF+oVxL46k1l/V8e9vCNh7DJ2M5w8SjyahccvBHJYw7uqBUPVsW/3HSt1LY7qI99lhf9m4aOkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9/DfpcFvtUpNf0tRNKBchGvcQk0SKkYEt+uXtr6SXRo=;
 b=gHEcpkng6gL7O+xvN3eE4xpAFIlRJYuNzi6PYrWW22kfJszwRxB5K5WL6Z1InApsBYDVwjmCIyHSYHyZGmES0oxg4nQEkDIySOEumqYIzFCVabuzDg3jkf8YT5S6yVpCGqSy7gIUF0f26W8keZyrkFutIyZAnChUw/R+yca6nJgq90AIqtN/BTn6ucMI2WGiuU5mj8cXbuD6GOR98SPLPayZWiDlBtBZ88FYc7iASKSJ3Cn/KoxQjBJ/E+n2JkFvVJZWw2TnmEUqXhGJSRIMw8yXLqhoJOmak1KuiEO/DRSjAdFGl2Ccl5u09mG0qMG29ayzhsiIwYFY3FNcSJ4Wqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=atomlin.com; dmarc=pass action=none header.from=atomlin.com;
 dkim=pass header.d=atomlin.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=atomlin.com;
Received: from CWLP123MB3523.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:70::10)
 by CW1P123MB8919.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:271::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.21; Sat, 16 May
 2026 16:28:23 +0000
Received: from CWLP123MB3523.GBRP123.PROD.OUTLOOK.COM
 ([fe80::de8e:2e4f:6c6:f3bf]) by CWLP123MB3523.GBRP123.PROD.OUTLOOK.COM
 ([fe80::de8e:2e4f:6c6:f3bf%2]) with mapi id 15.20.9846.025; Sat, 16 May 2026
 16:28:23 +0000
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
	bagasdotme@gmail.com,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] docs: kernel-parameters: document scope of irqaffinity= parameter
Date: Sat, 16 May 2026 12:28:19 -0400
Message-ID: <20260516162819.247530-1-atomlin@atomlin.com>
X-Mailer: git-send-email 2.51.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BN1PR14CA0026.namprd14.prod.outlook.com
 (2603:10b6:408:e3::31) To CWLP123MB3523.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:400:70::10)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CWLP123MB3523:EE_|CW1P123MB8919:EE_
X-MS-Office365-Filtering-Correlation-Id: 231a7430-77c8-4a0e-859d-08deb36825ec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|1800799024|56012099003|18002099003|3023799003;
X-Microsoft-Antispam-Message-Info:
	9tvvhK8eJ+r9vjqbvFPlJnApO77JeTvj262ew0Db60jHHmDXyG8lsvoa81nLZf+dhczgqdt6ZG/G9iE3Y+XjqgRFvZSQX0KKIJd5GZbJ4bkunANMHdkro7bvcCc4wDVpw1KpEToeZyvJghscvWgUowgngZqCJQn4EmewVkdZ/WqzQW1QRKnkUk9+zm29Uahee7a0SrPhrr9WI5rrNCVAlRQIC+mHWzLWTSEs82aHneVA07pXJaLqkhg1g+ui3u/YBxIcWNk3jhO38mnjQWLoGsL3wBJsVBv00BqAMnHDlOf3mblJmxBUJ49fzkqQEEn99ktPTO07c+c8mkRHjo/h+qe/Dxo35Rg6uZGMRJhf7ts5CHWOyIsh6CvqhUBTbro5LEEhn0osfBZeYOTjCkDKc2O7+7U0r13XsEaD/uL5B7fE5QlwDlYa0CFXGF5hcF+v2Xr0PgThqYdo6cymYdrOxuUqldO1ort9sCT5MDOpm4137ezutDTT7auCbZ2knXdo5PiYeOefadHTwtUGWFddLrvaNUanZEd4EXmbzqPpwx9C5EQ/H0EaDSBalpnNr5seeroX4GDPSs4byS9CvaCE4WVAEiFaxJa8DsHQnjQKnd5GBA+WWXl6IK2VJyY6PDt0qJz1sbQ5hhlor8V75rhVvPv7Hvw/gdaKw652PGDwqfMt0lL5X4BS+mIG2KQmzEQG5rlSGWyKvoxb/h48Upltcg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CWLP123MB3523.GBRP123.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(56012099003)(18002099003)(3023799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?pBXp4alWccKsNqrT8FUZJriO5YQ6V4PtnooX9sDZWtwiEzXjC4/JvQr/KLc7?=
 =?us-ascii?Q?JVx4d5rdd1dRbqNJHdYEZq2g0r+LuJoiWcGrrl+1W+XaT7B2cJc6b5OrRNj+?=
 =?us-ascii?Q?MzouwzSB/nAJn4rECsgDqzJT42JAKOFsp3fIp+qyIjNFqRXkZPyGtM40F9C3?=
 =?us-ascii?Q?weFH+MpGTiqvmtWWAvYbTaLi7HEOUe7FEvk3eGbzLhGW6tvv0va5eqnIfu72?=
 =?us-ascii?Q?qBC7VDTLFrmGrcZDQNsaV40nOyApeioHv9c854iwNZWy1DSo0Qn/rs5chTVu?=
 =?us-ascii?Q?efq6SwjzeRg5AVtN5/RKmOYOpK7uSgvC7JcABXrXUyyC4xEVlG5zzjVXFzTD?=
 =?us-ascii?Q?PxGSW2vAfKLtJwJNRgXT+HUe0TFRX4Q8U1QhW0nFZFczZzBPlTj4STmWXhGE?=
 =?us-ascii?Q?SSvNCnRCGiNOO8HMzrh/JdHQ1CIo91EsWYxYlNr7q8pU6kTw8nyGclb2hY1i?=
 =?us-ascii?Q?uUTI3BYQsl7S/lmGnU+SNVjKYFbW75PsKb7RZMJA3bUqEmru1gdDDFm2z2Jl?=
 =?us-ascii?Q?vvSYhRAQaEFC+7uBExbIo8XPcDhGZxQVcrbkBsS8Sz9z4NTnDFh0a7mRdbLk?=
 =?us-ascii?Q?jYxLckSXY5Pqou5ubiqUY/LgEecE7EKN2TijGHYRzLL+5/s5lvRW5Ha9zay/?=
 =?us-ascii?Q?ExyzE9VVL1hF4jpYAg851IrGGgRx8fRnxjSjNlQoC54ibYOTUlVj4i7Fk1Ih?=
 =?us-ascii?Q?ULQktIhZA63vjA8Ph0WSwUafjknHAgUwy1gdnMO05YsV80yG8yH7Cm7Tx/IG?=
 =?us-ascii?Q?L0iX/OXOv2ry7OVWfRLDIGteYcQSDnTe0c5rP8OwPALpKZSziTLYjO5cHag6?=
 =?us-ascii?Q?VMJwyhJsgI6inE4JyNdhKtP0SblenHr+YLTdZTt+/Igdq3L0ZGEIo/pa9w8r?=
 =?us-ascii?Q?bT5Sp6xJiiZDbhHGuOcn/U1pIf84g4DwlQURiLLKlIAGEOJEBfEnpoJh2CgD?=
 =?us-ascii?Q?KbhgIbSY/+Bz3rpiHTW7Tyi/wCbSphVZ1B4sDWAxamLfoFZp5B84PSCaPoBN?=
 =?us-ascii?Q?aTduagy4gnc01Q80PUWu2UdaVeWI85339TmGepf3yrkKD2PDeEC5fpE12rt6?=
 =?us-ascii?Q?YqRHLqgmXTxtcTsfuY3g/EJTbfiw9AWcb80C3brVWMp1GS5eZDeIX0jhpIp7?=
 =?us-ascii?Q?QkB3Iom+k9vV6z3/Km25ysDOrtnMBLdE/cwTm/VHvKVKXu2/r7Weei384ZUi?=
 =?us-ascii?Q?D6Utk65/DHEKQmztTyrgwgT5aMlSRSVFZceqtYlklSpflDK4NsCm7Qz2FZOD?=
 =?us-ascii?Q?EPPNmrl502uyd6D2Kzwv+iGJQSdA4nhmg14rG0IDcAiVGUfWNr9bot2+jg4d?=
 =?us-ascii?Q?NTM7Z7A/xsG7DYtNaHnbdtqNKYmUPxXreMOYMMj+kvznsUyUXqXE2DH3a+4R?=
 =?us-ascii?Q?lfcdBn/vXOmK+XamQ7WO81BQxD8pnxO+bckta235ZAYYuZvuizPsEzhHLhWq?=
 =?us-ascii?Q?KfhR63rNKtYzA3WO4dDhgtgMQ64HvX9yMKVB48JL0oOzvCRNnctxzm6jfy2j?=
 =?us-ascii?Q?6YpbspFZg/VAL0omZ3UpFQ2GbkgfRAvQhsKBj8xPf8TCC2bJUkv+O9VDKP4V?=
 =?us-ascii?Q?8Q2xsEI8k6gLkjLqef5/gwvVz0LXYmAAWEDVlb179+XIzsD3WR9Fa157avEw?=
 =?us-ascii?Q?0rsO3vX11RJ1zu1FKTi04UDtzkHfj6YNomaU4dtXRDdLcrcCrZJPPOkNOrWP?=
 =?us-ascii?Q?3JjgYucVVcL9JiskovaqsYyVBUsObeMwQUXK5zEuWLmkfkQRbWMpp5TfcY2A?=
 =?us-ascii?Q?7+aYvOwb0Q=3D=3D?=
X-OriginatorOrg: atomlin.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 231a7430-77c8-4a0e-859d-08deb36825ec
X-MS-Exchange-CrossTenant-AuthSource: CWLP123MB3523.GBRP123.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2026 16:28:22.9396
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e6a32402-7d7b-4830-9a2b-76945bbbcb57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PI2fxh0+F3mTCTivzw1GAegy1l+/cntvFo0Z8FmWfROIxlfnMc3KBaCxfAwAR2hUDy2qDbaKYPl30polR+lhKg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CW1P123MB8919

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
Changes since v2 [1]:
 - Reworded the debugfs explanation to explicitly distinguish between
   active and offline managed IRQ states
 - Clarified that the shutdown flags (IRQD_IRQ_DISABLED,
   IRQD_IRQ_MASKED, etc.) only appear when the CPU is offlined to
   resolve the previous contradiction with the example output
 - Explicitly labeled the debugfs snippet as an "active" managed
   interrupt
 - Used double-colon for literal code block (Bagas Sanjaya)

Changes since v1 [2]:
 - Provided an example of a managed IRQ using CONFIG_GENERIC_IRQ_DEBUGFS
 - Referenced Documentation/core-api/irq/managed_irq.rst

[1]: https://lore.kernel.org/lkml/20260421150911.42404-1-atomlin@atomlin.com/
[2]: https://lore.kernel.org/lkml/20260414200245.1153919-1-atomlin@atomlin.com/
---
 .../admin-guide/kernel-parameters.txt         | 11 ++++
 Documentation/core-api/irq/managed_irq.rst    | 60 ++++++++++++++++++-
 2 files changed, 68 insertions(+), 3 deletions(-)

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
index 05e295f3c289..649f7f7fb0ac 100644
--- a/Documentation/core-api/irq/managed_irq.rst
+++ b/Documentation/core-api/irq/managed_irq.rst
@@ -80,9 +80,63 @@ The following examples assume a system with 8 CPUs.
     /proc/irq/48/effective_affinity_list:0
     /proc/irq/48/smp_affinity_list:7
 
-  This can be verified via the debugfs interface
-  (/sys/kernel/debug/irq/irqs/48). The dstate field will include
-  IRQD_IRQ_DISABLED, IRQD_IRQ_MASKED and IRQD_MANAGED_SHUTDOWN.
+  If the Linux kernel was built with Kconfig CONFIG_GENERIC_IRQ_DEBUGFS
+  enabled, this can be verified via the debugfs interface (e.g.,
+  /sys/kernel/debug/irq/irqs/48).
+
+  A managed IRQ will always include IRQD_AFFINITY_MANAGED in its dstate.
+  Furthermore, when the associated CPU is offlined, the dstate field will
+  also include IRQD_IRQ_DISABLED, IRQD_IRQ_MASKED, and IRQD_MANAGED_SHUTDOWN,
+  verifying that the interrupt was cleanly shut down rather than migrated.
+
+  For example, an active managed interrupt might look like this::
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
+    affinity: 3
+    effectiv: 3
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
+	     Target:     3
+	     move_in_progress: 0
+	     is_managed:       1
+	     can_reserve:      0
+	     has_reserved:     0
+	     cleanup_pending:  0
 
 - A QEMU instance is booted with "-device virtio-scsi-pci,num_queues=2"
   and the kernel command line includes:
-- 
2.51.0

