Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7810C636CC
	for <linux-doc@archiver.kernel.org>; Sat,  4 Feb 2023 21:39:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230019AbjBDVjd (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 4 Feb 2023 16:39:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41686 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232417AbjBDVjb (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 4 Feb 2023 16:39:31 -0500
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7DCC129156
        for <linux-doc@vger.kernel.org>; Sat,  4 Feb 2023 13:39:29 -0800 (PST)
Received: from localhost (unknown [IPv6:2601:281:8300:73::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id A31622E0;
        Sat,  4 Feb 2023 21:39:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net A31622E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1675546768; bh=mfEkRPM0yLF2Hb1VVxQaaCJ2BeE4ES2UuSiJkSU7HqM=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=N5Qt3brNEvMYoO5/77qohhQmBJyWqv2FwobrxMs4LT3p9AJREyXqE5dYVSSfNsux2
         b1qq9UtgoX5LULNDCByop9LuuBrtkytJzszpVv0yQiWpjKwX1WtgGjmYoc0g26UCpE
         UsnVgw2gJ+z6oc4kzfCDi0GNqChMu19P6Rh01vS103VuXbRWt3SQAigeqmgxBR7FtV
         027SMmh3YwGmrphjoYtIBtkiUfXXt4kZxU9hhxXtC3RA4VpUflLVKT9udGen1BAeAO
         cgt8dKqkPXF0h2IMzwvKTslkLtyHsCnpjIhaAtqlSHgelr9NH1XmBpcJ/cfc1lKaS5
         dpLXw8dNuPMyw==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Akira Yokosawa <akiyks@gmail.com>
Cc:     David Gow <davidgow@google.com>,
        Sadiya Kazi <sadiyakazi@google.com>, linux-doc@vger.kernel.org,
        Akira Yokosawa <akiyks@gmail.com>
Subject: Re: [PATCH RFC V2] docs: Add more information to the HTML sidebar
In-Reply-To: <cb0d683b-8abd-ecb1-389d-c45550e7bbf3@gmail.com>
References: <87bkmas5vc.fsf@meer.lwn.net> <877cwys3g6.fsf@meer.lwn.net>
 <0749ec79-4375-e44e-f2b6-8f0a8bfa9ad9@gmail.com>
 <cb0d683b-8abd-ecb1-389d-c45550e7bbf3@gmail.com>
Date:   Sat, 04 Feb 2023 14:39:27 -0700
Message-ID: <87357lrtyo.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Akira Yokosawa <akiyks@gmail.com> writes:

>> But I see a major problem on small/narrow screens.
>> The sidebar is now kept at the top, and by clicking/tapping a link in the
>> TOC, I can't jump to the section I want to see.
>> 
>> Sorry, but this is not usable at all.
>
> To be clear, I meant "on small/narrow screens".
> On normal PC screens, this resolves the issues I mentioned earlier.
>
> So I'm OK with this goes into v6.3. Maybe add a note on small screen
> devices in the Changelog.

I see what you're saying.

The best solution to this, I guess, would be to hide the contents menu
behind an icon in the small-screen view.  Doable, I'll try to find some
time to make that happen.

> BTW, I very much like the way LWN's site navigation behaves on small
> screen devices. LWN is designed to be accessible without hierarchical
> structure of documents, which is the opposite of how kernel documentation
> is managed based on the nested TOC entries.

Yeah, but for the kernel documentation the hierarchy is the only
structure we have.  Making less of a mess out of it has been a many-year
project, got a long way to go...

Thanks,

jon
