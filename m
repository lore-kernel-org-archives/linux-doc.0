Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08DB2C7EE22
	for <linux-doc@archiver.kernel.org>; Thu, 11 May 2023 07:44:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237555AbjEKHo3 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 11 May 2023 03:44:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49646 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237012AbjEKHo2 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 11 May 2023 03:44:28 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73C171738;
        Thu, 11 May 2023 00:44:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=wBXjskPx8hEOJnHSctqAejGh2IMM+muzSI0KeP2yQrM=; b=d8uE/iRFbR5cJozqHolXlIngkK
        s0M5XV/l16K3V6IVU0ohjHELX2UkMEi4nK7mL1Ogg2+ijJHpEYlfSi5+X/QGbcZwITYSpHbz3Z/0B
        coPuHx5STz6DGPjbz0cXjF/Q9mNKYpvCppPC+ynR3diGsU6p3WjZ++v4MPebwAQtpFzDRUjBsyoZd
        Kr2V9hl24aO3AnzsXw37Jl1GuYkaE8bKlEbI+9LpD2U6Hn5GPGqzqFy9KAULyPmR9rd5oq4q5Qe4d
        uDZ8N/J/C9KVURxhLeAGwexNjjIcwHahp1HUcODg3tgg5CsPX0RVZ4rpiKZHcQya9XT7sVUIsVpqr
        /266kvVA==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
        by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1px0y1-00Gzr6-DC; Thu, 11 May 2023 07:44:02 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits))
        (Client did not present a certificate)
        by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 78562300786;
        Thu, 11 May 2023 09:43:59 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
        id 55A0C235CC445; Thu, 11 May 2023 09:43:59 +0200 (CEST)
Date:   Thu, 11 May 2023 09:43:59 +0200
From:   Peter Zijlstra <peterz@infradead.org>
To:     Youling Tang <tangyouling@loongson.cn>
Cc:     WANG Xuerui <kernel@xen0n.name>,
        Huacai Chen <chenhuacai@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Josh Poimboeuf <jpoimboe@kernel.org>,
        Jason Baron <jbaron@akamai.com>,
        Zhangjin Wu <falcon@tinylab.org>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, loongarch@lists.linux.dev
Subject: Re: [PATCH v2] LoongArch: Add jump-label implementation
Message-ID: <20230511074359.GQ4253@hirez.programming.kicks-ass.net>
References: <1683710206-23905-1-git-send-email-tangyouling@loongson.cn>
 <3b360532-6ad5-b22c-b02a-103be491be4c@xen0n.name>
 <72b6c81a-d4ee-575a-ff48-6be7e034ac96@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <72b6c81a-d4ee-575a-ff48-6be7e034ac96@loongson.cn>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, May 11, 2023 at 09:33:37AM +0800, Youling Tang wrote:

> > > +void arch_jump_label_transform(struct jump_entry *entry,
> > > +                   enum jump_label_type type)
> > > +{
> > > +    void *addr = (void *)jump_entry_code(entry);
> > > +    u32 insn;
> > > +
> > > +    if (type == JUMP_LABEL_JMP)
> > 
> > Please use a switch for dealing with enum-typed values.
> 
> Because the current type only has JUMP_LABEL_NOP and JUMP_LABEL_JMP,
> using if may be simpler than switch.

IIRC we used an enum with descriptive names instead of a boolean because
true/false just doesn't tell you much.

The whole thing fundamentally is a boolean descision though, either
you write a JMP or a NOP, jump-labels don't have more options.


