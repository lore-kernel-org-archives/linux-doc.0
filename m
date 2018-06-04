Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 426867D048
	for <lwn-linux-doc@archive.lwn.net>; Mon,  4 Jun 2018 09:11:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751854AbeFDJLb (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 4 Jun 2018 05:11:31 -0400
Received: from mail-sn1nam01on0089.outbound.protection.outlook.com ([104.47.32.89]:58496
        "EHLO NAM01-SN1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1750866AbeFDJL2 (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 4 Jun 2018 05:11:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xdL7gDlFAOeai0RlEq88cbDo5cyaDtymJXDfp4JzXi4=;
 b=hW7BIOTYbtEX0y7svUOTokJRzkZ8L21JeQ+lXvkbzp98FMee2eQICZBzglSZPd9iJdD5GK9hkeHvsZ6KToY7A4DcwQD1Aa2xKUCflzAMPLnBQ8YRkmSUBX5hDLyJJHpkg+5ubpGXV6849Q/WY4oBghq5hPAM4A02YE+h5hZbKbY=
Received: from DM6PR07MB4812.namprd07.prod.outlook.com (20.176.81.13) by
 DM6PR07MB4331.namprd07.prod.outlook.com (20.176.95.33) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.820.15; Mon, 4 Jun 2018 09:11:25 +0000
Received: from DM6PR07MB4812.namprd07.prod.outlook.com
 ([fe80::9cf:943c:3bac:6364]) by DM6PR07MB4812.namprd07.prod.outlook.com
 ([fe80::9cf:943c:3bac:6364%5]) with mapi id 15.20.0820.015; Mon, 4 Jun 2018
 09:11:25 +0000
From:   Przemyslaw Gaj <pgaj@cadence.com>
To:     Boris Brezillon <boris.brezillon@bootlin.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>
CC:     Przemyslaw Sroka <psroka@cadence.com>,
        Arkadiusz Golec <agolec@cadence.com>,
        Alan Douglas <adouglas@cadence.com>,
        Bartosz Folta <bfolta@cadence.com>,
        Damian Kos <dkos@cadence.com>,
        Alicja Jurasik-Urbaniak <alicja@cadence.com>,
        Cyprian Wronka <cwronka@cadence.com>,
        Suresh Punnoose <sureshp@cadence.com>,
        Rafal Ciepiela <rafalc@cadence.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Nishanth Menon <nm@ti.com>, Rob Herring <robh+dt@kernel.org>,
        Pawel Moll <pawel.moll@arm.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Ian Campbell <ijc+devicetree@hellion.org.uk>,
        Kumar Gala <galak@codeaurora.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Vitor Soares <Vitor.Soares@synopsys.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Xiang Lin <Xiang.Lin@synaptics.com>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Subject: Re: [PATCH v4 01/10] i3c: Add core I3C infrastructure
Thread-Topic: [PATCH v4 01/10] i3c: Add core I3C infrastructure
Thread-Index: AQHT+9YfX6KvIA2jCkquNeLryIvG+6RP8d0A
Date:   Mon, 4 Jun 2018 09:11:25 +0000
Message-ID: <EFF070CA-9C6C-4E9C-9CEF-45AAD02745BB@cadence.com>
References: <20180330074751.25987-1-boris.brezillon@bootlin.com>
 <20180330074751.25987-2-boris.brezillon@bootlin.com>
In-Reply-To: <20180330074751.25987-2-boris.brezillon@bootlin.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=pgaj@cadence.com; 
x-originating-ip: [185.217.253.59]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1;DM6PR07MB4331;7:N5dX6Wm8zzhrxPSPt0WSC0cFxz8Xv4DT2X5cr2AYtCIo3XqARYvWfIOh2o7WZgIgA6dOhQz0mcWM0Rjg1+bEJU2UkTOWuPh7oV5dVnOUWcMWk5PUvQ39MzuM5XRRYKaNVR2NnjPo2y7siEpnjZfAa4j37fFQuDM0U2t/D5k7DvVQiDchF8mDfWBErLByFzP39ebBzWVmytvjd7aQ4ZoB8+0C0orM7ETSqrnNOgNiIQwugd8RbLfQnLSxh166M3LW;20:gPJcBD7vENkR4MkIjvdJsK1Oc9H93nu1Kia9fBMZFCTY36JKxuQRpoEwul38M3cMle9IulV3lwbnrlV+dAR5t9mE+CaHY+RFO2bA4olk8yx8WzvrVsmwq3EeRE5t0jAGmimvrp70t5dyLnKaa4dBPbNfjpAMo+Yc5c3ClFlE5i2X9fkmtyh4ccpaqNIsjfPqERdzUd1vl9+kvaBYVQJPraaMgkL0p8xnPwV2Z0+K7MgTyuNJBV4eCpAEW4fFmEPc
x-microsoft-antispam: UriScan:;BCL:0;PCL:0;RULEID:(7020095)(4652020)(5600026)(4534165)(4627221)(201703031133081)(201702281549075)(2017052603328)(7153060)(7193020);SRVR:DM6PR07MB4331;
x-ms-traffictypediagnostic: DM6PR07MB4331:
x-microsoft-antispam-prvs: <DM6PR07MB43311BBAD9DC98165075E4A9C2670@DM6PR07MB4331.namprd07.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:;
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0;PCL:0;RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(10201501046)(93006095)(93001095)(3002001)(3231254)(944501410)(52105095)(149027)(150027)(6041310)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123560045)(20161123562045)(20161123558120)(20161123564045)(6072148)(201708071742011)(7699016);SRVR:DM6PR07MB4331;BCL:0;PCL:0;RULEID:;SRVR:DM6PR07MB4331;
x-forefront-prvs: 069373DFB6
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(396003)(39380400002)(39860400002)(366004)(346002)(376002)(36092001)(189003)(199004)(6436002)(2501003)(82746002)(106356001)(2900100001)(486006)(83716003)(11346002)(446003)(2616005)(6116002)(6512007)(476003)(229853002)(86362001)(97736004)(53936002)(6486002)(105586002)(478600001)(66066001)(5250100002)(54906003)(8936002)(36756003)(26005)(33656002)(4326008)(7416002)(316002)(110136005)(3280700002)(68736007)(76176011)(102836004)(3846002)(6246003)(59450400001)(25786009)(6506007)(2906002)(7736002)(81166006)(305945005)(99286004)(5660300001)(3660700001)(81156014)(186003)(14454004)(8676002);DIR:OUT;SFP:1101;SCL:1;SRVR:DM6PR07MB4331;H:DM6PR07MB4812.namprd07.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: cadence.com does not designate
 permitted sender hosts)
