Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 625037D2EF
	for <lwn-linux-doc@archive.lwn.net>; Tue, 28 May 2019 17:20:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726820AbfE1RUD (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 28 May 2019 13:20:03 -0400
Received: from merlin.infradead.org ([205.233.59.134]:52878 "EHLO
        merlin.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726236AbfE1RUC (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 28 May 2019 13:20:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=merlin.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=qsxG6nrZHIG6W3Utol1ADoMvGd1Fu++xoBrnNWF+g6w=; b=1Supj4ahiukX6UPbvHZyF03YR
        JO7bTjVrRlpg3pXBYsQwJVeAlQKNYjDNcrxz6LxCL3NRIKiPGHN86GcNMarsgpOe/yDDBOX+qd9HX
        t0eDk7tmUTTGVo4y4ZvvSj8c6dogbCtG2WZleFI/klu1NQNWDS816bL2y3mQre1xbSbEaWoDlWP4H
        yW47YPj0WIH/Cd4jIA4hLnLjXOmbAglKlOPTM0RRRilh+UWVC6ci3C6Dsu0qMsAqe0uJ7nDyOEsxO
        QfA362ClWXh1pOCLsldHPuSlnzWnbtzrTpe5ei0+3SKvxsnQfR4EVUrpMJnrLgHwFrsoJ8juDVKfd
        guKqq55Eg==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100] helo=hirez.programming.kicks-ass.net)
        by merlin.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
        id 1hVflI-0005pf-Tr; Tue, 28 May 2019 17:19:45 +0000
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
        id 4AAD52007CDEA; Tue, 28 May 2019 19:19:42 +0200 (CEST)
Date:   Tue, 28 May 2019 19:19:42 +0200
From:   Peter Zijlstra <peterz@infradead.org>
To:     Marco Elver <elver@google.com>
Cc:     aryabinin@virtuozzo.com, dvyukov@google.com, glider@google.com,
        andreyknvl@google.com, corbet@lwn.net, tglx@linutronix.de,
        mingo@redhat.com, bp@alien8.de, hpa@zytor.com, x86@kernel.org,
        arnd@arndb.de, jpoimboe@redhat.com, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
        kasan-dev@googlegroups.com
Subject: Re: [PATCH 2/3] tools/objtool: add kasan_check_* to uaccess whitelist
Message-ID: <20190528171942.GV2623@hirez.programming.kicks-ass.net>
References: <20190528163258.260144-1-elver@google.com>
 <20190528163258.260144-2-elver@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190528163258.260144-2-elver@google.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, May 28, 2019 at 06:32:57PM +0200, Marco Elver wrote:
> This is a pre-requisite for enabling bitops instrumentation. Some bitops
> may safely be used with instrumentation in uaccess regions.
> 
> For example, on x86, `test_bit` is used to test a CPU-feature in a
> uaccess region:   arch/x86/ia32/ia32_signal.c:361

That one can easily be moved out of the uaccess region. Any else?

> Signed-off-by: Marco Elver <elver@google.com>
> ---
>  tools/objtool/check.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/tools/objtool/check.c b/tools/objtool/check.c
> index 172f99195726..eff0e5209402 100644
> --- a/tools/objtool/check.c
> +++ b/tools/objtool/check.c
> @@ -443,6 +443,8 @@ static void add_ignores(struct objtool_file *file)
>  static const char *uaccess_safe_builtin[] = {
>  	/* KASAN */
>  	"kasan_report",
> +	"kasan_check_read",
> +	"kasan_check_write",
>  	"check_memory_region",
>  	/* KASAN out-of-line */
>  	"__asan_loadN_noabort",
> -- 
> 2.22.0.rc1.257.g3120a18244-goog
> 
