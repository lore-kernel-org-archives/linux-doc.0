Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D508C2D0E4
	for <linux-doc@archiver.kernel.org>; Tue, 17 Nov 2020 12:27:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 20D8A2222B
	for <linux-doc@archiver.kernel.org>; Tue, 17 Nov 2020 12:27:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="c2xSO8qz"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727801AbgKQM1z (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 17 Nov 2020 07:27:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726019AbgKQM1z (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 17 Nov 2020 07:27:55 -0500
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F19EC0613CF;
        Tue, 17 Nov 2020 04:27:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=Ob6Oe8aHKU7Bjujs6GOgVFp6Ew5qkHmmaYKvZwb2CbE=; b=c2xSO8qznF4CZ16mWzdjvcrkXa
        2cWZarRBWXc2BB9fz7bcb9y3zaKn621I7hy0zt4xsGoVh0XfwNWwW/jwqzbFzpCXwNJlISs8o5uh2
        T+NP729Ujh6Cua/VwJsj1ynSJTLPYveFp2cCtRFIxc7x/YLyU/kaGa1sweYSCepo8UwIRjIY33NOP
        p5vYB+eymPhzC6y1FjCPhmtyypBK8mIuAKbg+VqU6aoQSlZ4O5cGLB6mbbNTjjpmbgG8AA9RohIZK
        UoF9413SOB7J/9tg/TujMODOl1vzyMi/SJWifbRQeB7nw6q8EANO+h49rkTZSOohwZg4zozkMEHKR
        /YcvPSZg==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100] helo=noisy.programming.kicks-ass.net)
        by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1kf05P-0008MB-Gd; Tue, 17 Nov 2020 12:27:52 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id D95E5301959;
        Tue, 17 Nov 2020 13:27:50 +0100 (CET)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
        id C3FDE203C45DF; Tue, 17 Nov 2020 13:27:50 +0100 (CET)
Date:   Tue, 17 Nov 2020 13:27:50 +0100
From:   Peter Zijlstra <peterz@infradead.org>
To:     Shuah Khan <skhan@linuxfoundation.org>
Cc:     Kees Cook <keescook@chromium.org>,
        Greg KH <gregkh@linuxfoundation.org>, corbet@lwn.net,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 01/13] seqnum_ops: Introduce Sequence Number Ops
Message-ID: <20201117122750.GH3121406@hirez.programming.kicks-ass.net>
References: <cover.1605027593.git.skhan@linuxfoundation.org>
 <d265685c901ea81c83c18e218a29710317ab7670.1605027593.git.skhan@linuxfoundation.org>
 <X6r7BIG8JTUOLcY0@kroah.com>
 <X6r7Vl45bgGQiAD2@kroah.com>
 <202011101614.E7D880689@keescook>
 <3075a4fd-8615-1459-2b20-b7d9d2be34ff@linuxfoundation.org>
 <f2b3ae49-bc41-0061-e811-1a7e41040366@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f2b3ae49-bc41-0061-e811-1a7e41040366@linuxfoundation.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Nov 12, 2020 at 02:27:49PM -0700, Shuah Khan wrote:

> atomic64_t depends on CONFIG_64BIT
> 
> include/linux/types.h
> 
> #ifdef CONFIG_64BIT
> typedef struct {
>         s64 counter;
> } atomic64_t;
> #endif

That's because some 32bit archs need to override the type definition.
atomic64_t is available on 32bit, although sometimes it is atrocious
crap.
