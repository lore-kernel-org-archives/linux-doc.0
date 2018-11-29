Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI
	autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 449267D8A8
	for <lwn-linux-doc@archive.lwn.net>; Thu, 29 Nov 2018 15:58:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728363AbeK3DDu (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 29 Nov 2018 22:03:50 -0500
Received: from mail-eopbgr740078.outbound.protection.outlook.com ([40.107.74.78]:32448
        "EHLO NAM01-BN3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728916AbeK3DDu (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 29 Nov 2018 22:03:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amd-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pZNI+GlpckPovHtI3ZKE99T6Lh0UIGR2A078nYngjLw=;
 b=brpf9UYaW01cEu12yZU9W3oIkSG77AbgVVdO1FhV+QFPkUFRHGQ17U+IBiToWFM4YUSDDD5rPEChdC2nu6F9iu9nAnvdf0xgbqcKMcTGYeHQLdGgkot9aHW/WWnkEK3fLttPTuJkxOUL/Sl9B+2hdudzfZ2WfKH7g9fs7LNQAkk=
Received: from BN6PR12MB1714.namprd12.prod.outlook.com (10.175.101.11) by
 BN6PR12MB1859.namprd12.prod.outlook.com (10.175.97.151) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1361.19; Thu, 29 Nov 2018 15:57:58 +0000
Received: from BN6PR12MB1714.namprd12.prod.outlook.com
 ([fe80::f8a7:157:6224:34ee]) by BN6PR12MB1714.namprd12.prod.outlook.com
 ([fe80::f8a7:157:6224:34ee%2]) with mapi id 15.20.1361.019; Thu, 29 Nov 2018
 15:57:58 +0000
From:   "Koenig, Christian" <Christian.Koenig@amd.com>
To:     Sean Paul <sean@poorly.run>,
        "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
CC:     Sean Paul <seanpaul@chromium.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        "Zhang, Jerry" <Jerry.Zhang@amd.com>,
        "Deucher, Alexander" <Alexander.Deucher@amd.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        David Airlie <airlied@linux.ie>,
        "Huang, Ray" <Ray.Huang@amd.com>, Jonathan Corbet <corbet@lwn.net>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
Subject: Re: [PATCH] Documentation: drm: Remove dangling pointer from
 drm-mm.rst
Thread-Topic: [PATCH] Documentation: drm: Remove dangling pointer from
 drm-mm.rst
Thread-Index: AQHUh/vyHpVvFObtCUa0zx60nG8HXKVm6JiA
Date:   Thu, 29 Nov 2018 15:57:58 +0000
Message-ID: <1e62c728-3bee-fa29-82fd-449fcb77bab7@amd.com>
References: <20181129155522.33749-1-sean@poorly.run>
In-Reply-To: <20181129155522.33749-1-sean@poorly.run>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
x-originating-ip: [2a02:908:125b:9a00:a142:2be6:b7be:5a3a]
x-clientproxiedby: AM6PR07CA0021.eurprd07.prod.outlook.com
 (2603:10a6:209:2a::34) To BN6PR12MB1714.namprd12.prod.outlook.com
 (2603:10b6:404:106::11)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Christian.Koenig@amd.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1;BN6PR12MB1859;20:/5Ea52a55Z32pY1ZT/ISRqvYzYnp3Ke7uaT98ZYukaPUJYuXTV9jX6cOtDtNY3+Z84QNc8UWEZCQUjnbxH8CP10Cz+k+PDRTKEyh57NVJtGY3L4y7ykwZ8STs4KucvWrutVPNpRtnm570yLRl+tdTy1pvszc4c03KQlvu879vFXtKJ2DCjVwRwBogCnkSQ2//3a7TOK5aw58JOzLu7CQ/55NEHMrCYQvt4gVPJrhle/pQNRHTtmNj+wIytg5spmv
x-ms-office365-filtering-correlation-id: 51da9b31-f6e4-471d-0e6e-08d656136ee1
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390098)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(4618075)(2017052603328)(7153060)(7193020);SRVR:BN6PR12MB1859;
x-ms-traffictypediagnostic: BN6PR12MB1859:
x-microsoft-antispam-prvs: <BN6PR12MB1859F66A0CB34900D56B700183D20@BN6PR12MB1859.namprd12.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0;PCL:0;RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(3231453)(999002)(944501410)(52105112)(10201501046)(3002001)(93006095)(93001095)(6055026)(148016)(149066)(150057)(6041310)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123562045)(20161123558120)(20161123564045)(20161123560045)(201708071742011)(7699051)(76991095);SRVR:BN6PR12MB1859;BCL:0;PCL:0;RULEID:;SRVR:BN6PR12MB1859;
x-forefront-prvs: 0871917CDA
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(39860400002)(366004)(376002)(346002)(396003)(136003)(199004)(189003)(4326008)(575784001)(14454004)(2616005)(52116002)(46003)(476003)(11346002)(446003)(31696002)(68736007)(53936002)(486006)(6246003)(71190400001)(2501003)(6486002)(186003)(25786009)(6436002)(97736004)(76176011)(71200400001)(386003)(99286004)(105586002)(6512007)(102836004)(106356001)(6506007)(256004)(31686004)(86362001)(65956001)(65806001)(6116002)(54906003)(58126008)(316002)(110136005)(8676002)(81156014)(64126003)(229853002)(81166006)(8936002)(72206003)(5660300001)(65826007)(2906002)(305945005)(7736002)(478600001)(36756003);DIR:OUT;SFP:1101;SCL:1;SRVR:BN6PR12MB1859;H:BN6PR12MB1714.namprd12.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-microsoft-antispam-message-info: VvXaYtpAeWCD2Bl73YKzcYppY1q7rM8OrpMZYb/YsSbs7apnAW4DzzGEMtiC40RE43d80xGjAwxnkIb5aYrPl3mktV2hfOyWWikGKjlL5cInYNAiF+N4MObCtHqcs8deKqUgkcW2Hum3PITsOTXGln+cVy6R5+uNZrweusOSFQg6Hqa/LphyaWO4B2RpUb6MuPtHybzxGkk8ZIvPv3w5PIuizQGSTWnXCDZI+5pbliBtv7wCrUOoa4r7kY3M/ItK/CppUrm0gqoXdJ8JHnsExdfpMR8dnslISxvtmiA/5Nb74BtGi4sXHbxWXQG9zi/b8FZyzNglOtsM/32m+9r9nyz5FyKebqhvTz9vzWP6ZD4=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="utf-8"
Content-ID: <62D1BBB1E185274688DD545C87625A11@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 51da9b31-f6e4-471d-0e6e-08d656136ee1
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Nov 2018 15:57:58.6476
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1859
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

