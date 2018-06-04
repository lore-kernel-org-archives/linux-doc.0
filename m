Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id C9ADC7D043
	for <lwn-linux-doc@archive.lwn.net>; Mon,  4 Jun 2018 09:24:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751865AbeFDJY6 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 4 Jun 2018 05:24:58 -0400
Received: from mail-cys01nam02on0045.outbound.protection.outlook.com ([104.47.37.45]:59776
        "EHLO NAM02-CY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1750886AbeFDJYz (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 4 Jun 2018 05:24:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p8zfCYRF2Py97lZuo0/8rOgsxfXxvVqV7rHlQO27CWs=;
 b=pARQDye9eZeqaFS3DLdQoyeTsuBJvXHKy6suieHVvbGn4PXp5cA94cfn8AOFH1j23CspefN8smVPOq2eU0vVf/fhy6PbXZHWetaqb2v9DwzCj38Iv1pJLup5SmchrSz6AbwyqzTm8hsYx+1Ci1ZWAoLnoU1Tt8qgA4EuMZ8tb/g=
Received: from DM6PR07MB4812.namprd07.prod.outlook.com (20.176.81.13) by
 DM6PR07MB4955.namprd07.prod.outlook.com (20.176.106.76) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.820.11; Mon, 4 Jun 2018 09:24:51 +0000
Received: from DM6PR07MB4812.namprd07.prod.outlook.com
 ([fe80::9cf:943c:3bac:6364]) by DM6PR07MB4812.namprd07.prod.outlook.com
 ([fe80::9cf:943c:3bac:6364%5]) with mapi id 15.20.0820.015; Mon, 4 Jun 2018
 09:24:51 +0000
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
Subject: Re: [PATCH v4 07/10] i3c: master: Add driver for Cadence IP
Thread-Topic: [PATCH v4 07/10] i3c: master: Add driver for Cadence IP
Thread-Index: AQHT+9X8HfEKG84YRkiSh33u/KQANqRP9aCA
Date:   Mon, 4 Jun 2018 09:24:51 +0000
Message-ID: <9613475C-ECAE-4AD6-9C02-55C9214A6489@cadence.com>
References: <20180330074751.25987-1-boris.brezillon@bootlin.com>
 <20180330074751.25987-8-boris.brezillon@bootlin.com>
In-Reply-To: <20180330074751.25987-8-boris.brezillon@bootlin.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=pgaj@cadence.com; 
x-originating-ip: [185.217.253.59]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1;DM6PR07MB4955;7:TBQwYOn3IF5jpEna77VMTwhkp0jYOvdEszRR1dybQbflUlrQoRBhvmuhWj/YLlVtLGpE8VyMhhXNamxZsVDjXp3at5zSExQubyLWgq+DrwkxJJd44hEhsYXDqRI7/evHdRvbO5lW1e6e2ffwType0blJWbh8bXHpARtMqBqKBEe3M25Rh3hEBZ2dO15/lDW/ZhAGOxNfFLKDAPco5X4jrRlZhVxgqYQ1RrUqSo+9Z2f2XmDiKHfEuWhNi9R6PAvM;20:DNHY9RDJ1i/8fN4OlscWfWSlENyxubGd70f7PNqkMYOoyx8wU3qeYyRTJME4gd38LI87HdgdJ2mEJLfUtdLtYWM5dI0T7Xc1Me0OPx02SufG0lWSCt3i5jO3onkthI0sMyg9Xuv2DgmXrzuSeW4SjY00GjPWIJV1onIvDh9cUgr4E7uut/mTaaZQtlQWBp19PYm3YwncVgfRf4Z8F8bm4JLNnYPxI77h4MkSu405VJ1YTkWyvxUltcTOlZiPzTap
x-microsoft-antispam: UriScan:;BCL:0;PCL:0;RULEID:(7020095)(4652020)(5600026)(4534165)(4627221)(201703031133081)(201702281549075)(2017052603328)(7153060)(7193020);SRVR:DM6PR07MB4955;
x-ms-traffictypediagnostic: DM6PR07MB4955:
x-microsoft-antispam-prvs: <DM6PR07MB49552483D76C6B48B6792531C2670@DM6PR07MB4955.namprd07.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:;
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0;PCL:0;RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(10201501046)(3002001)(93006095)(93001095)(3231254)(944501410)(52105095)(149027)(150027)(6041310)(20161123562045)(20161123558120)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123564045)(20161123560045)(6072148)(201708071742011)(7699016);SRVR:DM6PR07MB4955;BCL:0;PCL:0;RULEID:;SRVR:DM6PR07MB4955;
x-forefront-prvs: 069373DFB6
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(376002)(346002)(39380400002)(39860400002)(366004)(396003)(36092001)(189003)(199004)(8936002)(6116002)(3846002)(106356001)(59450400001)(105586002)(6246003)(6506007)(53936002)(5660300001)(316002)(186003)(110136005)(33656002)(7416002)(26005)(305945005)(6512007)(102836004)(54906003)(14454004)(99286004)(2900100001)(6436002)(7736002)(4326008)(25786009)(229853002)(36756003)(76176011)(478600001)(68736007)(6486002)(476003)(11346002)(2501003)(82746002)(5250100002)(2616005)(446003)(8676002)(486006)(81156014)(66066001)(3660700001)(83716003)(97736004)(86362001)(2906002)(3280700002)(81166006);DIR:OUT;SFP:1101;SCL:1;SRVR:DM6PR07MB4955;H:DM6PR07MB4812.namprd07.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: cadence.com does not designate
 permitted sender hosts)
