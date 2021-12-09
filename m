Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CCFEC433EF
	for <linux-doc@archiver.kernel.org>; Thu,  9 Dec 2021 14:54:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239005AbhLIO5j (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 9 Dec 2021 09:57:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39340 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239004AbhLIO5i (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 9 Dec 2021 09:57:38 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1BF98C061746
        for <linux-doc@vger.kernel.org>; Thu,  9 Dec 2021 06:54:05 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id D99D6B82413
        for <linux-doc@vger.kernel.org>; Thu,  9 Dec 2021 14:54:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07530C004DD;
        Thu,  9 Dec 2021 14:54:01 +0000 (UTC)
Date:   Thu, 9 Dec 2021 09:54:00 -0500
From:   Steven Rostedt <rostedt@goodmis.org>
To:     Akira Yokosawa <akiyks@gmail.com>
Cc:     Yanteng Si <siyanteng01@gmail.com>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Yanteng Si <siyanteng@loongson.cn>
Subject: Re: [PATCH] docs/trace: fix a label of boottime-trace
Message-ID: <20211209095400.68c55642@gandalf.local.home>
In-Reply-To: <374c6a63-c118-a60f-e455-3d4014f15cab@gmail.com>
References: <20211209091133.558744-1-siyanteng@loongson.cn>
        <374c6a63-c118-a60f-e455-3d4014f15cab@gmail.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, 9 Dec 2021 23:37:16 +0900
Akira Yokosawa <akiyks@gmail.com> wrote:

> > --- a/Documentation/trace/boottime-trace.rst
> > +++ b/Documentation/trace/boottime-trace.rst
> > @@ -133,7 +133,7 @@ action option, there are tree-style options under per-event 'hist' subkey
> >  for the histogram actions. For the detail of the each parameter,
> >  please read the event histogram document [3]_.
> >  
> > -.. [3] See :ref:`Documentation/trace/histogram.rst <histogram>`
> > +.. [3] See :histogram: Documentation/trace/histogram.rst  
> 
> This does not look like a right change.
> Where did that ":histogram:" come from?

I'm guessing from "<histogram>" that's in the line being deleted.

-- Steve
