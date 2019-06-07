Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id ED33B7D2F0
	for <lwn-linux-doc@archive.lwn.net>; Fri,  7 Jun 2019 12:04:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728502AbfFGMEU (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 7 Jun 2019 08:04:20 -0400
Received: from mail-eopbgr1410115.outbound.protection.outlook.com ([40.107.141.115]:65155
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727584AbfFGMEU (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 7 Jun 2019 08:04:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x1QtP2y3RnZowpIpOtByrCE5FxuGznrF064EoJ9njNE=;
 b=l4BW6/J0RWlyQGEthEIbmrYC1az7p00Ps0GPzDbtRnTqlz6RKTXHhtEDKkNssOADAAbJCzKAUBWQjSGnbncRc02C6bgZYG+S4FxxUFmuLEdRcvxBIF0s6yZ8Kkhv7pFAPxyAp5npYXaLKYLWld3M4Aey+8mn6gI61++m51LvyP8=
Received: from OSAPR01MB3089.jpnprd01.prod.outlook.com (52.134.247.150) by
 OSAPR01MB3137.jpnprd01.prod.outlook.com (52.134.249.18) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1965.15; Fri, 7 Jun 2019 12:04:17 +0000
Received: from OSAPR01MB3089.jpnprd01.prod.outlook.com
 ([fe80::19ad:b6ce:a287:dc85]) by OSAPR01MB3089.jpnprd01.prod.outlook.com
 ([fe80::19ad:b6ce:a287:dc85%7]) with mapi id 15.20.1965.011; Fri, 7 Jun 2019
 12:04:17 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Christoph Hellwig <hch@lst.de>
CC:     "corbet@lwn.net" <corbet@lwn.net>,
        "jroedel@suse.de" <jroedel@suse.de>,
        "m.szyprowski@samsung.com" <m.szyprowski@samsung.com>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>
Subject: RE: [PATCH] Documentation: DMA-API: fix a function name of
 max_mapping_size
Thread-Topic: [PATCH] Documentation: DMA-API: fix a function name of
 max_mapping_size
Thread-Index: AQHVHQX28aIqCA/T0kKXQB70i48QjqaP1kMAgAACTBCAAAUfgIAAOh3w
Date:   Fri, 7 Jun 2019 12:04:17 +0000
Message-ID: <OSAPR01MB3089F8522C11A80E4FB38933D8100@OSAPR01MB3089.jpnprd01.prod.outlook.com>
References: <1559893633-6852-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <20190607080814.GA10303@lst.de>
 <TYAPR01MB3102C6CCC204DAAA6570FD25D8100@TYAPR01MB3102.jpnprd01.prod.outlook.com>
 <20190607083447.GA10860@lst.de>
In-Reply-To: <20190607083447.GA10860@lst.de>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=yoshihiro.shimoda.uh@renesas.com; 
x-originating-ip: [118.238.235.108]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2f10c3bf-abdd-4f25-b2d5-08d6eb40446b
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:OSAPR01MB3137;
x-ms-traffictypediagnostic: OSAPR01MB3137:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <OSAPR01MB313799D854033FCD0939A808D8100@OSAPR01MB3137.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 0061C35778
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(136003)(376002)(39860400002)(346002)(396003)(366004)(199004)(189003)(86362001)(64756008)(66446008)(256004)(14444005)(74316002)(3846002)(6116002)(305945005)(54906003)(66556008)(966005)(6306002)(9686003)(99286004)(66476007)(7696005)(76176011)(6436002)(52536014)(6916009)(4744005)(55016002)(14454004)(76116006)(71190400001)(66946007)(71200400001)(73956011)(5660300002)(478600001)(2906002)(446003)(476003)(11346002)(33656002)(486006)(25786009)(6246003)(53936002)(316002)(102836004)(66066001)(6506007)(8676002)(81166006)(81156014)(186003)(68736007)(26005)(8936002)(4326008)(7736002)(229853002)(6606295002);DIR:OUT;SFP:1102;SCL:1;SRVR:OSAPR01MB3137;H:OSAPR01MB3089.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: l0R9ahB6JcaRybmNLe/KgRU4wQBirDQxqZVfkrUAFxt01SLhlcowZv4NOei55GE/pIZI6scZZqlcC2RKrRHmt1fC76ifQjrQskyC2Ud+2uX9iSxwerHMrsx/rOD/+Cp47pUaP9HHGHaAyzcKBy15hE6w0i9SR+2E3aM9fsK0HPcJ1U/yMAHeRUtiRJG7nOrcnk3aD5hQevBj5oe5lVb8vosw02XXGadfomQwpIS+7KCJtu4GPbivjo3jrNdWfC0TtcWrE2wj5h+YUbSE91LkLHMXTchQKxvituzG/V37LWOwLLFX4r8/jTsduIjFIONOreMYp3YpB1bJtKKb8jBMD/Ie7FOncYqoXq1sac5IncMtpFKxUie4kBnHKrYPW8E29+lE2PzOmH26l130MznO6scesYSbwS3eQrENH9FwMRY=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f10c3bf-abdd-4f25-b2d5-08d6eb40446b
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jun 2019 12:04:17.6147
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yoshihiro.shimoda.uh@renesas.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSAPR01MB3137
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Christoph,

> From: Christoph Hellwig, Sent: Friday, June 7, 2019 5:35 PM
>=20
> On Fri, Jun 07, 2019 at 08:19:08AM +0000, Yoshihiro Shimoda wrote:
> > Hi Christoph,
> >
> > > From: Christoph Hellwig, Sent: Friday, June 7, 2019 5:08 PM
> > >
> > > Looks good.  And it seems like you've also found the solution to
> > > your usb storage problem, but I'm going to post the variant I just
> > > hacked up nevertheless.
> >
> > Thank you for your reply! I think this API is related to my problem,
> > but I don't have any actual solution (a patch) for now. So, I'll wait
> > for your patch!
>=20
> Turns out it isn't as simple as I thought, as there doesn't seem to
> be an easy way to get to the struct device used for DMA mapping
> from USB drivers.  I'll need to think a bit more how to handle that
> best.

Thank you for your reply. I sent an email on the original report as below.
https://marc.info/?l=3Dlinux-block&m=3D155990883224615&w=3D2

Best regards,
Yoshihiro Shimoda

