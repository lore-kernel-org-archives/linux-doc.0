Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 6878E7DE79
	for <lwn-linux-doc@archive.lwn.net>; Thu, 10 May 2018 13:30:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S935285AbeEJNaS (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 10 May 2018 09:30:18 -0400
Received: from ms.lwn.net ([45.79.88.28]:56974 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S934693AbeEJNaS (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 10 May 2018 09:30:18 -0400
Received: from localhost.localdomain (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 8F231318;
        Thu, 10 May 2018 13:30:16 +0000 (UTC)
Date:   Thu, 10 May 2018 07:30:12 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Cc:     Christoph Hellwig <hch@infradead.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@infradead.org>,
        linux-kernel@vger.kernel.org, Ingo Molnar <mingo@redhat.com>,
        Peter Zijlstra <peterz@infradead.org>
Subject: Re: [PATCH 13/18] wait: wait.h: Get rid of a kernel-doc/Sphinx
 warnings
Message-ID: <20180510073012.5902088e@lwn.net>
In-Reply-To: <20180510063805.1859b1aa@vento.lan>
References: <cover.1525684985.git.mchehab+samsung@kernel.org>
        <6b9b3184cbfabab1ad89c974ddf1c61631e8f1bf.1525684985.git.mchehab+samsung@kernel.org>
        <20180510083838.GA21846@infradead.org>
        <20180510063805.1859b1aa@vento.lan>
Organization: LWN.net
X-Mailer: Claws Mail 3.15.1-dirty (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, 10 May 2018 06:38:05 -0300
Mauro Carvalho Chehab <mchehab+samsung@kernel.org> wrote:

> (Peter said):
> > Independent of any philosophical discussion not allowing a setence to
> > end with a single ':' is completely idiotic.  Please fix the tooling
> > instead to allow it, as it is very important for being able to just
> > write understandable comments.  

FWIW, there's no problem with a sentence ending with a single colon.
It's only an issue if you want to flag a special interpretation for the
text that follows that sentence.  Just to be precise.

> Patches are welcome, although I don't see any easy way to solve it.

I could envision some sort of heuristic that would recognize an indented
block containing code.  Probably we could go simpler and force the
"literal block" treatment for any indented block that lacks explicit
enumeration markers.  So:

	this->would_be("a literal block");

but:

  - This would not be

Such a thing would likely be a bit fragile (people feel, rightly, that
they can put anything into normal text) but it might just work well
enough.  For best results, it should probably be done as part of Sphinx
itself, rather than yet another ugly hack in the kerneldoc script.

This particular problem may be solvable, and I'll look into it, but not
right away.  The offline world is being rather insistently obnoxious
these days...

jon
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
