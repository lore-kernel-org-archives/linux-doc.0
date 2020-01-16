Return-Path: <SRS0=c7IR=3F=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,PI_IMPORTANCE_HIGH,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D1A6C33CB1
	for <linux-doc@archiver.kernel.org>; Thu, 16 Jan 2020 11:38:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6211820730
	for <linux-doc@archiver.kernel.org>; Thu, 16 Jan 2020 11:38:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=NETORGFT5553580.onmicrosoft.com header.i=@NETORGFT5553580.onmicrosoft.com header.b="xnvwO0Rv"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726088AbgAPLiy (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 16 Jan 2020 06:38:54 -0500
Received: from mail-eopbgr1380095.outbound.protection.outlook.com ([40.107.138.95]:48485
        "EHLO IND01-MA1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725999AbgAPLix (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 16 Jan 2020 06:38:53 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JSCNuOxB6d7XEM/A4CFFfe14/oZi0MfW7GeOXPqij1QzWWIGcDhFa3/6plyMBEqzqwzluf4PPgubzQ6uMI0boykwY0O/9qEmzxU/e5tiYtzVDzIifiv4/OCn2JGcyMit2VZWiK+tIG8WuDk8350edAM3lLIXySk3f2vCdUaVgInV6vJxk4lWZe1fnsq18b0xSOG7dkPA3D67Ls0n/AS7qj378r4rfe+vNA8n/dL+G0fIiM7c4a91SHAPwAciV9hMKaiXpL0op0cMsSMZl8pAhUWoKzQqdd6Tv6tfBbn9ihKCUXzlR3Soy9feBV8Sy+EgNZKMKKC4PljgVGXF2dljqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u0MmcKB8ErdZr1OYaeaDqFajhH9KIMis02vXGCbfmO0=;
 b=VvI9JyCGygRmsPxcN5c3pZxiInqGgKZmD1s9vIYedDOAy7MBX+XHRzu94DMJLQiKxrmWPHnKPXxCI3O8gIJr/aoJrjkB55NeduO0MEl7NiNkX9d3/fCLRo5eLFjUosL3mDh7cvkZOENOm9g8AHLjomEsdI0WLdTeeEehxuvbVWVI1CPV/W8xuLKBvx1OhodHjGl6hXbVKqRvxvRc39xF1+wstLBiy0kSstaVKA8EtQ0LSZAPDk2z+PBsoDglEcDMTK7D0x385Wq1HuOLYtbN+LET+Uk4fPI3vg+aQKpIrK51Twyoy6bhpTFWvLGPecoLSHpXIlllh5GOK0AJ1tkWiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oceanedigitaldata.com; dmarc=pass action=none
 header.from=oceanedigitaldata.com; dkim=pass header.d=oceanedigitaldata.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORGFT5553580.onmicrosoft.com;
 s=selector1-NETORGFT5553580-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u0MmcKB8ErdZr1OYaeaDqFajhH9KIMis02vXGCbfmO0=;
 b=xnvwO0RvlSlXeuiMUzalUV7fE1/58OQahdSxNZgBJr8L2ttJyDJOjC6azkwXymlza+8Ll4dZSAJnEtZH0/zN2P76jJpOL4LA+3u+jrPEg/m+vzjDMijk3PjpKvQQv4pWYv2XsmC6X7cV3C16K6dxkL9WjXNaiIxnjCwx4yocJkA=
Received: from BM1PR01MB3362.INDPRD01.PROD.OUTLOOK.COM (52.133.239.87) by
 BM1PR01MB0932.INDPRD01.PROD.OUTLOOK.COM (10.174.211.135) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2623.13; Thu, 16 Jan 2020 11:38:47 +0000
Received: from BM1PR01MB3362.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::7815:ea:4d7e:7f52]) by BM1PR01MB3362.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::7815:ea:4d7e:7f52%7]) with mapi id 15.20.2644.015; Thu, 16 Jan 2020
 11:38:47 +0000
