Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_IN_DEF_DKIM_WL
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3D9CC07E9A
	for <linux-doc@archiver.kernel.org>; Wed, 14 Jul 2021 17:54:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CC6406115B
	for <linux-doc@archiver.kernel.org>; Wed, 14 Jul 2021 17:54:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230312AbhGNR5s (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 14 Jul 2021 13:57:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229806AbhGNR5s (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 14 Jul 2021 13:57:48 -0400
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com [IPv6:2607:f8b0:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C547C061760
        for <linux-doc@vger.kernel.org>; Wed, 14 Jul 2021 10:54:56 -0700 (PDT)
Received: by mail-ot1-x329.google.com with SMTP id o72-20020a9d224e0000b02904bb9756274cso3378698ota.6
        for <linux-doc@vger.kernel.org>; Wed, 14 Jul 2021 10:54:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jrD1pQ3OBKYY3c2yMtsYHqlgwFHdU07pE4enP3uNpXI=;
        b=mXM94q6eWDzYOpyvImS9eQ8zAI6VTBDihi0v+PaVTA5xcwni6yfsr0CBel81joQIRn
         Q3hUzE22kWqcLiDc4JlAEcGtcdb5S9kPy+j31Gp1WtEr0WAmWNx2HPDqIb2gSkqQHuK5
         Der90yY3k7Zkx0r9eOiJHqODovoA9o0IazPSJDb8s8GWIovenhp/mW/sgXWbzTuULAgf
         sCMU8qPGcJRE56C/FqFhbq75MZtp+k6tDxx3W/qsykU4t2PJxQ04XFnmb+Zt5QcJt6ZN
         CfEAm8JTEF3euTOoMi7Ze9GgckUYgwNjdLDqCfNwYl3N2KXoiMIztLE2X9pYi3v0gTOX
         Rjww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jrD1pQ3OBKYY3c2yMtsYHqlgwFHdU07pE4enP3uNpXI=;
        b=YTPZh1FnLzvPBOL7HSVqSuWz3BUAGUqZ9GKiNDQMwiQjSVO+v5a90EHScEp5bVa0gC
         hRPieXPVCiefbCJFRonxVA851iOKsOtc+AEgVQi+kP+YF3nnsg6oZC1aKKw30xZSfF43
         Wn0MdBAveMYe6+VJRLTaDCzFRSmIzq5lp8+ul4LSk0gFybwyuN/e67RsdWKN1yqba2cx
         aV/fyCiCOUV05rEWpF7Mf+u5goJSCQW6MFmHd+itVA0emq4urcKf+j5fOapgkNXEDe99
         eqYO8m7Ltmkg9YsEniCUo1vOz1xNnOusqt+wVLxvOPJMLTJII0bO+eWg6nl2i1l93gKT
         hICw==
X-Gm-Message-State: AOAM531aNj3gpKgPQMNDWZFaSYVOCOHIKlaYncFuPDtLO1sJ7S4l1LHl
        c8jvgH3p0pImbI8/SG0cMSw3FmGzbHPhO0GtAfdTqQ==
X-Google-Smtp-Source: ABdhPJyNOpkHIq1v8InV3LUaESTWKz/ywm13RR9OPuJloAv8GjTzcdQMHnmKgIa8CcW2pyfhzJ6x9nq5gr20/dRpi/Q=
X-Received: by 2002:a9d:650e:: with SMTP id i14mr9109289otl.233.1626285295243;
 Wed, 14 Jul 2021 10:54:55 -0700 (PDT)
MIME-Version: 1.0
References: <20210714082145.2709233-1-elver@google.com> <20210714173755.1083-1-yzhong@purestorage.com>
In-Reply-To: <20210714173755.1083-1-yzhong@purestorage.com>
From:   Marco Elver <elver@google.com>
Date:   Wed, 14 Jul 2021 19:54:34 +0200
Message-ID: <CANpmjNNBjD3KnNCu+9nF8bKDyrjpkZMwkWiZOe83FgZomcb_3w@mail.gmail.com>
Subject: Re: [PATCH mm v2] kfence: show cpu and timestamp in alloc/free info
To:     Yuanyuan Zhong <yzhong@purestorage.com>
Cc:     akpm@linux-foundation.org, corbet@lwn.net, dvyukov@google.com,
        glider@google.com, joern@purestorage.com,
        kasan-dev@googlegroups.com, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, 14 Jul 2021 at 19:38, 'Yuanyuan Zhong' via kasan-dev
<kasan-dev@googlegroups.com> wrote:
> > +     /* Timestamp matches printk timestamp format. */
> > +     seq_con_printf(seq, "%s by task %d on cpu %d at %lu.%06lus:\n",
> > +                    show_alloc ? "allocated" : "freed", meta->alloc_track.pid,
> > +                    meta->alloc_track.cpu, (unsigned long)ts_sec, rem_nsec / 1000);
>
> s/meta->alloc_track\./track->/

Thanks for spotting this!

v3: https://lkml.kernel.org/r/20210714175312.2947941-1-elver@google.com
