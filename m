Received: from FR4P281CU032.outbound.protection.outlook.com (mail-germanywestcentralazon11022129.outbound.protection.outlook.com [40.107.149.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 880074A0A
	for <linux-doc@vger.kernel.org>; Sat, 23 Nov 2024 07:19:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.149.129
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732346370; cv=fail; b=jItWVc0eDmpE53rV17XV2t536NUaVXXAMcCVvrbua+Qyytaj7w7yAs+DFv8JfO1FjKsDP1yLs83euuzUJxNlyAVdjlc9N4pYev5PX9gPHh7Z1vDyQnifBFH8RiuuFzfeTQS58lK9PUoo0vQZ0lt+tljyi9DCh4SbgLQfXYTfN8E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732346370; c=relaxed/simple;
	bh=a3fbuMfkN9RpXfroYvIOcuxLASF0V8LHxV4Tv1XyQq4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=OX+DMHqnpHa+xFjVOlmQs+u+v0ohN7x8JCXkphL4/DBk7U7m3kfVgnguA1vW5LTnd7sNahczm0xEYxir6LfuqJwpbR6KXImbT1vP7LD0te+QZ8H+geRY0ONqFKz3XT7DAJimT5PwCAwYcuOtY4PllM1Nnba4GCke0PTRNHOTyV8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=eckelmann.de; spf=pass smtp.mailfrom=eckelmann.de; dkim=pass (1024-bit key) header.d=eckelmann.de header.i=@eckelmann.de header.b=WFSrnsve; arc=fail smtp.client-ip=40.107.149.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=eckelmann.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=eckelmann.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=eckelmann.de header.i=@eckelmann.de header.b="WFSrnsve"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SVOQTvLUsfBd2p+GnWCnuWgOeWYwpIHP6/Ygc9RkI7Em5tlNzkdk+0QU635GL1SWzoi+qCQE7Gg61xly1nYT401jCdFTFCOUmdAUMuevUdQRAE48AnUog5uBTfRGFGlX95uwMVKZi4iuyauyzASFjjQi5yQ7SZvkR9JppsxW7keq/237GFMexaDA2noXUa3ISI8oX7VqhCoro65M/BqkwLaG0KFx9It12MrvgUslQwP9TZZRZrKyFClHBpm70JuS5fADZtm1cA9PeD748X4EyoeL9qxApHV7WEw6WfvANKUc4VTbyvY9Ye8QlQ/Hi50ZNSZFPht7VEex9ml4VUi7qQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XHzVNmnonv0L359w8pzMc2H0XR/JryMg2/952nelBuQ=;
 b=hPFqo0+p4PUnGdR/1MeM5YYF9bk9q4AU+pfFWBQ5YTJ6eWyV0fGpBmA7X6nWA52zW46CrxuBmytWf3z30h05sMfSXlaNUVinauv78SLs8CDxkX2FyRmGQN6w8ktwmgEzL5mgR5F5WT09A0mggFT9l2y1R6JYinggScGtPGh7eUyn3bT7stWG6nyZdXN+kKyb1ATn/aPXsfpiMkaOziPCgkRlxohJFBYp1w+JcAM4LxYoIFxIBgs717DVtWLrV0p/aRcrEqY29AEnnx01SN3PxXDkbDQhCuQX4DkMZ+Q1kPnbDQKo9OeRbohU/4eZDIaz0S9nRo8/skx9p4aWagtYXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=eckelmann.de; dmarc=pass action=none header.from=eckelmann.de;
 dkim=pass header.d=eckelmann.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=eckelmann.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XHzVNmnonv0L359w8pzMc2H0XR/JryMg2/952nelBuQ=;
 b=WFSrnsve98VGnHAbC1CZzQ6pWmLg59HhNrUfhPKRH2LLn22fn3VGO+m/d640XpjnNhl8u52Un+beeJ4C2T8ECiJXkiHmksv4p2n+GFAZ7GWBehag0a7MReg6hm+o5RqQzd/3aMw5OLEGZlEoTFajSJ6thrCNy8J+S4x5G0HSb7k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=eckelmann.de;
Received: from FR4P281MB3510.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:da::13)
 by BE1P281MB2115.DEUP281.PROD.OUTLOOK.COM (2603:10a6:b10:32::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.19; Sat, 23 Nov
 2024 07:19:25 +0000
Received: from FR4P281MB3510.DEUP281.PROD.OUTLOOK.COM
 ([fe80::3927:fe99:bb4:1aa7]) by FR4P281MB3510.DEUP281.PROD.OUTLOOK.COM
 ([fe80::3927:fe99:bb4:1aa7%4]) with mapi id 15.20.8182.018; Sat, 23 Nov 2024
 07:19:24 +0000
Date: Sat, 23 Nov 2024 08:19:23 +0100
From: Thorsten Scherer <T.Scherer@eckelmann.de>
To: Jonathan Corbet <corbet@lwn.net>, 
	Daniel Borkmann <daniel@iogearbox.net>
Cc: linux-doc@vger.kernel.org
Subject: Re: [PATCH] bpf, docs: Fix tcpdump option
Message-ID: <tvtpw632b3nff3rzmuxjpbul7hgwlcpznt57victwxh7fey6qw@uope577te2tw>
References: <20241119094958.50574-1-t.scherer@eckelmann.de>
 <87r0732mkh.fsf@trenco.lwn.net>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87r0732mkh.fsf@trenco.lwn.net>
X-ClientProxiedBy: FR2P281CA0096.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9b::19) To FR4P281MB3510.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:da::13)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: FR4P281MB3510:EE_|BE1P281MB2115:EE_
X-MS-Office365-Filtering-Correlation-Id: ce2176e6-78ac-4f3e-eadf-08dd0b8f28a8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?5xXNjBTVKtqIFfc38cRrmXiQZNpKjbDsXmesdXH8WWiWl60O/8GJTTNu6MPQ?=
 =?us-ascii?Q?LBMiXJci8y4qgZRmCjsLFLemKOVpKjoItmVp4MM+M/Jhm3wMkQneBwoWRxR4?=
 =?us-ascii?Q?pMutyUGxFLJh4ow2AUMqnMrVig0hDc9tLB98v/jAv6YKUm02zvOgD/ne0LV5?=
 =?us-ascii?Q?mcFueff4hH2E75YOD0CqVUoz74W7tb9UWpXtPXCqzpf9rC4YArm0MLvZiqRC?=
 =?us-ascii?Q?z7q0GGwpOgSMAiGjtGYOOSs2nxjYN4HJJW5efDs52JX40k7KaQBnsYfCHHzY?=
 =?us-ascii?Q?7mXmL7/3agK/QrfGXF0uNcobob2FKDZYyhsmdQeFIfgm2u3H2ax2CYTZM2zG?=
 =?us-ascii?Q?5VHMA51Y0iwe2j5kL/8yn6f9DdTwBe/UQZUWz6/fQE7VlnizumBcwVzhy9Z1?=
 =?us-ascii?Q?v7vIWJr0HujtRfemNCHjvedAyy/ZRp/NpVPqRdpvKvH4woRT3h5iYhjlH/og?=
 =?us-ascii?Q?XGnviDakcoPvRKFAJKF+ckjzX3sZbGBQGW9JdkaUw0UXzBUUIGMuNxh0q4rH?=
 =?us-ascii?Q?5PpXFVKEmvU90IakcoZEHH7RbVElwVigIONnH3gRJqzBLNVel8wm8ivf7Dyt?=
 =?us-ascii?Q?AN/I7NNgenE8J8LqCHM3oNv90cmRDu/WQfw4pF8MCwlXhgIXcP2IeJz6rmgl?=
 =?us-ascii?Q?W1nqoHFPSnafHlgmU3fFtvcQJQRafHXs3XpOKfMSn01VYNyHFLWyLdEyyoZu?=
 =?us-ascii?Q?tZG3rXPIgFLMudgHjEUxKgRLZS4UbN7fuaexySkruVRBvOumEK49wL6GlZOQ?=
 =?us-ascii?Q?2ohsRzxZjpppcr3asBZrgvXbwP54+qljLFbaKFt3xUHmb/A3Z6Mb3rE6uVKe?=
 =?us-ascii?Q?B1uPF1ffJNe06RZnC01xLlUCx7SaB2h12mlkE99p3+kyzF5crygFYNpSVidb?=
 =?us-ascii?Q?zMd5RHF2YQXZ127q9gZbId8sAHtCxU20U4B6c697fSA8myVXr9c3G+5wgdOQ?=
 =?us-ascii?Q?4Im7QPTh/8/E50svKrlP/zXRFymXE1s14RqE4u+ZVANY9k4DKF+NROrwgryQ?=
 =?us-ascii?Q?yPLWq84gYZf3/EU+4NZo4DrD3sjjjfhc+I/AeDuNfUhSd6gCGUgN+zgjVHAz?=
 =?us-ascii?Q?z2gloD6Ql3oOrpekdXw3jCW7sDhOGwOb/JgUf/T2niQwhK0WdFmH+ZZQiUDe?=
 =?us-ascii?Q?yBUNco6fb2r+AQ2MaIipiD+fyyRoEaakHAHkBH6f2BrQuLpLfRuGMjiu8gOS?=
 =?us-ascii?Q?1QARKWf7EcPruRLl4d8m66aSWrrCpLrPonx3qQWUZ1kX5v3sy2TDIAIE6NJQ?=
 =?us-ascii?Q?UEJX6fePxaFpZtnhyc83tdfgUynLmPRowMT/4NWfFyOotO5ABBcwY2Yq+pJ4?=
 =?us-ascii?Q?2c2RdFMYkd9nBbVUYpkWxGFBZf/DAwEL45Yk9+nf1Amweg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:FR4P281MB3510.DEUP281.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?0tdFXfa4iuMzCcJNeYesoQfYRVQ2fUtOoTiSZtVXh0F/6yl3wjLRB0nHmYVa?=
 =?us-ascii?Q?73hbazKEfAEHK9qi/Rap6cCQsiVG/qTew318QNsieAj50lJBBTCkrj9UCyVP?=
 =?us-ascii?Q?SBfCXyM7XZBBS+TQjVY6z5b2UhKuCWW3THK8LtJtUe1WVFEsXUPyL+r7TANd?=
 =?us-ascii?Q?sntJBnzls3jh4Fw5YTlFQ8giZS3QEs4X1408maC+ki2p4UUlWxbJINq3D9ba?=
 =?us-ascii?Q?dDp87MQ9LMjbGg8s2ghtXiLUn0f7HIOxc2NaHNe2UHiLJSlEwnnFTW/+YPT2?=
 =?us-ascii?Q?uH0zL+4p+uHucIUxjIJqeCrZ9VP+4Pv5c69zouI71OZ+BQFbOgj+/KF6DZNx?=
 =?us-ascii?Q?Jx4BOiFRuFNvOvSlsFU7d1tCR3pIVJ5ZqOLWKT1KZqzmg3+SQ2XEH/1PdpKC?=
 =?us-ascii?Q?2kBIgxiznGpvv3v4EtZgTcbrogp2b7NT6lvrHf40hIiWz8QWPGHIGs0P5k9D?=
 =?us-ascii?Q?SA9qcOX7r1RZ0VGKfcdmL31neBfijrlBA7BsOG3eEWEHs+UOwclqfu2AYPEl?=
 =?us-ascii?Q?fVFUMVgW7aGbU+Cxs8ZUDXFAU6XiEU2KPAPd9ajxOxZXQ8wIm7qKlXVxeS8F?=
 =?us-ascii?Q?fm7u/JUZ2ar2g1tV2bDqxfzHCqATaMI3MNZfzj/jmko8aSU9GV1AG/D1dJQh?=
 =?us-ascii?Q?Idbp06A24AdRGTRzUl3hb75nGiz6HYkocJvngSg7VYLNMrkBXMtvAe7TxWSr?=
 =?us-ascii?Q?nMd+SzTM8mD4RKRg/hciMlrWIYsdtxImQb2hJGwbglsoQ03H6rbV0CMgTRfV?=
 =?us-ascii?Q?/Jo/Bqd6WyUMg56SseX3dsniGteChoFOL3WnfZsA11DNw9Ng1zxa8o8MvzK1?=
 =?us-ascii?Q?do4xeYG5ZoHPBYPOYwPn6zdO5nttfJq5rzgzXr2lf/so8wRHPHLSC7OniTnD?=
 =?us-ascii?Q?uScAVa+xQrEHeJv3plogezruUBLKvTjCRG0jAepMzlEW9dKy912nfjllOv8Q?=
 =?us-ascii?Q?0RKxx7piNNdfDnh9CkAma1gw+Noa0JoY+my29EWIFgTnc2PuG3BA+5HEZWMQ?=
 =?us-ascii?Q?AA3uRE57phUITHKtZpRR6K7UDwnsDodbuObSZw/BmHj5h/0lLfOqQQRJkpw+?=
 =?us-ascii?Q?fW3h4+qi2U9OCQH3Hu64sx7A4DAroc3oZDEynoHLogdaTrRg0IibKb2NVb4k?=
 =?us-ascii?Q?YxfWG2BlcoKHHMdE1mdhneIsoGeeFk2Am3Rt97/vLcYwNfnWmMle2j4P3kAM?=
 =?us-ascii?Q?k4mbg3lZFgZRUk21K6m9e9K6dIwB/I9OFRFzYejEgCV+2zR19wmHotEYTE2r?=
 =?us-ascii?Q?BJfXLs3RfrI5ABpDxOnLDWKMukxEPUOFmTvjv0pcs/xOpiCdRJt7YChTrLTv?=
 =?us-ascii?Q?xdqT3zBF2clEYXwhvW0m1wTmjVoT6EjQHsR61/6ZrA12auLDkpwod4EwyXx2?=
 =?us-ascii?Q?yMgHt6xNboBvAUa6e+W+SimSBSbvaVlaCsI5H2YlJSgSRhLb93uYDPZL5/La?=
 =?us-ascii?Q?Or8RbgI2vMa9QAmrr4BJJ4aYd2p6xApV4JtDMfp0eeCBuhnEdbfbA9BzWVur?=
 =?us-ascii?Q?Jr2/BckuO7sMmd3+uatEtbn4qQLBAZCx76CgawzxB1v+0LEL/KCicCj9yVdI?=
 =?us-ascii?Q?0zUinPWfyACiqB7dJrZFxShoODXDRQpyM/evMlAK?=
