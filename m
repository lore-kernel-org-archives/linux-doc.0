Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51FC0C48BCF
	for <linux-doc@archiver.kernel.org>; Sat, 12 Jun 2021 19:33:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 20BA061186
	for <linux-doc@archiver.kernel.org>; Sat, 12 Jun 2021 19:33:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229874AbhFLTfi (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 12 Jun 2021 15:35:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229753AbhFLTfh (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 12 Jun 2021 15:35:37 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81578C061574
        for <linux-doc@vger.kernel.org>; Sat, 12 Jun 2021 12:33:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=OI45KJcmolVtwD2KzD4u/zRX4TFvk2QCpsgs/2MLkmE=; b=JlcPmQmEVDsDtSIms4lj+VrB3c
        4SgwcxlJrrXlWzBFGqxatFdPdXILPZDT7rKJ7EcnB3pvQKkw+kKERh+WBiC7AlrsrgbZEIGft0tNa
        FSxLz4cS4i9+t745hG3BMNHTU58SvgUxHol4qG1veXa6c1rprL0xsZ3KlVzS7FEWPosg+NMnNZMsX
        rqYt7FTxTn9Zwm7lUSbY1lb8B23d734WnNyIkZ8zvpeAuLpgm8yRrJih4QzVH+5yFnLC6nARxTQ6b
        l0WHa7EZAGij1DmKOLiK1KWU44ZHGGM+MxxT3x0MBmo1oigRszZHlE7qFhYn8DJ0S+2eqLhRxDj91
        6SZND/Mw==;
Received: from willy by casper.infradead.org with local (Exim 4.94 #2 (Red Hat Linux))
        id 1ls9Nr-003x6m-Ja; Sat, 12 Jun 2021 19:33:33 +0000
Date:   Sat, 12 Jun 2021 20:33:31 +0100
From:   Matthew Wilcox <willy@infradead.org>
To:     Grzegorz Zdanowski <grzegorz129@gmail.com>
Cc:     linux-doc@vger.kernel.org
Subject: Re: Are documentation-only patches welcomed?
Message-ID: <YMUMC7CTLNJeuOP8@casper.infradead.org>
References: <CAAoDVDDCWKw9_uh6i70zW6uCH_bvuBWyQV7u=TW_ne9CaWA0rQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAAoDVDDCWKw9_uh6i70zW6uCH_bvuBWyQV7u=TW_ne9CaWA0rQ@mail.gmail.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sat, Jun 12, 2021 at 12:26:06PM -0500, Grzegorz Zdanowski wrote:
> Hi!
> 
> While dipping my toes in Linux kernel programming I discovered that a
> lot of functions, even exported ones, lack any comment blocks or
> references to documentation. Most of the time I have to resort to the
> original commit message + LKML threads associated with a given
> function.
> 
> Is this intentional, or is it simply a by-product of the lack of
> developer's time? If it's the latter, are documentation-only patches
> welcomed?

Absolutely welcome.

I would suggest that you focus on a particular subsystem so that you
get really deeply knowledgable about it and the bits of the kernel it
interacts with.  Also that you work with/through the maintainer and
mailing list for that part of the kernel rather than with linux-doc.
You can always cc linux-doc, of course, for getting review from people
who have expertise in documentation writing, but domain-specific expertise
is also needed.
