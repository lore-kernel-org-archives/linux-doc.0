Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE
	autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 096977D919
	for <lwn-linux-doc@archive.lwn.net>; Mon, 18 Nov 2019 18:52:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726776AbfKRSwZ (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 18 Nov 2019 13:52:25 -0500
Received: from ms.lwn.net ([45.79.88.28]:60414 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726370AbfKRSwY (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 18 Nov 2019 13:52:24 -0500
Received: from localhost.localdomain (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id E09529A8;
        Mon, 18 Nov 2019 18:52:23 +0000 (UTC)
Date:   Mon, 18 Nov 2019 11:52:22 -0700
From:   Jonathan Corbet <corbet@lwn.net>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Kees Cook <keescook@chromium.org>
Subject: Re: [PATCH] Documentation: Document how to get links with git am
Message-ID: <20191118115222.77fa9930@lwn.net>
In-Reply-To: <CACRpkdbr=y6eApvZcqnaU0He+B5QBE9JCezuQhEjEjpU5ZHW1A@mail.gmail.com>
References: <20191115133021.13165-1-linus.walleij@linaro.org>
        <20191115130017.46d77037@lwn.net>
        <CACRpkdbr=y6eApvZcqnaU0He+B5QBE9JCezuQhEjEjpU5ZHW1A@mail.gmail.com>
Organization: LWN.net
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sat, 16 Nov 2019 00:32:35 +0100
Linus Walleij <linus.walleij@linaro.org> wrote:

> > Seems generally useful.  I have a couple of overall questions...
> >
> >  - Might this be better placed in the maintainer manual?  It is more
> >    likely to be relevant to that audience, methinks.  
> 
> Oh that exists now, Documentation/maintainer? Sure I fix.

Indeed it exists...it's a little sparse at the moment, but that's what
I'm trying to improve...:)

> >  - I wonder if the hook script should just go under tools/ somewhere for
> >    people to grab.  
> 
> Does one exclude the other?
> 
> Can we place it under tools/scripts/git and somehow source the contents into
> this file so you can also see it?

That could be done...something like:

	.. include:: ../../scripts/git/add-link
		:literal:

should do it...obviously adjusted for the actual name and location of the
script.

Of course, cutting the script from the document isn't all that big a deal
either; that was mostly just me wondering.

Thanks,

jon
