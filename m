Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B34D7C41513
	for <linux-doc@archiver.kernel.org>; Wed, 16 Aug 2023 09:15:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243236AbjHPJO6 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 16 Aug 2023 05:14:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44640 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243241AbjHPJOu (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 16 Aug 2023 05:14:50 -0400
X-Greylist: delayed 1801 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Wed, 16 Aug 2023 02:14:48 PDT
Received: from mx08-00376f01.pphosted.com (mx08-00376f01.pphosted.com [91.207.212.86])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 106D81FC1
        for <linux-doc@vger.kernel.org>; Wed, 16 Aug 2023 02:14:47 -0700 (PDT)
Received: from pps.filterd (m0168888.ppops.net [127.0.0.1])
        by mx08-00376f01.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 37G702VC029544;
        Wed, 16 Aug 2023 09:28:24 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=
        from:to:cc:subject:date:message-id:content-transfer-encoding
        :content-type:mime-version; s=dk201812; bh=fTJxwLXDyppVkFOA4BNwF
        cD9q0OTGGU3WGvF74+tfh0=; b=SgmdsqaMra9T234PsLM0LfWGWPJPdN9KdklK3
        x9TiUI/ufgkdWXgMa3fxnuG/kl/0iUoG7pAsupJhTuKaBDFkDTZa1THli6nDkYXd
        OuQm1PK3q5ZG03Lox2j0O8OK+cg7rJPnyYnzTRi7nFKVSKpkQB0tAEAA2HbVIu20
        GUodVFjPFl7w70xW4c4Z+AJJv0E8gewSk4/YrDfcbcZdLsZtckfxZMZNK8BCn/Im
        FYiX/TnljKb24HdXHBS8nO17UtXvjf649MJH7OZmWJNI8kTYAhg7cd49/TjMNLfT
        OUuSt/+89KWx/chJDsCFtatPvR7aNstz7MDc8Sd0Vy3j7AzWw==
Received: from hhmail04.hh.imgtec.org ([217.156.249.195])
        by mx08-00376f01.pphosted.com (PPS) with ESMTPS id 3se0brawpn-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
        Wed, 16 Aug 2023 09:28:24 +0100 (BST)
Received: from HHMAIL05.hh.imgtec.org (10.100.10.120) by
 HHMAIL04.hh.imgtec.org (10.100.10.119) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 16 Aug 2023 09:28:23 +0100
Received: from GBR01-LO2-obe.outbound.protection.outlook.com (104.47.21.54) by
 email.imgtec.com (10.100.10.121) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27 via Frontend
 Transport; Wed, 16 Aug 2023 09:28:23 +0100
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SMvk48Q83eo0+qAOxrDegUB1AhfZ/FBFKO1IOmJRBC5bqD8MtuMU5p9UMt03aTnQy9bo2CQH+wsM+678aoWyX6G9Up55DsKlwrDzMXcCUbTOcNdxBNk0Yi4DM1kNHabIX9Tz/D7CU+lr92J+ruiMqatquseRHyr3U1wlmWUDmT3VsXKGD3M/gnuynPsw4K2znf5EyHRajmZwoiXba81wuN/u4V+3WXDVGDACviaJOIiTp9zhk9Q2wP5ZUIwVxXH1XqjUN0AabcxDPUB9aUcIc96PuUnk7b98+o/nONVQ2O59Eh1LF2AvY4+/nXbJSPyRHkdOeX9FkavhPpXtGceEqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fTJxwLXDyppVkFOA4BNwFcD9q0OTGGU3WGvF74+tfh0=;
 b=nXQTbRRVRrZs4WFDriZ6y0mpyBjpGpHMuypZnx84l5Y4OY2vvEG+HMuuBWqgWf16UEmfDRVroqA/EcKvBHBbZl3rg/U7IdiIUjADYXmIxF3xnTsxe4fOViQSPNl86acuTPPzz5r6q4/TvBFyyeIo5IkkzWAGIs/8IfzlBWRHuLEObmqnEVeOU/gLWMjuxiV2PnlBzE7pL2Fy6EX9VHu7CtZLHeDbdOTOUfwOL34Y3M+2iFLpzfNBC+0DxPLkKJRBXrOYPN9o9x/dVbMV8ch3Wnn8u/BQ6uGMNOpKrR3kzxfPUfgIVk9hTRi8v0v8GClt4Fw7SOU5HCgnVFKIqBNjrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fTJxwLXDyppVkFOA4BNwFcD9q0OTGGU3WGvF74+tfh0=;
 b=Tzf/BdynbkK0NM6VDBbSqD2oUtAyijEpodFS5sCU14qc4jtuFwUpXBGd9qhPo1zJ7WGaOsmVaU35o4yNHnMergxpIGy9sTqzyaRJPNNSV3mQrbzxeBwQ85PljRnk5LxRHg8TYNGyoBWMohxcMYK2Pl/GOYmLTT9sj/QpqEtbB6s=
Received: from CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:170::9)
 by LO4P265MB7032.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:34f::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.29; Wed, 16 Aug
 2023 08:28:21 +0000
Received: from CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM
 ([fe80::ee4f:2d71:fe8a:ffdf]) by CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM
 ([fe80::ee4f:2d71:fe8a:ffdf%7]) with mapi id 15.20.6678.022; Wed, 16 Aug 2023
 08:28:21 +0000
From:   Sarah Walker <sarah.walker@imgtec.com>
To:     <linux-doc@vger.kernel.org>
CC:     <corbet@lwn.net>, Matt Coster <matt.coster@imgtec.com>,
        Donald Robson <donald.robson@imgtec.com>,
        Maxime Ripard <mripard@kernel.org>
