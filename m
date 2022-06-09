Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BD1CC43334
	for <linux-doc@archiver.kernel.org>; Thu,  9 Jun 2022 17:54:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243030AbiFIRys (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 9 Jun 2022 13:54:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50368 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237431AbiFIRyq (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 9 Jun 2022 13:54:46 -0400
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2114.outbound.protection.outlook.com [40.107.92.114])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4EE85FDF
        for <linux-doc@vger.kernel.org>; Thu,  9 Jun 2022 10:54:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HIeQ/R5Yi8bZV91qHy+3C5DXoaiMmkdCJQjNhZJ2uAIP9fheZ9+5q1hiBhqVI9vHtf3ZnILwlb9b8KCPuQ2OZJzo+E1RkL6dBKnT8LgMZUt/V5gopBogVZIZwlsSk5xdrq+gHW/Kq0+jimahvRbT12xfLeqPhiqOW8yiPxQ0x4IO2q1DOAXPi+d99YzdFTRXO12YwIjax2pLHGhIgqHM4MfDhI+I+cfnLEXvlVXlcqY0dIeU2NyOrw2Dx1GX3oy+PtUw7RoeIG37VSnAxBM2wJAdGKN4leB/858CbR7IBtWm+x2nHbXqXZOkA6iWFFGP7/mzQNQrU7aGz8LyB1GP2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8WkCCb4W7tGObK78kc5dqa36xVCAmgpvUIpdPAsziBE=;
 b=S94yX1M7m7+WTgGadXBLxW9xq6tfTYI4AyCNmmujaq/pxin4NVsewQKf2+sNz0GTk2Fv5WpbSwL2fWrEBMpZqRAyFxejQ/dXmbqzU7n0nPvL32Ov/a/dChFwrXeAzltCj8sPam4PT/lTQ1lOwjzjXBroo60UyFxONHkarsE/n8mgy6pV5ZqSNovFxqQFvu/diS5EIw+RRHH+pvmDF3naCy6qlmNK1+PEFSRimXHa9VvzHR+juiVZi6JPw5crsBvQgYJxXRKkso3YVxm+m3+Sqnw8q7t71KctNtH7AqmltDmh0taUcPRHULqAs9gXc2GTYgKv2lTJvpudPFvdRl3ICA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=corigine.com; dmarc=pass action=none header.from=corigine.com;
 dkim=pass header.d=corigine.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=corigine.onmicrosoft.com; s=selector2-corigine-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8WkCCb4W7tGObK78kc5dqa36xVCAmgpvUIpdPAsziBE=;
 b=A2Iapcx1Ek6xwOFO3FteOT3ezk1666aDaYwIGQMrdqIvGoykguArrZ9/7ED4NBLaiyRmYwB1qtXBnpLuO6v1hlhqnkGDOeInSxFvMc3ZQ9YeN7orFGMjd5GKTue9AYfrPheB2ZfRvlGZJ4TyTULbk6IPuGcNjDCyE6sw5O2xZUA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=corigine.com;
Received: from BY3PR13MB4834.namprd13.prod.outlook.com (2603:10b6:a03:36b::10)
 by SN6PR13MB2384.namprd13.prod.outlook.com (2603:10b6:805:5c::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.12; Thu, 9 Jun
 2022 17:54:41 +0000
Received: from BY3PR13MB4834.namprd13.prod.outlook.com
 ([fe80::2969:19af:7d52:6e33]) by BY3PR13MB4834.namprd13.prod.outlook.com
 ([fe80::2969:19af:7d52:6e33%6]) with mapi id 15.20.5353.005; Thu, 9 Jun 2022
 17:54:41 +0000
Date:   Thu, 9 Jun 2022 19:54:34 +0200
From:   Simon Horman <simon.horman@corigine.com>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        oss-drivers@corigine.com
Subject: Re: [PATCH] docs: arm: tcm: Fix typo in description of TCM and MMU
 usage
Message-ID: <YqIz2uuEEU/YYIjG@corigine.com>
References: <20220603112729.222398-1-simon.horman@corigine.com>
 <87fskd4yiq.fsf@meer.lwn.net>
 <YqIjgt0Df2JYlmpF@corigine.com>
 <877d5p4ui0.fsf@meer.lwn.net>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <877d5p4ui0.fsf@meer.lwn.net>
X-ClientProxiedBy: AM9P250CA0026.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:20b:21c::31) To BY3PR13MB4834.namprd13.prod.outlook.com
 (2603:10b6:a03:36b::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f1f3bab8-41b1-4ac7-dbfb-08da4a4120c6
X-MS-TrafficTypeDiagnostic: SN6PR13MB2384:EE_
X-Microsoft-Antispam-PRVS: <SN6PR13MB23840D7F9304ABDC1F6494CAE8A79@SN6PR13MB2384.namprd13.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zgoVPVQkAWIFvTGPdE1l/7X5jO3NN4Z/V/eOa4qsZ2xMVJSQbgg1vDwm4676LpivqTTYYYECN3Yd7Vkr9NisYP4hgiEsFTA8s45jn96Oy7SFxqCqxdGDITAC3LKQjPLTiUvmYkk0vA1yGGNTuZlwzzENkc7+AARktC8I5Jl6t9Fyp2dBZNKW4pdKm55FKKHyVsD45102StdZ01nrA4jCyueHE+hRtT6j0raXPeIhiAd0TIHm233A2XktH7oA3/fXYNFfEP8S//sW55Gxqs2yI8ylxmUrWJQuYy3lmvXE9FZ+14OYck0njGBE8uAmvV4IZv6qDw4+mitf9vl3w/8QbXawyf3QOroA7V0zqex8ouRGRgHA6825zk6fZnd0hvbQXmrVHw/qEM2WCc4zTIzfXkiwm2N/UvtBM9YSbYLlj05KTSZZ9X8EhpPOuw6PYlY9yc0Akil1G9aLDcMkIERFikZ2yIXruwJVAv66lz62K+HO0U5Z18likW25uz8P754NGAkpmjpU+MtGd1bBzRPZda6mGbjSsscG5kQpWAFjXM1yjdplI11N8+zUR0CFDm5mM7MfMcTzqamFGv+ijnizWoTu36lSipAw5i/Kqo8oCkk2CYLo/QH04mX0w2O9XZ8nwQ9zit+fTjpu8I2V/7+iwWeCmi3VC6KwnsohOC4FAO9NPu02Z4p2gz95sThoCHDv
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY3PR13MB4834.namprd13.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(396003)(366004)(346002)(39840400004)(136003)(36756003)(8936002)(44832011)(38100700002)(5660300002)(86362001)(6916009)(6506007)(52116002)(6512007)(41300700001)(316002)(508600001)(2906002)(6666004)(4326008)(66556008)(6486002)(66476007)(66946007)(186003)(107886003)(2616005)(8676002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wpbvCRGQMWaUvJybK+sRBVx9m/ePsOL7HZO8+rO9FohDIH4Gglf6TzUCyy4W?=
 =?us-ascii?Q?wQ/RDEwXbb26iz6qNupbU4WVeSxLEwmSrUQqPWeSgo+4DxOxtxoJbBG20hzp?=
 =?us-ascii?Q?nD3cmxGk1k8JxltmX9zgvT56XkufqTHg88Gji/En9I68KMqYQKJwHxdxviyf?=
 =?us-ascii?Q?xr0x82OFxlk6S6glvlGdTO8xksAxt+OPWcvR1z6NYZfsCpSwol8ZUkvQr5yT?=
 =?us-ascii?Q?oWwiBuVS+bGu6ldGL2qX8AamihqV4fa8glLoLlQDEdC/OYdSieKu5ve5r0+4?=
 =?us-ascii?Q?AMB96u7Pvf0EYIp8I6T9xengV7oJOJ+Nt/bWpwTEp21Gv8OfJ92IPl8H6gjR?=
 =?us-ascii?Q?OJ98N5/i67jnKZhinvuJhgHPRsqTpya1q5FtcWK9baokDdFojHdRBW0sBfip?=
 =?us-ascii?Q?qG5+0UrZN0sAQeKlHhLeguYk7L9jEaL89frJYdWdKnui8FK0NEiZMD/kSTrP?=
 =?us-ascii?Q?hlfW9gBOWVc046C05/jRjKh3EHQbmeD2DbnrBPssrJYUsnps2z7KDMsTjQgI?=
 =?us-ascii?Q?pwrGbIPBXj9Da07pZkrQbGsXOmAP6FNuFLBrudVE3oehBmzzlMjcfjV1lMFt?=
 =?us-ascii?Q?rKIwduvxR1qS1ILnMd9GWS93vsc6letlonhY1TK/LeL0eoGEsni6dKTcTUrB?=
 =?us-ascii?Q?hFu7aSWYfr1aNdHabs4N+1Yz1rE5c5b5qYiqzA/f80urwWsH9KxNkNwxIO2A?=
 =?us-ascii?Q?NSvJm38iMLpLzm/yk64fVfjq88YmqM2kGv2ZPoR/F/R/c6HFyuKK7rVypEIA?=
 =?us-ascii?Q?GBTBZW4xQhzfpHLA3PzIcR1gdZSBrlGGw0vSt0T0/QRvlzWYwJmtxOIOaNXF?=
 =?us-ascii?Q?tLWbfVMUG1kMgrpAhul5MAOqOwQN/kqARCe9QbvVgDfQp3+sXetxDE+E8PSR?=
 =?us-ascii?Q?hqeGImzd9DqXq+wWXvEkN/A+v8hieFxvxNk5NP0mkXAH8jYOqgcxw+zv8RSM?=
 =?us-ascii?Q?I5dZKwKwrBanOJC/Ds0FQBmtkcuBxoKltBe8/94pNN157FCXsfyJqubE7MFz?=
 =?us-ascii?Q?m+zLhV71SvYLzkfRfZU5EB6ycsotl6SdzHKvs0s2vTBge2dpm7JzUglMqC3E?=
 =?us-ascii?Q?llFlXDYiAXW1jXVk9lNy7V6BqMj1wdI/5dsQpLbtW15ejjnmeLmAuy8HhN7s?=
 =?us-ascii?Q?kgazqmcZguvMCvxDAEbDSukC33WI3ss5TATW5tEq5aCqti5HrCcE+M6a1QrB?=
 =?us-ascii?Q?NVG4mdBYJnTDTVz9XAuZed+oiQlH/dRfWNuXyb2zXLgmHAkKya6KiTYWXawB?=
 =?us-ascii?Q?49DsnRIjLqPQY5T6IIkIS6i0o+KuwJ+tNR0X+0qX0DW66j5JMW6M6x2aDI4T?=
 =?us-ascii?Q?5Onpjd8c5Q3QLMyJ3aU5UcCG3USahHrKYQS0EVyThe4GG1CYeFgJ5UZWVKXl?=
 =?us-ascii?Q?i816dX3Meu5gxR+AF9h7pEkJSXQ8wqWHcPR5z/RQ60UsxHlPccZnsu8stRV8?=
 =?us-ascii?Q?rEX82iSYjVJostz1BHHXCv1fngbu0QJ0fSPjWXqX0siaJjIGfYbscdcP3+0X?=
 =?us-ascii?Q?/yu99J7UHm7F7gWe97UL41ZXpdrEPVHXKoyrwKJkIZI+0ch+0YyGPPBNOjNQ?=
 =?us-ascii?Q?PNrAE4KdonzS0nMmfjZixu8a50vB4sPLbFmUdQraHBp4haZ56An+bpyBoM/Q?=
 =?us-ascii?Q?NPjBMyoLMkHwHpljCH1pfCkf9xuzPFPSvKbMxxUMDP8rl/JcNKwgCPg343F+?=
 =?us-ascii?Q?zMeVOtuwDoOeEwhQkfFHS6hJ4Xk/CFhxT95I18FJuajhWwQ/MWhk7gXaho2C?=
 =?us-ascii?Q?SNbPsaILH+1ZObOOnJRTjb0XGNBUMVwQy1unTeJhItr/Poph8i0DcpZiulV2?=
X-MS-Exchange-AntiSpam-MessageData-1: Fj5jBLi6EDDDBvuYUrcCKZvSfyR47oXQQ/U=
X-OriginatorOrg: corigine.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f1f3bab8-41b1-4ac7-dbfb-08da4a4120c6
X-MS-Exchange-CrossTenant-AuthSource: BY3PR13MB4834.namprd13.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2022 17:54:41.2391
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fe128f2c-073b-4c20-818e-7246a585940c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PBSrMR2Py/PJCqNH73UT/BGrqLSwwwOLuZqyStWE4uL4HxRizHXa8c9S2ioa1DaPG4s/dICoLtHUL8XR2zvhsw35gK7CGISCSP4zM+g3Gm4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR13MB2384
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Jun 09, 2022 at 11:27:51AM -0600, Jonathan Corbet wrote:
> Simon Horman <simon.horman@corigine.com> writes:
> 
> > On Thu, Jun 09, 2022 at 10:01:01AM -0600, Jonathan Corbet wrote:
> >> Simon Horman <simon.horman@corigine.com> writes:
> >> 
> >> > Correct a typo in the description of interaction between
> >> > the TCM and MMU.
> >> >
> >> > Found by inspection.
> >> >
> >> > Signed-off-by: Louis Peens <louis.peens@corigine.com>
> >> > Signed-off-by: Simon Horman <simon.horman@corigine.com>
> >> 
> >> Here too I have to ask: what does this signoff chain mean?  If two
> >> developers were needed for a single-character typo fix, then a
> >> Co-developed-by line is appropriate.  If you are forwarding a patch from
> >> Louis, then a From: line to get the authorship right is indicated ... ?
> >
> > The patch was created by me.
> >
> > Due to internal processes a release by a colleague is provided, that is the
> > purpose of Louis's sign off (overkill in this case, I agree).
> >
> > If Louis's sign-off is not necessary from your perspective then I'm happy
> > for you to drop it or for my to repost the patch without it.
> 
> So are you perhaps using it like a Reviewed-by?  If so, that's the tag
> that should be used.  But Signed-off-by has a well-defined meaning
> described by the DCO, and "release by a colleague" isn't in there, so
> I think that tag is not appropriate in this patch.

Thanks Jon,

I'll post a v2 without the tag in question.

Kind regards,
Simon
