Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDBB9C433EF
	for <linux-doc@archiver.kernel.org>; Thu, 26 May 2022 16:42:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344527AbiEZQmf (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 26 May 2022 12:42:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48658 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239430AbiEZQme (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 26 May 2022 12:42:34 -0400
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3C0D25EBB
        for <linux-doc@vger.kernel.org>; Thu, 26 May 2022 09:42:33 -0700 (PDT)
Received: by mail-ed1-x52b.google.com with SMTP id fd25so2487244edb.3
        for <linux-doc@vger.kernel.org>; Thu, 26 May 2022 09:42:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=CS+0C9116uvsXBY7Qgz+7y8K9WB8FdT9j6xZ5iT4ego=;
        b=La+B/5HOPMqeQ2jcp0ah8wbzOcZKyNemQaHwQ4VCK7IBBU57xfK48vqU0oScXSzYwP
         5FnoG3FzyCWct1+Ebttkf5m6Z2FAUua2Tu7YIIk+bRLhRZQRZZpI0mB4N9bHIjQHTMOA
         Fnw2mLEgcWV/Qt2LRpttaqkCrTmAhUxy6QssE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CS+0C9116uvsXBY7Qgz+7y8K9WB8FdT9j6xZ5iT4ego=;
        b=s0Fbmc8PdZdJIqrY4zc0Mt9cTJLZphUPY/8/ItNZZ4LWDEO/zBXeaPVoUOpfrNn4Og
         1POd9bTVkBfc59LkFFMkip8ETRepeuxjvngkXB0gsK2LqdW+tS54C1igAyqEatX5y82H
         vzGcY876jeTAudxnTjPCowzAb9QhAxWIIqHcOv0vHuylt1TE4YMaMXeEmRnKaMB9l6db
         mudwMdCyGSn4ARIxl6lMdk6TxXm3ZWiD/Tf56/3dsVA4UVCJRwJuyKZNbndy+vMGZxjC
         E2//oCYwsFlaRl52GO3W5H6uj8ZGOVlI8pmfSmLUVXHa1LKKKULSYdci/dTuLqUw53qK
         7Tng==
X-Gm-Message-State: AOAM533yjwavuSzwH8KqbGg7b7vPd26lj/O3NnYqzgeEZEGiTTaMHGHZ
        Q9oy/F757bJZzaJ1NIEK9LrRZiYhkEq6fXyHY2c=
X-Google-Smtp-Source: ABdhPJxMssx79zQZxBXOMQPFzF2LaZZy8KORc09fWzW6oi/5PE6tSdeVX9cONZ6IoBObR9UB0MK2mw==
X-Received: by 2002:aa7:c999:0:b0:42b:def5:86e4 with SMTP id c25-20020aa7c999000000b0042bdef586e4mr3017276edt.163.1653583352182;
        Thu, 26 May 2022 09:42:32 -0700 (PDT)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com. [209.85.221.52])
        by smtp.gmail.com with ESMTPSA id c23-20020a50f617000000b0042b765c2448sm982195edn.80.2022.05.26.09.42.30
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 May 2022 09:42:30 -0700 (PDT)
Received: by mail-wr1-f52.google.com with SMTP id s28so2822900wrb.7
        for <linux-doc@vger.kernel.org>; Thu, 26 May 2022 09:42:30 -0700 (PDT)
X-Received: by 2002:a5d:6da6:0:b0:20f:bc8a:9400 with SMTP id
 u6-20020a5d6da6000000b0020fbc8a9400mr25553633wrs.274.1653583349904; Thu, 26
 May 2022 09:42:29 -0700 (PDT)
MIME-Version: 1.0
References: <20220526151706.331557-1-helgaas@kernel.org>
In-Reply-To: <20220526151706.331557-1-helgaas@kernel.org>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Thu, 26 May 2022 09:42:13 -0700
X-Gmail-Original-Message-ID: <CAHk-=whP4fH1_ZyWFAvzBjG_Qa1U0+iAnT-iJsmM9DwvNEtWdw@mail.gmail.com>
Message-ID: <CAHk-=whP4fH1_ZyWFAvzBjG_Qa1U0+iAnT-iJsmM9DwvNEtWdw@mail.gmail.com>
Subject: Re: [PATCH v2] linux/types.h: Restore __bitwise__ definition
To:     Bjorn Helgaas <helgaas@kernel.org>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        "Michael S . Tsirkin" <mst@redhat.com>,
        Jiri Slaby <jirislaby@kernel.org>, llvm@lists.linux.dev,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, May 26, 2022 at 8:17 AM Bjorn Helgaas <helgaas@kernel.org> wrote:
>
> Restore the __bitwise__ definition.

Thanks, but I already ended up applying this yesterday,

                   Linus
