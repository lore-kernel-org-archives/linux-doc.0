Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E1E5C432BE
	for <linux-doc@archiver.kernel.org>; Wed, 25 Aug 2021 15:48:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 56BF66108F
	for <linux-doc@archiver.kernel.org>; Wed, 25 Aug 2021 15:48:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241125AbhHYPtD (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 25 Aug 2021 11:49:03 -0400
Received: from mx0a-002c1b01.pphosted.com ([148.163.151.68]:59154 "EHLO
        mx0a-002c1b01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S241083AbhHYPtC (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 25 Aug 2021 11:49:02 -0400
Received: from pps.filterd (m0127837.ppops.net [127.0.0.1])
        by mx0a-002c1b01.pphosted.com (8.16.1.2/8.16.0.43) with SMTP id 17PE6r1l007949;
        Wed, 25 Aug 2021 08:48:12 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version;
 s=proofpoint20171006; bh=nidjS5ZSfEAm/7zKiWWv568imXtuk6wLHx+u1/frIXE=;
 b=kH13D5bARXv2mvzjv3UQptMyYehfA6PklG/K3tQAk6h3LynaFpyJa2JFJ4GrGqLzNUWr
 s9K1ASs99kT9UZButzxmTE/lMMikPlAP2VKrVa3f494l8+BwG0SZmF2qs7gPRi2xksZi
 pQXHN9EUCsqAqGHRCQLBUc1oeXGozyYBnrrGARjOG6z/wmxaMKjBhYlKiDntkmBsQjue
 QBN+uXRR3hE4Ofwr5sFU0yL0XypDu/MXITyMAfI8/CrXAjgar8bLKNIaxkA3GFDGDheK
 r8AUj9OKwRw3dhi36IB1tgz+Bo9F77qb9jcmXwJNtYK229ckHJmgpJy67sqZJ34Flqxm /A== 
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2042.outbound.protection.outlook.com [104.47.66.42])
        by mx0a-002c1b01.pphosted.com with ESMTP id 3anb6whta6-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 25 Aug 2021 08:48:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ok+IH7DjvUrnKxJmN6DJBaqyvZ3pfASSsOWKUN/N5KoaBWqwNqShQvZjxfLAHeElGI1cBTfzL9mhG9tBfbbyhML4KBobwbpboCifNFHEAnBA/UjHR2qwTwfoV+TCZFC2P+Ks0GxAoNgKQdiwUfsXyCINVrtB6UahPGzFYXaY5T4BXobRnQg/sBjW0kFAXeBf1EJav++AnMuv+oX6tiS/3WTW0atfXQO1yDDdFpVilFndHw2V2qpVWN2Gz7ShcJ2uLu2nkfr17oarr+lgZmYyTs8vG3urbwsIcCctyBYcd3g9KX8jC/HgR0SfLu+Hqi3F9MNvYPx+CuRz9S5LzANsDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nidjS5ZSfEAm/7zKiWWv568imXtuk6wLHx+u1/frIXE=;
 b=PRFcKSNEzlQJdt4B9bokOx2Y49YE7jGXfNUILQZ2ZsnMpJRck4GFoCyNU3mPs72c9uwoVN53rfui2yI+VxX3Hwr77W60T9Q4WAVro5QbVWcP+gOXL1eCKAcD2EuhA8xjclFPJbWLAwQXIhUHc8QCoRaHu4L2fcBTYUZD5Bk0KGgS65C1iJ7rdedKrq+hy3mm4r0Pz3ucuuF6o6yZE/47bvPimCc+nUNm530PdV1x3+l4oNzn1QkK5UREeKj6ys9CXOJ+pv+yhIilFlU4eUM6DjdKCwgITOg67kOOcj66Br0aPzelHYxDKuBk8+8uVVwGzYALwkENYl6R8SBrptrp/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
Received: from BYAPR02MB5575.namprd02.prod.outlook.com (2603:10b6:a03:a6::24)
 by BY5PR02MB6485.namprd02.prod.outlook.com (2603:10b6:a03:1d2::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19; Wed, 25 Aug
 2021 15:48:10 +0000
Received: from BYAPR02MB5575.namprd02.prod.outlook.com
 ([fe80::4528:8175:6b4a:70eb]) by BYAPR02MB5575.namprd02.prod.outlook.com
 ([fe80::4528:8175:6b4a:70eb%7]) with mapi id 15.20.4457.018; Wed, 25 Aug 2021
 15:48:10 +0000
From:   Tiberiu Georgescu <tiberiu.georgescu@nutanix.com>
To:     David Hildenbrand <david@redhat.com>
CC:     Jonathan Corbet <corbet@lwn.net>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        "linux-mm@kvack.org" <linux-mm@kvack.org>,
        "peter.xu@redhat.com" <peter.xu@redhat.com>,
        Ivan Teterevkov <ivan.teterevkov@nutanix.com>,
        Florian Schmidt <flosch@nutanix.com>,
        "Carl Waldspurger [C]" <carl.waldspurger@nutanix.com>,
        Jonathan Davies <jond@nutanix.com>
Subject: Re: [PATCH] Documentation: update pagemap with SOFT_DIRTY & UFFD_WP
 shmem issue
Thread-Topic: [PATCH] Documentation: update pagemap with SOFT_DIRTY & UFFD_WP
 shmem issue
Thread-Index: AQHXj5L6XJIQPBlKGEiBcDA4x9X9d6t5q4AAgAMB24CABCwBgIADmLEA
Date:   Wed, 25 Aug 2021 15:48:09 +0000
Message-ID: <E469381E-1376-4234-A150-96BCC9D09CEF@nutanix.com>
References: <20210812155843.236919-1-tiberiu.georgescu@nutanix.com>
 <8f7d6856-7bcd-dedf-663b-cd7ef2d0827f@redhat.com>
 <F04C4283-0D25-4D0E-B3A8-05B36ACFF30D@nutanix.com>
 <4187d379-759e-0dc5-eff8-c8d356828ae2@redhat.com>
In-Reply-To: <4187d379-759e-0dc5-eff8-c8d356828ae2@redhat.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3654.120.0.1.13)
authentication-results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=nutanix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b551134b-4bb4-4ea3-d8e0-08d967dfbd55
x-ms-traffictypediagnostic: BY5PR02MB6485:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BY5PR02MB6485EF06E4AFB15A0659BA74E6C69@BY5PR02MB6485.namprd02.prod.outlook.com>
x-proofpoint-crosstenant: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: z3RnOkbdwuBW69JbV5DOf3wOrDsYwJ1QrzX7YPzYQikiUGx923P0UdtoiCz0u/yD3PxvXRRq5uppd0k5tylGRc66JR6KSI3kKeSh6Ytrsir7kot3RINgR4j+eKvk5Jbs9JE+nyl72kBhbJobfQPzYLgzGDWJI4jY/EFzuFUCtY77P/HtC9wa5Ge9sUmHNBFXeqa0sf1AQeWDCpEJ1j5WDFIL8e7GsbhjSR2fHHA2SpwPM3E3quo11A//ruxBllVNYVJKseAAIci4jE5F1bR7MsTO4JR21wdZcxmztwKgL6UUTugBCuBZB4E6iIRt6IM3JmCGWW38Sw19VpUbCl083116RhWjmJY33+f+EJvblsqUxREY0jkfaHoRRPii30sajraryxGCXQ+n8hGcDo3zxKh3fowd8n1zMwQgigGyrfjmCqL3LSbiWgHQtWtb3/puoVmYcfQMTpDJDSlhmk/KaH7PzKLXPVWKy3l3Us362NrLFa1OkCRrx1nLkY/xEz/c0Dw+7eAEke6ZHFVD706QR5Fu+jmZrARAEiGS7ylTOT5rcPg33gLykezfsbKYH+HomAbDZYKqV6mcnDwKUCDHfjHuFGdjPNl2A2ZQvo0it2E1BMGh9JbovsEAEu10Y8zT/vhW50qWFz++bWNPglzpeNgMsSVKMbPhWYvlbjLLmMB9NPH5JjiXyqpNwLRxh4+yyVgoYA473ObrYda9BREUTOwf8qUwyyMcIB8CrQTqf2o99wlu+RngD5vDDgE9U4v7Ur7L3Gd7wzfP0jcSbtBOz2OshBfbureJFtPfwKYaHBg4dS/d0QUuhqBZrqFvx721PkHE0D2wAUI1JPfxzjPr90qtxNN8nkr/Zz2f3bUyHKE=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR02MB5575.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(396003)(366004)(346002)(376002)(39860400002)(136003)(83380400001)(6916009)(76116006)(66476007)(66446008)(91956017)(71200400001)(6486002)(966005)(64756008)(66946007)(186003)(66556008)(38100700002)(8936002)(4326008)(122000001)(44832011)(478600001)(38070700005)(33656002)(36756003)(6512007)(54906003)(2616005)(86362001)(15650500001)(2906002)(53546011)(8676002)(6506007)(316002)(5660300002)(107886003)(14143004)(45980500001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?K22os5hEXNTPXUqLusIodVNBKHzPvHNaRGGqDLsrOSikyqR/O6PuZHp7s8kU?=
 =?us-ascii?Q?iv0RJGyBl6ysJ/WndAJhYDiILYSldYlvadrfuWvyoF99coYmV6un8gFi9VLn?=
 =?us-ascii?Q?c0e2HdkKvrEglFLLce0SLZdQEX+O5T5UNphskEdmxUepsdhBL7xhb++tOcuJ?=
 =?us-ascii?Q?2Y8rgrEsUm4xB78bLU056RNnlIH6VoRsvFOVAjdp7fVWTJcT9AxaighFTDv5?=
 =?us-ascii?Q?PCEbaJ4HbKrV4D2n7/B6Pdyk6k1HXii95e1GPbU9/EHYx7MZlafQ5nWBgbK3?=
 =?us-ascii?Q?AgssSn10dsmE8fiXbteBJ1F6bY9Ecgga04ABnPY8ESl552/C3N51Zu9Syim+?=
 =?us-ascii?Q?1NDL28W38JR8LvjQn+Rklpk1VpUl5AcoZQz8GM4ykPZDBwvShsBazUDreLfk?=
 =?us-ascii?Q?ArH+KlnyhnrXCMTABmjaW9FdDfWVKlMTy8SMhoDpTTp+A1n6oV9hrEKanMg7?=
 =?us-ascii?Q?zLPpu94sKz020MZZChHpfcqPPSGKyzV6m41xIZ9m3vvQZZpiyPzPHE/Rv2mk?=
 =?us-ascii?Q?CAVKzC5s+JT09yrWtkp3baGtiH3b6ElCVXABFXQgMoMfEK1OLyP1zAMLR49m?=
 =?us-ascii?Q?d+eFBxpueJmgcWxXSC/hcFy4USaOZOi9oN6sSTV7olGMX+G/BMNLqiqExHjn?=
 =?us-ascii?Q?phIIX4kqKv4BswLd6oabZS9H0oaRTnXz6R4GCsFvIESWEV0cS3Etlr723+tk?=
 =?us-ascii?Q?0xhTLDg+ezM3Qgshf5Q7etMwwP/ggmJD3t/OHqD+eaIeZG3MYcL9KDKrVPw6?=
 =?us-ascii?Q?K414eJ4POehzigVTSxh/QXixBDOm65XwVyLATqdasTjeKrl4QbzBN+rQ694M?=
 =?us-ascii?Q?8OY05NdBaTbRaRCYrOZjTMr6xWothpdSaws8yGPJvvIm/B9/W3+J7LRrSdPm?=
 =?us-ascii?Q?L5C6FQr/Hrb44E7o8ybOjQL+UTuWPAyS6FSIA0KMNWDThu30Z4GReWptQdei?=
 =?us-ascii?Q?1tH/dVV+jB7Np+nQcv0//ZDuz0n7h9fGu6S+DTKjQVQK4FM6gQ2fTHJ+w3yR?=
 =?us-ascii?Q?qvfpZsNZko1nObAKO/3AkuzAKpuBQm7qwtfodE8TfaUlvXcaN3kI3CB+9sMl?=
 =?us-ascii?Q?NFCOsiQiNkeyv3p6vrqysI3AjmVcl9NPJOc30nmHAhFee9+JehLNCD6bEwR+?=
 =?us-ascii?Q?YK8R4CG+3tpZ//gExxbnBkXETTOiMwjDyxFWfkrvzvloivERckJMpZheq1oz?=
 =?us-ascii?Q?pKNshldBgulG4Qe2oP7+3BI0YP/le8fxh8TBJqj66ZKPb1s5eD12WJVqTyhm?=
 =?us-ascii?Q?db1mmONH5x0IZ362MU5lnES0ineyaVyulN48HVUasB+zhoAWil2Zb5dbRYy1?=
 =?us-ascii?Q?sU3ufPHpCmd7ZMFZvJTgSO3DDwJN4wxi23Tisr/Tn3IS0fgGkXdXsluZpWhW?=
 =?us-ascii?Q?kuhaU6PLg/+5TGJVOPvj8GX2NpC/D4ttVEX5uEtUJLKx1VYD8g=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <60A8EAC2EB32E74A811D1C168B36F272@namprd02.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR02MB5575.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b551134b-4bb4-4ea3-d8e0-08d967dfbd55
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Aug 2021 15:48:09.9534
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Vf/vRSmgih3BltFruN5WNnbx0obtqr/eArp056ZKnreacDp3ITWtq7fGF07+xjdn5oM3C8/SFptcPUbenWgyrC17HiB7Tx4FQGpdHfrHmFo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR02MB6485
X-Proofpoint-GUID: cH2ye_omsNxY71y9VBR-srKudJZqgaFf
X-Proofpoint-ORIG-GUID: cH2ye_omsNxY71y9VBR-srKudJZqgaFf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-08-25_06,2021-08-25_02,2020-04-07_01
X-Proofpoint-Spam-Reason: safe
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


> On 23 Aug 2021, at 09:52, David Hildenbrand <david@redhat.com> wrote:
>=20
> On 20.08.21 19:10, Tiberiu Georgescu wrote:
>> Hello David,
>>> On 18 Aug 2021, at 20:14, David Hildenbrand <david@redhat.com> wrote:
>>>=20
>>> On 12.08.21 17:58, Tiberiu A Georgescu wrote:
>>>> Mentioning the current missing functionality of the pagemap, in case
>>>> someone stumbles upon unexpected behaviour.
>>>> Signed-off-by: Tiberiu A Georgescu <tiberiu.georgescu@nutanix.com>
>>>> Reviewed-by: Ivan Teterevkov <ivan.teterevkov@nutanix.com>
>>>> Reviewed-by: Florian Schmidt <florian.schmidt@nutanix.com>
>>>> Reviewed-by: Carl Waldspurger <carl.waldspurger@nutanix.com>
>>>> Reviewed-by: Jonathan Davies <jonathan.davies@nutanix.com>
>>>> ---
>>>>  Documentation/admin-guide/mm/pagemap.rst | 6 ++++++
>>>>  1 file changed, 6 insertions(+)
>>>> diff --git a/Documentation/admin-guide/mm/pagemap.rst b/Documentation/=
admin-guide/mm/pagemap.rst
>>>> index fb578fbbb76c..627f3832b3a2 100644
>>>> --- a/Documentation/admin-guide/mm/pagemap.rst
>>>> +++ b/Documentation/admin-guide/mm/pagemap.rst
>>>> @@ -207,3 +207,9 @@ Before Linux 3.11 pagemap bits 55-60 were used for=
 "page-shift" (which is
>>>>  always 12 at most architectures). Since Linux 3.11 their meaning chan=
ges
>>>>  after first clear of soft-dirty bits. Since Linux 4.2 they are used f=
or
>>>>  flags unconditionally.
>>>> +
>>>> +Note that the page table entries for swappable and non-syncable pages=
 are
>>>> +cleared when those pages are zapped or swapped out. This makes inform=
ation
>>>> +about the page disappear from the pagemap.  The location of the swapp=
ed
>>>> +page can still be retrieved from the page cache, but flags like SOFT_=
DIRTY
>>>> +and UFFD_WP are lost irretrievably.
>>>=20
>>> UFFD_WP is currently only supported for private anonymous memory, where=
 it should just work (a swap entry with a uffd-wp marker). So can we even e=
nd up with UFFD_WP bits on shmem and such? (Peter is up-streaming that righ=
t now, but there, I think he's intending to handle it properly without thes=
e bits getting lost using pte_markers and such).
>> If that is the case, I guess we should not end up with UFFD_WP bits on s=
hmem
>> ptes yet. Sorry for the confusion.
>> Great to hear Peter is upstreaming his patch soon. Is it this series[1] =
you
>> mention?
>> [1]: https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lore.kernel.=
org_lkml_20210715201422.211004-2D1-2Dpeterx-40redhat.com_&d=3DDwIDaQ&c=3Ds8=
83GpUCOChKOHiocYtGcg&r=3DrRM5dtWOv0DNo5dDxZ2U16jl4WAw6ql5szOKa9cu_RA&m=3DHx=
-j4mONRY1L7rSzBw2fX9uS-mxLtz9qaknDaLVoeNI&s=3DKl5f106w3YaBLQe0_T5RV1nvPm2pQ=
umiVIKoE76d0yE&e=3D=20
>=20
> Yes, and that would take care of making the uffd-wp bit persistent.

Great news!
>=20
>>>=20
>>> So regarding upstream Linux, your note regarding UFFD_WP should not be =
applicable, right?
>>>=20
>> Right.
>>>=20
>>> On a related note: if we start thinking about the pagemap expressing wh=
ich pages are currently mapped into the page tables ("state of the process =
page tables") mostly all starts making sense. We document this as "to exami=
ne the page tables" already.
>>>=20
>>> We only get swapped information if there is a swap PTE -- which only ma=
kes sense for anonymous pages, because there, the page table holds the stat=
e ("single source of truth"). For shmem, we don't have it, because the page=
 cache is the single source of truth.
>>>=20
>>> We only get presence information if there is a page mapped into the pag=
e tables -- which, for anonymous pages, specifies if there is anything pres=
ent at all. For shmem we only have it if it's currently mapped into the pag=
e table.
>>>=20
>>> Losing softdirt is a bad side effect of, what you describe, just settin=
g a PTE to none and not syncing back that state back to some central place =
where it could be observed even without the PTE at hand.
>>>=20
>> Yeah, that seems to be the case because shared memory behaves internally
>> as file-backed memory, but logically needs to be swapped to a swap devic=
e, not
>> to the disk. This turns shmem into an odd hybrid, which does not truly a=
dhere to
>> the rules the other categories comply.
>>>=20
>>> Maybe we should document more clearly, especially what to expect for an=
onymous pages and what to expect for shared memory etc from the pagemap. On=
ce we figured out which other interfaces we have to deal with shared memory=
 (minore(), lseek() as we learned), we might want to document that as well,=
 to safe people some time when exploring this area.
>> I agree, as I found out first hand how eluding this information can be.
>> Thank you for your comments and discoveries mentioned on Peter's RFC thr=
ead[4], particularly the usage of mincore(), lseek() and proc/pid/map_files=
 in
>> CRIU. I learned a lot from them. We should definitely add them as altern=
atives for
>> parts of the missing information.
>> Currently, the missing information for shmem is this:
>> 1. Difference between is_swap(pte) and is_none(pte).
>>     * is_swap(pte) is always false;
>>     * is_none(pte) is true when is_swap() should have been;
>=20
> You can also have is_none(pte) if it should be is_present(pte).

Does this happen if the pte is accessed before the reverse mapping procedur=
e
finishes updating swapped in pages? I thought this case was being protected
somehow.
>=20
>>     * is_present(pte) is fine.
>=20
> is_present(pte) is always correct when set, but might be wrong when not s=
et.

We were not able to find any case when is_present(pte) is true when it shou=
ld
have been false, nor vice-versa. Is your previous comment also an example?
>=20
>> 2. swp_entry(pte)
>>     Particularly, swp_type() and swp_offset().
>> 3. SOFT_DIRTY_BIT
>>     This is not always missing for shmem.
>>     Once 4 is written to clear_refs, if the page is dirtied, the bit is =
fine as long as it
>>     is still in memory. If the page is swapped out, the bit is lost. The=
n, if the page is
>>     brought back into memory, the bit is still lost.
>=20
> There are other cases that don't require swapping I think (THP splitting)=
. I might be wrong.

That's a good point. Still, the bit can disappear at any time.
>=20
>> For 1, you mentioned how lseek() and madvise() can be used to get this
>> information [2], and I proposed a different method with a little help fr=
om
>> the current pagemap[3]. They have slightly different output and applicat=
ions, so
>> the difference should be taken into consideration.
>=20
> At this point I am pretty sure that the pagemap is the wrong mechanism fo=
r that. Pagemap never made that promise; it promised to tell you how the pa=
ge tables currently look like, not the correct state of the underlying file=
.

I start thinking the same thing. Also considering the implementation, when
tackling shmem pages, the information gets retrieved in a very different wa=
y.

It is clear that private and shared pages, as of their current implementati=
on,
are two very disjoint sets, which need to be reasoned about differently.

Now, my only concern is whether being aware of this difference can/should b=
e=20
the user's job, or whether the kernel is still better suited for handling t=
his layer=20
of abstraction. Because the former would usually mean a significant differe=
nce=20
between operations just to retrieve info that is common to both types of
memory (imagine an interface/class in OOP), whereas the latter could impose=
=20
performance deficits on operations that would only target one type of memor=
y
anyway.
>=20
>> For 2, if anyone knows of any way of retrieve the missing information cl=
eanly,
>> please let us know.
>=20
> As raised by Peter as well, there is much likely not a sane use case that=
 should really rely on this. There might be corner cases (use case you ment=
ioned), but that doesn't mean that we want to support them from a Linux ABI=
 POV.

Considering the swap information (offset & type) is already exposed for pri=
vate
pages by the pagemap, I can only comment that not supporting it at all for
shmem seems incomplete IMHO.

I agree pagemap might not be the ideal place for shmem swap info, but an
alternative for information that AFAIK cannot be retrieved in any other way
should be taken into consideration.
>=20
>> As for 3, AFAIK, we will need to leverage Peter's special PTE marker mec=
hanism
>> and implement it in another patch.
>=20
> Or come to the conclusion that softdirty+shmem in the current form is the=
 wrong approach and you actually want to maintain such information in centr=
al place, from where you can retrieve reliably if shared memory has been mo=
dified by any user.

That would definitely be more efficient, compared to having to update a
structure in each process every time a page gets soft-dirty. And more accur=
ate.
>=20
> pagemap never worked reliably with softdirty/swap/present on shmem, so it=
's not a regression. It was always best effort.

--
Kind regards,

Tibi=
