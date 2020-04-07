Return-Path: <SRS0=OmAX=5X=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C03C5C2D0EC
	for <linux-doc@archiver.kernel.org>; Tue,  7 Apr 2020 19:24:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 884B82076E
	for <linux-doc@archiver.kernel.org>; Tue,  7 Apr 2020 19:24:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726718AbgDGTYo (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 7 Apr 2020 15:24:44 -0400
Received: from ms.lwn.net ([45.79.88.28]:40558 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726705AbgDGTYn (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 7 Apr 2020 15:24:43 -0400
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 79ADE728;
        Tue,  7 Apr 2020 19:24:43 +0000 (UTC)
Date:   Tue, 7 Apr 2020 13:24:42 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     Lothar Rubusch <l.rubusch@gmail.com>
Cc:     linux-doc@vger.kernel.org
Subject: Re: [PATCH] Documentation: memory - fix warning
Message-ID: <20200407132442.72d19de7@lwn.net>
In-Reply-To: <20200406220743.22183-1-l.rubusch@gmail.com>
References: <20200406220743.22183-1-l.rubusch@gmail.com>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon,  6 Apr 2020 22:07:43 +0000
Lothar Rubusch <l.rubusch@gmail.com> wrote:

> The label in sphinx can refer to a document section but not to the document
> header.
> 
> The handle 'memory_allocation' is used in another document(s) to refer to
> GFP_KERNEL flags description in this modified document.
> 
> Since the sphinx label does not work as it is placed here, a proposal is to
> better shift it to the section about memory allocation flags.
> 
> Signed-off-by: Lothar Rubusch <l.rubusch@gmail.com>

So I don't see any warnings associated with this label; what are you
seeing and how are you getting it?  Which version of Sphinx are you
running?

Thanks,

jon
