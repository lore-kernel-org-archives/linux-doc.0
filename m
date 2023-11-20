Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="Kcy2zQpa"
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2053.outbound.protection.outlook.com [40.107.21.53])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B418399;
	Mon, 20 Nov 2023 01:28:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aZBZ1or5fnolwa9h1/8soIQZgFJjaY70QVDbE0Vf31FFG/SCZd91CHFbOas/aO7v/J4MSx+/RkDWNfivfg6nx8NaSLhh9cw+C7y2LS8BmcsfkcdUK/i/YQd9T1l53bDbEqOvJS054xhOGBlka6vMchcB8C0v7OKofHuoZAxPjHtLf1OQ0endsOpd9akrvHxIumBNR0NY5p5b1Uru2Ae4NvDvUX0fHBbhGl2INrq+YwUmHBI1iHq8DC6f9QNIS2q7K4BHHcbRGoFWryDth24ki0NA480lI9aazrdEiMAMcwhazs4/0qXv04k/HbVCHqv8Pm0hcvNxt7EU0OMrUDdf8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fhd5cza3SB7hFnwUJRgO4IurqBf+Mlp5edS7WbHKRN0=;
 b=BBYU4pf7Tz0OLKMfSLd4x8x0jmYLB+7MZ0AiddWJahzijXITgifUGYKkoJ4+S58zG660/TEmq1GBYqpr6Etm7NVJc/kAyX4Ozhk/Duw65YdoQ81/p78TvzMY0faXDgNLX1dteZSOybZhApeqrcRwtTqb0HbwrBZjEI6Fe+ILGc02ctEclai4KN5tg7FHxpmXefPwIEhs4j5PNlWkpcMxkCleGTDyqNFAzh2I5uXhmepvH2w4eWxwC9wu1QYShkXgai6oXkTN/lluJXNNKXtl5Gz/5ryq/Vq0k3CplkgEyTRiOH2nJY4wVGCMXnXJfSvscFL8XBK+zTWbAiF7oMx6Yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fhd5cza3SB7hFnwUJRgO4IurqBf+Mlp5edS7WbHKRN0=;
 b=Kcy2zQpaNWCcVWDR/jupYr8l6z40SoWhPDxdgL8Z7qNE7niUW8oIPq81UTUq+G35v5PK/Lrb88BIxoHPYcQ8dzF5OzAMOh0J5PisXzogBs2wAP50ewTSKwxAk6RqHwIFvGrYrQmElnBDejd9MXF8EwhCcxYocfmTukrLYmcMsmg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB7PR04MB5146.eurprd04.prod.outlook.com (2603:10a6:10:23::16)
 by VI1PR04MB6880.eurprd04.prod.outlook.com (2603:10a6:803:130::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.16; Mon, 20 Nov
 2023 09:28:01 +0000
Received: from DB7PR04MB5146.eurprd04.prod.outlook.com
 ([fe80::709e:6876:7df0:fc30]) by DB7PR04MB5146.eurprd04.prod.outlook.com
 ([fe80::709e:6876:7df0:fc30%7]) with mapi id 15.20.7025.014; Mon, 20 Nov 2023
 09:28:01 +0000
From: Xu Yang <xu.yang_2@nxp.com>
To: frank.li@nxp.com,
	corbet@lwn.net,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	will@kernel.org,
	mark.rutland@arm.com,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org
Cc: festevam@gmail.com,
	conor+dt@kernel.org,
	linux-imx@nxp.com,
	linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org,
	devicetree@vger.kernel.org,
	xu.yang_2@nxp.com
Subject: [PATCH v3 2/5] docs/perf: Add explanation for DDR_CAP_AXI_ID_PORT_CHANNEL_FILTER quirk
Date: Mon, 20 Nov 2023 17:33:14 +0800
Message-Id: <20231120093317.2652866-2-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231120093317.2652866-1-xu.yang_2@nxp.com>
References: <20231120093317.2652866-1-xu.yang_2@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0058.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::9) To DB7PR04MB5146.eurprd04.prod.outlook.com
 (2603:10a6:10:23::16)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB7PR04MB5146:EE_|VI1PR04MB6880:EE_
