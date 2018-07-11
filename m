Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id A7C097D071
	for <lwn-linux-doc@archive.lwn.net>; Wed, 11 Jul 2018 09:36:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732357AbeGKJkG (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 11 Jul 2018 05:40:06 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:43578 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726368AbeGKJkF (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 11 Jul 2018 05:40:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
        :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=iQ8l/LF++fo69Ns9n3OkAsjhcdxyOv6jW4Rsh/+HxJc=; b=b7wGQq1ZeF+48VUa2uPdkjBrf
        QuWgM5Cnq2+lfZaVDnZH2fV/gC7wLnS5ipddx3+uRgV/EKmIB//EOmOtFVZtGUNwJ8xmovH6Hsrf2
        jilSlgcU1HJz+xqz9QiGDYMbkDQUcATAEDKNdQxu3Xuq1sO8Epq0xoOWyLJAx6Qx7gOmzR2Z1+PWm
        UiZkbjXMs7Z1QFsr7/zQtaWtE24kbucHI1jvU9fJnjCWIp7stvBZm0/fD4VKFyTvfNSLcYXTG7p9d
        6CzTne5DESszo7Wdzo1+8ahy86Y8mi7Y4zsgITncyB0yJL9OOs4DlOqVNPeJeOxwQx9BU6qmwtuv9
        C4rWf0Wkw==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100] helo=hirez.programming.kicks-ass.net)
        by bombadil.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
        id 1fdBXz-0002Wd-GY; Wed, 11 Jul 2018 09:36:31 +0000
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
        id 053BE20291063; Wed, 11 Jul 2018 11:36:30 +0200 (CEST)
Date:   Wed, 11 Jul 2018 11:36:29 +0200
From:   Peter Zijlstra <peterz@infradead.org>
To:     Yu-cheng Yu <yu-cheng.yu@intel.com>
Cc:     x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-mm@kvack.org,
        linux-arch@vger.kernel.org, linux-api@vger.kernel.org,
        Arnd Bergmann <arnd@arndb.de>,
        Andy Lutomirski <luto@amacapital.net>,
        Balbir Singh <bsingharora@gmail.com>,
        Cyrill Gorcunov <gorcunov@gmail.com>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Florian Weimer <fweimer@redhat.com>,
        "H.J. Lu" <hjl.tools@gmail.com>, Jann Horn <jannh@google.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Kees Cook <keescook@chromiun.org>,
        Mike Kravetz <mike.kravetz@oracle.com>,
        Nadav Amit <nadav.amit@gmail.com>,
        Oleg Nesterov <oleg@redhat.com>, Pavel Machek <pavel@ucw.cz>,
        "Ravi V. Shankar" <ravi.v.shankar@intel.com>,
        Vedvyas Shanbhogue <vedvyas.shanbhogue@intel.com>
Subject: Re: [RFC PATCH v2 17/27] x86/cet/shstk: User-mode shadow stack
 support
Message-ID: <20180711093629.GY2476@hirez.programming.kicks-ass.net>
References: <20180710222639.8241-1-yu-cheng.yu@intel.com>
 <20180710222639.8241-18-yu-cheng.yu@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180710222639.8241-18-yu-cheng.yu@intel.com>
User-Agent: Mutt/1.10.0 (2018-05-17)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Jul 10, 2018 at 03:26:29PM -0700, Yu-cheng Yu wrote:
> +struct cet_status {
> +	unsigned long	shstk_base;
> +	unsigned long	shstk_size;
> +	unsigned int	shstk_enabled:1;
> +};

> @@ -498,6 +499,10 @@ struct thread_struct {
>  	unsigned int		sig_on_uaccess_err:1;
>  	unsigned int		uaccess_err:1;	/* uaccess failed */
>  
> +#ifdef CONFIG_X86_INTEL_CET
> +	struct cet_status	cet;
> +#endif
> +
>  	/* Floating point and extended processor state */
>  	struct fpu		fpu;
>  	/*

Why does that need a structure? That avoids folding the bitfields.
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
