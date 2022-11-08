Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A2BAC43219
	for <linux-doc@archiver.kernel.org>; Tue,  8 Nov 2022 17:25:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234398AbiKHRZC (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 8 Nov 2022 12:25:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234241AbiKHRZB (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 8 Nov 2022 12:25:01 -0500
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam04on2052.outbound.protection.outlook.com [40.107.102.52])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0CBFBA7
        for <linux-doc@vger.kernel.org>; Tue,  8 Nov 2022 09:25:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cyCOLqpSimtT4fLRDUJ87MIQWJwGLeirweOlscRzfyhcy+nbKqfn4KXjreG1OHSIbu7dZtGifYNNSjOp6qkXIw3qtu7npWrRea7IIS/ThsP8ka67Aqd/OCrMimHEGRjPsHgcNXkEHH3MmIoqbxIc5lVlbt6PNYdKevSaCc3xUgT3Fj0muuu+0Dx1nDopzNbhxkCSa8b7M/xyBjqRD8QyPgULD0Nv5noAorNeEP59Zgt2PJNA0j4Ld0cr4oTt1T93FpmApHNnPUScR4ugOwxRXLkDv2HapfKkzVmDZ1lbdr0WzWp9I13j6zr10DHLuJ5LMC6fVIECpXu1MOoxaxe74A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=un94oXue6xT9XTOiOmtt8QGnQPU7j5RqWrGT0V1KcU8=;
 b=IxYOqLGRq5dipZxuedqr2ckph20tTAvlmJNGW3WJZiftzTkkczz60aLMuGrYl4IGg/MqfYlGREMO/cyiGNMUurUG2xUSzmTr9y5e4vhDlkVUqUQW3qmNB8eZerbgFCDfSP3hT21F0xKD0o99trladCZF6sMLyfe5hbAwzUwu9vdtEoF9c7ccT8uPikfNFrRBpTy02vUHR8eXLHw4R6qKOtHhddClTIqlv5DY7WHh8hEzNPvHv+5LHLfiQCvdVLHQlJFWHtZXohCa7KachITZv1hq54gZYJ66ByyBSZkqxt1hiHq0qIagfRxBVTZb7h/Oi0ZbzGlfoRIlY3oJTt/DMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=un94oXue6xT9XTOiOmtt8QGnQPU7j5RqWrGT0V1KcU8=;
 b=C7iCWaeVleyg/9qoHN/kUfBf8MwXhAMTF2Yr8qhXCX4CMC3gCebAHnN+RTP9R8THx4+UW/UJUacEf33ZR99l6kQ7VIuoemmwnR6+IKQIx3GGQv7l8HeoNlYQ0nAkDBAOj7XDqhOcZIX894Fn0prcmvHtyDAncuJk0nNWXX/FtMQXt3JCaJxKqksvw7pCfQqd7Pg1tNsg4qfAg7Vqm811f4JKonTDj2T7Z6Cq2txVAs0Kbaccy8kgk5oqyhiDKKwocAQY0O0j/Yf3kpILgLhKzcfADzXZSBSWikAEvY86xdQtaOfd6aVmznz0e9ia/5+KBDCSl52yWNwuqdLwyatqdQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by DM4PR12MB6040.namprd12.prod.outlook.com (2603:10b6:8:af::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.26; Tue, 8 Nov
 2022 17:24:59 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::7a81:a4e4:bb9c:d1de]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::7a81:a4e4:bb9c:d1de%6]) with mapi id 15.20.5791.026; Tue, 8 Nov 2022
 17:24:59 +0000
Date:   Tue, 8 Nov 2022 13:24:57 -0400
From:   Jason Gunthorpe <jgg@nvidia.com>
To:     Matthew Wilcox <willy@infradead.org>
Cc:     Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        Bagas Sanjaya <bagasdotme@gmail.com>,
        Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH] scripts/kernel-doc: support EXPORT_SYMBOL_NS_GPL() with
 -export
Message-ID: <Y2qQ6Wxyk6v9j2lT@nvidia.com>
References: <0-v1-c80e152ce63b+12-kdoc_export_ns_jgg@nvidia.com>
 <Y2p01rcfyDfIqufZ@casper.infradead.org>
 <Y2qB/TkNvPInZnY4@nvidia.com>
 <Y2qOOLDudCnXmz5S@casper.infradead.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y2qOOLDudCnXmz5S@casper.infradead.org>
X-ClientProxiedBy: BL0PR0102CA0072.prod.exchangelabs.com
 (2603:10b6:208:25::49) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|DM4PR12MB6040:EE_
