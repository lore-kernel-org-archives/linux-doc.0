Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 424F2C636D3
	for <linux-doc@archiver.kernel.org>; Thu,  9 Feb 2023 18:56:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229850AbjBIS4H (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 9 Feb 2023 13:56:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58046 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229837AbjBIS4G (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 9 Feb 2023 13:56:06 -0500
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com [67.231.145.42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B456359E7B
        for <linux-doc@vger.kernel.org>; Thu,  9 Feb 2023 10:56:00 -0800 (PST)
Received: from pps.filterd (m0109334.ppops.net [127.0.0.1])
        by mx0a-00082601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 319HqMs5021164
        for <linux-doc@vger.kernel.org>; Thu, 9 Feb 2023 10:56:00 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=from : to : subject :
 date : message-id : content-type : content-id : mime-version;
 s=s2048-2021-q4; bh=dSRpdac0CqHkYLSMsxvgJ5dFBGxhxqnDypQrB/B3jT8=;
 b=jdM1I2bI1tJi9TdZ+KQcNZ8kewJBwT6pY5veEIWkS8NZA1RdfIPp2ZsijTbkrHcbCM/g
 LJJASEq5S4HJZJLcrllmIEWzz3awhR5nJ8plsL7IvfNdL+Y4uDN3LWwnDu9WQCLAqvrP
 tpmbMK7keYxUy73F9rmS7gv0X9mfS6m8tzOblx4dvLf2TLUvymIlHqNamQvZjJ0HSnby
 dL8jMSm//OdtFbfHohTfjJdKKnFoM/Dh2mC449PYYj7+GKB/nE+2rqgn4uHFwMbln8Yh
 GYzIot0zaAEY9SFXezz89KYU2mQNLTicX0okGwptcPDUHzI7n1J/p1KA6kkN1Yxy/Sll 5Q== 
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2168.outbound.protection.outlook.com [104.47.58.168])
        by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 3nmsar55ab-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
        for <linux-doc@vger.kernel.org>; Thu, 09 Feb 2023 10:56:00 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YbadSXrR6fCZKVY2o/RFn1GfPHO4Me+X0MZ/ISeybbEV3sEK+hI9ByvPUzCFLV7isOpHY6iyZYEyGLN2vq+x3mPD9H5DvLCnzb2LJKkM0e1eHg42ETtQo+2hv1HZujCSuTd7dq/klXysLK82tMj8SCfiuJ//4aMwP1hEoBDpLbkH7i8jqxG38PzXO+/xlnbs8KNQ4yrjqgQz5TqSGzpcvOonxwJIvPhYawZsZmuNjWqXmVoLQ/PUvjqxfweTA0Y8+d5Jxd5Ixwo3h3+HTR5RwcpLyn4Y9O9Lgh9dlx/RD+u7AswQDM1ql/NR00qSEevFwhQyWoq8WXcPIh733xbFnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dSRpdac0CqHkYLSMsxvgJ5dFBGxhxqnDypQrB/B3jT8=;
 b=ZhS6wqLHcYjucGnDCHCiBkdWeF7qdxkcm6C3TuBL9Y2FYVvNCKlt9eX8f3z5N3GKcKNNTKL4k10pDaNqaxSLvckFLLtuLAf1GT6vNeMZKqeqxJ+aCifsYZ9DKGu56qMnDcI8BnIeI3R98qy4NolKATajfIovx0kbK/fKkCyt5Om4ksUGRgLiBnAtwxD9UTK2bVA50q/8FnvHCwfEdoEVn1wvo1KHh9/pv6fgJx8PH8WTML1EcENP2768xQlfV2vZIrh+ViZoUhR1hQxOZ/L2GtjGIn972Ewi5mNAP/or/kmg0BwDUpUiucrMVAMq6S8YyjbNvHKjXgJSXed6tdSfeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=meta.com; dmarc=pass action=none header.from=meta.com;
 dkim=pass header.d=meta.com; arc=none
Received: from DM4PR15MB5354.namprd15.prod.outlook.com (2603:10b6:8:5d::18) by
 SA1PR15MB5300.namprd15.prod.outlook.com (2603:10b6:806:23f::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.17; Thu, 9 Feb
 2023 18:55:58 +0000
Received: from DM4PR15MB5354.namprd15.prod.outlook.com
 ([fe80::d803:26d7:d03:b8c4]) by DM4PR15MB5354.namprd15.prod.outlook.com
 ([fe80::d803:26d7:d03:b8c4%5]) with mapi id 15.20.6086.017; Thu, 9 Feb 2023
 18:55:58 +0000
From:   Sreevani Sreejith <ssreevani@meta.com>
To:     "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
Subject: Kernel Documentation Backlog
Thread-Topic: Kernel Documentation Backlog
Thread-Index: AQHZPLgkQLVWNd1boUSx8FPXbHNRKg==
Date:   Thu, 9 Feb 2023 18:55:57 +0000
Message-ID: <758FF6F9-460B-4323-9C1F-80901255B9F0@fb.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR15MB5354:EE_|SA1PR15MB5300:EE_
x-ms-office365-filtering-correlation-id: ee8dae4b-2e14-4219-27bc-08db0acf47a8
x-fb-source: Internal
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: cJeAW3XU9ymA64h7MJpk/1APGVYlF6LRgQ4Vcaf38C9qn+rjfb4ErImzstMZHJJRgB7NoTii0M1IQQlv89AV8al95yM42b3MH3I45ozQ6OsIExiT8nzigU09NJHO8R7LbHCEN04pHv2fED3pL6Bvst2qQBUinIOGp/TOzBeIqARhZZgp5O6tmiKyXwdQrE2phR6N45wmVojSOqeyBtF0TUC3AIOkmnVQDlhT+VJ8IX9C385P65sHLgqFQlW1ECNBvh3Eeu7Fl8svz+lXfOHB2P6iBqMwN3hztuky4GJXz9+UZ5JQpGN2nzgMfVenBw/RS/mcQUjssMpe9c1VQ0BRaLKBHekiwlShr9Zipdgkdmtyn2MBcHEhRxh0BuJ7Soa1Qb8DEt8f5+ScYDPPv+9bh1dGkPHU7Dr9fYpAxrchP7WM7OAcTTWJFwoKL4DY7EbbgaEG1lxmbca+vZHxUMDVpBFpjKuHRUZC38q8mb05XqmNq43XKAxbfmDh0koUpiJoY2REBvosoAMXcwAH94FookeKlw5vDQ0KpcyPNRY9binAdeXHbar33+vdABkeozw2ed9r5VcjRBJnMY2FbzsdcOagm+M+pUktyt2N1dx08NykO9kA08cTv3r92acp25HgKHkmaX+PZmFYj2yThNzRUc6B9sI08MkE2BV9LBRc4Ib5IAXPd2auYNFYB/LZq4yp
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR15MB5354.namprd15.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(376002)(396003)(346002)(136003)(366004)(39860400002)(451199018)(316002)(122000001)(8936002)(7116003)(36756003)(558084003)(2906002)(33656002)(71200400001)(478600001)(6486002)(86362001)(66946007)(66446008)(5660300002)(66476007)(66556008)(64756008)(38070700005)(6506007)(91956017)(76116006)(26005)(41300700001)(186003)(6512007)(8676002)(9686003)(6916009)(38100700002)(3480700007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?PL3J6YlajONSaERzgeWPF992Rc9xSX2uFdNo0mjdmBvRORzaRyNE96lRwfne?=
 =?us-ascii?Q?m4dTpbH/Xk40rgbJ8kZWtLb9aA3qZGlwFFCiIJCiLmr69DZi0TJ49rXmmnOT?=
 =?us-ascii?Q?Og2tLWP+0HbWGrV843xLl0Lxk1XAXEXS7syPl9Ism7GfzElWSOtff5rt/rGp?=
 =?us-ascii?Q?QzTNIB9Ys0PCU2ww7KeUD2LYlS4twFfb96OX6AiYooDgSqlGEduMg0pHM/Xy?=
 =?us-ascii?Q?ilGXTcU2JJD4UsHOoUqC1pbV6NK65emCvhkBeaHR6u36tOIvR/JVa0+LD0cw?=
 =?us-ascii?Q?7GmOW4PR/7gVZCfPqx2QUnlg1XBoGQVDFHzDnBKTyV44HMlI+sMtv7Lxt84D?=
 =?us-ascii?Q?gJ+9rI53zLDMXN8sfiZYaAta0IjPGAKhy3+yltrIP+8bBlTSWK1R25ZeR7iF?=
 =?us-ascii?Q?93oHyxXTn3OpDvD+rZch3zncRxc3JA4766a44cbdV9s2hvP2LsFXEZE8uRbd?=
 =?us-ascii?Q?9IlZXMD5xS3PMqJDKhodyHERevcRlgNfPj4Z6L8z4yFi0d4zaOJ3dsZptuRN?=
 =?us-ascii?Q?FlT/ryRyzQU2v0T2P2m2K73X3pZJEOdK1tuoQPcGAbgqOL1LXAyerG5qOMzC?=
 =?us-ascii?Q?7xEjvv3zER9btN6pi34xDVzfIgoCxjQsGSE7Mc/3182Nl9BDZ24GuqFAF5xT?=
 =?us-ascii?Q?x7qTIklup5F78ZZRrqSfYSUpHfDzRlJVJKcrsBdqKJmjf+BjflPGUUeY9RJw?=
 =?us-ascii?Q?65fYvsWLbpJeo8lyJKgcCrvIX+Z7tcRuhLrW2AFZ5Jc5K02FIpNdYHQYU9Cj?=
 =?us-ascii?Q?PXzE2cEqijMzdQ2gy/9ty60iKSWgMru0HFLZztRKVJs7XpBkpIHWvCWx8FoY?=
 =?us-ascii?Q?iSL6Gj3F2t5Z/efnuvGeiDIxREuECOKjAb1qClYhhE4Sr30jOv3Kp2Rn/Qs3?=
 =?us-ascii?Q?JdqdzeWAWDtH4OUMqngL8nHq6MEMRSwJMnZ8BU9tNP+NvxsOkP+6uQQ/MMSo?=
 =?us-ascii?Q?y+LgUHzIx67MxLpbZHzuQuqxI6Vn2XwaT4g+TVB29CwveNd7QOxFbpXnN/kx?=
 =?us-ascii?Q?vhXzM7kiMUMRMae4fyMVab8W2xvuPOjJKhVrJPhMXeiAUUnhRMS+GgzdggSx?=
 =?us-ascii?Q?HpvBBs63MkEVtL7HnyRyrN9qxhUoVfa0vaoXpugEw1r94RYAliquqvgq21QJ?=
 =?us-ascii?Q?U2gxDAcOTMWJEfy1wD1uWMyETWTr08JspCQWLxWBzGjRlIAVgswzt5PvDKwP?=
 =?us-ascii?Q?gx0aZz8QdACRp/qFqeMyOxc4/uoq9C9N7SaRpH1iSCkyzKpcq1UpN/q0Y3vW?=
 =?us-ascii?Q?d8lwreOrOVa0jdUvXmqn5/mqylskm12GB7IaNR1UibVP64cJeZZPepolHrT/?=
 =?us-ascii?Q?Hu4x1Wm+KjHfo9xCtWHYAdKoPvySyxwrskZtELEiQP15ivR8QaLeYJLdNrAF?=
 =?us-ascii?Q?n0VIVxsvXaXht1fbYwdjWNks0h4m9YHMGixKAt1KP5DYH9MRUoOisNjaAHEr?=
 =?us-ascii?Q?kBKH7Du3FEijOcyxCRj+cuHTKyxOmXVIpkV7KxXbEuoFJlQ+0CKVPc1b1D26?=
 =?us-ascii?Q?HQ2PHzHT8cXntvQg350UG5PBgGz7uJj2AOCrxEUt3+dhOM3hBKaLfT4d/uSK?=
 =?us-ascii?Q?/be4TwVeZzb15HXJS7eVvr11VGIkENIVdt7YmSKZIyQsWpNVGFf10BNAiaOK?=
 =?us-ascii?Q?EA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <F211F0DA2C3C9A409DBC28B343FAB181@namprd15.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: meta.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR15MB5354.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee8dae4b-2e14-4219-27bc-08db0acf47a8
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Feb 2023 18:55:57.9299
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BKi4G1/cv02yZ+cx/GksOexQLVXooZ+MNBTykDm+Fjj5Pd7ihRaqrl8wHom/iAmLrNmnhoQMgF4S417Mg2czew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR15MB5300
X-Proofpoint-GUID: GrYUjqjH9W9mENICOj2gq6m8rFgpGSy8
X-Proofpoint-ORIG-GUID: GrYUjqjH9W9mENICOj2gq6m8rFgpGSy8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-09_15,2023-02-09_03,2023-02-09_01
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi,

I am a tech writer interested in improving kernel documentation. Where do I find kernel-related documentation to-do list/bugs listed?


-Sreevani
