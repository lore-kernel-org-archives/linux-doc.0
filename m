Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C51FC001E0
	for <linux-doc@archiver.kernel.org>; Thu,  3 Aug 2023 07:09:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232613AbjHCHJY (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 3 Aug 2023 03:09:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33712 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233820AbjHCHJJ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 3 Aug 2023 03:09:09 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A12B11FF0
        for <linux-doc@vger.kernel.org>; Thu,  3 Aug 2023 00:09:00 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 2BCBB61C28
        for <linux-doc@vger.kernel.org>; Thu,  3 Aug 2023 07:09:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E2CEC433C8;
        Thu,  3 Aug 2023 07:08:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1691046539;
        bh=pyv+oEgXNG38I85XpnCuGjqtW1Nl70goBjD2HLthj9U=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=WKwy91q7W0B8MtvjOdwvClQ4gSNc700bh7mhFQ9uIXdMw1SYGboIQdJXTH/1jMji9
         DA5uf+SosTZqzp9Vzzgn+LUjaMCT+HisXobdgYtgR8jn/9atDNaleKkAI2r9+O9vDn
         yiUf73mZ3vBvs9M/K7pQNsfQcD2PihtD2+wTLx1hof3Dp/Db5vV2Mfixz93CF2X10O
         L6Gu60MW0/ICbSc+OFFaKc19MzWTGPACmHSQhGDdNld4M9AzWg+KMFtp/CsMdtfPbN
         uuI4LiKWxGvRpEhMUcdy6gDNh43zBXSFcMcz6BFpIli9251uX/CQ5BuGcQnmyxk5UJ
         j+zxVscto9q0Q==
Message-ID: <350a2ae8-8942-20b9-e449-6047b2272b4e@kernel.org>
Date:   Thu, 3 Aug 2023 09:08:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH net-next v2 2/2] docs: net: page_pool: use kdoc to avoid
 duplicating the information
Content-Language: en-US
To:     Jakub Kicinski <kuba@kernel.org>, davem@davemloft.net
Cc:     netdev@vger.kernel.org, edumazet@google.com, pabeni@redhat.com,
        aleksander.lobakin@intel.com, ilias.apalodimas@linaro.org,
        corbet@lwn.net, linux-doc@vger.kernel.org,
        Lorenzo Bianconi <lorenzo@kernel.org>,
        Randy Dunlap <rdunlap@infradead.org>
References: <20230802161821.3621985-1-kuba@kernel.org>
 <20230802161821.3621985-3-kuba@kernel.org>
From:   Jesper Dangaard Brouer <hawk@kernel.org>
In-Reply-To: <20230802161821.3621985-3-kuba@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org



On 02/08/2023 18.18, Jakub Kicinski wrote:
> All struct members of the driver-facing APIs are documented twice,
> in the code and under Documentation. This is a bit tedious.
> 
> I also get the feeling that a lot of developers will read the header
> when coding, rather than the doc. Bring the two a little closer
> together by using kdoc for structs and functions.
> 
> Using kdoc also gives us links (mentioning a function or struct
> in the text gets replaced by a link to its doc).
> 
> Signed-off-by: Jakub Kicinski<kuba@kernel.org>

This is great! :-)

Acked-by: Jesper Dangaard Brouer <hawk@kernel.org>
