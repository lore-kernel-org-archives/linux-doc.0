Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8E0CC001DF
	for <linux-doc@archiver.kernel.org>; Thu,  3 Aug 2023 03:17:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232545AbjHCDR2 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 2 Aug 2023 23:17:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230460AbjHCDR1 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 2 Aug 2023 23:17:27 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A10F2119;
        Wed,  2 Aug 2023 20:17:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
        Message-ID:Sender:Reply-To:Content-ID:Content-Description;
        bh=G/icn/UEr7mTwEtFSWbDRmT4eriYxtTJ9pPcu1g0aAg=; b=jv1mBXan50vglcJQVDNp1B4Frm
        rDdsxKrLf1T5zncMwh9/BZ8oVDu+UmJsPAb4w50bmS5WUApKJdabmkn7Le5hy4S3tSADTtM+NNxDI
        LlSBVAoOTXyINdJB+qcJ46wyHCiSBBy1/rWyIuP95y08Nm+BRwkDzTmHIomkyCrvNpCE191wr4Las
        ixICWSlKcq6/TUJzfd20oFNiCKFTyMmqiimoA8U0p22/DFVtvbZx5wRNe1YDylkDQHLIf8QZk+k4q
        LR9B8omdjf1nvW/Qo6R8AKfdu7bSh9F854450eq2a1lO/HQj7+Q+FuvyuoaR0RiZTzMT8+fw/p5tt
        8VxoOXGQ==;
Received: from [2601:1c2:980:9ec0::2764]
        by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
        id 1qROq5-006XFj-2B;
        Thu, 03 Aug 2023 03:17:25 +0000
Message-ID: <738565a2-4415-b67e-8955-32909cdbae83@infradead.org>
Date:   Wed, 2 Aug 2023 20:17:24 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH net-next v2 2/2] docs: net: page_pool: use kdoc to avoid
 duplicating the information
Content-Language: en-US
To:     Jakub Kicinski <kuba@kernel.org>, davem@davemloft.net
Cc:     netdev@vger.kernel.org, edumazet@google.com, pabeni@redhat.com,
        aleksander.lobakin@intel.com, hawk@kernel.org,
        ilias.apalodimas@linaro.org, corbet@lwn.net,
        linux-doc@vger.kernel.org, Lorenzo Bianconi <lorenzo@kernel.org>
References: <20230802161821.3621985-1-kuba@kernel.org>
 <20230802161821.3621985-3-kuba@kernel.org>
From:   Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20230802161821.3621985-3-kuba@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org



On 8/2/23 09:18, Jakub Kicinski wrote:
> All struct members of the driver-facing APIs are documented twice,
> in the code and under Documentation. This is a bit tedious.
> 

so easier to maintain...

> I also get the feeling that a lot of developers will read the header
> when coding, rather than the doc. Bring the two a little closer
> together by using kdoc for structs and functions.

Ack that.

> 
> Using kdoc also gives us links (mentioning a function or struct
> in the text gets replaced by a link to its doc).
> 
> Signed-off-by: Jakub Kicinski <kuba@kernel.org>


Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
Tested-by: Randy Dunlap <rdunlap@infradead.org>

Thanks.

> --
> CC: hawk@kernel.org
> CC: ilias.apalodimas@linaro.org
> CC: corbet@lwn.net
> CC: linux-doc@vger.kernel.org
> CC: Lorenzo Bianconi <lorenzo@kernel.org>
> CC: Randy Dunlap <rdunlap@infradead.org>
> CC: Alexander Lobakin <aleksander.lobakin@intel.com>
> ---
>  Documentation/networking/page_pool.rst |  86 ++++------------
>  include/net/page_pool.h                | 134 +++++++++++++++++++------
>  net/core/page_pool.c                   |  31 +++++-
>  3 files changed, 152 insertions(+), 99 deletions(-)
> 


-- 
~Randy
