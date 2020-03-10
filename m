Return-Path: <SRS0=92oT=43=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3CE7C10F27
	for <linux-doc@archiver.kernel.org>; Tue, 10 Mar 2020 17:49:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id BDDF420727
	for <linux-doc@archiver.kernel.org>; Tue, 10 Mar 2020 17:49:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726415AbgCJRtZ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 10 Mar 2020 13:49:25 -0400
Received: from ms.lwn.net ([45.79.88.28]:44374 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726414AbgCJRtZ (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 10 Mar 2020 13:49:25 -0400
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id A45D52E4;
        Tue, 10 Mar 2020 17:49:24 +0000 (UTC)
Date:   Tue, 10 Mar 2020 11:49:23 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     Steven Rostedt <rostedt@goodmis.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Tom Zanussi <zanussi@kernel.org>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        linux-doc@vger.kernel.org
Subject: Re: [PATCH 1/9] docs: trace: events.rst: convert some new stuff to
 ReST format
Message-ID: <20200310114923.5673577d@lwn.net>
In-Reply-To: <20200303154826.2da803ed@gandalf.local.home>
References: <afbe367ccb7b9abcb9fab7bc5cb5e0686c105a53.1583250595.git.mchehab+huawei@kernel.org>
        <20200303154826.2da803ed@gandalf.local.home>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, 3 Mar 2020 15:48:26 -0500
Steven Rostedt <rostedt@goodmis.org> wrote:

> Acked-by: Steven Rostedt (VMware) <rostedt@goodmis.org>
> 
> Jon, let me know if this applies to your tree. If not, I'll take it in mine.

I've applied it, thanks.

jon