x-microsoft-antispam-message-info: 2TDqxQaoArTq2hLsangeViIu1T1Xsqs1rDffHNoFoL3uVozQSiZcE+7csWTqltWUAQP5SHB0uyhP9tUJ5Xl2hRFLjC6X4nE/0Vx1yWiO7APFRg8vX8Fh2v6yKOHgrhgV2z7FUt5s4KSBQ7N4pzlpLnVXdqmLzHTTyXL4Pwd5iGmnVwpFe5YaydfjQQTzdZWneKWE50ublZWuSpPkHDPwmg==
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="utf-8"
Content-ID: <18ED8795B9B6864F89C11CA99D8CF0B5@namprd07.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Office365-Filtering-Correlation-Id: 8ec3b1bd-53c6-40a3-f05b-08d5c9fd0689
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ec3b1bd-53c6-40a3-f05b-08d5c9fd0689
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jun 2018 09:24:51.4686
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR07MB4955
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

SGkgQm9yaXMsDQoNCkZldyB0aGluZ3MgcmVnYXJkaW5nIENhZGVuY2UgSVAgZHJpdmVyOg0KDQrv
u79PbiA2LzQvMTgsIDk6MzEgQU0sICJCb3JpcyBCcmV6aWxsb24iIDxib3Jpcy5icmV6aWxsb25A
Ym9vdGxpbi5jb20+IHdyb3RlOg0KDQogICAgK3N0YXRpYyB2b2lkIGNkbnNfaTNjX21hc3Rlcl9o
YW5kbGVfaWJpKHN0cnVjdCBjZG5zX2kzY19tYXN0ZXIgKm1hc3RlciwNCiAgICArCQkJCSAgICAg
ICB1MzIgaWJpcikNCiAgICArew0KICAgICsJc3RydWN0IGNkbnNfaTNjX2kyY19kZXZfZGF0YSAq
ZGF0YTsNCiAgICArCWJvb2wgZGF0YV9jb25zdW1lZCA9IGZhbHNlOw0KICAgICsJc3RydWN0IGkz
Y19pYmlfc2xvdCAqc2xvdDsNCiAgICArCXUzMiBpZCA9IElCSVJfU0xWSUQoaWJpcik7DQogICAg
KwlzdHJ1Y3QgaTNjX2RldmljZSAqZGV2Ow0KICAgICsJaW50IGxlbiwgaSwgajsNCiAgICArCXU4
ICpidWY7DQogICAgKw0KICAgICsJLyoNCiAgICArCSAqIEZJWE1FOiBtYXliZSB3ZSBzaG91bGQg
cmVwb3J0IHRoZSBGSUZPIE9WRiBlcnJvcnMgdG8gdGhlIHVwcGVyDQogICAgKwkgKiBsYXllci4N
CiAgICArCSAqLw0KICAgICsJaWYgKGlkID49IG1hc3Rlci0+aWJpLm51bV9zbG90cyB8fCAoaWJp
ciAmIElCSVJfRVJST1IpKQ0KICAgICsJCWdvdG8gb3V0Ow0KICAgICsNCiAgICArCWRldiA9IG1h
c3Rlci0+aWJpLnNsb3RzW2lkXTsNCiAgICArCXNwaW5fbG9jaygmbWFzdGVyLT5pYmkubG9jayk7
DQogICAgKw0KICAgICsJZGF0YSA9IGkzY19kZXZpY2VfZ2V0X21hc3Rlcl9kYXRhKGRldik7DQog
ICAgKwlzbG90ID0gaTNjX2dlbmVyaWNfaWJpX2dldF9mcmVlX3Nsb3QoZGF0YS0+aWJpX3Bvb2wp
Ow0KICAgICsJaWYgKCFzbG90KQ0KICAgICsJCWdvdG8gb3V0X3VubG9jazsNCiAgICArDQogICAg
KwlidWYgPSBzbG90LT5kYXRhOw0KICAgICsNCiAgICArCWxlbiA9IElCSVJfWEZFUl9CWVRFUyhp
YmlyKTsNCiAgICArCWZvciAoaSA9IDA7IGkgPCBJQklSX1hGRVJfQllURVMoaWJpcik7IGkgKz0g
NCkgew0KICAgICsJCXUzMiB0bXAgPSByZWFkbChtYXN0ZXItPnJlZ3MgKyBJQklfREFUQV9GSUZP
KTsNCiAgICArDQogICAgKwkJZm9yIChqID0gMDsgaiA8IDQgJiYgaSArIGogPCBkZXYtPmliaS0+
bWF4X3BheWxvYWRfbGVuOyBqKyspDQogICAgKwkJCWJ1ZltpICsgal0gPSB0bXAgPj4gKGogKiA4
KTsNCiAgICArDQogICAgKwl9DQogICAgKwlzbG90LT5sZW4gPSBtaW5fdCh1bnNpZ25lZCBpbnQs
IElCSVJfWEZFUl9CWVRFUyhpYmlyKSwNCiAgICArCQkJICBkZXYtPmliaS0+bWF4X3BheWxvYWRf
bGVuKTsNCiAgICArCWkzY19tYXN0ZXJfcXVldWVfaWJpKGRldiwgc2xvdCk7DQogICAgKwlkYXRh
X2NvbnN1bWVkID0gdHJ1ZTsNCiAgICArDQogICAgK291dF91bmxvY2s6DQogICAgKwlzcGluX3Vu
bG9jaygmbWFzdGVyLT5pYmkubG9jayk7DQogICAgKw0KICAgICtvdXQ6DQogICAgKwkvKiBDb25z
dW1lIGRhdGEgZnJvbSB0aGUgRklGTyBpZiBpdCdzIG5vdCBiZWVuIGRvbmUgYWxyZWFkeS4gKi8N
CiAgICArCWlmICghZGF0YV9jb25zdW1lZCkgew0KICAgICsJCWZvciAoaSA9IDA7IGkgPCBJQklS
X1hGRVJfQllURVMoaWJpcik7IGkgKz0gNCkNCiAgICArCQkJcmVhZGwobWFzdGVyLT5yZWdzICsg
SUJJX0RBVEFfRklGTyk7DQogICAgKwl9DQogICAgK30NCiAgICANCmxlbiB2YXJpYWJsZSBpcyB1
bm5lZWRlZC4NCg0KICAgICtzdGF0aWMgaW50IGNkbnNfaTNjX21hc3Rlcl9wcm9iZShzdHJ1Y3Qg
cGxhdGZvcm1fZGV2aWNlICpwZGV2KQ0KICAgICt7DQogICAgKwlzdHJ1Y3QgY2Ruc19pM2NfbWFz
dGVyICptYXN0ZXI7DQogICAgKwlzdHJ1Y3QgcmVzb3VyY2UgKnJlczsNCiAgICArCWludCByZXQs
IGlycTsNCiAgICArCXUzMiB2YWw7DQogICAgKw0KICAgICsJbWFzdGVyID0gZGV2bV9remFsbG9j
KCZwZGV2LT5kZXYsIHNpemVvZigqbWFzdGVyKSwgR0ZQX0tFUk5FTCk7DQogICAgKwlpZiAoIW1h
c3RlcikNCiAgICArCQlyZXR1cm4gLUVOT01FTTsNCiAgICArDQogICAgKwlyZXMgPSBwbGF0Zm9y
bV9nZXRfcmVzb3VyY2UocGRldiwgSU9SRVNPVVJDRV9NRU0sIDApOw0KICAgICsJbWFzdGVyLT5y
ZWdzID0gZGV2bV9pb3JlbWFwX3Jlc291cmNlKCZwZGV2LT5kZXYsIHJlcyk7DQogICAgKwlpZiAo
SVNfRVJSKG1hc3Rlci0+cmVncykpDQogICAgKwkJcmV0dXJuIFBUUl9FUlIobWFzdGVyLT5yZWdz
KTsNCiAgICArDQogICAgKwltYXN0ZXItPnBjbGsgPSBkZXZtX2Nsa19nZXQoJnBkZXYtPmRldiwg
InBjbGsiKTsNCiAgICArCWlmIChJU19FUlIobWFzdGVyLT5wY2xrKSkNCiAgICArCQlyZXR1cm4g
UFRSX0VSUihtYXN0ZXItPnBjbGspOw0KICAgICsNCiAgICArCW1hc3Rlci0+c3lzY2xrID0gZGV2
bV9jbGtfZ2V0KCZwZGV2LT5kZXYsICJzeXNjbGsiKTsNCiAgICArCWlmIChJU19FUlIobWFzdGVy
LT5wY2xrKSkNCiAgICArCQlyZXR1cm4gUFRSX0VSUihtYXN0ZXItPnBjbGspOw0KICAgICsNCiAg
ICArCWlycSA9IHBsYXRmb3JtX2dldF9pcnEocGRldiwgMCk7DQogICAgKwlpZiAoaXJxIDwgMCkN
CiAgICArCQlyZXR1cm4gaXJxOw0KICAgICsNCiAgICArCXJldCA9IGNsa19wcmVwYXJlX2VuYWJs
ZShtYXN0ZXItPnBjbGspOw0KICAgICsJaWYgKHJldCkNCiAgICArCQlyZXR1cm4gcmV0Ow0KICAg
ICsNCiAgICArCXJldCA9IGNsa19wcmVwYXJlX2VuYWJsZShtYXN0ZXItPnN5c2Nsayk7DQogICAg
KwlpZiAocmV0KQ0KICAgICsJCWdvdG8gZXJyX2Rpc2FibGVfcGNsazsNCiAgICArDQogICAgKwlp
ZiAocmVhZGwobWFzdGVyLT5yZWdzICsgREVWX0lEKSAhPSBERVZfSURfSTNDX01BU1RFUikgew0K
ICAgICsJCXJldCA9IC1FSU5WQUw7DQogICAgKwkJZ290byBlcnJfZGlzYWJsZV9zeXNjbGs7DQog
ICAgKwl9DQogICAgKw0KICAgICsJc3Bpbl9sb2NrX2luaXQoJm1hc3Rlci0+eGZlcnF1ZXVlLmxv
Y2spOw0KICAgICsJSU5JVF9MSVNUX0hFQUQoJm1hc3Rlci0+eGZlcnF1ZXVlLmxpc3QpOw0KICAg
ICsNCiAgICArCUlOSVRfV09SSygmbWFzdGVyLT5oal93b3JrLCBjZG5zX2kzY19tYXN0ZXJfaGop
Ow0KICAgICsJd3JpdGVsKDB4ZmZmZmZmZmYsIG1hc3Rlci0+cmVncyArIE1TVF9JRFIpOw0KICAg
ICsJd3JpdGVsKDB4ZmZmZmZmZmYsIG1hc3Rlci0+cmVncyArIFNMVl9JRFIpOw0KICAgICsJcmV0
ID0gZGV2bV9yZXF1ZXN0X2lycSgmcGRldi0+ZGV2LCBpcnEsIGNkbnNfaTNjX21hc3Rlcl9pbnRl
cnJ1cHQsIDAsDQogICAgKwkJCSAgICAgICBkZXZfbmFtZSgmcGRldi0+ZGV2KSwgbWFzdGVyKTsN
CiAgICArCWlmIChyZXQpDQogICAgKwkJZ290byBlcnJfZGlzYWJsZV9zeXNjbGs7DQogICAgKw0K
ICAgICsJcGxhdGZvcm1fc2V0X2RydmRhdGEocGRldiwgbWFzdGVyKTsNCiAgICArDQogICAgKwl2
YWwgPSByZWFkbChtYXN0ZXItPnJlZ3MgKyBDT05GX1NUQVRVUzApOw0KICAgICsNCiAgICArCS8q
IERldmljZSBJRDAgaXMgcmVzZXJ2ZWQgdG8gZGVzY3JpYmUgdGhpcyBtYXN0ZXIuICovDQogICAg
KwltYXN0ZXItPm1heGRldnMgPSBDT05GX1NUQVRVUzBfREVWU19OVU0odmFsKTsNCiAgICArCW1h
c3Rlci0+ZnJlZV9ycl9zbG90cyA9IEdFTk1BU0sobWFzdGVyLT5tYXhkZXZzLCAxKTsNCiAgICAr
DQogICAgKwl2YWwgPSByZWFkbChtYXN0ZXItPnJlZ3MgKyBDT05GX1NUQVRVUzEpOw0KICAgICsJ
bWFzdGVyLT5jYXBzLmNtZGZpZm9kZXB0aCA9IENPTkZfU1RBVFVTMV9DTURfREVQVEgodmFsKTsN
CiAgICArCW1hc3Rlci0+Y2Fwcy5yeGZpZm9kZXB0aCA9IENPTkZfU1RBVFVTMV9SWF9ERVBUSCh2
YWwpOw0KICAgICsJbWFzdGVyLT5jYXBzLnR4Zmlmb2RlcHRoID0gQ09ORl9TVEFUVVMxX1RYX0RF
UFRIKHZhbCk7DQogICAgKwltYXN0ZXItPmNhcHMuaWJpcmZpZm9kZXB0aCA9IDE2Ow0KDQpJQkkg
ZmlmbyBkZXB0aCBpcyBoYXJkY29kZWQuIFlvdSBjYW4gcmVhZCB0aGlzIHZhbHVlIGZyb20gQ09O
Rl9TVEFUVVMwIHJlZ2lzdGVyLg0KDQogICAgKwltYXN0ZXItPmNhcHMuY21kcmZpZm9kZXB0aCA9
IDE2Ow0KDQpDTURSIGZpZm8gZGVwdGggaXMgaGFyZGNvZGVkLiBZb3UgY2FuIHJlYWQgdGhpcyB2
YWx1ZSBmcm9tIENPTkZfU1RBVFVTMCByZWdpc3RlciBhbHNvLg0KDQogICAgKw0KICAgICsJc3Bp
bl9sb2NrX2luaXQoJm1hc3Rlci0+aWJpLmxvY2spOw0KICAgICsJbWFzdGVyLT5pYmkubnVtX3Ns
b3RzID0gQ09ORl9TVEFUVVMxX0lCSV9IV19SRVModmFsKTsNCiAgICArCW1hc3Rlci0+aWJpLnNs
b3RzID0gZGV2bV9remFsbG9jKCZwZGV2LT5kZXYsDQogICAgKwkJCQkJIHNpemVvZigqbWFzdGVy
LT5pYmkuc2xvdHMpICoNCiAgICArCQkJCQkgbWFzdGVyLT5pYmkubnVtX3Nsb3RzLA0KICAgICsJ
CQkJCSBHRlBfS0VSTkVMKTsNCiAgICArCWlmICghbWFzdGVyLT5pYmkuc2xvdHMpDQogICAgKwkJ
Z290byBlcnJfZGlzYWJsZV9zeXNjbGs7DQogICAgKw0KICAgICsJd3JpdGVsKElCSVJfVEhSKDEp
LCBtYXN0ZXItPnJlZ3MgKyBDTURfSUJJX1RIUl9DVFJMKTsNCiAgICArCXdyaXRlbChNU1RfSU5U
X0lCSVJfVEhSLCBtYXN0ZXItPnJlZ3MgKyBNU1RfSUVSKTsNCiAgICArCXdyaXRlbChERVZTX0NU
UkxfREVWX0NMUl9BTEwsIG1hc3Rlci0+cmVncyArIERFVlNfQ1RSTCk7DQogICAgKw0KICAgICsJ
cmV0ID0gaTNjX21hc3Rlcl9yZWdpc3RlcigmbWFzdGVyLT5iYXNlLCAmcGRldi0+ZGV2LA0KICAg
ICsJCQkJICAmY2Ruc19pM2NfbWFzdGVyX29wcywgZmFsc2UpOw0KICAgICsJaWYgKHJldCkNCiAg
ICArCQlnb3RvIGVycl9kaXNhYmxlX3N5c2NsazsNCiAgICArDQogICAgKwlyZXR1cm4gMDsNCiAg
ICArDQogICAgK2Vycl9kaXNhYmxlX3N5c2NsazoNCiAgICArCWNsa19kaXNhYmxlX3VucHJlcGFy
ZShtYXN0ZXItPnN5c2Nsayk7DQogICAgKw0KICAgICtlcnJfZGlzYWJsZV9wY2xrOg0KICAgICsJ
Y2xrX2Rpc2FibGVfdW5wcmVwYXJlKG1hc3Rlci0+cGNsayk7DQogICAgKw0KICAgICsJcmV0dXJu
IHJldDsNCiAgICArfQ0KICAgIA0KUmVnYXJkcywNClByemVteXNsYXcgR2FqDQoNCg==
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
