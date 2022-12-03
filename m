Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 105DFC4321E
	for <linux-doc@archiver.kernel.org>; Sat,  3 Dec 2022 00:31:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234795AbiLCAbu (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 2 Dec 2022 19:31:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234684AbiLCAbt (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 2 Dec 2022 19:31:49 -0500
Received: from mx0b-002e3701.pphosted.com (mx0b-002e3701.pphosted.com [148.163.143.35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B235F2325
        for <linux-doc@vger.kernel.org>; Fri,  2 Dec 2022 16:31:48 -0800 (PST)
Received: from pps.filterd (m0150245.ppops.net [127.0.0.1])
        by mx0b-002e3701.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2B2Nhajc031127;
        Sat, 3 Dec 2022 00:31:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com; h=from : to : subject :
 date : message-id : content-type : content-transfer-encoding :
 mime-version; s=pps0720; bh=jzCE+dxqZx0TC9yRXxmnMJ28XtwYJHkvJ3byHP/wuj8=;
 b=bP3+U15KAKk5j/f+2P1zJOVODP8nhWl1Z8tFBP6SqBwhyeJQXxJAQyF4jLyD/WpUL5+0
 /iUQFP5DgYlu8oirJ7sJznX8y9skWRcZdJVz0rpSpXJQ7wBNPJ0vzzfmM1OC3015SlLf
 k3j40Ck882AW6Azg+peUmvx7k7tDyMI89chX8IX1+SOeoC/P7je8wib1jZjuzZP/2Jbn
 7CRRiTuj0r25plZnhUBCw+ItL80OOOn0M7eCFExdAfInDQCBPcxwWKlGZBybEMomLjQI
 0Z1a8x3P6b+ekSa2ybaFQR2zbG1uzrKkcF4cR/xH9Dxh7uyfyasNI83KQKW8zKnQ0tJF SQ== 
Received: from p1lg14879.it.hpe.com (p1lg14879.it.hpe.com [16.230.97.200])
        by mx0b-002e3701.pphosted.com (PPS) with ESMTPS id 3m7tpt8fsd-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Sat, 03 Dec 2022 00:31:46 +0000
Received: from p1wg14926.americas.hpqcorp.net (unknown [10.119.18.115])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by p1lg14879.it.hpe.com (Postfix) with ESMTPS id BA65E4B5DB;
        Sat,  3 Dec 2022 00:31:45 +0000 (UTC)
Received: from p1wg14927.americas.hpqcorp.net (10.119.18.117) by
 p1wg14926.americas.hpqcorp.net (10.119.18.115) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.15; Fri, 2 Dec 2022 12:31:34 -1200
Received: from p1wg14924.americas.hpqcorp.net (10.119.18.113) by
 p1wg14927.americas.hpqcorp.net (10.119.18.117) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.15; Fri, 2 Dec 2022 12:31:34 -1200
Received: from p1wg14921.americas.hpqcorp.net (16.230.19.124) by
 p1wg14924.americas.hpqcorp.net (10.119.18.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.15
 via Frontend Transport; Fri, 2 Dec 2022 12:31:34 -1200
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (192.58.206.38)
 by edge.it.hpe.com (16.230.19.124) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.15; Fri, 2 Dec 2022 12:31:33 -1200
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nDg9FDG4enatDKNeg4by3SzmuemTmSea/iDIZYymOe1c8j4IiRVk34+QL9m68dZ7R2/Yr8XjOsSU8d1iAQMNnJy6WMwR8djxrd9J5Go3QZS2+72cxiTBGqfxmPJlOoJl87srPQCMtASwjxiwp36OvA2Mz5wI/Oo/yMHZ/k/8dSLeQ3yl3gbGAq3f/9bHYs+Z95d3XJv8nQ0gjd9/v5oIYmb2X4IofRe5RS8wxkA3U0FAC7/wk7Fkt5A7c+ievvpUtioNgrFl2d2/iUYp6O45RoTLNUlYPLjClj/RYP6WbenUYB2I83e1XTKpvNVm4DiU05wYoz0aYRS3bw3e4/ItyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jzCE+dxqZx0TC9yRXxmnMJ28XtwYJHkvJ3byHP/wuj8=;
 b=UHEz1BDD88tQWwSc+5tghBOrkcLfuggxgEO8Oa2XLqqwhF19rZT10UUGSyjs6ffyxYPZXwoBMkNYz2xO+Xwj0yXslQpvNFRdxK8+nKTAm19bnoTmndthnu2va0Pe+me7RWm7nSJBBhnK2ybl6cPWfoINDBkw6ob/9mih3huhiNKcGgkPcqK6O2sfOCe7lFQ4Gfm3UR6nUQiwMxNSbPUE/Dy90/TctLlqOmcb9ornQzW8S0QRVVbZDV/otCpX3g/ki8E49Df7SKShUMZQo6X+D+4UKzakSohQLKEtPx4xQ1HZ5Cqido/l2fDtCPm3XXV1D0bObiRzAjbUTJjT9YXaxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hpe.com; dmarc=pass action=none header.from=hpe.com; dkim=pass
 header.d=hpe.com; arc=none
Received: from MW5PR84MB1842.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:303:1c4::18)
 by SJ0PR84MB1434.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:a03:430::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.8; Sat, 3 Dec
 2022 00:31:32 +0000
Received: from MW5PR84MB1842.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::5511:bd85:6961:816]) by MW5PR84MB1842.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::5511:bd85:6961:816%9]) with mapi id 15.20.5857.023; Sat, 3 Dec 2022
 00:31:32 +0000
