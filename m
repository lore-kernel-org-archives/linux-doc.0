Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC054C678DE
	for <linux-doc@archiver.kernel.org>; Thu, 19 Jan 2023 21:41:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230079AbjASVlp (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 19 Jan 2023 16:41:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56154 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231201AbjASVjs (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 19 Jan 2023 16:39:48 -0500
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA1594902E
        for <linux-doc@vger.kernel.org>; Thu, 19 Jan 2023 13:29:22 -0800 (PST)
Received: from localhost (unknown [IPv6:2601:281:8300:73::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 7E5B7359;
        Thu, 19 Jan 2023 21:29:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 7E5B7359
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1674163762; bh=6mx0er111Gwqw7gi8PlZs7IvCmhSKH+Y/hp0Hy++jls=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=DrCDR5B9m6EmmdSU0nwN88WsLrmNds7z3nUPazfLLIbFHf+8jDl3M35u9297288m6
         nXLoVVvLd8gfYhDWPKcwLqxUPWXfLaSzuNr2SDLtNqmtaxuZVH7n4hIfIiiqmT05cc
         m67YEBEBouPhcLt6/eU25VwoDujCxwlR7WwXcbriWrXhNWzJ8FxKV5bi6X1mbvMX0A
         z2s+n8/t68sezG00C5prp++VM7QrbiX3kgUfIh00qpReFLFwPKdS4kQ7tJe6O8Tzkq
         kyoT4Go0LoGMxDUnXt9INjhzVkW37Y+Cd24OFLNk6cvVEWj5KfOZ3Ngnd/VKSZ1cCD
         0GAvpWNYRCdcg==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Akira Yokosawa <akiyks@gmail.com>,
        Sadiya Kazi <sadiyakazi@google.com>
Cc:     brendanhiggins@google.com, davidgow@google.com,
        kunit-dev@googlegroups.com, linux-doc@vger.kernel.org,
        Akira Yokosawa <akiyks@gmail.com>,
        Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Subject: Re: New theme - Alabaster for Kernel Documentation
In-Reply-To: <c00df839-9429-891b-5682-3dbc2d6edbbe@gmail.com>
References: <CAO2JNKUA5DWxNk2cCZwj8DEFF-acf6ZpxwBqn2qTwn4fTW1+BQ@mail.gmail.com>
 <c00df839-9429-891b-5682-3dbc2d6edbbe@gmail.com>
Date:   Thu, 19 Jan 2023 14:29:21 -0700
Message-ID: <87r0vq6wni.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Akira Yokosawa <akiyks@gmail.com> writes:

> Konstantin, would it be possible for you to add "DOCS_THEME=sphinx_rtd_theme"
> for the "latest" kernel documentation builds until the new default theme
> becomes good enough for most people?  That is if Jon agrees.
> For the "next" builds, alabaster theme should be OK, and easier for us to
> compare the two themes.

I'd prefer to avoid this if possible.  In the end, though, what
kernel.org does isn't my decision, of course...  but if the Alabaster
mode is really that bad, we should either fix it or just revert the
change.  I'll try to dig into the sidebar generation a bit, but time is
scarce.

Before going too far, what exactly is the desired sidebar experience
here?  I find the RTD approach, which keeps all of the top-level entries
there, to be severely messy and would prefer not to reproduce it.  Of
course, some of that reflects the still-messy nature of our top-level
Documentation/ directory, another thing I'd like to fix.

Thanks,

jon
