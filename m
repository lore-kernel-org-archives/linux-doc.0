Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DDDCEE4993
	for <linux-doc@archiver.kernel.org>; Tue, 22 Aug 2023 15:59:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235324AbjHVP7z (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 22 Aug 2023 11:59:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38724 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232257AbjHVP7y (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 22 Aug 2023 11:59:54 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0BB89BE
        for <linux-doc@vger.kernel.org>; Tue, 22 Aug 2023 08:59:53 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 957B965BA8
        for <linux-doc@vger.kernel.org>; Tue, 22 Aug 2023 15:59:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C63C2C433C8;
        Tue, 22 Aug 2023 15:59:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1692719992;
        bh=U5/rni7ScMnO0oxxGq/4AvPlu3yOQhVRQnsrpy6LqXk=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=lGTdEXBEwFJ4kOaYWUt/D15uCtzCvKv1svUaa5EflX4HJOSu+qQQqpM5VKRZkIb9c
         0Vfqpk0qaYDO6rh2gA/WIn+aMo3wbuMVBhIAefxIPY86KOHJ5mE6spMRy0OQKwirbC
         F05Jmfr0DFkb8I0O8e9jccCJjo5BmIyH5Y2b856E1lW2B9c+IOd3QCfB5cXoV16Zyh
         p4Wk7cr8eqjIysxR0Ns3fsi/P+64wn/lN4/4mysSKH2DyqZ98KC0aBQKwmh8GoLNnn
         OsUkHlsS4Chg2NYbUX72Vvd3dfu3R9me3WNvI2K+Gyo/77WK58vO2pM4j5C9+hRTgB
         OMiYeTgk5RzQQ==
Date:   Tue, 22 Aug 2023 08:59:50 -0700
From:   Jakub Kicinski <kuba@kernel.org>
To:     Sabrina Dubroca <sd@queasysnail.net>
Cc:     netdev@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        linux-doc@vger.kernel.org, Scott Dial <scott@scottdial.com>
Subject: Re: [PATCH net-next] macsec: introduce default_async_crypto sysctl
Message-ID: <20230822085950.02d2d2b0@kernel.org>
In-Reply-To: <ZOTWzJ4aEa5geNva@hog>
References: <9328d206c5d9f9239cae27e62e74de40b258471d.1692279161.git.sd@queasysnail.net>
        <20230818184648.127b2ccf@kernel.org>
        <ZOTWzJ4aEa5geNva@hog>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, 22 Aug 2023 17:39:56 +0200 Sabrina Dubroca wrote:
> 2023-08-18, 18:46:48 -0700, Jakub Kicinski wrote:
> > Can we not fix the ordering problem?
> > Queue the packets locally if they get out of order?  
> 
> Actually, looking into the crypto API side, I don't see how they can
> get out of order since commit 81760ea6a95a ("crypto: cryptd - Add
> helpers to check whether a tfm is queued"):
> 
>     [...] ensure that no reordering is introduced because of requests
>     queued in cryptd with respect to requests being processed in
>     softirq context.
> 
> And cryptd_aead_queued() is used by AESNI (via simd_aead_decrypt()) to
> decide whether to process the request synchronously or not.
> 
> So I really don't get what commit ab046a5d4be4 was trying to fix. I've
> never been able to reproduce that issue, I guess commit 81760ea6a95a
> explains why.
> 
> I'd suggest to revert commit ab046a5d4be4, but it feels wrong to
> revert it without really understanding what problem Scott hit and why
> 81760ea6a95a didn't solve it.
> 
> What do you think?

Unless Scott can tell us what he was seeing I think we should revert.
The code looks fine to me as well...
