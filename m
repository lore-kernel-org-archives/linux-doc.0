Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADABBC433B4
	for <linux-doc@archiver.kernel.org>; Fri, 21 May 2021 11:07:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8990B613D8
	for <linux-doc@archiver.kernel.org>; Fri, 21 May 2021 11:07:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233790AbhEULJD (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 21 May 2021 07:09:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52366 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232440AbhEULJB (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 21 May 2021 07:09:01 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F3E0C061574;
        Fri, 21 May 2021 04:07:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=ObNNvk5ry4Rr/23+NfAGXtBimeOIxIPRf038SU5RHOk=; b=FiEhqrcV/GkVBKgagTj9LwzKlS
        ehpgH945UknxJ9sgb3O2EYL9bYQ4OjZ/DkJyE6SykCStVyvy/EoaJU8YLkE+7OasGKSGMGxAUjWJw
        uoORuNWcMuFLn48ExE0zp7IjteKa32YGNQKnfZVo8ebharrJ9nKhtUYHS3f6+gSet88UikupQprbG
        2CSZ43d6mrqB/luL93c05Rz2YwOLgLK1AGwBtXrtkWHzg4eec/6rlFnDV3VxkY3TX8U5Ql7ZU5HvC
        L0lHejuFjOIkpRW8GL2wDwTprbvYyyH5IihR7Zs0L6luVk32QK5zmgzF7kUuEb2ev4Y3GYSlR20S6
        n/7bZFtQ==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100] helo=noisy.programming.kicks-ass.net)
        by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
        id 1lk2yT-00Gtyb-9M; Fri, 21 May 2021 11:06:20 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (Client did not present a certificate)
        by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id E6053300103;
        Fri, 21 May 2021 13:05:47 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
        id D4EB73119BA4E; Fri, 21 May 2021 13:05:47 +0200 (CEST)
Date:   Fri, 21 May 2021 13:05:47 +0200
From:   Peter Zijlstra <peterz@infradead.org>
To:     Boqun Feng <boqun.feng@gmail.com>
Cc:     Xiongwei Song <sxwjean@me.com>, mingo@redhat.com, will@kernel.org,
        longman@redhat.com, corbet@lwn.net, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, Xiongwei Song <sxwjean@gmail.com>
Subject: Re: [PATCH] docs: lockdep-design: correct the notation for writer
Message-ID: <YKeUC5tSxTMJt9E0@hirez.programming.kicks-ass.net>
References: <1621578594-13237-1-git-send-email-sxwjean@me.com>
 <YKd1aVkojNsx4wrl@boqun-archlinux>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YKd1aVkojNsx4wrl@boqun-archlinux>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, May 21, 2021 at 04:55:05PM +0800, Boqun Feng wrote:
> On Fri, May 21, 2021 at 02:29:54PM +0800, Xiongwei Song wrote:
> > From: Xiongwei Song <sxwjean@gmail.com>
> > 
> > The block condition matrix is using 'E' as the writer noation here, so it
> > would be better to use 'E' as the reminder rather than 'W'.
> > 
> 
> Good catch!
> 
> > Signed-off-by: Xiongwei Song <sxwjean@gmail.com>
> 
> Reviewed-by: Boqun Feng <boqun.feng@gmail.com>

Thanks!
