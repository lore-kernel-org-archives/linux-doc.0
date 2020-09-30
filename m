Return-Path: <SRS0=Pt5A=DH=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8923AC4727E
	for <linux-doc@archiver.kernel.org>; Wed, 30 Sep 2020 14:23:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4335D20789
	for <linux-doc@archiver.kernel.org>; Wed, 30 Sep 2020 14:23:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1601475812;
	bh=pINutTAllKNrOxvh9eBLUiQGJF57WCSpPIcKD+TgvwE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=ae0EpsZ0aPH6hoIHz5ycJ3WXqf2jg068Y6fpH0jSCNtHfXt34beF5QvhP1JpHxkW6
	 oa4xzgJhuWBVZB2suRXX0kuxxIbI+gZei8Nd+8mHNy8UIpUDx9fKWDYaiTsgE7BKry
	 147XwBSIVxcUIbMaG+Wh3bgCPZ3hlse7fYjasUnI=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729903AbgI3OXb (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 30 Sep 2020 10:23:31 -0400
Received: from mail.kernel.org ([198.145.29.99]:38400 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726680AbgI3OXb (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 30 Sep 2020 10:23:31 -0400
Received: from kernel.org (unknown [87.71.73.56])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id BACBF20709;
        Wed, 30 Sep 2020 14:23:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1601475811;
        bh=pINutTAllKNrOxvh9eBLUiQGJF57WCSpPIcKD+TgvwE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=wOm9XY7G3LjDR5NbyAZSpMyQTH90xpvpkBDGnvJwQnf/RxvZYo0bMTUf/nW4Vwm27
         LxBapNA1DwycI7LbvZq7qob63IVAXsD9KgiH1ypaCP06FGYlrhmAj4YRuEarwZ20PU
         /8RNSeDgkcebLR1ofrZf4ACH3DVpPZ/Nd+lbPD1M=
Date:   Wed, 30 Sep 2020 17:23:23 +0300
From:   Mike Rapoport <rppt@kernel.org>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Andrew Morton <akpm@linux-foundation.org>,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH v4 19/52] memblock: get rid of a :c:type leftover
Message-ID: <20200930142323.GL2142832@kernel.org>
References: <cover.1601467849.git.mchehab+huawei@kernel.org>
 <0aab04f62bc3dfa82394e20d61c05c6efbfb4859.1601467849.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0aab04f62bc3dfa82394e20d61c05c6efbfb4859.1601467849.git.mchehab+huawei@kernel.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hello Mauro,

On Wed, Sep 30, 2020 at 03:24:42PM +0200, Mauro Carvalho Chehab wrote:
> chanseset b3a7bb1851c8 ("docs: get rid of :c:type explicit declarations for structs")
> removed several :c:type: markups, except by one.
> 
> Now, Sphinx 3.x complains about it:
> 
> 	.../Documentation/core-api/boot-time-mm:26: ../mm/memblock.c:51: WARNING: Unparseable C cross-reference: 'struct\nmemblock_type'
> 	Invalid C declaration: Expected identifier in nested name, got keyword: struct [error at 6]
> 	  struct
> 	memblock_type
> 	  ------^

Maybe this warning is caused by '\n' between struct and memblock_type?
There are two more occurences of :c:type: around and they do not seem to
cause warnings.

> As, on Sphinx 3.x, the right markup is c:struct:`foo`.
> 
> So, let's remove it, relying on automarkup.py to convert it.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---
>  mm/memblock.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/mm/memblock.c b/mm/memblock.c
> index 165f40a8a254..326c6b3fec1d 100644
> --- a/mm/memblock.c
> +++ b/mm/memblock.c
> @@ -50,8 +50,8 @@
>   *
>   * Each region is represented by :c:type:`struct memblock_region` that

Can you please also convert this one?

>   * defines the region extents, its attributes and NUMA node id on NUMA
> - * systems. Every memory type is described by the :c:type:`struct
> - * memblock_type` which contains an array of memory regions along with
> + * systems. Every memory type is described by the struct memblock_type
> + * which contains an array of memory regions along with
>   * the allocator metadata. The "memory" and "reserved" types are nicely
>   * wrapped with :c:type:`struct memblock`. This structure is statically

And this?

>   * initialized at build time. The region arrays are initially sized to
> -- 
> 2.26.2
> 

-- 
Sincerely yours,
Mike.
