Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 145B4C6FA82
	for <linux-doc@archiver.kernel.org>; Fri, 23 Sep 2022 08:55:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230383AbiIWIzO (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 23 Sep 2022 04:55:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45716 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231409AbiIWIzN (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 23 Sep 2022 04:55:13 -0400
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [IPv6:2a01:488:42:1000:50ed:8234::])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18FA87B784;
        Fri, 23 Sep 2022 01:55:10 -0700 (PDT)
Received: from [2a02:8108:963f:de38:eca4:7d19:f9a2:22c5]; authenticated
        by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
        id 1obeSi-0007LE-IZ; Fri, 23 Sep 2022 10:55:08 +0200
Message-ID: <7f02143c-461f-268b-0f17-7fe20a7423d6@leemhuis.info>
Date:   Fri, 23 Sep 2022 10:55:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Content-Language: en-US, de-DE
To:     Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, Kees Cook <keescook@chromium.org>,
        Jani Nikula <jani.nikula@linux.intel.com>
References: <20220922204138.153146-1-corbet@lwn.net>
From:   Thorsten Leemhuis <linux@leemhuis.info>
Subject: Re: [PATCH v2 0/4] Rewrite the top-level index.rst
In-Reply-To: <20220922204138.153146-1-corbet@lwn.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;linux@leemhuis.info;1663923311;751ff017;
X-HE-SMSGID: 1obeSi-0007LE-IZ
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


On 22.09.22 22:41, Jonathan Corbet wrote:
> The top-level index.rst file is the entry point for the kernel's
> documentation, especially for readers of the HTML output.  It is currently
> a mess containing everything we thought to throw in there.  Firefox says it
> would require 26 pages of paper to print it.  That is not a user-friendly
> introduction.

That's true, but is it maybe good or even important for googleability?
When you talked about this in your LPC talk this went on in the matrix chat:

```
Nur Hussein
I feel like every existing page needs to be accessible (somehow)
from that starting page

Zsuzsa Nagy

access to all pages <- findability from a search engine (technical
author talking here)

step #2 in-site search for those who already landed on your pages
```

It looks to me like Zsuzsa shared a lot of valuable comments on the chat
during the talk. I wonder if we should bring Zsuzsa into this discussion
before heading in a wrong direction, as that might result in some back
and forth that just confuses people reading the docs.

Maybe we should try to get even more people into the discussion that
write docs for a living. I guess there might be some people at Red Hat,
SUSE, or open source projects that have actual experience in bringing
structure into a big chunk of texts of a large open source project. Not
sure if we can get them to help us, but I guess it's worth a try.

> This series aims to improve our documentation entry point with a focus on
> rewriting index.rst.  The result is, IMO, simpler and more approachable.
> For anybody who wants to see the rendered results without building the
> docs, have a look at:
> 
>   https://static.lwn.net/kerneldoc/

I still think we're doing all this to build something for users and
hence docs for users should be at the top spot. I'd even think "those
people are selfish" if I'd look into the docs of a software and find
texts for developers at the top spot.

> Unless I get screams I plan to slip this into 6.1.  It is definitely not
> the final form of the front page, but I doubt we'll ever get there; we can
> change it in whatever ways make sense.

My 2 cent: why the rush? I'd say: let's try to get some feedback from
Zsuzsa and experts on docs first. I'd be willing to approach them. If
that doesn't work out over the next few weeks, just merge what you have
for 6.2.

Ciao, Thorsten
