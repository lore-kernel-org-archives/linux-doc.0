Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A4CFC77B7F
	for <linux-doc@archiver.kernel.org>; Thu, 11 May 2023 20:01:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239082AbjEKUB4 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 11 May 2023 16:01:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238946AbjEKUBz (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 11 May 2023 16:01:55 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA9A91993;
        Thu, 11 May 2023 13:01:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=qzvpHVkHKwBUFoLEvoOtwGUUaiDfLA17+CYXmIWURuo=; b=VzwQGby1CTkSKX0IT4HnG8n4SG
        oZWTQm9sLGtnjIvr6ENbkjd1c+G1wRO83RECDNlldkBYxSwKeJMgxYkjGHQYsjefh8UzpSDqWNCGI
        MvMP6744ORM/68xuL0sFA0hK2pqVi5eCiWxjlFXrLea93W220W9g1bk3YyT8bMvKXZ0OJ5XJj1rhF
        cPkS7dVHEtKWvFx6n6hcDc5PQfJDOSAEvl4vPzX0/+KE6YBHFJLDmKI8WYvt8YYUcOComYQL9Av8m
        tmzqFVd1Z8iJPQzmUhAoLA9kQ7aMmNztHIEiBT84yPcVbRhKXSCJV/dl87ZayJPucZGGUq1lVs10q
        JAeFEU7A==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
        by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1pxCTv-00HWgY-Ay; Thu, 11 May 2023 20:01:43 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits))
        (Client did not present a certificate)
        by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id D5FFA300451;
        Thu, 11 May 2023 22:01:42 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
        id 96FA42BB639C3; Thu, 11 May 2023 22:01:42 +0200 (CEST)
Date:   Thu, 11 May 2023 22:01:42 +0200
From:   Peter Zijlstra <peterz@infradead.org>
To:     "Paul E. McKenney" <paulmck@kernel.org>
Cc:     Mark Rutland <mark.rutland@arm.com>, linux-kernel@vger.kernel.org,
        x86@kernel.org, akiyks@gmail.com, linux-doc@vger.kernel.org,
        kernel-team@meta.com, Will Deacon <will@kernel.org>,
        Boqun Feng <boqun.feng@gmail.com>
Subject: Re: [PATCH locking/atomic 18/19] locking/atomic: Refrain from
 generating duplicate fallback kernel-doc
Message-ID: <20230511200142.GC2296992@hirez.programming.kicks-ass.net>
References: <19135936-06d7-4705-8bc8-bb31c2a478ca@paulmck-laptop>
 <20230510181717.2200934-18-paulmck@kernel.org>
 <ZF0haDfyL3At3Ijw@FVFF77S0Q05N.cambridge.arm.com>
 <20230511193856.GA2296992@hirez.programming.kicks-ass.net>
 <c619d689-e7b5-4136-9bd3-8f41954f43cd@paulmck-laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c619d689-e7b5-4136-9bd3-8f41954f43cd@paulmck-laptop>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, May 11, 2023 at 12:53:46PM -0700, Paul E. McKenney wrote:
> Do you have an alternative suggestion for generating the kernel-doc?
> The current lack of it is problematic.

I've never found a lack of kernel-doc to be a problem. And I'm very much
against complicating the scripts to add it.

Also, there's Documentation/atomic_t.txt