X-MS-Office365-Filtering-Correlation-Id: 83d26cb8-f588-4fb3-22af-08dbe9aafdb4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	E9MNUpN1YxjBHMxKzRmsunUA+1m9bqUJre1mM2AY5udYm0DsW4F6gfe3uPRC1FsVPkg6Z1BqecOYeYHQipwa7jXi5XzksLzg/j9HFYOzXPdUOU0ceUnGW/IJYXruJQFjrXPT9J+Gr+Mo0xtSUbt9gtJ9x+foQzriOj6qJD3oN0ilsLekaQo99pfhfnmCheldV0UjSkkpbqD3uZ/3wgbdkdnawtaSPEJOhznHExf+9szNKV0kbcv1y4IKxQ9DjsAakTpuLkIs/eLBYALRBHdN/l9J4t+MEnQChlA4et/Gr1zlgcxz8KS1VwPST3rlaK27W0SK05xV+iGEwPqkmZxwa9J7LUU/CaAOrOc1C4VHRet3XxohoPwC2jrIfM6QlGWYQ4N5K63pGR5UVzCcAM+Rx7dlu1M7waUj6Op3JgvvU2xDpPGxXAcrkY4v6uxuHlpifHVNnp0EQQ41NWMxyBiPrU15krvXRv5PVBOiRCCaQbtN1Z3XldpQAvWAr1ETcIQMv/akBEPcbGmG79GSzMUTv0et7U9WHqMClOfbFTSOXsUmve7BCyeM6VSlWDGIe9gp71LXzKvwtxZVmI2nnSheU0bxp3z192CBKxgQz6eOoLmTPRbM1AvjScFXVGnaTg4l
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR04MB5146.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(376002)(39860400002)(136003)(346002)(396003)(230922051799003)(1800799012)(186009)(451199024)(64100799003)(478600001)(6512007)(83380400001)(6486002)(2616005)(1076003)(52116002)(6666004)(6506007)(26005)(66946007)(66556008)(66476007)(316002)(86362001)(2906002)(41300700001)(5660300002)(7416002)(38350700005)(38100700002)(8676002)(4326008)(8936002)(36756003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?NzBEQH83+MfAlg+Af0ytFyQYVBpBEimPqQlL9YpbGlbj1s13gfKGNphzFXto?=
 =?us-ascii?Q?wbN+dIwe8v3Z6l/nOlfh4o6/SrZ0FuBbtHW/C4KmoVm0T2tU9uU35/arVIE6?=
 =?us-ascii?Q?6MkPe7YlgZf+qNeK/PAxMW4Lvmm896QzZPKyp/my0FNoGrGHR4/dcOXbn+i/?=
 =?us-ascii?Q?q3raSR+Ol0zzfzGE2pe69uzYg5/rCdWNL7y0ciqTd0oe854qsxAWdcHQfgJh?=
 =?us-ascii?Q?BAeC1OGkUIkRtu9pK8WDnAsS9zEyq4u43aTM2OXwG71drDrBjbQlGUFOnzbH?=
 =?us-ascii?Q?innlXeg+BtrAaOchGxosHXE9oJ6U47s52fy3qpsBaYv17eh1A/8gr7ByE6EO?=
 =?us-ascii?Q?gebIfy82yFEyKweMLYNjNH+sCMDrb0J4rJvN56NDgVJstHOQOCvDLstmZqos?=
 =?us-ascii?Q?l7vVad6y3jrEbRqT75BHozlugW2zMlXxwViMoBUCbUlC1cLFEtuniNSSfIo6?=
 =?us-ascii?Q?GsO962O8iBqQAbgeGzDD9Bjdj3BNHPb+6YII1HH+UWfZ4uCGMWLORzi15QFn?=
 =?us-ascii?Q?gvFf5oMgE62Nm29Z6stpeO+rYbCwZNoftIAapAGDsCaWbEd3ZL0APVqWhqeG?=
 =?us-ascii?Q?L7ryN4O3lodOViSS4+Xx7LA0XjDw0Gpn+7+nfmQczy3H6Jb5D7dqQ31wZG7K?=
 =?us-ascii?Q?rb7EFvYMg9iXEAivb++C6EFWnCMthvqNV9kgr7N1XEj19z+FsB+/pTux13m1?=
 =?us-ascii?Q?lN+yrGP+TvzM9PrmqJw1GqCZM3WoeghbNvk0rvVpaKUgqia5mKWVJdLFdv1v?=
 =?us-ascii?Q?9mn5OqvaUv6E0xRx/ITcuEQ0hvhd7XNDePWdRjtopOgdXeY0ilaaT1jiClOg?=
 =?us-ascii?Q?SWgTV9Q7tS5fqAooNHkvaNIPbnxEqhmRVPypv1pgfOicmrigSNZFYt9kPvXn?=
 =?us-ascii?Q?XeQF48VVWDvP9nAfXn/BRFdcR5qmul2HK2bDqrVZ9oElld6ahNLU0AndtQOQ?=
 =?us-ascii?Q?KIFlHj8/xKcqv4qjnXj12O4OMd6MR8sy1jW4UsdGgHRg+PD3jqhZ2TqUwiq/?=
 =?us-ascii?Q?YA1QWlIliL4W2r8jjSSMQ7Q2o6xwKDeFBJp9lWWo+2h4oQzjX/+dO/q6csqt?=
 =?us-ascii?Q?WlpJOXepIkQ52q9ECQQQEVVOqk0P2RLOv1QWOMVR3JPdQi8itN4gmjGaqwpZ?=
 =?us-ascii?Q?GeXVhnLxZLIdhLifMVdXI8U+liQECw7picCAJKq+LRfxpztVaMLIMP93y5Th?=
 =?us-ascii?Q?z3koll3gYRhPuTKlhugPGHM/8taF59U4wbNJX3WR5KOcOvcLaLVoBp+/gZfb?=
 =?us-ascii?Q?uu0LduPtKEb4ACFpY0pIB0dTDbe5X15nnIM7e8HFMj/pCCrtzG2omjeTrGfk?=
 =?us-ascii?Q?MiPvxzGDAvKfroitySLZZqDzIOJBXh6tsCktzEuOjIPuW9m7IbCzq860lYj6?=
 =?us-ascii?Q?k2qLDwKlvgX+9QMiwVls1sEKqH41JAM6yR9pPdu8GkFBH5vGGs70tuuLN7x7?=
 =?us-ascii?Q?kzT5WYGzQmk9jrzPmmA08GkWZ2DNmwNi/jdPIAoNlOXB5SZBO9HCq1yQb15K?=
 =?us-ascii?Q?KsG3RtUsUJeIjKpJK3lGkdNIJB1JDj2tNCugSDdP4O0uqDY560nCD9a8eS4A?=
 =?us-ascii?Q?AwcpAcKK47PFAsyM9J/KvCXicMlU1hTNvsnYv2bZ?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 83d26cb8-f588-4fb3-22af-08dbe9aafdb4
X-MS-Exchange-CrossTenant-AuthSource: DB7PR04MB5146.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2023 09:28:01.4959
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mfXKKtUZC5HLw1C9Gm0pyFasdoo4qsYVJpMIkEYpcw+oZTW5gjaONFI05jVxzf/fgU7dN1UdClygHiAzfmoaQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6880

Add explanation for DDR_CAP_AXI_ID_PORT_CHANNEL_FILTER quirk.

Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

---
Changes since v2:
 - no changes
---
 Documentation/admin-guide/perf/imx-ddr.rst | 45 ++++++++++++++++++----
 1 file changed, 37 insertions(+), 8 deletions(-)

diff --git a/Documentation/admin-guide/perf/imx-ddr.rst b/Documentation/admin-guide/perf/imx-ddr.rst
index 90926d0fb8ec..77418ae5a290 100644
--- a/Documentation/admin-guide/perf/imx-ddr.rst
+++ b/Documentation/admin-guide/perf/imx-ddr.rst
@@ -13,8 +13,8 @@ is one register for each counter. Counter 0 is special in that it always counts
 interrupt is raised. If any other counter overflows, it continues counting, and
 no interrupt is raised.
 
-The "format" directory describes format of the config (event ID) and config1
-(AXI filtering) fields of the perf_event_attr structure, see /sys/bus/event_source/
+The "format" directory describes format of the config (event ID) and config1/2
+(AXI filter setting) fields of the perf_event_attr structure, see /sys/bus/event_source/
 devices/imx8_ddr0/format/. The "events" directory describes the events types
 hardware supported that can be used with perf tool, see /sys/bus/event_source/
 devices/imx8_ddr0/events/. The "caps" directory describes filter features implemented
@@ -28,12 +28,11 @@ in DDR PMU, see /sys/bus/events_source/devices/imx8_ddr0/caps/.
 AXI filtering is only used by CSV modes 0x41 (axid-read) and 0x42 (axid-write)
 to count reading or writing matches filter setting. Filter setting is various
 from different DRAM controller implementations, which is distinguished by quirks
-in the driver. You also can dump info from userspace, filter in "caps" directory
-indicates whether PMU supports AXI ID filter or not; enhanced_filter indicates
-whether PMU supports enhanced AXI ID filter or not. Value 0 for un-supported, and
-value 1 for supported.
+in the driver. You also can dump info from userspace, "caps" directory show the
+type of AXI filter (filter, enhanced_filter and super_filter). Value 0 for
+un-supported, and value 1 for supported.
 
-* With DDR_CAP_AXI_ID_FILTER quirk(filter: 1, enhanced_filter: 0).
+* With DDR_CAP_AXI_ID_FILTER quirk(filter: 1, enhanced_filter: 0, super_filter: 0).
   Filter is defined with two configuration parts:
   --AXI_ID defines AxID matching value.
   --AXI_MASKING defines which bits of AxID are meaningful for the matching.
@@ -65,7 +64,37 @@ value 1 for supported.
 
         perf stat -a -e imx8_ddr0/axid-read,axi_id=0x12/ cmd, which will monitor ARID=0x12
 
-* With DDR_CAP_AXI_ID_FILTER_ENHANCED quirk(filter: 1, enhanced_filter: 1).
+* With DDR_CAP_AXI_ID_FILTER_ENHANCED quirk(filter: 1, enhanced_filter: 1, super_filter: 0).
   This is an extension to the DDR_CAP_AXI_ID_FILTER quirk which permits
   counting the number of bytes (as opposed to the number of bursts) from DDR
   read and write transactions concurrently with another set of data counters.
+
+* With DDR_CAP_AXI_ID_PORT_CHANNEL_FILTER quirk(filter: 0, enhanced_filter: 0, super_filter: 1).
+  There is a limitation in previous AXI filter, it cannot filter different IDs
+  at the same time as the filter is shared between counters. This quirk is the
+  extension of AXI ID filter. One improvement is that counter 1-3 has their own
+  filter, means that it supports concurrently filter various IDs. Another
+  improvement is that counter 1-3 supports AXI PORT and CHANNEL selection. Support
+  selecting address channel or data channel.
+
+  Filter is defined with 2 configuration registers per counter 1-3.
+  --Counter N MASK COMP register - including AXI_ID and AXI_MASKING.
+  --Counter N MUX CNTL register - including AXI CHANNEL and AXI PORT.
+
+      - 0: address channel
+      - 1: data channel
+
+  PMU in DDR subsystem, only one single port0 exists, so axi_port is reserved
+  which should be 0.
+
+  .. code-block:: bash
+
+      perf stat -a -e imx8_ddr0/axid-read,axi_mask=0xMMMM,axi_id=0xDDDD,axi_channel=0xH/ cmd
+      perf stat -a -e imx8_ddr0/axid-write,axi_mask=0xMMMM,axi_id=0xDDDD,axi_channel=0xH/ cmd
+
+  .. note::
+
+      axi_channel is inverted in userspace, and it will be reverted in driver
+      automatically. So that users do not need specify axi_channel if want to
+      monitor data channel from DDR transactions, since data channel is more
+      meaningful.
-- 
2.34.1

