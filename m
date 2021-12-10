Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BF53C433EF
	for <linux-doc@archiver.kernel.org>; Fri, 10 Dec 2021 00:09:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231592AbhLJAMi (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 9 Dec 2021 19:12:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58508 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229723AbhLJAMi (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 9 Dec 2021 19:12:38 -0500
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90747C061746
        for <linux-doc@vger.kernel.org>; Thu,  9 Dec 2021 16:09:04 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id AAA44CE2990
        for <linux-doc@vger.kernel.org>; Fri, 10 Dec 2021 00:09:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2DCBEC004DD;
        Fri, 10 Dec 2021 00:08:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1639094940;
        bh=OliY98+vu62xVTFxPD0XcfWoHJVcPKvJAwSNxv0p40I=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=QdLqIDtvF6XSqRAja6RjCzLJhif0ZRdyTzf/9DPuYRHo0XQPvFH+2nX3pmzESEDgP
         q+i42JVl1b2UAseh5BWh3WD16Se1rbpYEYvCfVMMalYaxGXkbcHnqxB5/UTG/+sXpv
         7ie2pfmaLOCmZP4xJn4OeQYpgjmxRKdSlJix3zLGns7d9qoJ4xJETj5/LL5Y7Brbr4
         gMx6BmReXooH1geJDmNdayBMUffo1+h0Ro4XRZafxx/ozIO582Q18KFoyNqSnVwrrz
         /Y80BXcAPtiR4Ux4Qrg3K/Vl3hxsoMr5znovPuXAtQMuMwtoINJvNpDh/1f/nUYjHE
         pLzUNYtbJGIdQ==
Date:   Fri, 10 Dec 2021 09:08:56 +0900
From:   Masami Hiramatsu <mhiramat@kernel.org>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Yanteng Si <siyanteng01@gmail.com>, rostedt@goodmis.org,
        linux-doc@vger.kernel.org, Yanteng Si <siyanteng@loongson.cn>
Subject: Re: [PATCH] docs/trace: fix a label of boottime-trace
Message-Id: <20211210090856.e68c25b94cc71581f2299d65@kernel.org>
In-Reply-To: <87pmq5vhmi.fsf@meer.lwn.net>
References: <20211209091133.558744-1-siyanteng@loongson.cn>
        <87y24tvnmo.fsf@meer.lwn.net>
        <20211210011758.0963cbb51a7d4752ccbfe957@kernel.org>
        <87pmq5vhmi.fsf@meer.lwn.net>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, 09 Dec 2021 09:59:49 -0700
Jonathan Corbet <corbet@lwn.net> wrote:

> Masami Hiramatsu <mhiramat@kernel.org> writes:
> 
> > On Thu, 09 Dec 2021 07:50:07 -0700
> > Jonathan Corbet <corbet@lwn.net> wrote:
> >
> >> I don't see that this is going to work either.  Is there any reason not
> >> to just make the text read:
> >> 
> >>    please read the event histogram document Documentation/trace/histogram.rst
> >> 
> >> and let automarkup link it in?
> >
> > Hmm, I think we need the following change instead of this.
> > (the label is not in this document, but in the target document.)
> >
> > diff --git a/Documentation/trace/histogram.rst b/Documentation/trace/histogram.rst
> > index 859fd1b76c63..ea722eae2810 100644
> > --- a/Documentation/trace/histogram.rst
> > +++ b/Documentation/trace/histogram.rst
> > @@ -1,3 +1,5 @@
> > +.. _histogram:
> > +
> 
> That would work, but it will have essentially the same effect as what I
> suggested while adding extra markup.  I think we can leave the label out
> and keep the plain-text a little cleaner.

Indeed. If automarkup makes a link, we don't need the labels.
BTW, it is nicer to brace it.

    please read the event histogram document (Documentation/trace/histogram.rst)

Then, it will be

    please read the event histogram document (Event Histograms)


Yanteng, can you update this patch just putting the document file
as above?

Thank you,

-- 
Masami Hiramatsu <mhiramat@kernel.org>
