Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE
	autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id E658C7D90D
	for <lwn-linux-doc@archive.lwn.net>; Thu, 15 Aug 2019 17:28:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726357AbfHOR2D (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 15 Aug 2019 13:28:03 -0400
Received: from mx0b-002c1b01.pphosted.com ([148.163.155.12]:63298 "EHLO
        mx0b-002c1b01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726203AbfHOR2D (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 15 Aug 2019 13:28:03 -0400
X-Greylist: delayed 845 seconds by postgrey-1.27 at vger.kernel.org; Thu, 15 Aug 2019 13:27:59 EDT
Received: from pps.filterd (m0127844.ppops.net [127.0.0.1])
        by mx0b-002c1b01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id x7FHB5rc011101
        for <linux-doc@vger.kernel.org>; Thu, 15 Aug 2019 10:13:53 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=proofpoint20171006;
 bh=8gtaYTJc3RqkPk1V+PqvxhZ+TAGj2m9OGdWs3ukyz1o=;
 b=FXDPVt65UE/A2i8VMLRIQsiGCKZnFIBePKWwrOEPRMkbnjDEqP5nHzzYaprnLgf7v/Mp
 EYb1H9NeFQTwu1dsMI0ciF9CbWYOxUSfTT9iK2J/2SnCbkNhHOeryqfAWtCMBbqev+Ab
 yBMf3Tgd/ajmFqF1OPjJtKr2dhGAcbJ2tyko0gTBvQ9QiqfebfeH8JV0eV/itAwP2pU6
 AdKUJsqS6O29bYUijnc8O3Rc9nlO7tTPpLGJfdv4mrFYWsRfGEpxDI+VfnD6OR/N48bO
 5MKcQLxT5VyoqYo3w6NaxcKD40CX3jFZNfLDP7s4VXKKqmvwBwRJgEh3OOfaN9k7p+Xd Og== 
Received: from nam01-by2-obe.outbound.protection.outlook.com (mail-by2nam01lp2051.outbound.protection.outlook.com [104.47.34.51])
        by mx0b-002c1b01.pphosted.com with ESMTP id 2ubf9ywubg-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT)
        for <linux-doc@vger.kernel.org>; Thu, 15 Aug 2019 10:13:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cXa7z0Pi6P0mvgoQp62Z94Ov4/69RxlAoIxkLMi5dmaDkcrS5R9BDY1Br/zlZb0PB95IlGWV9D7saQCkPxO2ZxayJucEvaH6f6cJMRlJYGlQnaVC8kk60sUhwjd5RprQD6+MSAVRsCYDG6GFLDR3TyqhDkGEgcIqoX4LgNOx4lSN0BY+291KF2+m/LxwSCtAqfKlZWSTb+cchjAuswE5BjjPQr6e1T/awPbNptQsb8Rf1cTohcNdS7wIXNEW4IrcRlIiK8V5BoNOmurwEuQfwLjJSzC0/DjuAPBv7qRqJycoS39ErAiPCteOgA3p+oZYWb2KQksciomfrPxcnkXWNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8gtaYTJc3RqkPk1V+PqvxhZ+TAGj2m9OGdWs3ukyz1o=;
 b=HIKukCEzOFtxdxycxhWXVx5Kro/KBU4DiUaqol3pKpt1sdLFoxD9ljW+wbCozN/9PAw+RD+yoXcm0aDt5XLzsexfAAyCsBhYNPziEvr0K6T/ETI5hmOHhvUT2GnEEh8xjWEfhfG7neUZglRw219+72rqqr6wUj4Nr6aMpMeDSKPgd3qI17xL+NlEVe8o6p4hoRouHMHiXxmdor133Yn0CLTd21kE9Y8ixEwacdltPKxMDrG298LsUesSa9uHdAgXQh4w4wPDi0Vk+Vty74PyqmT1dfje+5hhRIfb4kGOwpnlvgqKgUry29graXJnia89nz3E+DUgWcxZuwFeImCfSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
Received: from CY4PR0201MB3588.namprd02.prod.outlook.com (52.132.98.38) by
 CY4PR0201MB3508.namprd02.prod.outlook.com (52.132.103.14) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.20; Thu, 15 Aug 2019 17:13:46 +0000
Received: from CY4PR0201MB3588.namprd02.prod.outlook.com
 ([fe80::5598:9f2e:9d39:c737]) by CY4PR0201MB3588.namprd02.prod.outlook.com
 ([fe80::5598:9f2e:9d39:c737%6]) with mapi id 15.20.2157.022; Thu, 15 Aug 2019
 17:13:46 +0000
From:   Florian Schmidt <florian.schmidt@nutanix.com>
To:     "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
CC:     Florian Schmidt <florian.schmidt@nutanix.com>
Subject: [PATCH 1/2] trace-vmscan-postprocess: sync with tracepoints updates
Thread-Topic: [PATCH 1/2] trace-vmscan-postprocess: sync with tracepoints
 updates
Thread-Index: AQHVU4zMp2oDlRiR+kOftsBeVTZeTw==
Date:   Thu, 15 Aug 2019 17:13:46 +0000
Message-ID: <20190815164840.1141-2-florian.schmidt@nutanix.com>
References: <20190815164840.1141-1-florian.schmidt@nutanix.com>
In-Reply-To: <20190815164840.1141-1-florian.schmidt@nutanix.com>
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
x-ms-office365-filtering-correlation-id: 3555941a-05b2-416b-aa1f-08d721a3eec6
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:CY4PR0201MB3508;
x-ms-traffictypediagnostic: CY4PR0201MB3508:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CY4PR0201MB3508A19855462D34912BA7DCF7AC0@CY4PR0201MB3508.namprd02.prod.outlook.com>
x-proofpoint-crosstenant: true
x-ms-oob-tlc-oobclassifiers: OLM:2089;
x-forefront-prvs: 01304918F3
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(396003)(136003)(366004)(39860400002)(346002)(376002)(189003)(199004)(476003)(14444005)(76176011)(6506007)(2906002)(26005)(6436002)(2501003)(4326008)(99286004)(186003)(36756003)(386003)(1076003)(6116002)(446003)(107886003)(52116002)(8936002)(11346002)(50226002)(256004)(5660300002)(86362001)(102836004)(2616005)(6916009)(25786009)(5640700003)(8676002)(316002)(14454004)(6512007)(66946007)(66476007)(6486002)(64756008)(486006)(66446008)(7736002)(305945005)(66556008)(71190400001)(44832011)(66066001)(478600001)(3846002)(53936002)(81166006)(81156014)(2351001)(15650500001)(71200400001)(64030200001);DIR:OUT;SFP:1102;SCL:1;SRVR:CY4PR0201MB3508;H:CY4PR0201MB3588.namprd02.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nutanix.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 0t3tfi2IPY+M0VjXWE3uupezWMJQ+0D73Y8vttRAQqVobYuMk8l4YlLT061VRy9ga7QUfxrQ6ws/FXsngHvUVcwZzVLK42n3cr1PJVgB2b9Dd2lclpKmQKH5fHoOZS2v/Kq86lPAcPubNKSrF9QRa09WnDQbVzPmZDMoqXxAgmJE7fCXUE9Os4hJvkBfRDxnD01uaCIh6Im9eTzf9U97taxEZR40HuaM4Bf/rNkd85NLwuC5ZVCv6bu9MvEL2MkyB0BtsucU/QOgKzBFgxRjdWFRAYx0HIwzZEYKbZ7eg8iy/2q5r8WddqvcLc3E+mmjcDFYsT1cZRouF7lRTVwZ+L5ksXQvH7BPL+1rwDzxCkM6DAEZSGFLzBh5FeNBHwawpcxHKPzHX3ldXCeDOdMPysS4SaWBq4DwnSmaWcvfqy0=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3555941a-05b2-416b-aa1f-08d721a3eec6
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Aug 2019 17:13:46.7106
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zpEsKCu8J66VdrhF7AvkB1DDyw8+cGMITtxmSJ5OVzaE+3HlbDA3cavRXvPf00ZQuT+hxsQG0UhsHAlIo6F1heAnPj9U75FBPYEIElkk2RA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR0201MB3508
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:5.22.84,1.0.8
 definitions=2019-08-15_07:2019-08-14,2019-08-15 signatures=0
X-Proofpoint-Spam-Reason: safe
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

bW1fdm1zY2FuX3tkaXJlY3RfcmVjbGFpbV9iZWdpbix3YWtldXBfa3N3YXBkLGxydV9pc29sYXRl
LGxydV9zaHJpbmtfYWN0aXZlfQ0KY2hhbmdlZCB0aGVpciBvdXRwdXQgdG8gdGhlIHBvaW50IHdo
ZXJlIHRoZSBzY3JpcHQgdGhyb3dzIHdhcm5pbmdzIGFuZA0KZXJyb3JzLiBVcGRhdGUgaXQgdG8g
YmUgcHJvcGVybHkgaW4gbGluZSB3aXRoIHRob3NlIGNoYW5nZXMuDQoNClNpZ25lZC1vZmYtYnk6
IEZsb3JpYW4gU2NobWlkdCA8Zmxvcmlhbi5zY2htaWR0QG51dGFuaXguY29tPg0KLS0tDQogLi4u
L3Bvc3Rwcm9jZXNzL3RyYWNlLXZtc2Nhbi1wb3N0cHJvY2Vzcy5wbCAgIHwgMjMgKysrKysrKysr
LS0tLS0tLS0tLQ0KIDEgZmlsZSBjaGFuZ2VkLCAxMSBpbnNlcnRpb25zKCspLCAxMiBkZWxldGlv
bnMoLSkNCg0KZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vdHJhY2UvcG9zdHByb2Nlc3MvdHJh
Y2Utdm1zY2FuLXBvc3Rwcm9jZXNzLnBsIGIvRG9jdW1lbnRhdGlvbi90cmFjZS9wb3N0cHJvY2Vz
cy90cmFjZS12bXNjYW4tcG9zdHByb2Nlc3MucGwNCmluZGV4IDk5NWRhMTViMTZjYS4uNmM0ZTNm
ZGU5NDQ3IDEwMDY0NA0KLS0tIGEvRG9jdW1lbnRhdGlvbi90cmFjZS9wb3N0cHJvY2Vzcy90cmFj
ZS12bXNjYW4tcG9zdHByb2Nlc3MucGwNCisrKyBiL0RvY3VtZW50YXRpb24vdHJhY2UvcG9zdHBy
b2Nlc3MvdHJhY2Utdm1zY2FuLXBvc3Rwcm9jZXNzLnBsDQpAQCAtMTA3LDE0ICsxMDcsMTQgQEAg
R2V0T3B0aW9ucygNCiApOw0KIA0KICMgRGVmYXVsdHMgZm9yIGR5bmFtaWNhbGx5IGRpc2NvdmVy
ZWQgcmVnZXgncw0KLW15ICRyZWdleF9kaXJlY3RfYmVnaW5fZGVmYXVsdCA9ICdvcmRlcj0oWzAt
OV0qKSBtYXlfd3JpdGVwYWdlPShbMC05XSopIGdmcF9mbGFncz0oW0EtWl98XSopJzsNCitteSAk
cmVnZXhfZGlyZWN0X2JlZ2luX2RlZmF1bHQgPSAnb3JkZXI9KFswLTldKikgZ2ZwX2ZsYWdzPShb
QS1aX3xdKiknOw0KIG15ICRyZWdleF9kaXJlY3RfZW5kX2RlZmF1bHQgPSAnbnJfcmVjbGFpbWVk
PShbMC05XSopJzsNCiBteSAkcmVnZXhfa3N3YXBkX3dha2VfZGVmYXVsdCA9ICduaWQ9KFswLTld
Kikgb3JkZXI9KFswLTldKiknOw0KIG15ICRyZWdleF9rc3dhcGRfc2xlZXBfZGVmYXVsdCA9ICdu
aWQ9KFswLTldKiknOw0KLW15ICRyZWdleF93YWtldXBfa3N3YXBkX2RlZmF1bHQgPSAnbmlkPShb
MC05XSopIHppZD0oWzAtOV0qKSBvcmRlcj0oWzAtOV0qKSBnZnBfZmxhZ3M9KFtBLVpffF0qKSc7
DQotbXkgJHJlZ2V4X2xydV9pc29sYXRlX2RlZmF1bHQgPSAnaXNvbGF0ZV9tb2RlPShbMC05XSop
IGNsYXNzem9uZV9pZHg9KFswLTldKikgb3JkZXI9KFswLTldKikgbnJfcmVxdWVzdGVkPShbMC05
XSopIG5yX3NjYW5uZWQ9KFswLTldKikgbnJfc2tpcHBlZD0oWzAtOV0qKSBucl90YWtlbj0oWzAt
OV0qKSBscnU9KFthLXpfXSopJzsNCitteSAkcmVnZXhfd2FrZXVwX2tzd2FwZF9kZWZhdWx0ID0g
J25pZD0oWzAtOV0qKSBvcmRlcj0oWzAtOV0qKSBnZnBfZmxhZ3M9KFtBLVpffF0qKSc7DQorbXkg
JHJlZ2V4X2xydV9pc29sYXRlX2RlZmF1bHQgPSAnaXNvbGF0ZV9tb2RlPShbMC05XSopIGNsYXNz
em9uZT0oWzAtOV0qKSBvcmRlcj0oWzAtOV0qKSBucl9yZXF1ZXN0ZWQ9KFswLTldKikgbnJfc2Nh
bm5lZD0oWzAtOV0qKSBucl9za2lwcGVkPShbMC05XSopIG5yX3Rha2VuPShbMC05XSopIGxydT0o
W2Etel9dKiknOw0KIG15ICRyZWdleF9scnVfc2hyaW5rX2luYWN0aXZlX2RlZmF1bHQgPSAnbmlk
PShbMC05XSopIG5yX3NjYW5uZWQ9KFswLTldKikgbnJfcmVjbGFpbWVkPShbMC05XSopIG5yX2Rp
cnR5PShbMC05XSopIG5yX3dyaXRlYmFjaz0oWzAtOV0qKSBucl9jb25nZXN0ZWQ9KFswLTldKikg
bnJfaW1tZWRpYXRlPShbMC05XSopIG5yX2FjdGl2YXRlX2Fub249KFswLTldKikgbnJfYWN0aXZh
dGVfZmlsZT0oWzAtOV0qKSBucl9yZWZfa2VlcD0oWzAtOV0qKSBucl91bm1hcF9mYWlsPShbMC05
XSopIHByaW9yaXR5PShbMC05XSopIGZsYWdzPShbQS1aX3xdKiknOw0KLW15ICRyZWdleF9scnVf
c2hyaW5rX2FjdGl2ZV9kZWZhdWx0ID0gJ2xydT0oW0EtWl9dKikgbnJfc2Nhbm5lZD0oWzAtOV0q
KSBucl9yb3RhdGVkPShbMC05XSopIHByaW9yaXR5PShbMC05XSopJzsNCitteSAkcmVnZXhfbHJ1
X3Nocmlua19hY3RpdmVfZGVmYXVsdCA9ICduaWQ9KFswLTldKikgbnJfYWN0aXZlPShbMC05XSop
IG5yX2RlYWN0aXZhdGVkPShbMC05XSopIG5yX3JlZmVyZW5jZWQ9KFswLTldKikgcHJpb3JpdHk9
KFswLTldKikgZmxhZ3M9KFtBLVpfXSopJzsNCiBteSAkcmVnZXhfd3JpdGVwYWdlX2RlZmF1bHQg
PSAncGFnZT0oWzAtOWEtZl0qKSBwZm49KFswLTldKikgZmxhZ3M9KFtBLVpffF0qKSc7DQogDQog
IyBEeWFuaWNhbGx5IGRpc2NvdmVyZWQgcmVnZXgNCkBAIC0xODQsOCArMTg0LDcgQEAgc3ViIGdl
bmVyYXRlX3RyYWNlZXZlbnRfcmVnZXggew0KICRyZWdleF9kaXJlY3RfYmVnaW4gPSBnZW5lcmF0
ZV90cmFjZWV2ZW50X3JlZ2V4KA0KIAkJCSJ2bXNjYW4vbW1fdm1zY2FuX2RpcmVjdF9yZWNsYWlt
X2JlZ2luIiwNCiAJCQkkcmVnZXhfZGlyZWN0X2JlZ2luX2RlZmF1bHQsDQotCQkJIm9yZGVyIiwg
Im1heV93cml0ZXBhZ2UiLA0KLQkJCSJnZnBfZmxhZ3MiKTsNCisJCQkib3JkZXIiLCAiZ2ZwX2Zs
YWdzIik7DQogJHJlZ2V4X2RpcmVjdF9lbmQgPSBnZW5lcmF0ZV90cmFjZWV2ZW50X3JlZ2V4KA0K
IAkJCSJ2bXNjYW4vbW1fdm1zY2FuX2RpcmVjdF9yZWNsYWltX2VuZCIsDQogCQkJJHJlZ2V4X2Rp
cmVjdF9lbmRfZGVmYXVsdCwNCkBAIC0yMDEsMTEgKzIwMCwxMSBAQCAkcmVnZXhfa3N3YXBkX3Ns
ZWVwID0gZ2VuZXJhdGVfdHJhY2VldmVudF9yZWdleCgNCiAkcmVnZXhfd2FrZXVwX2tzd2FwZCA9
IGdlbmVyYXRlX3RyYWNlZXZlbnRfcmVnZXgoDQogCQkJInZtc2Nhbi9tbV92bXNjYW5fd2FrZXVw
X2tzd2FwZCIsDQogCQkJJHJlZ2V4X3dha2V1cF9rc3dhcGRfZGVmYXVsdCwNCi0JCQkibmlkIiwg
InppZCIsICJvcmRlciIsICJnZnBfZmxhZ3MiKTsNCisJCQkibmlkIiwgIm9yZGVyIiwgImdmcF9m
bGFncyIpOw0KICRyZWdleF9scnVfaXNvbGF0ZSA9IGdlbmVyYXRlX3RyYWNlZXZlbnRfcmVnZXgo
DQogCQkJInZtc2Nhbi9tbV92bXNjYW5fbHJ1X2lzb2xhdGUiLA0KIAkJCSRyZWdleF9scnVfaXNv
bGF0ZV9kZWZhdWx0LA0KLQkJCSJpc29sYXRlX21vZGUiLCAiY2xhc3N6b25lX2lkeCIsICJvcmRl
ciIsDQorCQkJImlzb2xhdGVfbW9kZSIsICJjbGFzc3pvbmUiLCAib3JkZXIiLA0KIAkJCSJucl9y
ZXF1ZXN0ZWQiLCAibnJfc2Nhbm5lZCIsICJucl9za2lwcGVkIiwgIm5yX3Rha2VuIiwNCiAJCQki
bHJ1Iik7DQogJHJlZ2V4X2xydV9zaHJpbmtfaW5hY3RpdmUgPSBnZW5lcmF0ZV90cmFjZWV2ZW50
X3JlZ2V4KA0KQEAgLTIxOCw5ICsyMTcsOSBAQCAkcmVnZXhfbHJ1X3Nocmlua19pbmFjdGl2ZSA9
IGdlbmVyYXRlX3RyYWNlZXZlbnRfcmVnZXgoDQogJHJlZ2V4X2xydV9zaHJpbmtfYWN0aXZlID0g
Z2VuZXJhdGVfdHJhY2VldmVudF9yZWdleCgNCiAJCQkidm1zY2FuL21tX3Ztc2Nhbl9scnVfc2hy
aW5rX2FjdGl2ZSIsDQogCQkJJHJlZ2V4X2xydV9zaHJpbmtfYWN0aXZlX2RlZmF1bHQsDQotCQkJ
Im5pZCIsICJ6aWQiLA0KLQkJCSJscnUiLA0KLQkJCSJucl9zY2FubmVkIiwgIm5yX3JvdGF0ZWQi
LCAicHJpb3JpdHkiKTsNCisJCQkibmlkIiwNCisJCQkibnJfdGFrZW4iLCAibnJfYWN0aXZlIiwg
Im5yX2RlYWN0aXZhdGVkIiwgIm5yX3JlZmVyZW5jZWQiLA0KKwkJCSJwcmlvcml0eSIsICJmbGFn
cyIpOw0KICRyZWdleF93cml0ZXBhZ2UgPSBnZW5lcmF0ZV90cmFjZWV2ZW50X3JlZ2V4KA0KIAkJ
CSJ2bXNjYW4vbW1fdm1zY2FuX3dyaXRlcGFnZSIsDQogCQkJJHJlZ2V4X3dyaXRlcGFnZV9kZWZh
dWx0LA0KQEAgLTM3MSw3ICszNzAsNyBAQCBFVkVOVF9QUk9DRVNTOg0KIAkJCQlwcmludCAiICAg
ICAgICAgJHJlZ2V4X3dha2V1cF9rc3dhcGRcbiI7DQogCQkJCW5leHQ7DQogCQkJfQ0KLQkJCW15
ICRvcmRlciA9ICQzOw0KKwkJCW15ICRvcmRlciA9ICQyOw0KIAkJCSRwZXJwcm9jZXNzcGlkeyRw
cm9jZXNzX3BpZH0tPntNTV9WTVNDQU5fV0FLRVVQX0tTV0FQRF9QRVJPUkRFUn1bJG9yZGVyXSsr
Ow0KIAkJfSBlbHNpZiAoJHRyYWNlcG9pbnQgZXEgIm1tX3Ztc2Nhbl9scnVfaXNvbGF0ZSIpIHsN
CiAJCQkkZGV0YWlscyA9ICQ2Ow0KLS0gDQoyLjIzLjAucmMxDQoNCg==
