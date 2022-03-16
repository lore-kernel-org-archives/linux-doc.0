Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF8B0C433F5
	for <linux-doc@archiver.kernel.org>; Wed, 16 Mar 2022 21:52:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344206AbiCPVxt convert rfc822-to-8bit (ORCPT
        <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 16 Mar 2022 17:53:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238254AbiCPVxs (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 16 Mar 2022 17:53:48 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF87511C28
        for <linux-doc@vger.kernel.org>; Wed, 16 Mar 2022 14:52:33 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 4CD28615A2
        for <linux-doc@vger.kernel.org>; Wed, 16 Mar 2022 21:52:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09AD3C340E9;
        Wed, 16 Mar 2022 21:52:31 +0000 (UTC)
Date:   Wed, 16 Mar 2022 17:52:30 -0400
From:   Steven Rostedt <rostedt@goodmis.org>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Roland Hieber <rhi@pengutronix.de>, Ingo Molnar <mingo@redhat.com>,
        Daniel Bristot de Oliveira <bristot@kernel.org>,
        linux-doc@vger.kernel.org
Subject: Re: [PATCH 1/3] docs: tracing: use refs for cross-referencing
Message-ID: <20220316175230.25e0efaf@gandalf.local.home>
In-Reply-To: <87fsnhsh4n.fsf@meer.lwn.net>
References: <20220313105557.172732-1-rhi@pengutronix.de>
        <20220313195519.78b96a2c@rorschach.local.home>
        <20220314114644.6unqdbpxcsqin3qu@pengutronix.de>
        <87fsnhsh4n.fsf@meer.lwn.net>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, 16 Mar 2022 15:48:56 -0600
Jonathan Corbet <corbet@lwn.net> wrote:

> > The main point of this series was to get rid of the manually numbered
> > sections (which the next patch does). Relying on manual section numbers
> > for cross-referencing is error-prone, which my first iteration of the
> > patch already showed… Unfortunately, the sphinx reST syntax is not very
> > flexible here.  
> 
> I agree on the removal of the numbered sections.  Those always end up
> being wrong after a while.
> 
> > I could imagine leaving the file names in when a reference points to a
> > different document, like in this hunk:
> >  
> >> > -set_ftrace_filter 'ftrace filter commands' (see the 'Filter commands'
> >> > -section of Documentation/trace/ftrace.rst), but there are major
> >> > +set_ftrace_filter 'ftrace filter commands' (see the section
> >> > +:ref:`ftrace_filter_commands`), but there are major  
> 
> In general, all of those references and labels clutter the source
> considerably and aren't hugely useful to readers of the plain-text
> documents.  There are times when they are the best thing to do, but I
> think that moderation is indicated.  Just giving the file name will
> generate a cross-reference to that file; I would hope that would be
> enough most of the time.

I agree on both points.

Thanks Jon.

-- Steve
