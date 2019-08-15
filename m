Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE
	autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 1181E7D2F0
	for <lwn-linux-doc@archive.lwn.net>; Thu, 15 Aug 2019 17:43:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730938AbfHORnw (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 15 Aug 2019 13:43:52 -0400
Received: from mx0b-002c1b01.pphosted.com ([148.163.155.12]:47178 "EHLO
        mx0b-002c1b01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730323AbfHORnw (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 15 Aug 2019 13:43:52 -0400
Received: from pps.filterd (m0127841.ppops.net [127.0.0.1])
        by mx0b-002c1b01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id x7FHAwnS024897
        for <linux-doc@vger.kernel.org>; Thu, 15 Aug 2019 10:14:07 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=proofpoint20171006;
 bh=2eShb8ZVlR1djqEtIBM+AQMVA3y9uR2hZbvS4ztCLHg=;
 b=XNYoEimF7bbxDw9xOh2r//8T+ODqu8UqnKTnZQG2+SDV6yno5NBUhJNw0v0rnVLODKPg
 GpDxY+jX7+fzVEANKIHN/1+gk203/u24SAnth3oRpfeczjlRGlQj/m0mY1H3thGtwAun
 fvCAHRL1Qq/PbKxh02qe3NcH/s4tX1Tcrudvp2uDJ+Im2Sj71BnbIDiPmWRfT0rwfupu
 6OmvVh4kNPlzuyH52L3hL7VkqrDI1cB1/K94fhmDCC8Tl4KICjVWmdSt4E9Q38rbfLjo
 Q+eYe8WRV1oQiAoyFs+SNqdaRIuJHJbjUjsbRX03m0iU8YQAItQmyBoVnpHlyh4UfsqD BA== 
Received: from nam05-by2-obe.outbound.protection.outlook.com (mail-by2nam05lp2053.outbound.protection.outlook.com [104.47.50.53])
        by mx0b-002c1b01.pphosted.com with ESMTP id 2ubf9twtmf-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT)
        for <linux-doc@vger.kernel.org>; Thu, 15 Aug 2019 10:14:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XUCHm7ppy3GOVzN6AGPnRGXx1SmU9idySw1tPzREJ5CWGteQP7t3jG4YuOC3WX0sT7wu6xzIKCvDwASthz4sZWQnjsSlGftjrxw5s7hJLzoeVlgu3tUctzqHAMWBx1nD1jaJv+6r1xm9Ftzbk3itYPPoLFtznTNhLfEpHArtfaTn//RxjqDG5IDCdCQhKhsK4TnUT0HcuVVG2IZ4uFX68JkrNh+czMjmrAMeoKL13EkZQQo4ynw+ZuTyrhWvcOrYWaO4Fq2lP4/Gs0TObwggwP0X81SauBTyOWP5bmV7NhUpUFCmDRZ/QUz4sRnQap9/pNb8L2pO/3pcVfq1NZt9jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2eShb8ZVlR1djqEtIBM+AQMVA3y9uR2hZbvS4ztCLHg=;
 b=G1y1HWIpLN3I1VizsOK+TOuszBVocQ8o/yw1Zqn04XkiXmzzcYSkNKDZ7PHsti1fCsml34dEAs7wUp6Vjt29QJfVFMkJtqDc51Aw9UuAvMMvXl/UfCsyDX4XaiZ4Dz3CHSL+qiRbiTQJwn4SPYXxmPqfqZBJTOfK9p1QPIsnWOJz7x6KkeJg7uYUMmRLRdch0yj+eS4L+H/48p+H0umWHRTU5K/Kg5o8e3P6+1CU7zDQULZUDOzX7FWzFA5ysxMhF49Dd4E0iY6YsEHS94+xPdpEh/v4sreqoN4GNPzHIH/9cgpNI8lQymHvoF33uzOkpRxIOyHKop6P5QkWTmNmnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
Received: from CY4PR0201MB3588.namprd02.prod.outlook.com (52.132.98.38) by
 CY4PR0201MB3603.namprd02.prod.outlook.com (52.132.99.21) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.16; Thu, 15 Aug 2019 17:14:03 +0000
Received: from CY4PR0201MB3588.namprd02.prod.outlook.com
 ([fe80::5598:9f2e:9d39:c737]) by CY4PR0201MB3588.namprd02.prod.outlook.com
 ([fe80::5598:9f2e:9d39:c737%6]) with mapi id 15.20.2157.022; Thu, 15 Aug 2019
 17:14:03 +0000
From:   Florian Schmidt <florian.schmidt@nutanix.com>
To:     "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
CC:     Florian Schmidt <florian.schmidt@nutanix.com>
Subject: [PATCH 2/2] trace-vmscan-postprocess: fix output table spacing
Thread-Topic: [PATCH 2/2] trace-vmscan-postprocess: fix output table spacing
Thread-Index: AQHVU4zWmlhThTVDT0uXeMuHg2Wy8w==
Date:   Thu, 15 Aug 2019 17:14:03 +0000
Message-ID: <20190815164840.1141-3-florian.schmidt@nutanix.com>
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
x-ms-office365-filtering-correlation-id: f6edb7de-9867-4f9c-a408-08d721a3f8cc
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:CY4PR0201MB3603;
x-ms-traffictypediagnostic: CY4PR0201MB3603:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CY4PR0201MB360371E57B3D50A50394A26AF7AC0@CY4PR0201MB3603.namprd02.prod.outlook.com>
x-proofpoint-crosstenant: true
x-ms-oob-tlc-oobclassifiers: OLM:635;
x-forefront-prvs: 01304918F3
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(396003)(136003)(376002)(346002)(366004)(39850400004)(199004)(189003)(2906002)(8676002)(86362001)(8936002)(6506007)(50226002)(6486002)(25786009)(66066001)(81156014)(11346002)(81166006)(71190400001)(2616005)(476003)(14444005)(66556008)(36756003)(64756008)(66446008)(26005)(71200400001)(186003)(256004)(386003)(7736002)(66946007)(6916009)(305945005)(102836004)(2501003)(446003)(5660300002)(66476007)(3846002)(6116002)(107886003)(5640700003)(6436002)(52116002)(44832011)(53936002)(76176011)(1076003)(486006)(99286004)(2351001)(316002)(478600001)(6512007)(4326008)(14454004)(64030200001);DIR:OUT;SFP:1102;SCL:1;SRVR:CY4PR0201MB3603;H:CY4PR0201MB3588.namprd02.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nutanix.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: vxA0t+Y2S1ZFTciDBWb6rpVAtvNXVqgfFudNMSxfp5nUZHJCkECZD9OYD7hiMONUnuYWozQ8CUjqILnoG1Ln0U/GZNsZKyAhnT8laZ/B6rc3H+GLngN8XaOe+IGCKJ3g3Jh+gNZsjkBJafSKc7bSnWUn6+r3GoVG/hzzUhOgLPb8BHDi8ViEQfDvXwd28lJ2iBTD7D3pms552QTbgH12Wr3m0a3iRDi5zsf0ikdARWJ1Jj/ZH8SVtB/Uws9SKdEVuYGXjbUKwpGZBh3UbYXw94kXehxGSZTT91wmKZdCZxZgDgsSr2u3UmwrLwphM0KTRHrxdLL6/2FZUihTERAvzeF4n30Y4WMJWTX6juegMmSCmq4gwt8ws9SzU/yPDF845rhYy7cgbQh3dci4TyLKrnNKQmGrWZVUKfzES2RvsCo=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f6edb7de-9867-4f9c-a408-08d721a3f8cc
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Aug 2019 17:14:03.6349
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +4nOX8ecA4ucIG/ilnJqTZAnkk90NtW011RTCUSuDO+bEoD8B23vi0oO14lJ5lvg2LP3JArhzK4VUBkz24FXaAVHocRjqBMcq+L8YBKbhoA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR0201MB3603
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:5.22.84,1.0.8
 definitions=2019-08-15_07:2019-08-14,2019-08-15 signatures=0
X-Proofpoint-Spam-Reason: safe
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Rml4IHNwYWNpbmcgc28gdGhhdCBib3RoIHRoZSBoZWFkZXJzIGluIHRoZW1zZWx2ZXMsIGFzIHdl
bGwgYXMgdGhlDQpvdXRwdXQgb2YgdGhlIHR3byB0YWJsZXMgcmVsYXRlZCB0byBlYWNoIG90aGVy
LCBhcmUgcHJvcGVybHkgYWxpZ25lZC4NCg0KU2lnbmVkLW9mZi1ieTogRmxvcmlhbiBTY2htaWR0
IDxmbG9yaWFuLnNjaG1pZHRAbnV0YW5peC5jb20+DQotLS0NCiBEb2N1bWVudGF0aW9uL3RyYWNl
L3Bvc3Rwcm9jZXNzL3RyYWNlLXZtc2Nhbi1wb3N0cHJvY2Vzcy5wbCB8IDYgKysrLS0tDQogMSBm
aWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkNCg0KZGlmZiAtLWdp
dCBhL0RvY3VtZW50YXRpb24vdHJhY2UvcG9zdHByb2Nlc3MvdHJhY2Utdm1zY2FuLXBvc3Rwcm9j
ZXNzLnBsIGIvRG9jdW1lbnRhdGlvbi90cmFjZS9wb3N0cHJvY2Vzcy90cmFjZS12bXNjYW4tcG9z
dHByb2Nlc3MucGwNCmluZGV4IDZjNGUzZmRlOTQ0Ny4uNWE1ZDcwMDI5YzQxIDEwMDY0NA0KLS0t
IGEvRG9jdW1lbnRhdGlvbi90cmFjZS9wb3N0cHJvY2Vzcy90cmFjZS12bXNjYW4tcG9zdHByb2Nl
c3MucGwNCisrKyBiL0RvY3VtZW50YXRpb24vdHJhY2UvcG9zdHByb2Nlc3MvdHJhY2Utdm1zY2Fu
LXBvc3Rwcm9jZXNzLnBsDQpAQCAtNTc1LDggKzU3NSw4IEBAIHN1YiBkdW1wX3N0YXRzIHsNCiAN
CiAJIyBQcmludCBvdXQga3N3YXBkIGFjdGl2aXR5DQogCXByaW50ZigiXG4iKTsNCi0JcHJpbnRm
KCIlLSIgLiAkbWF4X3N0cmxlbiAuICJzICU4cyAlMTBzICAgJThzICAgJThzICU4cyAlOHNcbiIs
ICJLc3dhcGQiLCAgICJLc3dhcGQiLCAgIk9yZGVyIiwgICAgICJQYWdlcyIsICAgIlBhZ2VzIiwg
ICAiUGFnZXMiLCAgIlBhZ2VzIik7DQotCXByaW50ZigiJS0iIC4gJG1heF9zdHJsZW4gLiAicyAl
OHMgJTEwcyAgICU4cyAgICU4cyAlOHMgJThzXG4iLCAiSW5zdGFuY2UiLCAiV2FrZXVwcyIsICJS
ZS13YWtldXAiLCAiU2Nhbm5lZCIsICJSY2xtZWQiLCAgIlN5bmMtSU8iLCAiQVN5bmMtSU8iKTsN
CisJcHJpbnRmKCIlLSIgLiAkbWF4X3N0cmxlbiAuICJzICU4cyAlMTBzICAgJThzICAlOHMgJThz
ICU4c1xuIiwgIktzd2FwZCIsICAgIktzd2FwZCIsICAiT3JkZXIiLCAgICAgIlBhZ2VzIiwgICAi
UGFnZXMiLCAgICJQYWdlcyIsICAiUGFnZXMiKTsNCisJcHJpbnRmKCIlLSIgLiAkbWF4X3N0cmxl
biAuICJzICU4cyAlMTBzICAgJThzICAlOHMgJThzICU4c1xuIiwgIkluc3RhbmNlIiwgIldha2V1
cHMiLCAiUmUtd2FrZXVwIiwgIlNjYW5uZWQiLCAiUmNsbWVkIiwgICJTeW5jLUlPIiwgIkFTeW5j
LUlPIik7DQogCWZvcmVhY2ggJHByb2Nlc3NfcGlkIChrZXlzICVzdGF0cykgew0KIA0KIAkJaWYg
KCEkc3RhdHN7JHByb2Nlc3NfcGlkfS0+e01NX1ZNU0NBTl9LU1dBUERfV0FLRX0pIHsNCkBAIC01
OTUsNyArNTk1LDcgQEAgc3ViIGR1bXBfc3RhdHMgew0KIAkJJHRvdGFsX2tzd2FwZF93cml0ZXBh
Z2VfZmlsZV9hc3luYyArPSAkc3RhdHN7JHByb2Nlc3NfcGlkfS0+e01NX1ZNU0NBTl9XUklURVBB
R0VfRklMRV9BU1lOQ307DQogCQkkdG90YWxfa3N3YXBkX3dyaXRlcGFnZV9hbm9uX2FzeW5jICs9
ICRzdGF0c3skcHJvY2Vzc19waWR9LT57TU1fVk1TQ0FOX1dSSVRFUEFHRV9BTk9OX0FTWU5DfTsN
CiANCi0JCXByaW50ZigiJS0iIC4gJG1heF9zdHJsZW4gLiAicyAlOGQgJTEwZCAgICU4dSAlOHUg
ICU4aSAlOHUiLA0KKwkJcHJpbnRmKCIlLSIgLiAkbWF4X3N0cmxlbiAuICJzICU4ZCAlMTBkICAl
OHUgICAlOHUgJThpICU4dSAgICAgICAgICIsDQogCQkJJHByb2Nlc3NfcGlkLA0KIAkJCSRzdGF0
c3skcHJvY2Vzc19waWR9LT57TU1fVk1TQ0FOX0tTV0FQRF9XQUtFfSwNCiAJCQkkc3RhdHN7JHBy
b2Nlc3NfcGlkfS0+e0hJR0hfS1NXQVBEX1JFV0FLRVVQfSwNCi0tIA0KMi4yMy4wLnJjMQ0KDQo=
