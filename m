Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	UNPARSEABLE_RELAY autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id D98517D2F0
	for <lwn-linux-doc@archive.lwn.net>; Mon, 16 Sep 2019 13:03:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732949AbfIPNDN convert rfc822-to-8bit (ORCPT
        <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 16 Sep 2019 09:03:13 -0400
Received: from m4a0041g.houston.softwaregrp.com ([15.124.2.87]:55239 "EHLO
        m4a0041g.houston.softwaregrp.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1732944AbfIPNDN (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 16 Sep 2019 09:03:13 -0400
Received: FROM m4a0041g.houston.softwaregrp.com (15.120.17.146) BY m4a0041g.houston.softwaregrp.com WITH ESMTP;
 Mon, 16 Sep 2019 13:02:15 +0000
Received: from M9W0067.microfocus.com (2002:f79:be::f79:be) by
 M4W0334.microfocus.com (2002:f78:1192::f78:1192) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Mon, 16 Sep 2019 13:01:42 +0000
Received: from NAM02-CY1-obe.outbound.protection.outlook.com (15.124.72.14) by
 M9W0067.microfocus.com (15.121.0.190) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Mon, 16 Sep 2019 13:01:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kyUHdkt/DtuaRfLxo1V2M76b03h/bdYtxDKhO7pzj/TEBQiQ0aG4qktxQfnCHhWDdFOYssVx+l3C5eJwgkokw0FsmrsN8T48kEttpzoN0Yo5fohL0CwN5IL7xxDnchUjQ7VU6RpzN/UFB/q0YUpcVSKtigboKGJJAqahGFANMpV3Mg8RK8CvXuxVUuIrniIHzpMLIeOHZ7VV8EZD2aXs8oqtJEVNCE9eWtnm1muB1rAoU3GT2l9UC6UlbV+i6exrO2gCGgn5SSqQiXLMGMH10RKkSLOQNquNDdqqz4Ejac9WPQgQsX3KyOa+m5MrhDirLVTYE4SeF69EUH00ciBMCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZJzbtO+8DbDtDULUkK/z78sY8LsHdZJV0hdUsRqhYMw=;
 b=J0FDN5qjqJmgBPlKCBSpK7ZTAT1Jvm3qDG90mKpEHtyGN1tuSz7gtyxHbRlSF7P6ZfkvFt+fG6GQqmPfSs2ZCGUr1ChDg3CR5R05ZSlXh1uTp40pSdzYizYbweyYu6eb3mygJZBcC9alStL3tLObiuTZQB1KD0WqJc13Bn9AZ5GDHclI47PMVn7i8YlnhE7UFnq/XgIEzQ1+k/0Oiiv+bw7ASQT/DT30sZJ1leLOxWhHt0yTK/ihVRZW6rHsMD2nGxLzQvAff+zQns0YnxVoVWI2/zhdqOsuUeeh9my6Tmz3mUPd0hF2pLDMDVeC2gxm95oY2z4yxMlo9H9AaSkWmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Received: from BY5PR18MB3283.namprd18.prod.outlook.com (10.255.139.203) by
 BY5PR18MB3348.namprd18.prod.outlook.com (10.255.136.15) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2263.15; Mon, 16 Sep 2019 13:01:40 +0000
Received: from BY5PR18MB3283.namprd18.prod.outlook.com
 ([fe80::a46b:1f66:8378:b25e]) by BY5PR18MB3283.namprd18.prod.outlook.com
 ([fe80::a46b:1f66:8378:b25e%3]) with mapi id 15.20.2241.022; Mon, 16 Sep 2019
 13:01:40 +0000
From:   Chester Lin <clin@suse.com>
To:     "corbet@lwn.net" <corbet@lwn.net>,
        "paul.walmsley@sifive.com" <paul.walmsley@sifive.com>,
        "palmer@sifive.com" <palmer@sifive.com>,
        "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>,
        "atish.patra@wdc.com" <atish.patra@wdc.com>
CC:     "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
        "Chester Lin" <clin@suse.com>
Subject: [PATCH] riscv-docs: correct the sequence of the magic number 2 since
 it's little endian
Thread-Topic: [PATCH] riscv-docs: correct the sequence of the magic number 2
 since it's little endian
Thread-Index: AQHVbI7hrgDiRPdaXUuZ8DxMADjVng==
Date:   Mon, 16 Sep 2019 13:01:40 +0000
Message-ID: <20190916130108.31404-1-clin@suse.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB6PR0802CA0036.eurprd08.prod.outlook.com
 (2603:10a6:4:a3::22) To BY5PR18MB3283.namprd18.prod.outlook.com
 (2603:10b6:a03:196::11)
authentication-results: spf=none (sender IP is ) smtp.mailfrom=clin@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.22.0
x-originating-ip: [213.151.95.130]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0e1d073a-d523-4e81-f07c-08d73aa603e8
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);SRVR:BY5PR18MB3348;
x-ms-traffictypediagnostic: BY5PR18MB3348:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BY5PR18MB33484D948733C72A648C3051AD8C0@BY5PR18MB3348.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4714;
x-forefront-prvs: 0162ACCC24
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(4636009)(39860400002)(376002)(136003)(346002)(366004)(396003)(199004)(189003)(71190400001)(6486002)(4326008)(7736002)(53936002)(2201001)(86362001)(71200400001)(102836004)(6506007)(386003)(26005)(5660300002)(50226002)(14444005)(2501003)(256004)(316002)(4744005)(110136005)(1076003)(3846002)(54906003)(6436002)(6512007)(478600001)(6116002)(52116002)(476003)(36756003)(186003)(107886003)(8936002)(8676002)(66066001)(305945005)(64756008)(25786009)(99286004)(66476007)(14454004)(66446008)(66946007)(2616005)(81166006)(81156014)(66556008)(2171002)(2906002)(486006);DIR:OUT;SFP:1102;SCL:1;SRVR:BY5PR18MB3348;H:BY5PR18MB3283.namprd18.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: U+io3rnCquLqzyelA6ayNhDqh7OwK3se8+JLr9IMe+2J/AghkDzdC2fcEQ6i0zpRhqaC7nk2Z0FxKLs7BmTUuNuBjCC6xILgk/u2i8PyCMCJ5a5YJspqVkgexbPLHSg5fSdDh6j06XWsqngV1zVmvMM0+vrvsF1sbo7rR8vKiGRgf+sKWY5vU0QmteGgaS8yPvyV7bA7k7g4aA9Ur6ztMLDufUsr1MtNWtdWMdOx2H4ZfkJTK0pJiGtUERnl9IbZKeKP+rKve2qvVdWBldkuELyGaltdvvfR3YVMHLZctxgbu0TdkIfGaZMwSj8NmkKXdb5tzI5NKj6A8Qu7GRrubyoXeQMSucBvGhvz6WyjHhNccroehG/JjyKxqSATtX3Xf/hj/i1n2A2BTqfZe54Xh3PDilT+RCQ8VNgPqM/F/DA=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e1d073a-d523-4e81-f07c-08d73aa603e8
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Sep 2019 13:01:40.5261
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xX3KOoHnl3oNykF7JiQokIJGOXZDJfesAz8wP3NNcREHdeOoJA1ZGXOq3ShAKO6n
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR18MB3348
X-OriginatorOrg: suse.com
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Correct the sequence of the magic number 2 since it's little endian.

Signed-off-by: Chester Lin <clin@suse.com>
---
 Documentation/riscv/boot-image-header.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/riscv/boot-image-header.txt b/Documentation/riscv/boot-image-header.txt
index 14b1492f689b..f388805aa5c3 100644
--- a/Documentation/riscv/boot-image-header.txt
+++ b/Documentation/riscv/boot-image-header.txt
@@ -18,7 +18,7 @@ The following 64-byte header is present in decompressed Linux kernel image.
 	u32 res1  = 0;		  /* Reserved */
 	u64 res2  = 0;    	  /* Reserved */
 	u64 magic = 0x5643534952; /* Magic number, little endian, "RISCV" */
-	u32 magic2 = 0x56534905;  /* Magic number 2, little endian, "RSC\x05" */
+	u32 magic2 = 0x05435352;  /* Magic number 2, little endian, "RSC\x05" */
 	u32 res4;		  /* Reserved for PE COFF offset */
 
 This header format is compliant with PE/COFF header and largely inspired from
-- 
2.22.0

