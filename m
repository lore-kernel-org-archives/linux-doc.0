Return-Path: <SRS0=2XaJ=CS=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76CB0C433E2
	for <linux-doc@archiver.kernel.org>; Wed,  9 Sep 2020 17:12:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 288A721D7E
	for <linux-doc@archiver.kernel.org>; Wed,  9 Sep 2020 17:12:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="cT3ohcSj"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727976AbgIIRMg (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 9 Sep 2020 13:12:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35258 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731248AbgIIRMQ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 9 Sep 2020 13:12:16 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D3A1C061757
        for <linux-doc@vger.kernel.org>; Wed,  9 Sep 2020 10:12:16 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id t14so2514499pgl.10
        for <linux-doc@vger.kernel.org>; Wed, 09 Sep 2020 10:12:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=CosBFDAizRNCISZV5eHVCzVDJVKQR4om2vS5xFZC3xc=;
        b=cT3ohcSj+rnWge0Nez3Heio2GDlTkUAedSsaOMSCyZ1XX47xxJRN/fvhoZM61JBJnI
         XNJwIA8eXAsyh/cC/8cwIgvWWgjjilJLUAmiOw+LcaaPoWKK5N9G6Nxjf0ndjKQs8eoj
         3LWq48FHhLfpq69l4uYmYS9P0AKNeHV/fl7uw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=CosBFDAizRNCISZV5eHVCzVDJVKQR4om2vS5xFZC3xc=;
        b=N+BIP5XAseJVCWksTD3nkibaSNhRd0P7m7K1NeDSg1End9tIbZYYyYabYdhT2m3iKI
         yK20e+J6oG5I580KZU+uuluQplaDq54PXHtk+YLjYMhmJO9wzqqfYPWfHkB8MmNOJWY/
         ViOw6ZRoxjGDjel6Ql/dt1EiW+hIjhhrNEMi17rs3Qpyh7mY/HJUYpTUpBbThKB+Pp0R
         fQB8Nv60DNjdLh753nTTBsN2dav2wuG4hUb8Yow962Wnc8taZnpbu/ds1GztvLz52Z4e
         sf/xBtF/kG7gRXn9NG0dts9fzeKxmyIHbZMPNZBMXnYgVLNpZgY9HQc4lrcrO7h27jJ3
         wWPQ==
X-Gm-Message-State: AOAM5301n2aTC+ifJONve1IwDSYJG1+YExazNFYu2kELYuRO/tAWXW6c
        1nNLQ/Qz+Vjzi/UYW1ICh9XzQmye9QPd9g==
X-Google-Smtp-Source: ABdhPJxYjSzhB5uOfoaKKpdMENNizIwt9gyBznrahFk5i+IgdOKycZBi7etQDhEcw8TNcJftOjuAYA==
X-Received: by 2002:a63:3d0e:: with SMTP id k14mr1356378pga.219.1599671535897;
        Wed, 09 Sep 2020 10:12:15 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id m20sm3314282pfa.115.2020.09.09.10.12.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2020 10:12:14 -0700 (PDT)
Date:   Wed, 9 Sep 2020 10:12:13 -0700
From:   Kees Cook <keescook@chromium.org>
To:     "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc:     Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs: deprecated.rst: Update zero-length/one-element
 arrays section
Message-ID: <202009091012.ADA0342C8@keescook>
References: <20200901010949.GA21398@embeddedor>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200901010949.GA21398@embeddedor>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Aug 31, 2020 at 08:09:49PM -0500, Gustavo A. R. Silva wrote:
> Update information in the zero-length and one-element arrays section
> and illustrate how to make use of the new flex_array_size() helper,
> together with struct_size() and a flexible-array member.
> 
> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>

Looks great!

Acked-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
