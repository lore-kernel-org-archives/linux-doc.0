Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 50D8F7D08A
	for <lwn-linux-doc@archive.lwn.net>; Sat, 27 Apr 2019 18:38:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726213AbfD0Sid (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Sat, 27 Apr 2019 14:38:33 -0400
Received: from casper.infradead.org ([85.118.1.10]:52472 "EHLO
        casper.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725942AbfD0Sid (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 27 Apr 2019 14:38:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
        MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender
        :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=wGGsFwCfxghqTxTgIRTTPFtGln097ZZmzGWQ62iT3SM=; b=h+u4UtTAVSBkcFW9VEqz8Eu5Bs
        PYYNFv48nj++A04IN5yhbdVXV2MPFKKasPEs+iNHo+sh/Uk+UTwgfjoc1/uM8WGTufoqKsu7M+rxA
        ZuoEhNHy8X6Bk0xSpQ3gqcqkzJE08QejJn8v2RyC5di5ZNF9lEuc9St4wPFxK3QsHwnntZGFJaSMe
        TxE0y9IpU1deu9rj0EDNL2n0ftVOul4l7FOQHTnvSgDLpAwbuFo+CIM1wPzd+5bh/eFpvJ8o4W+vk
        OVCQKjSoLEZuFokMm4Ayf5/QDUjjSpSBYZ5B2Ygixlq8Q2Mc/tLpE4Rggv+NJYPFdu/qX90x4P7zV
        W4sZAYsw==;
Received: from 177.17.250.151.dynamic.adsl.gvt.net.br ([177.17.250.151] helo=coco.lan)
        by casper.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
        id 1hKSDT-0005FK-Om; Sat, 27 Apr 2019 18:38:28 +0000
Date:   Sat, 27 Apr 2019 15:38:22 -0300
From:   Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To:     Changbin Du <changbin.du@gmail.com>
Cc:     Jonathan Corbet <corbet@lwn.net>, tglx@linutronix.de,
        mingo@redhat.com, bp@alien8.de, x86@kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 25/27] Documentation: x86: convert
 x86_64/fake-numa-for-cpusets to reST
Message-ID: <20190427153822.30c82f0c@coco.lan>
In-Reply-To: <20190426153150.21228-26-changbin.du@gmail.com>
References: <20190426153150.21228-1-changbin.du@gmail.com>
        <20190426153150.21228-26-changbin.du@gmail.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Em Fri, 26 Apr 2019 23:31:48 +0800
Changbin Du <changbin.du@gmail.com> escreveu:

> This converts the plain text documentation to reStructuredText format and
> add it to Sphinx TOC tree. No essential content change.
> 
> Signed-off-by: Changbin Du <changbin.du@gmail.com>

Reviewed-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>

> ---
>  ...-for-cpusets => fake-numa-for-cpusets.rst} | 25 +++++++++++++------
>  Documentation/x86/x86_64/index.rst            |  1 +
>  2 files changed, 19 insertions(+), 7 deletions(-)
>  rename Documentation/x86/x86_64/{fake-numa-for-cpusets => fake-numa-for-cpusets.rst} (85%)
> 
> diff --git a/Documentation/x86/x86_64/fake-numa-for-cpusets b/Documentation/x86/x86_64/fake-numa-for-cpusets.rst
> similarity index 85%
> rename from Documentation/x86/x86_64/fake-numa-for-cpusets
> rename to Documentation/x86/x86_64/fake-numa-for-cpusets.rst
> index 4b09f18831f8..74fbb78b3c67 100644
> --- a/Documentation/x86/x86_64/fake-numa-for-cpusets
> +++ b/Documentation/x86/x86_64/fake-numa-for-cpusets.rst
> @@ -1,5 +1,12 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +=====================
> +Fake NUMA For CPUSets
> +=====================
> +
> +:Author: David Rientjes <rientjes@cs.washington.edu>
> +
>  Using numa=fake and CPUSets for Resource Management
> -Written by David Rientjes <rientjes@cs.washington.edu>
>  
>  This document describes how the numa=fake x86_64 command-line option can be used
>  in conjunction with cpusets for coarse memory management.  Using this feature,
> @@ -20,7 +27,7 @@ you become more familiar with using this combination for resource control,
>  you'll determine a better setup to minimize the number of nodes you have to deal
>  with.
>  
> -A machine may be split as follows with "numa=fake=4*512," as reported by dmesg:
> +A machine may be split as follows with "numa=fake=4*512," as reported by dmesg::
>  
>  	Faking node 0 at 0000000000000000-0000000020000000 (512MB)
>  	Faking node 1 at 0000000020000000-0000000040000000 (512MB)
> @@ -34,7 +41,7 @@ A machine may be split as follows with "numa=fake=4*512," as reported by dmesg:
>  
>  Now following the instructions for mounting the cpusets filesystem from
>  Documentation/cgroup-v1/cpusets.txt, you can assign fake nodes (i.e. contiguous memory
> -address spaces) to individual cpusets:
> +address spaces) to individual cpusets::
>  
>  	[root@xroads /]# mkdir exampleset
>  	[root@xroads /]# mount -t cpuset none exampleset
> @@ -47,7 +54,7 @@ Now this cpuset, 'ddset', will only allowed access to fake nodes 0 and 1 for
>  memory allocations (1G).
>  
>  You can now assign tasks to these cpusets to limit the memory resources
> -available to them according to the fake nodes assigned as mems:
> +available to them according to the fake nodes assigned as mems::
>  
>  	[root@xroads /exampleset/ddset]# echo $$ > tasks
>  	[root@xroads /exampleset/ddset]# dd if=/dev/zero of=tmp bs=1024 count=1G
> @@ -57,9 +64,13 @@ Notice the difference between the system memory usage as reported by
>  /proc/meminfo between the restricted cpuset case above and the unrestricted
>  case (i.e. running the same 'dd' command without assigning it to a fake NUMA
>  cpuset):
> -				Unrestricted	Restricted
> -	MemTotal:		3091900 kB	3091900 kB
> -	MemFree:		  42113 kB	1513236 kB
> +
> +	========	============	==========
> +	Name		Unrestricted	Restricted
> +	========	============	==========
> +	MemTotal	3091900 kB	3091900 kB
> +	MemFree		42113 kB	1513236 kB
> +	========	============	==========
>  
>  This allows for coarse memory management for the tasks you assign to particular
>  cpusets.  Since cpusets can form a hierarchy, you can create some pretty
> diff --git a/Documentation/x86/x86_64/index.rst b/Documentation/x86/x86_64/index.rst
> index 7b8c82151358..e2a324cde671 100644
> --- a/Documentation/x86/x86_64/index.rst
> +++ b/Documentation/x86/x86_64/index.rst
> @@ -11,3 +11,4 @@ x86_64 Support
>     uefi
>     mm
>     5level-paging
> +   fake-numa-for-cpusets



Thanks,
Mauro
