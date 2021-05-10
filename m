Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2BACC433B4
	for <linux-doc@archiver.kernel.org>; Mon, 10 May 2021 03:46:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C0C90610A5
	for <linux-doc@archiver.kernel.org>; Mon, 10 May 2021 03:46:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230373AbhEJDri (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 9 May 2021 23:47:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230347AbhEJDri (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 9 May 2021 23:47:38 -0400
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com [IPv6:2607:f8b0:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2498CC061760
        for <linux-doc@vger.kernel.org>; Sun,  9 May 2021 20:46:33 -0700 (PDT)
Received: by mail-pg1-x52f.google.com with SMTP id i5so7586572pgm.0
        for <linux-doc@vger.kernel.org>; Sun, 09 May 2021 20:46:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Jld4DKjBPzAzH7/qJhoedPeTLTKVP/GYejO0dGLt3lY=;
        b=gHFtNq79FVRgIAkg4x8LAJiAGBNODW/t/ytvxWvjgOO6qr38H6c1ZDgk/1C9UECmeI
         QmNDAzBawT1UMHxR8wq4KWLiRoCQemJVpTK2wMvlTIM+YNpclOQQTQqP5Sw2V0kJHY17
         dF51tBIyQV62akSzIwWIGxG0VdxyAOTHqdSNQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Jld4DKjBPzAzH7/qJhoedPeTLTKVP/GYejO0dGLt3lY=;
        b=ZoNIMytvo2lwKbRmoQkWiPMnZSWDiXZ+w2y7mzMC+dw2mHe+Ulja67NsBmXFoOQP8T
         16ayih1s6KhxFq7K9Q9BQ3qmKQ0pUwVAQUxe0rRm+QkPWzDTASkRKGUB/rWygR775OOv
         hzy7cP6XD/mHIgcEJxm+Bhl2CZQpInHcZeY0mj6DhtZ4uKxFKirRaYzVi+ejZlzSDwXy
         1/vK1Vm0nobxXWdRnyiDH4zpFsxZDCnHOf6MlwJcH4G2azIGcYI1OeL+T1Q4+PXtwvfd
         38h3sQuawGel8H8ivGQ+zXLEVEIorJS5nAsSGS0qq20zeyjomuukhqPenjVA9WWtTsdX
         trCg==
X-Gm-Message-State: AOAM530IMJuV3sPVBdSichZoWuBRwsnhTBi5BlyP2V61o0sjtHPeKlDa
        w5lC6Xf6fkwIh9/PcaYgmhZ53w==
X-Google-Smtp-Source: ABdhPJwGfFgGtAmJ1netLqZooHZSFIoE2i5WHF3GZKv3PgJtOGcGaYSHMGZeRTmsMst6PgNY7yZPZA==
X-Received: by 2002:a63:b247:: with SMTP id t7mr9740503pgo.408.1620618392550;
        Sun, 09 May 2021 20:46:32 -0700 (PDT)
Received: from google.com ([2409:10:2e40:5100:f055:559a:ad7f:e975])
        by smtp.gmail.com with ESMTPSA id dw18sm17847469pjb.36.2021.05.09.20.46.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 May 2021 20:46:31 -0700 (PDT)
Date:   Mon, 10 May 2021 12:46:24 +0900
From:   Sergey Senozhatsky <senozhatsky@chromium.org>
To:     Jia He <justin.he@arm.com>
Cc:     Petr Mladek <pmladek@suse.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Jonathan Corbet <corbet@lwn.net>,
        Alexander Viro <viro@zeniv.linux.org.uk>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Al Viro <viro@ftp.linux.org.uk>,
        Heiko Carstens <hca@linux.ibm.com>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        "Eric W . Biederman" <ebiederm@xmission.com>,
        "Darrick J. Wong" <darrick.wong@oracle.com>,
        "Peter Zijlstra (Intel)" <peterz@infradead.org>,
        Ira Weiny <ira.weiny@intel.com>,
        Eric Biggers <ebiggers@google.com>,
        "Ahmed S. Darwish" <a.darwish@linutronix.de>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-s390@vger.kernel.org, linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH RFC 2/3] lib/vsprintf.c: make %pD print full path for file
Message-ID: <YJiskAS4WivETLC9@google.com>
References: <20210508122530.1971-1-justin.he@arm.com>
 <20210508122530.1971-3-justin.he@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210508122530.1971-3-justin.he@arm.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On (21/05/08 20:25), Jia He wrote:
> +++ b/lib/vsprintf.c
> @@ -27,6 +27,7 @@
>  #include <linux/string.h>
>  #include <linux/ctype.h>
>  #include <linux/kernel.h>
> +#include <linux/dcache.h>
>  #include <linux/kallsyms.h>
>  #include <linux/math64.h>
>  #include <linux/uaccess.h>
> @@ -923,10 +924,17 @@ static noinline_for_stack
>  char *file_dentry_name(char *buf, char *end, const struct file *f,
>  			struct printf_spec spec, const char *fmt)
>  {
> +	const struct path *path = &f->f_path;
> +	char *p;
> +	char tmp[128];

This doesn't look ideal. Why 128 bytes and why on the stack?
