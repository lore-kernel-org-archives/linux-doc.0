Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56B89C001DF
	for <linux-doc@archiver.kernel.org>; Thu,  3 Aug 2023 03:17:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231192AbjHCDRY (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 2 Aug 2023 23:17:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230460AbjHCDRX (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 2 Aug 2023 23:17:23 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68E732119;
        Wed,  2 Aug 2023 20:17:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
        Message-ID:Sender:Reply-To:Content-ID:Content-Description;
        bh=LkzgZJFa+VuCNWkaR7uOwVJMazMn2RX+T+u9LlEuolY=; b=GfolCQZedu1qC9eDuksX8/zl/+
        jw+dkHIXLiWWTwMy8IGwKxsU20roi0bTriH9ijDTqs6X8PBZnxa6D+YzRgTD3DxsTMZvTkTzbJ1qx
        nmJ7fBi5cg0F5r2jyjulfEPiO0IIXI2CKuU7cqnVvtJs7vknbxqYCQ3uUU3DJ3XuzVSjzemRat3Hf
        mcjUXrNhVMQecgcRiUQWyHpR7joNINQWTCOYkgvvuAoL8AesbO+6GR6muFpFxONB0vyucIFw7i3xy
        uAPX4fu22kbMA31oa3XtBAkBiXuNt7LA9FIvpBOKO5EHwEMojTaTiTSlnMR/VidJYeP4mZcMcz86F
        hbzCUG2Q==;
Received: from [2601:1c2:980:9ec0::2764]
        by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
        id 1qROpz-006XDj-1H;
        Thu, 03 Aug 2023 03:17:19 +0000
Message-ID: <693bad7c-d978-6651-370a-26bc8baa0a71@infradead.org>
Date:   Wed, 2 Aug 2023 20:17:18 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH net-next v2 1/2] docs: net: page_pool: document
 PP_FLAG_DMA_SYNC_DEV parameters
Content-Language: en-US
To:     Jakub Kicinski <kuba@kernel.org>, davem@davemloft.net
Cc:     netdev@vger.kernel.org, edumazet@google.com, pabeni@redhat.com,
        aleksander.lobakin@intel.com, hawk@kernel.org,
        ilias.apalodimas@linaro.org, corbet@lwn.net,
        linux-doc@vger.kernel.org,
        Michael Chan <michael.chan@broadcom.com>,
        Lorenzo Bianconi <lorenzo@kernel.org>
References: <20230802161821.3621985-1-kuba@kernel.org>
 <20230802161821.3621985-2-kuba@kernel.org>
From:   Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20230802161821.3621985-2-kuba@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org



On 8/2/23 09:18, Jakub Kicinski wrote:
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

Reviewed-by: Randy Dunlap <rdunlap@infradead.org>

Thanks.

> ---
> v2:
>  - s/sync'/sync/ and other fixes from Randy
> v1: https://lore.kernel.org/all/20230801203124.980703-1-kuba@kernel.org/
> 
> CC: hawk@kernel.org
> CC: ilias.apalodimas@linaro.org
> CC: corbet@lwn.net
> CC: linux-doc@vger.kernel.org
> CC: Michael Chan <michael.chan@broadcom.com>
> CC: Lorenzo Bianconi <lorenzo@kernel.org>
> CC: Randy Dunlap <rdunlap@infradead.org>
> ---
>  Documentation/networking/page_pool.rst | 34 ++++++++++++++++++++++++++
>  1 file changed, 34 insertions(+)

-- 
~Randy
