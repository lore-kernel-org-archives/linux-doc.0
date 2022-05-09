Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1489EC433F5
	for <linux-doc@archiver.kernel.org>; Mon,  9 May 2022 12:25:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234386AbiEIM3P (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 9 May 2022 08:29:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234314AbiEIM3N (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 9 May 2022 08:29:13 -0400
Received: from vps0.lunn.ch (vps0.lunn.ch [185.16.172.187])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E767267C0C;
        Mon,  9 May 2022 05:25:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
        s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
        Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
        Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
        bh=yNVt9Xkogy2Y6RfStWm3MnOZ08b3XpDdi9+k9hGnieE=; b=5cWJGl4i7eE50jQ1I1NfA5x3++
        vLiqVc54gjitP+oCDHaxOZtMK9i4aO9YiOd2nQVW7lWy/h8NinNRm5odlJgMIvIsMW9d2+H/p+BLy
        TrezhO2zcsdNu8PYM8gVIQjKvHBzLnJ5nHIyzeRVFUNlIzHQVGHGTEavFVo+qB0aVKYk=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
        (envelope-from <andrew@lunn.ch>)
        id 1no2Rq-001wMB-BQ; Mon, 09 May 2022 14:25:10 +0200
Date:   Mon, 9 May 2022 14:25:10 +0200
From:   Andrew Lunn <andrew@lunn.ch>
To:     Lorenzo Bianconi <lorenzo@kernel.org>
Cc:     netdev@vger.kernel.org, ilias.apalodimas@linaro.org,
        hawk@kernel.org, davem@davemloft.net, edumazet@google.com,
        kuba@kernel.org, pabeni@redhat.com, corbet@lwn.net,
        linux-doc@vger.kernel.org, jbrouer@redhat.com,
        lorenzo.bianconi@redhat.com
Subject: Re: [PATCH net-next] Documentation: update networking/page_pool.rst
 with ethtool APIs
Message-ID: <YnkIJn2BhSzyfQjh@lunn.ch>
References: <2b0f8921096d45e1f279d1b7b99fe467f6f3dc6d.1652090091.git.lorenzo@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2b0f8921096d45e1f279d1b7b99fe467f6f3dc6d.1652090091.git.lorenzo@kernel.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, May 09, 2022 at 12:00:01PM +0200, Lorenzo Bianconi wrote:
> Update page_pool documentation with page_pool ethtool stats APIs.
> 
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> ---
>  Documentation/networking/page_pool.rst | 23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
> 
> diff --git a/Documentation/networking/page_pool.rst b/Documentation/networking/page_pool.rst
> index 5db8c263b0c6..ef5e18cf7cdf 100644
> --- a/Documentation/networking/page_pool.rst
> +++ b/Documentation/networking/page_pool.rst
> @@ -146,6 +146,29 @@ The ``struct page_pool_recycle_stats`` has the following fields:
>    * ``ring_full``: page released from page pool because the ptr ring was full
>    * ``released_refcnt``: page released (and not recycled) because refcnt > 1
>  
> +The following APIs can be used to report page_pool stats through ethtool and
> +avoid code duplication in each driver:
> +
> +* page_pool_ethtool_stats_get_strings(): reports page_pool ethtool stats
> +  strings according to the ``struct page_pool_stats``
> +     * ``rx_pp_alloc_fast``
> +     * ``rx_pp_alloc_slow``
> +     * ``rx_pp_alloc_slow_ho``
> +     * ``rx_pp_alloc_empty``
> +     * ``rx_pp_alloc_refill``
> +     * ``rx_pp_alloc_waive``
> +     * ``rx_pp_recycle_cached``
> +     * ``rx_pp_recycle_cache_full``
> +     * ``rx_pp_recycle_ring``
> +     * ``rx_pp_recycle_ring_full``
> +     * ``rx_pp_recycle_released_ref``

My knowledge of Sphinx is pretty poor. Is it possible to put this list
next to the actual definition and cross reference it? When new
counters are added, they are more likely to be added to the list, if
the list is nearby.

    Andrew
