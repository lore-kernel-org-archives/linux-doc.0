Return-Path: <SRS0=i7Ry=4J=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67456C3566F
	for <linux-doc@archiver.kernel.org>; Fri, 21 Feb 2020 22:35:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3DD2B206EF
	for <linux-doc@archiver.kernel.org>; Fri, 21 Feb 2020 22:35:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com header.b="ofwR7pM3"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728914AbgBUWfy (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 21 Feb 2020 17:35:54 -0500
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:14279 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729292AbgBUWfy (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 21 Feb 2020 17:35:54 -0500
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5e505b270000>; Fri, 21 Feb 2020 14:35:19 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Fri, 21 Feb 2020 14:35:52 -0800
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Fri, 21 Feb 2020 14:35:52 -0800
Received: from [10.110.48.28] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 21 Feb
 2020 22:35:52 +0000
Subject: Re: [PATCH] mm: Add pagemap.h to the fine documentation
To:     Matthew Wilcox <willy@infradead.org>, <linux-doc@vger.kernel.org>,
        <linux-mm@kvack.org>
References: <20200221220045.24989-1-willy@infradead.org>
From:   John Hubbard <jhubbard@nvidia.com>
X-Nvconfidentiality: public
Message-ID: <dca6710c-fecc-9d5d-4ada-6a437811bacc@nvidia.com>
Date:   Fri, 21 Feb 2020 14:35:52 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200221220045.24989-1-willy@infradead.org>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1582324519; bh=hxZQZBMx95ZMyImZVrhvVrTo4+W/JP/LsBSUf7TxITA=;
        h=X-PGP-Universal:Subject:To:References:From:X-Nvconfidentiality:
         Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
         X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=ofwR7pM3CEluo6aTjmuddI6vJvWfIOq9hr66WH3+8DTaGRaIvOUaqU+UZh9bKJS/E
         WB6EC/eDZ9isx5YiUpjtpx4JoAzYbdu/sDgZHcNqc1tFF5bfV7vuK84HUptzOcqgBY
         CqJDragLQKo249h3N/NimKn8TLCpG0hB6MgeK3wWo4dC3Mq4eN84Ntwe0uJuiFtjY7
         weq4UiFI1KY+VTVNnz6aAXvCafxvv3CgJBhopsDgn4pOwr/Yd75a7oXPq6t1C7+xSO
         kMf/AhNhXVi0S7dHVH3+OFzb3GVrDhgybm1oybLMHQhASXS9O7j5CsJcNcilIjwj1l
         iQGJQyRMCKR3Q==
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 2/21/20 2:00 PM, Matthew Wilcox wrote:
> From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
> 
> The documentation currently does not include the deathless prose

Yea, documentation!

> written to describe functions in pagemap.h because it's not included
> in any rst file.  Fix up the mismatches between parameter names and the


Maybe "Fix up some of the mismatches"? ...below:


> documentation and add the file to mm-api.
> 
> Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
> ---
>  Documentation/core-api/mm-api.rst | 3 +++
>  include/linux/pagemap.h           | 8 ++++----
>  2 files changed, 7 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/core-api/mm-api.rst b/Documentation/core-api/mm-api.rst
> index be726986ff75..2adffb3f7914 100644
> --- a/Documentation/core-api/mm-api.rst
> +++ b/Documentation/core-api/mm-api.rst
> @@ -73,6 +73,9 @@ File Mapping and Page Cache
>  .. kernel-doc:: mm/truncate.c
>     :export:
>  
> +.. kernel-doc:: include/linux/pagemap.h
> +   :internal:
> +
>  Memory pools
>  ============
>  
> diff --git a/include/linux/pagemap.h b/include/linux/pagemap.h
> index ccb14b6a16b5..6462df717cff 100644
> --- a/include/linux/pagemap.h
> +++ b/include/linux/pagemap.h
> @@ -33,8 +33,8 @@ enum mapping_flags {
>  
>  /**
>   * mapping_set_error - record a writeback error in the address_space
> - * @mapping - the mapping in which an error should be set
> - * @error - the error to set in the mapping
> + * @mapping: the mapping in which an error should be set
> + * @error: the error to set in the mapping
>   *
>   * When writeback fails in some way, we must record that error so that
>   * userspace can be informed when fsync and the like are called.  We endeavor
> @@ -305,9 +305,9 @@ static inline struct page *find_lock_page(struct address_space *mapping,
>   * atomic allocation!
>   */
>  static inline struct page *find_or_create_page(struct address_space *mapping,
> -					pgoff_t offset, gfp_t gfp_mask)
> +					pgoff_t index, gfp_t gfp_mask)
>  {
> -	return pagecache_get_page(mapping, offset,
> +	return pagecache_get_page(mapping, index,
>  					FGP_LOCK|FGP_ACCESSED|FGP_CREAT,
>  					gfp_mask);


...for example, the called function itself, pagecache_get_page(), declares
its second arg with a name of "offset". 

Not that it needs to affect this patch, but just to note that I think we might
be at this for a while. :)

Anyway, I also ran 'make htmldocs' on this and poked around, and everything looks
like it should, so:

    Reviewed-by: John Hubbard <jhubbard@nvidia.com>


thanks,
-- 
John Hubbard
NVIDIA

>  }
> 



