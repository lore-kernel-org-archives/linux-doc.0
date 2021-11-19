Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04D43C433F5
	for <linux-doc@archiver.kernel.org>; Fri, 19 Nov 2021 20:31:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D7FAF61B27
	for <linux-doc@archiver.kernel.org>; Fri, 19 Nov 2021 20:31:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235357AbhKSUep (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 19 Nov 2021 15:34:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:23097 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235315AbhKSUeo (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 19 Nov 2021 15:34:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1637353901;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=P2sZkZbNWImGK5CgW7dFwBi8zGA25zK0xwbZ1WxQTIw=;
        b=SSDLOoR0nus/XrRgtsbpLJ59SUOKC43QkRwiXAqw+i8OlN80FPJ1V2q3z3phuWaxyy58At
        ku3LptDDRmFXsZMMCmAVdLrlJtwvXzV47rtjdplb3VC6328mTF95XhC7DHLra5fJxxTPKt
        bBSKUIJbdvXmI6qr55qaSoLR/kePFRo=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-51-4UJn_EoROzip-Sby8Fx4wA-1; Fri, 19 Nov 2021 15:31:40 -0500
X-MC-Unique: 4UJn_EoROzip-Sby8Fx4wA-1
Received: by mail-qk1-f199.google.com with SMTP id m9-20020a05620a24c900b00467f2fdd657so8839981qkn.5
        for <linux-doc@vger.kernel.org>; Fri, 19 Nov 2021 12:31:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=P2sZkZbNWImGK5CgW7dFwBi8zGA25zK0xwbZ1WxQTIw=;
        b=qpIVCXI4tLbDdFu+wdNsNy5tcPobM196GA5tTc51s/ijbUMiMbORkyk4fzZkztPQpL
         3GzC62TadCVczd/j0IW4/JPvAaS3+c0DxFtHvgBcl+R3sy3pe2Rnk2AxOLH/nP+3x0ty
         C7s/TBstVk4XCJmaFiz8MkNPkzlBdsSIbm5EQE6w4CZW1calIpBvJNmfXWdOrYqwWgOD
         pcYIarkfx/GCl+u4Ye2wvDoTqzCm6WYa++ORqnltrGabZHgZWRdnoIDymW//sP5wpTWF
         smuWMxTmH5HNm+IODg0Pd+3zrGcaOyTl4OU7F1ivMU7MgV8g7egkkAKC9ctN79xs1U/p
         S05w==
X-Gm-Message-State: AOAM5316Tkmh6A2b993ljjsqi7kKisell9Kjoq/iBjv6j+NWUGlbNVTt
        +lPsGu+MYUvZmMSZfDlFJWLycz0wFU0Kkt7SYsMwDIzmdzhhI8sPh28cuei+jwsuQTppf277UOK
        KV6e8PNKmMHS4mB8obOpa
X-Received: by 2002:ac8:7f52:: with SMTP id g18mr9425063qtk.190.1637353900220;
        Fri, 19 Nov 2021 12:31:40 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxkAXs81p/9fcPnMbXqzRfyHNHU69K8pzzXpDVQagmkQJ2qJyjzDlmUAcOqpRVDqAvK3rgV/w==
X-Received: by 2002:ac8:7f52:: with SMTP id g18mr9425020qtk.190.1637353899973;
        Fri, 19 Nov 2021 12:31:39 -0800 (PST)
Received: from treble ([2600:1700:6e32:6c00::35])
        by smtp.gmail.com with ESMTPSA id z13sm374393qkj.1.2021.11.19.12.31.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Nov 2021 12:31:39 -0800 (PST)
Date:   Fri, 19 Nov 2021 12:31:35 -0800
From:   Josh Poimboeuf <jpoimboe@redhat.com>
To:     Marco Elver <elver@google.com>
Cc:     "Paul E. McKenney" <paulmck@kernel.org>,
        Alexander Potapenko <glider@google.com>,
        Boqun Feng <boqun.feng@gmail.com>,
        Borislav Petkov <bp@alien8.de>,
        Dmitry Vyukov <dvyukov@google.com>,
        Ingo Molnar <mingo@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Waiman Long <longman@redhat.com>,
        Will Deacon <will@kernel.org>, kasan-dev@googlegroups.com,
        linux-arch@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, x86@kernel.org
Subject: Re: [PATCH v2 23/23] objtool, kcsan: Remove memory barrier
 instrumentation from noinstr
Message-ID: <20211119203135.clplwzh3hyo5xddg@treble>
References: <20211118081027.3175699-1-elver@google.com>
 <20211118081027.3175699-24-elver@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20211118081027.3175699-24-elver@google.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Nov 18, 2021 at 09:10:27AM +0100, Marco Elver wrote:
> @@ -1071,12 +1071,7 @@ static void annotate_call_site(struct objtool_file *file,
>  		return;
>  	}
>  
> -	/*
> -	 * Many compilers cannot disable KCOV with a function attribute
> -	 * so they need a little help, NOP out any KCOV calls from noinstr
> -	 * text.
> -	 */
> -	if (insn->sec->noinstr && sym->kcov) {
> +	if (insn->sec->noinstr && sym->removable_instr) {
>  		if (reloc) {
>  			reloc->type = R_NONE;
>  			elf_write_reloc(file->elf, reloc);

I'd love to have a clearer name than 'removable_instr', though I'm
having trouble coming up with something.

'profiling_func'?

Profiling isn't really accurate but maybe it gets the point across.  I'm
definitely open to other suggestions.

Also, the above code isn't very self-evident so there still needs to be
a comment there, like:

	/*
	 * Many compilers cannot disable KCOV or sanitizer calls with a
	 * function attribute so they need a little help, NOP out any
	 * such calls from noinstr text.
	 */

> @@ -1991,6 +1986,32 @@ static int read_intra_function_calls(struct objtool_file *file)
>  	return 0;
>  }
>  
> +static bool is_removable_instr(const char *name)


> +{
> +	/*
> +	 * Many compilers cannot disable KCOV with a function attribute so they
> +	 * need a little help, NOP out any KCOV calls from noinstr text.
> +	 */
> +	if (!strncmp(name, "__sanitizer_cov_", 16))
> +		return true;

A comment is good here, but the NOP-ing bit seems out of place.

-- 
Josh

