Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A32D0E560;
	Wed, 11 Oct 2023 06:03:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="l/Yhi/I+"
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2053.outbound.protection.outlook.com [40.107.22.53])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC9AD8E;
	Tue, 10 Oct 2023 23:03:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A+z4AnA9pUULQDYER5Luq3l8OZQILoDIDL94GAD6/LDc6gkDmaZW6WDUWpIVynE6JiVkYnxmQ3ICgSOBggCvWcfw07ngY1SlIjbhhsnkHXo1JfK/glpCgz75/2ZxN/vpUp46k2URNnsup+TzbXI6Cb+w8MJvrqbM955qzAnbOoy0IEfjubcx4plsgQwq3jMWAzXe8yYO0HrVALdsoPAWoZxQdzmurXVikJp063S5An2TXLNjCefx2T9k5x4wziYUiSwl0dgrGNzkhJFW6D6/3pbJQTg1SyiPbU83lIcj12D/VGdqPAfzUGeZhJZ+3cNfZOvkHVCb+X5NknYP1sBZOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fhd5cza3SB7hFnwUJRgO4IurqBf+Mlp5edS7WbHKRN0=;
 b=QB3Qlr0F70Co+BX6R+jBTAdyiqnljw4id2foWO3GEbmEXOSVNNo3K8X++0rraAiHePUN0QS+8gqQZXhwVTFl8K/qCokUuOv0A7x5BWL2YpA0mk00ZCGyZs1AKLFBpT2eBwCv16TrFL4bmKaBhN9BPFlVK9IKWkzDMrtn7UE/yDqabCTK0gFLTG7LAzKJGY/E0dmFpKS+XigWuzEqrfKQHElAdtBECNeNlyOrYmxG0rOu0UbQpeFJ4pHfVl+M6G7kR7AxTrLaan8rFaHn75yNK1oC5AE+a7lUw/lhOqB+xMlsUO0sgL4wn99lLWJ91M2ueZ6T0qmNQ/abmnsXqGMQ+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fhd5cza3SB7hFnwUJRgO4IurqBf+Mlp5edS7WbHKRN0=;
 b=l/Yhi/I++Dcbb46NcesidTWfF8Hg9y+rOawW9kg3y3oY4+/sC9DRZAzMDEcUPOFSdmdR7WtU4k7yg4Y7bFB6180pfv6/ZwHTJIPMoO3a6JJ2kGzstW+v8xixKKbGpisqxorhN9PGDIxW5WS4WIiDH+KvaxQB44cYcpYm22PqEBI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB7PR04MB5146.eurprd04.prod.outlook.com (2603:10a6:10:23::16)
 by AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.38; Wed, 11 Oct
 2023 06:03:46 +0000