X-MS-Office365-Filtering-Correlation-Id: eef1e480-af7c-40d8-e5c8-08dac1ae294d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bJVYPoxSY0OdatMB+iDqVbzIj9XS7JfdjTagpXzxgbiobRUcUnyUxv9NAVxr92xJ2LG2/1T6JHZU3SIroR1+0rbMuYvPIkrXvXNZuHUtCImpDRu+iWLmnLb9w7wEMlDD+xdgAEV/Vr31HUSx0pFBjWcq4po3uYQ18tGPIT6birXML4bsMPL+8/n21YuYs+4MCTfAQJFtL0jFKhWftgMuk4PzdqufhBA4N/TaDHDG9sDNWNvRwyWRnxxlra7OtpTQUZjRIKvHSklyDdVv4pT3cM9BCFneknXJjKYBnB4rvWdN0om8ywt0/ZCXsf25NJnHbVFBBf8CfmYaTa+v+VA0G8920tiJ6JXu0PAZFWK5LwkKAgCZnVZyjh9/DE+DgNLACYfwHg9UkcG6kbYSpbzW+w5xqRAgDZ48vAUakRbI1DfNdJFV0+MlEjM1itoUu7/sCvgQOBBNDVzpnhsXGJqSCN7S2oVMtx/MdQ9CJj6U6oylGDQEHE8tA4yT4qQ/dNMM4H7e8NHymCoGvqLrAaUhP4nrr7LC2rYK7stHz5AHWMRcI/+FcYeyMeq5IriT0Afw9HmeVYP5EiRBVVq9eSYv2kZpwHi6GGZnsJjdYq6q8psbC+Z7swsiecXZMI0aRCOfUfrOB3GgPujh1l607R+KfvrJJTb1PKkeZNk9S/kctCq+xJyRx86a7MolR/yOiQZfC4rc3uCYzeEZ8KYDlKDJtg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(346002)(136003)(366004)(376002)(396003)(451199015)(186003)(86362001)(83380400001)(38100700002)(6916009)(2906002)(41300700001)(5660300002)(8936002)(2616005)(478600001)(6486002)(6506007)(66476007)(66946007)(8676002)(4326008)(66556008)(6512007)(54906003)(26005)(316002)(66899015)(36756003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?XKHVgR5upSYstWZTnlUoTMfvg7iT28DzWwu7Ue2Ww5Z3QIsSZ0fEv6rmDWed?=
 =?us-ascii?Q?/O+57/XSzhie5+ZbHzJw6+07sdtdyGarsOBJoKGaaf0TKosYWklQCFjlzJww?=
 =?us-ascii?Q?2TO0RdwNnahX+RKl0rHYGAAH932OXKJIEJOWWulj0SuQK3zLJR7BY2S+xORs?=
 =?us-ascii?Q?2BYupuY0jwgjaqblHQwcQAfKK1Rp61QF2ZNRMH5uwm+fl0ts55F35WIruigS?=
 =?us-ascii?Q?sHqf9iO+wG98VpYJLgBA4iqnEmJcSsu0ApA2IQIKoJmrDpJarxp8FyWZUK6v?=
 =?us-ascii?Q?gvG7Pxz6MjJw5V6prJ+J/q4UFiMq2INL/LUhDSNdVXEzYwuIXdrKrdS65kOV?=
 =?us-ascii?Q?SPjwl+BRzSRB4jowcLeX51yRegdt55q0YLZ2AHX7Vhom/jxQqdQfyGMaBPGb?=
 =?us-ascii?Q?4IFWscBdbRX6t1zSJ0lVFjELUtyqAgp8XpmoRwQY9mC9ZpojhAMyLPomVaXx?=
 =?us-ascii?Q?W51MKKB+i9lN0yBASDGFuaUU1jlL3Cy7FIrTnXRV2tv4T2kBg4w99DHUnd8h?=
 =?us-ascii?Q?HG5J37K6NqmN3qau3SbuYfYCgqA+G+15twq7cHLl+3bEYgMlajoll2bjm/KR?=
 =?us-ascii?Q?/TbLbIq2Oy2Ys2Ptg5Uv4F+KMd9PNA/nTsaz2u5eFEkazaDJyssY227mD8E1?=
 =?us-ascii?Q?ENzihydsGw6TQ8ztRSxWEaamKf4IqIm0BRQtIFx3fgNoIUysyXPNOShdOSRP?=
 =?us-ascii?Q?EsjJUiX16WkMP8ohlkptdXBAvgvP9HIky/g3N3wv0GFDK5KMrs1DBY0vRWl+?=
 =?us-ascii?Q?HE2b9Wt9yK/1n35HJJ8SkCdwHt3+oTRY89zYTW0BwNMJvV9yoCEk3DmTZ6uh?=
 =?us-ascii?Q?H+XWTckSPVchzkoo6iXRpaU0loRZcLqS+8ikyG1NVaQPJ1xeLjoOD9/Lvcyp?=
 =?us-ascii?Q?qKY+d+RlBxRW7uZrXqmuNUpULa+fGSIostY7X9kQmDoPJI5jypZ5V4LgPF7a?=
 =?us-ascii?Q?O0Awxt81wqHTNIjMHihwQkyN5bb3qteXNwJfSFfZIo0bKB4YcFW1/lefVSSe?=
 =?us-ascii?Q?s8bYR3hUizWpZ8k77AUNJ4oYwnGVQN/MchbCStASUejmdwtQD6tkI+M6Nl82?=
 =?us-ascii?Q?EY0picXK1dD4zZixS3G217JFgUb2AXG5oH1XhaGUJ5eDe5/bjYYLxhRW2+qX?=
 =?us-ascii?Q?JfIDC5i9/jtMuzYh9b7oPZ96pb13d1xFk1qiEFaqtzVjZzVC0O/A3Dtlschg?=
 =?us-ascii?Q?iOw5oQOspNpqRILYKQVaoT4fkZ0GnqEmOTu4WRjdyItKA9isQ/CDBOr5/5gt?=
 =?us-ascii?Q?oSFz6pwn8xqzLCB0e4iTFhEl+cB2Pv46MTZDj2Wc6hH1LDKHzoCoxGWoq/1y?=
 =?us-ascii?Q?YCOzchRK6ICgcSsEMWnF8FbrLG+cVbQWH7ai+8BKAxwpsbD+AvdLWw6K0qvl?=
 =?us-ascii?Q?vGkU38jS4BDSr1bo8TQwBF8MAD5YNBg9YZDAKplmINi5tACN/oxtd+3IAW3d?=
 =?us-ascii?Q?7iZ6sFay5eRhf30q+1tnU31/DFU3+HynfPgYKYQv3fnf6yCvtpvVLW3XRoOw?=
 =?us-ascii?Q?5ZDt4VkDWcBtfaWiyzvw3p0RZsN1hRsyGST1vYKDKyiZz1wTFlsCPaPXGI8S?=
 =?us-ascii?Q?lCVRB8dcKwSSLhe7Gn4=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eef1e480-af7c-40d8-e5c8-08dac1ae294d
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2022 17:24:58.9505
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fc/pUlv/PPSViE2vsVhmk2002O7IuCHvTzZwX7+C7YUVc+DA/GhURtP/SwtAwIm8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6040
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Nov 08, 2022 at 05:13:28PM +0000, Matthew Wilcox wrote:
> On Tue, Nov 08, 2022 at 12:21:17PM -0400, Jason Gunthorpe wrote:
> > On Tue, Nov 08, 2022 at 03:25:10PM +0000, Matthew Wilcox wrote:
> > > On Tue, Nov 08, 2022 at 11:02:35AM -0400, Jason Gunthorpe wrote:
> > > > (I don't know perl at all so happy to replace this with something more elegant)
> > > >  my $export_symbol = '^\s*EXPORT_SYMBOL(_GPL)?\s*\(\s*(\w+)\s*\)\s*;';
> > > > +my $export_symbol_ns = '^\s*EXPORT_SYMBOL_NS(_GPL)?\s*\(\s*(\w+)\s*,\s*\w+\)\s*;';
> > > 
> > > How about:
> > > 
> > > -my $export_symbol = '^\s*EXPORT_SYMBOL(_GPL)?\s*\(\s*(\w+)\s*\)\s*;';
> > > +my $export_symbol = '^\s*EXPORT_SYMBOL(_NS)?(_GPL)?\s*\(\s*(\w+)\s*\)\s*;';
> > > 
> > > Not them i'm a perlite either, but this is just a regexp.
> > 
> > I started like that, but the target text looks like this:
> > 
> > EXPORT_SYMBOL_NS_GPL(iommufd_access_destroy, IOMMUFD);
> > 
> > And the (\w+) capture should only pick "iommufd_access_destroy", so
> > the ideal regex does the ",\s*\w+)" part only if _NS was matched
> > earlier.
> 
> Oh, right, I missed that part of the regex difference.  How about
> terminating the match with [,)]?  ie:
> 
> +my $export_symbol = '^\s*EXPORT_SYMBOL(_NS)?(_GPL)?\s*\(\s*(\w+[,)]\s*\)\s*;';

Ah, I came up with this ugly thing:

^\s*EXPORT_SYMBOL(_NS)?(_GPL)?\s*\(\s*(\w+?)(\s*,\s*\w+)?\s*\)\s*;

As there is still some trailing \w that the \s won't match.

Jason
