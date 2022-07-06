Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE7A7C433EF
	for <linux-doc@archiver.kernel.org>; Wed,  6 Jul 2022 07:30:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229732AbiGFHak (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 6 Jul 2022 03:30:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48902 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231173AbiGFHag (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 6 Jul 2022 03:30:36 -0400
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2E9C22B0B
        for <linux-doc@vger.kernel.org>; Wed,  6 Jul 2022 00:30:35 -0700 (PDT)
Received: by mail-pj1-x1035.google.com with SMTP id o15so9962892pjh.1
        for <linux-doc@vger.kernel.org>; Wed, 06 Jul 2022 00:30:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=v6WyalOysZfm7G/misPyTY5Ld9hNDTdU5K2hxvKhu2I=;
        b=hRyALat54ivapVCNyTISWQLXIcaiIXOrxYhDFz9idR5h+46fATk3szqp3BTyWXRztT
         hQlmD7iT3f0WMtmABi1rFrjk5H0uFaHIEUaxjeutiOFeoWckksSIC9ev4D+de0lcFbN/
         BplPx0fAhns5moWpU9Nidm/59nqQzNMo2GRvLdmyAIQ7I/rBNS8p8nOfPYBGYFvLY4Aq
         RVxz9Cx6GrCLdhezt+XQCaU7n7qcHRU2zGJ81XG1DLn0hCDSUVQlAQdSfSumFNmWQPGk
         s3Zmbg6dTvwrTvQ1kpJKuDyf8f0OLlELZDxtLv4KuOEA24QZq8hUlTqL0FC3ocyE3JfN
         Zasg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=v6WyalOysZfm7G/misPyTY5Ld9hNDTdU5K2hxvKhu2I=;
        b=IODbYAsH8AvDDHrHbGVZHM3G9GTSL/VgRfF/xBmAojUD5JQ+nOF//i7rquOTmCRtH8
         g4q8VfO23FgUA4VpWNnlRjkQAUCeDopu2kiqRccTE8gEXyMjOpxrWMwiUTmpMzB6aaaz
         yNIJCsKifvw+t0Pe1D8nl6U+j/mpTVyhlXfuqNw45ZOOv00LMNava4BPl+o19YrylQOc
         hWirK6VnuYIb8RkjPQKh0OzfuNFqONVHSt8YBvSmQQ41ox+4UrfcFGmMh+S397NpVpRA
         Jkawi/sZdEvV7YyQ66/IkR2a5X+2fDE0W99ZSlneNh9yyH7zF/rG9HZkXDLHzLUQcAzM
         y6+Q==
X-Gm-Message-State: AJIora91OdGOX09S68uipSnUwdwRGRtW6qdvTZkYYXBWMCCmVlV1CcF/
        a0MxtC7AQ/6429mhlgtUSW3vqu1rdhE=
X-Google-Smtp-Source: AGRyM1vuSooygLxZwX3F6qX8MR5GRHGFfkM19fD/mQM+ktU8NXaBQ9uMxunOziYMF7i6du4DKt8XAw==
X-Received: by 2002:a17:90b:33cd:b0:1ed:5a2b:8d1d with SMTP id lk13-20020a17090b33cd00b001ed5a2b8d1dmr46222353pjb.202.1657092635484;
        Wed, 06 Jul 2022 00:30:35 -0700 (PDT)
Received: from debian.me (subs02-180-214-232-23.three.co.id. [180.214.232.23])
        by smtp.gmail.com with ESMTPSA id n5-20020a170902d2c500b0015e9f45c1f4sm25008951plc.186.2022.07.06.00.30.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Jul 2022 00:30:34 -0700 (PDT)
Received: by debian.me (Postfix, from userid 1000)
        id C890210399B; Wed,  6 Jul 2022 14:30:29 +0700 (WIB)
Date:   Wed, 6 Jul 2022 14:30:29 +0700
From:   Bagas Sanjaya <bagasdotme@gmail.com>
To:     Martin Fernandez <martin.fernandez@eclypsium.com>
Cc:     linux-doc@vger.kernel.org, dwaipayanray1@gmail.com,
        lukas.bulwahn@gmail.com, joe@perches.com
Subject: Re: [PATCH v3] doc/checkpatch: Add description to MACRO_ARG_REUSE
Message-ID: <YsU6Fc0o0g6DHZ4W@debian.me>
References: <20220704225757.1811311-1-martin.fernandez@eclypsium.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220704225757.1811311-1-martin.fernandez@eclypsium.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Jul 04, 2022 at 07:57:57PM -0300, Martin Fernandez wrote:
> +  **ARG_REUSE**
> +    Using the same argument multiple times in the macro definition
> +    would lead to unwanted side-effects.
> +
> +    For example, given a `min` macro defined like::
> +
> +      #define min(x, y)  ((x) < (y) ? (x) : (y))
> +
> +    If you call it with `min(foo(x), 0)`, it would expand to::
> +
> +      foo(x) < 0 ? foo(x) : 0
> +

Nit: literal blocks are indented three spaces relative to surrounding
paragraph.

> +    If `foo` has side-effects or it's an expensive calculation the
> +    results might not be what the user intended.
> +
> +    For a workaround the idea is to define local variables to hold the
> +    macro's arguments. Checkout the actual implementation of `min` in
> +    include/linux/minmax.h for the full implementation of the
> +    workaround.
> +

For inline code, the correct syntax is ``some text``. However, by
convention here, the backquotes aren't used where these would be
appropriate, like variable and function names.

For the last paragraph, better say "The workaround is to define local
variables to hold macro arguments. See the min macro in
include/linux/minmax.h for example.".

-- 
An old man doll... just what I always wanted! - Clara