From:   "Elliott, Robert (Servers)" <elliott@hpe.com>
To:     "corbet@lwn.net" <corbet@lwn.net>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
Subject: kernel-doc headers for assembly language functions
Thread-Topic: kernel-doc headers for assembly language functions
Thread-Index: AdkGqswPXUwIHmwlQ56q/nkrkQlVJQ==
Date:   Sat, 3 Dec 2022 00:31:32 +0000
Message-ID: <MW5PR84MB1842B6A43CB2D9B5B3179B3CAB169@MW5PR84MB1842.NAMPRD84.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW5PR84MB1842:EE_|SJ0PR84MB1434:EE_
x-ms-office365-filtering-correlation-id: be32ec97-fc4c-48fd-5cfe-08dad4c5ba39
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: QYMbF8yD7bYpqbyPFEnChl+GvFYYF3k8P4qmCu6lXqfFuQAPGaHNtvzZ/r/+Umav9Wo7ujWH+zHykwYLNAnOctUmfhAnU/L7i+q5rroqMjKfamf4RDUIKw1xt6z++rie9QUBRI/8OVARZUMG3o7DX5N88Fuj3yb0B/yzVakdsOaSQt+2UYv41OKlZhj+nce/ILvRycu6WnnZHQBGJX+tDRSsy/p/uO3DRyrDVC57wK5cIo9x6hMdAvuAOp+1UBo/dc19u3aVc4fDoq5I7vZQSJW6Aur03SbD2Z4wbCu1l7LR+DPCz/qy/bG6+OX4CwfQfAqlbzHQ3bjzqa1Dyle5t+4SIjFIxAlTTYy6uFef2oykFb9P+crjGLlbLp4ZwgxapGelxAbVWiqUXsm4zk26C/6yWuQXhCnSFIGFe4qjlQIUlVoR5wn4VvO5p42d3ygwTjzgQCOjyMKTqFqKTNdQiubUHGVqaecHALPfw9fnAyQUUErhD1TvmSHg8nyDjypRKKfTw1JPzL+N3eTOoABnuxAmBINrSEN7ajrz3HX6dqG9Moig//Zl+MmwojxYGqql3hk4rwHy6mUvuRPVgF8n5BB2gZMLYHvW1x1WChHVYCGtscd3uXzQJ09XqV5SVnR7G3nK+zHigtl7O+LSTYTkv3CIjZRaTGhX8F27VJ9ANp8YNjKt4URmG0dP9+xoaKbiQtaC2s0KhrW36O4sLzCXFQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW5PR84MB1842.NAMPRD84.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(346002)(376002)(366004)(396003)(136003)(39860400002)(451199015)(7696005)(2906002)(9686003)(478600001)(55016003)(38070700005)(86362001)(33656002)(82960400001)(122000001)(186003)(38100700002)(83380400001)(41300700001)(76116006)(66946007)(52536014)(5660300002)(6506007)(71200400001)(26005)(8936002)(66446008)(316002)(66476007)(110136005)(64756008)(66556008)(8676002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?+VGCJ29CN3quXdQEBVN2ik3aDGFVpBqwpPg/f8As4U51qZf0Y8Uq9K2y9vG4?=
 =?us-ascii?Q?bl+DOX1uoFXPwnF+Dej1kH2M29GOBgxf+p/fnBDZg6J6PhgVyNN/XftN/tqd?=
 =?us-ascii?Q?BFIv6OnF6NZ/xyPEu5MTHfqZF8zvloqXBRAEOtSpYhBBbC1AgD+7Vh+A9hw/?=
 =?us-ascii?Q?epm8M7f3jkJL2kFiJSuSA3WU7B42fYzw5oSE5mdo4bxhVauSYOpU/rw5fAGr?=
 =?us-ascii?Q?uPfYVzhbFLMG0NVydyf2sxo9XVX7JkDnjEouqWlS7OTOEjZr0RuYG8wFcKCG?=
 =?us-ascii?Q?ihVq3yCzvrT59o/VLEloBPtY4rnVeHYr7Q6+dngXmme7svGZ1Yn0d8D8W1vh?=
 =?us-ascii?Q?Xoki0kVrnnYP4xkHyCMpym66o3GjP6FO2kJO98XCWRck/bUmd548e8eNYIHl?=
 =?us-ascii?Q?Q4Roeaxj1NuUWVwjrCUFRSQW5HrOzlb8GGe/NZ0W3Nfu9ZNAZrqQJRUEcVsR?=
 =?us-ascii?Q?sVUrtFW6VQ80CZ7JQB0HFxnnyUj5cWXy8MAiTr298X/PPTVRU7FRHODicrIb?=
 =?us-ascii?Q?BWlktFRecYsLHG3zIm5q1snVgCC10sP8wCU4nEyAMuWTmQeP9m8pdtNz8JUM?=
 =?us-ascii?Q?JNtixBjSmdrIE0e3rmuFUncK1E8VdhO3+NjVvEfj6LP0qUGYqkrR+kyOBLEc?=
 =?us-ascii?Q?taOPrIUtq/O1Onwe7Vd/Kb9mOTrOMW0a7gz/KtsWHnut4jnkIGWJ/itT4Grr?=
 =?us-ascii?Q?3m7t0orF7UdILKRcyCu+cA3HDkHKmvAHY9ar9dpG8UONGLajGIt6NuXBa80V?=
 =?us-ascii?Q?69y4PuqwRtW4DFxNEfK1sYEGfn/o9IO0F6k1tm0xv6arQir4jKvMi8Gd1pme?=
 =?us-ascii?Q?m3AZipFLyUjQOtOkeIwrUslZT4LAjwJ5SOdQ7m9/K8+Hp+RTXJyG8r9ZX4nf?=
 =?us-ascii?Q?3oM/DKDxo0+A2Rc1NSYCJ5TRGCv3BmrgSQb1wcKc49fiTn5W5ZRuiYBptPdf?=
 =?us-ascii?Q?b6SFPBFIA+vguMFvsaa7az2LY+EImYSrC0GpVGgNEk47tNM3T79j45qV/XZX?=
 =?us-ascii?Q?pL2aGrHH48CIdBv6Pbfoo8S24/y4B6mMyZTUuFl2223JTnvakvxkt/fKH3yf?=
 =?us-ascii?Q?IvERCy7KFpWYLRPmzsIvZLQxp6WW6iWy0Hl7u+kMbui3NyABrKMJVpHjhZoT?=
 =?us-ascii?Q?goO58ez7gygFsvInZlDr+Ox4lohp3LT7DzyANKuY89HIX980xRMCpxYNDAVB?=
 =?us-ascii?Q?85LuRNp7MpdWwYT1q1JbfC94NGRuL9Hs/AI6fasgQVXn9i4i4Dw73PIYrwx9?=
 =?us-ascii?Q?52O1Nqew2Zl/SMCqKUhP4lXbcDivO6ElV80UhLv8xjZSXrtqRvTTy1v4R+Ek?=
 =?us-ascii?Q?BgqWnZgY6sH6d1oxrPCAwcmikagqYkLpxy3bVgNyFOBCpoic+hpJPyLym/Yz?=
 =?us-ascii?Q?hkY79WTQWtcL8RmpT8NQVrbB1b7pt053t657+MpU35fCpUe+oDXmSXLI7Xnt?=
 =?us-ascii?Q?rzI/L92MTevRAJALCJUbFX60fgMEB3M+MlBICR3ed/5IQRiOEMuiVVDStQPq?=
 =?us-ascii?Q?nkbxtsVqWZ0UCRTncl6Ax5jYaqLTI69aXwKYa1FCef/e97hV/Ix6qBAm8BUU?=
 =?us-ascii?Q?jph6Eb5aJLdJzOo4NoA=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW5PR84MB1842.NAMPRD84.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: be32ec97-fc4c-48fd-5cfe-08dad4c5ba39
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Dec 2022 00:31:32.3845
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 105b2061-b669-4b31-92ac-24d304d195dc
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KgbzSmcXnkSLbuNk5r4JOqoxdbnZL8TRdv/u/PnE67IRjPSmV921mWr9wYaubbgC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR84MB1434
X-OriginatorOrg: hpe.com
X-Proofpoint-ORIG-GUID: 5FIRzWvBVpkGsx8oihWZZMGEiA1NXJnt
X-Proofpoint-GUID: 5FIRzWvBVpkGsx8oihWZZMGEiA1NXJnt
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-02_12,2022-12-01_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 bulkscore=0
 lowpriorityscore=0 impostorscore=0 priorityscore=1501 mlxlogscore=999
 spamscore=0 phishscore=0 mlxscore=0 suspectscore=0 malwarescore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2212030003
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Is there a recommended way to document assembly language functions
with the kernel-doc format?

