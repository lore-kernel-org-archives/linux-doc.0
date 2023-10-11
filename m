Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD737E560;
	Wed, 11 Oct 2023 06:03:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="WHYxmELU"
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2063.outbound.protection.outlook.com [40.107.22.63])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B12428E;
	Tue, 10 Oct 2023 23:03:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XauLG77oZ0HfSw6EEUmSX02olkJF5DWgQY7hmURsIJHzxHufEN8/0sYlz2BKwkBRqVztz3KeQWmCB0akDKDcsY6fMybnDGEVVgSpccUQ8/5vGD56FFEudm/Da7Pd10g00DjtfmZb9l2ZTrvU7MRyhSQCSyQDZmrlKJJYpRBqAzP0d7YmedsLjVHA8lcuYjtFEZ0kO523tyNLqYom0mAsokt0D8cW3woqZz0okMEv+2iCKU3TVAgpwgRG+92NIiRtGoqZfDUgc7YCWQeMaQlX0fY9gwMhOGHRqARlOYNwdDWHL5Cinre3SIhElz3CmgK6OZzypC4zhUt1yKLOv4CIog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qYlL11TIzWe210uA3ZUvgc5U6pa6dvKkt3SfkVv1RE4=;
 b=LUBvPLCIyRNAwEoUn55NNZxjGG+CqtGgwU5uvKKe4kR281A/rIrVuy5w44+EbJIYVI3I0UQRZYsDksxje6Xen4T7vKzKlzrD3MF7zPTZbzFEOvsTK+l0gUMpZ3T6kdPvqINl4b6OIWCFh4PpeJeTJ6kGfZcussjJkRovtRtjiyVFnUNvif56yd+Kr9WeQ7BC7y0COahd4wR5k2pmCa1pm9Q048GqK6Akj9CacNKlmNv4ouyXiCvAYBeDGdYGiKesK5zUYCvNDOCVKqfu6HcoYdIDapzvh6IwFuxlFI/GYbW2Rkk3DW1otV6+oA1Nf8vlEiGRNbQh8U41uZTkwUpZkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qYlL11TIzWe210uA3ZUvgc5U6pa6dvKkt3SfkVv1RE4=;
 b=WHYxmELUY+FqsfVkhWvadjDTJU9mHcWSZVwnZyJnpfRvcYtRKTvlDdAkvMUOGAOUzciq7in9vtwTNgQlRmyLLASYyz6rYJyXxBMq6XiNR5BLzMb3v3jiXqtBPxv6cbnLFj5PuqVqsEaPkwaXgPinWeJFgyHkSynB4OpGE6hP85I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB7PR04MB5146.eurprd04.prod.outlook.com (2603:10a6:10:23::16)
 by AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.38; Wed, 11 Oct
 2023 06:03:41 +0000
Received: from DB7PR04MB5146.eurprd04.prod.outlook.com
 ([fe80::f4f8:a4d6:fe5a:3e1]) by DB7PR04MB5146.eurprd04.prod.outlook.com
 ([fe80::f4f8:a4d6:fe5a:3e1%3]) with mapi id 15.20.6863.032; Wed, 11 Oct 2023
 06:03:41 +0000
From: Xu Yang <xu.yang_2@nxp.com>
To: Frank.li@nxp.com,
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
Subject: [PATCH v2 1/5] perf: fsl_imx8_ddr: Add AXI ID PORT CHANNEL filter support
Date: Wed, 11 Oct 2023 14:08:34 +0800
Message-Id: <20231011060838.3413621-1-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0149.apcprd01.prod.exchangelabs.com
 (2603:1096:4:8f::29) To DB7PR04MB5146.eurprd04.prod.outlook.com
 (2603:10a6:10:23::16)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB7PR04MB5146:EE_|AS8PR04MB9080:EE_
