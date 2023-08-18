Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B91AC3DA66
	for <linux-doc@archiver.kernel.org>; Fri, 18 Aug 2023 01:19:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243092AbjHRBTE (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 17 Aug 2023 21:19:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1356918AbjHRBSc (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 17 Aug 2023 21:18:32 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 12EBF35B3
        for <linux-doc@vger.kernel.org>; Thu, 17 Aug 2023 18:18:31 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id A528062F3D
        for <linux-doc@vger.kernel.org>; Fri, 18 Aug 2023 01:18:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB48BC433C7;
        Fri, 18 Aug 2023 01:18:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1692321510;
        bh=saAULgCa4svmukEdxg5rGyB7EbkKtlujQFyUvp+i7Vc=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=hE1yGyj4I+6f6vKz+CZ5h89FLu76V7zSC7yhRof7OwLqRwXhOn8aS1eBu3nWThRp4
         BusfNyTPDSmsU+goK4N1xjJAhhGgdMyyXL2iH59ZchVtK1UxgzMy0d/+h9DRVwzQU2
         HQSPXD9S53phggMCxQRrl0vpZnw4juwtWNmcsDDJkRys5uQx1iyJDvDcjMa3M1rF5N
         +8cODK2nCP6UH2hl1eakWUQ7MhNxZnJnCOpgZHM3D9bFuQ8TTbuzr+mY1Y8NadUHZB
         aHNgI8MpHVFoTcoQkhWNJE6GJ4YJ81frQ3ccERlnL/pqY+Fu3dMAyLCqBZ5YDkkvUS
         +ipsTAyj6tQdw==
Date:   Thu, 17 Aug 2023 18:18:28 -0700
From:   Jakub Kicinski <kuba@kernel.org>
To:     Donald Hunter <donald.hunter@gmail.com>
Cc:     netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Paolo Abeni <pabeni@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        Stanislav Fomichev <sdf@google.com>,
        Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>,
        donald.hunter@redhat.com
Subject: Re: [PATCH net-next v2 06/10] tools/net/ynl: Add support for
 netlink-raw families
Message-ID: <20230817181828.76ac2c11@kernel.org>
In-Reply-To: <m2cyzmhw50.fsf@gmail.com>
References: <20230815194254.89570-1-donald.hunter@gmail.com>
        <20230815194254.89570-7-donald.hunter@gmail.com>
        <20230816082908.1365f287@kernel.org>
        <m2cyzmhw50.fsf@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, 17 Aug 2023 10:10:35 +0100 Donald Hunter wrote:
> > Looks good, but do we also need some extra plumbing to decode extack
> > for classic netlink correctly?  Basically shouldn't _decode_extack()
> > also move to proto? Or we can parameterize it? All we really need there
> > is to teach it how much of fixed headers parser needs to skip to get to
> > attributes, really (which, BTW is already kinda buggy for genl families
> > with fixed headers).  
> 
> I have been working on the assumption that extack responses don't
> include any fixed headers. I have seen extack messages decoded correctly
> for classic netlink, here with RTM_NEWROUTE:
> 
> lib.ynl.NlError: Netlink error: Invalid argument
> nl_len = 80 (64) nl_flags = 0x300 nl_type = 2
>   error: -22  extack: {'msg': 'Invalid prefix for given prefix length'}
> 
> Is there something I am missing?

I'm thinking of extack messages carrying offsets in addition to the 
textual error message. NLMSGERR_ATTR_OFFS or NLMSGERR_ATTR_MISS_NEST.

In that case ynl will try to re-parse its own message via
_decode_extack_path() to resolve from the offset to what attribute
was there. See the commit message on a552bfa16:

    lib.ynl.NlError: Netlink error: Numerical result out of range
    nl_len = 108 (92) nl_flags = 0x300 nl_type = 2
            error: -34      extack: {'msg': 'integer out of range',...
                                     'bad-attr': '.ifindex'}

I mean the "bad-attr" thing.

I think it works out of sheer luck here, we happen to skip over 
the fixed header because it looks like a 0-length attribute?
