Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4ABDDC432BE
	for <linux-doc@archiver.kernel.org>; Fri, 20 Aug 2021 17:10:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2750A6113B
	for <linux-doc@archiver.kernel.org>; Fri, 20 Aug 2021 17:10:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232611AbhHTRLI (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 20 Aug 2021 13:11:08 -0400
Received: from mx0a-002c1b01.pphosted.com ([148.163.151.68]:14058 "EHLO
        mx0a-002c1b01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230052AbhHTRLH (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 20 Aug 2021 13:11:07 -0400
Received: from pps.filterd (m0127839.ppops.net [127.0.0.1])
        by mx0a-002c1b01.pphosted.com (8.16.1.2/8.16.0.43) with SMTP id 17KGJgkW028288;
        Fri, 20 Aug 2021 10:10:25 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version;
 s=proofpoint20171006; bh=5Y1SpQySScHYggB036//OYirFoud4GAqSNQH7jrOTSg=;
 b=fIZxyw4fhUp883K89f98gBh+U/X8dyNPHOvljzt9FTbC7HtgLzPeS/RyJnYPaeXAYS44
 CdcysQb4qq5EOfy1C4CMz3SgUrp7BN6EvF+NzQ9sOKLG/EwzRbyD5VI3QwtHA61BwY2w
 3K1BdOg6ncLkeqT+fHaoOD3N1j2IxqvcgRk0t5/J9IKPyfYv9BzJ50tpdZjk9GWH5gvs
 gG2+c/b1lkcyWpkx9RuQSOH+4mna8TR0v9m4WDIs1sIgz6xrZyGU/cp24GUEAmiAPPkE
 MixSx7uI/Yhthrl9OVxPLUKqsoxlZG1RPMzUFQXrYO3yBGyInIQmZjhbGCqNnM85ZQGj Fw== 
Received: from nam04-mw2-obe.outbound.protection.outlook.com (mail-mw2nam08lp2172.outbound.protection.outlook.com [104.47.73.172])
        by mx0a-002c1b01.pphosted.com with ESMTP id 3ahsxge04k-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 20 Aug 2021 10:10:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e1FFpFOQWooatXraomYCBT01CcqHQ0MVKx9vL5ZEFyS1iGgvItfuJdDinWbT9T/3RLvi8FwxyieTdtn9xbyh3xy9cIvbwI9qXmtcBkdqzyNaNP+LWZqAMfsHbWUWzRlHLupmkAShzxOa6BPOAgQn7mHSFvASGgUgxFuw27ixxE9zxSt1mOtFpmkpZ6SpyrakpMl71kkRHqFPKYNVGawz9HkNoDOZMhfde2aIvPKI5OQv+xcwnb1Zp/HVXSGpoc0ZwOj4NNU5ZCbtKFyeSGri5NCOjzdt3vu3Aa+aYw969m1S25M/XUXvys0JaYM0XS9ZvFeGxdj/4V2zKZNIcDkl5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5Y1SpQySScHYggB036//OYirFoud4GAqSNQH7jrOTSg=;
 b=BKgH/+3egBDhSAuDWuTy2s5x2M05yLIRgdsFr67LXEfCU6updIh1gMZSII/exxyPfOhDQhh4QeoBkNKzBwn8ngQYdvKmVi4FOYxyd3MJy5dpiD4DgzJvaklRYPAWPLuLRvU4j/YJBqlvsPSbtaKvxnHKn73G500ZhQXcxqfWE7m/rLgoxW18Etcd/7Ar4BKbLx8sIitq/Xf6PXMDPBlN/lQkE9sGlZ1y8ye8pbPuxsgoIhLzPqFtBkl1OQEnJMRdAmbBP3GETGD3kmnRo0a/4IhAN7RnGTajm6SkC3SCZUU6aawKCLEG7U8pftDEYzPMD024TbgujM/EI4VFsFdifg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
Received: from BL0PR02MB5569.namprd02.prod.outlook.com (2603:10b6:208:8f::26)
 by BL3PR02MB8003.namprd02.prod.outlook.com (2603:10b6:208:35a::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.21; Fri, 20 Aug
 2021 17:10:20 +0000
Received: from BL0PR02MB5569.namprd02.prod.outlook.com
 ([fe80::b80d:b2e0:3182:7a4c]) by BL0PR02MB5569.namprd02.prod.outlook.com
 ([fe80::b80d:b2e0:3182:7a4c%6]) with mapi id 15.20.4415.024; Fri, 20 Aug 2021
 17:10:20 +0000
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
Thread-Index: AQHXj5L6XJIQPBlKGEiBcDA4x9X9d6t5q4AAgAMB24A=
Date:   Fri, 20 Aug 2021 17:10:20 +0000
Message-ID: <F04C4283-0D25-4D0E-B3A8-05B36ACFF30D@nutanix.com>
References: <20210812155843.236919-1-tiberiu.georgescu@nutanix.com>
 <8f7d6856-7bcd-dedf-663b-cd7ef2d0827f@redhat.com>
In-Reply-To: <8f7d6856-7bcd-dedf-663b-cd7ef2d0827f@redhat.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3654.120.0.1.13)
authentication-results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=nutanix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b21f84a3-f42b-460d-f05e-08d963fd63ce
x-ms-traffictypediagnostic: BL3PR02MB8003:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BL3PR02MB8003A06DAA4A17CA5DF19680E6C19@BL3PR02MB8003.namprd02.prod.outlook.com>
x-proofpoint-crosstenant: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: dwxo+ZO3tg735NLUk0+kFc48nxKvyMyd7KyW/q4k79PW9VouE6vWZtCY9BN3HHxlRcMIdvbiAf+satXP1dDfm8LZZmOMZetUafknAU0mXu65NLqJ7t2kk/SbXz5tKnYTjKDSgwUXaOHF7Is5cNch04kZ53pLMwaSxLkGhQgAzfmyL5XdHx9NF7APmxqRpCfJJTRbxMaasNhYaCZAAjE/MD7432PuFETICR5wvkg5pSUTcyXqfGQ0Htgaj5YwQ3JjRMbg1T4mbjyU7QlozfOpYuDDAqEJbtTBZi5x4ErRHXwpUDi+zGFHtvm6/VuPZvVqmgwWuYt8Va1+MTT2NLLIHtHC14b1d9x/9E33VUSciUde8Xiq1TSICGaxDMKs3W2PfFcikQx2Mr1h4kTsFRm/qjKepTZ+YWK3GkxSqkf+8AQqAsZp5wwVCgzgCpP4DozYnQ54sORCtBtSBALPIkMHV4JUJVvKeeZctCflzmax4Cuf9o11QdJnFWIrqwECm0hxM8Opu58u0jHlfHR+DsdANWDqNFz55cTvoyDipkA8qQrUhVstalDH5gzS+bwvi5FhO/XXJHFOoT2Fz38dOr5KtO8iv5W7YTAdsBLmaF/ikrDNRUxNRqRg0sSp2c6Zw5jE9XR6DXdyIoz0QEp8qtzmBwGUfgF5QwWVhgjmreTpIMvGTNJGpjaL576vJMhpvL8iOL19dPGy7vGs4FfA6h5EzzwUQafQ+DrpXoA3AdVDTF/CkShNNoRl3AFsLK348qfyzLXLeLxYf5uqfnl8iYG0BDzkNbgp5zd2zh0dZkH5Rxgs+185ZKtUpvnkBpUteS72jsS8wBDjqNlIL9cMHUCG3czZ3G97nqA5xYHnyeyVX2Ez0d4SB2lfYIzc/rwQL4zD/rhwUvUp91tPZzQTZkV4WQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR02MB5569.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(39860400002)(376002)(396003)(136003)(346002)(366004)(4326008)(5660300002)(38100700002)(53546011)(6506007)(44832011)(6916009)(478600001)(2616005)(122000001)(36756003)(54906003)(83380400001)(6512007)(316002)(38070700005)(71200400001)(107886003)(966005)(76116006)(66946007)(66556008)(6486002)(64756008)(91956017)(66446008)(66476007)(186003)(2906002)(86362001)(8936002)(8676002)(33656002)(14143004)(45980500001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?y3qt/s2nLvybMDbaJamLmwB1DTCaQHsNNqG9fNHtO00WTQr9KhPWQQ5EJYmj?=
 =?us-ascii?Q?se4FXpn46rqHT7T+JzLyW9wl4AkEtunbu6JcVFHc7Wg3CARGWkvmvgwhZ1gH?=
 =?us-ascii?Q?Pghhdcw5wH0LxtBfU+rIzTnqH83DWoXzw8AH8NJFoUvAQa2M6pFWfmLHvqdt?=
 =?us-ascii?Q?9togQlW4EZU4ddVS9p/sOc+6rUHAE/z3qzOHnT7uqBxk/H1FvxMw0Sir/3ry?=
 =?us-ascii?Q?dCFFFGaRphn8D5c4VS5tJq8HJ9vKmq+yZXF2lNcoxU2pHiTDVnIlx6OzpYmc?=
 =?us-ascii?Q?YBoVwsGo8Cwky1VZ9ve7hR5AVcU6A/c1MltHGVZcjQzqP2wX0kXd7HfrQveh?=
 =?us-ascii?Q?0Tz1TycQIFdOBX7KfAQsG7mSLXNL4eZ1ciBFnbDFNp4yhsjDU85Za/oJSDrS?=
 =?us-ascii?Q?JjnUDXgbFkOO188RtOcute81ElV1Ce4paHel/8d0fhkJU+vn9cK0eRCB4Z8v?=
 =?us-ascii?Q?3AMl1PubyQrQo3TcPEGEqQbcXBP4fkZI8pbhEt6/7Gzu7bBLlH6qYdwjWFIe?=
 =?us-ascii?Q?43vD3etVJoT90v5c6/am8csB68a0cOq0orQjGZIUykmMDfYl2EL+P59/lbVY?=
 =?us-ascii?Q?t5qqEnpAvTqd1LPxfvR5aM9ne5E0sR+xs48NG/df6e9mLtJ4ViQJ/1PKQYIR?=
 =?us-ascii?Q?bG7b8xg8mqKky5xRbHVtVGMDBMotgP8co5otz7UpKJUtZ7aoDMsxIIKuYZQf?=
 =?us-ascii?Q?xCjHG6meOR4t/wlmpc0k8rLqcUkGHXEsopk2GwiTPVP6MUO03CorYRhQuQMW?=
 =?us-ascii?Q?ys6HU7SxNllj8S5Lew7ASUtnaRY+Uzu7CBr4ahX/XIt/MN0kysTNgKvtwpfB?=
 =?us-ascii?Q?9iO8q4pYFv/NA1Cxnc02pRcNu7REArs65Pbn+upO/VoG7l2N3keJ503EadLK?=
 =?us-ascii?Q?vhNmqp+JhzsVv+yX2PuLdZIVrYdmGri2dpNZ45WFGSsu1qnp1AxpKJJbbT86?=
 =?us-ascii?Q?gOF0daBWm1hNuoLcbiT17GD84/sviIXiURtx8sLLpNXODkCy/3bguEvOcMhf?=
 =?us-ascii?Q?6Bd/CX9BQs8fdafmLmQZB6V0k75Ehfvt/+jNexBBqFadePAOGbM6r5ge3e9U?=
 =?us-ascii?Q?My9+tQuUyDezW5vJ4tiuxFXDBMvILSm7DnDkgxZX+NF2ZUIRUgm9yq6x50QB?=
 =?us-ascii?Q?FRslFbpL2CTRVS8c4Oahuk/sfP7TcLMJk2OAtJA+2aauDuSv7ZDd1e5I0UFV?=
 =?us-ascii?Q?8xfoBw36jj8HnBnlbt0QnWe9b+LOFloHOfYyXfEr3CJRvDPQkTmtpdRDxkAV?=
 =?us-ascii?Q?ODdM3mNG17xpIUhMpcyt528EedgN5ttKkzJLO8e7byJUcgE4meKEp2N3ogff?=
 =?us-ascii?Q?6V5cKb05X3mm054bpk0dBHfI9+0WAuQ7Rj07aqpRRwixnzQox4phf/eSK8Sy?=
 =?us-ascii?Q?EvZ0dOVLcuXkfcBBOq903BDTHkHx?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <012EAEDAD3453A4C837E2EEE6AF0FC3E@namprd02.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL0PR02MB5569.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b21f84a3-f42b-460d-f05e-08d963fd63ce
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Aug 2021 17:10:20.0288
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 347CFe1eUjKgP71IA46u0zKLv58as7qFO+R6jaAXI+KUu9z5VmMFBDUw2dHdmqgb1A9pa22Be8PyqntNBz4sU6tMafCpDAzHGD+HxnHo2NE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR02MB8003
X-Proofpoint-ORIG-GUID: TQbYQ5IWu6tRLdARRZQbN-K4lS79doYd
X-Proofpoint-GUID: TQbYQ5IWu6tRLdARRZQbN-K4lS79doYd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-08-20_06,2021-08-20_03,2020-04-07_01
X-Proofpoint-Spam-Reason: safe
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hello David,

> On 18 Aug 2021, at 20:14, David Hildenbrand <david@redhat.com> wrote:
>=20
> On 12.08.21 17:58, Tiberiu A Georgescu wrote:
>> Mentioning the current missing functionality of the pagemap, in case
>> someone stumbles upon unexpected behaviour.
>> Signed-off-by: Tiberiu A Georgescu <tiberiu.georgescu@nutanix.com>
>> Reviewed-by: Ivan Teterevkov <ivan.teterevkov@nutanix.com>
>> Reviewed-by: Florian Schmidt <florian.schmidt@nutanix.com>
>> Reviewed-by: Carl Waldspurger <carl.waldspurger@nutanix.com>
>> Reviewed-by: Jonathan Davies <jonathan.davies@nutanix.com>
>> ---
>>  Documentation/admin-guide/mm/pagemap.rst | 6 ++++++
>>  1 file changed, 6 insertions(+)
>> diff --git a/Documentation/admin-guide/mm/pagemap.rst b/Documentation/ad=
min-guide/mm/pagemap.rst
>> index fb578fbbb76c..627f3832b3a2 100644
>> --- a/Documentation/admin-guide/mm/pagemap.rst
>> +++ b/Documentation/admin-guide/mm/pagemap.rst
>> @@ -207,3 +207,9 @@ Before Linux 3.11 pagemap bits 55-60 were used for "=
page-shift" (which is
>>  always 12 at most architectures). Since Linux 3.11 their meaning change=
s
>>  after first clear of soft-dirty bits. Since Linux 4.2 they are used for
>>  flags unconditionally.
>> +
>> +Note that the page table entries for swappable and non-syncable pages a=
re
>> +cleared when those pages are zapped or swapped out. This makes informat=
ion
>> +about the page disappear from the pagemap.  The location of the swapped
>> +page can still be retrieved from the page cache, but flags like SOFT_DI=
RTY
>> +and UFFD_WP are lost irretrievably.
>=20
> UFFD_WP is currently only supported for private anonymous memory, where i=
t should just work (a swap entry with a uffd-wp marker). So can we even end=
 up with UFFD_WP bits on shmem and such? (Peter is up-streaming that right =
now, but there, I think he's intending to handle it properly without these =
bits getting lost using pte_markers and such).

If that is the case, I guess we should not end up with UFFD_WP bits on shme=
m
ptes yet. Sorry for the confusion.

Great to hear Peter is upstreaming his patch soon. Is it this series[1] you
mention?

[1]: https://lore.kernel.org/lkml/20210715201422.211004-1-peterx@redhat.com=
/
>=20
> So regarding upstream Linux, your note regarding UFFD_WP should not be ap=
plicable, right?
>=20
Right.
>=20
> On a related note: if we start thinking about the pagemap expressing whic=
h pages are currently mapped into the page tables ("state of the process pa=
ge tables") mostly all starts making sense. We document this as "to examine=
 the page tables" already.
>=20
> We only get swapped information if there is a swap PTE -- which only make=
s sense for anonymous pages, because there, the page table holds the state =
("single source of truth"). For shmem, we don't have it, because the page c=
ache is the single source of truth.
>=20
> We only get presence information if there is a page mapped into the page =
tables -- which, for anonymous pages, specifies if there is anything presen=
t at all. For shmem we only have it if it's currently mapped into the page =
table.
>=20
> Losing softdirt is a bad side effect of, what you describe, just setting =
a PTE to none and not syncing back that state back to some central place wh=
ere it could be observed even without the PTE at hand.
>=20
Yeah, that seems to be the case because shared memory behaves internally
as file-backed memory, but logically needs to be swapped to a swap device, =
not
to the disk. This turns shmem into an odd hybrid, which does not truly adhe=
re to
the rules the other categories comply.
>=20
> Maybe we should document more clearly, especially what to expect for anon=
ymous pages and what to expect for shared memory etc from the pagemap. Once=
 we figured out which other interfaces we have to deal with shared memory (=
minore(), lseek() as we learned), we might want to document that as well, t=
o safe people some time when exploring this area.

I agree, as I found out first hand how eluding this information can be.
Thank you for your comments and discoveries mentioned on Peter's RFC thread=
[4], particularly the usage of mincore(), lseek() and proc/pid/map_files in
CRIU. I learned a lot from them. We should definitely add them as alternati=
ves for
parts of the missing information.

Currently, the missing information for shmem is this:
1. Difference between is_swap(pte) and is_none(pte).
    * is_swap(pte) is always false;
    * is_none(pte) is true when is_swap() should have been;
    * is_present(pte) is fine.
2. swp_entry(pte)
    Particularly, swp_type() and swp_offset().
3. SOFT_DIRTY_BIT
    This is not always missing for shmem.=20
    Once 4 is written to clear_refs, if the page is dirtied, the bit is fin=
e as long as it
    is still in memory. If the page is swapped out, the bit is lost. Then, =
if the page is
    brought back into memory, the bit is still lost.

For 1, you mentioned how lseek() and madvise() can be used to get this
information [2], and I proposed a different method with a little help from
the current pagemap[3]. They have slightly different output and application=
s, so
the difference should be taken into consideration.
For 2, if anyone knows of any way of retrieve the missing information clean=
ly,
please let us know.=20
As for 3, AFAIK, we will need to leverage Peter's special PTE marker mechan=
ism
and implement it in another patch.

[2]: https://lore.kernel.org/lkml/5766d353-6ff8-fdfa-f8f9-764e8de9b5aa@redh=
at.com/
[3]: https://lore.kernel.org/lkml/B130B700-B3DB-4D07-A632-73030BCBC715@nuta=
nix.com/

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
For completeness, I would like to mention Peter's RFC[4] and my own patch[5=
],
which deal with adding missing functionality to the pagemap when pages are
shmem/tmpfs.

Peter's patch[4] adds the missing information at 1 to the pagemap, with ver=
y little performance overhead. AFAIK, it is still WIP.

My patch[5] fixes both 1 and 2, at the expense of a significant loss in per=
formance
when dealing with swapped out shared pages. This performance loss can be
reduced with batching, for use cases when high performance matters. Also, t=
his
patch on top of Peter's RFC yields better performance[6]. Still 2x as slow =
on
average compared to pre-patch.

Peter's patch has a config flag, and I intend to add one to mine in the nex=
t
version. So I wanted to propose, if alternatives are not implemented yet (m=
incore,
lseek, map_files or otherwise are insufficient), we upstream our patches (o=
nce
they are ready), so that users can toggle them on or off, depending on whet=
her
they need the extra functionality or not. And, of course, document their us=
age.

If neither sounds like a particularly useful/convenient option, we might ne=
ed to
look into designs of retrieving the missing information via another mechani=
sm
(sys/fs, ioctl, netlink etc).

That is, unless we find that we can/should place this info in the pagemap s=
till, for
the sake of correctness and completeness. For that though, we should conven=
e
on what do we expect the pagemap to do in the end. Is shmem/tmpfs out of
bounds for it or not?

[4]: https://lore.kernel.org/lkml/20210807032521.7591-1-peterx@redhat.com/
[5]: https://lore.kernel.org/lkml/20210730160826.63785-1-tiberiu.georgescu@=
nutanix.com/
[6]: https://lore.kernel.org/lkml/C0DB3FED-F779-4838-9697-D05BE96C3514@nuta=
nix.com/

--
Kind regards,

Tibi Georgescu

