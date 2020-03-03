Return-Path: <SRS0=Succ=4U=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D3D7C3F2D8
	for <linux-doc@archiver.kernel.org>; Tue,  3 Mar 2020 20:48:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 49B3920870
	for <linux-doc@archiver.kernel.org>; Tue,  3 Mar 2020 20:48:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731913AbgCCUs3 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 3 Mar 2020 15:48:29 -0500
Received: from mail.kernel.org ([198.145.29.99]:42388 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730274AbgCCUs3 (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 3 Mar 2020 15:48:29 -0500
Received: from gandalf.local.home (cpe-66-24-58-225.stny.res.rr.com [66.24.58.225])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 7DCC520870;
        Tue,  3 Mar 2020 20:48:28 +0000 (UTC)
Date:   Tue, 3 Mar 2020 15:48:26 -0500
From:   Steven Rostedt <rostedt@goodmis.org>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Jonathan Corbet <corbet@lwn.net>, Tom Zanussi <zanussi@kernel.org>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        linux-doc@vger.kernel.org
Subject: Re: [PATCH 1/9] docs: trace: events.rst: convert some new stuff to
 ReST format
Message-ID: <20200303154826.2da803ed@gandalf.local.home>
In-Reply-To: <afbe367ccb7b9abcb9fab7bc5cb5e0686c105a53.1583250595.git.mchehab+huawei@kernel.org>
References: <afbe367ccb7b9abcb9fab7bc5cb5e0686c105a53.1583250595.git.mchehab+huawei@kernel.org>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue,  3 Mar 2020 16:50:31 +0100
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:

> Some new chapters were added to the documentation. This caused
> Sphinx to complain, as the literal blocks there are not properly
> tagged as such. Also, a new note added there doesn't follow
> the ReST format.
> 
> This fixes the following warnings:
> 
>     Documentation/trace/events.rst:589: WARNING: Definition list ends without a blank line; unexpected unindent.
>     Documentation/trace/events.rst:620: WARNING: Inline emphasis start-string without end-string.
>     Documentation/trace/events.rst:623: WARNING: Inline emphasis start-string without end-string.
>     Documentation/trace/events.rst:626: WARNING: Inline emphasis start-string without end-string.
>     Documentation/trace/events.rst:703: WARNING: Inline emphasis start-string without end-string.
>     Documentation/trace/events.rst:697: WARNING: Inline emphasis start-string without end-string.
>     Documentation/trace/events.rst:722: WARNING: Inline emphasis start-string without end-string.
>     Documentation/trace/events.rst:775: WARNING: Definition list ends without a blank line; unexpected unindent.
>     Documentation/trace/events.rst:814: WARNING: Inline emphasis start-string without end-string.
>     Documentation/trace/events.rst:817: WARNING: Inline emphasis start-string without end-string.
>     Documentation/trace/events.rst:820: WARNING: Inline emphasis start-string without end-string.
>     Documentation/trace/events.rst:823: WARNING: Inline emphasis start-string without end-string.
>     Documentation/trace/events.rst:826: WARNING: Inline emphasis start-string without end-string.
>     Documentation/trace/events.rst:829: WARNING: Inline emphasis start-string without end-string.
>     Documentation/trace/events.rst:832: WARNING: Inline emphasis start-string without end-string.
>     Documentation/trace/events.rst:844: WARNING: Unexpected indentation.
>     Documentation/trace/events.rst:845: WARNING: Block quote ends without a blank line; unexpected unindent.
>     Documentation/trace/events.rst:849: WARNING: Unexpected indentation.
>     Documentation/trace/events.rst:850: WARNING: Block quote ends without a blank line; unexpected unindent.
>     Documentation/trace/events.rst:883: WARNING: Inline emphasis start-string without end-string.
>     Documentation/trace/events.rst:886: WARNING: Inline emphasis start-string without end-string.
>     Documentation/trace/events.rst:889: WARNING: Inline emphasis start-string without end-string.
>     Documentation/trace/events.rst:895: WARNING: Bullet list ends without a blank line; unexpected unindent.
>     Documentation/trace/events.rst:895: WARNING: Inline emphasis start-string without end-string.
>     Documentation/trace/events.rst:968: WARNING: Inline emphasis start-string without end-string.
> 
> Fixes: 34ed63573b66 ("tracing: Documentation for in-kernel synthetic event API")
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
>

Acked-by: Steven Rostedt (VMware) <rostedt@goodmis.org>

Jon, let me know if this applies to your tree. If not, I'll take it in mine.

-- Steve
