Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="UDh0CHt2"
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2049.outbound.protection.outlook.com [40.107.22.49])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DDF6D85;
	Mon, 20 Nov 2023 01:27:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kDJ9Shelnq2ineeN5J0NfvVdU9sl59cq4nvpCNGegFNm5RqEBtiC22OfUYvm4kEIvtUDgydZrI0TAfnyCRG+FrHzqNO0KvSGEfEnEMCQdTUCkImb0cLLj4mLWKbpDSErXo4C5eB9bzbEESvp8NXRFfS9Agjr3fBZp5b9IGTe3uz0EdnRvc3ke84RxF90IcDVGubPsByGv2JIupnKKceY1MIeAXp/txZzxwRmOkfrsWuJLrtCeiAerg/WWxDqf3pbn8V+4U5NkTcKqEflxC2qsC6wY9SquUTIj7F3O2FecAp4Vd0XxH0ueDu752L073YWBTbYYeJJN8TEQD2jpQfyew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a6VwUUaL91crPIwCDg8onHKyp0UjCE6mjgyDzA07xu8=;
 b=CJbc5R1qJvcGBj3vHrL4RiAPGdK3FQrt2lPNnug1ZzQCRu8e8Iij71m7+sf3qjf0A13KzWzeqczULWwsIPoOGIo69QWYSxBzmS/7a6Os8ifDAa2HNRHcsaSYKySws9nCL1lFDtnZ2xIgBJIA8941t0sk8OWCeDSgaR9ksZFITH+POSzc8kCjtmWtegdjyYNKDz0EEKPdwuptjo35WWy/VdOcuAKEDSTxMWKr2llnKhTaMCIyEEf/hjxF0Wh9wCc6AD22KmxIZAhmJtjYKMvFHqmN5Gfv4nKPfx8qBX2wb7x3AhuA8y0LCXGuyJeyL4rmQN79v11iRBRp30IZgNpsgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a6VwUUaL91crPIwCDg8onHKyp0UjCE6mjgyDzA07xu8=;
 b=UDh0CHt2GMkrCWpEXX5pLRllckZFyQfIaWicEyAKtZXK3LDmuI2fFru2eXFFsC+0xiQNn+C+wM5LHNj0NureXrbzHrCKg/NYo1mqUEbKz7yBXPgeQuE4CPmv17pr4omlDR/uSoQ0EKvoNTPYrr2+zAXI1oqRQj4sH78Zmvc8NWw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB7PR04MB5146.eurprd04.prod.outlook.com (2603:10a6:10:23::16)
 by VI1PR04MB6880.eurprd04.prod.outlook.com (2603:10a6:803:130::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.16; Mon, 20 Nov
 2023 09:27:56 +0000
Received: from DB7PR04MB5146.eurprd04.prod.outlook.com
 ([fe80::709e:6876:7df0:fc30]) by DB7PR04MB5146.eurprd04.prod.outlook.com
 ([fe80::709e:6876:7df0:fc30%7]) with mapi id 15.20.7025.014; Mon, 20 Nov 2023
 09:27:56 +0000
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
Subject: [PATCH v3 1/5] perf: fsl_imx8_ddr: Add AXI ID PORT CHANNEL filter support
Date: Mon, 20 Nov 2023 17:33:13 +0800
Message-Id: <20231120093317.2652866-1-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
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
X-MS-Office365-Filtering-Correlation-Id: d0f27763-74d5-4635-e43f-08dbe9aafaaa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	tl5eVVYDbGU5AlKA+BDZXvGPy5JbRwE4TlYNUfsiQi0MkjCFnO3as7PDt0BiUv3ovGo0FPBwds79C97YG+/HNqBHJUR+G0v7QzmkgRqVNIGwvWlW520VelbSF2mwk3UD5igSqbokiPdBFQq5L9BKhp3SC0rWqR/PuV8E9WEXaJHWbmavnfn68X+/A9PvRuJAjYXwUJHnEJfc5XrLcjGzjXQaffNLWctVwNJHZMuJRku6RBUEXMSnWlZTh4WQ5y4oGHFnS44R+3gXDeUAW/SWWLwNkUz/edJ4OHFR0dTUf3BPhzD5szuK7C2vlVCM/cOrSsXknZEsNrwccwOgpme/09/bONJm6WIB+5bYfS85ESA8iBa+6pf2zcW0hKKF1sd46ySVfep6v+2ajckTkm0JmTKWZPreCJtSRzlEMGi2OOfWbvvxjKrZdoJHbMTmwnu2WlndQrxiBbtrIlRUAc2jD65MDEtI1IgFY1AJDWwTSBzlvG5rRjSI7dcH7TNlDzPOExDq0UYorYlcOBuHrsLFdVMX8ZMH7LIYV8fxV/acg9q+5C7MsDFz9JL2jXYcBbEqdjd/40aP2paY0HVNG+zlzH5Kfv/rI+jejXFQxCcMabRwDEMMAAf3LBFvyIDnQ1Qx
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR04MB5146.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(376002)(39860400002)(136003)(346002)(396003)(230922051799003)(1800799012)(186009)(451199024)(64100799003)(478600001)(6512007)(6486002)(2616005)(1076003)(52116002)(6666004)(6506007)(26005)(66946007)(66556008)(66476007)(316002)(86362001)(2906002)(41300700001)(5660300002)(7416002)(38350700005)(38100700002)(8676002)(4326008)(8936002)(36756003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?0ch9AzUSGH3m/1IPI7K17Akvka16zEg0ZHiqb7GbIiMwYaeOATXOSpiWy4al?=
 =?us-ascii?Q?wTJkEbUu5VapsrECFkUB33iWksSvYi7yv4xmIFjSKrU1xdjRsDRMi3kDnR7b?=
 =?us-ascii?Q?kdiV0f26GsrHq8np4Xr3Md2hlLpqNT148Et3cQwpRb0yAMeYu0UowgjSisVK?=
 =?us-ascii?Q?S16Vwzhqo92sviwLPvFCgb7HIpRavNOgaMfRkOdGGLSTv+mmr8fMHZvSkusa?=
 =?us-ascii?Q?TLwPy3l1XuvvQdC3v1JyBfSkw5mt+sIrnsj8uVpKvJvZJ3TTc15kVFN96+yw?=
 =?us-ascii?Q?BQUjshFWRtPR1aGC8bc+bawXiGrXd+0WChBymIsk4CP8Ai/H6K0+KO1y31Y+?=
 =?us-ascii?Q?hTjDOf8b1R7v78QEke88rK10j2koz4qrq3x2MI25y0KXkJoZbeEbSecPaB69?=
 =?us-ascii?Q?w+h0GQfFY7OlGgRMM0Jpf3Z8og1o5s3z9k1FTrC8ANlIrCB+AXG7h45E0Hh4?=
 =?us-ascii?Q?/BFyrlpR02x3Aj3S2G0DMkaYpzepFmSCnCq6UkZTWmK7U5SxeF4KBVtMFo16?=
 =?us-ascii?Q?frKZjORt2wdm4vBnfIocsyTPRg5wzBYLVamyhZnzniOJGazHUjueuZakXiNp?=
 =?us-ascii?Q?KuculQLk2N0biTWr5P7VhuvasqAXnGOxk4wilqdUeQCedC8ySq4QSfddLx6Y?=
 =?us-ascii?Q?Gd7J7IjjsClxr6QOod2TH8Eh9pvkMfx6mflX3+4TaEW2brkGybSCkcwCc9Ah?=
 =?us-ascii?Q?cc2Pt2mvR63vwjan7iAzjJkPlG1F8kuWksfLM+L/DRKM1gtqZZpRCOYNWuc4?=
 =?us-ascii?Q?/IVwxDzpj7IHW+xGBG2fz2jwWUHfPNdzsF7DO9pdpeZR61JNVwZTGoERM7Jf?=
 =?us-ascii?Q?qQ4rkxfYBBFliCa0s4h4TSmrEvhvXJ1prFwvg6RJQpD8WW/PSQcRxPO6K61c?=
 =?us-ascii?Q?nC5DV2rhZ0ibDPckKL/MhP4sByRpw9foFhNMVR0eiyAy4EmlKg50xF0Nask7?=
 =?us-ascii?Q?CaUzIBsQxWPlADrKa6fryRJ6EKr3TgDsnYq/roacQQBNK+3tFNphVq2X1Tty?=
 =?us-ascii?Q?DnJyJkd2ITSN3I6npxlC+ZoOab3iJX0hNZzJGdqgWrUFHfnuENnVeMYOL4CS?=
 =?us-ascii?Q?NDxprMIWIVXyf9sBIz88j5UtDXthyeK+CTIZwm5ZnKchlKukj1CL72kK+jfH?=
 =?us-ascii?Q?5VrrAnuV6Sf27mM+0LYdJis5LbMp1hz8VFIvG37GSs/Gh9QQNI4lH/EcbpML?=
 =?us-ascii?Q?5agQ347P4sFkmVI/gBVpYu0BwbVvHPjo5S+TB9rgUIJ08ibdda3waRtmM4di?=
 =?us-ascii?Q?8OiKCl0xV6oQrroj931b5WF72VyUC6lHRuM3py50QiN1olQ2BW12aHxnIvgi?=
 =?us-ascii?Q?D7J/4Ybmj1ZBoq0tErQgPoI0feJdiWp+w7So0rudMiTPvd7U1fOA/dOonc21?=
 =?us-ascii?Q?31Jc739yfaMpqhO/QEGIn8MpkKs00/XTsYlx9S0LkmA9KECULGj0t9d/zgNz?=
 =?us-ascii?Q?RJ4umr+IQ3Tsb+ZdHeKMPg0GJQDlcVuw5PE0e1TFoLUN+TJ9YFmkjl6ZSA4Y?=
 =?us-ascii?Q?DGRYATRwaONMyrT5X8PZ7mlHWqrKDE4XPFG1LtRLNQxSw9cRWO2yDpHWRnGX?=
 =?us-ascii?Q?hfw+d51GMse/Gh2fq/p/ERv1N7vW8fxae/JeAAcc?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d0f27763-74d5-4635-e43f-08dbe9aafaaa
X-MS-Exchange-CrossTenant-AuthSource: DB7PR04MB5146.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2023 09:27:56.5318
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P0WzgPmsvrPiDw2oA0ku88R7j0YT+lD4tuQlszpF+ejaemWUAZN5ovGEDDvJpd4rwX3wlmmNWP4QNZZSCl9Qyg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6880

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
Reviewed-by: Frank Li <Frank.Li@nxp.com>

---
Changes since v2:
 - no changes
Changes since v3:
 - add Reviewed-by tag
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

