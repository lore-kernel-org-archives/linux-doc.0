Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 756E5C07E9A
	for <linux-doc@archiver.kernel.org>; Tue, 13 Jul 2021 01:26:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 56613611B0
	for <linux-doc@archiver.kernel.org>; Tue, 13 Jul 2021 01:26:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230396AbhGMB3i (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 12 Jul 2021 21:29:38 -0400
Received: from esa9.fujitsucc.c3s2.iphmx.com ([68.232.159.90]:6442 "EHLO
        esa9.fujitsucc.c3s2.iphmx.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230247AbhGMB3i (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 12 Jul 2021 21:29:38 -0400
X-Greylist: delayed 428 seconds by postgrey-1.27 at vger.kernel.org; Mon, 12 Jul 2021 21:29:37 EDT
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
  t=1626139609; x=1657675609;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=SQFxg65RNsWBMMTlZP0yb4+BTEpg3PFW8VUtoJh0qs0=;
  b=xC01+UDk1ZnVcQB2K5d2R+eAiWTTisR1ILV3dHIwmP4jAT4LDYA392xE
   CnYLER/hzVYRT+rmL/49yDOUYstzpdYg4B6lZFeuz2+/83v9nNR4PQ1Ff
   oe6lSQSJ6nPHsoVu6uF6KSJCdXRyP2Yyk3mx2m7gBkENxEbURTjNe2spY
   vi2c2HJz76AW0uW5K8LXMc88tmIDIrjuST4n4M5Sr9lulaHE7fMygZW3k
   kZ4IJ5tkp1rAq6VeYExc9DRge4db2I51icdu10BDxZkX+SlMgUQdvTLSF
   /Uqduj/CEPtWhKh0bVS8pnhMkJ7FM1qwa6Dt4cZBXzpipmVgTVpVTaC9m
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10043"; a="34850045"
X-IronPort-AV: E=Sophos;i="5.84,235,1620658800"; 
   d="scan'208";a="34850045"
Received: from mail-pu1apc01lp2051.outbound.protection.outlook.com (HELO APC01-PU1-obe.outbound.protection.outlook.com) ([104.47.126.51])
  by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2021 10:19:38 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ffxArnwXAcJyVI0cln0qezWMeSYfHM8j+Evw1gQBbmmgSgrbSaAffhlz0fxB9VpDiypVOiMteqbDS0A/Uv9iXFUcP9Hiu3yfMrYoC3STxQRRop4vJGfnlRJMbsPGQ9KDRlzY9A2vwYxtBQZQEnA65Y4qGpqDXk8Zdf35ZUhcmPr46Ed5lwvg6oN8CSPjK82sJeidwpBAUPX84UrwJP9UZBRN7HxsCDQZ+ngd2o0LjFvenNbbtxqTS+A6FkPUb1I7kFVHf/GTihQbsJ6vZqlVK1eBVmTn9+0b0UmK9HQjLEnw1OSJ70fLSrD6xIWAiBbKtyn5oAy/GNdk1PS1W4Vagw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SQFxg65RNsWBMMTlZP0yb4+BTEpg3PFW8VUtoJh0qs0=;
 b=UtRvMXYnamrCkz76aOT4CcuE5Xdf52/UHj0oZQm2bL/Mutt94Scedlr3D0soTei5FZ+QkE8Lr9fPPk3Y7mlOwilIqs2ktaEQ1h8m0Fjh7QCUJQbmWOcZJ7TYQT3rNpQeoiIXTT9WUbe5vfV9WKhTPRRsZ9eOvcehUBycJZvz9aRlr1UUWRedojwF3eY/2gYdcJL7DGhDkbOpIh95QXAeharloz6b/CGtqJVUkycb9Y+vsB3myjIbgwUxiEDfZ4dIyQYChSf6OeMJetkcakykSYDO7AodhlhjXa7EBAHDk/++/X+woCKnMnAPURA04qfMx3lLALoUFMiDH+bT6o+/Ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fujitsu.onmicrosoft.com; s=selector2-fujitsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SQFxg65RNsWBMMTlZP0yb4+BTEpg3PFW8VUtoJh0qs0=;
 b=LmCrZG9Wp1z25bprWCIckEBAY3NMyyxnBzUsJSN/YFn6vA1mNNbdeQCtlOMtOHuSdTQd2nZpTEZng8+Hghxzwl897C7yJqzAT8gItQ7LRMUX39tDI6OXd4laBSZqmZkfkjPeVqWHqUDSI6TjE5n7qtolPcXP6pKJJJ2X1D7XlxU=
Received: from TYCPR01MB6544.jpnprd01.prod.outlook.com (2603:1096:400:98::6)
 by TY2PR01MB3915.jpnprd01.prod.outlook.com (2603:1096:404:d3::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.22; Tue, 13 Jul
 2021 01:19:35 +0000
Received: from TYCPR01MB6544.jpnprd01.prod.outlook.com
 ([fe80::2da1:e1d8:ba88:a4e0]) by TYCPR01MB6544.jpnprd01.prod.outlook.com
 ([fe80::2da1:e1d8:ba88:a4e0%3]) with mapi id 15.20.4308.027; Tue, 13 Jul 2021
 01:19:35 +0000
From:   "xuyang2018.jy@fujitsu.com" <xuyang2018.jy@fujitsu.com>
To:     Jonathan Corbet <corbet@lwn.net>
CC:     "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
        "mchehab+samsung@kernel.org" <mchehab+samsung@kernel.org>,
        "bigeasy@linutronix.de" <bigeasy@linutronix.de>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
Subject: Re: [RESEND] admin-guide/cputopology.rst: Remove non-existed
 cpu-hotplug.txt
Thread-Topic: [RESEND] admin-guide/cputopology.rst: Remove non-existed
 cpu-hotplug.txt
Thread-Index: AQHXZ9BiSb0hSFRg+EW3KrulNhfPL6s/ou0AgACX3AA=
Date:   Tue, 13 Jul 2021 01:19:34 +0000
Message-ID: <60ECEA44.1040306@fujitsu.com>
References: <1624412269-13155-1-git-send-email-xuyang2018.jy@fujitsu.com>
 <87h7gzqzhb.fsf@meer.lwn.net>
In-Reply-To: <87h7gzqzhb.fsf@meer.lwn.net>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: lwn.net; dkim=none (message not signed)
 header.d=none;lwn.net; dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 244cc2e8-92f8-41ae-2111-08d9459c4692
x-ms-traffictypediagnostic: TY2PR01MB3915:
x-microsoft-antispam-prvs: <TY2PR01MB3915A8F0A1B1F8D1EB0EE7F6FD149@TY2PR01MB3915.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2089;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: JkGvMYdmw1VQgC3mBlZbVwaY3mn6UFTm2TlBUGZhDCQ6HnpuaLgOwyz7zyKMI3hyr6mzj9tA3DuWqsJ/On9tIzGCZ1apz/n91o80oI8ack+guuzykeZ7iuu68BConOq/iBkDiwkFnzstnTYcGDWYg0ujjCsLF+2TY1Cj52yIJAp2pyYc6hnxr38iP703ahC++b+5FwrPtEzL7e5cQO8QUyRFsIKbTPMjy1v1XIHGtKs903X79x0rtV3DVezJ6kFYwW/W+5FbasBJdk0PQBRX2k9ZFe8ha/boUqU11bY3PD0DkA42cI/BBl/eLZ9RopxZ08vTzdYRXZ00oLRmcnuZYCPnBHkj2iLqBfOoC5e7zCeUl5ZxPPQfU4djc4MGWMF6tCBu27QgjsW2AVeAi+pm2gNfdM9B9R9kKU97eLMvkbGjskKNuNcptpaoxV7Vq0vZDN1Udoh4ZsDFsd6QLKM9L2b+fJuiJsAK2HMaGkQcqK9mvnUHe02eLp1bx7Uh5ECZ4IQPxC5+jdAt/DK19pRe5xVcrNSmfdg6gxStEHjfVBAPHBI7ivkjU89xcG8/uzQ81VEcMsvYJxkKsIFkhN+q7sj/g67Niz6xBp/fJG0EZBStbtQLgwsjEe8Wkgl82jDB+YhMtGvKsGUw0GA1eeLQmQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB6544.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(136003)(39860400002)(346002)(396003)(376002)(2906002)(6512007)(6916009)(316002)(122000001)(85182001)(33656002)(83380400001)(8936002)(6506007)(86362001)(87266011)(186003)(26005)(478600001)(8676002)(71200400001)(36756003)(38100700002)(66476007)(66556008)(2616005)(66446008)(4326008)(91956017)(5660300002)(54906003)(64756008)(66946007)(76116006)(6486002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?gb2312?B?bysyU1hIbmFXRktjL25mVGtmallsa1JwdkQ5NkpmcVVnS2U5cU96a0JJRUJF?=
 =?gb2312?B?RWZYMnlhZzYxbDlyb1hob201STNSbnMwVFVvREVmT2NVQ2h4T294NHBoNmVw?=
 =?gb2312?B?SWFMNTBQM09Mb3Z4bFIrRm15bmtDNHBzbno2Mjh4Mkg3WFhLbmVibHBnNXg5?=
 =?gb2312?B?aXl6eHRlVVlvTTBTT04zUzAzQjNlQ2JwZTloMHJBNTl4VVNWTk9CNjVKZS9O?=
 =?gb2312?B?NHE3cDNTUG1UVndrVjY3bXgwRmxwdGI0L1dhOEJZRHJDWU5XejBseERnTjZU?=
 =?gb2312?B?SUQrM2xxdWtGOVlMNEZUWlZVY2kra1pTMjNuSGlMM1FvdDdRMmNGOTJBYjda?=
 =?gb2312?B?emtNdGxzUno2SnJXQ2tGSVNMZUU2ZkQ0dm9uM2VBQ1hPMHBGUUlQbjVCTEJ2?=
 =?gb2312?B?aExmMHByKzZGRVN0a1d2RS8vUEh6QWZLSm1qTFhSMW9pemhKMXh6WWVzMDZG?=
 =?gb2312?B?cGFJcUlWaWF2bS9aSFRJb1BJeE9xcGx2cFlzbXBLcFkrYWFIZCtxM2t1UkFo?=
 =?gb2312?B?aU5vbjdaT3N3ejAvNzF6WDFBekU3L2NqaVNNSkVFN3lhSEQyQkZ1Y0lmQjho?=
 =?gb2312?B?REs3TkZMZXZHRU9XN0hZSjU3Wkp2UmZEd2VBam1oaENzdHZ3YVk3WUlTeTZm?=
 =?gb2312?B?alJIQWJkZ1VmcThFcWxTRURIK1NJOFFnYkJRamlOR0dFd0dONXdqbktvc0dZ?=
 =?gb2312?B?MFg1OWFKZnh1K3FwbWhuTUhkRWtudjBWdmhmc3dnemtQWkR3V3VSNG9FcVlU?=
 =?gb2312?B?V2FWU1dtZ2hhcUowd0k5ZHRlWXdhRk1OeEZnSTczOEgwVVgrT3dVVys0VWJa?=
 =?gb2312?B?cnpudm9lM08yTGRDUklHQitxMmVMamlHdmdtSnB5L3lQMytlR2dSSndod1Rs?=
 =?gb2312?B?MjJ6WnVyQmpYcm9sLzZwWUhBVEtMUjFlZWRSMkx2bU0wYTV0anE2TXoyZS9N?=
 =?gb2312?B?b0ZScUh4ellaOXFzSm42b0JBcXlrbzhoaU51R3FIZWQ1S3QrRUtUWGZxQ3Jn?=
 =?gb2312?B?Z05BOG9uSllMcUJHd0NyeEl0VUZnQnBPYkJUR3hGQndFYmhKVXFKWXdQZGlC?=
 =?gb2312?B?SFdkZDRqQjRLQ3BRNWlPNkNySm8vVFNxdldmVzR2Mjh6SjRMdjdrS1NObTFN?=
 =?gb2312?B?RDBvamhwbGcxZEtHVjBqUkpsWTl5YVNmMVUwUjdqTmZITXNtcnEvWDh6WTll?=
 =?gb2312?B?bVAwM0xVNnVwUk5TaktnRTh5c1hEYzV6eUN5QnlYWXBwOWRJL3dZV0lnVEE5?=
 =?gb2312?B?b3hocXA5VlUreFFNTW9hQW9SNnZUcVdsMWMwMWNRbk9FdVZ0R01CQkYwQ2pv?=
 =?gb2312?B?SGo0NWI1RE5yVGtyTktwMno4SkZnTzZQejdsRGRwYWdodFVlQlFkbGhibHly?=
 =?gb2312?B?MG9veHVTejZYc1F6NEhWTXJ3VW5jdVpQMmFOejBlNkEzYTN6d0FmSW1sYk5m?=
 =?gb2312?B?d0VtcUxvZlZrUGczTU5jczUxaEdOUGRuemZvallpWVc3bjBhWVM1VkZycDdJ?=
 =?gb2312?B?cFlyM25SUWpWTWlyM2VJVnhRRjNkZDdLQkpmQzMrKzBpTXptMno2S3M4ZFU5?=
 =?gb2312?B?bGlVVXRtQ2VySTdsWFNDcGRrWkhmaGkwMWgwK29MeTJ4Y0hqcWJRbkU3R1dL?=
 =?gb2312?B?WGdwaXBZS2hSQmozb2NjTTZhbUloWmJXcGgzRm9aM0w0RzNBUUpma1FCS1JP?=
 =?gb2312?B?NGhLYWc2bHYzKzBVYmxrUFF5KzFibmJQTi9wZWppd2c5WjR5Ty9MMDE5TjNB?=
 =?gb2312?Q?GKd3W2/k/Zhq4+dxXWdZ6qMhdXr14Uyf8xW68bh?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="gb2312"
Content-ID: <1F048CFD56D479448B457C28EFE44B30@jpnprd01.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB6544.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 244cc2e8-92f8-41ae-2111-08d9459c4692
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jul 2021 01:19:35.0045
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: a7FS516VabXMKstGIuxeuPHAg8jMUnSlNzgeCBxjh0FF+/jsJjcH7v3/gCrtq3DIbSshBoWTuQpWjzLhjI/pndR7xMlryaNxL7xh9ery3/M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR01MB3915
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

b24gMjAyMS83LzEzIDA6MTYsIEpvbmF0aGFuIENvcmJldCB3cm90ZToNCj4gWWFuZyBYdTx4dXlh
bmcyMDE4Lmp5QGZ1aml0c3UuY29tPiAgd3JpdGVzOg0KPiANCj4+IFNpbmNlIGtlcm5lbCBjb21t
aXQgZmY1OGZhN2Y1NTZjICgiRG9jdW1lbnRhdGlvbjogVXBkYXRlIENQVSBob3RwbHVnIGFuZCBt
b3ZlIGl0IHRvIGNvcmUtYXBpIiksDQo+PiBjcHVfaG90cGx1Zy50eHQgaGFzIGJlZW4gcmVtb3Zl
ZC4gV2Ugc2hvdWxkIHVwZGF0ZSBpdCBpbiBoZXJlLg0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6IFlh
bmcgWHU8eHV5YW5nMjAxOC5qeUBmdWppdHN1LmNvbT4NCj4+IC0tLQ0KPj4gICBEb2N1bWVudGF0
aW9uL2FkbWluLWd1aWRlL2NwdXRvcG9sb2d5LnJzdCB8IDEwICsrKysrLS0tLS0NCj4+ICAgMSBm
aWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkNCj4+DQo+PiBkaWZm
IC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9hZG1pbi1ndWlkZS9jcHV0b3BvbG9neS5yc3QgYi9Eb2N1
bWVudGF0aW9uL2FkbWluLWd1aWRlL2NwdXRvcG9sb2d5LnJzdA0KPj4gaW5kZXggYjkwZGFmY2M4
MjM3Li5jYzI4YjFhMTYzNzEgMTAwNjQ0DQo+PiAtLS0gYS9Eb2N1bWVudGF0aW9uL2FkbWluLWd1
aWRlL2NwdXRvcG9sb2d5LnJzdA0KPj4gKysrIGIvRG9jdW1lbnRhdGlvbi9hZG1pbi1ndWlkZS9j
cHV0b3BvbG9neS5yc3QNCj4+IEBAIC0xMzUsOSArMTM1LDkgQEAgc291cmNlIGZvciB0aGUgb3V0
cHV0IGlzIGluIGJyYWNrZXRzICgiW10iKS4NCj4+ICAgCQlbTlJfQ1BVUy0xXQ0KPj4NCj4+ICAg
ICAgIG9mZmxpbmU6CUNQVXMgdGhhdCBhcmUgbm90IG9ubGluZSBiZWNhdXNlIHRoZXkgaGF2ZSBi
ZWVuDQo+PiAtCQlIT1RQTFVHR0VEIG9mZiAoc2VlIGNwdS1ob3RwbHVnLnR4dCkgb3IgZXhjZWVk
IHRoZSBsaW1pdA0KPj4gLQkJb2YgQ1BVcyBhbGxvd2VkIGJ5IHRoZSBrZXJuZWwgY29uZmlndXJh
dGlvbiAoa2VybmVsX21heA0KPj4gLQkJYWJvdmUpLiBbfmNwdV9vbmxpbmVfbWFzayArIGNwdXM+
PSBOUl9DUFVTXQ0KPj4gKwkJSE9UUExVR0dFRCBvZmYgb3IgZXhjZWVkIHRoZSBsaW1pdCBvZiBD
UFVzIGFsbG93ZWQgYnkgdGhlDQo+PiArCQlrZXJuZWwgY29uZmlndXJhdGlvbiAoa2VybmVsX21h
eCBhYm92ZSkuDQo+PiArCQlbfmNwdV9vbmxpbmVfbWFzayArIGNwdXM+PSBOUl9DUFVTXQ0KPiAN
Cj4gSXMgdGhlcmUgYSByZWFzb24gd2h5IHlvdSB0b29rIG91dCB0aGUgcmVmZXJlbmNlIHRvIGNw
dS1ob3RwbHVnLnR4dA0KPiBlbnRpcmVseSByYXRoZXIgdGhhbiBzd2l0Y2hpbmcgaXQgdG8gdGhl
IHJzdCBmaWxlPw0KQmVjYXVzZSByc3QgZmlsZSBkb2Vzbid0IGhhdmUgSE9UUExVR0dFRCBvZmYg
aW5mb3JtYXRpb24gYW5kDQpBQkkvdGVzdGluZy9zeXNmcy1kZXZpY2VzLXN5c3RlbS1jcHUgZmls
ZSBmb3Igb2ZmbGluZSAgYWxzbyBkb2Vzbid0IGhhdmUNCmNwdS1ob3RwbHVnLnR4dCBvciByc3Qg
ZmlsZS4NCg0KU28gSSB0aGluayByZW1vdmluZyBpdCBpcyBiZXR0ZXIuDQoNCkJlc3QgUmVnYXJk
cw0KWWFuZyBYdQ0KPiANCj4gVGhhbmtzLA0KPiANCj4gam9uDQo=
