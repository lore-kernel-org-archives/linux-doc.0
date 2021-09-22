Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC585C433F5
	for <linux-doc@archiver.kernel.org>; Wed, 22 Sep 2021 21:16:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9AC5D61248
	for <linux-doc@archiver.kernel.org>; Wed, 22 Sep 2021 21:16:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237927AbhIVVRf (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 22 Sep 2021 17:17:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39018 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237855AbhIVVRd (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 22 Sep 2021 17:17:33 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B51EC061757
        for <linux-doc@vger.kernel.org>; Wed, 22 Sep 2021 14:16:02 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id x7so1076935edd.6
        for <linux-doc@vger.kernel.org>; Wed, 22 Sep 2021 14:16:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7XJav0dfWNxK79pvtGX/UV/+fzNxl315YNj5Lb0kUtk=;
        b=QA/EzrWbAIrSwOaNV4uqMw33DYIddOpz6ZYLeSLgSw/6W5sXis/SfJPUXmmq3UhODG
         6HTHGK+Pi7RNxhY6fHDq1cECQSdwskC8x9GDOcCAMch8XMogspIaioLO3jy91LAe9v+p
         zPQysb2+nkIu4xF1pvfTRTKDEaNJCficfXCxw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7XJav0dfWNxK79pvtGX/UV/+fzNxl315YNj5Lb0kUtk=;
        b=nQcMsqmAgZMJ1BXZ0WO+YB5xxcljAZBLApvtfaFYgJ/QLe/5nvpLXnVxyX55U8YZyl
         5nUY0GDyRAwORWx06/qOh2Ro9qepl0GFTo/X0dKHn7nomTMk2O2P73lbErZWjlfHU6K8
         qWYlZps0y2rm88FJAQnL7EQA7maxbsgfcJSDVBpWZfmIysRbfqBayjmhiXn57WDqPKER
         +ty7QpNbZ0ESWWOdCalC+0QvejKZzwWwI4m8/GWGIOIhF3vgYQekeWjPoNSL01wpYaGX
         U0dvuUA0q6StwjYq14r+vp0VaM6GpL/aAskZOJdFILJY37ii2/nE8fl5bC5OextFA5oZ
         U/0A==
X-Gm-Message-State: AOAM531KBqVl61dQUGSiPV0Qr2Xp5JpATQcAII7k2/fp6Eijo59TVxMX
        r+O5HYtU3MME39TT2+1KKexNamBzl6fkynrrtlI=
X-Google-Smtp-Source: ABdhPJxtzuykek99Uh7jPc2WAYaMgvjfA30hU8TDJ2HwHxmsBAdKs0tZznMq0neQNFAHK5esIm5dIQ==
X-Received: by 2002:a05:6402:1057:: with SMTP id e23mr1672363edu.352.1632345360731;
        Wed, 22 Sep 2021 14:16:00 -0700 (PDT)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com. [209.85.208.43])
        by smtp.gmail.com with ESMTPSA id dm8sm1810126edb.90.2021.09.22.14.16.00
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Sep 2021 14:16:00 -0700 (PDT)
Received: by mail-ed1-f43.google.com with SMTP id bx4so15284871edb.4
        for <linux-doc@vger.kernel.org>; Wed, 22 Sep 2021 14:16:00 -0700 (PDT)
X-Received: by 2002:a05:6512:12c4:: with SMTP id p4mr1044332lfg.280.1632345349597;
 Wed, 22 Sep 2021 14:15:49 -0700 (PDT)
MIME-Version: 1.0
References: <20210909200948.090d4e213ca34b5ad1325a7e@linux-foundation.org>
 <20210910031046.G76dQvPhV%akpm@linux-foundation.org> <CAHk-=wgfbSyW6QYd5rmhSHRoOQ=ZvV+jLn1U8U4nBDgBuaOAjQ@mail.gmail.com>
 <202109211630.2D00627@keescook> <af3c775a1515f97c8dbe6a6651bd6e4b6986e8cd.camel@perches.com>
 <202109211757.F38DF644@keescook> <YUraGKetS+Tgc7y9@localhost.localdomain>
In-Reply-To: <YUraGKetS+Tgc7y9@localhost.localdomain>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Wed, 22 Sep 2021 14:15:33 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjS-Jg7sGMwUPpDsjv392nDOOs0CtUtVkp=S6Q7JzFJRw@mail.gmail.com>
Message-ID: <CAHk-=wjS-Jg7sGMwUPpDsjv392nDOOs0CtUtVkp=S6Q7JzFJRw@mail.gmail.com>
Subject: Re: function prototype element ordering
To:     Alexey Dobriyan <adobriyan@gmail.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Joe Perches <joe@perches.com>,
        Andrew Morton <akpm@linux-foundation.org>, apw@canonical.com,
        Christoph Lameter <cl@linux.com>,
        Daniel Micay <danielmicay@gmail.com>,
        Dennis Zhou <dennis@kernel.org>, dwaipayanray1@gmail.com,
        Joonsoo Kim <iamjoonsoo.kim@lge.com>,
        Linux-MM <linux-mm@kvack.org>,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        mm-commits@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Miguel Ojeda <ojeda@kernel.org>,
        Pekka Enberg <penberg@kernel.org>,
        David Rientjes <rientjes@google.com>,
        Tejun Heo <tj@kernel.org>, Vlastimil Babka <vbabka@suse.cz>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Sep 22, 2021 at 12:24 AM Alexey Dobriyan <adobriyan@gmail.com> wrote:
>
> Attributes should be on their own line, they can be quite lengthy.

No, no no. They really shouldn't.

First off, no normal code should use that "__attribute__(())" syntax
anyway. It's ugly and big, and many of the attributes are
compiler-specific anyway.

So the "quite lengthy" argument is bogus, because the actual names you
should use are things like "__packed" or "__pure" or "__user" etc.

But the "on their own line" is complete garbage to begin with. That
will NEVER be a kernel rule. We should never have a rule that assumes
things are so long that they need to be on multiple lines.

We don't put function return types on their own lines either, even if
some other projects have that rule (just to get function names at the
beginning of lines or some other odd reason).

So no, attributes do not go on their own lines, and they also
generally don't go before the thing they describe.  Your examples are
wrong, and explicitly against kernel rules.

           Linus