Received: from DB7PR04MB5146.eurprd04.prod.outlook.com
 ([fe80::f4f8:a4d6:fe5a:3e1]) by DB7PR04MB5146.eurprd04.prod.outlook.com
 ([fe80::f4f8:a4d6:fe5a:3e1%3]) with mapi id 15.20.6863.032; Wed, 11 Oct 2023
 06:03:46 +0000
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
Subject: [PATCH v2 2/5] docs/perf: Add explanation for DDR_CAP_AXI_ID_PORT_CHANNEL_FILTER quirk
Date: Wed, 11 Oct 2023 14:08:35 +0800
Message-Id: <20231011060838.3413621-2-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231011060838.3413621-1-xu.yang_2@nxp.com>
References: <20231011060838.3413621-1-xu.yang_2@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: fabefba4-f040-46da-9de1-08dbca1fd497
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	VXdnTB5EpvD6eXmcLX8z6gfHOhsDDsGPRQPvIwyCE7RxuvpICGBYRMkEXW3n6ex43fpYi5BfH55XHFb500Zac+q6BObMbSS27XdULQ8YXH7Vt06owS5su+2FXBOaJV8wjEsN4zj/w2WQtPtwKbrs3aDyKSFJx2la+4keCFYXH5RB09xP2mZzKwou4Db/QGv5dHBnNGDNWF5B2uuIyEK+u5lOR8L9Ct+ez3NDyWHO9rDyQPT7SvxA3cd2z2P38eUAffiRfC8cyXxbMALZsESxNy8BgngERfWuz+uMJMDz5drOxhbw0n5RcGwI1pMKA1K699bLc7HkpJktk3iuVfP+qHyYdmUWmW29QSCdYljpIpmgCTQz6Wm0LzHr4Z0QCKgv38dOmhiWMpbzxnSMhatsXg/IODS0TOxadQFfw9bQYwdf5afqHxv99wnPZPXTXd9xNUGv83ubRDdQJjwy21qqtBA6lPY9c+U1v4gMJdlorPbV/uCBU9cSa/Fs0wei4Jh1MWvkMSDww8I0Lyr8PsufURasBsC40DDwdkj5Pe/qHtYmzIPUe170B4TFOEnJLaiYODkrG4lea2gcZH5UYsKysNGg8Dk45F6qAm7pPx9ufFeuJ3WKi3mCR+rqfnL2TLM4
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR04MB5146.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(346002)(396003)(136003)(376002)(366004)(230922051799003)(64100799003)(186009)(1800799009)(451199024)(83380400001)(2616005)(1076003)(26005)(316002)(41300700001)(66946007)(66476007)(7416002)(5660300002)(52116002)(38350700002)(66556008)(4326008)(8676002)(8936002)(2906002)(38100700002)(36756003)(86362001)(6666004)(6512007)(6486002)(6506007)(478600001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?eEpnU9rhdC6MWKCvM4xES1K+CFAOB/nz06CMLMDDFwkzQy9Vau7NSqqRWs9s?=
 =?us-ascii?Q?9oIR2RxtafOmc4+tPmDifLziLRRospL2/axjtNLAm3AqCpQ3gviTOV8kluFj?=
 =?us-ascii?Q?G629+3B92Ez2dBPzj7UoKayHIY+TeLztXLfkTGpausnIELitsVLjvMcFu5Ko?=
 =?us-ascii?Q?3h35urvuM/BeA/3vVBwqQC1ig4MHtVh/BCAKs/gVm/izWjmqbHxDkdquk2SG?=
 =?us-ascii?Q?Bx2P3PnCoZ05hn6HqiatU770oNbJ25nZjlkFauGg6hoC+CkJP820eYtTVKVl?=
 =?us-ascii?Q?fSRDYn7TeymOmLiLWqAWaDuzjBX6f8YdJAvY6NhycYt3bhTAiYtc4cvmx7wx?=
 =?us-ascii?Q?TroXIrVHPAms5OfVFslmth6Z4R5dNEP2V57PxsmVJR3Wbi6YIEXCaVUaLjur?=
 =?us-ascii?Q?FVJYrcPP0S+Y/9XBTIs0JCAp0wrg+WztiVlwc3dWSHZlNzIQS1LMMSPmf+rn?=
 =?us-ascii?Q?nomk5l0WHnqFvI8V9KHunRrwHKmF083jf/t/8f8PeookR4sz2id4xmenGFGB?=
 =?us-ascii?Q?f4LHB9TzRnUrUzTs625IMrTe65DJidF1H1P9UR/6PzRO9rABa6/KIoKgtZ7R?=
 =?us-ascii?Q?+ZAieMrQuWZU0TX4pIXmhA5P/GbF1d7e4y7ONLX2rF87tBzced6LupdwhtX8?=
 =?us-ascii?Q?vYSK/hXmbIaFzCC+bP5jdfh5w7pmsamW9poyeZH8Ro2u+wytFa7ifTXoR69e?=
 =?us-ascii?Q?qb99p+chbcJC3lVfBZtT11I02gg/0zRJSOUDEMVyRzoGhHNc1X/JDrH1uAap?=
 =?us-ascii?Q?MKahQweQqypwGo7PHhGNJywlk5n2dqdgbKp+5CYQjhu3esgv2Fo9SeVea1Ov?=
 =?us-ascii?Q?pRWImn6hLS+Zw1Dl2oAT66uzawlPaZNB3Z2I3zAIV/OivTMflhWlNaaiK4r2?=
 =?us-ascii?Q?XQquBt18wGX0s5a6lXrqEwtkpz1DLPHHK2NDixjUVElCeA1cOXewvLXv+gaC?=
 =?us-ascii?Q?kvJqsFk28+XxrS96TXXC+sWE075Ieg9+C7duHpHpwFIQ+U+7LmH/AnmDee23?=
 =?us-ascii?Q?9HbJg0MIOodSjXHbwwffyhJ+yTaivCiR0shT+FrtVatSnhFEIrP2eA2AL/68?=
 =?us-ascii?Q?bI6bIyHDy9Wgzg6WUGVp0vtGrFIRd/krHU976JmljGwSVpdtA5pSlyHRLWrP?=
 =?us-ascii?Q?58w8KPsQo37gOv+uQsThFMDtDHxR+2zkpdkJYxUcmRjQ1/i+aqba6vT+OuwA?=
 =?us-ascii?Q?SupWCcL65VErBXFBrJfXFiLL+q8zyPn2sde7a8X6f0qSdE/48hpraGnFBs2b?=
 =?us-ascii?Q?HTm/N8oxvgu+td0c8ojTM3SD6d660S9BzaNHFc8rfcC8QL6unsySJ0q3sLbP?=
 =?us-ascii?Q?GD9yJrhocfOH1O+3RxBN3OyVA6m6gUsdfU4A90lrZmwB7H/dK5ua0W3OfN1W?=
 =?us-ascii?Q?i7WQGeKMFr9j2e9g5A2poy17M2+6LogaocdtFUp8vEpVCONEFgWsitq0XdaS?=
 =?us-ascii?Q?bPlXGiBBIqm2/XHiWr8WkxI+SUikzt4w60Bntto+Yh/0RiH8CECFG6NBnXfH?=
 =?us-ascii?Q?gHOsBX86lkk8102lwS6kLbkL8BkugTrvQM7o0HpZdV2Rax6IEIL575yUgjBo?=
 =?us-ascii?Q?r0giQH/wEfRa2aQaLrLHzHbuw3uB22pqT0U48VoH?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fabefba4-f040-46da-9de1-08dbca1fd497
X-MS-Exchange-CrossTenant-AuthSource: DB7PR04MB5146.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2023 06:03:46.4550
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q7vJ2t19cKiqUrDrxmVnCeK6WU6TcPYShFWgi6LXb5rd97IqtB7tFTcpY+1pohkxNys6qQx/5mhT64h/oovqmg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9080
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

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

