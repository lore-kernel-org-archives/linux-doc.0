Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45A0DC05027
	for <linux-doc@archiver.kernel.org>; Tue, 14 Feb 2023 18:33:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231515AbjBNSdN (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 14 Feb 2023 13:33:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33004 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229506AbjBNSdM (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 14 Feb 2023 13:33:12 -0500
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 384B710F7
        for <linux-doc@vger.kernel.org>; Tue, 14 Feb 2023 10:33:11 -0800 (PST)
Received: from localhost (unknown [IPv6:2601:281:8300:73::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 94BAC6E3;
        Tue, 14 Feb 2023 18:33:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 94BAC6E3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1676399590; bh=zHT9sy1pj22aZL0BnBvf8YiPNkKarx2VJ7yH4GTL64Q=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=GPkyOmn8q9TMkPcFRUnkkTSA9V2H/WSd7rtBZsuWVWZ/1jkogS2rEzkh7GOcvYvyt
         er84aZ9cv/iBDIbOPZS0db7OVibanc/6DUSfuqfIuoxrnsWW9ZAd7b53zSq+AQDHwJ
         hodKT9UW+KL9lvYrXy9w3DMJqFWW0BAqPUWYUaRyqtkDLD2WK1M5jjs8dFvQG0AohW
         TR5Gw9IP6tKaWSRS1krl+h5qtnv6y2i+MPbXHHEJ1aovrKkqcWvrwruo4zUnsHPUXE
         e7Bu7Lq17gSmtE97AAf9BBBaVjDzm6eLI1U+2BPyk08j+7nosAuaiuSeZHa4SDTkUE
         w5R6dBjDLmldA==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org
Cc:     David Gow <davidgow@google.com>,
        Sadiya Kazi <sadiyakazi@google.com>,
        Akira Yokosawa <akiyks@gmail.com>
Subject: Re: [PATCH RFC V2] docs: Add more information to the HTML sidebar
In-Reply-To: <8469fe5b-a8dc-98a8-05fb-8645c8a43c47@infradead.org>
References: <87bkmas5vc.fsf@meer.lwn.net>
 <c75c8304-88ce-cb7a-3800-fa3ce83a3421@infradead.org>
 <87lelar3yb.fsf@meer.lwn.net>
 <8469fe5b-a8dc-98a8-05fb-8645c8a43c47@infradead.org>
Date:   Tue, 14 Feb 2023 11:33:09 -0700
Message-ID: <874jroksgq.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Randy Dunlap <rdunlap@infradead.org> writes:

> Is there a reason that the main index's "sections" (single underline)
> don't show up in the sidebar index?  Is that on purpose?
> Or just a relic of them being "sections"?

That's just how the sidebar gets generated.  I would much rather see the
sections there...but if we want that, I think we'll have to implement it
ourselves.

> (Why are they sections? Why is the main document's title a chapter
> instead of being the Document title?)

Good question...that's just how it was done.  Probably worth fixing.

> I would like to be able to see visually when the sidebar index goes from
> one "section" to another one, e.g., from "Internal API manuals"
> to "Development tools and processes". I think that there might be a
> small blank (like 1/2 line space) between these sections now, but
> that is easy to overlook.

See above :)

Thanks,

jon
