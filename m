Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB15ACE79B9
	for <linux-doc@archiver.kernel.org>; Wed, 20 Sep 2023 10:15:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233864AbjITKPu (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 20 Sep 2023 06:15:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234061AbjITKPt (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 20 Sep 2023 06:15:49 -0400
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (mail-vi1eur04on2043.outbound.protection.outlook.com [40.107.8.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 810DEB4;
        Wed, 20 Sep 2023 03:15:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P5UHckNcSPHCv0m5qhBvoo8JuKp1EzIRr5Ln6OPsuz4+C9+H8jVvw5VAnY9nH/a6fu2XkmsW/5o99AjjQBPZUfG0vS9h7vzQngKjXw2U9ZaOlAsTUFoXrpLaOy1T9Ksf28WXLuTEca3j/XoxBogZcmjuNJ6ibmw3YlLR49vL0sFbnMRaij93Xrjq3sW6vNeM0wRQvHTex/XVpqERBX6nyXDZ5kEwVvlBsRP5VLPi4FhPG2m8KEX5tNhZeb4DmQhDHblOSiHiLeXUM3BChvlA0UkfSqRTzB1/6qXgcYx5R/8bcWWDrAQJZdrJLt7IxT1lVMTYxJeN3m86CJScLsTaUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JYSDgQbBKi/Us7Jg1hEL9fyOf2JOfZtQS3dKgeph718=;
 b=RV+1RhUzh5mVabi/vNRDe7D7HTJCdhWg91DWcLbf9qk8lWhCl+7E7SNawI1APbP2WLsLfORB57DKMJZEr40abhpvIWf5HvveUlUKoiL0VOwr5u9Mqd6swkkUrLOjXyaX7cT8xftceb0CRlPkgJpRk1fbiQqc92Zyc/JEBiijxJVikOqHz/bIKvwFmYCh4pqhyxMDyuX7l0XaaB4PLggQyTVONa4SqVP5BOZr8LOySESV6Mw51iGKwZ2Fmp0grGrP+/Pj5M/LYW55bP8pWE+GuX4OGjjZ07wPS3hzDEVcZF9Z7wMgEGOc7cJhFLIOg9D8q0EoJ00dQksemF6AM2Rr/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JYSDgQbBKi/Us7Jg1hEL9fyOf2JOfZtQS3dKgeph718=;
 b=MxAOfC+nESVWM4qW8+afJdo+SxXV5V3ZOwuh8cYIARZW5nykDOstIrO8a6Gmbj14s6S9iEAydNlbAlwhIkC+0hXmcPyv7r0cYEHswaPj7I1vhCAy0WGMQeDwyWLvPGo0HuophIwPKgafezZl+/YdSSCpMwo7VG2LgnVyqkw7wDM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB7PR04MB4505.eurprd04.prod.outlook.com (2603:10a6:5:39::26) by
 PAXPR04MB8375.eurprd04.prod.outlook.com (2603:10a6:102:1be::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6792.27; Wed, 20 Sep 2023 10:15:42 +0000
Received: from DB7PR04MB4505.eurprd04.prod.outlook.com
 ([fe80::6444:e07a:e7f7:3923]) by DB7PR04MB4505.eurprd04.prod.outlook.com
 ([fe80::6444:e07a:e7f7:3923%7]) with mapi id 15.20.6792.026; Wed, 20 Sep 2023
 10:15:42 +0000
From:   Xu Yang <xu.yang_2@nxp.com>
To:     Frank.li@nxp.com, corbet@lwn.net, shawnguo@kernel.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de, will@kernel.org,
        mark.rutland@arm.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org
Cc:     festevam@gmail.com, conor+dt@kernel.org, linux-imx@nxp.com,
        linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
        devicetree@vger.kernel.org, xu.yang_2@nxp.com
Subject: [PATCH 4/5] perf: fsl_imx8_ddr: Add driver support for i.MX8DXL DDR Perf
Date:   Wed, 20 Sep 2023 18:20:03 +0800
Message-Id: <20230920102004.886599-4-xu.yang_2@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: 3ecd2322-ca67-425c-6c4d-08dbb9c28b65
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +7KQwtukRysz0V22rxz3swS0RkcJiqFvHs95E2iBOKHNsIE/Qk5xCat+zOgpTorTBE0jfVIHeybWEvypXgnvohEEwlE8J5g8Y8rTqQbEMx6m7vN0Ubw0O4PpsxNkVAg6hoTKdISli1g9BYuXki4b9fd+POmn2nzFPhx7cikLJBZjrN+c7mA3HLtdWaMeRESinU4aDdIHvMOe/ZswpACHYvoX+Pk7hd2FtDrwyUTw71mAFkjWoJV2ae08FHRhn8+/DkV0Rg5hG458VCNg9KY8//IgMKJajcS/jNYNvSWHOB7eugc3sr8wYwTdfInSNn4mVI7bDXFVRoA72Dd/31HqWcbFNsCMDUMhm8RHPLj4mWcscTQDVpV/I0lvwbzXeCDui8tTEQowyMqYrfthVAbhUcsGBqrpsFkhRF0vjr1o08EuOyHDPSknlOy3aNTaWMK1gLYMkJeyRpsJvtBxYOVRXNgQYqLnaqBKTLs3e5WyZM1brQBQ3SY4PsPrcBychlM3YRckxkYIlZugwCOKKKFop/gqxJSA3JwShYkJhXQqRVgo6sHIyAaC4UiBk+ud2FFhXzyubb/4i6SfFZzvFjXXfCKD0P/RQI253AadKUci6req7qBmQ6XXKoKz2wWVxaa9
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR04MB4505.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(396003)(366004)(136003)(39860400002)(376002)(1800799009)(186009)(451199024)(316002)(41300700001)(66476007)(66556008)(66946007)(478600001)(6666004)(38100700002)(38350700002)(2906002)(36756003)(86362001)(7416002)(8676002)(4326008)(5660300002)(8936002)(2616005)(26005)(1076003)(6506007)(6486002)(52116002)(6512007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?uw4ESK/7Zil6gjEExMk+uXX652ForQzAC9FhMNNJYhEwZI6z+BJYZ3XGEWYe?=
 =?us-ascii?Q?vMh9zI1ZBVK797U59JjQlKRy8bLBYOBbUDm0jZmg052PIIUAzXfcBUlMwOzl?=
 =?us-ascii?Q?SThSoAn3eH875A1PsY/K0NNo8VsrJ5GvlCbA2xh2OP27E7i5bVuXuMbPuKO7?=
 =?us-ascii?Q?AnJzdHK5mw/VZ3+WqQjE9nm9nEUpsVtTtBcLaumDTfVGWFfzrJuTLbqDMXdI?=
 =?us-ascii?Q?ongfE+FvGwOKiviNhr03hrLtlvnGc1268dr4uqwG1x1jg0FhftxYOy8GX3iu?=
 =?us-ascii?Q?a+fR8VMaT0ohzN6DqMbZVBZmlaVSoxpG8Twlnp4rwyy8Jjmwgo7kGI2NVeUc?=
 =?us-ascii?Q?+fJp/GpVhXE4SNKp63VgCs0tBHmndlV/NY9PkRbSLyil4zXTKjciOPTJz3LY?=
 =?us-ascii?Q?AipbmFksOAz5U4RV/UWl4dX7tLcQVcXBNNXNxr74/jSBCPGOWSytxJrq0Y9d?=
 =?us-ascii?Q?mD96ZKVDMFIrbn8wkndTLxVRMnnHjknGBpwuU5YQqDJEVQCatCVFR1P4vJgf?=
 =?us-ascii?Q?ehL42zyvRG0Q0B6kwk7ZfRE7Ic+qsRQvWPsiFtrr9hUE1T5BIeKPPPpTFHcI?=
 =?us-ascii?Q?DGiWniyuhanXcbxF6q9zrQViugakNogBA5t9Vrb/aa6Hdjl5iT6+ebjCoS/C?=
 =?us-ascii?Q?X8lcMnYPmAowcJ6PHl+FyLojXQN5ZhFg3Fq9XzV6d/I15tGdNJ48adtbB+ON?=
 =?us-ascii?Q?xWggjAnwZYbajvaUmBKpyH0Xfl6VR4j/HCsTpHf8oFX/289bC1SQH3G1PogY?=
 =?us-ascii?Q?y3/KI/IWbWy2y7Ip7Mb1vVQyF9pckzicl/d/etmv5NR+xx0eupXtvT0sIpAA?=
 =?us-ascii?Q?vb37dXBmF2FdK6Dgu1H6ZENAmN8u4nDLArETJ9HKRqKty6eIOfISrf44etrj?=
 =?us-ascii?Q?TTB94uhRqPGiISoT+ZGXJb6T+RoWb+ALG7sZfNu6Mvckv1Y6VF99XFrLshA+?=
 =?us-ascii?Q?oSVMW/5iwGaxjk2wAv8WkOCxtED7PTvc6WYOOeh0+yFi50xyeqAthEiuu1aO?=
 =?us-ascii?Q?Gx0Auo0P7jFgdxtW6s1DQN8miiUdXtl17M6/+idoNuA4bn7QHRs/yYc8o5sg?=
 =?us-ascii?Q?0PW2p2FJvStU0nWtz7f2u3gLsIwAtUUI/Gv3YqH8FgRfo7vqvlcV/CsXzhbb?=
 =?us-ascii?Q?bEvKTOv7ojt/3x0lV100AXwq1s0bfPS2V9NUZtF8wqFHldAvWdthDA83yrqm?=
 =?us-ascii?Q?+n1koRVWnLepIN8nFrfsQzNnq09Hu+hbWaNjUwA+54FUMJ6TlzPIm8WnhZm9?=
 =?us-ascii?Q?mkGnItJNZQPVEK0HLsVczUJqt1VIRfKdClEIBL3oVDw61cYflbdBOpkQxJg+?=
 =?us-ascii?Q?4NMNOzh/QjhhDFGCmoM2ibju6wt9Rqim/zt3I1twGk2UM9Xb15mJDYcmYDKh?=
 =?us-ascii?Q?irnauzDiYn/hVFY+gJPpea1X/COM+UFzVGAwWEizcAZzxsQRJ0p+BAI+H0XB?=
 =?us-ascii?Q?dHOFO/CN56kYRofT7WKOYZUwY53PmPhjR7MjhVpmFdwC57VQEia53UNDXxkf?=
 =?us-ascii?Q?Zp119wyXjKkN3OZtxnBYX95GGDViWOCNrFXDJ7hHjwJriJRWo4PuEoDkhZ2u?=
 =?us-ascii?Q?QuWT25Aal/0rKy8+sF24tS5Y8uGZgNKbdC0n3oBp?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ecd2322-ca67-425c-6c4d-08dbb9c28b65
X-MS-Exchange-CrossTenant-AuthSource: DB7PR04MB4505.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2023 10:15:42.0061
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VuCylGaCb0de+xKek4IYoOIjQr/F+/SWfyFKCJrc2MVPTFLVQJq8VUOHAlDZE9g2PW44fA9GZhig3wamVbw63A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8375
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Add driver support for i.MX8DXL DDR Perf, which supports AXI ID PORT
CHANNEL filter.

Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
---
 drivers/perf/fsl_imx8_ddr_perf.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/perf/fsl_imx8_ddr_perf.c b/drivers/perf/fsl_imx8_ddr_perf.c
index d0eae2d7e64b..7dbfaee372c7 100644
--- a/drivers/perf/fsl_imx8_ddr_perf.c
+++ b/drivers/perf/fsl_imx8_ddr_perf.c
@@ -92,6 +92,11 @@ static const struct fsl_ddr_devtype_data imx8mp_devtype_data = {
 	.identifier = "i.MX8MP",
 };
 
+static const struct fsl_ddr_devtype_data imx8dxl_devtype_data = {
+	.quirks = DDR_CAP_AXI_ID_PORT_CHANNEL_FILTER,
+	.identifier = "i.MX8DXL",
+};
+
 static const struct of_device_id imx_ddr_pmu_dt_ids[] = {
 	{ .compatible = "fsl,imx8-ddr-pmu", .data = &imx8_devtype_data},
 	{ .compatible = "fsl,imx8m-ddr-pmu", .data = &imx8m_devtype_data},
@@ -99,6 +104,7 @@ static const struct of_device_id imx_ddr_pmu_dt_ids[] = {
 	{ .compatible = "fsl,imx8mm-ddr-pmu", .data = &imx8mm_devtype_data},
 	{ .compatible = "fsl,imx8mn-ddr-pmu", .data = &imx8mn_devtype_data},
 	{ .compatible = "fsl,imx8mp-ddr-pmu", .data = &imx8mp_devtype_data},
+	{ .compatible = "fsl,imx8dxl-ddr-pmu", .data = &imx8dxl_devtype_data},
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, imx_ddr_pmu_dt_ids);
-- 
2.34.1