scripts/kernel-doc doesn't understand assembly language files and
using SYM_FUNC_START to identify a function entry point. Unlike
a C function header, that line just identifies the function name,
not any of the arguments.

Example: arch/x86/crypto/crc32c-pcl-intel-asm_64.S provides a
function for use by C code:

    # unsigned int crc_pcl(u8 *buffer, int len, unsigned int crc_init);

    .text
    SYM_FUNC_START(crc_pcl)

Most of them have the recommended C prototype as a comment
somewhere nearby.

arch/x86/crypto/crc32c-intel_glue.c has a prototype for it (not in
a .h file):
    asmlinkage unsigned int crc_pcl(const u8 *buffer, int len,
                                    unsigned int crc_init);
    ...
        *crcp =3D crc_pcl(data, len, *crcp);

Perhaps scripts/kernel-doc could detect a special "Prototype" line
or look for a comment starting with "asmlinkage", something like:

/**
 * crc_pcl - Calculate crc32c using x86 CRC32 and PCLMULQDQ instructions
 * @buffer:   %rdi address of data
 * @len:      %rsi number of bytes of data
 * @crc_init: %rdx initial crc32c value
 * Return:    %eax crc32c checksum
 * Prototype: asmlinkage unsigned int crc_pcl(const u8 *buffer, int len, un=
signed int crc_init);
 */
SYM_FUNC_START(crc_pcl)


