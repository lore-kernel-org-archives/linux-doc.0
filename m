Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 000F9CE79BF
	for <linux-doc@archiver.kernel.org>; Wed, 20 Sep 2023 10:15:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233866AbjITKPj (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 20 Sep 2023 06:15:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50720 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233864AbjITKPi (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 20 Sep 2023 06:15:38 -0400
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (mail-ve1eur01on2040.outbound.protection.outlook.com [40.107.14.40])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2686BAC;
        Wed, 20 Sep 2023 03:15:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MLeDRHo2Qdddjc70EjCC0db+Z3mHCoFPBssvTAQ8bsaRO4wqGXxHUdN1frE9+0tc+LrnWP6gpybw7ogPF9UO0aEBCJ68r9Iy8Dx220/8QtneefY7HnS49BL7K/+dzS61E6QtYW3mJ4iqHnxE6i/in5jx2igKxb2lDBzUe55b8SQQZ/dMeK+NpEoPeMfiBinn3hy9OE8zjSkTDDFAJj/eiTVxO/5uawiy2K8X3IZFSDwfWmwtBcqAiyeidU2DLYF7nd/FrKncap33k9kY1E5RaYyNiQr0OJUi2O7aRx46Aa5CJUJ3NIIpQLLxTQxrddKisaKpY5nkh2lvipj0FMl4HQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7J9M1PC14xk4unh+o7AV/qfg3AMRkZ0H3oTYHGmDodQ=;
 b=OX7l3TKocNoAhh+hjtX5M6ZM712qyBQGQ6M+YHURRDc1R+lXt0kobuhT7Zp7xKWC7tFJ9gzrtOO12DDxJTvr2T57D9hhAZD9wCn4qO4q/Sq46JquF7x7rhvu/76oVRfObwkcJaEmfFXn+EmRFIgdetKdsyH1PuCFFPxgJS/EpB+3PnPwgzIlLpte89vj3LzPFw+lecFEh18YyiGn1lqqImenc4NOCeRSCuiMb/QZd4d08wmxcsTlpsogO89MKKe5nTbu41ztrRgMOlTXxjhEKhC5QSrpO8YB9Y/3Wm0GOnHjYskvda5NUW67RYh3GFhoOPL28tCt56KVV9Qy8pTwdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7J9M1PC14xk4unh+o7AV/qfg3AMRkZ0H3oTYHGmDodQ=;
 b=FF8PYA8Jh8x+OzjG37E2f5rpjzXrYkuMVB/AFbALt/U1i6i7ZBrUP4bPAkDbuFDMd8tbcsiViqlBIFmQpst6OV7kVkWdiNCmNdK8lKd79JAwSH3/wgOUQtdBOJLHm+PAqnfcvs6dA+HWKpMp8V+pftWB5WlyHrlW59JJrz0hAcA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB7PR04MB4505.eurprd04.prod.outlook.com (2603:10a6:5:39::26) by
 PAXPR04MB8375.eurprd04.prod.outlook.com (2603:10a6:102:1be::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6792.27; Wed, 20 Sep 2023 10:15:28 +0000
Received: from DB7PR04MB4505.eurprd04.prod.outlook.com
 ([fe80::6444:e07a:e7f7:3923]) by DB7PR04MB4505.eurprd04.prod.outlook.com
 ([fe80::6444:e07a:e7f7:3923%7]) with mapi id 15.20.6792.026; Wed, 20 Sep 2023
 10:15:27 +0000
From:   Xu Yang <xu.yang_2@nxp.com>
To:     Frank.li@nxp.com, corbet@lwn.net, shawnguo@kernel.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de, will@kernel.org,
        mark.rutland@arm.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org
Cc:     festevam@gmail.com, conor+dt@kernel.org, linux-imx@nxp.com,
        linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
        devicetree@vger.kernel.org, xu.yang_2@nxp.com
Subject: [PATCH 1/5] perf: fsl_imx8_ddr: Add AXI ID PORT CHANNEL filter support
Date:   Wed, 20 Sep 2023 18:20:00 +0800
Message-Id: <20230920102004.886599-1-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2P153CA0031.APCP153.PROD.OUTLOOK.COM (2603:1096:4:190::7)
 To DB7PR04MB4505.eurprd04.prod.outlook.com (2603:10a6:5:39::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB7PR04MB4505:EE_|PAXPR04MB8375:EE_
X-MS-Office365-Filtering-Correlation-Id: f348397e-ddfe-404e-71d3-08dbb9c282c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: brq+VFjYE9zGmsx/BlkciszLKhng00+5pC+GW1VFcQgEyemMJiZvNtudoqnXLia4b6BALKRc67uvpb/8KypOClB+MA+N8cg9ra9Sp+3jjXZ8Wl5VQJaICy3EXMVCfkMlOh9mSjYK3iCjjHRCTbNEuVTyXOj3Vu+PdJCajgxws6jdvRNGY/0IRQZHy1H+pQpEQ5XyRr6RO2Os9q4sOzq4HbGjyyK694qc1/pMsj4x/LlgpvafBIDrmLC6yFG8mBp8e0m5XD7m/trUsVgJi1TrZwiHJrmwj39rgswQ4xKhQZLDtDX/a/7pWbqEcDDTHskC+UZPiIu+W61LpVxdqgB31I7chbZVabdT86e65X9UK5kZEvttZCoJnk2/9503YluAe4IM51MZ04MIZ9b2ZK4n9DbCzev9rSJ0PSif76aAQRS6TwXywl9xC5Fb4Lzk39+sOFgeuTnazXt8XeafjixAObwbElkWelqzvuL75M44odSV2MXeoDC0ZUcC92uCu1MhX1LxAXvKrVkOpqnHFOqRDEp5ZHm6luXcc5BiEPcOT2rQ1bt/nnzC81IuYmiYsie+JlY6wtEV9hX8l/+zrNCFlswvQj20XMYjLvhTiYY0ZBJ0BffO69rGe7GqZxsOSwHm
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR04MB4505.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(396003)(366004)(136003)(39860400002)(376002)(1800799009)(186009)(451199024)(316002)(41300700001)(66476007)(66556008)(66946007)(478600001)(6666004)(38100700002)(38350700002)(2906002)(36756003)(86362001)(7416002)(8676002)(4326008)(5660300002)(8936002)(2616005)(26005)(1076003)(6506007)(6486002)(52116002)(6512007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?tZnAMgi+1QoAfI7u8fThbr/im9SkHyVZZAt2Ggv56VX2UQIz7kGNvFGwHdAu?=
 =?us-ascii?Q?1ia/3h0hlH9NsOkN0EZrVkDiAdzk0qtylKgyGRUZwnXSBDzSZgRTjAbBwZVg?=
 =?us-ascii?Q?nHVwXfAuVZgxR99fDwyHMhpjyWwqQYkm62Qf3BR/tcNFM5I2YBjAjuaA5P+X?=
 =?us-ascii?Q?3MO537QztcIIxW1IgloC+G2mnVl/9eDt/dIKM+Iv64v8ylbvFaK36ez6x0PX?=
 =?us-ascii?Q?dvWYOEI2231Uaxpt2izQZ38fYBBJAADc6QJIXkkYpgtbZeqS/KTO/iMVqi5q?=
 =?us-ascii?Q?5mwgSvZBqNZd2lkifCjpQc8EU/tDGTmvKVVWWL1Jk7ikgPpMm625nAjytAyK?=
 =?us-ascii?Q?YGHD7XiQTxXDaN5/m0ohA0j4Qmw3VJ2s5Z6GTe6gng8k3RVMBoKV5UdrLJzd?=
 =?us-ascii?Q?rPvuoZ+5rP+lgLyWJZgrYDLb22UoUgeQK7O6UQD3JglWilm0NdRTlwML1gaP?=
 =?us-ascii?Q?wIaQFusTMouGmfDmOaIgQJVG1T5R+Zj/ZUFQvQG0zQJdEpb5iXFgUn+zi5wb?=
 =?us-ascii?Q?zUfv14pSX6VWMl1xYA+9rDYhh0QdO7IwryayzQFN4yROl1igw37LcitxGTRb?=
 =?us-ascii?Q?BJsSAZ6aqSi9vZL7L7Lysrq5Qqhtu7oStD0g+SicO8Gg1hsFEQTRgygv7CPb?=
 =?us-ascii?Q?pUbe3IegPpNYr8M5bbnRNLWuT+RmlO789IMdW5FvjWZme7yPe+fDDU7uZ6iy?=
 =?us-ascii?Q?/Qv+vnfmhpz5Fi89sTeOQPX1wVjWfA5Wr/J+ZLBEk6++0+wmhQS/soviYVDg?=
 =?us-ascii?Q?K+yCNRoLefxj5xNktX244ps7tw9nP0+F9r4l3plGfn86iGi5/x+foDbWGnGn?=
 =?us-ascii?Q?w8ho6eNbPYcOLsULU4RPi2BLK3Ka8EtNRNqZmtlIptVK6/c6TYyKZGa6A1lO?=
 =?us-ascii?Q?ASMfO4BCzzc/tGOpEcKqfm/coft0pYxjVJfgaDNRqHX7WXNcSEEI0tKBN9yq?=
 =?us-ascii?Q?NAIcpbvVWd4t6j7cEwo2Wa5vObXyyhC/sZ259RH4J4tVqkFR9s9nzzj4Tium?=
 =?us-ascii?Q?ss1U8cHAxNkFe7vGM7CmuelWmaRrYcaEkzGjVjf/y2P69pgOFzNNY0l18zWN?=
 =?us-ascii?Q?UUJtF8QzN6uEEVXJwIBBeOwrVf2eaJ8tv/z/bZfzXg0SIsxXdQC9mu908zk8?=
 =?us-ascii?Q?26ND/8zR8w7xvlyGvQcaqtcs6V1URLJqPVpfONnCjcr0lvu9qKNeWjuxohB+?=
 =?us-ascii?Q?/w/b2MptpkI82NARmn9ZUpUkCB0to7HHkk54loLUYWrDkrb/sONPvoh82pJb?=
 =?us-ascii?Q?Zthk3+xdMOuBWrN3297jFmnLaLjw7ySEf8sUkYsepIRx8pTx4wmmevwbBX6R?=
 =?us-ascii?Q?cUTOG78bvlOJ1Z+Q4V9kv6SsB/kDa93AGTdrdfFpMTYjVXuM+QU79LyJhh5d?=
 =?us-ascii?Q?p0jslLeqoErGw6adufEVZEMQvTPpYR3SADOaiTJd9R0n5XNPKm6ldDe0KxgY?=
 =?us-ascii?Q?jJVEAbmGAZiephh19WWM1Z2QqRAiGcv9u0ZdoWQK7UvFZdfnMwXKN+Eb7NDH?=
 =?us-ascii?Q?IWfvJS1I/cS3UykiHLa+5wxxBTj7ZFXPaoe4tGZhu8XGelaX4ri3dtbHPzwZ?=
 =?us-ascii?Q?tpizotoG7jij/7+Jmt8sPAxXlJZeuv0NRpHET+VX?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f348397e-ddfe-404e-71d3-08dbb9c282c3
X-MS-Exchange-CrossTenant-AuthSource: DB7PR04MB4505.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2023 10:15:27.4074
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FqtrvDONS3zeJdmLXZJmH4VW5xj/+gQGTTZi9h7U7vANUZBG/6g/jO5Em9xguOoTycFjVZ2b4vCImOBqqgq1rA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8375
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

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

