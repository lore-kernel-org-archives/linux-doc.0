Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AD8BC0015E
	for <linux-doc@archiver.kernel.org>; Tue,  1 Aug 2023 21:58:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229708AbjHAV6z (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 1 Aug 2023 17:58:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229660AbjHAV6y (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 1 Aug 2023 17:58:54 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4C76103;
        Tue,  1 Aug 2023 14:58:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
        Message-ID:Sender:Reply-To:Content-ID:Content-Description;
        bh=JvP/YgtZBXA3QAUHcrIK8esk0gDniwfOgKG0XRTY8ak=; b=fUGa+EUrY9P+pED7mKkrnMo2cm
        aY3FHjCphTaaMqDUP2LIYWD/C8clLySmBswLKgAUdldlQ/NfxOWZ4C5fuy2UFVJYFkvBLhCA4ayZw
        f0nBEEwaz9W7u6rZfQMJSWzPEwPq+oLiwoBT9kQMD4nbfi7h5lqpWW+59WaDP72qJuwi2l9TbbwiB
        n/5dri9mqaYKYtg9OrIJxfNhHxf3oFcfSiZRg36yNAsMS0mLBvp+UZA0fGmd84XnEIpOm5EA9vWzq
        rjykhjBzn23qJVl8Kmy/XObxDt/xd4O/gE76zTZxIRzBUlmV7Xol8mGgvN9rqQMCm6jP4UDiH1M3A
        LwGZHTZA==;
Received: from [2601:1c2:980:9ec0::2764]
        by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
        id 1qQxOD-003OIk-1n;
        Tue, 01 Aug 2023 21:58:49 +0000
Message-ID: <23be0fd9-9177-a8bd-e436-07f52e40e79b@infradead.org>
Date:   Tue, 1 Aug 2023 14:58:48 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH net] docs: net: page_pool: document PP_FLAG_DMA_SYNC_DEV
 parameters
Content-Language: en-US
To:     Jakub Kicinski <kuba@kernel.org>, davem@davemloft.net
Cc:     netdev@vger.kernel.org, edumazet@google.com, pabeni@redhat.com,
        hawk@kernel.org, ilias.apalodimas@linaro.org, corbet@lwn.net,
        linux-doc@vger.kernel.org,
        Michael Chan <michael.chan@broadcom.com>,
        Lorenzo Bianconi <lorenzo@kernel.org>
References: <20230801203124.980703-1-kuba@kernel.org>
From:   Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20230801203124.980703-1-kuba@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

A few nits:

On 8/1/23 13:31, Jakub Kicinski wrote:
> Using PP_FLAG_DMA_SYNC_DEV is a bit confusing. It was perhaps
> more obvious when it was introduced but the page pool use
> has grown beyond XDP and beyond packet-per-page so now
> making the heads and tails out of this feature is not
> trivial.
> 
> Obviously making the API more user friendly would be
> a better fix, but until someone steps up to do that
> let's at least document what the parameters are.
> 
> Relevant discussion in the first Link.
> 
> Link: https://lore.kernel.org/all/20230731114427.0da1f73b@kernel.org/
> Signed-off-by: Jakub Kicinski <kuba@kernel.org>
> ---
> CC: hawk@kernel.org
> CC: ilias.apalodimas@linaro.org
> CC: corbet@lwn.net
> CC: linux-doc@vger.kernel.org
> CC: Michael Chan <michael.chan@broadcom.com>
> CC: Lorenzo Bianconi <lorenzo@kernel.org>
> ---
>  Documentation/networking/page_pool.rst | 34 ++++++++++++++++++++++++++
>  1 file changed, 34 insertions(+)
> 
> diff --git a/Documentation/networking/page_pool.rst b/Documentation/networking/page_pool.rst
> index 0aa850cf4447..7064813b3b58 100644
> --- a/Documentation/networking/page_pool.rst
> +++ b/Documentation/networking/page_pool.rst
> @@ -109,6 +109,40 @@ a page will cause no race conditions is enough.
>    caller can then report those stats to the user (perhaps via ethtool,
>    debugfs, etc.). See below for an example usage of this API.
>  
> +DMA sync
> +--------
> +Driver is always responsible for sync'ing the pages for the CPU.

                                    syncing [as on the next line]

> +Drivers may choose to take care of syncing for the device as well

  or                                  sync'ing
since you use "sync'ed" 2 lines below.

> +or set the ``PP_FLAG_DMA_SYNC_DEV`` flag to request that pages
> +allocated from the page pool are already sync'ed for the device.
> +
> +If ``PP_FLAG_DMA_SYNC_DEV`` is set, the driver must inform the core what portion
> +of the buffer has to be synced. This allows the core to avoid syncing the entire

  or                       sync'ed.
Just be consistent.

> +page when the drivers knows that the device only accessed a portion of the page.
> +
> +Most drivers will reserve a headroom in front of the frame,

                     reserve headroom in front of the frame.
or                   reserve some headroom in front of the frame.

> +this part of the buffer is not touched by the device, so to avoid syncing

   This                                                              ^^^ [be consistent]

> +it drivers can set the ``offset`` field in struct page_pool_params
> +appropriately.
> +
> +For pages recycled on the XDP xmit and skb paths the page pool will
> +use the ``max_len`` member of struct page_pool_params to decide how
> +much of the page needs to be synced (starting at ``offset``).
                                ^^^^^^

> +When directly freeing pages in the driver (page_pool_put_page())
> +the ``dma_sync_size`` argument specifies how much of the buffer needs
> +to be synced.
         ^^^^^^

> +
> +If in doubt set ``offset`` to 0, ``max_len`` to ``PAGE_SIZE`` and
> +pass -1 as ``dma_sync_size``. That combination of arguments is always
> +correct.

   at the expense of more overhead?

> +
> +Note that the sync'ing parameters are for the entire page.
> +This is important to remember when using fragments (``PP_FLAG_PAGE_FRAG``),
> +where allocated buffers may be smaller than a full page.
> +Unless the driver author really understands page pool internals
> +it's recommended to always use ``offset = 0``, ``max_len = PAGE_SIZE``
> +with fragmented page pools.
> +
>  Stats API and structures
>  ------------------------
>  If the kernel is configured with ``CONFIG_PAGE_POOL_STATS=y``, the API

-- 
~Randy
