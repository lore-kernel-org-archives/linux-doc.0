Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0C61C47E48
	for <linux-doc@archiver.kernel.org>; Wed, 14 Jul 2021 22:40:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D55A8613C2
	for <linux-doc@archiver.kernel.org>; Wed, 14 Jul 2021 22:40:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236822AbhGNWnZ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 14 Jul 2021 18:43:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35610 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236682AbhGNWnZ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 14 Jul 2021 18:43:25 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68C62C061764
        for <linux-doc@vger.kernel.org>; Wed, 14 Jul 2021 15:40:32 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id i5so6381060lfe.2
        for <linux-doc@vger.kernel.org>; Wed, 14 Jul 2021 15:40:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XF9g4Kiw/Fnjhra0A3NHssg/L+MsgY/bbhNOhs2yWkg=;
        b=XwnAiopxVuee/+xvAawo1KbGDlP9AIOqV52u6nh+zQy7X8YyvYLVsIWrsG5z4hsAZo
         Us04RZB8+P1gHRtT9c5f7srdMs0z/wnINhl02yV17re/Cvj3nskjZ10AhDcDnZq6QQVD
         AjLwXMP+HKQ5AC55ituGLykCuW4g6U7vxsBmc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XF9g4Kiw/Fnjhra0A3NHssg/L+MsgY/bbhNOhs2yWkg=;
        b=a5rWcNrtJEoBwk7F1dsx1YQdCEcA25idNZ9YebGY0nuIm91lgqzMa38XOib9ui/lQO
         STpVUIxnMxaYA8F8qZekcqS+v93CMoqe/RRxxYa9RTyJHOH1sT7u96/3LPKnLEROBZKv
         1Vm9QvKfuEeCmHm8FUsUZ2AhJKAKnCMslClb1hXc5hdshYK/dgggThwFgpKoy8P1znPf
         /Vi051txtflupnB2Vmk2WAldiCY6/pkdXQw5iex/0jndWF3iXtKQ+iA6gJO+qZJ54tWL
         PN63znY1IkvaRHZu75X79yOFUFH+4ABHOkJZc425dMHYw5aWB22EUbfXep5T7BC7fBpI
         pwpg==
X-Gm-Message-State: AOAM532GsHsyEOIgLCWYU9xT6kMw+WMBDUg/L/ZieRn7Wdw/zJURLJl5
        y+ylEazRXoLZahBYEX14G2nBxUvI32S9mEdr
X-Google-Smtp-Source: ABdhPJx08Po4InrEYy8wQ1PKmQIF2cMaoCdRM7vm0nvC+8ecScje0ekSuiIU5hcvd/xLen3Z8kk3+A==
X-Received: by 2002:a19:4956:: with SMTP id l22mr287508lfj.414.1626302429336;
        Wed, 14 Jul 2021 15:40:29 -0700 (PDT)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com. [209.85.167.51])
        by smtp.gmail.com with ESMTPSA id z40sm264408lfu.146.2021.07.14.15.40.28
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Jul 2021 15:40:28 -0700 (PDT)
Received: by mail-lf1-f51.google.com with SMTP id i5so6381010lfe.2
        for <linux-doc@vger.kernel.org>; Wed, 14 Jul 2021 15:40:28 -0700 (PDT)
X-Received: by 2002:a05:6512:3f82:: with SMTP id x2mr265721lfa.421.1626302428152;
 Wed, 14 Jul 2021 15:40:28 -0700 (PDT)
MIME-Version: 1.0
References: <20210704202756.29107-1-ojeda@kernel.org> <20210704202756.29107-3-ojeda@kernel.org>
 <CAKwvOdmhRuF5eTZ2ztZBrL6BvDkA57B7OfVuvCaEMfV8nkLXCQ@mail.gmail.com>
 <CAHk-=whzXv=Fu7dQshSTyd9H1-JS5=gyKwW-GMNGccAKs4Mwpg@mail.gmail.com>
 <87mtqo1wv6.fsf@disp2133> <CAHk-=whdi_biEOrzrYn7OC+wq+ckoaa5dFAATdM=n9P7Dp0YOA@mail.gmail.com>
 <87a6mo1v0q.fsf@disp2133>
In-Reply-To: <87a6mo1v0q.fsf@disp2133>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Wed, 14 Jul 2021 15:40:12 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjWiu5uak824BeWu5J+9n1NhQ9UKDGgcUfrumra6r+Z0A@mail.gmail.com>
Message-ID: <CAHk-=wjWiu5uak824BeWu5J+9n1NhQ9UKDGgcUfrumra6r+Z0A@mail.gmail.com>
Subject: Re: [PATCH 02/17] kallsyms: increase maximum kernel symbol length to 512
To:     "Eric W. Biederman" <ebiederm@xmission.com>
Cc:     Nick Desaulniers <ndesaulniers@google.com>,
        Miguel Ojeda <ojeda@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        rust-for-linux <rust-for-linux@vger.kernel.org>,
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

On Wed, Jul 14, 2021 at 1:49 PM Eric W. Biederman <ebiederm@xmission.com> wrote:
>
> Sorry I was meaning to ask should the C symbols that get hashed
> include their types in the hash as well?  Because if everything
> is going to be hashed we need to clear definition of what we do
> with good old C symbols as well.

Oh, I guess if we wanted to be fancy, we could make the modversion
information be part of the hash.

Because we already have that, and that's kind of what it is. But I
wasn't actually thinking that fancy - I'd leave the C hash as just the
name hash with no type info.

Unless somebody really wants to do that modversions thing. It *would*
be a very natural thing to do in that "link using hashes" world view..

                Linus
