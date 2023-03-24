Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7231DC76195
	for <linux-doc@archiver.kernel.org>; Fri, 24 Mar 2023 22:28:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231886AbjCXW2F (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 24 Mar 2023 18:28:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41240 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231864AbjCXW2E (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 24 Mar 2023 18:28:04 -0400
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13E6F2D41
        for <linux-doc@vger.kernel.org>; Fri, 24 Mar 2023 15:28:04 -0700 (PDT)
Received: from localhost (unknown [IPv6:2601:281:8300:73::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id D8C7F44A;
        Fri, 24 Mar 2023 22:28:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net D8C7F44A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1679696883; bh=iGEm5jVGBuZOf1Imi45FAeWGQOk2T3XpJBjBPkozEhg=;
        h=From:To:Subject:In-Reply-To:References:Date:From;
        b=ajcIMw0kcQ0lf3+2lSl/40QNrll6QwsiClrWAaUfTMJiHX5plEoCnstET8qBWbTko
         Zc76bnJsV/NhMJBwzeauXXUGJBXYcN2OxrcBnAbwM//PJDhy3JwBQ1VX6oTtvmke4w
         J1GqX3YkA4i/w/z04h06oR9VFrFBEYfkK0gDaSQYO9TZqMAzsmGN6b0l9PNFKewwSv
         SMtWRP9KeYj3VARkIIPUu8f/JeS2W8rXFfDHojiUjqh9A5MKJ9Vnw0v/8SODOkqiNE
         ecaqzbYzIq5ir1ffdjx7g2H1rWai+eVZw9GoE67uPaao74Ce37hjkDWjJFyDsYQdHm
         XmuJHuEofTDgQ==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Ken Goldman <kgold@linux.ibm.com>, linux-doc@vger.kernel.org
Subject: Re: sphinx - proper method for linking
In-Reply-To: <e747b0ba-7992-36c7-f931-08aac46385f1@linux.ibm.com>
References: <e747b0ba-7992-36c7-f931-08aac46385f1@linux.ibm.com>
Date:   Fri, 24 Mar 2023 16:28:02 -0600
Message-ID: <87v8ipzswd.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Ken Goldman <kgold@linux.ibm.com> writes:

> 1. What is the recommended way to link to documents outside my tree.
>
> Should I be doing that, or is it fragile / not recommended?

If you need to link to something elsewhere, you can certainly do so;
there are countless examples in the kernel documentation.

> Are links to other documents stable?
>
> How about sections within the page?

I don't understand those questions.

> I found that this .rst works.
>
> See 
> https://www.kernel.org/doc/html/latest/security/keys/trusted-encrypted.html
>
> Is that OK, or is there a better way?

You wouldn't link to the rendered kernel docs normally, you'd just say
"See Documentation/security/keys/trusted-encrypted.rst".

Look at the Sphinx cheatsheets on the net for the various other ways of
making links if you need to link outside of the kernel docs.

> Is that link (doc/html/latest) correct.
>
> 2. Are my pages and headings to be treated as stable, like an API? I.e., 
> once I release documentation, are all the pages and headings frozen so 
> they will not break links?

No, there is no such requirement.

jon
