Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0B30C0015E
	for <linux-doc@archiver.kernel.org>; Tue,  1 Aug 2023 22:10:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231616AbjHAWK0 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 1 Aug 2023 18:10:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231133AbjHAWKY (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 1 Aug 2023 18:10:24 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EDFF526B0
        for <linux-doc@vger.kernel.org>; Tue,  1 Aug 2023 15:10:14 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 7EB9061762
        for <linux-doc@vger.kernel.org>; Tue,  1 Aug 2023 22:10:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7910CC433C8;
        Tue,  1 Aug 2023 22:10:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1690927813;
        bh=yEtQ831wM9SM6V5F9aQEzVtZ+z2IR+deM3GY/Y8qBYM=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=qy6FQWSLQq1YQov5rbsF6aHBQbRMR4DQE/tQC/4gT/C/W2jTMr6Sc/dcS7cLj/fjp
         s4N7+9/P3otyVxRokaHODd6wLXkvy1lmUXZ2hWFHwrzGK8s9T4j3nOn7VnhDuj95v8
         RqvWz7JXRNsRf8fMC2zc2fJoBL16iCfbwuUABgoP73vTd+G5433p0U1HvRPl3qZiCY
         4JQhRVrK3dchDC5Aq5kPbEJ4np/TNEGQxtm226OkA27vj86Og3KdIl0E4vNebEVpHv
         mSd9z7Zg4C+3wNQ+vuxVUd4wdiYQlJ690j9VwOPnAy3koihYvlY+OFfTt6IZgW8/5A
         SlUoEkxEX/Jtw==
Date:   Tue, 1 Aug 2023 15:10:12 -0700
From:   Jakub Kicinski <kuba@kernel.org>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     davem@davemloft.net, netdev@vger.kernel.org, edumazet@google.com,
        pabeni@redhat.com, hawk@kernel.org, ilias.apalodimas@linaro.org,
        corbet@lwn.net, linux-doc@vger.kernel.org,
        Michael Chan <michael.chan@broadcom.com>,
        Lorenzo Bianconi <lorenzo@kernel.org>
Subject: Re: [PATCH net] docs: net: page_pool: document PP_FLAG_DMA_SYNC_DEV
 parameters
Message-ID: <20230801151012.3be47633@kernel.org>
In-Reply-To: <23be0fd9-9177-a8bd-e436-07f52e40e79b@infradead.org>
References: <20230801203124.980703-1-kuba@kernel.org>
        <23be0fd9-9177-a8bd-e436-07f52e40e79b@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, 1 Aug 2023 14:58:48 -0700 Randy Dunlap wrote:
> > +If in doubt set ``offset`` to 0, ``max_len`` to ``PAGE_SIZE`` and
> > +pass -1 as ``dma_sync_size``. That combination of arguments is always
> > +correct.  
> 
>    at the expense of more overhead?

Should be implied by the context, I hope, so no point stating it?

Thanks for all the other corrections, will fix in v2.
-- 
pw-bot: cr