Received: from DESKTOPMPN5UI4 (49.207.50.126) by MAXPR01CA0087.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:49::29) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2644.20 via Frontend Transport; Thu, 16 Jan 2020 11:38:46 +0000
From:   Brenda Lane <brenda.lane@oceanedigitaldata.com>
To:     "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
Subject: FYI Embedded World  2020
Thread-Topic: FYI Embedded World  2020
Thread-Index: AdXMYYKBwaPGj85YTM6ru0ZUB8KZcQ==
Importance: high
X-Priority: 1
Date:   Thu, 16 Jan 2020 11:38:47 +0000
Message-ID: <!&!AAAAAAAAAAAYAAAAAAAAAMeItoodLbBEhAG+Fnluak7CgAAAEAAAAIxsWE2fVv1EryS39PBE1yQBAAAAAA==@oceanedigitaldata.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: MAXPR01CA0087.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:49::29) To BM1PR01MB3362.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:76::23)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=brenda.lane@oceanedigitaldata.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: Microsoft Outlook 15.0
x-originating-ip: [49.207.50.126]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 51876504-e41b-4344-21c8-08d79a78a609
x-ms-traffictypediagnostic: BM1PR01MB0932:
x-microsoft-antispam-prvs: <BM1PR01MB09324C85D5F2B69F64AFCB29EA360@BM1PR01MB0932.INDPRD01.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:5236;
x-forefront-prvs: 02843AA9E0
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(366004)(376002)(396003)(346002)(136003)(39850400004)(199004)(189003)(26005)(2616005)(66556008)(66446008)(64756008)(956004)(36756003)(2906002)(186003)(16526019)(66476007)(86362001)(55236004)(66946007)(44832011)(6486002)(1006002)(7116003)(508600001)(8676002)(81156014)(8936002)(5660300002)(71200400001)(6916009)(52116002)(316002)(81166006)(4744005)(6496006)(130950200001);DIR:OUT;SFP:1102;SCL:1;SRVR:BM1PR01MB0932;H:BM1PR01MB3362.INDPRD01.PROD.OUTLOOK.COM;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: oceanedigitaldata.com does not
 designate permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: DwYGhXU+vp048g6A3GyJ6Q3+qm5WN0+5oCG2eBbYbsfuhMgL7z8fJAplUh0ThNXg7ubOjyDJplMkRJNhNSqzU5ycx7lCV5ofS5DqvP62PSJ3LlwkMzmvXQn+jlLS9xQ9b5y6frtsge/4XEBn1iQY1xUz+25W6MTgpqOAHYmkbTkh6/ojGjFwoYYYBpdVn7DNzoHYXV3FDWNWfmeOD8grTgOCGx0959M6sUqr4jQ9MOD4xkWTA+7NrDMKSOS6LVK+WwunOnG54c/1ExGO8HB367+VWdMERAnurkBLv1bYLmQDJvh9V6vK4CBa273k08zwHDkEZjDUfZdh/xbdfs6/FHLPx28JhrwW+ylYJcU4yq4d6fQPGDdV3yOtbvWvTMgezHFJwN6+Wh8IZ+4J2EgBANeWTYq+9cNSxTZNEqSln768ZKSGNmkyBlhJgc0RZo0a/c3M3uRwuBXR7yfajlnvzHDF5O0VSDkUeE7hsPV7vThHWFZPPYnEqt1EdM3qbuE6
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <F029167DDA23174689FAAD9721F389B3@INDPRD01.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: oceanedigitaldata.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 51876504-e41b-4344-21c8-08d79a78a609
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jan 2020 11:38:47.3311
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4d88f05e-781c-4247-92e4-bd9439b8070f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xxHYIyb689m3VnTfpsM0vpAOl1raAVaH6O0wOJvUHbRTfuCsVO2jzHPu3fSgeNLdhc6NcvszLxTR7teRMOmmxh6bcdjG7tKjOOfd2l5j1tyndMIPVqYL1tmZWepSvOQ8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BM1PR01MB0932
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi,

I'm wondering if you would be interested in purchasing Embedded World 2020
Attendees List.

Target Audience: Electronic Systems, Embedded Technology, Embedded Systems,
E-mobility and Distributed Intelligence

Venue:  Nuremberg, Germany

Please let me know your thoughts, So that I can send you the Number of
Contacts available and the Cost for it.

Best Regards,
Brenda Lane
B2B Tradeshow Specialist

If you're not interested kindly reply with the subject line "Opt-Out".

