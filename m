Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5C8CCD8CB5
	for <linux-doc@archiver.kernel.org>; Tue, 10 Oct 2023 19:35:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231596AbjJJTf3 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 10 Oct 2023 15:35:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234244AbjJJTf2 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 10 Oct 2023 15:35:28 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E85D9E;
        Tue, 10 Oct 2023 12:35:26 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 291F7C433C7;
        Tue, 10 Oct 2023 19:35:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1696966526;
        bh=8EHPRgirzBiJes33JSRoN7IC6prLFO+uAYksJIDNzpc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=KaR5+jwpzQypOv9MUN1bldww4jz9YtWLf8ZLYV6Okb/7/ibkkdDUKYoB/HwHwkgxr
         UHwqpGax6G+OLEskxUpcrFodUgvOVD16GOxQ1V4P3ZHq+w9vksHfcKNFWn4T6JDVfA
         kLDtomQ1q1YoCeiytZcWZW5wdBH04C6RaY2yyzpo=
Date:   Tue, 10 Oct 2023 15:35:25 -0400
From:   Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Hu Haowen <src.res.211@gmail.com>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] docs/zh_TW: update contents for zh_TW
Message-ID: <20231010-helping-pajamas-dee038@meerkat>
References: <20231010050727.49212-1-src.res.211@gmail.com>
 <87a5sq70uy.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <87a5sq70uy.fsf@meer.lwn.net>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Oct 10, 2023 at 01:07:17PM -0600, Jonathan Corbet wrote:
> > This is a thorough rewrite of the previous patch:
> >     https://lore.kernel.org/linux-doc/20230807120006.6361-1-src.res.211@gmail.com/
> > in order to get rid of text damage and merging errors, created based on
> > linux-next (date: Oct. 9, 2023).
> >
> > Signed-off-by: Hu Haowen <src.res.211@gmail.com>
> 
> So this patch still isn't showing up in lore, with the result that b4
> will not work with it.  The thing is, it *does* make it through vger,
> and has landed in the LWN archive:
> 
>   https://lwn.net/ml/linux-kernel/20231010050727.49212-1-src.res.211%40gmail.com/
> 
> Might lore be dropping it because it consists of one big attachment?

There's a moderation queue on lore for lists that aren't going through
subspace, and this patch was stuck there. The queue does get reviewed once
every 2-3 days, which explains why the others showed up, but with delay.

> Putting your patches inline would be the right thing to do in any case.

I'm not sure if your client is showing it differently, but to me the patch
appears to be just like any other -- it's inline and properly formed.

> Rather than force another round, I've tried to the patch directly (but
> see below), but it would be good to figure out why lore doesn't like it.
> Konstantin, any ideas?

If you like, we can migrate linux-doc to the new infrastructure and then you
will probably see it on lore faster than it's delivered into your inbox. :)

Either way, b4 should properly find and "am" it now.

-K
