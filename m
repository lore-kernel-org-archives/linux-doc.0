Return-Path: <SRS0=PdnY=D6=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20481C4363A
	for <linux-doc@archiver.kernel.org>; Fri, 23 Oct 2020 17:40:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A50562168B
	for <linux-doc@archiver.kernel.org>; Fri, 23 Oct 2020 17:40:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="mj2T49J8"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1753645AbgJWRkN (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 23 Oct 2020 13:40:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S465691AbgJWRkL (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 23 Oct 2020 13:40:11 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BBAD1C0613D2
        for <linux-doc@vger.kernel.org>; Fri, 23 Oct 2020 10:40:11 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id h7so1916425pfn.2
        for <linux-doc@vger.kernel.org>; Fri, 23 Oct 2020 10:40:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ZqP+pDAqwl0vm0EDa5k2rDU/fo01GdgiAMIENZpdsv8=;
        b=mj2T49J8gQrFFhGKsZgQtKxY6nwyDd/Lnm8MbigzTINw9idCg+Zh7Avel0YyxyiPNI
         7ajVBvQ7xY9MGEW1BVpHZzR9fnaix9drV82PY/rwqxzihi6o64MnanSr1etwLEefw0eS
         LuhVSmg+s89rKvzqg6jY5Nf9X+/eP96X3Ao+Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ZqP+pDAqwl0vm0EDa5k2rDU/fo01GdgiAMIENZpdsv8=;
        b=kmEqmol6QCDs2Jib9WFLEtFyuixvkrx/qPvoQFBogPhihrCgYxJ8Xj84S4XHJNoWwN
         5whq2ph3QA4zF0ca2yAgAxPhqANCl9ZPTPUDPwdbNSSpSUSbPRjtjRO/2beLb2+PtRlr
         A0rwYYz9bNbeJzGN1bAdtn3HdpKUC+8ezPCqGAJXvGQVyp/F/zx1b2/W/ED0LwY147oe
         +ZC83b8BXCvEOYmKlH2acg0lCfegMGXd7Ik5BcX8mDWqTO/aHf4WFH+YB1kyVy+B8shf
         qgu+P6HhAL0vpS9Ef0F0hNEdnFs227mCr2hkA6ehv2YaK6QGvEPi65vIe6w3MnR4ju8G
         rTrw==
X-Gm-Message-State: AOAM53126r3JRMpA1AzWf0QSIkIPwhfBR61rdtHtwbOtrStn+fEPkvM0
        s+bUq28dDcaBBPh+4b5YRh4gV1KFsXDrNw==
X-Google-Smtp-Source: ABdhPJwwYEzc8bj+e0QmiHdLOS6y2rJMDSM45Ig7sMTUAAnSKOWB8XdB8tOm4Sr9ElfavlxiwgVfmA==
X-Received: by 2002:a63:2d05:: with SMTP id t5mr2935833pgt.178.1603474811368;
        Fri, 23 Oct 2020 10:40:11 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id t129sm2695390pfc.140.2020.10.23.10.40.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2020 10:40:10 -0700 (PDT)
Date:   Fri, 23 Oct 2020 10:40:09 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Ard Biesheuvel <ardb@kernel.org>,
        Ingo Molnar <mingo@kernel.org>, Jann Horn <jannh@google.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Will Deacon <will@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 49/56] refcount.h: fix a kernel-doc markup
Message-ID: <202010231039.DE05B63@keescook>
References: <cover.1603469755.git.mchehab+huawei@kernel.org>
 <fd94a95cfe01b97190b6ffb9e942cb4bbeeaa6bf.1603469755.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fd94a95cfe01b97190b6ffb9e942cb4bbeeaa6bf.1603469755.git.mchehab+huawei@kernel.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Oct 23, 2020 at 06:33:36PM +0200, Mauro Carvalho Chehab wrote:
> The documented typedef just after the kernel-doc markup
> is named "refcount_struct".
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---
>  include/linux/refcount.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/linux/refcount.h b/include/linux/refcount.h
> index 497990c69b0b..8f431b0e69e4 100644
> --- a/include/linux/refcount.h
> +++ b/include/linux/refcount.h
> @@ -101,7 +101,7 @@
>  struct mutex;
>  
>  /**
> - * struct refcount_t - variant of atomic_t specialized for reference counts
> + * struct refcount_struct - variant of atomic_t specialized for reference counts

Hm, this is a weird one. Yes, it's actually "struct refcount_struct",
but the usage should be refcount_t (through the typedef). I'm not sure
what the right way to document this is.

-Kees

>   * @refs: atomic_t counter field
>   *
>   * The counter saturates at REFCOUNT_SATURATED and will not move once
> -- 
> 2.26.2
> 

-- 
Kees Cook
