Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EF92C001DC
	for <linux-doc@archiver.kernel.org>; Mon, 17 Jul 2023 13:47:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231504AbjGQNrQ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 17 Jul 2023 09:47:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53734 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231164AbjGQNrQ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 17 Jul 2023 09:47:16 -0400
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F76794;
        Mon, 17 Jul 2023 06:47:15 -0700 (PDT)
Received: from localhost (unknown [IPv6:2601:281:8300:73::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 0BBAE2C0;
        Mon, 17 Jul 2023 13:47:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 0BBAE2C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1689601635; bh=Omb4vPBCaiMwm8AHjCa2ADVUAYBY5TtUwOXg+kxz7fo=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=MGKFILpBEmc+1EQtb8630j8axMgT4KsUd7PpqpvmuZ5XVJGZpqxTp68xLkacESdc0
         IxMVXpsMmpeq2VzOq6Hpeh4N2PuJE7+jm9WEw4IUmWkq6vp5HZQJNhwK8yhfu3fYjZ
         iCjb5QPtYQdNp5MxYUGmz7u2KqERH0Gu17ySvDVRPSuLxNBYF6ZJ8llWEhoOR8IDlh
         y+TjPtlxWIIPavHU2OcZmKWjwRNokIGaW46uhp0N9kVJvEOj0pwHAxQjJRTRcuKp0d
         7Z4+LS1LmjfwQ58wrxQN0beBYV1mPC5MVNk5UberNJXW1WbLUXtcMHqKuTVXDdECAq
         v8c2xLaII6seA==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Costa Shulyupin <costa.shul@redhat.com>, linux-doc@vger.kernel.org,
        kernelnewbies@kernelnewbies.org
Cc:     open list <linux-kernel@vger.kernel.org>
Subject: Re: confusing changes in the documentation table of contents
In-Reply-To: <CADDUTFyArtN--_27xLWpqnBM2e_udmL+E6Ka7KgimTUOguWthg@mail.gmail.com>
References: <CADDUTFyArtN--_27xLWpqnBM2e_udmL+E6Ka7KgimTUOguWthg@mail.gmail.com>
Date:   Mon, 17 Jul 2023 07:47:14 -0600
Message-ID: <87ilaiwsyl.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Costa Shulyupin <costa.shul@redhat.com> writes:

> Hi,
>
> In https://www.kernel.org/doc/html/v6.2/ Table of Contents consisted
> of 10 items. It was compact, organized and observable:
>
> The Linux Kernel documentation
> - Working with the development community
> - Internal API manuals
> - Development tools and processes
> - User-oriented documentation
> - Firmware-related documentation
> - Architecture-specific documentation
> - Other documentation
> - Translations
> Indices and tables
>
> Since  https://www.kernel.org/doc/html/v6.3/ it consists of 60+ items.
> Now it is long, unorganized and unobservable:

By "table of contents" you're talking about the left column?  That was
done after I got a bunch of complaints about the alabaster sidebar.  I
agree it's still far from ideal.

jon
