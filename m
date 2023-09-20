Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62BBACE79BE
	for <linux-doc@archiver.kernel.org>; Wed, 20 Sep 2023 10:15:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233999AbjITKPl (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 20 Sep 2023 06:15:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234061AbjITKPk (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 20 Sep 2023 06:15:40 -0400
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (mail-ve1eur01on2040.outbound.protection.outlook.com [40.107.14.40])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89643AF;
        Wed, 20 Sep 2023 03:15:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J6MNocRNmb6qmCDeRsYnjXyNKqSZSNSqvPlBbHWRr6lOxlt/CnuGK4VWsS61cx+EbRhVLe0mtXvL1iFUX+mguKA3RPap/hbJ5Y50GCDYl3PgwaXFc5M3PNfxbmE/m+YcsfGmOGTvK96xhHvktyekeNTuX0PWZl8cAn7LyFdIqU+rvuLdaonnP+w4/VYMvCrG/QJhJ54nb5xFPa3kQyjagqCfv5EyoNm3ie4X97q+ELhrNk0qvvz6sh3wavn8UhSmGBUNyZN/pHsVCXT3rqWW6sy/0inKN716auajAi657xpTKWq/BzV/59q0c9Ophn5+0G/E7vMjLjK0h1/pAaziPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hwu71Zz2ykWhznt8j3pisZXAwsxTlI8QPA0LnDHXhb0=;
 b=EaMUrGYXQxYVPTHD6T/Swp10yNFBXIRE03byUjT3DmGsYvXUpJ8Avmfw4djSfHjvbezlt37Qqq5fjvo3le7y6BakTMkquCeDiu0HCr/Nqmxvn9/WN8H3ZM5FPeveGkoGGXXXvI+nIFLOCK/o6hFI+j8RqPM6PLDElu9KIiDE3YAB4sLxDKU0Chs9+13rTduNjZsMvGIoY2MhvaKFKwS1J1gfQkajE5ptQtyfmDaXuNPWyAhRtWY9G14n2QYstoLCxcw6dGkYR+ZYPL6+5//4XhXWdTcJzSoLjYy0qh41UdEA5rNS4T3/UqDrqrEpHv7VTAtWiRqcTLl3w5e+vqr5bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hwu71Zz2ykWhznt8j3pisZXAwsxTlI8QPA0LnDHXhb0=;
 b=Qgi1Lrdm7TpZjmq2xR9b5EQK83RPAeHLs5VKsCAtmB5/YCWrw7mqU+ZhxAwXh1oRANUe9igjTEfjgdwQ6OTJLS0VdMG4snk+hQPRqqCQ3cQ2UCHyv8q5V/ABdOilL/8+av0w4hAxgAo8FiXlfsaeKCZOg2ayT2kBqFGfG8U2Y2Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB7PR04MB4505.eurprd04.prod.outlook.com (2603:10a6:5:39::26) by
 PAXPR04MB8375.eurprd04.prod.outlook.com (2603:10a6:102:1be::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6792.27; Wed, 20 Sep 2023 10:15:32 +0000
Received: from DB7PR04MB4505.eurprd04.prod.outlook.com
 ([fe80::6444:e07a:e7f7:3923]) by DB7PR04MB4505.eurprd04.prod.outlook.com
 ([fe80::6444:e07a:e7f7:3923%7]) with mapi id 15.20.6792.026; Wed, 20 Sep 2023
 10:15:32 +0000
From:   Xu Yang <xu.yang_2@nxp.com>
To:     Frank.li@nxp.com, corbet@lwn.net, shawnguo@kernel.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de, will@kernel.org,
        mark.rutland@arm.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org
Cc:     festevam@gmail.com, conor+dt@kernel.org, linux-imx@nxp.com,
        linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
        devicetree@vger.kernel.org, xu.yang_2@nxp.com
Subject: [PATCH 2/5] docs/perf: Add explanation for DDR_CAP_AXI_ID_PORT_CHANNEL_FILTER quirk
Date:   Wed, 20 Sep 2023 18:20:01 +0800
Message-Id: <20230920102004.886599-2-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230920102004.886599-1-xu.yang_2@nxp.com>
References: <20230920102004.886599-1-xu.yang_2@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2P153CA0031.APCP153.PROD.OUTLOOK.COM (2603:1096:4:190::7)
 To DB7PR04MB4505.eurprd04.prod.outlook.com (2603:10a6:5:39::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB7PR04MB4505:EE_|PAXPR04MB8375:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e8be107-d13c-4e25-b85a-08dbb9c285a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /15QNMmP5IHmxOOXrKn2JZhyqgRSMC2Pz+77ZPJqe1EDVkrAX1I7MAm6Rv/FbgRXIi0fucQbUzhIrCpuguRXMuRLgZfg9xyJ2+bxE6DypGDryamUAvOrFd01i6jm6RtQtJu9AOZkJYngC+Z1gB9XfLsNvmOttDrOOgPehXIsa//kOZ38QDB9i2OHlXjfhgzEMmm5/e630SiVfpfafB+j5eqzWlbAh5zelE46H5LxJ5pL/9+9JqzbzjXe+OwSGO5PFlbhZd5g4ZE1A3Nabc+90o26mjkFj0wm8GeWN+jzP2RNXeVSrCf2flfUfR9kSHVllP5xtjNYgGQyowKmCdVF8fUqnUWVjx2hn31otE0KaZkd1cIAhMoNhnGylzgAaY031wGAICcMadTfigMcVXneCZHVJE32qyrCXQepMTxoUCIkYurY1AUydRnNup1AbmKXzzXyR9a+lTiOf0TBfrTNPrmmDGtJ1iEMO+4B1Y96y6CYgLAArQ0R+VsavCBZI/nfMoGuPwGDBvk2lvcpF7zs3OsIdVbSUCa5P3f4ARvZ5EPKAZGqugxDmtrRrDc71OjvNAa/CqZDbZk5ZGGwJ46oVjfHUQugqZjhlWw71UdgKPZfMeAvf2Jp9xh3QavNO4FO
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR04MB4505.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(396003)(366004)(136003)(39860400002)(376002)(1800799009)(186009)(451199024)(316002)(41300700001)(66476007)(66556008)(66946007)(478600001)(6666004)(38100700002)(38350700002)(2906002)(36756003)(86362001)(7416002)(8676002)(4326008)(5660300002)(8936002)(2616005)(26005)(1076003)(6506007)(83380400001)(6486002)(52116002)(6512007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?FCMX3b6ofUV5O55iuX+6qxKF5joaJFHw3hySIOByF7cyH5ZVfUXJFDt/PJso?=
 =?us-ascii?Q?qUyiXUcuaHpc/RFBvmLPWm8COxT1BJfqobb+06LeVVRrsSscCkPc1tBwjcP3?=
 =?us-ascii?Q?aEYJYklauHs7aNCkoogs8H2ONz7WaWYwZD8bpt1uA7Zm27oxab2EogesuzVQ?=
 =?us-ascii?Q?RQn3Ckn5FPfIZzVr2156wD2fJZj5zaz3wQT5m2GnBFF/7CnUFLUMvBeHbGye?=
 =?us-ascii?Q?uGl3FO1CwGiuyr+M1O9QHP+F7BgulqA91LOu3SpBqptdj1hxPiclnZXeoQzf?=
 =?us-ascii?Q?W/0r8uM+dxXXbYwjLyUb+r+K+R8EjiebeL828QxVHpAYUG6h9vc3F9yQvmtu?=
 =?us-ascii?Q?BMwwOLWRaV6C/Qk1TqwRWX+voOwDjr/ZCXyMBaMt5ImsOl/BbElhQvlxzysy?=
 =?us-ascii?Q?SNMtba4FBNsvuj24/wMPrmlSBZRPDK8pxUvoqJU0N1qPIiI6rB0o+m3MqJP1?=
 =?us-ascii?Q?oLHeCLRWVv6ceVGE6iwaOB7YNcOPFwsu4QvoqVZjootMySHciZfBzWSQYqtI?=
 =?us-ascii?Q?nk/eCybd0bYv7cBT+tTWKsCkDs/+bYrQn4i3ehWtX7IRuRumyxOcELAF11+/?=
 =?us-ascii?Q?wroLjT77xOoYqI/aDDB5H5OfUEyLokXfD8/FuVqe4F9P3XWHLm8qm+F1bGjd?=
 =?us-ascii?Q?QRfdFUbKRIXh4OqqNz0zK+kateJgsshtNfNmDbzH+tGj+z/cOLm7WAJUPBQm?=
 =?us-ascii?Q?OdLdwCIQiDbGVDF/WW3KjAwLVguNVeOIbcY/WSbYAU/r/1p4uUyW/NVlekcy?=
 =?us-ascii?Q?XDxYewkX5CFJ+YyIxJluKgspbCn4J/IHZjzsf/qC5VlcmAJLVorQHW0JWS9A?=
 =?us-ascii?Q?ag15REVHJAMFw4SX5HNXCd8rjxKSem0dIqG6MDsQjjNYsTvzV8YT7hJTHjP6?=
 =?us-ascii?Q?daRkUeaEJ1zceR1ioBcgOPqfrc8AAtYMHBjcqZTfzhvcZ/uEUtif8SMXHJGX?=
 =?us-ascii?Q?BkReeLN++4E+i6603fIZ1XjKxtTBItWszib1GLoK937cGKqC89pmMHIC4kdL?=
 =?us-ascii?Q?xAwxd0OVOBVLUprLCMnS5hcUsCH0GtvFiR8J1IQ+IFL+zlm194s8rwu3mcQ1?=
 =?us-ascii?Q?3p2YU9h1uyLubRk7h69ZGoRNhHmwsN2+rUCvU41N2tSl4Wa1hZgVx+ENCuKU?=
 =?us-ascii?Q?kpjgsfHyU+Ugnu55ys98X8U7gYSz9rQMA/AC4YcVmIaaC37V//7syf6my9b/?=
 =?us-ascii?Q?GftJLcu/HGNzMI6RhH29PTavp2YSvQ16n8e6Zmu8tmpB2qRRDnwtWCgPTkZm?=
 =?us-ascii?Q?ugAUvPwYllNjJPyHmQAHQ6qJ+5Mrn2W7MRuLfhjiga3pj4VIsQIArtnE3H80?=
 =?us-ascii?Q?r0jecNevE7GfbnqZDb0JI9tcllX7o1dFNPvHYh8lS6IkFFGujSbptpqp9wSv?=
 =?us-ascii?Q?uOv8J1a/2snsMQVCnljjr7J+WvOUHHCR80bF5nKlU+CkM1H5fJ2wiVjkApfl?=
 =?us-ascii?Q?ZqpZbvpUHPQNQaY2OWzbfx1g5I0bMEG6Oota9jhpNe1W7nSLA9yzIoloY6Ic?=
 =?us-ascii?Q?lTdJYfewntDrvxILq1Uweb5UXxZjruSgG5Jc6sftpkT0lhSSH7vBCipVuVxI?=
 =?us-ascii?Q?Otfjx2LEKBHwOvYjBqENsIohiI5GYoH3Qw2fAmBY?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e8be107-d13c-4e25-b85a-08dbb9c285a1
X-MS-Exchange-CrossTenant-AuthSource: DB7PR04MB4505.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2023 10:15:32.1577
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W93bPVif5SdCQIdl4nvRSFyaijLzU2cTFJE3NBjPia23L7fkI+CDU9fnUyKGWLjV5lzeSLC8XYc5DRrz9k9vZw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8375
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Add explanation for DDR_CAP_AXI_ID_PORT_CHANNEL_FILTER quirk.

Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
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

