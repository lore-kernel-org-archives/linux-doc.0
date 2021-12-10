Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88072C433F5
	for <linux-doc@archiver.kernel.org>; Fri, 10 Dec 2021 17:37:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238399AbhLJRl2 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 10 Dec 2021 12:41:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45298 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233408AbhLJRl1 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 10 Dec 2021 12:41:27 -0500
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D22BC061746
        for <linux-doc@vger.kernel.org>; Fri, 10 Dec 2021 09:37:52 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id 5E2E0CE2C72
        for <linux-doc@vger.kernel.org>; Fri, 10 Dec 2021 17:37:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D815CC00446;
        Fri, 10 Dec 2021 17:37:47 +0000 (UTC)
Date:   Fri, 10 Dec 2021 12:37:46 -0500
From:   Steven Rostedt <rostedt@goodmis.org>
To:     Masami Hiramatsu <mhiramat@kernel.org>
Cc:     Yanteng Si <siyanteng01@gmail.com>, corbet@lwn.net,
        linux-doc@vger.kernel.org, akiyks@gmail.com,
        Yanteng Si <siyanteng@loongson.cn>
Subject: Re: [PATCH v2] docs/trace: fix a label of boottime-trace
Message-ID: <20211210123746.1774f294@gandalf.local.home>
In-Reply-To: <20211210141936.56fb2cfb71e057148cef15c7@kernel.org>
References: <20211210041536.1446734-1-siyanteng@loongson.cn>
        <20211210141936.56fb2cfb71e057148cef15c7@kernel.org>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, 10 Dec 2021 14:19:36 +0900
Masami Hiramatsu <mhiramat@kernel.org> wrote:

> On Fri, 10 Dec 2021 12:15:36 +0800
> Yanteng Si <siyanteng01@gmail.com> wrote:
> 
> > Since 559789539255 ("Documentation: tracing: Add histogram syntax to boot-time tracing") which
> > introduced a warning:
> > 
> > linux/Documentation/trace/boottime-trace.rst:136: WARNING: undefined label: histogram (if the link has no caption the label must precede a section header)
> > 
> > Replace with: (path)
> >   
> 
> Looks good to me.
> 
> Acked-by: Masami Hiramatsu <mhiramat@kernel.org>
> Fixes: 559789539255 ("Documentation: tracing: Add histogram syntax to boot-time tracing")

Acked-by: Steven Rostedt (VMware) <rostedt@goodmis.org>

Jon, care to take this through your tree?

Thanks!

-- Steve
