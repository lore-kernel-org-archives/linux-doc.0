Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02456C433EF
	for <linux-doc@archiver.kernel.org>; Fri, 18 Mar 2022 04:32:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232382AbiCREdS (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 18 Mar 2022 00:33:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46746 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231846AbiCREdS (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 18 Mar 2022 00:33:18 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5D43247836
        for <linux-doc@vger.kernel.org>; Thu, 17 Mar 2022 21:31:59 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 8F159B82164
        for <linux-doc@vger.kernel.org>; Fri, 18 Mar 2022 04:31:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0997AC340E8;
        Fri, 18 Mar 2022 04:31:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1647577917;
        bh=VgLtfPS5g2gN0R7TeIWedNsoc4yKHrDeDwJifEJDoSM=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=B+tZfTxc7nLYFgpte/wnKlJyI2qqmi+RCgIkc5L0+W1UHXcyjiXzGLIyrs7HfEZqi
         C6kGuL4BDeUTZD3LAa53jqHCF2g1SOUGqnIuxzCHEytPMpHOCFuWNElYEoMbpm+pqP
         hcM5ZxwhujM9D1s+Y0zYpUmdSgB748ZhPy2n4B30jDaQ9Ir+nVARdwiF7UY27QfCmq
         +ZOUXJFGqDe7M8PpWtVWN++HYvUNAiWTpTwAawaQuaYPtM5D7Y+jDkoA/Cn1GThFDG
         hi/LTxmCuSJsrTat2qsSmd4HK/YoePTweHPDoE9kBkGNQsV4yeZQV/GpVB5ERYmCJ7
         TjjseO0ghkzBg==
Date:   Fri, 18 Mar 2022 13:31:53 +0900
From:   Masami Hiramatsu <mhiramat@kernel.org>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     kushagra765@outlook.com, linux-doc@vger.kernel.org,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>
Subject: Re: [ PATCH ] Documentation: fixed typos
Message-Id: <20220318133153.9c96b904d251faf29808dc3d@kernel.org>
In-Reply-To: <82331905-8b04-ccd4-0317-384ad16bb4bb@infradead.org>
References: <SI2PR01MB3929000E406A2DCA53A25F55F8129@SI2PR01MB3929.apcprd01.prod.exchangelabs.com>
        <82331905-8b04-ccd4-0317-384ad16bb4bb@infradead.org>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, 17 Mar 2022 08:28:58 -0700
Randy Dunlap <rdunlap@infradead.org> wrote:

> 
> 
> On 3/17/22 08:25, kushagra765@outlook.com wrote:
> > From ade08e81a63db0faf39791f9cd7c87e5787186f5 Mon Sep 17 00:00:00 2001
> > From: Kushagra Verma <kushagra765@outlook.com>
> > Date: Thu, 17 Mar 2022 20:37:36 +0530
> > Subject: [PATCH] Documentation: fixed typos
> > 
> >    1. Documentation/admin-guide/bootconfig.rst:207: fixed a typo in the word 'concatenated`
> >    2. Documentation/atomic_t.txt:327: fixed a typo in the word `architecture`
> > 
> > Signed-off-by: Kushagra Verma <kushagra765@outlook.com>
> 
> Acked-by: Randy Dunlap <rdunlap@infradead.org>
> 
> for the text changes.
> But you should Cc one or more maintainers and the file's "owner". (done now)

Thanks Randy,

Acked-by: Masami Hiramatsu <mhiramat@kernel.org>

> 
> > ---
> >  Documentation/admin-guide/bootconfig.rst | 2 +-
> >  Documentation/atomic_t.txt               | 2 +-
> >  2 files changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/Documentation/admin-guide/bootconfig.rst b/Documentation/admin-guide/bootconfig.rst
> > index a1860fc0ca88..d4ea063aca0c 100644
> > --- a/Documentation/admin-guide/bootconfig.rst
> > +++ b/Documentation/admin-guide/bootconfig.rst
> > @@ -204,7 +204,7 @@ In addition to the kernel command line, the boot config can be used for
> >  passing the kernel parameters. All the key-value pairs under ``kernel``
> >  key will be passed to kernel cmdline directly. Moreover, the key-value
> >  pairs under ``init`` will be passed to init process via the cmdline.
> > -The parameters are concatinated with user-given kernel cmdline string
> > +The parameters are concatenated with user-given kernel cmdline string
> >  as the following order, so that the command line parameter can override
> >  bootconfig parameters (this depends on how the subsystem handles parameters
> >  but in general, earlier parameter will be overwritten by later one.)::
> > diff --git a/Documentation/atomic_t.txt b/Documentation/atomic_t.txt
> > index 0f1ffa03db09..d7adc6d543db 100644
> > --- a/Documentation/atomic_t.txt
> > +++ b/Documentation/atomic_t.txt
> > @@ -324,7 +324,7 @@ atomic operations.
> >  
> >  Specifically 'simple' cmpxchg() loops are expected to not starve one another
> >  indefinitely. However, this is not evident on LL/SC architectures, because
> > -while an LL/SC architecure 'can/should/must' provide forward progress
> > +while an LL/SC architecture 'can/should/must' provide forward progress
> >  guarantees between competing LL/SC sections, such a guarantee does not
> >  transfer to cmpxchg() implemented using LL/SC. Consider:
> >  
> 
> thanks.
> -- 
> ~Randy


-- 
Masami Hiramatsu <mhiramat@kernel.org>
