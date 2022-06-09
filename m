Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F0A5C43334
	for <linux-doc@archiver.kernel.org>; Thu,  9 Jun 2022 16:45:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242129AbiFIQpB (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 9 Jun 2022 12:45:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50748 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243674AbiFIQo7 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 9 Jun 2022 12:44:59 -0400
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2123.outbound.protection.outlook.com [40.107.92.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6712C17ED12
        for <linux-doc@vger.kernel.org>; Thu,  9 Jun 2022 09:44:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IhjZlamOaicfFXo/FZj16/IbLI40zBeH4fWMG8qyI6jDYOezOgiqii2z0jDRZanBrdRKnapEW2k7FSP7hr4wynjjPjICD1V33qiKfLFz6NlR2iHj/hY2q3nSKpZPgRtCdSkLEFPM7/txnrY48PR+cgRpOxkLTuGuXA1yet5SyispnDh+fGF2phoiPDLo7+zm4cjOuxKBn0UFZzQlLZmuM6x9BeQnvYdIvrFNkr7DHrBj5xGOA+wpJoGAjCQVgyh/rnWi7zgAeRc18Ata/5byeSYpoxYdwh6GzGofa7AxqCVq9QCIYpxwTlEOjeHFhfpFlMWCqERFknUsR61kZUsRkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SZblUiTPhrnEekaS7sCHt+aZzRJujNUOi/XSeD/cZ38=;
 b=FVe7ARq0cSPbqaeqgE9t9e0TOhRI4DeeLcTkkCjDGc237oYuL40Y9Z6i5JqglSv2IaE9PzVS7pZA44lBu9ucInlqR7Dg7NS34TCuL+N5uIRE2agKymWjHbySrpnBUb6iwFZCkkbGUSjndb24Iv+MzdEQ39iKzj3p1KeOBeaHPcHPMRIiITtfKEDHZvupluM2iaIGmMjV4hSghAcKN8yiB5aQRXJ7yPKAQ7RMzM0i0YNeMyhAtuWE0bWDHOUMV4ZHdggsjzOIIvLBDo6mI2tkPPIil2VSefgwCkMP7y6GfbVWocKlksou0mxbmufzQ2S9NsZxCW7+zyZmkZm6ElEokw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=corigine.com; dmarc=pass action=none header.from=corigine.com;
 dkim=pass header.d=corigine.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=corigine.onmicrosoft.com; s=selector2-corigine-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SZblUiTPhrnEekaS7sCHt+aZzRJujNUOi/XSeD/cZ38=;
 b=CphrhZz9HvEuFYeFe5VK2Ok7IbH5mSCSHk7PgJw6OAE1U9vcpp1WQhxcJusuhNkl8QCHsxsjhP9ZKTFbMBB17N5Pow5/KKGPGB9ibaL0Et5lnZ9Mg+1+/eUTnkchwrBVr8BJZz3pRHikRXFvW5L2iu4gLOR59H5IwAdg9fDVyls=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=corigine.com;
Received: from PH0PR13MB4842.namprd13.prod.outlook.com (2603:10b6:510:78::6)
 by SJ0PR13MB5499.namprd13.prod.outlook.com (2603:10b6:a03:425::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.11; Thu, 9 Jun
 2022 16:44:55 +0000
Received: from PH0PR13MB4842.namprd13.prod.outlook.com
 ([fe80::b18b:5e90:6805:a8fa]) by PH0PR13MB4842.namprd13.prod.outlook.com
 ([fe80::b18b:5e90:6805:a8fa%8]) with mapi id 15.20.5332.011; Thu, 9 Jun 2022
 16:44:55 +0000
Date:   Thu, 9 Jun 2022 18:44:50 +0200
From:   Simon Horman <simon.horman@corigine.com>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        oss-drivers@corigine.com
Subject: Re: [PATCH] docs: arm: tcm: Fix typo in description of TCM and MMU
 usage
Message-ID: <YqIjgt0Df2JYlmpF@corigine.com>
References: <20220603112729.222398-1-simon.horman@corigine.com>
 <87fskd4yiq.fsf@meer.lwn.net>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87fskd4yiq.fsf@meer.lwn.net>
X-ClientProxiedBy: AM9P193CA0019.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:20b:21e::24) To PH0PR13MB4842.namprd13.prod.outlook.com
 (2603:10b6:510:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8cc21cbf-eb50-4031-22f4-08da4a3761ff
X-MS-TrafficTypeDiagnostic: SJ0PR13MB5499:EE_
X-Microsoft-Antispam-PRVS: <SJ0PR13MB5499782BD12E5D3C3C8DACD1E8A79@SJ0PR13MB5499.namprd13.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jJHc0pGKyNq2mm0MYQ8V2c/hrsP3P9kSl73V9KYJWrTjNj3XC4IZ7+dMKY9Q/vKGJF0MugvOrSLEcCH/ZNp0218dKH1Ta4NPznQJ4kzLJhBJvhlisxzpsVzRmwtFkrafJEUQHxcZqUJDQAQDnvtQX1KuFGP0i/SL5W47dsFh7kFXckTMOy1+5xbSBKUyaz80hB39Tgb0uqLkUHyJlhcpEmVrO0wX8yoeihGnoEaFUTeDXYTpTunjkluKjH97QsmqnlY14fdIOwE+BQwSF6EY+NdCc3MJymlkXQBpR/TErhQ7I4m7dCNeJgMCrh8rABi80FPW5Iuz78SrrFqF3B34rCYOvBjLsfpwU8HwhZ1NoJjw4xw51vpuWP4MtwpVA5o8wt2Nl0J60bTMyp+0771eDlrSRlCNfjrQ9oDibqDtC1rcsXjVYVNBAlwnqpReE2gGmhM0lMk2Jky9MES7IAV8JQ/cr7eDTP8MBUrpVzEtHEYOX2ol11Q0Z2/B0trkWCclMWNWo0EUd7Nr6XDt+IWW5CibRj+CjontcTJIrUQ/Wqeq89MPOzBcsC0qqVP4yJVk7hHT0Hjf28cUbOmEBk9t/a6oy2ZNeofKXdEN4ksrDZYcgujygxN/J2L9jlNpPdDK6bRQGRQ5MF4HsdUF3vVWfg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR13MB4842.namprd13.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(346002)(366004)(396003)(136003)(39840400004)(44832011)(6512007)(6486002)(66476007)(66946007)(66556008)(8936002)(316002)(8676002)(4326008)(6506007)(86362001)(508600001)(38100700002)(5660300002)(52116002)(2906002)(83380400001)(107886003)(6666004)(2616005)(41300700001)(6916009)(36756003)(186003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?uCttNq6W8k+D/DwF7vj7vFf+Fg0G0eXiBvwVSbjX67Kg/eYf1nv8xfAWslh7?=
 =?us-ascii?Q?AxU3REPWQfhenz1+WckNlJV9rxOJugagQO7Qzoww63Gbfv3zza1cLWA1xbqH?=
 =?us-ascii?Q?VKedMe2gAc2obk9+UnNLtj9Awkcdf5GU/WhzXgPQDWwXkIe70UPEDbHqRnFy?=
 =?us-ascii?Q?ltaROTKKs/qzXSmO69SiIn6IupxR0ryqGs8IpVOdOfKVJEOl3EM7J+9QGJ04?=
 =?us-ascii?Q?7eQpLdkk/JJU2YlvNHF4ec3vL49X1OOdZ40xD8PNbGiP/c415J5iv2y5dZyH?=
 =?us-ascii?Q?D08atcmUTFnI0yRi4BZ8kL1CCjCWoHQ10ZijPlEMCGTCRKaOGMcrp+Q+hoCn?=
 =?us-ascii?Q?c5kOEgu+VYYFTBQrQ/r5Lx9G7fa0pctYN/4OOs8th2HxJ3skzBvqvK8tude7?=
 =?us-ascii?Q?tK9zYvkAg3ZyDWqdYk/rehQ80hTq+0DrbwQSRDVzeoEwL8xMJKM8S/ALZ9r/?=
 =?us-ascii?Q?9qRZ+VKj5C4mkGOr6pUF44O2N9HZjWihp1vOfAm2j3kBEjOKXe7zrFmNjtjv?=
 =?us-ascii?Q?+KdeFYc+UH/tNsXruou9KqFBp5lsazU+6Smrz+99XsI/6ffuBWOR7ly/fSLl?=
 =?us-ascii?Q?829mXhRp6jTzxIzqz/TsbDYUbSiuSmQZnEUHDgD6BGuoxXGj8RV5Asu7Bk0q?=
 =?us-ascii?Q?BZnLWF0IYM3zlKAp4D+xrxtMKyi/w9D3EHBS4V0xiChBFxWM4vsyYgoFncsI?=
 =?us-ascii?Q?c+ggzBq+fg8nTkIs4QTlps81vykIDx6zDyv/V54JRdj/kxzHBtqv0ifbqz0S?=
 =?us-ascii?Q?x3jX2e1GNeScjig0a6Gm57Zpw6CbvoSGk6PvrzXMsESXP4bStbPO9vbtwKTk?=
 =?us-ascii?Q?UaFfaJtzpYxKH+kFjPvRGI+GjmzG8MkGpI9q0u2i9cprghawmgI+/dTROLaB?=
 =?us-ascii?Q?H8GJZMGOyrKwHG5Qi76bpQpjb5q43MZ4xMZHy3YUmX1Ixdmuy/m91W6O5uAB?=
 =?us-ascii?Q?O5go7fj1spgqZFwjtH2bVm7tBCpbsuVENvwiNdOVjnZMYU9OxwBkqaRTB6TT?=
 =?us-ascii?Q?s2fbGMccgoA9r4XjW4K48cjHeBTlTFUmNvezk0xFp3g6NhYzadgz6KofuuFe?=
 =?us-ascii?Q?6ZYU33k+2DdvOhaLHN2M78SFYwzMTO2jVzIt9Jh/ncKzsqMU2XhoIq2jmJUM?=
 =?us-ascii?Q?0E9YR/UnnQtX3NR3Eh/VcvNVLMqfve65KPzNve3SVPvvEYlwc8HA7uBcKr+x?=
 =?us-ascii?Q?duBAp2hiBBNYhM4LC2MrZrZBboYERrThZSpbhKh1bzXr4j9rANPltRkZAIh8?=
 =?us-ascii?Q?mTfjy2lc7oOClTio16iFmOI8vMQSye0lnwVn71dDlYLJ8fpRwAF+IfDyKlLK?=
 =?us-ascii?Q?UDlcMeiMKaa9J9h6nZjjfV/MZ34MXukdZbynUhdfn69z7gaz9wQPpMPds2Lf?=
 =?us-ascii?Q?K027p2JIbHtihXqJ62M7IdoZqZMLp8zkVsuGrq+gHVo+8B0wPaLFTknW0HOZ?=
 =?us-ascii?Q?1Kp1+wcEzAsPsC7llzeSodpsfBxTNguCM3i3vArADwUQLJ+nI51OV3MDMIjy?=
 =?us-ascii?Q?5gZrAYUXfl9McbGbEzSvBEg2nXYF78+xAxBZId7CW0Gox7pcqq/UBUSCIe5m?=
 =?us-ascii?Q?11L+yVwqVtlhpYUZet62JlI8iTgp94T0q5TjdCtaKUrvVCA3Tt6XaUPe12ud?=
 =?us-ascii?Q?tfeqWFnJseWdBjZ+Z9XW09K2sWHvFayEiGGfSP96O/HfT5m/ltQoJsgZKo3a?=
 =?us-ascii?Q?v+t5rLwgGGkRBCjU4k2bvWK+w0DclT0cflECn0THBK6dxvUP4z8JoI0NJ8lq?=
 =?us-ascii?Q?zEABIX11KFa2jw3wtzRgUYBp6kbLEVAHHpBSB7BY8nIrSp4maJkT1nFBSdWm?=
X-MS-Exchange-AntiSpam-MessageData-1: +l+bSeU76FSG8EPyKkhcfpfiSRcOzhmGs4w=
X-OriginatorOrg: corigine.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8cc21cbf-eb50-4031-22f4-08da4a3761ff
X-MS-Exchange-CrossTenant-AuthSource: PH0PR13MB4842.namprd13.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2022 16:44:55.5519
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fe128f2c-073b-4c20-818e-7246a585940c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y++XvGWEkAZBpIqzCoe3Lt+XLKpwrWHzi9HY8C+v964BKvdEDDF4or8wgh46FTQzmK0tdnkzzuopsr/2Jx8omyumLB+/gAxeBr6i1BPG5Ug=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR13MB5499
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Jun 09, 2022 at 10:01:01AM -0600, Jonathan Corbet wrote:
> Simon Horman <simon.horman@corigine.com> writes:
> 
> > Correct a typo in the description of interaction between
> > the TCM and MMU.
> >
> > Found by inspection.
> >
> > Signed-off-by: Louis Peens <louis.peens@corigine.com>
> > Signed-off-by: Simon Horman <simon.horman@corigine.com>
> 
> Here too I have to ask: what does this signoff chain mean?  If two
> developers were needed for a single-character typo fix, then a
> Co-developed-by line is appropriate.  If you are forwarding a patch from
> Louis, then a From: line to get the authorship right is indicated ... ?

Hi Jon,

The patch was created by me.

Due to internal processes a release by a colleague is provided, that is the
purpose of Louis's sign off (overkill in this case, I agree).

If Louis's sign-off is not necessary from your perspective then I'm happy
for you to drop it or for my to repost the patch without it.

> >  Documentation/arm/tcm.rst | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/Documentation/arm/tcm.rst b/Documentation/arm/tcm.rst
> > index b256f9783883..1dc6c39220f9 100644
> > --- a/Documentation/arm/tcm.rst
> > +++ b/Documentation/arm/tcm.rst
> > @@ -34,7 +34,7 @@ CPU so it is usually wise not to overlap any physical RAM with
> >  the TCM.
> >  
> >  The TCM memory can then be remapped to another address again using
> > -the MMU, but notice that the TCM if often used in situations where
> > +the MMU, but notice that the TCM is often used in situations where
> >  the MMU is turned off. To avoid confusion the current Linux
> >  implementation will map the TCM 1 to 1 from physical to virtual
> 
> Thanks,
> 
> jon
