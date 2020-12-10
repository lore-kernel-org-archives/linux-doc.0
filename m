Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74D83C2BBCA
	for <linux-doc@archiver.kernel.org>; Thu, 10 Dec 2020 23:04:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 44D4123BA7
	for <linux-doc@archiver.kernel.org>; Thu, 10 Dec 2020 23:04:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726448AbgLJXDS (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 10 Dec 2020 18:03:18 -0500
Received: from ms.lwn.net ([45.79.88.28]:55636 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726018AbgLJXCr (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 10 Dec 2020 18:02:47 -0500
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 453F82DC;
        Thu, 10 Dec 2020 23:02:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 453F82DC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1607641326; bh=f186HpL5h6WRko7zs98ZnxC+LlTnCDnh4fbiQUDuvBc=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=abUrowtlbjPUZM/AfVgb4dgZAyzBovjjnmaCPSfeYQ7PIPsKiIM8UjROpT749b2GB
         8zyclJJ/TsdqsJFOkfQCbilWm7I3tEmhtAJz2fDqMdEM0n80JaHiRUUqo3nRoVC4HN
         1JGOFI4/osjFrhiBcllFP93zrzSuHzMTms/a3xi3lT5MOpaqNSZHgj11TxyeYwc9pE
         vvWHN8BLDuzhEFk/xO9dRvGE2FCJJSC3eTm9jWpwwThAQHF9hGS/cVDWVjal2ePrJB
         DOjjZBnMBs/J9DzvyjsT8djub+zNItLVLLlqqPfe/r6KQKPxjLkVbqUp0ejzui/ELn
         WwxkDpGJiIZZQ==
Date:   Thu, 10 Dec 2020 16:02:05 -0700
From:   Jonathan Corbet <corbet@lwn.net>
To:     JaeSang Yoo <js.yoo.5b@gmail.com>
Cc:     mchehab+huawei@kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.org, markus.heiser@darmarit.de
Subject: Re: [PATCH] docs: update requirements to install six module
Message-ID: <20201210160205.56bb9060@lwn.net>
In-Reply-To: <CAHdLnN2b5viH--nuqEERePQd47inF9cYqFLaThd3VVAvz5u76g@mail.gmail.com>
References: <20201208014628.GA1361@JSYoo5B-Base.localdomain>
        <20201209172903.7990f71b@lwn.net>
        <CAHdLnN2b5viH--nuqEERePQd47inF9cYqFLaThd3VVAvz5u76g@mail.gmail.com>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, 10 Dec 2020 12:39:42 +0900
JaeSang Yoo <js.yoo.5b@gmail.com> wrote:

> While I was surveying the Sphinx library, it requires Python version
> 3.5 as a minimum.
> You can figure it out in the setup.py of Sphinx library source:
> https://github.com/sphinx-doc/sphinx/blob/72ad5f2a/setup.py#L13-L15

That, of course, applies to current Sphinx releases. We have people
building with older releases, though, which still work with Python 2.

> I assume this would be a certain reason to leave Python 2 behind. The
> Sphinx check script recommends using virtualenv. How do you think
> about leaving Python 2 compatibility issue in this documentation
> script range?

I'm sorry, I don't quite understand your question.

Thanks,

jon