X-OriginatorOrg: eckelmann.de
X-MS-Exchange-CrossTenant-Network-Message-Id: ce2176e6-78ac-4f3e-eadf-08dd0b8f28a8
X-MS-Exchange-CrossTenant-AuthSource: FR4P281MB3510.DEUP281.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2024 07:19:24.8674
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 62e24f58-823c-4d73-8ff2-db0a5f20156c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QJLp+1yEj8h9L5ZrE0UhKjDPaPLuLFPWshb3ehnVEtazRb9Uk8/hgMgtcC+wmS3iaPBPjZWAb/urNlgWrlfqmg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BE1P281MB2115

Apologies for the improper selection of recipients.  No bad intention.

Best regards
Thorsten

On Fri, Nov 22, 2024 at 10:41:18AM -0700, Jonathan Corbet wrote:
> Thorsten Scherer <t.scherer@eckelmann.de> writes:
> 
> > From tcpdump(8):
> >
> >         -dd    Dump packet-matching code as a C program fragment.
> >
> > Fixes: 7924cd5e0b3a ("filter: doc: improve BPF documentation")
> > Signed-off-by: Thorsten Scherer <t.scherer@eckelmann.de>
> > ---
> >  Documentation/networking/filter.rst | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/Documentation/networking/filter.rst b/Documentation/networking/filter.rst
> > index 8eb9a5d40f31..06e244094f49 100644
> > --- a/Documentation/networking/filter.rst
> > +++ b/Documentation/networking/filter.rst
> > @@ -49,7 +49,7 @@ assured that the filter will be kept until the socket is closed.
> >  The biggest user of this construct might be libpcap. Issuing a high-level
> >  filter command like `tcpdump -i em1 port 22` passes through the libpcap
> >  internal compiler that generates a structure that can eventually be loaded
> > -via SO_ATTACH_FILTER to the kernel. `tcpdump -i em1 port 22 -ddd`
> > +via SO_ATTACH_FILTER to the kernel. `tcpdump -i em1 port 22 -dd`
> >  displays what is being placed into this structure.
> 
> So I suspect you may be right, but both are legal options.  When you
> apply a Fixes tag to a patch, it's generally a good idea to copy the
> author of the patch you claim to be fixing.  Let's do that now and see
> what Daniel has to say...?
> 
> Thanks,
> 
> jon
