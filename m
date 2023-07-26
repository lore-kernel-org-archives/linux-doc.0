Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA3ECEB64DD
	for <linux-doc@archiver.kernel.org>; Wed, 26 Jul 2023 00:56:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229608AbjGZA4G (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 25 Jul 2023 20:56:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32896 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229498AbjGZA4G (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 25 Jul 2023 20:56:06 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5398F2119
        for <linux-doc@vger.kernel.org>; Tue, 25 Jul 2023 17:56:05 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id D9D6A6186A
        for <linux-doc@vger.kernel.org>; Wed, 26 Jul 2023 00:56:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BA44C433C8;
        Wed, 26 Jul 2023 00:56:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1690332964;
        bh=MfN5M/tY60PJ14OPyEhgNIux/Xkd/vPmzSLxg/p70fQ=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=AgGTqXEER/shTu5cZzMDJmO1Pc3ny8CQ+SVv+x9ojrnv7PkR6vBo3yh50DCZpKgiB
         5tIiamMaZjgqH9vDoJxt7Y/LL+9IStA/z/qv4dWMb4eTnTK67UkPFn0rdPuABB0eSU
         2Ol7/j7SWRa3w/nyj6AN7jJHZj0pXjUU8jD41YRGoGMXvZQP6WVLbj4mF759EJszB8
         4qzbpmu3WzvACYmQ4+HZqbnoHU0oIXgXUuEv3h3IvAWlTOQganGRB/lR7q0ZRdA/Nw
         myn6KdqnAZd3rdrZ4KF7+O3jzeq/WRIssyA2vd+TXmju9Pd+oKoj19WsqJYfntzUIc
         zNSeWvgJCUyJA==
Date:   Tue, 25 Jul 2023 17:56:02 -0700
From:   Jakub Kicinski <kuba@kernel.org>
To:     Alexander Duyck <alexander.duyck@gmail.com>
Cc:     davem@davemloft.net, netdev@vger.kernel.org, edumazet@google.com,
        pabeni@redhat.com, corbet@lwn.net, linux-doc@vger.kernel.org
Subject: Re: [PATCH net] docs: net: clarify the NAPI rules around XDP Tx
Message-ID: <20230725175602.53e0a1f4@kernel.org>
In-Reply-To: <CAKgT0Udz74tvTL9TfT4boajCFpAog4juJjW83pxEvQ7RNMFGDw@mail.gmail.com>
References: <20230720161323.2025379-1-kuba@kernel.org>
        <c429298e279bd549de923deba09952e7540e534a.camel@gmail.com>
        <20230725115528.596b5305@kernel.org>
        <CAKgT0UdKWmogiFD_Gip3TCi8-ydy+CVjwca1hPTYBRQQZ8_mGQ@mail.gmail.com>
        <20230725134122.1684a2f1@kernel.org>
        <CAKgT0Udz74tvTL9TfT4boajCFpAog4juJjW83pxEvQ7RNMFGDw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, 25 Jul 2023 17:02:42 -0700 Alexander Duyck wrote:
> So looking at it more I realized the way we are getting around the
> issue is that the skbuffs are ALWAYS freed in softirq context.
> Basically we hand them off to dev_consume_skb_any, which will hand
> them off to dev_kfree_skb_irq_reason, and it is queueing them up to be
> processed in the net_tx_action handler.

SG.

> As far as the page pool pages themselves I wonder if we couldn't just
> look at modifying __page_pool_put_page() so that it had something
> similar to dev_consume_skb_any_reason() so if we are in a hardirq or
> IRQs are disabled we just force the page to be freed.

Yup (same for the bulk API). I think that Olek was trying to implement
this somehow nicely, not sure how far he got.
