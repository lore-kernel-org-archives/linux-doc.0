Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D60FBC43460
	for <linux-doc@archiver.kernel.org>; Fri, 16 Apr 2021 17:05:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B3FF261073
	for <linux-doc@archiver.kernel.org>; Fri, 16 Apr 2021 17:05:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236515AbhDPRGD (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 16 Apr 2021 13:06:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50706 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236467AbhDPRGD (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 16 Apr 2021 13:06:03 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A430C061756
        for <linux-doc@vger.kernel.org>; Fri, 16 Apr 2021 10:05:37 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id j4so6313617lfp.0
        for <linux-doc@vger.kernel.org>; Fri, 16 Apr 2021 10:05:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=AcDAVQ+0h+jENPZeM69/kZwGZfdDXc/0125nsKSlnZg=;
        b=dnz1bYqVAlRM6259A+dx+Rc2q9Qis0LBOOOmkDKaY6WJu06OAB3WTXaPaSSbSH2kHN
         CUxAYJW2MSUb6KLd9VHkZqoeTvqRIILdDBdw4/TbIMff3ssQa3bNYa96Mu2MipKekQxe
         RdIn9i/ob2oUe8MI005glSrjfmJXy7RQVtkC4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AcDAVQ+0h+jENPZeM69/kZwGZfdDXc/0125nsKSlnZg=;
        b=c+7IQ/tlzDWzOtamHUhgPZrbcxlX/+q9033NKQhAfTz2ms20m/WwuASa9MXHOTupry
         MPx9z9vqPGOttmBkYJGHeYyuGcicd4SOGufyX3fr9pGhBOSIGxSEZQ3A23D9axs4c1hD
         oEn6TEp1dPwlpRgZ3klu1Uk2+awRy2AnzJ8AQS3KWdIC6w60dtsBXDh3nFY81CpZttUo
         yl7DWid4nkYZiUZiX1/K4MHLc6wNsmtqs2cpnk8cChLOxpprxka4tT3JqRBDX0rnbrAN
         q0M02fUFK+Xv0X1zpIgERrsjybFhD7OF3dqsdw/UhCdwaWp2XDW7yRgDEYn0DgBxGdRf
         AzCw==
X-Gm-Message-State: AOAM531G/aFSUWcfuI1cKYumESrShTB1Meyfijd8UEHSTrRELQD5/nii
        z08MBfHDPMWHyYt/JEpmsx8K5inuujmdl7Dn
X-Google-Smtp-Source: ABdhPJxSAENvGG5/q7+MFt1SRJGaQ/DP75jC5lp2AmixGdVWaeCgFquc2x8fRjo05+cm++rNq0qIlw==
X-Received: by 2002:a19:808f:: with SMTP id b137mr3751201lfd.162.1618592735614;
        Fri, 16 Apr 2021 10:05:35 -0700 (PDT)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com. [209.85.167.43])
        by smtp.gmail.com with ESMTPSA id d15sm1043057lfs.21.2021.04.16.10.05.34
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Apr 2021 10:05:35 -0700 (PDT)
Received: by mail-lf1-f43.google.com with SMTP id r128so18831695lff.4
        for <linux-doc@vger.kernel.org>; Fri, 16 Apr 2021 10:05:34 -0700 (PDT)
X-Received: by 2002:a05:6512:1286:: with SMTP id u6mr3571784lfs.377.1618592734654;
 Fri, 16 Apr 2021 10:05:34 -0700 (PDT)
MIME-Version: 1.0
References: <20210414184604.23473-1-ojeda@kernel.org> <20210414184604.23473-5-ojeda@kernel.org>
 <YHmTWEAS/QjX++w4@hirez.programming.kicks-ass.net>
In-Reply-To: <YHmTWEAS/QjX++w4@hirez.programming.kicks-ass.net>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Fri, 16 Apr 2021 10:05:18 -0700
X-Gmail-Original-Message-ID: <CAHk-=wh_zb=K1B-N8mgHmSZDqTLgOm711NRXbTX_OwFAzDYg0Q@mail.gmail.com>
Message-ID: <CAHk-=wh_zb=K1B-N8mgHmSZDqTLgOm711NRXbTX_OwFAzDYg0Q@mail.gmail.com>
Subject: Re: [PATCH 04/13] Kbuild: Rust support
To:     Peter Zijlstra <peterz@infradead.org>
Cc:     ojeda@kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        rust-for-linux@vger.kernel.org,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Geoffrey Thomas <geofft@ldpreload.com>,
        Finn Behrens <me@kloenk.de>,
        Adam Bratschi-Kaye <ark.email@gmail.com>,
        Wedson Almeida Filho <wedsonaf@google.com>,
        Michael Ellerman <mpe@ellerman.id.au>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Apr 16, 2021 at 6:38 AM Peter Zijlstra <peterz@infradead.org> wrote:
>
> AFAICT rust has try/throw/catch exception handling (like
> C++/Java/others) which is typically implemented with stack unwinding of
> its own.

I was assuming that the kernel side would never do that.

There's some kind of "catch_unwind()" thing that catches a Rust
"panic!" thing, but I think it's basically useless for the kernel.

Typical Rust error handling should match the regular kernel
IS_ERR/ERR_PTR/PTR_ERR model fairly well, although the syntax is
fairly different (and it's not limited to pointers).

                Linus
