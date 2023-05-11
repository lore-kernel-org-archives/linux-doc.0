Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14EF5C77B7C
	for <linux-doc@archiver.kernel.org>; Thu, 11 May 2023 20:18:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239182AbjEKUS4 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 11 May 2023 16:18:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60196 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238918AbjEKUSz (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 11 May 2023 16:18:55 -0400
Received: from desiato.infradead.org (desiato.infradead.org [IPv6:2001:8b0:10b:1:d65d:64ff:fe57:4e05])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3EFF172D;
        Thu, 11 May 2023 13:18:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=c66/3N3Rqm9uKbY8BXQ+WKytrPOIz5O/bDfq9U5auHQ=; b=VZUMM9xAkjBKj5Z3c2ksEXIJlQ
        FrKO7VzndNIXGOUw/YakP3IOPuVbuB/+UmprLMei83YiMJ2jFOod1xsF3FN2b+WlkVcrbU698N8Yq
        lrHN+Gc815VsDMymhX2VPZlNb8y+40fLSCpXvr1PqF8evaK7ASqlom3dW6M4+H4sRmkuxg/uHdvo/
        /HqZVQvq6sxwSxeSv6LaPQpnGnsBPYTwuaynkdG7NKTKHL3pZAqRC/QzX3YoszxcpVMU7hJ9cqATG
        DD+RrRzQD/mAMvqovD4LVMx1yucDr14yJzJVFrgW5izOAjUcZgTQZi1hPcL1/Jspwfw55suG8n1Cm
        sjePik1w==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
        by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
        id 1pxCkI-008NTy-2z;
        Thu, 11 May 2023 20:18:40 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits))
        (Client did not present a certificate)
        by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 7F2E4300244;
        Thu, 11 May 2023 22:18:37 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
        id 6280B2C25D25A; Thu, 11 May 2023 22:18:37 +0200 (CEST)
Date:   Thu, 11 May 2023 22:18:37 +0200
From:   Peter Zijlstra <peterz@infradead.org>
To:     "Paul E. McKenney" <paulmck@kernel.org>
Cc:     linux-kernel@vger.kernel.org, x86@kernel.org, akiyks@gmail.com,
        linux-doc@vger.kernel.org, kernel-team@meta.com,
        Will Deacon <will@kernel.org>,
        Boqun Feng <boqun.feng@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH locking/atomic 18/19] locking/atomic: Refrain from
 generating duplicate fallback kernel-doc
Message-ID: <20230511201837.GD2296992@hirez.programming.kicks-ass.net>
References: <19135936-06d7-4705-8bc8-bb31c2a478ca@paulmck-laptop>
 <20230510181717.2200934-18-paulmck@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230510181717.2200934-18-paulmck@kernel.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, May 10, 2023 at 11:17:16AM -0700, Paul E. McKenney wrote:
> The gen-atomics.sh script currently generates 42 duplicate definitions:
> 
> 	arch_atomic64_add_negative
> 	arch_atomic64_add_negative_acquire
> 	arch_atomic64_add_negative_release
> 	arch_atomic64_dec_return
> 	arch_atomic64_dec_return_acquire
> 	arch_atomic64_dec_return_release
> 	arch_atomic64_fetch_andnot
> 	arch_atomic64_fetch_andnot_acquire
> 	arch_atomic64_fetch_andnot_release
> 	arch_atomic64_fetch_dec
> 	arch_atomic64_fetch_dec_acquire
> 	arch_atomic64_fetch_dec_release
> 	arch_atomic64_fetch_inc
> 	arch_atomic64_fetch_inc_acquire
> 	arch_atomic64_fetch_inc_release
> 	arch_atomic64_inc_return
> 	arch_atomic64_inc_return_acquire
> 	arch_atomic64_inc_return_release
> 	arch_atomic64_try_cmpxchg
> 	arch_atomic64_try_cmpxchg_acquire
> 	arch_atomic64_try_cmpxchg_release
> 	arch_atomic_add_negative
> 	arch_atomic_add_negative_acquire
> 	arch_atomic_add_negative_release
> 	arch_atomic_dec_return
> 	arch_atomic_dec_return_acquire
> 	arch_atomic_dec_return_release
> 	arch_atomic_fetch_andnot
> 	arch_atomic_fetch_andnot_acquire
> 	arch_atomic_fetch_andnot_release
> 	arch_atomic_fetch_dec
> 	arch_atomic_fetch_dec_acquire
> 	arch_atomic_fetch_dec_release
> 	arch_atomic_fetch_inc
> 	arch_atomic_fetch_inc_acquire
> 	arch_atomic_fetch_inc_release
> 	arch_atomic_inc_return
> 	arch_atomic_inc_return_acquire
> 	arch_atomic_inc_return_release
> 	arch_atomic_try_cmpxchg
> 	arch_atomic_try_cmpxchg_acquire
> 	arch_atomic_try_cmpxchg_release
> 
> These duplicates are presumably to handle different architectures
> generating hand-coded definitions for different subsets of the atomic
> operations.  However, generating duplicate kernel-doc headers is
> undesirable.
> 
> Therefore, generate only the first kernel-doc definition in a group
> of duplicates.  A comment indicates the name of the function and the
> fallback script that generated it.

So my canonical solution to fixing kernel-doc related problems is this
trivial regex:

	s/\/\*\*/\/\*/

works every time.

And is *much* simpler than this:

>  scripts/atomic/chkdup.sh                     |  27 ++
>  scripts/atomic/fallbacks/acquire             |   3 +
>  scripts/atomic/fallbacks/add_negative        |   5 +
>  scripts/atomic/fallbacks/add_unless          |   5 +
>  scripts/atomic/fallbacks/andnot              |   5 +
>  scripts/atomic/fallbacks/dec                 |   5 +
>  scripts/atomic/fallbacks/dec_and_test        |   5 +
>  scripts/atomic/fallbacks/dec_if_positive     |   5 +
>  scripts/atomic/fallbacks/dec_unless_positive |   5 +
>  scripts/atomic/fallbacks/fence               |   3 +
>  scripts/atomic/fallbacks/fetch_add_unless    |   5 +
>  scripts/atomic/fallbacks/inc                 |   5 +
>  scripts/atomic/fallbacks/inc_and_test        |   5 +
>  scripts/atomic/fallbacks/inc_not_zero        |   5 +
>  scripts/atomic/fallbacks/inc_unless_negative |   5 +
>  scripts/atomic/fallbacks/read_acquire        |   5 +
>  scripts/atomic/fallbacks/release             |   3 +
>  scripts/atomic/fallbacks/set_release         |   5 +
>  scripts/atomic/fallbacks/sub_and_test        |   5 +
>  scripts/atomic/fallbacks/try_cmpxchg         |   5 +
>  scripts/atomic/gen-atomics.sh                |   4 +
