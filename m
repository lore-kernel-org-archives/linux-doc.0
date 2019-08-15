Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE
	autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 6E6087D2F0
	for <lwn-linux-doc@archive.lwn.net>; Thu, 15 Aug 2019 17:40:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726099AbfHORkP (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 15 Aug 2019 13:40:15 -0400
Received: from mx0a-002c1b01.pphosted.com ([148.163.151.68]:28000 "EHLO
        mx0a-002c1b01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726001AbfHORkO (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 15 Aug 2019 13:40:14 -0400
X-Greylist: delayed 1588 seconds by postgrey-1.27 at vger.kernel.org; Thu, 15 Aug 2019 13:40:14 EDT
Received: from pps.filterd (m0127838.ppops.net [127.0.0.1])
        by mx0a-002c1b01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id x7FHAoHL026139
        for <linux-doc@vger.kernel.org>; Thu, 15 Aug 2019 10:13:45 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com; h=from : to : cc :
 subject : date : message-id : content-type : content-transfer-encoding :
 mime-version; s=proofpoint20171006;
 bh=TZ8nGziQlW+a5wDYdKs45iTjnMlJb/mQyXTuDUvImg8=;
 b=H+jRBI864+mo5+itdeSRh9PQC48mz+KMokCoYTCn+Z65bup/R88VwJHphJv2/vA4psqf
 uTL2ab31NCI0dw2wMiSyWdxeHcpq1joogNwu1OnaPgvVf1uKFl57ieQB1U2Oj5oec4S7
 d15GTSOt+hMynMCQpU+YhdMSdq5X2MKwAehViFSyk6styXmdyQkzkbeBv7D+91gliLG3
 SPyfNBgeZvX4zLXogOrbUkXCSjoMF2dros+ZDAVE6a1eeavgL4SFyFaMZO/Os189uZw9
 xC7R5bfTwvww/KoH6wxJYGvUXdWIDgYnoWeDlka6srpsH/g8ok8U4MoRxCWQ+ZpHitS9 Tg== 
Received: from nam04-sn1-obe.outbound.protection.outlook.com (mail-sn1nam04lp2055.outbound.protection.outlook.com [104.47.44.55])
        by mx0a-002c1b01.pphosted.com with ESMTP id 2ubf9u62a2-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT)
        for <linux-doc@vger.kernel.org>; Thu, 15 Aug 2019 10:13:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MljO8kXvMgHvu/0DavwuMTTfsf9nnfJKgZSh5Kz4oxRfjg0bGSNKDg9MJAhhtu3Y+K68akTPcJMd+ZJEdeJWtoR0pABqoplVgNLM1becjvG/QOmhWqR9qiYryeblkynBD8gOq5VV08bsdyXN3wrZgz4T6kCPMdh+orENVJwOPYT5fMJcVEn4N96IlfC7q+9uEuX3LlcrbcL6/X1A5Q+4RASbF7qIrIafbAvBsgZxjJfyXZpL7IXzyFLH9EFgxEvUIIlsRsgOdS0AyJVklSmqmIiiWcljDodd18KQpJfmnK9iiYguI5GqXjftYSNZcmZs4HAhHw8ZUurZThPGZzDp5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TZ8nGziQlW+a5wDYdKs45iTjnMlJb/mQyXTuDUvImg8=;
 b=Q9oiL38wFIxemWnK9NrsYcGHRu9Sk/kqLC7rddC5ChtV4OwSb9w5i5kciTkhJRDZAbiAxfy513qGhnhTOa3NPtrThPcwG3qh9m7EHeVBvhZxQmsKte0CAkTHynjv2qHzOoZncq4+aHNVRPxtmSbswFskSld4UAb047bWEPHIfuBvECCAF4hIXlXnSpoC1D6OHgX20IXNieY9oR0+1B0uEo7BPif/TzZ0JpGKil3NHL1vAvY/w8AJIcxEz5L4wByhlcl9n1Q4f47GQGPRy5skvTGCFicmTaq5jfppxCeyJ8/rZ/tsNcsxvmPyVqsE92ik7THKs3FaSjf5XNj0Pl7njw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
Received: from CY4PR0201MB3588.namprd02.prod.outlook.com (52.132.98.38) by
 CY4PR0201MB3603.namprd02.prod.outlook.com (52.132.99.21) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.16; Thu, 15 Aug 2019 17:13:44 +0000
Received: from CY4PR0201MB3588.namprd02.prod.outlook.com
 ([fe80::5598:9f2e:9d39:c737]) by CY4PR0201MB3588.namprd02.prod.outlook.com
 ([fe80::5598:9f2e:9d39:c737%6]) with mapi id 15.20.2157.022; Thu, 15 Aug 2019
 17:13:44 +0000
From:   Florian Schmidt <florian.schmidt@nutanix.com>
To:     "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
CC:     Florian Schmidt <florian.schmidt@nutanix.com>
Subject: [PATCH 0/2] trace-vmscan-postprocess: fix parsing and output
Thread-Topic: [PATCH 0/2] trace-vmscan-postprocess: fix parsing and output
Thread-Index: AQHVU4zK/xYOpq66nUS8+AEUJAsN0A==
Date:   Thu, 15 Aug 2019 17:13:43 +0000
Message-ID: <20190815164840.1141-1-florian.schmidt@nutanix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM3PR07CA0145.eurprd07.prod.outlook.com
 (2603:10a6:207:8::31) To CY4PR0201MB3588.namprd02.prod.outlook.com
 (2603:10b6:910:8b::38)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.23.0.rc1
x-originating-ip: [62.254.189.133]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 76ee8170-d12a-46b1-a83f-08d721a3ecb3
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:CY4PR0201MB3603;
x-ms-traffictypediagnostic: CY4PR0201MB3603:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CY4PR0201MB360304DE1BBED23C54EEC293F7AC0@CY4PR0201MB3603.namprd02.prod.outlook.com>
x-proofpoint-crosstenant: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 01304918F3
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(396003)(136003)(376002)(346002)(366004)(39850400004)(199004)(54094003)(189003)(2906002)(8676002)(86362001)(8936002)(6506007)(50226002)(6486002)(25786009)(66066001)(81156014)(81166006)(71190400001)(2616005)(476003)(66556008)(36756003)(64756008)(66446008)(26005)(71200400001)(186003)(256004)(386003)(7736002)(66946007)(6916009)(305945005)(102836004)(2501003)(5660300002)(66476007)(3846002)(6116002)(107886003)(5640700003)(6436002)(52116002)(44832011)(53936002)(1076003)(486006)(99286004)(2351001)(316002)(478600001)(6512007)(4326008)(14454004)(64030200001);DIR:OUT;SFP:1102;SCL:1;SRVR:CY4PR0201MB3603;H:CY4PR0201MB3588.namprd02.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nutanix.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: +75h0lWdYemawUbJqmK4HNToWv+5haYbb8Q5DCeRR3Ei2Zl77vtg3s89hdJ7nAQPbuFQSQOh780uxpZbgj/xqNaEgD6jKFICoxYiBqMD4ROlusK1Qxn4iip5U291MR7aURSvax51pDJ0ToEjJ6AZ9dtta77tb8VGMuIcKvM/+LhOAU9SJ6yt7Dy+uBHnhNIHgL7S1TOso2kq2xCW89DeHTPnre28wws528i5TWjDZ6RovqvlfK74bh48y2I0wAsns1q0iIUzMK14fEOalRUO58Wl1mWPgZrpAtLQy7e2q/5ZDWaHaPid3unTK5yJ774F0bvRLXfJQuQ9zJK30azhEjUJYszya4lNUMXWJUkfl5qS9XdxSpsN1AcdQC9LEPjku/PsT6EwNCl34I0GeAg5FDOWR3M2p8NjRFigrqpB7/Q=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 76ee8170-d12a-46b1-a83f-08d721a3ecb3
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Aug 2019 17:13:43.3525
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tYX5/d2fFbvqnb18ineRkM6LMihQrmbFE0ldUQmrLPWXmvqV4crOVzc8ByYoTsVuNjC3Kt0lhpYD4b1NKani3/RRA7i9XS/f7+jQFOZRaPY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR0201MB3603
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:5.22.84,1.0.8
 definitions=2019-08-15_07:2019-08-14,2019-08-15 signatures=0
X-Proofpoint-Spam-Reason: safe
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

VGhpcyBwYXRjaCBzZXJpZXMgdXBkYXRlcyB0cmFjZS12bXNjYW4tcG9zdHByb2Nlc3MucGwgdG8g
d29yayB3aXRob3V0DQp0aHJvd2luZyB3YXJuaW5ncyBhbmQgZXJyb3JzIHdoaWNoIHN0ZW0gZnJv
bSB1cGRhdGVzIHRvIHNldmVyYWwgdHJhY2UNCnBvaW50cy4NCg0KMzQ4MWMzN2ZmYTFkICgibW0v
dm1zY2FuOiBkcm9wIG1heV93cml0ZXBhZ2UgYW5kIGNsYXNzem9uZV9pZHggZnJvbQ0KZGlyZWN0
IHJlY2xhaW0gYmVnaW4gdGVtcGxhdGUiKSByZW1vdmVkICJtYXlfd3JpdGVwYWdlIiBmcm9tDQpt
bV92bXNjYW5fZGlyZWN0X3JlY2xhaW1fYmVnaW4sIGFuZCAzYjc3NTk5OGVjYTcNCigiaW5jbHVk
ZS90cmFjZS9ldmVudHMvdm1zY2FuLmg6IGRyb3Agem9uZSBpZCBmcm9tIGtzd2FwZCB0cmFjZXBv
aW50cyIpDQpyZW1vdmVkICJ6aWQiIGZyb20gbW1fdm1zY2FuX3dha2V1cF9rc3dhcGQuIFRoZSBv
dXRwdXQgb2YNCm1tX3Ztc2Nhbl9scnVfaXNvbGF0ZSBhbmQgbW1fdm1zY2FuX2xydV9zaHJpbmtf
YWN0aXZlIHNlZW1zIHRvIG5ldmVyDQpoYXZlIG1hdGNoZWQgdGhlIGZvcm1hdCBvZiB0aGUgdHJh
Y2UgcG9pbnQgb3V0cHV0IHNpbmNlIHRoZXkgd2VyZQ0KY3JlYXRlZCwgb3IgYXQgbGVhc3QgZm9y
IGFzIGxvbmcgYXMgSSBjYW4gdGVsbC4gUGF0Y2ggMSBhbGlnbnMgdGhlDQpmb3JtYXQgcGFyc2lu
ZyBvZiB0aGUgcGVybCBzY3JpcHQgd2l0aCB0aGUgY3VycmVudCBvdXRwdXQgb2YgdGhlIHRyYWNl
DQpwb2ludHMuDQoNCkluIGFkZGl0aW9uLCB0aGUgdGFibGVzIHRoYXQgYXJlIHByaW50ZWQgYnkg
dGhlIHNjcmlwdCB3ZXJlIG5vdCBwcm9wZXJseQ0KYWxpZ25lZCBhbnkgbW9yZSwgc28gcGF0Y2gg
MiBmaXhlcyB0aGUgc3BhY2luZy4NCg0KQSBzaWRlIHJlbWFyazogcGFyc2luZyB0aGUgdHJhY2Ug
b3V0cHV0IGZvciBtbV92bXNjYW5fbHJ1X3Nocmlua19hY3RpdmUNCmhhcyBiZWVuIGluIHRoZSBz
Y3JpcHQgZXZlciBzaW5jZSBpdCB3YXMgY3JlYXRlZCBpbiAyMDEwLCBidXQgYXQgbm8NCnBvaW50
IHRoZSBwYXJzZWQgb3V0cHV0IHdhcyBldmVyIHVzZWQgZm9yIGFueXRoaW5nLiBJIHVwZGF0ZWQg
dGhlDQpwYXJzaW5nIGNvZGUgbm93LCBidXQgSSB3b25kZXIgaWYgd2UgY291bGQganVzdCBnZXQg
cmlkIG9mIHRoYXQgcGFydC4uLg0KDQpGbG9yaWFuIFNjaG1pZHQgKDIpOg0KICB0cmFjZS12bXNj
YW4tcG9zdHByb2Nlc3M6IHN5bmMgd2l0aCB0cmFjZXBvaW50cyB1cGRhdGVzDQogIHRyYWNlLXZt
c2Nhbi1wb3N0cHJvY2VzczogZml4IG91dHB1dCB0YWJsZSBzcGFjaW5nDQoNCiAuLi4vcG9zdHBy
b2Nlc3MvdHJhY2Utdm1zY2FuLXBvc3Rwcm9jZXNzLnBsICAgfCAyOSArKysrKysrKystLS0tLS0t
LS0tDQogMSBmaWxlIGNoYW5nZWQsIDE0IGluc2VydGlvbnMoKyksIDE1IGRlbGV0aW9ucygtKQ0K
DQotLSANCjIuMjMuMC5yYzENCg0K
