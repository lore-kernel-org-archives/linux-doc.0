Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI
	autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 54D627D089
	for <lwn-linux-doc@archive.lwn.net>; Mon,  5 Nov 2018 21:00:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729559AbeKFGVh (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 6 Nov 2018 01:21:37 -0500
Received: from merlin.infradead.org ([205.233.59.134]:44830 "EHLO
        merlin.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727592AbeKFGVh (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 6 Nov 2018 01:21:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
        :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=ZXHRIvfpbMHmviYoB3hQk+w/al17V5PrSvRPefQufKw=; b=ONXHcFhBW/g3qIY/wUPtcNlEUO
        XlN2Hb+PhrGoJ8yQ0grElpC//ZWKskzL1gcidkyGeOqQySu6KCgMaNCEHdhzSjQYHij/cQc0ts5sn
        qm0LJMmaNuMCFpfVtr8SU4NlY6tA9ghXvFxLpWap2GK+z6g+0eC4hUVUwWHEVzLiVPa/LDeP606nW
        ri/rU6tm9Lu+BqBWFLa18icWHP8i8cWNyv5a50aSBT4vBMnKRdMNq8iS2EJdPXA13sK6tFpe6RM0k
        w6B4qRWlrj58pmNhfxmEqpoMezB2FCZ7fVI5Mvo4W7O/2Ld8Rn1RJXlzB30BLtG7NWiqmnEv1Ul6F
        YNaHyszg==;
Received: from static-50-53-52-16.bvtn.or.frontiernet.net ([50.53.52.16] helo=midway.dunlab)
        by merlin.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
        id 1gJlyc-0000ua-33; Mon, 05 Nov 2018 21:00:02 +0000
Subject: Re: [PATCH] docs/admin-guide/mm/concepts.rst: grammar fixups
To:     Mike Rapoport <rppt@linux.ibm.com>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     linux-doc@vger.kernel.org, Mike Rapoport <rppt@linux.vnet.ibm.com>
References: <1541447895-14996-1-git-send-email-rppt@linux.ibm.com>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <d537e1e0-6e21-abbd-cd1e-28768a63266a@infradead.org>
Date:   Mon, 5 Nov 2018 13:00:00 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <1541447895-14996-1-git-send-email-rppt@linux.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 11/5/18 11:58 AM, Mike Rapoport wrote:
> From: Mike Rapoport <rppt@linux.vnet.ibm.com>
> 
> Signed-off-by: Mike Rapoport <rppt@linux.vnet.ibm.com>
> Cc: Randy Dunlap <rdunlap@infradead.org>
> ---
> 
> There was a couple of grammar fixes Randy suggested a while ago, but it
> seems I've never sent them out. 
> 
>  Documentation/admin-guide/mm/concepts.rst | 39 ++++++++++++++++---------------
>  1 file changed, 20 insertions(+), 19 deletions(-)

Hi Mike,

one nit:

> @@ -121,8 +122,8 @@ Nodes
>  Many multi-processor machines are NUMA - Non-Uniform Memory Access -
>  systems. In such systems the memory is arranged into banks that have
>  different access latency depending on the "distance" from the
> -processor. Each bank is referred as `node` and for each node Linux
> -constructs an independent memory management subsystem. A node has it's
> +processor. Each bank is referred as a `node` and for each node Linux

                        is referred to as a

> +constructs an independent memory management subsystem. A node has its
>  own set of zones, lists of free and used pages and various statistics
>  counters. You can find more details about NUMA in
>  :ref:`Documentation/vm/numa.rst <numa>` and in

Reviewed-by: Randy Dunlap <rdunlap@infradead.org>

thanks.
-- 
~Randy
