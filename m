Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60D21C46467
	for <linux-doc@archiver.kernel.org>; Thu, 19 Jan 2023 22:16:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229918AbjASWQY (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 19 Jan 2023 17:16:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51698 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229928AbjASWQA (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 19 Jan 2023 17:16:00 -0500
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 724FEA3176
        for <linux-doc@vger.kernel.org>; Thu, 19 Jan 2023 13:55:19 -0800 (PST)
Received: from localhost (unknown [IPv6:2601:281:8300:73::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 08048359;
        Thu, 19 Jan 2023 21:55:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 08048359
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1674165319; bh=YUN3qslDQgN9F8Bm8ewrkmhL8G+SvRqtotG4jLeR8V0=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=M6sFpsWswmLge06GKzRIAD+qXDjIZ5n25upvd6AzZk8unY+GKJC3DGzfEMQt0Dqt4
         bXlBtJfUYABZO3eU0alHP5YnFKDp4dqqbU2fk2sRWBSw0XlZtjCjUFaPcH+wlXpVsq
         h29Zc2sy0ZgHroeGy1GYOEY/aS1E/hyD3xNelKubnQbxgOkAOrfxUFFqLgw/iN04G2
         eUAJ7katIQWpb9tTiRZH00ZNnuAiVtEhLxm/58mrE+3XG8+dz6Nzais364ZLebCNZR
         t8C39aAuPQ4tfXnynbPY697ri2oPIicWMlCYUrQIBWN1Y64v4etbdIZEyKNPod+/Sx
         mxrTWnZUe2uwg==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc:     Akira Yokosawa <akiyks@gmail.com>,
        Sadiya Kazi <sadiyakazi@google.com>, brendanhiggins@google.com,
        davidgow@google.com, kunit-dev@googlegroups.com,
        linux-doc@vger.kernel.org
Subject: Re: New theme - Alabaster for Kernel Documentation
In-Reply-To: <20230119214646.nquwprfswdckwexw@meerkat.local>
References: <CAO2JNKUA5DWxNk2cCZwj8DEFF-acf6ZpxwBqn2qTwn4fTW1+BQ@mail.gmail.com>
 <c00df839-9429-891b-5682-3dbc2d6edbbe@gmail.com>
 <87r0vq6wni.fsf@meer.lwn.net>
 <20230119214646.nquwprfswdckwexw@meerkat.local>
Date:   Thu, 19 Jan 2023 14:55:18 -0700
Message-ID: <87edrq6vg9.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Konstantin Ryabitsev <konstantin@linuxfoundation.org> writes:

> On Thu, Jan 19, 2023 at 02:29:21PM -0700, Jonathan Corbet wrote:
>> Akira Yokosawa <akiyks@gmail.com> writes:
>> 
>> > Konstantin, would it be possible for you to add "DOCS_THEME=sphinx_rtd_theme"
>> > for the "latest" kernel documentation builds until the new default theme
>> > becomes good enough for most people?  That is if Jon agrees.
>> > For the "next" builds, alabaster theme should be OK, and easier for us to
>> > compare the two themes.
>> 
>> I'd prefer to avoid this if possible.  In the end, though, what
>> kernel.org does isn't my decision, of course...
>
> Something I've considered is to have /latest/ show the latest mainline
> *released* mainline, while /rc/ would show the latest rc. So, we'd have three
> distinct movable targets:
>
> docs.kernel.org       - latest mainline release (same as kernel.org/doc/html/latest/)
> docs.kernel.org/next/ - linux-next
> docs.kernel.org/rc/   - latest rc
>
> Would that be acceptable as a solution?

I think we've miscommunicated somewhere.  What I don't like is the idea
of building the mainline docs with a non-default HTML theme.

A "latest -rc" build could be a nice thing, though :)

Thanks,

jon
