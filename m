Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C4AAC27C40
	for <linux-doc@archiver.kernel.org>; Thu, 24 Aug 2023 01:46:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232059AbjHXBpz (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 23 Aug 2023 21:45:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53264 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239133AbjHXBpg (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 23 Aug 2023 21:45:36 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E27012C
        for <linux-doc@vger.kernel.org>; Wed, 23 Aug 2023 18:45:35 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 0DB346315A
        for <linux-doc@vger.kernel.org>; Thu, 24 Aug 2023 01:45:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F27DEC433C8;
        Thu, 24 Aug 2023 01:45:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1692841534;
        bh=+/Hf0DnTRX59DK/EfpsVNSyw0w2ZUHGIm2JKxrZQP40=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=SI/Fuj4s7oTqvUArGQyizY05SaKQUpwktdUuojC72Kul+NvLhGJaKB4mlE/tawwpR
         E6+HE+9b5GHggfpXTEnkU3QihSi7XoTaEplra5EgTb3gbUGItNPAJaOzGUdI5TSA3u
         Zt0dqGiAHDcA4xvFF890Erd54hU3dtrsNJ26TffqZzLwi9oyI3a6/DPf6aVu9fYKC0
         wq++DJPOcXE8M4KLaaxk/B9VsR91g2qn1y1gerF85FVz5b4/g2VJdDiKoUy9K4wERk
         /KIYQxtbTrFoc9KCxHtUjh9k+dImT+jfPOasqFOWXTCuDCNW3yDevf0ToVzKH20H60
         McTG9P8c6FXXg==
Date:   Wed, 23 Aug 2023 18:45:32 -0700
From:   Jakub Kicinski <kuba@kernel.org>
To:     Jacob Keller <jacob.e.keller@intel.com>
Cc:     Donald Hunter <donald.hunter@gmail.com>, <netdev@vger.kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        "Paolo Abeni" <pabeni@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>, <linux-doc@vger.kernel.org>,
        Stanislav Fomichev <sdf@google.com>,
        "Arkadiusz Kubalewski" <arkadiusz.kubalewski@intel.com>,
        <donald.hunter@redhat.com>
Subject: Re: [PATCH net-next v4 02/12] doc/netlink: Add a schema for
 netlink-raw families
Message-ID: <20230823184532.7e606d33@kernel.org>
In-Reply-To: <57ed25b1-e00f-2601-fc76-1f9d19182915@intel.com>
References: <20230823114202.5862-1-donald.hunter@gmail.com>
        <20230823114202.5862-3-donald.hunter@gmail.com>
        <005940db-b7b6-c935-b16f-8106d3970b11@intel.com>
        <m2edjth2x2.fsf@gmail.com>
        <57ed25b1-e00f-2601-fc76-1f9d19182915@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, 23 Aug 2023 14:43:13 -0700 Jacob Keller wrote:
> > It's a good question. The schema definitions are currently strict
> > supersets of genetlink:
> > 
> > genetlink <= genetlink-c <= genetlink-legacy <= netlink-raw
> > 
> > As you noted below, there's only 2 additions needed for the netlink raw
> > families, protonum and mcast-group value.
> > 
> > I would be happy to change the description and other references to
> > genetlink in this spec, but I'd like to hear Jakub's thoughts about
> > minimal modification vs a more thorough rewording. Perhaps a middle
> > ground would be to extend the top-level description to say "genetlink or
> > raw netlink" and qualify that all mention of genetlink also applies to
> > raw netlink.
> > 
> > Either way, I just noticed that the schema $id does need to be updated.
> 
> Ok, ya lets wait for Jakub's opinion. I think the clarification would be
> good since at least conceptually genetlink is distinct to me from
> netlink raw, so it feels a bit weird.

Hm, no great choice here.

I feel like posterity may judge us if we don't clean up the genetlink
references so let's remove the most obvious ones.

description, name.description, delete version completely, narrow down
protocol to just netlink-raw. And I think that's it? The comments are
fine, IMO.