x-microsoft-antispam-message-info: pKACji52dwaN0tgE3azob0vcFq8e4KXJUVuBRMKRDszqogwC6ezHjIU/IxdC7qQojxz15jOeAjw8UzPuUU6t82EFePqOr3y2PdXjnlXle7LecCIR2aUS8Mp/AO9IeitcwIEcJdXnNBm9sY+O7yup8X4nvn6fCb14h+yagIcDEqG+vldt8QyQxPT+gWmlFaG6wryV5F/VXrje1H+CGSiMyQ==
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="utf-8"
Content-ID: <7577811D7F90ED4B9CA00C0F091F817C@namprd07.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Office365-Filtering-Correlation-Id: cd68812a-f9d2-4ffc-2555-08d5c9fb2649
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd68812a-f9d2-4ffc-2555-08d5c9fb2649
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jun 2018 09:11:25.7220
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR07MB4331
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

SGkgQm9yaXMNCg0KSXQgbG9va3MgZ3JlYXQsIGp1c3Qgb25lIGNvbW1lbnQgdG8gREVGU0xWUyBj
b21tYW5kOg0KDQrvu79PbiA2LzQvMTgsIDk6MzIgQU0sICJCb3JpcyBCcmV6aWxsb24iIDxib3Jp
cy5icmV6aWxsb25AYm9vdGxpbi5jb20+IHdyb3RlOg0KDQogICAgK2ludCBpM2NfbWFzdGVyX2Rl
ZnNsdnNfbG9ja2VkKHN0cnVjdCBpM2NfbWFzdGVyX2NvbnRyb2xsZXIgKm1hc3RlcikNCiAgICAr
ew0KICAgICsJc3RydWN0IGkzY19jY2NfY21kX2Rlc3QgZGVzdCA9IHsNCiAgICArCQkuYWRkciA9
IEkzQ19CUk9BRENBU1RfQUREUiwNCiAgICArCX07DQogICAgKwlzdHJ1Y3QgaTNjX2NjY19jbWQg
Y21kID0gew0KICAgICsJCS5pZCA9IEkzQ19DQ0NfREVGU0xWUywNCiAgICArCQkuZGVzdHMgPSAm
ZGVzdCwNCiAgICArCQkubmRlc3RzID0gMSwNCiAgICArCX07DQogICAgKwlzdHJ1Y3QgaTNjX2Nj
Y19kZWZzbHZzICpkZWZzbHZzOw0KICAgICsJc3RydWN0IGkzY19jY2NfZGV2X2Rlc2MgKmRlc2M7
DQogICAgKwlzdHJ1Y3QgaTNjX2RldmljZSAqaTNjZGV2Ow0KICAgICsJc3RydWN0IGkyY19kZXZp
Y2UgKmkyY2RldjsNCiAgICArCXN0cnVjdCBpM2NfYnVzICpidXM7DQogICAgKwlib29sIHNlbmQg
PSBmYWxzZTsNCiAgICArCWludCBuZGV2cyA9IDAsIHJldDsNCiAgICArDQogICAgKwlpZiAoIW1h
c3RlcikNCiAgICArCQlyZXR1cm4gLUVJTlZBTDsNCiAgICArDQogICAgKwlidXMgPSBpM2NfbWFz
dGVyX2dldF9idXMobWFzdGVyKTsNCiAgICArCWkzY19idXNfZm9yX2VhY2hfaTNjZGV2KGJ1cywg
aTNjZGV2KSB7DQogICAgKwkJbmRldnMrKzsNCiAgICArCQlpZiAoSTNDX0JDUl9ERVZJQ0VfUk9M
RShpM2NkZXYtPmluZm8uYmNyKSA9PSBJM0NfQkNSX0kzQ19NQVNURVIpDQogICAgKwkJCXNlbmQg
PSB0cnVlOw0KICAgICsJfQ0KICAgICsNCiAgICArCS8qIE5vIG90aGVyIG1hc3RlciBvbiB0aGUg
YnVzLCBza2lwIERFRlNMVlMuICovDQogICAgKwlpZiAoIXNlbmQpDQogICAgKwkJcmV0dXJuIDA7
DQogICAgKw0KICAgICsJaTNjX2J1c19mb3JfZWFjaF9pMmNkZXYoYnVzLCBpMmNkZXYpDQogICAg
KwkJbmRldnMrKzsNCiAgICArDQogICAgKwlkZXN0LnBheWxvYWQubGVuID0gc2l6ZW9mKCpkZWZz
bHZzKSArDQogICAgKwkJCSAgICgobmRldnMgLSAxKSAqIHNpemVvZihzdHJ1Y3QgaTNjX2NjY19k
ZXZfZGVzYykpOw0KICAgICsJZGVmc2x2cyA9IGt6YWxsb2MoZGVzdC5wYXlsb2FkLmxlbiwgR0ZQ
X0tFUk5FTCk7DQogICAgKwlpZiAoIWRlZnNsdnMpDQogICAgKwkJcmV0dXJuIC1FTk9NRU07DQog
ICAgKw0KICAgICsJZGVzdC5wYXlsb2FkLmRhdGEgPSBkZWZzbHZzOw0KICAgICsNCiAgICArCWRl
ZnNsdnMtPmNvdW50ID0gbmRldnM7DQogICAgKwlkZWZzbHZzLT5tYXN0ZXIuYmNyID0gbWFzdGVy
LT50aGlzLT5pbmZvLmJjcjsNCiAgICArCWRlZnNsdnMtPm1hc3Rlci5kY3IgPSBtYXN0ZXItPnRo
aXMtPmluZm8uZGNyOw0KICAgICsJZGVmc2x2cy0+bWFzdGVyLmR5bl9hZGRyID0gbWFzdGVyLT50
aGlzLT5pbmZvLmR5bl9hZGRyOw0KICAgICsJZGVmc2x2cy0+bWFzdGVyLnN0YXRpY19hZGRyID0g
STNDX0JST0FEQ0FTVF9BRERSOw0KICAgICsNCiAgICArCWRlc2MgPSBkZWZzbHZzLT5zbGF2ZXM7
DQogICAgKwlpM2NfYnVzX2Zvcl9lYWNoX2kyY2RldihidXMsIGkyY2Rldikgew0KICAgICsJCWRl
c2MtPmx2ciA9IGkyY2Rldi0+bHZyOw0KICAgICsJCWRlc2MtPnN0YXRpY19hZGRyID0gaTJjZGV2
LT5pbmZvLmFkZHI7DQogICAgKwkJZGVzYysrOw0KICAgICsJfQ0KICAgICsNCiAgICArCWkzY19i
dXNfZm9yX2VhY2hfaTNjZGV2KGJ1cywgaTNjZGV2KSB7DQogICAgKwkJLyogU2tpcCB0aGUgSTND
IGRldiByZXByZXNlbnRpbmcgdGhpcyBtYXN0ZXIuICovDQogICAgKwkJaWYgKGkzY2RldiA9PSBt
YXN0ZXItPnRoaXMpDQogICAgKwkJCWNvbnRpbnVlOw0KICAgICsNCiAgICArCQlkZXNjLT5iY3Ig
PSBpM2NkZXYtPmluZm8uYmNyOw0KICAgICsJCWRlc2MtPmRjciA9IGkzY2Rldi0+aW5mby5kY3I7
DQogICAgKwkJZGVzYy0+ZHluX2FkZHIgPSBpM2NkZXYtPmluZm8uZHluX2FkZHI7DQogICAgKwkJ
ZGVzYy0+c3RhdGljX2FkZHIgPSBpM2NkZXYtPmluZm8uc3RhdGljX2FkZHI7DQogICAgKwkJZGVz
YysrOw0KICAgICsJfQ0KICAgICsNCiAgICArCXJldCA9IGkzY19tYXN0ZXJfc2VuZF9jY2NfY21k
X2xvY2tlZChtYXN0ZXIsICZjbWQpOw0KICAgICsJa2ZyZWUoZGVmc2x2cyk7DQogICAgKw0KICAg
ICsJcmV0dXJuIHJldDsNCiAgICArfQ0KDQpZb3Ugc2hvdWxkIHNoaWZ0IGFsbCB0aGUgYWRkcmVz
c2VzIChkeW5hbWljIGFuZCBzdGF0aWMpIG9uZSBiaXQgbGVmdC4gDQpBZGRyZXNzZXMgYXJlIHN0
b3JlZCBvbiBiaXRzIFs3OjFdLCB0aGlzIGlzIGRlc2NyaWJlZCBpbiBNSVBJIHNwZWMsIA0Kc2Vj
dGlvbiA1LjEuOS4zLjcgRGVmaW5lIExpc3Qgb2YgU2xhdmVzIChERUZTTFZTKQ0KDQpSZWdhcmRz
LA0KUHJ6ZW15c2xhdyBHYWoNCg0K
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
