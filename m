Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DFEDC43461
	for <linux-doc@archiver.kernel.org>; Wed, 14 Apr 2021 19:34:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 37F6660FF0
	for <linux-doc@archiver.kernel.org>; Wed, 14 Apr 2021 19:34:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353421AbhDNTe6 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 14 Apr 2021 15:34:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44834 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353417AbhDNTe5 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 14 Apr 2021 15:34:57 -0400
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8BABC061760
        for <linux-doc@vger.kernel.org>; Wed, 14 Apr 2021 12:34:35 -0700 (PDT)
Received: by mail-lj1-x234.google.com with SMTP id p23so20839923ljn.0
        for <linux-doc@vger.kernel.org>; Wed, 14 Apr 2021 12:34:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=p+qlBpfKKNNSmiIVDWZAwm2J5XBPYb6crTXEI3M0nwo=;
        b=VgiHLTWI3FosiEpCVUDwPU9YJez9f9/W7OcDyGRWAVmbGZSYPWyC/lw/A8EwBL9ftK
         liArfTuPen3tkf1eQSyheZ4w4SwmZAyOVnVWF6E8SqyJGlCejb7Dr9Y8seU8GmIElaDu
         glo7f1q5erTsGKyDwy5UyrL8uODJ+xbE+9wDs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=p+qlBpfKKNNSmiIVDWZAwm2J5XBPYb6crTXEI3M0nwo=;
        b=itQkqTxow9F6eMtP3gWne5hXsGkoqpyO5MX5dsKgxU6Ys/n6oJX0HbPSXjMAb8n5lu
         AtFm89hTdBImvDoygIVENMQz7j3AkldcjNLsreovvBZx1mV32OObrzwnI+vgWHADMMgV
         iog7YhNvva8C09euWqMn9wPnUHQpXzfLPXP7NZrcVX0+ZP3r2sS6SNI8hmjKvUoH3QXn
         uOUgbLuT2bQjVhT20PDB2YvZ3vNYaUkW0xHQaJJrst9whNBctAqpJdQSBo8bHyg+UhZT
         V+Lk48RyztOesrZ0i+bV3ByK/oIiGzlUMIm9FLXC+Ln8JO7w/deEMtaBDUkK1+Za7AnV
         dQMg==
X-Gm-Message-State: AOAM533bRpd6WQ8vwxNYkduqbydgD305cPAsiS0JRotze08ydmwBW07d
        VVJ8GFyQqNk3D9aJCJE/CfkttfKl2Cvr5jjK
X-Google-Smtp-Source: ABdhPJxoz47VOje2bpZdBMpqiAjoLszZMKC7YwcbmRztzbTRDaLd4tYlJM2/gPgAeiNgdeAszjVjHQ==
X-Received: by 2002:a2e:3c1a:: with SMTP id j26mr14419155lja.297.1618428873729;
        Wed, 14 Apr 2021 12:34:33 -0700 (PDT)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com. [209.85.167.48])
        by smtp.gmail.com with ESMTPSA id p24sm164546lfj.76.2021.04.14.12.34.32
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Apr 2021 12:34:33 -0700 (PDT)
Received: by mail-lf1-f48.google.com with SMTP id f17so28071195lfu.7
        for <linux-doc@vger.kernel.org>; Wed, 14 Apr 2021 12:34:32 -0700 (PDT)
X-Received: by 2002:ac2:4947:: with SMTP id o7mr22894176lfi.253.1618428872725;
 Wed, 14 Apr 2021 12:34:32 -0700 (PDT)
MIME-Version: 1.0
References: <20210414184604.23473-1-ojeda@kernel.org> <20210414184604.23473-10-ojeda@kernel.org>
In-Reply-To: <20210414184604.23473-10-ojeda@kernel.org>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Wed, 14 Apr 2021 12:34:16 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjdZ1KksHHHuekeAx9kKFXEyt+rg0P=yRD1Bia_01wucg@mail.gmail.com>
Message-ID: <CAHk-=wjdZ1KksHHHuekeAx9kKFXEyt+rg0P=yRD1Bia_01wucg@mail.gmail.com>
Subject: Re: [PATCH 09/13] Samples: Rust examples
To:     ojeda@kernel.org
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        rust-for-linux@vger.kernel.org,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Geoffrey Thomas <geofft@ldpreload.com>,
        Finn Behrens <me@kloenk.de>,
        Adam Bratschi-Kaye <ark.email@gmail.com>,
        Wedson Almeida Filho <wedsonaf@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Apr 14, 2021 at 11:47 AM <ojeda@kernel.org> wrote:
>
> From: Miguel Ojeda <ojeda@kernel.org>
>
> A set of Rust modules that showcase how Rust modules look like
> and how to use the abstracted kernel features.

Honestly, I'd like to see a real example. This is fine for testing,
but I'd like to see something a bit more real, and a bit less special
than the Android "binder" WIP that comes a few patches later.

Would there be some kind of real driver or something that people could
use as a example of a real piece of code that actually does something
meaningful?

               Linus
