Return-Path: <SRS0=AsmQ=EA=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC165C4363A
	for <linux-doc@archiver.kernel.org>; Sun, 25 Oct 2020 06:34:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 61A9521734
	for <linux-doc@archiver.kernel.org>; Sun, 25 Oct 2020 06:34:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1603607680;
	bh=DHAVWPlJGJCTJZ9CsWCzA3rvA+lIusM3kKdx+tyX6fo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=VwssvrS0MOZp286fA9BrrOqFv1Jn1cXnf2tfw4G1nzWKj6tO+2H2ubMVuRMHONgvW
	 6J5qvTYKZNM/NtOXf8ZPFRTwS9MF8qAAxqhkFpAExwu574TR9GOn2/rpYCDPt8NaOI
	 Y8A0x1BA16vQnox5K7kXYtNmUE26sTJX4efkA6AA=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1767683AbgJYGej (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 25 Oct 2020 02:34:39 -0400
Received: from mail.kernel.org ([198.145.29.99]:36392 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1767682AbgJYGej (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Sun, 25 Oct 2020 02:34:39 -0400
Received: from kernel.org (unknown [87.70.96.83])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 05242208E4;
        Sun, 25 Oct 2020 06:34:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1603607678;
        bh=DHAVWPlJGJCTJZ9CsWCzA3rvA+lIusM3kKdx+tyX6fo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=pmlbfxZ+j/q/hY5jRPyNMUzRnNLx3K5+FS4fKo03SqXlwZP2qAGonHLVfqCKDGYN+
         /z1iR03p5ZHcqBYge+UYXQvjID6/3t5D3rvEI6rvTAoViG+16CK5/jmGpE0R73XoRY
         1zPQraL3j4U9GZeQX8B/w8dx9JaYQcaLEUOQa7ck=
Date:   Sun, 25 Oct 2020 08:34:31 +0200
From:   Mike Rapoport <rppt@kernel.org>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org
Subject: Re: [PATCH v3 47/56] memblock: fix kernel-doc markups
Message-ID: <20201025063431.GD392079@kernel.org>
References: <cover.1603469755.git.mchehab+huawei@kernel.org>
 <90f921afef8f60498a997a4a243bcf839b9142ca.1603469755.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <90f921afef8f60498a997a4a243bcf839b9142ca.1603469755.git.mchehab+huawei@kernel.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Oct 23, 2020 at 06:33:34PM +0200, Mauro Carvalho Chehab wrote:
> Some identifiers have different names between their prototypes
> and the kernel-doc markup.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Acked-by: Mike Rapoport <rppt@linux.ibm.com>

> ---
>  include/linux/memblock.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/include/linux/memblock.h b/include/linux/memblock.h
> index ef131255cedc..95fe3cb71c54 100644
> --- a/include/linux/memblock.h
> +++ b/include/linux/memblock.h
> @@ -272,7 +272,7 @@ void __next_mem_pfn_range_in_zone(u64 *idx, struct zone *zone,
>  				  unsigned long *out_spfn,
>  				  unsigned long *out_epfn);
>  /**
> - * for_each_free_mem_range_in_zone - iterate through zone specific free
> + * for_each_free_mem_pfn_range_in_zone - iterate through zone specific free
>   * memblock areas
>   * @i: u64 used as loop variable
>   * @zone: zone in which all of the memory blocks reside
> @@ -292,7 +292,7 @@ void __next_mem_pfn_range_in_zone(u64 *idx, struct zone *zone,
>  	     __next_mem_pfn_range_in_zone(&i, zone, p_start, p_end))
>  
>  /**
> - * for_each_free_mem_range_in_zone_from - iterate through zone specific
> + * for_each_free_mem_pfn_range_in_zone_from - iterate through zone specific
>   * free memblock areas from a given point
>   * @i: u64 used as loop variable
>   * @zone: zone in which all of the memory blocks reside
> -- 
> 2.26.2
> 

-- 
Sincerely yours,
Mike.