QW0gMjkuMTEuMTggdW0gMTY6NTUgc2NocmllYiBTZWFuIFBhdWw6DQo+IEZyb206IFNlYW4gUGF1
bCA8c2VhbnBhdWxAY2hyb21pdW0ub3JnPg0KPg0KPiBGaXhlcyBodG1sZG9jcyBidWlsZCBlcnJv
cjoNCj4gRXJyb3I6IENhbm5vdCBvcGVuIGZpbGUgLi4vZHJpdmVycy9ncHUvZHJtL2RybV9nbG9i
YWwuYw0KPg0KPiBGaXhlczogMmJiNDI0MTBiMWJkICgiZHJtOiBSZW1vdmUgZHJtX2dsb2JhbC57
YyxofSB2MiIpDQo+IENjOiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT4N
Cj4gQ2M6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4NCj4gQ2M6
IEp1bndlaSBaaGFuZyA8SmVycnkuWmhhbmdAYW1kLmNvbT4NCj4gQ2M6IEFsZXggRGV1Y2hlciA8
YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4NCj4gQ2M6IE1hYXJ0ZW4gTGFua2hvcnN0IDxtYWFy
dGVuLmxhbmtob3JzdEBsaW51eC5pbnRlbC5jb20+DQo+IENjOiBNYXhpbWUgUmlwYXJkIDxtYXhp
bWUucmlwYXJkQGJvb3RsaW4uY29tPg0KPiBDYzogU2VhbiBQYXVsIDxzZWFuQHBvb3JseS5ydW4+
DQo+IENjOiBEYXZpZCBBaXJsaWUgPGFpcmxpZWRAbGludXguaWU+DQo+IENjOiBDaHJpc3RpYW4g
S29lbmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+DQo+IENjOiBIdWFuZyBSdWkgPHJheS5o
dWFuZ0BhbWQuY29tPg0KPiBDYzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiBT
aWduZWQtb2ZmLWJ5OiBTZWFuIFBhdWwgPHNlYW5wYXVsQGNocm9taXVtLm9yZz4NCg0KUmV2aWV3
ZWQtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4NCg0KPiAt
LS0NCj4gICBEb2N1bWVudGF0aW9uL2dwdS9kcm0tbW0ucnN0IHwgMyAtLS0NCj4gICAxIGZpbGUg
Y2hhbmdlZCwgMyBkZWxldGlvbnMoLSkNCj4NCj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24v
Z3B1L2RybS1tbS5yc3QgYi9Eb2N1bWVudGF0aW9uL2dwdS9kcm0tbW0ucnN0DQo+IGluZGV4IGQw
ZjNjNmIwMzIwMDkuLjU0YTY5NmQ5NjFhN2MgMTAwNjQ0DQo+IC0tLSBhL0RvY3VtZW50YXRpb24v
Z3B1L2RybS1tbS5yc3QNCj4gKysrIGIvRG9jdW1lbnRhdGlvbi9ncHUvZHJtLW1tLnJzdA0KPiBA
QCAtNzksOSArNzksNiBAQCBjb3VudCBmb3IgdGhlIFRUTSwgd2hpY2ggd2lsbCBjYWxsIHlvdXIg
aW5pdGlhbGl6YXRpb24gZnVuY3Rpb24uDQo+ICAgDQo+ICAgU2VlIHRoZSByYWRlb25fdHRtLmMg
ZmlsZSBmb3IgYW4gZXhhbXBsZSBvZiB1c2FnZS4NCj4gICANCj4gLS4uIGtlcm5lbC1kb2M6OiBk
cml2ZXJzL2dwdS9kcm0vZHJtX2dsb2JhbC5jDQo+IC0gICA6ZXhwb3J0Og0KPiAtDQo+ICAgDQo+
ICAgVGhlIEdyYXBoaWNzIEV4ZWN1dGlvbiBNYW5hZ2VyIChHRU0pDQo+ICAgPT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09DQoNCg==
