Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B5BBC433EF
	for <linux-doc@archiver.kernel.org>; Tue, 11 Jan 2022 17:50:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344713AbiAKRu6 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 11 Jan 2022 12:50:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47746 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344022AbiAKRu6 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 11 Jan 2022 12:50:58 -0500
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0524BC061748
        for <linux-doc@vger.kernel.org>; Tue, 11 Jan 2022 09:50:58 -0800 (PST)
Received: by mail-ed1-x52c.google.com with SMTP id o6so70379076edc.4
        for <linux-doc@vger.kernel.org>; Tue, 11 Jan 2022 09:50:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=S+o36HqJyPabSJM6qxiXAbPNSzH3hT+Ar4koIOaCZD0=;
        b=fkLdJd8K8wdXwYwvY0osqkiYuLRASRV7iBfN8SZv/EKDgP0s0+LCVi0O3e6PonZ3qJ
         ecYvUOMstnQGXFphVswgObo8yA29aRGxzyOiBr6Y48lppQlGPBm/EmUaEu4eZhiIZp5g
         PhhhTNkHlBahJ2BulJEjbNG+r8oJMjOo0vlMM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=S+o36HqJyPabSJM6qxiXAbPNSzH3hT+Ar4koIOaCZD0=;
        b=juzTklAq4Y9DnhbGeQilke/cGAxqEzNRzby/283NeZ0UOnab6CmSO5mn/oTftBI/Dz
         ykP8iCXKKTPHGnpKSayAa1z6/wJ/jySWm3Xx+gTM2fgysc2Q9Y9lc8LQHx+lXZOwO7au
         21Jv3qA1cUy2l9IznoJlEKweYTYXGQg/Rk1r5QD7eu9WIBT4Sw6rzxIuf5+bwZkJd2ZK
         46CFmVLiG2u2nPxeO6KZrq35z5V8TdsDcTU9cRHiEwlna/dAR4rJH880HTFouSf6hmVK
         3ArAZ9j//bvKYdHp1uEms/ysb9ybN9JY34oA07GbyLZnv9hXU1dSiXdxkDDWp/I3CPT6
         BPfA==
X-Gm-Message-State: AOAM532F3T2jmQkvMxf6B0moqtGuJThMU54/3iXMS0IY0EBytIfhoj5N
        JEeLKvPdQ0IimydCMxZ9DT/Z+GlNDcZC8dqZnfg=
X-Google-Smtp-Source: ABdhPJzPNZ5u8HORzbf9XYxaMM+dV0gEe5IetPV4yxrGezITKo5P0t+3C5lLQiRdYYA7MeGl86k7KA==
X-Received: by 2002:a17:907:7247:: with SMTP id ds7mr4745384ejc.401.1641923456205;
        Tue, 11 Jan 2022 09:50:56 -0800 (PST)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com. [209.85.221.45])
        by smtp.gmail.com with ESMTPSA id s20sm5317383edd.41.2022.01.11.09.50.55
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Jan 2022 09:50:55 -0800 (PST)
Received: by mail-wr1-f45.google.com with SMTP id r28so6060435wrc.3
        for <linux-doc@vger.kernel.org>; Tue, 11 Jan 2022 09:50:55 -0800 (PST)
X-Received: by 2002:adf:f54e:: with SMTP id j14mr4682353wrp.442.1641923455029;
 Tue, 11 Jan 2022 09:50:55 -0800 (PST)
MIME-Version: 1.0
References: <87v8yrjtqe.fsf@meer.lwn.net>
In-Reply-To: <87v8yrjtqe.fsf@meer.lwn.net>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Tue, 11 Jan 2022 09:50:39 -0800
X-Gmail-Original-Message-ID: <CAHk-=wiR_RfCq+ckZOEoV14CAV1+Vua3DM9XU30fxaVhqJ9RMQ@mail.gmail.com>
Message-ID: <CAHk-=wiR_RfCq+ckZOEoV14CAV1+Vua3DM9XU30fxaVhqJ9RMQ@mail.gmail.com>
Subject: Re: [GIT PULL] Documentation for 5.17
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Jan 10, 2022 at 11:06 AM Jonathan Corbet <corbet@lwn.net> wrote:
>
>  - The ability to pick your own theme for HTML builds; if the default
>    "Read the Docs" theme isn't ugly enough for you, you can now pick
>    an uglier one.

Wingdings isn't a choice, it's a way of life.

> The KUnit documentation update leads to a couple of simple conflicts
> with the KUnit tree - but they wanted this work to go via this path.

Well, I had to pick one of the configuration note rewrites, and who
knows if I picked the right one.

            Linus
