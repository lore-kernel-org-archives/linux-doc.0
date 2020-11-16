Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F09D8C2D0A3
	for <linux-doc@archiver.kernel.org>; Mon, 16 Nov 2020 19:57:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9D92E208C7
	for <linux-doc@archiver.kernel.org>; Mon, 16 Nov 2020 19:57:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="LaAqytwN"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731228AbgKPT5Z (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 16 Nov 2020 14:57:25 -0500
Received: from mail.kernel.org ([198.145.29.99]:47114 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727393AbgKPT5Y (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 16 Nov 2020 14:57:24 -0500
Received: from paulmck-ThinkPad-P72.home (50-39-104-11.bvtn.or.frontiernet.net [50.39.104.11])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 80DF2208C7;
        Mon, 16 Nov 2020 19:57:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1605556644;
        bh=Tfs6cbZVnkYc+nBVCxrS5FBsltXfH/+8hehmPguH45o=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=LaAqytwN1/S3waX+8aY9h5yrPtd9FQYU9TiKKmlaFGglqpqPuYB2CKjHvxlN+KiFN
         UAj0ko1VBahZiVZA5FVxvs64gRDUJ6fQwgrQIRK+JgqqSAqd0lKJlI0ARCUmaBi88U
         CwbkgHZQmBhAZtyKAZGcdetDOVpPNAsu0Yb34LS8=
Received: by paulmck-ThinkPad-P72.home (Postfix, from userid 1000)
        id 445B73522684; Mon, 16 Nov 2020 11:57:24 -0800 (PST)
Date:   Mon, 16 Nov 2020 11:57:24 -0800
From:   "Paul E. McKenney" <paulmck@kernel.org>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Andrew Morton <akpm@linux-foundation.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Asif Rasheed <b00073877@aus.edu>,
        Eric Dumazet <edumazet@google.com>,
        Pavel Begunkov <asml.silence@gmail.com>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 20/27] list: fix a typo at the kernel-doc markup
Message-ID: <20201116195724.GC1437@paulmck-ThinkPad-P72>
Reply-To: paulmck@kernel.org
References: <cover.1605521731.git.mchehab+huawei@kernel.org>
 <d0ef485aaaa648bf6ebbc26a4082ccb2ff6a8e5b.1605521731.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d0ef485aaaa648bf6ebbc26a4082ccb2ff6a8e5b.1605521731.git.mchehab+huawei@kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Nov 16, 2020 at 11:18:16AM +0100, Mauro Carvalho Chehab wrote:
> hlist_add_behing -> hlist_add_behind
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Queued, thank you!

Or if you would prefer pushing it yourself:

Reviewed-by: Paul E. McKenney <paulmck@kernel.org>

Either way, please let me know.

							Thanx, Paul

> ---
>  include/linux/list.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/linux/list.h b/include/linux/list.h
> index 89bdc92e75c3..f2af4b4aa4e9 100644
> --- a/include/linux/list.h
> +++ b/include/linux/list.h
> @@ -884,41 +884,41 @@ static inline void hlist_add_head(struct hlist_node *n, struct hlist_head *h)
>  		WRITE_ONCE(first->pprev, &n->next);
>  	WRITE_ONCE(h->first, n);
>  	WRITE_ONCE(n->pprev, &h->first);
>  }
>  
>  /**
>   * hlist_add_before - add a new entry before the one specified
>   * @n: new entry to be added
>   * @next: hlist node to add it before, which must be non-NULL
>   */
>  static inline void hlist_add_before(struct hlist_node *n,
>  				    struct hlist_node *next)
>  {
>  	WRITE_ONCE(n->pprev, next->pprev);
>  	WRITE_ONCE(n->next, next);
>  	WRITE_ONCE(next->pprev, &n->next);
>  	WRITE_ONCE(*(n->pprev), n);
>  }
>  
>  /**
> - * hlist_add_behing - add a new entry after the one specified
> + * hlist_add_behind - add a new entry after the one specified
>   * @n: new entry to be added
>   * @prev: hlist node to add it after, which must be non-NULL
>   */
>  static inline void hlist_add_behind(struct hlist_node *n,
>  				    struct hlist_node *prev)
>  {
>  	WRITE_ONCE(n->next, prev->next);
>  	WRITE_ONCE(prev->next, n);
>  	WRITE_ONCE(n->pprev, &prev->next);
>  
>  	if (n->next)
>  		WRITE_ONCE(n->next->pprev, &n->next);
>  }
>  
>  /**
>   * hlist_add_fake - create a fake hlist consisting of a single headless node
>   * @n: Node to make a fake list out of
>   *
>   * This makes @n appear to be its own predecessor on a headless hlist.
>   * The point of this is to allow things like hlist_del() to work correctly
> -- 
> 2.28.0
> 
