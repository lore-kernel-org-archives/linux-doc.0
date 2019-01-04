Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI
	autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 2BB947D08A
	for <lwn-linux-doc@archive.lwn.net>; Fri,  4 Jan 2019 02:12:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726102AbfADCMZ (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 3 Jan 2019 21:12:25 -0500
Received: from bombadil.infradead.org ([198.137.202.133]:33298 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726093AbfADCMZ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 3 Jan 2019 21:12:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
        :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=/IGAFm0DToSIUCWQ0ouldW/qf/VZal4Cb6BeiKoy7vU=; b=P3yplPoW5QNfGbad/2dT1ua4f
        wRZUNc03/w2v2Mwy0AbGuPo3CM8gVd93G03PeSvfzRGlxleqL3qwJJucnB9JBNMeVuQrx9dTMIMT+
        JviUqjhRUvpW8cJZ2dGOPqpgqiebmYZLOZqOtPfSj2Op0S+xgvM9zvMskWO/lsovLTwNF2ZAvVkTA
        NUkmJAv6qsP6tjhmMaiXztElo7jQpn4+oCJqo72Un6P9/3h5qrhGHNY9AKamFNB79tA27V/6QVj1T
        5vv5QSDtdVmd+OeHqRhJ+W2Ya2q9Tk9kqiJ+cgqEyhlavsi2NUAzDyOAPkMrFYKqJp75EizkNlfsW
        VFoyPdc9Q==;
Received: from willy by bombadil.infradead.org with local (Exim 4.90_1 #2 (Red Hat Linux))
        id 1gfEyD-0003nI-MT; Fri, 04 Jan 2019 02:12:21 +0000
Date:   Thu, 3 Jan 2019 18:12:21 -0800
From:   Matthew Wilcox <willy@infradead.org>
To:     Bart Van Assche <bvanassche@acm.org>
Cc:     Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        "Geyslan G . Bem" <geyslan@gmail.com>,
        Tiago Natel de Moura <tiago4orion@gmail.com>,
        Alison Chaiken <alison_chaiken@mentor.com>,
        Joe Perches <joe@perches.com>,
        Federico Vaga <federico.vaga@vaga.pv.it>,
        Zhang Le <r0bertz@gentoo.org>, Li Yang <leo@zh-kernel.org>
Subject: Re: [PATCH] Documentation/CodingStyle: Move emacs settings into
 .dir-locals.el
Message-ID: <20190104021221.GS6310@bombadil.infradead.org>
References: <20190104003957.82220-1-bvanassche@acm.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190104003957.82220-1-bvanassche@acm.org>
User-Agent: Mutt/1.9.2 (2017-12-15)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Jan 03, 2019 at 04:39:57PM -0800, Bart Van Assche wrote:
> @@ -571,50 +571,11 @@ item, explaining its use.
>  9) You've made a mess of it
>  ---------------------------
>  
> -That's OK, we all do.  You've probably been told by your long-time Unix
> -user helper that ``GNU emacs`` automatically formats the C sources for
> -you, and you've noticed that yes, it does do that, but the defaults it
> -uses are less than desirable (in fact, they are worse than random
> -typing - an infinite number of monkeys typing into GNU emacs would never
> -make a good program).

I feel like this patch makes the mistake a lot of doc patches do ... it
removes some of the whimsical humourous comments that have been with
us for years.  I don't think this paragraph needs to be changed in
the slightest.

> -So, you can either get rid of GNU emacs, or change it to use saner
> -values.  To do the latter, you can stick the following in your .emacs file:
> -
[...]
> -
> -This will make emacs go better with the kernel coding style for C
> -files below ``~/src/linux-trees``.
> +``GNU emacs`` automatically formats the C sources for you. However,
> +the defaults it uses are less than desirable. Use a version of emacs
> +that support directory local variables such that it automatically
> +picks up the settings from .dir-locals.el in the kernel top level
> +directory.

How about:

So, you can either get rid of GNU emacs, or change it to use saner
defaults.  Versions of emacs since [...] support directory local
variables and will pick up the settings from .dir-locals.el in the
kernel top level directory.
