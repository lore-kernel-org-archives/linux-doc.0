Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_RED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 731F8C48BDF
	for <linux-doc@archiver.kernel.org>; Mon, 21 Jun 2021 01:44:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 596ED611B0
	for <linux-doc@archiver.kernel.org>; Mon, 21 Jun 2021 01:44:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229901AbhFUBqv (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 20 Jun 2021 21:46:51 -0400
Received: from esa2.fujitsucc.c3s2.iphmx.com ([68.232.152.246]:49908 "EHLO
        esa2.fujitsucc.c3s2.iphmx.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229877AbhFUBqv (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 20 Jun 2021 21:46:51 -0400
X-Greylist: delayed 428 seconds by postgrey-1.27 at vger.kernel.org; Sun, 20 Jun 2021 21:46:50 EDT
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
  t=1624239879; x=1655775879;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=Vm5+L/cAHcP63zJLWu6Dy6FrR2whGRiWoC3L8gyWd7Q=;
  b=SQexMe8Zz7N69BqtNoHhAgTxQkImHEicsY8eAnnjLdnGH5VzOm/16dzG
   rgyCKZzzvhkgitpnUoMgtokuNTsrmQxCfN9Wiv05nZEXQP3nSWznj+ry0
   eUGxQMnO7KfWzlLhQcloZRv5TXaMo/kRzc1rpuQMzDVuOGK2Ty16LONin
   4ZeEh4++zHhwoIfObxmRyxYs0L/qx2TojEMVp5c3RCmVk6/pFOXf4SDiA
   gqGIGP6fM324EaEChkWBiQX5F335mGNjVV82SA4iM3NGyQfJgNGUYhFq3
   xNePKx/T8ODhv/7PlC96N0EH7SGxM5aIYRtuHafdOSJVnLr9RG5Xk0OOs
   g==;
IronPort-SDR: ecqC7F5VW/eR3v2iPQrW9AJ6EFhph41H7OFkXTluTWVHdbO7WuuzhmvAFzZshqE80kMs4o9AxC
 VAWFNoheG9iHh6blhZDpKyK3yjivx906k068wZkpBhU26sR7HpGogwuVRyUj1YU0hCF9ijVQRj
 hrN85plkyMVEH+X7/Cq9y2CJlVtUXTo/DJvjGw6XVkDHiT9f49BkiAkvaGTnfYkKH7/asagvzP
 iiihuUSsY45uRe3cs23WQ4w3J3A2viSwXLXKkwgyrKiFQ1iRGhFgiggxEGgHyk7t09mjdWx8+9
 jYE=
X-IronPort-AV: E=McAfee;i="6200,9189,10021"; a="41607481"
X-IronPort-AV: E=Sophos;i="5.83,288,1616425200"; 
   d="scan'208";a="41607481"
Received: from mail-hk2apc01lp2051.outbound.protection.outlook.com (HELO APC01-HK2-obe.outbound.protection.outlook.com) ([104.47.124.51])
  by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jun 2021 10:37:28 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mFB25PolWjxyJuSMa1vmsgdB7eIW/7ryPspQlCMVSicpmJBFt++5znWirZtE5ik3WMjPkwcIehO5OrGMbUtEyuKNKFkfPPjRrLafFONlufnNbdyazATNfsnbwFQXGpUQy9EIm8zYOonRoTvT4xuMOVuQqP0LAjBbqBjHRmnqnEZWT5lDx/dhPq+sH/7ZTp//omhkFSPFWNucK8VUnd1+7h+Edx7rKZCeoAx0EqXSh2Iua4Nx374VQeo7tPNt6xbFCCcYHPfCJPm4OyPMwTbuiQOetVapk1T41Wn7anlpR7cy6YRT+Hugdxxg/AZhSmbuGenSMInnoW+iM3MS3q796Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vm5+L/cAHcP63zJLWu6Dy6FrR2whGRiWoC3L8gyWd7Q=;
 b=krytXvSsV/FhxY93+mqCaQdTbRt5rSKGbS5z8Nsavp0y93oRgD6JUY7f3EKun+s7NVxVdq4BQitLBkp2hcefwh+3wn1rfGiNz4x027u/HG1SAJ4Cs2w9mmkdKxD7+jwwHMxOSp35HlzqeLBTnRLxPr7W/Hcxo5BOpaihU4hnBpqr4BmOPKZJzcv4Ebrb9SMkqwnjqNJIqyUkBq2JL04gpbaWlwYue9mynqiPHq+Je7/NinjJZDb2lpIhBiGWK5HyHZ89OzmpFDgem1dBl1EvtHgFUAPthFPHD4aHfp9fOdB0dC6H+5RmqFpjkLX0A/IM8u5mmlkPppY+AHlN1tuE/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fujitsu.onmicrosoft.com; s=selector2-fujitsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vm5+L/cAHcP63zJLWu6Dy6FrR2whGRiWoC3L8gyWd7Q=;
 b=TdIfXv43dWFouN7R3bUIJzp5a4xGD2f73erv+iN8e8ZCqZXN16wltMYZqBvDu/wo07BIjCu0utjmbJPpCHrv6mlW1ir/EousHJEnPjqsu2V6HB7TvfHKUXmERCX8XOki6Yd70GwW0wSPhFNqHfYIya7FsLTt1xaUO3iersRi+54=
Received: from TYCPR01MB6544.jpnprd01.prod.outlook.com (2603:1096:400:98::6)
 by TY2PR01MB2009.jpnprd01.prod.outlook.com (2603:1096:404:12::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.16; Mon, 21 Jun
 2021 01:37:24 +0000
Received: from TYCPR01MB6544.jpnprd01.prod.outlook.com
 ([fe80::f84c:9ac2:ee90:c6d4]) by TYCPR01MB6544.jpnprd01.prod.outlook.com
 ([fe80::f84c:9ac2:ee90:c6d4%9]) with mapi id 15.20.4242.023; Mon, 21 Jun 2021
 01:37:24 +0000
From:   "xuyang2018.jy@fujitsu.com" <xuyang2018.jy@fujitsu.com>
To:     "xuyang2018.jy@fujitsu.com" <xuyang2018.jy@fujitsu.com>
CC:     "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        "akpm@linux-foundation.org" <akpm@linux-foundation.org>
Subject: Re: [PATCH] admin-guide/cputopology.rst: Remove non-existed
 cpu-hotplug.txt
Thread-Topic: [PATCH] admin-guide/cputopology.rst: Remove non-existed
 cpu-hotplug.txt
Thread-Index: AQHXY2adQc7cFWcFL0GfZ47iMJYH5asdtU4A
Date:   Mon, 21 Jun 2021 01:37:24 +0000
Message-ID: <60CFED72.6030508@fujitsu.com>
References: <1623926732-2167-1-git-send-email-xuyang2018.jy@fujitsu.com>
In-Reply-To: <1623926732-2167-1-git-send-email-xuyang2018.jy@fujitsu.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: fujitsu.com; dkim=none (message not signed)
 header.d=none;fujitsu.com; dmarc=none action=none header.from=fujitsu.com;
x-originating-ip: [223.111.68.150]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 315f026d-9d21-4d51-36e4-08d934551eff
x-ms-traffictypediagnostic: TY2PR01MB2009:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <TY2PR01MB20093EB5B9A429EBAAA2CCE3FD0A9@TY2PR01MB2009.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:983;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: KWhP2DYgbXooM49ZO/vR7qF/fMj5E6Swcj70FsSuak8d6UdyitdbFvHWKAE/icX6dKH5rNOFcwWn2JjtGAQmVm2adiN74tS1t4qjpo3azrVwnqXjogE4ihR5NOt2c+JMCqYFe06OrySgD44WOhrtrCO67MjqwNec4ua9dwuvT26YikjKVFyFONz2rv1+xhwZfl3S/PQXSVKoI7KtK6oT+waSQgXEJsGyPF3lw6r1Iiw6KRa88L55gzvaDza9p+/6YOM7yMLyOPQ+5ih2anPwtyNJib+bpcCkXoVGbH2FTFQCtb8/Nkg/9vluBHZ3pn9dTrHDU9/3rdm8Do0+7ymhvLdI7jEZcGNOyFfKVOws6CKkxLscPvIvHRu3c3Fkx7zKiSzg5RWsvbipGqtYnONsen6PsckOTGQcTQdkxqASivZmf46lwAHfWPckPnHt/zMqKT4BWlVHfbeampefyF6rH0NQ437nP69lbVHQcjMxyAFjDuOFQ94UVkY5yGIHl3K/xxelBfcKm7Q77mjIqc47OV0AOyF6U8u/faw/EH4gZFPQZLqU34aK5PwjhioRHyJaM1fiUNcgCBtqI+tiRRx94j8oFQB/562YiRVn4Ur9Zy8=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB6544.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(376002)(346002)(396003)(136003)(366004)(5660300002)(71200400001)(4326008)(316002)(6200100001)(91956017)(66476007)(76116006)(66946007)(86362001)(478600001)(6512007)(2616005)(64756008)(33656002)(66446008)(66556008)(6486002)(186003)(6506007)(85182001)(26005)(8936002)(38100700002)(122000001)(83380400001)(8676002)(54906003)(2906002)(36756003)(37006003)(87266011)(6862004);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?gb2312?B?VVlrN2JuVmVESEh6b3VsUEd1Q2Q0MlRVNXkxaFpQTGJua0NIMnMyUmd4YWFl?=
 =?gb2312?B?RDJDVDdOSkdIUlFMZ3NHYkxIdjBkZlRaWTMzeEw4Z0ZaR1ZGaTFuaTU0RXdY?=
 =?gb2312?B?VkxhcUQvcjVHOVNXeDFkaUpvWjY3TWp2VDZGRWRPblVkRHR6OWd5enRPNEpD?=
 =?gb2312?B?MmJ5Q0Z4VjhTaXdVU1dNQllaVHdrTlJ0OGdwaDBvOTNZN2lBZUxOZkJpUkY0?=
 =?gb2312?B?dXlJOFZRNVlEVmZpTHR5QWhCQmdNbVNFa2MyVmFYMGtnOVh4b2pSSVdnT3Fi?=
 =?gb2312?B?cWQzcUNwUHVoVEFsYk5hUHhsYzNyMVVySXBOS3NLczJicHFQQUhkb1pOYzZs?=
 =?gb2312?B?aWNpZ04xd0JlS1pzR21SaGhEb0kzS2RpTXA1VjJSdXNNWlVTeEthT1h1b2NV?=
 =?gb2312?B?NnlydnZ5dVBiNE1sUENRWDJ2YVQ0WUVNUUNudkQzaUFacDROMGloV0x1Rnoy?=
 =?gb2312?B?WXd6SEJqQVp0cnVWaDF0M2IrVHMzZE5tUHZVQTlTb1RlZi9mSDU4NFJSK1FX?=
 =?gb2312?B?dE44VEVTU3EwWmtqNWVRNWJHc2d5dHBvQ1lEcjhFOEwwWVpIMzhDZWt3dnUz?=
 =?gb2312?B?cDBaY3M3NlkybXVOY2k3OGRaQjBPNCtFOFlORExtRkxGM0J3bEI0UE1GYTNs?=
 =?gb2312?B?MFFzTEpDNkt5MTlmdlJ2Mis3Vk1OcStVcDhzOVhGMXZVSmZ3anZWc2hVQkJM?=
 =?gb2312?B?U3ViR0RRc3ZFM2t2KzRUL0U0cmFyTzdZS2hYTi9pZEwwd1dkYkpPaVRwN2I5?=
 =?gb2312?B?MXd3ZjdxZFhLMW9Vd3FxNGwxYzdBRjQyTmJONXQrN0FqQTNHMlJaYzdWaDlH?=
 =?gb2312?B?VVFkdWFBYUpRRUlzcjVUdGNKSHNtdHpFTWoyVWF0emdUdDJJMjlCNUNJczF6?=
 =?gb2312?B?UUh6a1NiZEkwQzhZRjN0WFlzbjlhRzBCQW9wd1ZjZVV4d2dXS09NdXd2MW5y?=
 =?gb2312?B?L1E2QWhEMTdyRGh6ZmV6bEVwNTZaYy9rNkJNYjF4SDhhWnFPSnNhSlNVU3Fk?=
 =?gb2312?B?RlR4TGcwM0ViTEIwam9NWmJjNlpZMG5XQ1ZhNDNXc1NkU2RjNXk4Z2p1bEVy?=
 =?gb2312?B?SkhPRk9DVXhaK1U4VHJaQ25leEp2ZjlZdjVNdXZzVnZjVytBM2RLSTNzTmZi?=
 =?gb2312?B?bTh0d3FpVG9Vb0N6WEdLOERrMFJtVSs3dk5iam8wSmdlUnA4VEpsVDloeFpW?=
 =?gb2312?B?MWM2ZGhpeG0xV05ERlQ2K0NCaFgxWXpUSy9UekpKZXFJa3ZsSUJEdld4dTJv?=
 =?gb2312?B?L2YrYXJ4cGdjSWQwYTgraWZuNW90MEhQb0VndXJEWlRsQ25Db3p5czZSRFgr?=
 =?gb2312?B?YWZXVmkwWlBkRVA2alhoRlZLQmtJd2VRU2NmZ0c4OTh6WWlXeWFqNURENnh3?=
 =?gb2312?B?bHNZcFpUOFM5ZDhhVUJUL2FDU25ZemZVejI2QThwWWV1R1VNVm9sYTFMZXJ4?=
 =?gb2312?B?LytqeWlMUGtJWnVuUmFyeldRRW80NmNGeFhKMUZmQjJRNm9tRU96cW9FVVJQ?=
 =?gb2312?B?akZQY21UL3B5cmNmY1NNb0g5QythWTR2TkNsVi90alZwK1l4RlY1MHY4VUt5?=
 =?gb2312?B?QmtjQXRJWnV0S285c2hMNE5MZ2NSS2UxcjZuR1RQMzUwWGJjdGpqZTliNmgr?=
 =?gb2312?B?d1RJakNTeW9HM0FyZU52WjlDdXNlTVdmNEx4cW9OMWdNTmRWendkaXBvNkhI?=
 =?gb2312?B?MlJiVmhTZ3oxY3pYbzBNcy9MS1lUTjJYYnV4SytmZC9XcUFJYkYrU3lLVllz?=
 =?gb2312?Q?S1eAibPDqYm89mooQJ9BgOOw7acFCPuCFGsdA1f?=
Content-Type: text/plain; charset="gb2312"
Content-ID: <F07977C75AC74E46B58A763F92BA6A2B@jpnprd01.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB6544.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 315f026d-9d21-4d51-36e4-08d934551eff
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jun 2021 01:37:24.5835
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YuIsHjYp1VzQvHMZRd8Yhem4jSqSLle9+uU74yPSGgIeYTCadX2j+uzsEWsjFjoIz0eNcdp651XVuh9R/khusmQuLFd9P4cwFmFlfymeen8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR01MB2009
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Y2MgYWtwbUBsaW51eC1mb3VuZGF0aW9uLm9yZw0KPiBTaW5jZSBrZXJuZWwgY29tbWl0IGZmNThm
YTdmNTU2YyAoIkRvY3VtZW50YXRpb246IFVwZGF0ZSBDUFUgaG90cGx1ZyBhbmQgbW92ZSBpdCB0
byBjb3JlLWFwaSIpLA0KPiBjcHVfaG90cGx1Zy50eHQgaGFzIGJlZW4gcmVtb3ZlZC4gV2Ugc2hv
dWxkIHVwZGF0ZSBpdCBpbiBoZXJlLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogWWFuZyBYdTx4dXlh
bmcyMDE4Lmp5QGZ1aml0c3UuY29tPg0KPiAtLS0NCj4gICBEb2N1bWVudGF0aW9uL2FkbWluLWd1
aWRlL2NwdXRvcG9sb2d5LnJzdCB8IDEwICsrKysrLS0tLS0NCj4gICAxIGZpbGUgY2hhbmdlZCwg
NSBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL0RvY3Vt
ZW50YXRpb24vYWRtaW4tZ3VpZGUvY3B1dG9wb2xvZ3kucnN0IGIvRG9jdW1lbnRhdGlvbi9hZG1p
bi1ndWlkZS9jcHV0b3BvbG9neS5yc3QNCj4gaW5kZXggYjkwZGFmY2M4MjM3Li4wOWVmYmRlMTE0
NzggMTAwNjQ0DQo+IC0tLSBhL0RvY3VtZW50YXRpb24vYWRtaW4tZ3VpZGUvY3B1dG9wb2xvZ3ku
cnN0DQo+ICsrKyBiL0RvY3VtZW50YXRpb24vYWRtaW4tZ3VpZGUvY3B1dG9wb2xvZ3kucnN0DQo+
IEBAIC0xMzUsOSArMTM1LDkgQEAgc291cmNlIGZvciB0aGUgb3V0cHV0IGlzIGluIGJyYWNrZXRz
ICgiW10iKS4NCj4gICAJCVtOUl9DUFVTLTFdDQo+IA0KPiAgICAgICBvZmZsaW5lOglDUFVzIHRo
YXQgYXJlIG5vdCBvbmxpbmUgYmVjYXVzZSB0aGV5IGhhdmUgYmVlbg0KPiAtCQlIT1RQTFVHR0VE
IG9mZiAoc2VlIGNwdS1ob3RwbHVnLnR4dCkgb3IgZXhjZWVkIHRoZSBsaW1pdA0KPiAtCQlvZiBD
UFVzIGFsbG93ZWQgYnkgdGhlIGtlcm5lbCBjb25maWd1cmF0aW9uIChrZXJuZWxfbWF4DQo+IC0J
CWFib3ZlKS4gW35jcHVfb25saW5lX21hc2sgKyBjcHVzPj0gTlJfQ1BVU10NCj4gKwkJSE9UUExV
R0dFRCBvZmYgb3IgZXhjZWVkIHRoZSBsaW1pdCBvZiBDUFVzIGFsbG93ZWQgYnkgdGhlDQo+ICsJ
CWtlcm5lbCBjb25maWd1cmF0aW9uIChrZXJuZWxfbWF4IGFib3ZlKS4NCj4gKwkJW35jcHVfb25s
aW5lX21hc2sgKyBjcHVzPj0gTlJfQ1BVU10NCj4gDQo+ICAgICAgIG9ubGluZToJQ1BVcyB0aGF0
IGFyZSBvbmxpbmUgYW5kIGJlaW5nIHNjaGVkdWxlZCBbY3B1X29ubGluZV9tYXNrXQ0KPiANCj4g
QEAgLTE3Myw1ICsxNzMsNSBAQCBvbmxpbmUuKTo6DQo+ICAgICAgICAgIHBvc3NpYmxlOiAwLTEy
Nw0KPiAgICAgICAgICAgcHJlc2VudDogMC0zDQo+IA0KPiAtU2VlIGNwdS1ob3RwbHVnLnR4dCBm
b3IgdGhlIHBvc3NpYmxlX2NwdXM9TlVNIGtlcm5lbCBzdGFydCBwYXJhbWV0ZXINCj4gLWFzIHdl
bGwgYXMgbW9yZSBpbmZvcm1hdGlvbiBvbiB0aGUgdmFyaW91cyBjcHVtYXNrcy4NCj4gK1NlZSBE
b2N1bWVudGF0aW9uL2NvcmUtYXBpL2NwdV9ob3RwbHVnLnJzdCBmb3IgdGhlIHBvc3NpYmxlX2Nw
dXM9TlVNDQo+ICtrZXJuZWwgc3RhcnQgcGFyYW1ldGVyIGFzIHdlbGwgYXMgbW9yZSBpbmZvcm1h
dGlvbiBvbiB0aGUgdmFyaW91cyBjcHVtYXNrcy4NCg==
