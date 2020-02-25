Return-Path: <SRS0=e/bK=4N=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C77EC4BA00
	for <linux-doc@archiver.kernel.org>; Tue, 25 Feb 2020 21:56:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4F09D24650
	for <linux-doc@archiver.kernel.org>; Tue, 25 Feb 2020 21:56:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="fcql3YFv"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729062AbgBYV4M (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 25 Feb 2020 16:56:12 -0500
Received: from mail-pg1-f195.google.com ([209.85.215.195]:38185 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729056AbgBYV4M (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 25 Feb 2020 16:56:12 -0500
Received: by mail-pg1-f195.google.com with SMTP id d6so216175pgn.5
        for <linux-doc@vger.kernel.org>; Tue, 25 Feb 2020 13:56:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=P0m56hgWfY+fSgLqZHYe9e+4kClDl7jR0dEcmYtm2LE=;
        b=fcql3YFvPmHGZI6Q8rQ5z40BgpbCCg+a/WSVyCNRZw82gO+QncFPhs+IByADEdVe9O
         la8dw8lRoMszKoFcvQDeqEpOQQjNt7Som1vTVOmlymqqVGqsb9pyrojpyu9pO/fRbhOn
         S9D7diL06Rjt+SATWhlkZEqem3mLI8ww6A2XM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=P0m56hgWfY+fSgLqZHYe9e+4kClDl7jR0dEcmYtm2LE=;
        b=nVZLa29ksRjRuoSKTYQqkec8D50KJDvQuQXihKEloC4MuFuAyyHqIAxJD0f8Uqm/HL
         TTfSR6wQQ4vVzUrd4kWMjdgyXahbup8sJEwW+eDE494oq5zFsQ+/dilCPB0vBrIch5wO
         BB/vuqjx7tzn9kT1phS2FzEbC/Xo15BQU22fh76AkghkgHw0FflydQG4r9dv9UuUCfl3
         3d4LaZ7zxioXcPPk1sgcwZ+/6igUG2Ex00IwPePBuqucmwPbyS6B3eo44Pd5cue9M10h
         cBaY/dI1VSj7WjDXsaev8E5/2STHwqBMXZVwAe+JZhZupCAE2z/vGZl3pdsHS6Ul3nTd
         P8oA==
X-Gm-Message-State: APjAAAVCfAFSae7jK83PcwvYgtsh0kjD1wesTYcMzGU9s9UhHAqXHRZE
        4ikn69f1ZhAyiUTaFBzPg9hiUQ==
X-Google-Smtp-Source: APXvYqxj+J+PuaBuGfM3BsQalMWNQHuh15kFlAIJuvZpyf3cuDJJkvtochBwcj5obIr1O3qqDWizZA==
X-Received: by 2002:a62:f251:: with SMTP id y17mr853017pfl.204.1582667771408;
        Tue, 25 Feb 2020 13:56:11 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id b12sm60452pfr.26.2020.02.25.13.56.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2020 13:56:10 -0800 (PST)
Date:   Tue, 25 Feb 2020 13:56:09 -0800
From:   Kees Cook <keescook@chromium.org>
To:     Nick Desaulniers <ndesaulniers@google.com>
Cc:     Nathan Chancellor <natechancellor@gmail.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>
Subject: Re: [PATCH] Documentation/llvm: add documentation on building w/
 Clang/LLVM
Message-ID: <202002251353.25A016CD@keescook>
References: <20200224174129.2664-1-ndesaulniers@google.com>
 <202002242003.870E5F80@keescook>
 <20200225041643.GA17425@ubuntu-m2-xlarge-x86>
 <CAKwvOdn0_EETGtBVhbRKMPqv2K04Z1N4PuOZDZ6++Ejbi9-B-w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKwvOdn0_EETGtBVhbRKMPqv2K04Z1N4PuOZDZ6++Ejbi9-B-w@mail.gmail.com>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Feb 25, 2020 at 12:59:25PM -0800, Nick Desaulniers wrote:
> On Mon, Feb 24, 2020 at 8:16 PM Nathan Chancellor
> <natechancellor@gmail.com> wrote:
> > > Should this also include an update to Documentation/process/changes.rst
> > > with the minimum version required? (I would expect this to be "9" for Clang,
> > > and "11" for ld.lld.)
> >
> > I think the clang one should be added in a separate patch that
> > solidifies that in include/linux/compiler-clang.h with a CLANG_VERSION
> > macro and version check, like in include/linux/compiler-gcc.h.
> >
> > ld.lld's minimum version should also be 9, what is the blocking issue
> > that makes it 11?
> 
> I'm super hesitant to put a minimally required version of Clang, since
> it really depends on the configs you're using.  Sure, clang-9 will
> probably work better than clang-4 for some configs, but I would say

I think it's not unreasonable to say clang-9 due to x86 not building
prior to clang-9. (Yes, other archs can build with earlier clang, but
that's true for earlier gccs too.)

> ToT clang built from source would be even better, as unrealistic as
> that is for most people.  The question of "what's our support model"
> hasn't realistically come up yet, so I don't really want to make a
> decision on that right now and potentially pigeonhole us into some
> support scheme that's theoretical or hypothetical.  We need to expand
> out the CI more, and get more people to even care about Clang, before
> we start to concern ourselves with providing an answer to the question
> "what versions of clang are supported?"  But it's just a strong
> opinion of mine, held loosely.

"Supported" is hand-wavey anyway. I would say, "this version is
_expected_ to build the kernel", etc.

> Either way, it can be done (or not) in a follow up patch.  I would
> like to land some Documentation/ even if it's not perfect, we can go
> from there.

Sounds fine, but I think we should take a specific version stand as the
"minimum" version. Being able to build x86 defconfig is a good minimum
IMO.

-- 
Kees Cook
