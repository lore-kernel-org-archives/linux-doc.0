Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B40BEB64DA
	for <linux-doc@archiver.kernel.org>; Fri, 21 Jul 2023 03:07:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229555AbjGUDHN (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 20 Jul 2023 23:07:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50042 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229487AbjGUDHM (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 20 Jul 2023 23:07:12 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 693CA2111
        for <linux-doc@vger.kernel.org>; Thu, 20 Jul 2023 20:07:02 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id F008661CBC
        for <linux-doc@vger.kernel.org>; Fri, 21 Jul 2023 03:07:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15380C433C7;
        Fri, 21 Jul 2023 03:07:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1689908821;
        bh=YN6tDx5wsRGuEcokfNJHCbM2RckvcZCwq4ECiC9RWKk=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=R1mcRaFVwcA4851mIKSc6Vrnngfrcezgzho4OXKVbWndIYYbTSLAtz5kGJlBvIVsO
         lhj6TZ6uNUdmg0iIvBkxMKW0wmKOChPmmJlZPY5zy/dcXbSdAs6GJNE2LKWYl/UjYG
         7qCISGrRzWV1xJYkIWr5CqH+J+t3TV6Jz9fgbQglDjw032aTxOb7a46/TYbFWocVDv
         NEfc2D+6HGjaa9cE5okjw/xcz1PfXp6h4IZiQKi7cfyXz5OxiKPTn582Dz93/jXLeR
         meolMgGOlacEqj8IW+Iy7UswY0K8GP7xNeVFx4mMXBQrylOMtpTOr3U7JjynoB29Q7
         31TCYr3tUVVVg==
Date:   Thu, 20 Jul 2023 20:07:00 -0700
From:   Jakub Kicinski <kuba@kernel.org>
To:     Wei Fang <wei.fang@nxp.com>
Cc:     "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
        "edumazet@google.com" <edumazet@google.com>,
        "pabeni@redhat.com" <pabeni@redhat.com>,
        "corbet@lwn.net" <corbet@lwn.net>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        "davem@davemloft.net" <davem@davemloft.net>
Subject: Re: [PATCH net] docs: net: clarify the NAPI rules around XDP Tx
Message-ID: <20230720200700.162b29c6@kernel.org>
In-Reply-To: <AM5PR04MB3139FC41B234823EE28424E2883FA@AM5PR04MB3139.eurprd04.prod.outlook.com>
References: <20230720161323.2025379-1-kuba@kernel.org>
        <AM5PR04MB3139FC41B234823EE28424E2883FA@AM5PR04MB3139.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, 21 Jul 2023 02:35:41 +0000 Wei Fang wrote:
> > -In other words, it is recommended to ignore the budget argument when
> > -performing TX buffer reclamation to ensure that the reclamation is not
> > -arbitrarily bounded; however, it is required to honor the budget argument -for
> > RX processing.
> > +In other words for Rx processing the ``budget`` argument limits how
> > +many packets driver can process in a single poll. Rx specific APIs like
> > +page pool or XDP cannot be used at all when ``budget`` is 0.
> > +skb Tx processing should happen regardless of the ``budget``, but if
> > +the argument is 0 driver cannot call any XDP (or page pool) APIs.
> >   
> Can I ask a stupid question why tx processing cannot call any XDP (or page pool)
> APIs if the "budget" is 0?

Because in that case we may be in an interrupt context, and page pool
assumes it's either in process or softirq context. See commit
afbed3f74830 ("net/mlx5e: do as little as possible in napi poll when
budget is 0") for an example stack trace.

