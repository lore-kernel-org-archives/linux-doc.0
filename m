Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3E6FC4742C
	for <linux-doc@archiver.kernel.org>; Fri, 13 Nov 2020 22:39:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5D2E022255
	for <linux-doc@archiver.kernel.org>; Fri, 13 Nov 2020 22:39:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="E+466uXz"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726064AbgKMWjT (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 13 Nov 2020 17:39:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51948 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726003AbgKMWjS (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 13 Nov 2020 17:39:18 -0500
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 837DFC0613D1;
        Fri, 13 Nov 2020 14:39:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=1sWnp4xWoSWviiDD1uAEscmQshNS251FQK6w82npo+M=; b=E+466uXzpNs/shBMZwR881bP99
        xhxdKK1ctFWU47M5vckLUcTgM916hgFGQltFU06JOQYkbJsrva/AZ/WlZwZ7KI4AJjhLtu61fmcvR
        EGCKlHDYfJmArEkkQ2z1rblhq82n6hIfmaH0hV9BX8fSu2ZEe0+a4qaNTHfgwEH07TWGjI+07GKsZ
        Fs9S+Fs7DoGCM1xjYUQeZZZ2pYJ6SmD7KNlHJ8gqpQpiTRrq0bm51gM5JisJH8xZ7FfC1iO2EI2k5
        fkGmlNmmvhwGwbGWu1tOKPLNDlmAnhf0urqHrz+23BtmNw2Psi166xr6gDBD39lU2lZYe9XWANGDp
        IHYlzKKA==;
Received: from willy by casper.infradead.org with local (Exim 4.92.3 #3 (Red Hat Linux))
        id 1kdhiq-0001WW-6N; Fri, 13 Nov 2020 22:39:12 +0000
Date:   Fri, 13 Nov 2020 22:39:12 +0000
From:   Matthew Wilcox <willy@infradead.org>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Paolo Bonzini <pbonzini@redhat.com>, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, Eduardo Habkost <ehabkost@redhat.com>
Subject: Re: [PATCH 2/2] kernel-doc: Handle function typedefs without
 asterisks
Message-ID: <20201113223912.GK17076@casper.infradead.org>
References: <20201030144713.201372-1-pbonzini@redhat.com>
 <20201030144713.201372-3-pbonzini@redhat.com>
 <20201113152106.7b4a07ee@lwn.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201113152106.7b4a07ee@lwn.net>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Nov 13, 2020 at 03:21:06PM -0700, Jonathan Corbet wrote:
> On Fri, 30 Oct 2020 15:47:13 +0100
> Paolo Bonzini <pbonzini@redhat.com> wrote:
> 
> > From: Eduardo Habkost <ehabkost@redhat.com>
> > 
> > Example of typedef that was not parsed by kernel-doc:
> > 
> >   typedef void (ObjectUnparent)(Object *obj);
> > 
> > Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
> > Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> 
> So as you've undoubtedly noticed, reading those kernel-doc regexes is ... a
> wee bit on the painful side.  Trying to compare two of them in a patch to
> figure out what you have done is even worse.  I suspect we want these
> patches, but can you please supply a changelog that describes the change? 

Better ... can we have a test suite for the regexes and make patches to
them include updates to the test suite?  They have clearly passed the
point of human understanding ;-)

