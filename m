Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B944C433ED
	for <linux-doc@archiver.kernel.org>; Wed, 19 May 2021 18:10:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0C194611BD
	for <linux-doc@archiver.kernel.org>; Wed, 19 May 2021 18:10:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230525AbhESSMM (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 19 May 2021 14:12:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229708AbhESSML (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 19 May 2021 14:12:11 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01B5CC06175F;
        Wed, 19 May 2021 11:10:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
        Subject:Sender:Reply-To:Content-ID:Content-Description;
        bh=hzUyJaz9d9LlBSmG5SweaF0Q+mql8ulPw1IIhQXoQvc=; b=gNKcfrXN6So0jsgE5nFvcgSNVg
        MxdM5VRg/o5wH82oegHXOyn38JseVneyE8CjWlbX/WLdIVCNWZgnrxj0IF7++BYH1n203jaMu7kWV
        69QdiqTd6eqcGF1L+4JOkc5UpVT1E1l53QbJf3lBUutbatbi7MOS1q3z0Nh4FZ/IN7lgpf7I1k+Gg
        hKSHB2bdtgZOeHWTgEB5wQ7MTpquXiIVP5NkN961qkMKc/GxK7QzkNmepIlgES/BceIO2wRSa2GjY
        n2kt4UHnrtvyjoFcIz9CCFaLNVk9TmqL5TsME+MlD37Qz+7EfsyiNAXN5CnnqwMb8qPMCST+DQ/pT
        jSLYSb5Q==;
Received: from [2601:1c0:6280:3f0::7376]
        by bombadil.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
        id 1ljQee-00FgUa-7q; Wed, 19 May 2021 18:10:48 +0000
Subject: Re: [RFC PATCH 01/16] rv: Add Runtime Verification (RV) interface
To:     Daniel Bristot de Oliveira <bristot@redhat.com>,
        linux-kernel@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>
Cc:     Tommaso Cucinotta <tommaso.cucinotta@santannapisa.it>,
        Kate Carcia <kcarcia@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Ingo Molnar <mingo@redhat.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Peter Zijlstra <peterz@infradead.org>,
        Will Deacon <will@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        "Paul E. McKenney" <paulmck@kernel.org>,
        Joel Fernandes <joel@joelfernandes.org>,
        Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
        Gabriele Paoloni <gabriele.paoloni@intel.com>,
        Juri Lelli <juri.lelli@redhat.com>,
        Clark Williams <williams@redhat.com>, linux-doc@vger.kernel.org
References: <cover.1621414942.git.bristot@redhat.com>
 <ad69b06e9e3a5ec9ad2a49d290b719a96dcc471e.1621414942.git.bristot@redhat.com>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <90c917eb-f0a8-3ef5-b63d-d88c1f6919a1@infradead.org>
Date:   Wed, 19 May 2021 11:10:47 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <ad69b06e9e3a5ec9ad2a49d290b719a96dcc471e.1621414942.git.bristot@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 5/19/21 4:36 AM, Daniel Bristot de Oliveira wrote:
> diff --git a/kernel/trace/rv/Kconfig b/kernel/trace/rv/Kconfig
> new file mode 100644
> index 000000000000..e8e65cfc7959
> --- /dev/null
> +++ b/kernel/trace/rv/Kconfig
> @@ -0,0 +1,13 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +#
> +menuconfig RV
> +	bool "Runtime Verification"
> +	depends on TRACING
> +	default y if DEBUG_KERNEL

No need for default y. There are other reasons to use DEBUG_KERNEL
without wanting RV turned on.

> +	help
> +	  Enable the kernel runtime verification infrastructure. RV is a
> +	  lightweight (yet rigorous) method that complements classical
> +	  exhaustive verification techniques (such as model checking and
> +	  theorem proving). RV works by analyzing the trace of the system's
> +	  actual execution, comparing it against a formal specification of
> +	  the system behavior.

And in the cover/patch 00:
tlrd:
should be
tl;dr:
or at least
tldr:
:)

-- 
~Randy

