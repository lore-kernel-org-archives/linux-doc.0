Return-Path: <SRS0=LvDp=6X=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C594C47247
	for <linux-doc@archiver.kernel.org>; Sat,  9 May 2020 19:10:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8298C208E4
	for <linux-doc@archiver.kernel.org>; Sat,  9 May 2020 19:10:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ic2jDBAU"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728210AbgEITKv (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 9 May 2020 15:10:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727938AbgEITKu (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 9 May 2020 15:10:50 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D324C05BD09
        for <linux-doc@vger.kernel.org>; Sat,  9 May 2020 12:10:49 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id x2so2700598pfx.7
        for <linux-doc@vger.kernel.org>; Sat, 09 May 2020 12:10:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=wf1n+hj5e8dyRivUQoz1C3c50QpmiVcBTEYF2ohJ06I=;
        b=ic2jDBAUdykvb8NzpOOfuQtQCAJskZi9+smoiPzH0xhkiX4pmSJiinej0vTVKH/221
         gnrKMP7IOys7u092mkVJTRxQoojh82vCi5NVTTM9PF5p0zLJ9waRrFkClTf7fi/2WpPA
         uBgj5Ja5hpJz90iREzYY3zV5EovyF5+UvyYYQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=wf1n+hj5e8dyRivUQoz1C3c50QpmiVcBTEYF2ohJ06I=;
        b=ByPWlmX0PJpHhC9Yr5vj+KIEs2RU3j4JZQQUoNoJYqP31rE4nXm7DSNzIzrJ735XM4
         nn851Q1tKNeO3qNfJWtrB4QRLA1cckuhMJdSRt7BT8VWxGO7plOeV0+mR8z9o3cWW12S
         aLMs7/q5t/cRC3edkNHC4QAcraseE1EgvMgXWI13qsfQzf62Y9PVcJ8OT61ikMqdxiQW
         llrztB4tvm0gr3j1+G5+m4wYiiU4y4lmGGccGgaJScZ2kezK05g8mnajLKpUYkzM651V
         BQGIVTkfjm4Fhl8I3y65oX/WK8b3EHuvE0MGC6WCuHoKcF5A1mX+i2A0GwtMvjYb/pf8
         g+Ig==
X-Gm-Message-State: AGi0PubRT+kCODfer7KVB4ZzKaRs4uk7kHiN8HPU6kTZpYpYOmaJ4VZh
        Eap2a0AenJOH2nLMS7D13JgOaA==
X-Google-Smtp-Source: APiQypIUCMS5XnSujPmoONFpTKJIcwb1UPhXWiVcur5+r5JlPaWLbFnndT7Bb71vHTwjtrn39ZObjQ==
X-Received: by 2002:a63:7b42:: with SMTP id k2mr7065532pgn.299.1589051448671;
        Sat, 09 May 2020 12:10:48 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id x7sm5289404pfj.122.2020.05.09.12.10.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 May 2020 12:10:47 -0700 (PDT)
Date:   Sat, 9 May 2020 12:10:46 -0700
From:   Kees Cook <keescook@chromium.org>
To:     WeiXiong Liao <liaoweixiong@allwinnertech.com>
Cc:     Anton Vorontsov <anton@enomsg.org>,
        Colin Cross <ccross@android.com>,
        Tony Luck <tony.luck@intel.com>,
        Petr Mladek <pmladek@suse.com>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        linux-doc@vger.kernel.org, linux-mtd@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 00/12] pstore: mtd: support crash log to block and mtd
 device
Message-ID: <202005091209.406DB4C@keescook>
References: <20200508064004.57898-1-keescook@chromium.org>
 <202005080020.41C33738@keescook>
 <c1583001-bf03-d198-ad57-3d2a0baf93ca@allwinnertech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c1583001-bf03-d198-ad57-3d2a0baf93ca@allwinnertech.com>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sat, May 09, 2020 at 06:32:28PM +0800, WeiXiong Liao wrote:
> The following diff is to fix "rmmod" bug.
> 
> @@ -1273,8 +1273,8 @@ static void psz_free_zones(struct pstore_zone
> ***pszones, unsigned int *cnt)
>                 return;
> 
>         while (*cnt > 0) {
> -               psz_free_zone(&zones[*cnt]);
>                 (*cnt)--;
> +               psz_free_zone(&zones[*cnt]);
>         }
>         kfree(zones);
>         *pszones = NULL;

Ah-ha! Thanks; I'd almost found that. I got confused because I wasn't
see NULL free()s, and I finally noticed that the zones had left over
ERR_PTRs:

        if (IS_ERR(cxt->fpszs)) {
                err = PTR_ERR(cxt->fpszs);
+               cxt->fpszs = NULL;
                goto free_out;
        }

I'll fix those and your v5 and my lastest tree merged.

-- 
Kees Cook
