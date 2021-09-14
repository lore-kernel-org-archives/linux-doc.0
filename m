Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACA63C433F5
	for <linux-doc@archiver.kernel.org>; Tue, 14 Sep 2021 17:35:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 88779601FC
	for <linux-doc@archiver.kernel.org>; Tue, 14 Sep 2021 17:35:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229861AbhINRge (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 14 Sep 2021 13:36:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54708 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229795AbhINRgd (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 14 Sep 2021 13:36:33 -0400
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6DE96C061762
        for <linux-doc@vger.kernel.org>; Tue, 14 Sep 2021 10:35:16 -0700 (PDT)
Received: by mail-pf1-x42e.google.com with SMTP id y17so12991711pfl.13
        for <linux-doc@vger.kernel.org>; Tue, 14 Sep 2021 10:35:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=TCWXyI0dCA3o9LNo2Tto0ba1D/bVTK0K8ReDaSSLteo=;
        b=b7nxWKD6YEmrKpo4dDKxI+5EbtQtIWWCN/82l4Lkzwkyd/S/qHq1dm973Zo7LzF/OU
         MEyVcWvRsrwLgf1pGJhS7goyb4b1mW2+H0mz7yoEDowZAQ8vpX7+8BcGplLhEJUkLS7D
         AdQ7GuYw8N54jt3JZUQ+sPNYxkeHHO67vs3ok=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=TCWXyI0dCA3o9LNo2Tto0ba1D/bVTK0K8ReDaSSLteo=;
        b=qcq0+ecSqHRAZz8lDA7fkW6wa/to2xmYXRJKjIW0YWwnxn2PBxzgYX5oYPHv4TPsbM
         zC83JYYAZF1g+tXxtzXdIFK7Zbqgk13UFXzlCko4bk+UySzcUG0sJyW3dNw5v5GqVzBA
         KoPZEFYP8mpy/RvPkNsE+Kjkres/5521zO9s1EIud6Tlu6EV1dVsNkEVeZeofjJGG6w9
         /gH4mLaWYYT7XmY5e+7ocEBnTvQByPpqajNj0z6T5W2p7bXhuYoPC6AP3qg6QgzfeGZG
         f8ryoblOBHO3VZoZKt2cfrUUJ8PYIvwZapQ8dIAkFPJHh8c9as6CaG5fLOaUsR2GEJjv
         kdVw==
X-Gm-Message-State: AOAM530nBBGGm92z8G3VrVMoU9nu1PQcemF91e5WvihEnz+Xf+Y0fcN1
        chjiFqbZIoexG/Nuy0sidxlg2SLCYFh2RQ==
X-Google-Smtp-Source: ABdhPJz17jxLnHVx4rwoyOeSwBGAvrT9WBmNn1DeeBhck/kFtTXqcSjH57M0itk9+Z7JC61/lnggCQ==
X-Received: by 2002:a63:1748:: with SMTP id 8mr16027568pgx.350.1631640915889;
        Tue, 14 Sep 2021 10:35:15 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id x26sm11044067pfm.77.2021.09.14.10.35.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Sep 2021 10:35:15 -0700 (PDT)
Date:   Tue, 14 Sep 2021 10:35:14 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Anton Vorontsov <anton@enomsg.org>,
        Colin Cross <ccross@android.com>,
        Ilya Dryomov <idryomov@gmail.com>, Tom Rix <trix@redhat.com>,
        Tony Luck <tony.luck@intel.com>,
        Vaibhav Jain <vaibhav@linux.ibm.com>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 10/29] ABI: pstore: Fix What field
Message-ID: <202109141035.B5444836@keescook>
References: <cover.1631629496.git.mchehab+huawei@kernel.org>
 <b0ad4d3e915f2e1543b3037b43148b76d5480a37.1631629496.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b0ad4d3e915f2e1543b3037b43148b76d5480a37.1631629496.git.mchehab+huawei@kernel.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Sep 14, 2021 at 04:32:25PM +0200, Mauro Carvalho Chehab wrote:
> If both /sys/fs/pstore/... and /dev/pstore/... are possible,
> it should use, instead, two What: fields.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Acked-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