Subject: [PATCH v5 16/17] drm/imagination: Add driver documentation
Date:   Wed, 16 Aug 2023 09:28:06 +0100
Message-Id: <20230816082806.164968-1-sarah.walker@imgtec.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0692.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:37b::15) To CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:400:170::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CWLP265MB4817:EE_|LO4P265MB7032:EE_
X-MS-Office365-Filtering-Correlation-Id: e434edc1-8be8-44d6-c0d7-08db9e32c008
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kuZ1+J7o2uu9EmCXhvGnAXO/RRAWiO/LiHMY227vGGd2PawRmauP2hy8px2WrGyfpQlfNqaZ7iyDhP5CN3aL0PkljwfQD3w6oS+B80Ip/eK5koQrAjBA+y9hdDDPsUycLDDogwpMrbsOh+brm5XKInY6iAOICwOJ9oCqap3GTAJcdmFUJ6WKMQSx7DSGZeJtJ2xOTiFdo/YpEt0yvis8Yp2F6lEURFN9KHEcUqXGAivasnaFTvTcCGuSzIHY14TcIKAwSCzyrjcWQi+ICmL+8aX+/0wq9Pv9V1c54SfexuOYI7iPcS53H6O73AymyXJDPQ0XXZepd9/yc289hmcnmBmCw4fBFzFqIsOr6z/lSoucc61ONiaTJ4DP1Mw8FqNLpMFhtLXG4lDOyDVyzZj9kZ9tD3/rpdSteTlnXd4AkIPaf/16xOqBbDsOyQV746Z7sCx1J1u9RKqJfXkoVR0Oe4/lLCCgmabA/QvkSfOI9d8nJy8GJ3KYiHsbDWOY08Ea52/lVQ/TacxfNLIPKnpa0r58kS9//Hh1Jeu9CysfZvR6rfEJCTlCErkp3I53YHZCtw9JEACS+vzJiv1jcClxfq7NJvc9I03kqiSawRE3QkaFqOEhxe7na5qL2HKdz8bV
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(346002)(366004)(396003)(136003)(376002)(39850400004)(1800799009)(451199024)(186009)(2906002)(83380400001)(30864003)(86362001)(478600001)(36756003)(2616005)(6486002)(6506007)(6666004)(1076003)(52116002)(6512007)(26005)(5660300002)(44832011)(41300700001)(6916009)(316002)(54906003)(66946007)(66556008)(66476007)(4326008)(8676002)(8936002)(38100700002)(38350700002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?U9Qe2bsV6YQF1dK7av/Opio/afcneu/cj1mNEeaes7U7tlD3diKI0EiKpLVG?=
 =?us-ascii?Q?jSD+pGBzte5f+aVkXsnZ+3y8iP7meTkFOlSpNImVOHcIC4bdRGq8tDXMBIPu?=
 =?us-ascii?Q?un61hQi44Hg3ojBhKxw5oawpQZFaLy5PQU6qOYgE/2xy/5mzl2ibEUi4aWw3?=
 =?us-ascii?Q?Atb6TM6yD5lNc9zj+2qeBZDOHzqvgjT1yQOzJtlP4jP8uC5X6a8KxVvOYz+0?=
 =?us-ascii?Q?rT9m6dsVNqWgubv/r9UKgcRBKf56zneilZmqAdF5x5rkVe2WKoyAIxVuGmlj?=
 =?us-ascii?Q?yzZhNvGHyXGmKLU2uv3WsT6nzYM1tI2VAWiQ9cfcNxg0tomoDPvC2XD/Cp6Z?=
 =?us-ascii?Q?Cg6Xkes1Y9XbNoJ0UOBg/5KUS5A8xakCzho7qhjYt4SWwgHpx2zfY+nhz5E+?=
 =?us-ascii?Q?m45jH+Eh6HxXRciomf/K/PTxLymY8klbZyi6j2Fg9dciH1SKZbMMCDUpMI2Q?=
 =?us-ascii?Q?y6oui+6W5X85qWSJxCLDvJfMtwZcOrgqc4U4YXqsuDBo3KyNYg0xwN5wAp09?=
 =?us-ascii?Q?eVy9YuJT+19Ecrlvxl9m6UAYTRCsGJN4NQ56JykA2uRe5NTvkyBZI2Jx7jnj?=
 =?us-ascii?Q?IbasJ6sZTKr7ImWXNlreyEHiyIGpQoeMxZFNtrEhuxOSd+weW7OUa3S1eW52?=
 =?us-ascii?Q?A+ff/a1CsQDHsMs6q+IUwLBiWYwKLq2O2mbtz1NxWDHSa2hUO8KvWTDW5k3S?=
 =?us-ascii?Q?fk2+bSOuPA8muFHjXMbVuRyKAhRAMtMp8j2gp+ySdgqQoVvmhOovb7WOd+gD?=
 =?us-ascii?Q?vZouFm/j6NoRICqN6us0NY6gFfcsfG1tNxg7FHi8sxrt7k87Gbo7nEPKHxfL?=
 =?us-ascii?Q?tADJ11/QUy1eS3hxv2Beys9B6oF4YA88cf/xv725rcPRRZDRFf6MpJAuN1rg?=
 =?us-ascii?Q?2WwHD6MJ1b07YsfFplF4dn2BX3ZlTpM7FTV13uX8kz8GrnjzhvzHkne/6MLY?=
 =?us-ascii?Q?ygPsHSn97+wP1saG3t0y4i5Q6ylUG0IFTkpaIAhIe+ktyn7gpJMQdjG3Vnh0?=
 =?us-ascii?Q?bV4UF4Tp765Kk1ulwT07AGST6kEtcZUrlpx+F8Rc1QxUdW/9oR542O24QHIW?=
 =?us-ascii?Q?bzIbPFscL6LK3x2+Xac2TxiAm/XUBGZOXd8elIYsbgDu3ZU7T2rQ3+MMwsGW?=
 =?us-ascii?Q?2DZ5dXCGuaQMXqrgYvgyn+MOBFpaM82aV6w3ymIRMVA7VSQ1M64+FpUFeY/i?=
 =?us-ascii?Q?slHH1MwOLKvddUe1M4aRuT0RFybprxZyYb9lthteRgV80Zcz2/gLw70f3bXi?=
 =?us-ascii?Q?MMNwlkIljFwVqu9D5Af29LXNFJ9j/uBYh8ZhdrbzoSLiqQjeN+CvzGjI255L?=
 =?us-ascii?Q?YgPmWMbJs7ZWT1OIk2jDdaKqdIh4JT9laC8+0hTieJKv4kAawOSUNBNUbjVP?=
 =?us-ascii?Q?4EyASbY9iczZUom+znzmeY5QwWo89Eo6aPe/5NHjJNyJ4DLG7vhYkIZKOmOc?=
 =?us-ascii?Q?zNVdNIeZ3HP6rAs47T3qgB9raC2Wccho3ByVVTsuBR8K9r5ZfzOTxPZMB3yN?=
 =?us-ascii?Q?IQgOEWh+p6i04LJtcXyo6egahse2YUitXZWNrMgByfid93tcUymebu+qeha6?=
 =?us-ascii?Q?slo6BbHX/TAOagF8f8PR9KGE60XxrPGePNJCV6Q/7tENXnat7v+QHEJBcHbo?=
 =?us-ascii?Q?Mw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e434edc1-8be8-44d6-c0d7-08db9e32c008
X-MS-Exchange-CrossTenant-AuthSource: CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2023 08:28:21.1876
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OGNWsHdgGRzxBWNItEt2PL3kGUNNiRFSG07MjBxYys08lOzAOoqKSv812kpyX4aLMDQIVQNHv8rV8BXJUPMqVg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO4P265MB7032
X-OriginatorOrg: imgtec.com
X-EXCLAIMER-MD-CONFIG: 15a78312-3e47-46eb-9010-2e54d84a9631
X-Proofpoint-ORIG-GUID: 1aS7fRcmVThYO6YG2LIxZdYlwAZFQijH
X-Proofpoint-GUID: 1aS7fRcmVThYO6YG2LIxZdYlwAZFQijH
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Add documentation for the UAPI and for the virtual memory design.

Co-developed-by: Matt Coster <matt.coster@imgtec.com>
Signed-off-by: Matt Coster <matt.coster@imgtec.com>
Co-developed-by: Donald Robson <donald.robson@imgtec.com>
Signed-off-by: Donald Robson <donald.robson@imgtec.com>
Signed-off-by: Sarah Walker <sarah.walker@imgtec.com>
Reviewed-by: Maxime Ripard <mripard@kernel.org>
---
 Documentation/gpu/drivers.rst                 |   2 +
 Documentation/gpu/imagination/index.rst       |  14 +
 Documentation/gpu/imagination/uapi.rst        | 174 +++++++
 .../gpu/imagination/virtual_memory.rst        | 462 ++++++++++++++++++
 MAINTAINERS                                   |   1 +
 5 files changed, 653 insertions(+)
 create mode 100644 Documentation/gpu/imagination/index.rst
 create mode 100644 Documentation/gpu/imagination/uapi.rst
 create mode 100644 Documentation/gpu/imagination/virtual_memory.rst

diff --git a/Documentation/gpu/drivers.rst b/Documentation/gpu/drivers.rst
index 3a52f48215a3..5487deb218a3 100644
--- a/Documentation/gpu/drivers.rst
+++ b/Documentation/gpu/drivers.rst
@@ -3,9 +3,11 @@ GPU Driver Documentation
 ========================
 
 .. toctree::
+   :maxdepth: 3
 
    amdgpu/index
    i915
+   imagination/index
    mcde
    meson
    pl111
diff --git a/Documentation/gpu/imagination/index.rst b/Documentation/gpu/imagination/index.rst
new file mode 100644
index 000000000000..57f28e460a03
--- /dev/null
+++ b/Documentation/gpu/imagination/index.rst
@@ -0,0 +1,14 @@
+=======================================
+drm/imagination PowerVR Graphics Driver
+=======================================
+
+.. kernel-doc:: drivers/gpu/drm/imagination/pvr_drv.c
+   :doc: PowerVR Graphics Driver
+
+Contents
+========
+.. toctree::
+   :maxdepth: 2
+
+   uapi
+   virtual_memory
diff --git a/Documentation/gpu/imagination/uapi.rst b/Documentation/gpu/imagination/uapi.rst
new file mode 100644
index 000000000000..2227ea7e6222
--- /dev/null
+++ b/Documentation/gpu/imagination/uapi.rst
@@ -0,0 +1,174 @@
+====
+UAPI
+====
+The sources associated with this section can be found in ``pvr_drm.h``.
+
+.. kernel-doc:: include/uapi/drm/pvr_drm.h
+   :doc: PowerVR UAPI
+
+OBJECT ARRAYS
+=============
+.. kernel-doc:: include/uapi/drm/pvr_drm.h
+   :identifiers: drm_pvr_obj_array
+
+.. kernel-doc:: include/uapi/drm/pvr_drm.h
+   :identifiers: DRM_PVR_OBJ_ARRAY
+
+IOCTLS
+======
+.. kernel-doc:: include/uapi/drm/pvr_drm.h
+   :doc: PowerVR IOCTL interface
+
+.. kernel-doc:: include/uapi/drm/pvr_drm.h
+   :identifiers: PVR_IOCTL
+
+DEV_QUERY
+---------
+.. kernel-doc:: include/uapi/drm/pvr_drm.h
+   :doc: PowerVR IOCTL DEV_QUERY interface
+
+.. kernel-doc:: include/uapi/drm/pvr_drm.h
+   :identifiers: drm_pvr_dev_query
+
+.. kernel-doc:: include/uapi/drm/pvr_drm.h
+   :identifiers: drm_pvr_ioctl_dev_query_args
+
+.. kernel-doc:: include/uapi/drm/pvr_drm.h
+   :identifiers: drm_pvr_dev_query_gpu_info
+                 drm_pvr_dev_query_runtime_info
+                 drm_pvr_dev_query_hwrt_info
+                 drm_pvr_dev_query_quirks
+                 drm_pvr_dev_query_enhancements
+
+.. kernel-doc:: include/uapi/drm/pvr_drm.h
+   :identifiers: drm_pvr_heap_id
+                 drm_pvr_heap
+                 drm_pvr_dev_query_heap_info
+
+.. kernel-doc:: include/uapi/drm/pvr_drm.h
+   :doc: Flags for DRM_PVR_DEV_QUERY_HEAP_INFO_GET.
+
+.. kernel-doc:: include/uapi/drm/pvr_drm.h
+   :identifiers: drm_pvr_static_data_area_usage
+                 drm_pvr_static_data_area
+                 drm_pvr_dev_query_static_data_areas
+
+CREATE_BO
+---------
+.. kernel-doc:: include/uapi/drm/pvr_drm.h
+   :doc: PowerVR IOCTL CREATE_BO interface
+
+.. kernel-doc:: include/uapi/drm/pvr_drm.h
+   :identifiers: drm_pvr_ioctl_create_bo_args
+
+.. kernel-doc:: include/uapi/drm/pvr_drm.h
+   :doc: Flags for CREATE_BO
+
+GET_BO_MMAP_OFFSET
+------------------
+.. kernel-doc:: include/uapi/drm/pvr_drm.h
+   :doc: PowerVR IOCTL GET_BO_MMAP_OFFSET interface
+
+.. kernel-doc:: include/uapi/drm/pvr_drm.h
+   :identifiers: drm_pvr_ioctl_get_bo_mmap_offset_args
+
+CREATE_VM_CONTEXT and DESTROY_VM_CONTEXT
+----------------------------------------
+.. kernel-doc:: include/uapi/drm/pvr_drm.h
+   :doc: PowerVR IOCTL CREATE_VM_CONTEXT and DESTROY_VM_CONTEXT interfaces
+
+.. kernel-doc:: include/uapi/drm/pvr_drm.h
+   :identifiers: drm_pvr_ioctl_create_vm_context_args
+                 drm_pvr_ioctl_destroy_vm_context_args
+
+VM_MAP and VM_UNMAP
+-------------------
+.. kernel-doc:: include/uapi/drm/pvr_drm.h
+   :doc: PowerVR IOCTL VM_MAP and VM_UNMAP interfaces
+
+.. kernel-doc:: include/uapi/drm/pvr_drm.h
+   :identifiers: drm_pvr_ioctl_vm_map_args
+                 drm_pvr_ioctl_vm_unmap_args
+
+CREATE_CONTEXT and DESTROY_CONTEXT
+----------------------------------
+.. kernel-doc:: include/uapi/drm/pvr_drm.h
+   :doc: PowerVR IOCTL CREATE_CONTEXT and DESTROY_CONTEXT interfaces
+
+.. kernel-doc:: include/uapi/drm/pvr_drm.h
+   :identifiers: drm_pvr_ioctl_create_context_args
+
+.. kernel-doc:: include/uapi/drm/pvr_drm.h
+   :identifiers: drm_pvr_ctx_priority
+                 drm_pvr_ctx_type
+                 drm_pvr_static_render_context_state
+                 drm_pvr_static_render_context_state_format
+                 drm_pvr_reset_framework
+                 drm_pvr_reset_framework_format
+
+.. kernel-doc:: include/uapi/drm/pvr_drm.h
+   :identifiers: drm_pvr_ioctl_destroy_context_args
+
+CREATE_FREE_LIST and DESTROY_FREE_LIST
+--------------------------------------
+.. kernel-doc:: include/uapi/drm/pvr_drm.h
+   :doc: PowerVR IOCTL CREATE_FREE_LIST and DESTROY_FREE_LIST interfaces
+
+.. kernel-doc:: include/uapi/drm/pvr_drm.h
+   :identifiers: drm_pvr_ioctl_create_free_list_args
+
+.. kernel-doc:: include/uapi/drm/pvr_drm.h
+   :identifiers: drm_pvr_ioctl_destroy_free_list_args
+
+CREATE_HWRT_DATASET and DESTROY_HWRT_DATASET
+--------------------------------------
+.. kernel-doc:: include/uapi/drm/pvr_drm.h
+   :doc: PowerVR IOCTL CREATE_HWRT_DATASET and DESTROY_HWRT_DATASET interfaces
+
+.. kernel-doc:: include/uapi/drm/pvr_drm.h
+   :identifiers: drm_pvr_ioctl_create_hwrt_dataset_args
+
+.. kernel-doc:: include/uapi/drm/pvr_drm.h
+   :identifiers: drm_pvr_create_hwrt_geom_data_args
+                 drm_pvr_create_hwrt_rt_data_args
+
+.. kernel-doc:: include/uapi/drm/pvr_drm.h
+   :identifiers: drm_pvr_ioctl_destroy_hwrt_dataset_args
+
+SUBMIT_JOBS
+-----------
+.. kernel-doc:: include/uapi/drm/pvr_drm.h
+   :doc: PowerVR IOCTL SUBMIT_JOBS interface
+
+.. kernel-doc:: include/uapi/drm/pvr_drm.h
+   :doc: Flags for the drm_pvr_sync_op object.
+
+.. kernel-doc:: include/uapi/drm/pvr_drm.h
+   :identifiers: drm_pvr_ioctl_submit_jobs_args
+
+.. kernel-doc:: include/uapi/drm/pvr_drm.h
+   :doc: Flags for SUBMIT_JOB ioctl geometry command.
+
+.. kernel-doc:: include/uapi/drm/pvr_drm.h
+   :doc: Flags for SUBMIT_JOB ioctl fragment command.
+
+.. kernel-doc:: include/uapi/drm/pvr_drm.h
+   :doc: Flags for SUBMIT_JOB ioctl compute command.
+
+.. kernel-doc:: include/uapi/drm/pvr_drm.h
+   :doc: Flags for SUBMIT_JOB ioctl transfer command.
+
+.. kernel-doc:: include/uapi/drm/pvr_drm.h
+   :identifiers: drm_pvr_sync_op
+                 drm_pvr_job_type
+                 drm_pvr_hwrt_data_ref
+                 drm_pvr_job
+
+Internal notes
+==============
+.. kernel-doc:: drivers/gpu/drm/imagination/pvr_device.h
+   :doc: IOCTL validation helpers
+
+.. kernel-doc:: drivers/gpu/drm/imagination/pvr_device.h
+   :identifiers: PVR_STATIC_ASSERT_64BIT_ALIGNED PVR_IOCTL_UNION_PADDING_CHECK
+                 pvr_ioctl_union_padding_check
diff --git a/Documentation/gpu/imagination/virtual_memory.rst b/Documentation/gpu/imagination/virtual_memory.rst
new file mode 100644
index 000000000000..aab58e12a24e
--- /dev/null
+++ b/Documentation/gpu/imagination/virtual_memory.rst
@@ -0,0 +1,462 @@
+===========================
+GPU Virtual Memory Handling
+===========================
+The sources associated with this section can be found in ``pvr_vm.c`` and
+``pvr_vm.h``.
+
+There's a lot going on in this section, so it's broken down into several parts;
+beginning with the public-facing API surface.
+
+.. admonition:: Note on page table naming
+
+   This file uses a different naming convention for page table levels than the
+   generated hardware defs. Since page table implementation details are not
+   exposed outside this file, the description of the name mapping exists here
+   in its normative form:
+
+   * Level 0 page table => Page table
+   * Level 1 page table => Page directory
+   * Level 2 page table => Page catalog
+
+   The variable/function naming convention in this file is ``page_table_lx_*``
+   where x is either ``0``, ``1`` or ``2`` to represent the level of the page
+   table structure. The name ``page_table_*`` without the ``_lx`` suffix is
+   used for references to the entire tree structure including all three levels,
+   or an operation or value which is level-agnostic.
+
+.. contents::
+   :local:
+   :depth: 1
+
+
+Public API
+==========
+The public-facing API of our virtual memory management is exposed as a
+collection of functions associated with an opaque handle type.
+
+The opaque handle is :c:type:`pvr_vm_context`. This holds a "global state",
+including a complete page table tree structure. You do not need to consider
+this internal structure (or anything else in :c:type:`pvr_vm_context`) when
+using this API; it is designed to operate as a black box.
+
+Usage
+-----
+Begin by calling :c:func:`pvr_vm_create_context` to obtain a VM context. It is
+bound to a PowerVR device (:c:type:`pvr_device`) and holds a reference to it.
+This binding is immutable.
+
+Once you're finished with a VM context, call :c:func:`pvr_vm_destroy_context`
+to release it. This should be done before freeing or otherwise releasing the
+PowerVR device to which the VM context is bound.
+
+It is an error to destroy a VM context which has already been destroyed. If a
+VM context still contains valid memory mappings at the point it is destroyed,
+these will be unmapped, and (optionally) warnings will be printed.
+
+Functions
+---------
+* :c:func:`pvr_vm_create_context`
+* :c:func:`pvr_vm_destroy_context`
+* :c:func:`pvr_vm_map`
+* :c:func:`pvr_vm_map_partial`
+* :c:func:`pvr_vm_unmap`
+
+Helper functions
+----------------
+* :c:func:`pvr_device_addr_is_valid`
+* :c:func:`pvr_device_addr_and_size_are_valid`
+* :c:func:`pvr_vm_get_root_page_table_addr`
+
+Constants
+---------
+* :c:macro:`PVR_VM_BACKING_PAGE_SIZE`
+
+
+Memory mappings
+===============
+Physical memory is exposed to the device via **mappings**. Mappings may never
+overlap, although any given region of physical memory may be referenced by
+multiple mappings.
+
+Use :c:func:`pvr_vm_map` to create a mapping, providing a
+:c:type:`pvr_gem_object` holding the physical memory to be mapped. The physical
+memory behind the object (or each "section" if it's not contiguous) must be
+device page-aligned. This restriction is checked by :c:func:`pvr_vm_map`, which
+returns -``EINVAL`` if the check fails.
+
+If only part of the :c:type:`pvr_gem_object` must be mapped, use
+:c:func:`pvr_vm_map_partial` instead. In addition to the parameters accepted by
+:c:func:`pvr_vm_map`, this also takes an offset into the object and the size of
+the mapping to be created. The restrictions regarding alignment on
+:c:func:`pvr_vm_map` also apply here, with the exception that only the region
+of the object within the bounds specified by the offset and size must satisfy
+them. These are checked by :c:func:`pvr_vm_map_partial`, along with the offset
+and size values to ensure that the region they specify falls entirely within
+the bounds of the provided object.
+
+Both of these mapping functions call :c:func:`pvr_gem_object_get` to ensure the
+underlying physical memory is not freed until *after* the mapping is released.
+
+Although :c:func:`pvr_vm_map_partial` could technically always be used in place
+of :c:func:`pvr_vm_map`, the latter should be preferred when possible since it
+is a more efficient operation.
+
+Mappings are tracked internally so that it is theoretically impossible to
+accidentally create overlapping mappings. No handle is returned after a
+mapping operation succeeds; callers should instead use the start device
+virtual address of the mapping as its handle.
+
+When mapped memory is no longer required by the device, it should be
+unmapped using :c:func:`pvr_vm_unmap`. In addition to making the memory
+inaccessible to the device, this will call :c:func:`pvr_gem_object_put` to
+release the underlying physical memory. If the mapping held the last reference,
+the physical memory will automatically be freed. Attempting to unmap an invalid
+mapping (or one that has already been unmapped) will result in an -``ENOENT``
+error.
+
+Types
+-----
+* :c:type:`pvr_vm_mapping`
+
+Functions
+---------
+* :c:func:`pvr_vm_mapping_init_partial`
+* :c:func:`pvr_vm_mapping_init`
+* :c:func:`pvr_vm_mapping_fini`
+* :c:func:`pvr_vm_mapping_map`
+* :c:func:`pvr_vm_mapping_unmap`
+* :c:func:`pvr_vm_mapping_page_flags_raw`
+
+Constants
+---------
+* :c:macro:`PVR_VM_MAPPING_COMPLETE`
+
+
+VM backing pages
+================
+While the page tables hold memory accessible to the rest of the driver, the
+page tables themselves must have memory allocated to back them. We call this
+memory "VM backing pages". Conveniently, each page table is (currently) exactly
+4KiB, as defined by ``PVR_VM_BACKING_PAGE_SIZE``. We currently support any CPU
+page size of this size or greater.
+
+Usage
+-----
+To add this functionality to a structure which wraps a raw page table, embed
+an instance of :c:type:`pvr_vm_backing_page` in the wrapper struct. Call
+:c:func:`pvr_vm_backing_page_init` to allocate and map the backing page, and
+:c:func:`pvr_vm_backing_page_fini` to perform the reverse operations when
+you're finished with it. Use :c:func:`pvr_vm_backing_page_sync` to flush the
+memory from the host to the device. As this is an expensive operation (calling
+out to :c:func:`dma_sync_single_for_device`), be sure to perform all necessary
+changes to the backing memory before calling it.
+
+Between calls to :c:func:`pvr_vm_backing_page_init` and
+:c:func:`pvr_vm_backing_page_fini`, the public fields of
+:c:type:`pvr_vm_backing_page` can be used to access the allocated page. To
+access the memory from the CPU, use :c:member:`pvr_vm_backing_page.host_ptr`.
+For an address which can be passed to the device, use
+:c:member:`pvr_vm_backing_page.dma_addr`.
+
+It is expected that the embedded :c:type:`pvr_vm_backing_page` will be zeroed
+before calling :c:func:`pvr_vm_backing_page_init`. In return,
+:c:func:`pvr_vm_backing_page_fini` will re-zero it before returning. You can
+therefore compare the value of either :c:member:`pvr_vm_backing_page.dma_addr`
+or :c:member:`pvr_vm_backing_page.host_ptr` to zero or ``NULL`` to check if the
+backing page is ready for use.
+
+.. note:: This API is not expected to be exposed outside ``pvr_vm.c``.
+
+Types
+-----
+* :c:type:`pvr_vm_backing_page`
+
+Functions
+---------
+* :c:func:`pvr_vm_backing_page_init`
+* :c:func:`pvr_vm_backing_page_fini`
+* :c:func:`pvr_vm_backing_page_sync`
+
+Constants
+---------
+* :c:macro:`PVR_VM_BACKING_PAGE_SIZE`
+
+
+Raw page tables
+===============
+These types define the lowest level representation of the page table structure.
+This is the format which a PowerVR device's MMU can interpret directly. As
+such, their definitions are taken directly from hardware documentation.
+
+To store additional information required by the driver, we use
+`mirror page tables`_. In most cases, the mirror types are the ones you want to
+use for handles.
+
+Types
+-----
+* :c:type:`pvr_page_table_l2_entry_raw`
+* :c:type:`pvr_page_table_l1_entry_raw`
+* :c:type:`pvr_page_table_l0_entry_raw`
+* :c:type:`pvr_page_table_l2_raw`
+* :c:type:`pvr_page_table_l1_raw`
+* :c:type:`pvr_page_table_l0_raw`
+
+Functions
+---------
+* :c:func:`pvr_page_table_l2_entry_raw_is_valid`
+* :c:func:`pvr_page_table_l2_entry_raw_set`
+* :c:func:`pvr_page_table_l2_entry_raw_clear`
+* :c:func:`pvr_page_table_l1_entry_raw_is_valid`
+* :c:func:`pvr_page_table_l1_entry_raw_set`
+* :c:func:`pvr_page_table_l1_entry_raw_clear`
+* :c:func:`pvr_page_table_l0_entry_raw_is_valid`
+* :c:func:`pvr_page_table_l0_entry_raw_set`
+* :c:func:`pvr_page_table_l0_entry_raw_clear`
+
+
+Mirror page tables
+==================
+These structures hold additional information required by the driver that cannot
+be stored in `raw page tables`_ (since those are defined by the hardware).
+
+In most cases, you should hold a handle to these types instead of the raw types
+directly.
+
+Types
+-----
+* :c:type:`pvr_page_table_l2`
+* :c:type:`pvr_page_table_l1`
+* :c:type:`pvr_page_table_l0`
+
+Functions
+---------
+* :c:func:`pvr_page_table_l2_init`
+* :c:func:`pvr_page_table_l2_fini`
+* :c:func:`pvr_page_table_l2_sync`
+* :c:func:`pvr_page_table_l2_get_raw`
+* :c:func:`pvr_page_table_l2_get_entry_raw`
+* :c:func:`pvr_page_table_l2_insert`
+* :c:func:`pvr_page_table_l2_remove`
+* :c:func:`pvr_page_table_l1_init`
+* :c:func:`pvr_page_table_l1_fini`
+* :c:func:`pvr_page_table_l1_sync`
+* :c:func:`pvr_page_table_l1_get_raw`
+* :c:func:`pvr_page_table_l1_get_entry_raw`
+* :c:func:`pvr_page_table_l1_insert`
+* :c:func:`pvr_page_table_l1_remove`
+* :c:func:`pvr_page_table_l0_init`
+* :c:func:`pvr_page_table_l0_fini`
+* :c:func:`pvr_page_table_l0_sync`
+* :c:func:`pvr_page_table_l0_get_raw`
+* :c:func:`pvr_page_table_l0_get_entry_raw`
+* :c:func:`pvr_page_table_l0_insert`
+* :c:func:`pvr_page_table_l0_remove`
+
+
+Page table index utilities
+==========================
+These utilities are not tied to the raw or mirror page tables since they
+operate only on device-virtual addresses which are identical between the two
+structures.
+
+Functions
+---------
+* :c:func:`pvr_page_table_l2_idx`
+* :c:func:`pvr_page_table_l1_idx`
+* :c:func:`pvr_page_table_l0_idx`
+
+Constants
+---------
+* :c:macro:`PVR_PAGE_TABLE_ADDR_SPACE_SIZE`
+* :c:macro:`PVR_PAGE_TABLE_ADDR_BITS`
+* :c:macro:`PVR_PAGE_TABLE_ADDR_MASK`
+
+
+High-level page table operations
+================================
+We designate any functions which operate on our wrappers for page tables as
+"high-level".
+
+.. note::
+
+    This section contains functions prefixed with ``__`` that should never be
+    called directly, even internally.
+
+The two primary functions in this section are consumed by the page table
+pointer operations; that API is the expected method of performing operations
+on the page table tree structure
+
+The ``__`` functions noted previously are triggered when the refcount
+(implemented as the number of valid entries in the target page table) reaches
+zero.
+
+Functions
+---------
+* :c:func:`pvr_page_table_l1_get_or_create`
+* :c:func:`pvr_page_table_l0_get_or_create`
+
+Internal functions
+------------------
+* :c:func:`pvr_page_table_l1_create_unchecked`
+* :c:func:`__pvr_page_table_l1_destroy`
+* :c:func:`pvr_page_table_l0_create_unchecked`
+* :c:func:`__pvr_page_table_l0_destroy`
+
+
+Page table pointer
+==================
+Traversing the page table tree structure is not a straightforward operation
+since there are multiple layers, each with different properties. To contain and
+attempt to reduce this complexity, it's mostly encompassed in a "heavy pointer"
+type (:c:type:`pvr_page_table_ptr`) and its associated functions.
+
+Usage
+-----
+To start using a :c:type:`pvr_page_table_ptr` instance (a "pointer"), you must
+first initialize it to the starting address of your traversal using
+:c:func:`pvr_page_table_ptr_init`. Once finished, destroy it with
+:c:func:`pvr_page_table_ptr_fini`.
+
+You can advance the pointer using :c:func:`pvr_page_table_ptr_next_page`. If
+you're writing to the page table structure, you'll want to set the
+``should_create`` argument to ``true``. This will ensure the pointer doesn't
+dangle after advancing. See the function doc for more details.
+
+The pointer cannot be iterated in reverse; if you need to backtrack (e.g. in
+case of an error), keep a copy using :c:func:`pvr_page_table_ptr_copy`. The
+copy must be destroyed in the same fashion as the original (using
+:c:func:`pvr_page_table_ptr_fini`). There are no restrictions on the lifetime
+of the copy; it may outlive its original. Pending sync operations are not
+copied, so they will only be executed by operations on the original. This
+prevents some sync duplication, but it should be considered when working with
+copies.
+
+To avoid a free/alloc pair, you can reuse an existing pointer for a completely
+different range. This is achieved by calling :c:func:`pvr_page_table_ptr_set`
+to effectively re-initialize the pointer.
+
+We've mentioned sync operations in passing, but here are some actual details
+about how the pointer performs them. When a pointer is "initialized" (either by
+:c:func:`pvr_page_table_ptr_init`, :c:func:`pvr_page_table_ptr_copy` or
+:c:func:`pvr_page_table_ptr_set`), it's marked as "synced". If the pointer was
+destroyed at this point, no sync operation would occur. As the page table
+hierarchy is traversed (using :c:func:`pvr_page_table_ptr_next_page`), you
+should call :c:func:`pvr_page_table_ptr_require_sync` to indicate which levels
+of the hierarchy have been touched. This is a very cheap operation which just
+marks the pointer as "unsynced" up to and including the specified page table
+level.
+
+At the *next* call to :c:func:`pvr_page_table_ptr_next_page`, this "unsynced"
+level will be compared against the maximum level in the tree structure at which
+the pointer has changed. This information will then be used to perform the
+(somewhat expensive) DMA sync operation (:c:func:`pvr_vm_backing_page_sync`) on
+only the touched tables. Remember this decision relies on the user (you)
+reporting this status correctly, so always call
+:c:func:`pvr_page_table_ptr_require_sync`! In addition to
+:c:func:`pvr_page_table_ptr_next_page`, this "smart sync" will be performed by
+:c:func:`pvr_page_table_ptr_fini`. It can also be triggered manually by calling
+:c:func:`pvr_page_table_sync_partial`, or the simpler
+:c:func:`pvr_page_table_sync`. The former will only perform sync operations up
+to a specified level, while the latter always leaves the pointer in the
+"synced" state.
+
+Types
+-----
+* :c:type:`pvr_page_table_ptr`
+
+Functions
+---------
+* :c:func:`pvr_page_table_ptr_init`
+* :c:func:`pvr_page_table_ptr_fini`
+* :c:func:`pvr_page_table_ptr_next_page`
+* :c:func:`pvr_page_table_ptr_set`
+* :c:func:`pvr_page_table_ptr_require_sync`
+* :c:func:`pvr_page_table_ptr_copy`
+* :c:func:`pvr_page_table_ptr_sync`
+* :c:func:`pvr_page_table_ptr_sync_partial`
+
+Internal functions
+------------------
+* :c:func:`pvr_page_table_ptr_sync_manual`
+* :c:func:`pvr_page_table_ptr_load_tables`
+
+Constants
+---------
+* :c:macro:`PVR_PAGE_TABLE_PTR_IN_SYNC`
+
+
+Single page operations
+======================
+These functions operate on single device-virtual pages, as addressed by a
+:c:type:`pvr_page_table_ptr`. They keep the page table hierarchy updated.
+
+They are distinct from the High-level page table operations because they are
+used by consumers of the page table pointer, rather than the page table pointer
+functions themselves.
+
+Functions
+---------
+* :c:func:`pvr_page_create`
+* :c:func:`pvr_page_destroy`
+
+
+Interval tree base implementation
+=================================
+There is a note in ``<linux/interval_tree_generic.h>`` which says:
+
+   Note - before using this, please consider if generic version
+   (``interval_tree.h``) would work for you...
+
+Here, then, is our justification for using the generic version, instead of the
+generic version (naming is hard, okay!):
+
+The generic version of :c:type:`interval_tree_node` (from
+``<linux/interval_tree.h>``) uses unsigned long. We always need the elements to
+be 64 bits wide, regardless of host pointer size. We could gate this
+implementation on ``BITS_PER_LONG``, but it's better for us to store ``start``
+and ``size`` then derive ``last`` rather than the way
+:c:type:`interval_tree_node` does it, storing ``start`` and ``last`` then
+deriving ``size``.
+
+Types
+-----
+* :c:type:`pvr_vm_interval_tree_node`
+
+Functions
+---------
+* :c:func:`pvr_vm_interval_tree_compute_last`
+* :c:func:`pvr_vm_interval_tree_insert`
+* :c:func:`pvr_vm_interval_tree_iter_first`
+* :c:func:`pvr_vm_interval_tree_iter_next`
+* :c:func:`pvr_vm_interval_tree_init`
+* :c:func:`pvr_vm_interval_tree_fini`
+* :c:func:`pvr_vm_interval_tree_node_init`
+* :c:func:`pvr_vm_interval_tree_node_fini`
+* :c:func:`pvr_vm_interval_tree_node_start`
+* :c:func:`pvr_vm_interval_tree_node_size`
+* :c:func:`pvr_vm_interval_tree_node_last`
+* :c:func:`pvr_vm_interval_tree_node_is_inserted`
+* :c:func:`pvr_vm_interval_tree_node_mark_removed`
+
+
+Reference
+=========
+.. kernel-doc:: drivers/gpu/drm/imagination/pvr_vm.c
+   :identifiers:
+
+Constants
+---------
+.. kernel-doc:: drivers/gpu/drm/imagination/pvr_vm.h
+   :doc: Public API (constants)
+
+.. kernel-doc:: drivers/gpu/drm/imagination/pvr_vm.c
+   :doc: Memory mappings (constants)
+
+.. kernel-doc:: drivers/gpu/drm/imagination/pvr_vm.c
+   :doc: VM backing pages (constants)
+
+.. kernel-doc:: drivers/gpu/drm/imagination/pvr_vm.c
+   :doc: Page table index utilities (constants)
+
+.. kernel-doc:: drivers/gpu/drm/imagination/pvr_vm.c
+   :doc: Page table pointer (constants)
diff --git a/MAINTAINERS b/MAINTAINERS
index 82b82cbdb22a..7f99999ceabb 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10144,6 +10144,7 @@ M:	Sarah Walker <sarah.walker@imgtec.com>
 M:	Donald Robson <donald.robson@imgtec.com>
 S:	Supported
 F:	Documentation/devicetree/bindings/gpu/img,powervr.yaml
+F:	Documentation/gpu/imagination/
 F:	drivers/gpu/drm/imagination/
 F:	include/uapi/drm/pvr_drm.h
 
-- 
2.41.0