X-MS-Office365-Filtering-Correlation-Id: 71c7a141-8aec-44fd-a6a2-08dbca1fd1a8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	F7zSJinpyeuhA4ddc2kiX1+R4Pewnajdb3dzN9fYzykDV4+Lf0EGEUi+ZJYrom0cqvGaot50MPCld+5DWhbJsyYjScM8OlRcwr/fGQS5VQGq3M6bT95AU1HyCl/BVCF0IMYwOCuXL/AjMpUbTuCq8xiV8jvkDbFBzJtErpQUCYI3+Qia9zNCLJe34LRRSrtVHb1i+vE4CPeiBP6S3hZ/QD5n22U/ASM3kEdC0vN/cAABKOdHIhw9MRJXnrCf+QMEh8z/nKTbrVQsgTXNs67Oa/q8exUOUlPoETPhNon3NXmND34J1SydQomCDe112s27FHCqhtW0CFysUJ6pJsUc3f31t7zvC5so3KXDGhPTWMjLeG7eheXIt0Pba2C1i7fyFrLo3fYkZxBvA0reBrRN10Xq2zGQnL7jJmng5WIOIlFcFGd7ROkOsldArncgj7468ceI2Cpk9Jbe0tWT3m0y+SxK7JXv133/Noow/5+ZzE0P8Aua2MTe2DBB4g8shmB3oryG3rA2PM/8N+6odhbZy7BdEP3f6iY8Lb4wyvOUXT6qSer5ZLQ2rejmLcGMUncVugIypuNOTnBPU4nO6BL/TRrB6Y2CHHx8wnXfzwY4PiBUo/tjuSmfnRzK38E8bkfQ
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR04MB5146.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(346002)(396003)(136003)(376002)(366004)(230922051799003)(64100799003)(186009)(1800799009)(451199024)(2616005)(1076003)(26005)(316002)(41300700001)(66946007)(66476007)(7416002)(5660300002)(52116002)(38350700002)(66556008)(4326008)(8676002)(8936002)(2906002)(38100700002)(36756003)(86362001)(6666004)(6512007)(6486002)(6506007)(478600001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?vtZV+n/0kCj+MdGGAYS+PYv97OQd8O4cOd8xaCMRBRvwtWJ7rmK8qlFyVh4j?=
 =?us-ascii?Q?qPsYauVGbn2uooS8uRpGwk+k4JDZsffwLpkOWtn89zpB99SfTkOc7Qzsm1ze?=
 =?us-ascii?Q?JOCJjX8kDS6C5BnkP6/s9EMA+306/FeS/Ga/DFePA/D4882SSThXfXVx2bpG?=
 =?us-ascii?Q?6Lu0YuSRk4pwdj9IQB7GWLhEOjWDhT+QHawyCb9OHMJOZXVKNFMfgzR5vhEQ?=
 =?us-ascii?Q?2OSopyHAtDtXizyBYJnNHs4OOKB+MyEtPtw5XASQD+n1fGV6N42+ZOLj8yeE?=
 =?us-ascii?Q?66Ri+q8VHtL+7M7muBqDhwm+vdjU3jOWPAkGVu8J/7Flqacjaqxn6io7O68q?=
 =?us-ascii?Q?qQQrFHst33Xi2qsAziFOA9jAcf1KIV4s1fNOBaVE9h5bErY6dOneEKrfda6U?=
 =?us-ascii?Q?XN9ZBGurronGmr4QpB7MglzqMUU7OuCqc6OhglOnA2A89G7g4wi/WUCVj8QX?=
 =?us-ascii?Q?KU6kmf43wdvxPijFxTPUGuK3ScXIoHRFqngncDAt4TojrSa4avJnetd8AGYu?=
 =?us-ascii?Q?8JGuyhqp1GFr8wer4aU44+F+3eObwa/T7OeX7/V4pIZ4a0vH0MfMfyKl4TBg?=
 =?us-ascii?Q?qJpIz/HWMdkZHV/Wt3vmy3HVOI1lCNQD97Qq75ffIUv8IjwvK//txYUPL5DJ?=
 =?us-ascii?Q?rnyTNGpS3pFsgRtD1Mg0kxcLrJu3YEIExsBAP1nfaDDFJX1zstQDI9N5JgGl?=
 =?us-ascii?Q?7R0hHFeQGYHseiicO4ktpKb5SJSwZo1un22lGcPjiVHckc7v8AcfryqETdyJ?=
 =?us-ascii?Q?xAug5+lXqhAK9a1PbVXpasNDLxj4qCqdXi2l9aQE4wn6pcdT7uiG6LwrPhxl?=
 =?us-ascii?Q?ftuIg6meMW2KoTNqNy9hvqGsz/LJADUAvA/YnCoWejC4SOk07rJGScQTLjDX?=
 =?us-ascii?Q?Zy90RnhEkAM64px0DSMvQ3KA2GV/7CA50B2qeFE47+LlPhuqfJaPDAG2UqJl?=
 =?us-ascii?Q?mRy4CzTw7EzUUDbKteH2t95JiPOzDSsJRvu5nzXD/MTvURgT9P5q0+co5jXc?=
 =?us-ascii?Q?ztJynW8mPyRc2QRhIQhGVp0CgQTDqFXkp0dyQ8LZFDKqE5GbffmUaB3Fl6jj?=
 =?us-ascii?Q?jvvAIk8sPHtbWeBOp0NXGuSzmLThR7BlNb5Py6k7ouAn1HErxecIPA1Y7wkO?=
 =?us-ascii?Q?TqrEvEr7eMm/TbdUkbnBcq57v527SH0lxoAlEuQy/uqacY0OBdtuFTlyUoL8?=
 =?us-ascii?Q?M+Csl7vFGOxQrTQ8EOro9w+MY8dxeP6HTAPTaYR4lo+X71JlZgt9FXb237Z6?=
 =?us-ascii?Q?CekhiiMer6/GnfCrHq5cC2CfECdEwXyRZxm5SY0l7PWhYdNQAHEFaUNXlwFJ?=
 =?us-ascii?Q?aXamwfIzabBU1wzRT4vHdg0qeFwS3tgQCIPEM6+bN0kbPk4rqO/BuemL1QRi?=
 =?us-ascii?Q?V6edCtJJt1ZEF3j3TkcYL6vfLYT5HU2Ya9SIjP7qTBPmZbhpOz9rl8Bp1MUp?=
 =?us-ascii?Q?aOfZ1eMA26LNyE7q2RTyX01tfGmqN8l6GKiBf/hzDFMXvzhY7W9xHlRSHkqb?=
 =?us-ascii?Q?datmg3LLTcP73q+2OUDFzfEWSj0UGgepmSLl9rgDIMksXAATq69Y7BK07Pgs?=
 =?us-ascii?Q?IJZ5qFCI0H/RpsHn7b2RLuFv2xEFdC6YpMduBIOq?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 71c7a141-8aec-44fd-a6a2-08dbca1fd1a8
X-MS-Exchange-CrossTenant-AuthSource: DB7PR04MB5146.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2023 06:03:41.7010
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AMJv1ib8z7FSSZGSB2WHCSNpsVzjfE7igITOgjDwD5VywkAwpJ2298QJ4Rw3lyZLy02m/O5eZLoHlagUb94THQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9080
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

This is the extension of AXI ID filter.

Filter is defined with 2 configuration registers per counter 1-3 (counter
0 is not used for filtering and lacks these registers).
* Counter N MASK COMP register - AXI_ID and AXI_MASKING.
* Counter N MUX CNTL register - AXI CHANNEL and AXI PORT.
  -- 0: address channel
  -- 1: data channel

This filter is exposed to userspace as an additional (channel, port) pair.
The definition of axi_channel is inverted in userspace, and it will be
reverted in driver automatically.

AXI filter of Perf Monitor in DDR Subsystem, only a single port0 exist, so
axi_port is reserved which should be 0.

e.g.
perf stat -a -e imx8_ddr0/axid-read,axi_mask=0xMMMM,axi_id=0xDDDD,axi_channel=0xH/ cmd
perf stat -a -e imx8_ddr0/axid-write,axi_mask=0xMMMM,axi_id=0xDDDD,axi_channel=0xH/ cmd

Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

---
Changes since v2:
 - no changes
---
 drivers/perf/fsl_imx8_ddr_perf.c | 39 ++++++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/drivers/perf/fsl_imx8_ddr_perf.c b/drivers/perf/fsl_imx8_ddr_perf.c
index 92611c98120f..d0eae2d7e64b 100644
--- a/drivers/perf/fsl_imx8_ddr_perf.c
+++ b/drivers/perf/fsl_imx8_ddr_perf.c
@@ -19,6 +19,8 @@
 #define COUNTER_READ		0x20
 
 #define COUNTER_DPCR1		0x30
+#define COUNTER_MUX_CNTL	0x50
+#define COUNTER_MASK_COMP	0x54
 
 #define CNTL_OVER		0x1
 #define CNTL_CLEAR		0x2
@@ -32,6 +34,13 @@
 #define CNTL_CSV_SHIFT		24
 #define CNTL_CSV_MASK		(0xFFU << CNTL_CSV_SHIFT)
 
+#define READ_PORT_SHIFT		0
+#define READ_PORT_MASK		(0x7 << READ_PORT_SHIFT)
+#define READ_CHANNEL_REVERT	0x00000008	/* bit 3 for read channel select */
+#define WRITE_PORT_SHIFT	8
+#define WRITE_PORT_MASK		(0x7 << WRITE_PORT_SHIFT)
+#define WRITE_CHANNEL_REVERT	0x00000800	/* bit 11 for write channel select */
+
 #define EVENT_CYCLES_ID		0
 #define EVENT_CYCLES_COUNTER	0
 #define NUM_COUNTERS		4
@@ -50,6 +59,7 @@ static DEFINE_IDA(ddr_ida);
 /* DDR Perf hardware feature */
 #define DDR_CAP_AXI_ID_FILTER			0x1     /* support AXI ID filter */
 #define DDR_CAP_AXI_ID_FILTER_ENHANCED		0x3     /* support enhanced AXI ID filter */
+#define DDR_CAP_AXI_ID_PORT_CHANNEL_FILTER	0x4	/* support AXI ID PORT CHANNEL filter */
 
 struct fsl_ddr_devtype_data {
 	unsigned int quirks;    /* quirks needed for different DDR Perf core */
@@ -144,6 +154,7 @@ static const struct attribute_group ddr_perf_identifier_attr_group = {
 enum ddr_perf_filter_capabilities {
 	PERF_CAP_AXI_ID_FILTER = 0,
 	PERF_CAP_AXI_ID_FILTER_ENHANCED,
+	PERF_CAP_AXI_ID_PORT_CHANNEL_FILTER,
 	PERF_CAP_AXI_ID_FEAT_MAX,
 };
 
@@ -157,6 +168,8 @@ static u32 ddr_perf_filter_cap_get(struct ddr_pmu *pmu, int cap)
 	case PERF_CAP_AXI_ID_FILTER_ENHANCED:
 		quirks &= DDR_CAP_AXI_ID_FILTER_ENHANCED;
 		return quirks == DDR_CAP_AXI_ID_FILTER_ENHANCED;
+	case PERF_CAP_AXI_ID_PORT_CHANNEL_FILTER:
+		return !!(quirks & DDR_CAP_AXI_ID_PORT_CHANNEL_FILTER);
 	default:
 		WARN(1, "unknown filter cap %d\n", cap);
 	}
@@ -187,6 +200,7 @@ static ssize_t ddr_perf_filter_cap_show(struct device *dev,
 static struct attribute *ddr_perf_filter_cap_attr[] = {
 	PERF_FILTER_EXT_ATTR_ENTRY(filter, PERF_CAP_AXI_ID_FILTER),
 	PERF_FILTER_EXT_ATTR_ENTRY(enhanced_filter, PERF_CAP_AXI_ID_FILTER_ENHANCED),
+	PERF_FILTER_EXT_ATTR_ENTRY(super_filter, PERF_CAP_AXI_ID_PORT_CHANNEL_FILTER),
 	NULL,
 };
 
@@ -272,11 +286,15 @@ static const struct attribute_group ddr_perf_events_attr_group = {
 PMU_FORMAT_ATTR(event, "config:0-7");
 PMU_FORMAT_ATTR(axi_id, "config1:0-15");
 PMU_FORMAT_ATTR(axi_mask, "config1:16-31");
+PMU_FORMAT_ATTR(axi_port, "config2:0-2");
+PMU_FORMAT_ATTR(axi_channel, "config2:3-3");
 
 static struct attribute *ddr_perf_format_attrs[] = {
 	&format_attr_event.attr,
 	&format_attr_axi_id.attr,
 	&format_attr_axi_mask.attr,
+	&format_attr_axi_port.attr,
+	&format_attr_axi_channel.attr,
 	NULL,
 };
 
@@ -530,6 +548,7 @@ static int ddr_perf_event_add(struct perf_event *event, int flags)
 	int counter;
 	int cfg = event->attr.config;
 	int cfg1 = event->attr.config1;
+	int cfg2 = event->attr.config2;
 
 	if (pmu->devtype_data->quirks & DDR_CAP_AXI_ID_FILTER) {
 		int i;
@@ -553,6 +572,26 @@ static int ddr_perf_event_add(struct perf_event *event, int flags)
 		return -EOPNOTSUPP;
 	}
 
+	if (pmu->devtype_data->quirks & DDR_CAP_AXI_ID_PORT_CHANNEL_FILTER) {
+		if (ddr_perf_is_filtered(event)) {
+			/* revert axi id masking(axi_mask) value */
+			cfg1 ^= AXI_MASKING_REVERT;
+			writel(cfg1, pmu->base + COUNTER_MASK_COMP + ((counter - 1) << 4));
+
+			if (cfg == 0x41) {
+				/* revert axi read channel(axi_channel) value */
+				cfg2 ^= READ_CHANNEL_REVERT;
+				cfg2 |= FIELD_PREP(READ_PORT_MASK, cfg2);
+			} else {
+				/* revert axi write channel(axi_channel) value */
+				cfg2 ^= WRITE_CHANNEL_REVERT;
+				cfg2 |= FIELD_PREP(WRITE_PORT_MASK, cfg2);
+			}
+
+			writel(cfg2, pmu->base + COUNTER_MUX_CNTL + ((counter - 1) << 4));
+		}
+	}
+
 	pmu->events[counter] = event;
 	hwc->idx = counter;
 
-- 
2.34.1

