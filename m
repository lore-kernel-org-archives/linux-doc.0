Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92A25EB64D9
	for <linux-doc@archiver.kernel.org>; Mon, 26 Jun 2023 23:43:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229637AbjFZXnC (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 26 Jun 2023 19:43:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229566AbjFZXnB (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 26 Jun 2023 19:43:01 -0400
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2138.outbound.protection.outlook.com [40.107.220.138])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11E8E12D
        for <linux-doc@vger.kernel.org>; Mon, 26 Jun 2023 16:43:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F8mVbQj+4PDG6mK/ffcsNSopi1MwGks/opkGzFqRwqix50UGdHgwJNhtvrcTifNSuaK0dT0Nu4IJ4Lb+CIqTQmj9IKkTF5mKtFfLk5Ej1PCUAZw0p1vyfNRDHOAF9N5rgowhy19rzSmIELr56TSEmkFy+FPhti222hMi0lS2mZU5cJi/Nky3we3noVBRREFcEffpDXBWw+lKd0KCklqlYruemTW+aYKrPmGxBVEUsE77XLdVagkOjs/kqTFijctXZGUtUPTAh5mfpjlC0ZFrzX3t4xnE9nAIRoA28Br7cC1nR+HfiuXZofADg2/vIbVf/4YbG713M27g8TtOa53fCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/BoTruZDD4zrT0nh6RyZlAKTdLr94CveaR3USnZzyk8=;
 b=ZfYiSSIc5yNmwUfy3f53zeqI7BPVt3FWRYZAb+cPoLDnZhBHXGmcaZiGabku7zS0RWgfKIH2NaQmZN3b7H/GEY6hkRkYyNKrNjbe/YxcrK7+j2+Cr9hh98BmGprFye4v/rzGp2wg6v3ig5/pYdIvC6Jaxq3940DtnV2v8ntIFibpMmx5j1eAp11/UCNnMSGhdFZVp6blgDvQHa2VK8UpiR/AU25M42lK7VWeZwTDJvqfyIUtKYRxPGv2z6BOAaSnFUOyh97YJQdg50Y16lFRQwC/9VYznvow9BK56qJqhINPJUR/QnxK66VA8HszDIVaUsYTZQsFirq4XWsEA9SAXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/BoTruZDD4zrT0nh6RyZlAKTdLr94CveaR3USnZzyk8=;
 b=KR5NPnOMlFcEX5iLElFNLdx0AAosuX7K7Z5VAJtloFtGK3T3pS6boImywF6OiDQwhFcCO109d+3ABQNIflb0TRrdSqf5Ltni3C9QEkUELKhkfbx8enJlAwKdB5TMWf5BCaVAEC9jWAVwaLas5MeBGm1WW5Hq5IXZUw/14WP7vfs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from DM6PR01MB5259.prod.exchangelabs.com (2603:10b6:5:68::27) by
 SJ2PR01MB8608.prod.exchangelabs.com (2603:10b6:a03:53d::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6521.24; Mon, 26 Jun 2023 23:42:55 +0000
Received: from DM6PR01MB5259.prod.exchangelabs.com
 ([fe80::54e5:4e1d:aaf6:7c87]) by DM6PR01MB5259.prod.exchangelabs.com
 ([fe80::54e5:4e1d:aaf6:7c87%4]) with mapi id 15.20.6521.023; Mon, 26 Jun 2023
 23:42:55 +0000
Date:   Mon, 26 Jun 2023 16:42:53 -0700 (PDT)
From:   "Lameter, Christopher" <cl@os.amperecomputing.com>
To:     Marc Zyngier <maz@kernel.org>
cc:     "Russell King (Oracle)" <linux@armlinux.org.uk>,
        Ard Biesheuvel <ardb@kernel.org>,
        Quentin Perret <qperret@google.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Will Deacon <will@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH RFC 00/17] arm64 kernel text replication
In-Reply-To: <d18208d1ae12c81edd2830ac7ca7116a@kernel.org>
Message-ID: <7ddd3c78-5392-9f8d-8f9-d898795c89@os.amperecomputing.com>
References: <ZHYCUVa8fzmB4XZV@shell.armlinux.org.uk> <ZH2lUj0zDWFppdJI@shell.armlinux.org.uk> <CAMj1kXHn0oho_CZMSc5N1updfdZDq+3VAfzw8kZqzzpTSgkXew@mail.gmail.com> <ZJW7kvWqLVZV4KVr@shell.armlinux.org.uk> <d18208d1ae12c81edd2830ac7ca7116a@kernel.org>
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-ClientProxiedBy: SJ0PR05CA0038.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::13) To DM6PR01MB5259.prod.exchangelabs.com
 (2603:10b6:5:68::27)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR01MB5259:EE_|SJ2PR01MB8608:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c6a644b-7e56-423e-aa02-08db769f107a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: q9rXpViWgIkkY69mRUsGkIP03z6HJ7NeFPV7AXPCqORVNiF7FgxTPaOFoijMHgBTadcB93+wshLmTQhaQxPgbwLOeUEw9N9o+yNShLrQC/6UkkbVKK8KZSQDtjkTt+AOP2erm8D/e9qQCCm9qP1U75QmaZTkuelU2g46UjgUASRW9rRPueQ52+UolIW7YO/xJemOlc/g9ZUUQPnVCv3XAaWgmHNkA1zSeeeFWBWT64zoUWTs1d3MixWInhQDkjqcABxRJ3xLs9FIRB3i95IbBWJwLkwEOq74slyDhfD6MK7l7zICPTWoqFlb+JA9sVAmx1t2PXPwb1qQ4yebl8LfLEhqiNeC2afrdiBtq8S+qWm1zGyPoXOVg8Fgw/3J7n5ySQ0a7X3aN0VT/U32YYpDAcSHL7WSgewYDScNJqmHhoBvoEnibRkZL8O7VANLNzwXcpKIW1SMzmygDQYQmuDjehbvzQibSDR2zUyE2tiVzO/HtzoFOygeIORKWYu+SsmXaYWMXgovXl+bL1BeGIdcwvJ0y1Y7RLAm7gIDLLgEI2M4oXr0ccvbfJEy649UxuGV
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR01MB5259.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(346002)(366004)(396003)(39850400004)(376002)(451199021)(4744005)(2906002)(6486002)(38100700002)(2616005)(6512007)(26005)(186003)(54906003)(41300700001)(86362001)(478600001)(66476007)(6916009)(66556008)(4326008)(66946007)(316002)(6506007)(7416002)(5660300002)(8676002)(8936002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?LCE8b7EZcatzMJLpMoxs+IP2wyvpuQWrl4xOjfsj5NcktDK1/GkyfRTP/xHF?=
 =?us-ascii?Q?MIk56zviSop9PiZHoZ4+Als4sC7lknXBtPlXa83wppS/CaLZTp22OlElPlWF?=
 =?us-ascii?Q?zW30JU2183b0Oqg+j9xiCmf/JalU8wtGNROhyCX1G7bWqILGKq3KFCW/qlZh?=
 =?us-ascii?Q?rZ8+w7kBO4wFSXWgaNRhk/PlLllsUM/YIXYSH+VOzUyXRk/z2nnOWC7hpA1h?=
 =?us-ascii?Q?9AtbXBujPJbHzitfqjq+CnB47hK6MLDYQ0bWQlYdBVZBRuMdklLrIuSbkKYO?=
 =?us-ascii?Q?cJ6+R7kuu2wKRaROh4iCbw/R9FTqDMrsCKuLrdt1fi5tQWQ0aDhK/RU/qTQ0?=
 =?us-ascii?Q?hIWkPkIhJuFnQ7TOj++HDGmsVKmrKEfOkjW6TtS0rVT850sylu8/HF4o3Rpt?=
 =?us-ascii?Q?iO25XZanaXfuaqwQ/W9RWLF0ZhA72CZYw9BId9dBKUBCtLpb5KXDNePI3JV/?=
 =?us-ascii?Q?32spsx359EZJPlqDUC+jvNVllCkFxBFCj6U5iZm9WzCwd9n0EFN1V5A2jB9J?=
 =?us-ascii?Q?OBmT47V5iizBhmJ1FLeZc+ZxW63p3zLwzEWRfWW2l2SN+1gkiDlV2Is1K0nK?=
 =?us-ascii?Q?sH2japsB5lbTbKxl3xGrWcZzHEO5QS/0OrwIV/QWLkiWfx+AOne4FTYZHCFm?=
 =?us-ascii?Q?pXa2mHc0VX/0xkQ2qS4aFcnaU7TUhQp6fgZXaMNvuXEBM2dpsYRjNgE9Z4Gr?=
 =?us-ascii?Q?x5+f/XfUTVzmci3Ncr/3wCtDQhYov+SgvtUtY8pxBxErIC9Gtzw6Lz8T2azl?=
 =?us-ascii?Q?G8lbkkT7hcSVR6ESwED/Q3TQcM/+oRgGbR3slJz7VbJsZGdxkDQm7B6344NL?=
 =?us-ascii?Q?isy2UPOXs4N+5LLcK0iOJUDI9lXrmC518GkSQGbtCenXGjlH46jSsVgrYiBj?=
 =?us-ascii?Q?JIUiZ1QIYny0nu28FNVrQSHEDcScQQJ4qUNskvWoHvoWoHHzXXmPKo90xo8O?=
 =?us-ascii?Q?AE/LUZut+FvaNnfijaiCMC+GyoXHsahQ9emSkcL2hp2cvf+0kFBbbC680Vyd?=
 =?us-ascii?Q?sGrtfWO/t8Nj3/FP1HO7bN7Ntz66xcyxiGHF0uZAh8abHNuQ2mXc9uX8xgAp?=
 =?us-ascii?Q?iWdQFOmP8BeHc11fdi4fiYApC/27n9m6hkbGEiJ74dkU3p4NWeVKmYwzyKUn?=
 =?us-ascii?Q?2Srb47OxCfKVwMbU9hudJoqJZXeaU4u8sXpg6CShtj4lw5ZDM8eXH8G9EvBi?=
 =?us-ascii?Q?jRvqE8DI1SX+ETFzgQEbc9QvkEosn/tjhl6QC76YIo7cDKwZPMhxKu3fstpe?=
 =?us-ascii?Q?PAQCJ31lSeONZfe/4wAIEedxjZOa4W7mz2e72PF4GGiGWaQzlnZkGjb/5a60?=
 =?us-ascii?Q?2ypF37ze/Ygo1FRg0ourwZRHVdagxfB4CAdYdl8S+x/6N8S5d0wQJVI/9x6i?=
 =?us-ascii?Q?AnALJj+mtN6gj/YBX7q7nn4Mp2KwwRZKH/EeIb5H37ipwqXU50FX5iAFEJ6I?=
 =?us-ascii?Q?1Bnum1J78qYfVp7iiU0qX30lq9jjixkukn8zmBbYeBmnI8KtCGbSkTDTGJl3?=
 =?us-ascii?Q?OhMIQiJhkp+7TdZ6y7vGoODe52tbgNYVp+cwIA4qN7bw9waRBjAdJedecir6?=
 =?us-ascii?Q?HNK9ZzqeZBIJmzxu8zUBenUFj/hrBImBYo45wEUStF8MH3hQMD5SyqA3TZUI?=
 =?us-ascii?Q?dw=3D=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c6a644b-7e56-423e-aa02-08db769f107a
X-MS-Exchange-CrossTenant-AuthSource: DM6PR01MB5259.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2023 23:42:55.3783
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A/92oYSW+5C7bDalrkpZ+8ROT949nLpPZ4iCrjSWOkD8ZdSehq5+y+M1UpcaSJgzFXxcQI655fymGVzXenF5CXQQjrFiXuSojqC416bWUMw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR01MB8608
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, 23 Jun 2023, Marc Zyngier wrote:

>> That sounds great, but my initial question would be whether, with such a
>> setup, one could then run VMs under such a kernel without hardware that
>> supports nested virtualisation? I suspect the answer would be no.
>
> The answer is yes. All you need to do is to switch between the host
> and guest stage-2s in the hypervisor, which is what KVM running in
> protected mode does.

Well I think his point was that there are machines running without a 
hypervisor and kernel replication needs to work on that. We certainly 
benefit a lot from kernel replication and our customers may elect to run 
ARM64 kernels without hypervisors on bare metal.

