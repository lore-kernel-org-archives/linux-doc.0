Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B535C433DB
	for <linux-doc@archiver.kernel.org>; Wed, 24 Mar 2021 22:22:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6003F61A1D
	for <linux-doc@archiver.kernel.org>; Wed, 24 Mar 2021 22:22:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238689AbhCXWVj (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 24 Mar 2021 18:21:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238832AbhCXWVh (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 24 Mar 2021 18:21:37 -0400
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F708C06174A
        for <linux-doc@vger.kernel.org>; Wed, 24 Mar 2021 15:21:36 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id r12so35474396ejr.5
        for <linux-doc@vger.kernel.org>; Wed, 24 Mar 2021 15:21:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rasmusvillemoes.dk; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=kt9P1sP07wdx7f1Xs2ss4edkv9Xos7a6QFQrRD5299A=;
        b=Pr78ooKReei1r0cbLnfVzNvxWYHXM30lXKKN69Z+8Vh63ks81yWbw0IJ1bYoGOXDlt
         +Ssn5sClPUqMPyUzOJOOLCm5kzHRrJu2LD5k7Dwz2NrumsZFs9/KAL/XJ3j7VjGNwwKQ
         tA6RgCe6hvksMePDBKsuUy2jhctBiK2jJk8Gc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=kt9P1sP07wdx7f1Xs2ss4edkv9Xos7a6QFQrRD5299A=;
        b=cdpZ8bO5Y5gMWjMxET2Wcb0Lzbq2pPPiQifvdV9t2d1F7aqLb7HRHUtHK0Dd21logM
         TDOlRViPqKgaJKvLTSYNtnjK5BlcsfbFDzQVNK6bdPAaAR7iqKXS8vlouQVO96Rz99/Y
         FzxXHsDKhBLbxRWoEI4Q2QW6Qs1EksSWUHEGYwe+jZ3ZPhX5fUK575XXEWh6+IVRnvFQ
         yihL18m0cuFCRITxwJZIj1ZaT5CvPvGG3DNP8E+s0a16v5m58BjjdbzkxXcK/uzCV3uI
         x166QSI0pyDMH6ShDgQp2DUcmVAEImkH0skgO5HPr8ns6l9smBTSaxCHrKhq4wNB6HW4
         taqw==
X-Gm-Message-State: AOAM531FuURJbk/Ij0N1fgVpRUR5xWhoEuINVNUglxRXv2NnMe4jd284
        mFBzMoE1hqjtuXrI3cB7c8EWvQ==
X-Google-Smtp-Source: ABdhPJyWpxCJypzm5ALKZnZCe6HWwSFkFptWPhCbyzSQ1D2sVOc5Rpe91qZvCDTu4NfPmOfrNuFAoQ==
X-Received: by 2002:a17:906:3f87:: with SMTP id b7mr6027998ejj.139.1616624495324;
        Wed, 24 Mar 2021 15:21:35 -0700 (PDT)
Received: from [192.168.1.149] ([80.208.71.248])
        by smtp.gmail.com with ESMTPSA id bm10sm1808021edb.2.2021.03.24.15.21.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Mar 2021 15:21:34 -0700 (PDT)
Subject: Re: [PATCH v2 04/12] module: Add printk format to add module build ID
 to stacktraces
To:     Stephen Boyd <swboyd@chromium.org>,
        Andrew Morton <akpm@linux-foundation.org>
Cc:     linux-kernel@vger.kernel.org, Jiri Olsa <jolsa@kernel.org>,
        Alexei Starovoitov <ast@kernel.org>,
        Jessica Yu <jeyu@kernel.org>,
        Evan Green <evgreen@chromium.org>,
        Hsin-Yi Wang <hsinyi@chromium.org>,
        Petr Mladek <pmladek@suse.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-doc@vger.kernel.org, Matthew Wilcox <willy@infradead.org>
References: <20210324020443.1815557-1-swboyd@chromium.org>
 <20210324020443.1815557-5-swboyd@chromium.org>
 <6dfb8ca2-20f3-e58a-ad6b-db6a6472afe0@rasmusvillemoes.dk>
 <161661308874.3012082.15483899786731677633@swboyd.mtv.corp.google.com>
From:   Rasmus Villemoes <linux@rasmusvillemoes.dk>
Message-ID: <2785cae4-20be-85b5-7838-9a6dbd2baf72@rasmusvillemoes.dk>
Date:   Wed, 24 Mar 2021 23:21:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <161661308874.3012082.15483899786731677633@swboyd.mtv.corp.google.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 24/03/2021 20.11, Stephen Boyd wrote:
> Quoting Rasmus Villemoes (2021-03-24 02:57:13)

>>
>> Is there any reason you didn't just make b an optional flag that could
>> be specified with or without R? I suppose the parsing is more difficult
>> with several orthogonal flags (see escaped_string()), but it's a little
>> easier to understand. Dunno, it's not like we're gonna think of 10 other
>> things that could be printed for a symbol, so perhaps it's fine.
>>
> 
> I think I follow. So %pSb or %pSRb? If it's easier to understand then
> sure. I was trying to avoid checking another character beyond fmt[1] but
> it should be fine if fmt[1] is already 'R'.
> 

I don't know. On the one hand, it seems sensible to allow such "flag"
modifiers to appear independently and in any order. Because what if some
day we think of some other property of the symbol we might want to
provide access to via a "z" flag; when to allow all combinations of the
R, b and z functionality we'd have to use four more random letters to
stand for various combinations of those flags. On the other hand,
vsprintf.c is already a complete wild west of odd conventions for
%p<foo>, and it's not like symbol_string() gets extended every other
release, and I can certainly understand the desire to keep the parsing
of fmt minimal. So 'r' to mean 'Rb' is ok by me if you prefer that.

Rasmus
