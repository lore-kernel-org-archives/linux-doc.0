Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4C14C678DC
	for <linux-doc@archiver.kernel.org>; Fri, 18 Aug 2023 11:06:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238236AbjHRLGP (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 18 Aug 2023 07:06:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55712 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238043AbjHRLFr (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 18 Aug 2023 07:05:47 -0400
Received: from mx08-00376f01.pphosted.com (mx08-00376f01.pphosted.com [91.207.212.86])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E9B630C2
        for <linux-doc@vger.kernel.org>; Fri, 18 Aug 2023 04:05:46 -0700 (PDT)
Received: from pps.filterd (m0168888.ppops.net [127.0.0.1])
        by mx08-00376f01.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 37I6JQ5U017099;
        Fri, 18 Aug 2023 12:05:38 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=
        from:to:cc:subject:date:message-id:references:in-reply-to
        :content-type:content-id:content-transfer-encoding:mime-version;
         s=dk201812; bh=xoUU4VWny3yKfaEfdXVT0PuCQG1MsYkXNA8eimXrQww=; b=
        OpE/Gln1FTAHa1VcRH/S4j/DK7U6zgVase6lCNRwR4y5IEGZvEQoEEsdezTqIslg
        x8Bn9UHA+zHUNHIuy/TNu6rU0r7yOpMewJnP7Ov4OoQgQBUD31L45NUKrz5GKN5M
        xkz3PNODBDXU2fmzRf5Zgimp8aYAQNR1vB9eJ+tmGFRgzRTXex1+CLFx8ZurXOeS
        eCI9rZAn6IOuVWJvfmhQxDepvXmnCdtF6FNLtvsnwL/yk0jv3Gnsv3Xsgryd0W7K
        B1KmKyTWfo7f1EEB9RPxvrY6XAlFfSW2b8fY9DfO4SXqa9HfkAAlBoATVHR6KuxB
        Zm3a0REn9wC+sjGPH6MHpQ==
Received: from hhmail05.hh.imgtec.org ([217.156.249.195])
        by mx08-00376f01.pphosted.com (PPS) with ESMTPS id 3se0brcm26-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
        Fri, 18 Aug 2023 12:05:38 +0100 (BST)
Received: from HHMAIL05.hh.imgtec.org (10.100.10.120) by
 HHMAIL05.hh.imgtec.org (10.100.10.120) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 18 Aug 2023 12:05:38 +0100
Received: from GBR01-CWX-obe.outbound.protection.outlook.com (104.47.85.41) by
 email.imgtec.com (10.100.10.121) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27 via Frontend
 Transport; Fri, 18 Aug 2023 12:05:37 +0100
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PwpU1Csfp6fu5v99o6Twjxa7IdmwIxOlicTVFYmji38aQN1NIeh/jKJ53/y+Kwrv2biSasrNLTyeKbpadSqXsFFc2qwkZV+ZDHo2mPiTVnXs/Q2nXMIc8iptIs3T38iuCbCVINTZYRpDsgcNRt+GK6P5YHOGJm/Fu1dFxnDNDFtfF9R5evqVVZNo+LeAzBDdNFQ/mNCJ9bitHG3wtaWnb9lmrx6jUm1qmB3pKdYFvAwyPyYcqk+hDZbcC1MWw7bfbve29AqP/req8K6uDqqkNN+3HcatVk5nT9Pxaui+nW9k4xRrlLFJgXMAUHPGSThsASLlgvDBlg3msG6K020GPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xoUU4VWny3yKfaEfdXVT0PuCQG1MsYkXNA8eimXrQww=;
 b=MYI5ypainFj7JscsNim6/4rZM0+SJDaP6yTsAf/XHIR5s8RjmfScs+aUGO0eVCpsXknGZ3vsFmJcl8PzYsilOWgWl90UQbBJeBir7wXTK8/A4m1OAq/E/SThR8/fIPa60ChbBB+29nU+MSdMy/sljEOKTmf84Uk150enaooGGZPilTAY0LbZ6lA0/ksdMxiO5SOAFxVkxsPFvsNTvOCVVNAWU5fE2S1PjnfkOpccB/wHHKrz+6iTPXErGMffQjckCzNYMUtFUp8cCMhq7OPewHTKf6m3ZKN2oTeULLpkxr0sNKx46g1leqo5UCGIvWiFGV3p0fjZuM+DpNZiJbGXbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xoUU4VWny3yKfaEfdXVT0PuCQG1MsYkXNA8eimXrQww=;
 b=AeuTga6zVloL8Yz8F/6BrdqdVxF09o0bpsvMhMh9ZaQUhvNtA9/1PkQk+YkPvgGiExLBRilrcYubIegmbzLt0YlntbtmxXbL0t3KdRsve6g4FLs8gDp9eEbru+vfA/g0wiq9mPC3DZM7FV452fzgZZlmcMLj7IB7n1uiAeeuf94=
Received: from CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:170::9)
 by LO4P265MB6917.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:34b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.20; Fri, 18 Aug
 2023 11:05:37 +0000
Received: from CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM
 ([fe80::ee4f:2d71:fe8a:ffdf]) by CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM
 ([fe80::ee4f:2d71:fe8a:ffdf%7]) with mapi id 15.20.6699.020; Fri, 18 Aug 2023
 11:05:37 +0000
From:   Sarah Walker <Sarah.Walker@imgtec.com>
To:     "corbet@lwn.net" <corbet@lwn.net>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
CC:     Donald Robson <Donald.Robson@imgtec.com>,
        Matt Coster <Matt.Coster@imgtec.com>,
        "mripard@kernel.org" <mripard@kernel.org>
Subject: Re: [EXTERNAL] Re: [PATCH v5 16/17] drm/imagination: Add driver
 documentation
Thread-Topic: [EXTERNAL] Re: [PATCH v5 16/17] drm/imagination: Add driver
 documentation
Thread-Index: AQHZ0BudA90fopbOfEiJWmXiMZHOgq/s41kAgAMENQA=
Date:   Fri, 18 Aug 2023 11:05:36 +0000
Message-ID: <bc3ca6ad9fb1633fa6ea076d65fcf34414b06212.camel@imgtec.com>
References: <20230816082806.164968-1-sarah.walker@imgtec.com>
         <87r0o3rvip.fsf@meer.lwn.net>
In-Reply-To: <87r0o3rvip.fsf@meer.lwn.net>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CWLP265MB4817:EE_|LO4P265MB6917:EE_
x-ms-office365-filtering-correlation-id: a5ad9746-8480-459f-427e-08db9fdb0d21
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: VpYpzao1jQI7lpeH4l9hIxc4Q2J9cBcU7BVdAYznvDDgqgF8FK/RAYUax90pBLeMWMpOggNalVcsFxaRoQjCCcBNnwLCb3ElHaIxsse81q4NEmrZ/E8ozUB7qgpfQdf12BRSlhd68mVYpOXKSRFWKXbXdBiQpEUCJP5s+B7Y2/VRElK2bYtZb7sS0r49aGKNm40zjWjtGcVNrsxOsFce0SPDmY3sD6P+fuUZKyLZlF9FWXK3+Bj8dzi4nKBYjeJkQO7acHbIM6cY+rf0Gdtsxc64lc/5hXjqr9QJ9yShY8bRaGTpSVltPYBpDof/Zhssaevfr5VOpGbQNW/k6bwwm+g6arJUsHt9c1+1JrqhV7aQl8HAOSFtaBoPBhCm1dEH4O1zLYxRL3Ry9iRw13JG0ZxQYCusPyMsXLyQ2/4oH3hwIgH1GPovMwHLGqlpw8kn/gR9Lin2dmfTjsHF/o97Wlct2M8iFD47ARUjfoBl4wc/xP2p+QCzS7C4qRSC2egGQYk5r/ppVPXRc5fD0/dNSVBuPGFrrSnKhCIGTSlLsWKWPkmFhAuD9i9EtQcuLq2E9mip2VdHO2BX6l81NNXGfCsq2Da3e5RMLxGWPpIgNoE=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(39850400004)(346002)(136003)(376002)(366004)(396003)(451199024)(186009)(1800799009)(2616005)(26005)(71200400001)(6486002)(6512007)(6506007)(83380400001)(5660300002)(8936002)(8676002)(4326008)(2906002)(4744005)(478600001)(41300700001)(76116006)(110136005)(66946007)(54906003)(64756008)(66446008)(66476007)(66556008)(316002)(91956017)(38100700002)(38070700005)(122000001)(86362001)(36756003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OFNYOW1VOWZIbG0zRmVxL2krdXZxT0g1STdieElxQjdVYW1SL3ZGNXNkbjFD?=
 =?utf-8?B?SW1CNUEyZStxOHd5UC8rZ0NCUk1JanNaKzFqM1V6LzBYeFBLYWxhLzlPYndC?=
 =?utf-8?B?d2ZJM25CZDhkOXJtSVdKTFhQczhjLzh1RW9UcUhkTk1ycUVQYkxQTFc3NmRP?=
 =?utf-8?B?eTBjdFpGcHFvYWt1c3Z6dDZzMnRxRnpkUlNJbk52YlVzdkpNVVNyZGhUVmFI?=
 =?utf-8?B?TGs1YUN2eW9pejk0MS9YclFPT3AwdXdFeStRS3FmNXNndGNCQnh6czkvRFhB?=
 =?utf-8?B?UXpVMjExcEdQd2ZGWENadGJXVGJZUWNoeC9HQmlEaTB2TEo2eGxINzRkUUFC?=
 =?utf-8?B?YXhZTkR6NngwYml5VmpObG9EcEhjN1VMUEdMV0tQS094dkVsOG1qYjdMTlJL?=
 =?utf-8?B?dVF4N3U0NGM4OEg5bnZNY2N4MFpGdktJS3JDY1BLdEdvUEx2d01HRjFiS3NO?=
 =?utf-8?B?Z0kyWnNYVGNFbTdHZ1I1WU5GL1lmNkpkQnJSQ0RPVkJZOXVqdmNsa3Z3dWZx?=
 =?utf-8?B?aXpiVUZNZlQxazdzNitteEFuZGhqQXI5cHl4SUVoU05iVjl1MnJ1eGZpV0VI?=
 =?utf-8?B?ei8xSDlnZmM5R2FzWmk5Ulh4bHVOZVF5ZzRoZ3g0eE1lS1NSUTAySmNoamdt?=
 =?utf-8?B?UzBtKy9ESjhCWGtHVGdZV25LRVFoSVRQTCs5ZGd5NlJLMVU3Mm5ocWRvOFh3?=
 =?utf-8?B?b1o4dGtoSDBLMjIzQzlpeGFlN1NMdDAzN2FPaGI2cHNDci9qR1VRSkpkT0ZO?=
 =?utf-8?B?aW1qNXp4UENVdTFXeEFnYTRlZDU5V2dBVEg3NGR4UmZMcVY5YUpJajVvQkQr?=
 =?utf-8?B?RG1iYlB5WmlKSllyS1R3Q3ZicjFXQnJ5RmkzOUEyRkM0QmFUN2lQV29yTDZH?=
 =?utf-8?B?QmhIU1ZOZnVEV1BMbEtMVWlPN09nSGFUWmpCbld0TThvQUFTak5SRS8xeUtk?=
 =?utf-8?B?RUNOUmtFaWc4QmNHN3RJSmhiK0pkMHNnN3VnaGxlNEJxVDRJZWRwcm5mU0RN?=
 =?utf-8?B?Q3FkR0wvWUE0UWtMaHdsWGExamVMUmVNNXhsQnFKRVMzdmxUdzJsSEdKeC9J?=
 =?utf-8?B?bmdITEpralBjNnBXbHNHcFpRU1hwWU02R0xHQmpNc3JPRG1SdlFtNFBUaGln?=
 =?utf-8?B?bCtZdzlwS2Y2Yk5VV2dsL2FTYkQ5NnJJZXRteUgvZ2VQRFZjdXBWRWh3cjZF?=
 =?utf-8?B?NEo3S0szNXpxVkN1UTdOU1J0UnZLNE9zL3Y1YzhlcTIxT2kvRHgrMGlkZktC?=
 =?utf-8?B?amVnQ256L2tGdWIweU0zZEdZN2NQZjhMTnFTS0xLMVI3OVBJU0g5RjRiMHdw?=
 =?utf-8?B?VUZsVTZNMUJsWlBsVjNnSHExL2xhZCtnNEpiKzB0MzdsSXBmZHIwbVZrcVJ5?=
 =?utf-8?B?OUtXd25nMjRtNm51eXFpbWYwN2l6cFovRm1FSkJvc1JzOEpQbVFGNDM4ajJq?=
 =?utf-8?B?V2d5c3ZONDFGa0lTNUdQRHUweE4wdXBEdzRvQkRxRW11QXdJc01hMGUxYmxz?=
 =?utf-8?B?c1lYVnBScDFlMU1XR2Q2NWgyR1dENjhIZ0tBSk91MjNvTmJtWTVOL1FOaUVF?=
 =?utf-8?B?U3RNcmY1MXA5VHNGd2xESVB5ckVkNkJtd1pTMm93SUcxYUFQbzdxV1NjL2Yy?=
 =?utf-8?B?WFkxOFJCcHllTm9zbXlRREQwTXhMRnJSMG0vN0JKdlA4b2VRdEVic2ZFaTlT?=
 =?utf-8?B?Q3FMNDkzamhKK1dpM2tOVXR6L1FBWmZWamRFcHBVNVlGOUdGOHgwRVlibVcr?=
 =?utf-8?B?WVQxWEhaUEszWXFmM25hMjVVN3BPRWhqVUdIcW01UEJ3NlBaQ1c4QmxyeXlk?=
 =?utf-8?B?QTcvZUhYWlZEOTZZYzc3Wmw5bW9ta20rdzFVNGlqVVBCTDhISFo1NzdhNnVF?=
 =?utf-8?B?SVlNTTdDVUxtamdOaEdENjF1QmE1UjdFNkZMUWpRWHAwYVdsbGE2YXQ4WWxT?=
 =?utf-8?B?SU9oaW1nTTBTdTdKVjVaZTErQVJEWHBiQndFdjhqN3p3M1Rhc1BrTS90MW9k?=
 =?utf-8?B?VmJzN2RXSUtxdjdUQ3NmY20wMXY4UldySTViZ0FjSWU4R202K2RFNnRqdlFD?=
 =?utf-8?B?bUJXZjRkRGFCVFN1ODl1ZFN6eDZ4c3pjbWZ2b2NTWk16R05iRkJWRno0TTh4?=
 =?utf-8?B?WXBTSzg3S1JYUFBaOWRxNUFuZ0c5NzMyaHFkRjVQL2h4KzRDMzFJYTkwTEZj?=
 =?utf-8?B?T2c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <38B3B7694FC3374B8864E2DDCFFAC471@GBRP265.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: a5ad9746-8480-459f-427e-08db9fdb0d21
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Aug 2023 11:05:36.9638
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6V/U9lHhJCj59q+WF0LGU4UJ6k6W0RWLwJK3EAJYjjLSTLO+lOjiLdEwtgoZLwThWJbttVHpH1ABsdIriU/HQw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO4P265MB6917
X-OriginatorOrg: imgtec.com
X-EXCLAIMER-MD-CONFIG: 15a78312-3e47-46eb-9010-2e54d84a9631
X-Proofpoint-ORIG-GUID: gqT2MjSUurzcTJJMH8-iWExoTtPvTBkX
X-Proofpoint-GUID: gqT2MjSUurzcTJJMH8-iWExoTtPvTBkX
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

T24gV2VkLCAyMDIzLTA4LTE2IGF0IDA3OjAxIC0wNjAwLCBKb25hdGhhbiBDb3JiZXQgd3JvdGU6
DQo+ICoqKiBDQVVUSU9OOiBUaGlzIGVtYWlsIG9yaWdpbmF0ZXMgZnJvbSBhIHNvdXJjZSBub3Qg
a25vd24gdG8gSW1hZ2luYXRpb24gVGVjaG5vbG9naWVzLiBUaGluayBiZWZvcmUgeW91IGNsaWNr
IGEgbGluayBvciBvcGVuIGFuIGF0dGFjaG1lbnQgKioqDQo+IA0KPiBTYXJhaCBXYWxrZXIgPHNh
cmFoLndhbGtlckBpbWd0ZWMuY29tPiB3cml0ZXM6DQo+IA0KPiA+IEFkZCBkb2N1bWVudGF0aW9u
IGZvciB0aGUgVUFQSSBhbmQgZm9yIHRoZSB2aXJ0dWFsIG1lbW9yeSBkZXNpZ24uDQo+IA0KPiBP
bmUgbGl0dGxlIHRoaW5nIEkgaGFwcGVuZWQgdG8gbm90aWNlIG9uIGEgcXVpY2sgZ2xhbmNlOg0K
PiANCj4gPiArQmVnaW4gYnkgY2FsbGluZyA6YzpmdW5jOmBwdnJfdm1fY3JlYXRlX2NvbnRleHRg
IHRvIG9idGFpbiBhIFZNIGNvbnRleHQuIEl0IGlzDQo+ID4gK2JvdW5kIHRvIGEgUG93ZXJWUiBk
ZXZpY2UgKDpjOnR5cGU6YHB2cl9kZXZpY2VgKSBhbmQgaG9sZHMgYSByZWZlcmVuY2UgdG8gaXQu
DQo+IA0KPiBSYXRoZXIgdGhhbiB3cml0aW5nIG91dCB0aGUgOmM6ZnVuYzogaW5jYW50YXRpb24s
IGp1c3Qgc2F5DQo+IHB2cl92bV9jcmVhdGVfY29udGV4dCgpLiAgQWxsIG9mIHRoZSByaWdodCB0
aGluZ3Mgd2lsbCBoYXBwZW4sIGFuZCB5b3VyDQo+IGRvY3VtZW50IHdpbGwgYmUgYSBsb3QgbW9y
ZSByZWFkYWJsZS4NCg0KVGhhbmtzIGZvciB0aGlzLiBXaWxsIGdldCB0aGlzIHNvcnRlZC4NCg0K
VGhhbmtzLA0KU2FyYWgNCg0KPiANCj4gVGhhbmtzLA0KPiANCj4gam9uDQo=
