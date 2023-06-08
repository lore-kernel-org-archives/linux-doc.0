Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 501C7C7EE2E
	for <linux-doc@archiver.kernel.org>; Thu,  8 Jun 2023 09:32:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235846AbjFHJc4 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 8 Jun 2023 05:32:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39054 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235864AbjFHJcv (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 8 Jun 2023 05:32:51 -0400
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4161F26AB
        for <linux-doc@vger.kernel.org>; Thu,  8 Jun 2023 02:32:05 -0700 (PDT)
X-UUID: 51a6408e05df11eeb20a276fd37b9834-20230608
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=RDw+rxq1YYQTxdN2OjsYjQ0HRCgb8esYBacVkNtLNHk=;
        b=MheprHm/QoMwrlZW5cimdKQX47tpWyWN4FP+p+6cNVI3IxJWa0Ilr8SKvP6SioHJn0djeYeKCOQhtcmywMiSOuXCBcxK61x1OB5lX/T5Tgq4iFQdKFjvEMq3+bcxLWQBGa/q8H4BCg+/pvQI+Skt9hw2JIGtPwmAbNnP6DO9Uf0=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.26,REQID:9afb9e56-b3cc-4b7b-a4e1-d230dfc984c7,IP:0,U
        RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
        release,TS:0
X-CID-META: VersionHash:cb9a4e1,CLOUDID:9fd66f6e-2f20-4998-991c-3b78627e4938,B
        ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
        RL:1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: 51a6408e05df11eeb20a276fd37b9834-20230608
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
        (envelope-from <kuan-ying.lee@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
        with ESMTP id 1899839322; Thu, 08 Jun 2023 17:32:00 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 8 Jun 2023 17:31:59 +0800
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 8 Jun 2023 17:31:59 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Fz4qdaNwQnEFzhsK05IRYSqzvuDKkGme+utWCOu+L3OmfGCONFLDu4cYG2E8MKCIAWmU4LLxxdK+ouasovnOMZDAI3aWo6rNb+eqPFN/jhnx49qFS7VsJ+p/agwrzP3yRL5x1/QnTwJVQzG01Y48FPJZMQU/QpeJqPTfIZECHMgARKl3YyeFslFaFxjeyO1nelT6HD+s/yXdLamihqoPyTPtcP28SeCiQLuyil+4Ss6i7/kSWIuHL0wbLg7F8kE/f5+WR0LKxZb7loE3mEkt22rk0qOQzSqt2N+LhFKkqP4s4PY7dKxx0r92FiBXEEshKTD6IWk7Zi0O+Leb9Lh3zQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RDw+rxq1YYQTxdN2OjsYjQ0HRCgb8esYBacVkNtLNHk=;
 b=E7/1HBpJ+r/m8jzEXGyzeUDC7upRK+qHo2jW0WRzWgzwoiK/eZpJeYnOOLCZ2MOCfOG8e0p1tYNabWKRncT/xl4/i3jF8j6EQpI5f5RvEnXlKK1JcS+G+VFW/uDDnFhUC9tiN7Aw40AmNubd1c5H01kGdQhzQYYmXb1Z8z/DIRMlC4n2JLiXSE4sxq1satuCAlw2iie0BPQEHIZeLDdZchNgGz296a0wl1c0LW6xiYkqRUjQIoxSDxAMdIRn8Wa9nA0wqH09cFWOO/UjXTK653MBlyGrmOyus519ZXrrAW3uybPEVQJUNjFMGvz/nfN9de4bwOj0j2qqdTwQsaGjSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RDw+rxq1YYQTxdN2OjsYjQ0HRCgb8esYBacVkNtLNHk=;
 b=MTEppB0kimAKmiaOAMrG//+XQBbU3J1gaXTs1wiZsKAuppqpzqBquj0RCL/MeSAxTYX+c0+XVmg4l+ZatWFcIYM6QZfR9ELIIIWkkqWfjvA/joxZU5gtjXhkBeKaB7STRKqtillfgldUNrlbM6zf0cTbFVQb273N4f4rH1ollHA=
Received: from PUZPR03MB5964.apcprd03.prod.outlook.com (2603:1096:301:b4::11)
 by KL1PR03MB7621.apcprd03.prod.outlook.com (2603:1096:820:e2::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.28; Thu, 8 Jun
 2023 09:31:57 +0000
Received: from PUZPR03MB5964.apcprd03.prod.outlook.com
 ([fe80::82c3:92b0:71ba:1f14]) by PUZPR03MB5964.apcprd03.prod.outlook.com
 ([fe80::82c3:92b0:71ba:1f14%6]) with mapi id 15.20.6455.030; Thu, 8 Jun 2023
 09:31:57 +0000
From:   =?utf-8?B?S3Vhbi1ZaW5nIExlZSAo5p2O5Yag56mOKQ==?= 
        <Kuan-Ying.Lee@mediatek.com>
To:     "corbet@lwn.net" <corbet@lwn.net>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "akpm@linux-foundation.org" <akpm@linux-foundation.org>
CC:     "linux-mm@kvack.org" <linux-mm@kvack.org>,
        "rppt@kernel.org" <rppt@kernel.org>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
Subject: Re: [PATCH] Documentation/mm: Initial page table documentation
Thread-Topic: [PATCH] Documentation/mm: Initial page table documentation
Thread-Index: AQHZmeqWWjfUET79BE6fhMyp9h3kZq+ApD+A
Date:   Thu, 8 Jun 2023 09:31:57 +0000
Message-ID: <a1690394c1f51875c85600251f7789289c798227.camel@mediatek.com>
References: <20230605221035.3681812-1-linus.walleij@linaro.org>
In-Reply-To: <20230605221035.3681812-1-linus.walleij@linaro.org>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PUZPR03MB5964:EE_|KL1PR03MB7621:EE_
x-ms-office365-filtering-correlation-id: fa8637b4-1a36-4bcd-79d2-08db6803344a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: MXC/zRkM5u/xExuoCdjqNscbtlOY0kpk0ngGSWshcVZTcNZrdmUUUHZ2JeYJMxabjLAQluX+hfbpujBNpOJZ8gHiMvnj9w4mtrP06OXrVD4gu9GZ1LSnFhIOQCI24G0ZNC9NcJCg8GfOLUSU5ce0mX/2knRafHqpCY52th6dNFBIuZqJuiKvafKYrkfmqum87Z1BYPy3VfllIudfofTX1bk9DrU8PWiT6W06RF+W2kIecLID4LnXNk24XW9supAZ2gjq9SEU5TAmZnGQ1g0Yj1vQHy9nVzKq/Y9VXc3SSFIKL3+FopGAXCA6JAV1V6maKbZ1b4jeItamNh/b+Fjr0QVYN31pxM7FLU9azVuE0CEcpRA8oVAWQUhxAx9glnvUOJhDE+Q/ePBkfCVmDaKuaNIl+HeMSFUvCbSkvqHidxxZk0R3IOix7WSyQ0aoCbtMnDt4MPAv9dJcUC2wGcZqan1p2ukE58obrKvUFxPntdmFP+HhK4lm+RbNCbnypuYS3tz5w7JpcDy7ab5wS9/1q/sLfw+iQ760rtGTKM+YEuK/gjhC6NMo1W1CRzzph3aDfd6MnOA1nff4pROgxH3bWAY2di2ajSqArpR0lk7r/shYB8bNzmitEzciANhF7wKWropG1fg3vaY4cZQq3VqWTgihO5zcf2mBvmgj/oibKmE=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PUZPR03MB5964.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(136003)(376002)(39860400002)(396003)(346002)(451199021)(54906003)(110136005)(76116006)(66899021)(71200400001)(478600001)(8676002)(8936002)(5660300002)(38070700005)(36756003)(2906002)(85182001)(86362001)(66446008)(122000001)(66946007)(66556008)(4326008)(66476007)(64756008)(91956017)(316002)(83380400001)(38100700002)(41300700001)(6506007)(2616005)(26005)(6512007)(186003)(6486002)(966005)(99106002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ejY5OE5TdHNNdzNiN0czWXZXNGZyK1lEZ3RncnJWQ1pEU3daZnpzNkZsZWxL?=
 =?utf-8?B?MkliN2QyNHFFSDB4V1NGTkJ1R21kNGhVN0w0REJZVHkwZWhnL1VoZENtR0Q4?=
 =?utf-8?B?aVpmU0V0VUc2blZZLytQZVdOcGNNTEJsWHVCU2k2MWt5alJzN3FJL1lCL3hy?=
 =?utf-8?B?TEVxY0dUL1JFdWZ3WjZ1MFpOVFhDSFkyUDNBbXBUeFNNT3NkSmRRSkgra1RK?=
 =?utf-8?B?Y0kza2dydWVyc3hBR2l2OUNnNlpvZEJkV1k4NVMxM0tXWFo2aVdPZXFRaDMv?=
 =?utf-8?B?emR6NTdJZS9HMFVwanBuZTladFRGeWhUNlU2UVFwdkI1OWMrL3owM3pzM2Iz?=
 =?utf-8?B?S2Q5cUU3dnkwV29pSWZmcENxLzluOGo4MnY4L1RDZVdyU1A5NjVNQ2FYVVpH?=
 =?utf-8?B?UGFXOXNCMFBsUVFqdTBBZFpNNDlHVXcvek9oTkRreUZZYVRHVmlYWmhSRFZC?=
 =?utf-8?B?b2o5dmpjRFZPWDM5ME54MVFkMGI0S3c4OVhYaUYrc3FXV2hlTlAxQy9yMi93?=
 =?utf-8?B?SFNXelFrUkhaTGxZcjVwTFVkTGRaM2wydzNVOW1zK0RJU1pwZ2Y5cndHamYz?=
 =?utf-8?B?VEpTRTYvcVo2OFZjWUFlYnEwY0pKY3Z0YWRCWUswd1ZTZXNhWm1IY0F5M3Jx?=
 =?utf-8?B?b1BaTnozdUFTT1p2ekhqV1dGVjJhTURGTm5IZ3NxRjFUM2h5TWc0LzhQOHd6?=
 =?utf-8?B?SU0zNnRvMTY5TWNuejVCQ2J1YXJLNGRMZzFFcHMxMzR1dHVGYS9CVUJrYTd2?=
 =?utf-8?B?a1dNa1RNckJOM3FyTGZ6Vmd5aXIzdG1yZXdtSTkyeHYwWkdFd1ZyVkdXRm9Y?=
 =?utf-8?B?MGF1c3Zna01nOFJ3b3NqTWM1ZjZhZXFSTXFFTm1NcEdSdXNBSWdNMVBiczNX?=
 =?utf-8?B?dWV1OWZuQjlMWStOQ3VyWHN3OW9UbGVZMnF3cDdZeVUrbmVMNStKVWFUdGNr?=
 =?utf-8?B?a2JXdlloSzgyamlFMG9zSnBVTjU5anF0blh6TDhjam5ZK2RaTlJKYXovcWhG?=
 =?utf-8?B?OEVOOGtrMm05NG5wUG9TV1dnOXBFbW1lSk1EWDJ1Rjlsck9qenhXYjltVEd1?=
 =?utf-8?B?Znk0cW8vOUhvZ2JXc0dpSHhZS1ZGSVNwNGxaSythcXBFRTk2cmtqYlB0VVlT?=
 =?utf-8?B?RGF3OVluekVocjM0Z3I3UVJsVTdyNFk1Q01BaCtsb0Fob2c1bU1IZGlENGVq?=
 =?utf-8?B?TEhPZlR3TklNaWh2TGpXSlA4ZDkvc0lKSEhoamhLYVk5Uzh2N25ZWjVXTFc3?=
 =?utf-8?B?elVPNGlZWHpvazl4TG8rRGxld2ZNaXRRNDlyblpJMnh6Vjh6V0lsZzlyL2lL?=
 =?utf-8?B?SW4xSGVuWEMvdHZnQkFSSUtOaUZtcExJVFd2QnVLTklwZTZ2OXFaYjJDb2t0?=
 =?utf-8?B?VVRxWnhoUTl3dUwveC9sRmhZM3h1aTFmd0pydjd2NytyOVJtamQ1NDNIQlhr?=
 =?utf-8?B?TlB5aHFIM3FlMXg3VmdLdGhuN2I1RHR1UnM3WmlXT25GaHRhanZSVHFTUkVq?=
 =?utf-8?B?eEd2Sk5rNXlPeGp5SGt6dzlmblJUMnNyUWd0UzQrQWE2R3F4T1UvV0toRjky?=
 =?utf-8?B?dTZ1dVZkY3pKbjY1eDFnbm03Tnp1S1piMzlramJLSmdJRS9sNEpSQXQ1dm9X?=
 =?utf-8?B?OExKdWdIQlNOOFFVVjlOdzRZZk5UZG9RRUozSGhtb290Q3JLTStvbm05ZmVZ?=
 =?utf-8?B?NSs3NUhRLy9RbldNRzZkV1JKWk5vVHNWQ29taVhrQzcyeGZKNzE3WUtxNWFy?=
 =?utf-8?B?OHZXQUNqZzBMT0VSTlJaY1orUVdxRkRPMTVlQ0dOSDhFSHR3eG5vaEdBNmpp?=
 =?utf-8?B?bTZXL3RNTlQvVC8zalpzYUE1VHExQXRrVXQrM01kNEl0NWY5a2VacDFMaWtD?=
 =?utf-8?B?b2pLZlhEOUhqNi9RcW8rS3ZSZG5QdUJWY3BRZ2tYS0I3MEVrdjduTWVwaTdS?=
 =?utf-8?B?TDFBNEtYNUw4S3JTODlIdGp6SUZjMTNoMmQzeGdUZ1Bxd1Q0ZlNSeHRsZFVO?=
 =?utf-8?B?cHdLNGMwc05jK2ZJZWJ3ZXpxb0ozYW9oNkNJdW94MTFJM05lekE0RTB5Mlpm?=
 =?utf-8?B?bkRhSE5JQkwrdDlYZ3M0b3BGMTRMczdFNkxVZDBSOENualRIQVdKV290VUtx?=
 =?utf-8?B?UmcxOWxiMFd4MlliYVlCVkJLZEl6SGE3WWhtUFBUN2x0N1k1R1hwMDRzK3Nk?=
 =?utf-8?B?UEE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1DD67F47B6E42A4C95BAF91B139FC65F@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PUZPR03MB5964.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa8637b4-1a36-4bcd-79d2-08db6803344a
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jun 2023 09:31:57.4141
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6f2dZE3MT0k90i67mPnWJ6C4jl0AzlkcsH5Bxg8EaKR+3FLOb4zRpBntqSqwywU/+0CHI13AdRt6Msa6y9YnidVnsHbFoyeAxDIGkkv4kGg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR03MB7621
X-MTK:  N
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

T24gVHVlLCAyMDIzLTA2LTA2IGF0IDAwOjEwICswMjAwLCBMaW51cyBXYWxsZWlqIHdyb3RlOg0K
PiBUaGlzIGlzIGJhc2VkIG9uIGFuIGVhcmxpZXIgYmxvZyBwb3N0IGF0IHBlb3BsZS5rZXJuZWwu
b3JnLA0KPiBpdCBkZXNjcmliZXMgdGhlIGNvbmNlcHRzIGFib3V0IHBhZ2UgdGFibGVzIHRoYXQg
d2VyZSBoYXJkZXN0DQo+IGZvciBtZSB0byBncmFzcCB3aGVuIGRlYWxpbmcgd2l0aCB0aGVtIGZv
ciB0aGUgZmlyc3QgdGltZSwNCj4gc3VjaCBhcyB0aGUgcHJldmFsZW50IHRocmVlLWxldHRlciBh
Y3JvbnltcyBwZm4sIHBnZCwgcDRkLA0KPiBwdWQsIHBtZCBhbmQgcHRlLg0KPiANCj4gSSBkb24n
dCBrbm93IGlmIHRoaXMgaXMgd2hhdCBwZW9wbGUgd2FudCwgYnV0IGl0J3Mgd2hhdCBJIHdvdWxk
DQo+IGhhdmUgd2FudGVkLg0KPiANCj4gSSBkaXNjdXNzZWQgYXQgb25lIHBvaW50IHdpdGggTWlr
ZSBSYXBvcG9ydCB0byBicmluZyB0aGlzIGludG8NCj4gdGhlIGtlcm5lbCBkb2N1bWVudGF0aW9u
LCBzbyBoZXJlIGlzIGEgc21hbGwgcHJvcG9zYWwuDQo+IA0KPiBDYzogTWlrZSBSYXBvcG9ydCA8
cnBwdEBrZXJuZWwub3JnPg0KPiBMaW5rOiBodHRwczovL3Blb3BsZS5rZXJuZWwub3JnL2xpbnVz
dy9hcm0zMi1wYWdlLXRhYmxlcw0KPiBTaWduZWQtb2ZmLWJ5OiBMaW51cyBXYWxsZWlqIDxsaW51
cy53YWxsZWlqQGxpbmFyby5vcmc+DQo+IC0tLQ0KPiAgRG9jdW1lbnRhdGlvbi9tbS9wYWdlX3Rh
Ymxlcy5yc3QgfCAxMjUNCj4gKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKw0KPiAgMSBm
aWxlIGNoYW5nZWQsIDEyNSBpbnNlcnRpb25zKCspDQo+IA0KPiBkaWZmIC0tZ2l0IGEvRG9jdW1l
bnRhdGlvbi9tbS9wYWdlX3RhYmxlcy5yc3QNCj4gYi9Eb2N1bWVudGF0aW9uL21tL3BhZ2VfdGFi
bGVzLnJzdA0KPiBpbmRleCA5NjkzOTU3MWQ3YmMuLmEyZTE2NzFhMGYxZCAxMDA2NDQNCj4gLS0t
IGEvRG9jdW1lbnRhdGlvbi9tbS9wYWdlX3RhYmxlcy5yc3QNCj4gKysrIGIvRG9jdW1lbnRhdGlv
bi9tbS9wYWdlX3RhYmxlcy5yc3QNCj4gQEAgLTMsMyArMywxMjggQEANCj4gID09PT09PT09PT09
DQo+ICBQYWdlIFRhYmxlcw0KPiAgPT09PT09PT09PT0NCj4gKw0KPiArUGFnZWQgdmlydHVhbCBt
ZW1vcnkgd2FzIGludmVudGVkIGFsb25nIHdpdGggdmlydHVhbCBtZW1vcnkgYXMgYQ0KPiBjb25j
ZXB0IGluDQo+ICsxOTYyIG9uIHRoZSBGZXJyYW50aSBBdGxhcyBDb21wdXRlciB3aGljaCB3YXMg
dGhlIGZpcnN0IGNvbXB1dGVyDQo+IHdpdGggcGFnZWQNCj4gK3ZpcnR1YWwgbWVtb3J5LiBUaGUg
ZmVhdHVyZSBtaWdyYXRlZCB0byBuZXdlciBjb21wdXRlcnMgYW5kIGJlY2FtZSBhDQo+IGRlIGZh
Y3RvDQo+ICtmZWF0dXJlIG9mIGFsbCBVbml4LWxpa2Ugc3lzdGVtcyBhcyB0aW1lIHdlbnQgYnku
IEluIDE5ODUgdGhlDQo+IGZlYXR1cmUgd2FzDQo+ICtpbmNsdWRlZCBpbiB0aGUgSW50ZWwgODAz
ODYsIHdoaWNoIHdhcyB0aGUgQ1BVIExpbnV4IDEuMCB3YXMNCj4gZGV2ZWxvcGVkIG9uLg0KPiAr
DQo+ICtUaGUgZmlyc3QgY29tcHV0ZXJzIHdpdGggdmlydHVhbCBtZW1vcnkgaGFkIG9uZSBzaW5n
bGUgcGFnZSB0YWJsZSwNCj4gYnV0IHRoZQ0KPiAraW5jcmVhc2VkIHNpemUgb2YgcGh5c2ljYWwg
bWVtb3JpZXMgZGVtYW5kZWQgdGhhdCB0aGUgcGFnZSB0YWJsZXMgYmUNCj4gc3BsaXQgaW4NCj4g
K3R3byBoaWVyYXJjaGljYWwgbGV2ZWxzLiBUaGlzIGhhcHBlbnMgYmVjYXVzZSBhIHNpbmdsZSBw
YWdlIHRhYmxlDQo+IGNhbm5vdCBjb3Zlcg0KPiArdGhlIGRlc2lyZWQgYW1vdW50IG9mIG1lbW9y
eSB3aXRoIHRoZSBkZXNpcmVkIGdyYW51YWxhcml0eSwgc3VjaCBhcw0KPiBhIHBhZ2Ugc2l6ZQ0K
PiArb2YgNEtCLg0KPiArDQo+ICtUaGUgcGh5c2ljYWwgYWRkcmVzcyBjb3JyZXNwb25kaW5nIHRv
IHRoZSB2aXJ0dWFsIGFkZHJlc3MgaXMNCj4gY29tbW9ubHkNCj4gK2RlZmluZWQgYnkgdGhlIGlu
ZGV4IHBvaW50IGluIHRoZSBoaWVyYXJjaHksIGFuZCB0aGlzIGlzIGNhbGxlZCBhDQo+ICoqcGFn
ZSBmcmFtZQ0KPiArbnVtYmVyKiogb3IgKipwZm4qKi4gVGhlIGZpcnN0IGVudHJ5IG9uIHRoZSB0
b3AgbGV2ZWwgdG8gdGhlIGZpcnN0DQo+IGVudHJ5IGluIHRoZQ0KPiArc2Vjb25kIGFuZCBzbyBv
biBkb3duIHRoZSBoaWVyYXJjaHkgd2lsbCBwb2ludCBvdXQgdGhlIHZpcnR1YWwNCj4gYWRkcmVz
cyBmb3IgdGhlDQo+ICtwaHlzaWNhbCBtZW1vcnkgYWRkcmVzcyAwLCB3aGljaCB3aWxsIGJlICpw
Zm4gMCogYW5kIHRoZSBoaWdoZXN0IHBmbg0KPiB3aWxsIGJlDQo+ICt0aGUgbGFzdCBwYWdlIG9m
IHBoeXNpY2FsIG1lbW9yeSB0aGUgZXh0ZXJuYWwgYWRkcmVzcyBidXMgb2YgdGhlIENQVQ0KPiBj
YW4NCj4gK2FkZHJlc3MuDQo+ICsNCj4gK1dpdGggYSBwYWdlIGdyYW51bGFyaXR5IG9mIDRLQiBh
bmQgYSBhZGRyZXNzIHJhbmdlIG9mIDMyIGJpdHMsIHBmbiAwDQo+IGlzIGF0DQo+ICthZGRyZXNz
IDB4MDAwMDAwMDAsIHBmbiAxIGlzIGF0IGFkZHJlc3MgMHgwMDAwNDAwMCwgcGZuIDIgaXMgYXQN
Cj4gMHgwMDAwODAwMA0KPiArYW5kIHNvIG9uIHVudGlsIHdlIHJlYWNoIHBmbiAweDNmZmZmIGF0
IDB4ZmZmZmMwMDAuDQoNCnBmbiAxIGlzIGF0IDB4MDAwMDEwMDAuDQpwZm4gMiBpcyBhdCAweDAw
MDAyMDAwLg0KDQpBbmQgc28gb24gdW50aWwgd2UgcmVhY2ggcGZuIDB4ZmZmZmYgYXQgMHhmZmZm
ZjAwMC4NCg0KPiArDQo+ICtBcyB5b3UgY2FuIHNlZSwgd2l0aCA0S0IgcGFnZXMgdGhlIHBhZ2Ug
YmFzZSBhZGRyZXNzIHVzZXMgYml0cyAxMi0zMSANCj4gb2YgdGhlDQo+ICthZGRyZXNzLCBhbmQg
dGhpcyBpcyB3aHkgYFBBR0VfU0hJRlRgIGluIHRoaXMgY2FzZSBpcyBkZWZpbmVkIGFzIDEyDQo+
IGFuZA0KPiArYFBBR0VfU0laRWAgaXMgdXN1YWxseSBkZWZpbmVkIGluIHRlcm1zIG9mIHRoZSBw
YWdlIHNoaWZ0IGFzIGAoMSA8PA0KPiBQQUdFX1NISUZUKWANCj4gKw0KPiArT3ZlciB0aW1lIGEg
ZGVlcGVyIGhpZXJhcmNoeSBoYXMgYmVlbiBkZXZlbG9wZWQgaW4gcmVzcG9uc2UgdG8NCj4gaW5j
cmVhc2luZyBtZW1vcnkNCj4gK3NpemVzLiBXaGVuIExpbnV4IHdhcyBjcmVhdGVkLCA0S0IgcGFn
ZXMgYW5kIGEgc2luZ2xlIHBhZ2UgdGFibGUNCj4gY2FsbGVkDQo+ICtgc3dhcHBlcl9wZ19kaXJg
IHdpdGggMTAyNCBlbnRyaWVzIHdhcyB1c2VkLCBjb3ZlcmluZyA0TUIgd2hpY2gNCj4gY29pbmNp
ZGVkIHdpdGgNCj4gK3RoZSBmYWN0IHRoYXQgVG9ydmFsZCdzIGZpcnN0IGNvbXB1dGVyIGhhZCA0
TUIgb2YgcGh5c2ljYWwgbWVtb3J5Lg0KPiBFbnRyaWVzIGluDQo+ICt0aGlzIHNpbmdsZSB0YWJs
ZSB3YXMgcmVmZXJyZWQgdG8gYXMgKlBURSo6cyAtIHBhZ2UgdGFibGUgZW50cmllcy4NCj4gKw0K
PiArT3ZlciB0aW1lIHRoZSBwYWdlIHRhYmxlIGhpZXJhcmNoeSBoYXMgZGV2ZWxvcGVkIGludG8g
dGhpczo6DQo+ICsNCj4gKyAgKy0tLS0tKw0KPiArICB8IFBHRCB8DQo+ICsgICstLS0tLSsNCj4g
KyAgICAgXg0KPiArICAgICB8ICAgKy0tLS0tKw0KPiArICAgICArLS0tfCBQNEQgfA0KPiArICAg
ICAgICAgKy0tLS0tKw0KPiArICAgICAgICAgICAgXg0KPiArICAgICAgICAgICAgfCAgICstLS0t
LSsNCj4gKyAgICAgICAgICAgICstLS18IFBVRCB8DQo+ICsgICAgICAgICAgICAgICAgKy0tLS0t
Kw0KPiArICAgICAgICAgICAgICAgICAgIF4NCj4gKyAgICAgICAgICAgICAgICAgICB8ICAgKy0t
LS0tKw0KPiArICAgICAgICAgICAgICAgICAgICstLS18IFBNRCB8DQo+ICsgICAgICAgICAgICAg
ICAgICAgICAgICstLS0tLSsNCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgXg0KPiArICAg
ICAgICAgICAgICAgICAgICAgICAgICB8ICAgKy0tLS0tKw0KPiArICAgICAgICAgICAgICAgICAg
ICAgICAgICArLS0tfCBQVEUgfA0KPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgKy0t
LS0tKw0KPiArDQo+ICsNCj4gK1N5bWJvbHMgb24gdGhlIGRpZmZlcmVudCBsZXZlbHMgb2YgdGhl
IHBhZ2UgdGFibGUgaGllcmFyY2h5IGhhdmUgdGhlDQo+IGZvbGxvd2luZw0KPiArbWVhbmluZzoN
Cj4gKw0KPiArLSAqKnBnZCoqLCBgcGdkX3RgLCBgcGdkdmFsX3RgID0gKipQYWdlIEdsb2JhbCBE
aXJlY3RvcnkqKiAtIHRoZQ0KPiBMaW51eCBrZXJuZWwNCj4gKyAgbWFpbiBwYWdlIHRhYmxlIGhh
bmRsaW5nIHRoZSBQR0QgZm9yIHRoZSBrZXJuZWwgbWVtb3J5IGlzIHN0aWxsDQo+IGZvdW5kIGlu
DQo+ICsgIGBzd2FwcGVyX3BnX2RpcmAsIGJ1dCBlYWNoIHVzZXJzcGFjZSBwcm9jZXNzIGluIHRo
ZSBzeXN0ZW0gYWxzbw0KPiBoYXMgaXRzIG93bg0KPiArICBtZW1vcnkgY29udGV4dCBhbmQgdGh1
cyBpdHMgb3duICpwZ2QqLCBmb3VuZCBpbiBgc3RydWN0IG1tX3N0cnVjdGANCj4gd2hpY2gNCj4g
KyAgaW4gdHVybiBpcyByZWZlcmVuY2VkIHRvIGluIGVhY2ggYHN0cnVjdCB0YXNrX3N0cnVjdGAu
IFNvIHRhc2tzDQo+IGhhdmUgbWVtb3J5DQo+ICsgIGNvbnRleHQgaW4gdGhlIGZvcm0gb2YgYSBg
c3RydWN0IG1tX3N0cnVjdGAgYW5kIHRoaXMgaW4gdHVybiBoYXMgYQ0KPiArICBgc3RydWN0IHBn
dF90ICpwZ2RgIHBvaW50ZXIgdG8gdGhlIGNvcnJlc3BvbmRpbmcgcGFnZSBnbG9iYWwNCj4gZGly
ZWN0b3J5Lg0KPiArDQo+ICstICoqcDRkKiosIGBwNGRfdGAsIGBwNGR2YWxfdGAgPSAqKlBhZ2Ug
TGV2ZWwgNCBEaXJlY3RvcnkqKiB3YXMNCj4gaW50cm9kdWNlZCB0bw0KPiArICBoYW5kbGUgNS1s
ZXZlbCBwYWdlIHRhYmxlcyBhZnRlciB0aGUgKnB1ZCogd2FzIGludHJvZHVjZWQuIE5vdyBpdA0K
PiB3YXMgY2xlYXINCj4gKyAgdGhhdCB3ZSBuZWUgdG8gcmVwbGFjZSAqcGdkKiwgKnBtZCosICpw
dWQqIGV0YyB3aXRoIGEgZmlndXJlDQo+IGluZGljYXRpbmcgdGhlDQo+ICsgIGRpcmVjdG9yeSBs
ZXZlbCBhbmQgdGhhdCB3ZSBjYW5ub3QgZ28gb24gd2l0aCBhZCBob2MgbmFtZXMgYW55DQo+IG1v
cmUuIFRoaXMNCj4gKyAgaXMgb25seSB1c2VkIG9uIHN5c3RlbXMgd2hpY2ggYWN0dWFsbHkgaGF2
ZSA1IGxldmVscyBvZiBwYWdlDQo+IHRhYmxlcy4NCj4gKw0KPiArLSAqKnB1ZCoqLCBgcHVkX3Rg
LCBgcHVkdmFsX3RgID0gKipQYWdlIFVwcGVyIERpcmVjdG9yeSoqIHdhcw0KPiBpbnRyb2R1Y2Vk
IGFmdGVyDQo+ICsgIHRoZSBvdGhlciBsZXZlbHMgdG8gaGFuZGxlIDQtbGV2ZWwgcGFnZSB0YWJs
ZXMuIExpa2UgKnA0ZCosIGl0IGlzDQo+IHBvdGVudGlhbGx5DQo+ICsgIHVudXNlZC4NCj4gKw0K
PiArLSAqKnBtZCoqLCBgcG1kX3RgLCBgcG1kdmFsX3RgID0gKipQYWdlIE1pZGRsZSBEaXJlY3Rv
cnkqKi4NCj4gKw0KPiArLSAqKnB0ZSoqLCBgcHRlX3RgLCBgcHRldmFsX3RgID0gKipQYWdlIFRh
YmxlIEVudHJ5KiogLSBtZW50aW9uZWQNCj4gZWFybGllci4NCj4gKyAgVGhlIG5hbWUgaXMgYSBi
aXQgY29uZnVzaW5nIGJlY2F1c2Ugd2hpbGUgaW4gTGludXggMS4wIHRoaXMgZGlkDQo+IHJlZmVy
IHRvIGENCj4gKyAgc2luZ2xlIHBhZ2UgdGFibGUgZW50cnkgaW4gdGhlIHRvcCBsZXZlbCBwYWdl
IHRhYmxlLCBpdCB3YXMNCj4gcmV0cm9maXR0ZWQNCj4gKyAgdG8gYmUgIndoYXQgdGhlIGxldmVs
IGFib3ZlIHBvaW50cyB0byIuIFNvIHdoZW4gdHdvLWxldmVsIHBhZ2UNCj4gdGFibGVzIHdlcmUN
Cj4gKyAgaW50cm9kdWNlZCwgdGhlICpwdGUqIGJlY2FtZSBhIGxpc3Qgb2YgcG9pbnRlcnMsIHdo
aWNoIGlzIHdoeQ0KPiArICBgUFRSU19QRVJfUFRFYCBleGlzdHMuIFRoaXMgb3h5bW9yb25pYyB0
ZXJtIGNhbiBiZSBtaWxkbHkNCj4gY29uZnVzaW5nLg0KPiArDQo+ICtBcyBhbHJlYWR5IG1lbnRp
b25lZCwgZWFjaCBsZXZlbCBpbiB0aGUgcGFnZSB0YWJsZSBoaWVyYXJjaHkgaXMgYQ0KPiAqbGlz
dCBvZg0KPiArcG9pbnRlcnMqLCBzbyB0aGUgKipwZ2QqKiBjb250YWlucyBgUFRSU19QRVJfUEdE
YCBwb2ludGVycyB0byB0aGUNCj4gbmV4dCBsZXZlbA0KPiArYmVsb3csICoqcDRkKiogY29udGFp
bnMgYFBUUlNfUEVSX1A0RGAgcG9pbnRlcnMgdG8gKipwdWQqKiBpdGVtcyBhbmQNCj4gc28gb24u
IFRoZQ0KPiArbnVtYmVyIG9mIHBvaW50ZXJzIG9uIGVhY2ggbGV2ZWwgaXMgYXJjaGl0ZWN0dXJl
LWRlZmluZWQuIFRoZSBtb3N0DQo+IHVzdWFsIGxheW91dA0KPiAraXMgdGhlIGBQQUdFX1NJWkVg
IG9mIHRoZSBzeXN0ZW0gZGl2aWRlZCBieSB0aGUgbnVtYmVyIG9mIGJ5dGVzIGluIGENCj4gdmly
dHVhbA0KPiArYWRkcmVzcyBvbiB0aGUgc3lzdGVtIHNvIGVhY2ggcGFnZSB0YWJsZSBsZXZlbCBp
cyBleGFjdGx5IG9uZSBwYWdlDQo+IHdvcnRoIG9mDQo+ICtwb2ludGVycywgd2hpY2ggaXMgdXN1
YWxseSB3aGF0IGNvbXB1dGVyIGFyY2hpdGVjdHMgY2hvb3NlOjoNCj4gKw0KPiArICAgIFBNRA0K
PiArICArLS0tLS0rICAgICAgICAgICBQVEUNCj4gKyAgfCBwdHIgfC0tLS0tLS0+ICstLS0tLSsN
Cj4gKyAgfCBwdHIgfC0gICAgICAgIHwgcHRyIHwtLS0tLS0tPiBQQUdFDQo+ICsgIHwgcHRyIHwg
XCAgICAgICB8IHB0ciB8DQo+ICsgIHwgcHRyIHwgIFwgICAgICAgIC4uLg0KPiArICB8IC4uLiB8
ICAgXA0KPiArICB8IHB0ciB8ICAgIFwgICAgICAgICBQVEUNCj4gKyAgKy0tLS0tKyAgICAgKy0t
LS0+ICstLS0tLSsNCj4gKyAgICAgICAgICAgICAgICAgICAgIHwgcHRyIHwtLS0tLS0tPiBQQUdF
DQo+ICsgICAgICAgICAgICAgICAgICAgICB8IHB0ciB8DQo+ICsgICAgICAgICAgICAgICAgICAg
ICAgIC4uLg0KPiArDQo+ICsNCj4gK0VhY2ggcG9pbnRlciBpbiB0aGUgbG93ZXN0IGxldmVsIG9m
IHRoZSBwYWdlIHRhYmxlIGhpZXJhcmNoeSwgaS5lLg0KPiBlYWNoDQo+ICtgcHRldmFsX3RgLWVu
dHJ5IG9mIHRoZSBgUFRSU19QRVJfUFRFYCBlbnRyaWVzIGluIGEgYHB0ZV90ICpgLCB3aWxsDQo+
IG1hcCBleGFjdGx5DQo+ICtvbmUgYFBBR0VfU0laRWA6ZCBwYWdlIG9mIHBoeXNpY2FsIG1lbW9y
eSB0byBleGFjdGx5IG9uZSBwYWdlIG9mDQo+IHZpcnR1YWwgbWVtb3J5Lg0KPiArDQo+ICtUaGUg
cHRlIHBhZ2UgdGFibGUgZW50cmllcyAocG9pbnRlcnMpIG9uIHRoZSBsb3dlc3QgbGV2ZWwgb2Yg
dGhlDQo+IGhpZXJhcmNoeQ0KPiArdHlwaWNhbGx5IGNvbnRhaW4gdGhlIGhpZ2ggYml0cyBvZiBh
IHZpcnR1YWwgYWRkcmVzcyBpbiBpdHMgaGlnaA0KPiBiaXRzLCBhbmQgaW4NCj4gK3RoZSBsb3dl
ciBiaXRzIGl0IGNvbnRhaW5zIGFyY2hpdGVjdHVyZS1kZXBlbmRlbnQgY29udHJvbCBiaXRzDQo+
IHBlcnRhaW5pbmcgdG8NCj4gK3RoZSBwYWdlLg0KPiArDQo+ICtJZiB0aGUgYXJjaGl0ZWN0dXJl
IGRvZXMgbm90IHVzZSBhbGwgdGhlIHBhZ2UgdGFibGUgbGV2ZWxzLCB0aGV5IGNhbg0KPiBiZSAq
Zm9sZGVkKg0KPiArd2hpY2ggbWVhbnMgc2tpcHBlZCwgYW5kIGFsbCBvcGVyYXRpb25zIHBlcmZv
cm1lZCBvbiBwYWdlIHRhYmxlcw0KPiB3aWxsIGJlDQo+ICtjb21waWxlLXRpbWUgYXVnbWVudGVk
IHRvIGp1c3Qgc2tpcCBhIGxldmVsIHdoZW4gYWNjZXNzaW5nIHRoZSBuZXh0DQo+IGxvd2VyDQo+
ICtsZXZlbC4gUGFnZSB0YWJsZSBoYW5kbGluZyBjb2RlIHRoYXQgd2lzaCB0byBiZSBhcmNoaXRl
Y3R1cmUtDQo+IG5ldXRyYWwsIHN1Y2ggYXMNCj4gK3RoZSB2aXJ0dWFsIG1lbW9yeSBtYW5hZ2Vy
LCB3aWxsIGhvd2V2ZXIgbmVlZCB0byBiZSB3cml0dGVuIHNvIHRoYXQNCj4gaXQNCj4gK3RyYXZl
cnNlcyBhbGwgb2YgdGhlIGN1cnJlbnRseSBmaXZlIGxldmVscy4NCg==
