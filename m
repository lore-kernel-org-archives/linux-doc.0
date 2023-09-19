Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A22DCCE79A8
	for <linux-doc@archiver.kernel.org>; Tue, 19 Sep 2023 18:50:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232480AbjISSuT (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 19 Sep 2023 14:50:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42330 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232475AbjISSuS (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 19 Sep 2023 14:50:18 -0400
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C4B3BE
        for <linux-doc@vger.kernel.org>; Tue, 19 Sep 2023 11:50:09 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-9ad8a33fd0dso772952666b.3
        for <linux-doc@vger.kernel.org>; Tue, 19 Sep 2023 11:50:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1695149407; x=1695754207; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=rf2MsE0QRbUtAnaD3OhEqfmgpq4OLQ94+2y/+SBxQck=;
        b=BHuf7M5qiAHE+klaonc0AL2HWMjXHFy3QADuhPJ/zR+cj29HVAFOdhVgxNUzRNKDuf
         mIpWlKWHB2paSJobs+kBDVEepZTw+0qs+85TA0IpP6J9/q/S5HUH50V5gej3Y1KNHoLj
         uxF+KtToMapCq5gmzmMRIRVmCVtgRE78VfbTs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695149407; x=1695754207;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rf2MsE0QRbUtAnaD3OhEqfmgpq4OLQ94+2y/+SBxQck=;
        b=qGylD7VSA14ucakGHAeq15C3Sut10a9+qd5ztlDkdXjoJ2NbQYYivQBGYaoG5on6wX
         wsLvhWv360HA7jwVOYoKiWfPxUpaoA+BIgprdyymERCOPsIpI51jP48BBogSUXXoPm2J
         wMznC5VTfyaoQT63H3sRdez+3wEoNLQrVLN9yCmPO7j7Z2m+zUw+Lo8MdgVhOlpkCcc+
         ufr66dqU3FOdnnjT1zxYtubM31dmUIloDXy51YdHuKFSAmEVl66Op6bSmZJU3moiFXzM
         G1Ula/I1/+hm0x4pLyvPm8SaW6mmJxeIWREuN+9jOClQ9uxw+3721/XY2Uaaap7uRjjD
         7bag==
X-Gm-Message-State: AOJu0YzY1L+1AR4VJZzV9t5uBOolieyVl+ymg2yG0XNMGws4+P3c7m0U
        FdCSzWB58Np03npbGGetsY8Ydm+kR2daw/g9rq187F8R
X-Google-Smtp-Source: AGHT+IF/DMni5CZIwE6eZ5kPH/URM4x8vK+TWU1s4MEaT7GFZ5kCzW8m3ltZg/pWLK2Ti1IeBWMqeQ==
X-Received: by 2002:a17:906:8f:b0:993:d617:bdc2 with SMTP id 15-20020a170906008f00b00993d617bdc2mr234694ejc.75.1695149407489;
        Tue, 19 Sep 2023 11:50:07 -0700 (PDT)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com. [209.85.208.42])
        by smtp.gmail.com with ESMTPSA id a18-20020a170906191200b0098e42bef736sm8204637eje.176.2023.09.19.11.50.06
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Sep 2023 11:50:07 -0700 (PDT)
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-52bcb8b199aso7501056a12.3
        for <linux-doc@vger.kernel.org>; Tue, 19 Sep 2023 11:50:06 -0700 (PDT)
X-Received: by 2002:a50:ee14:0:b0:530:d8df:afaa with SMTP id
 g20-20020a50ee14000000b00530d8dfafaamr219079eds.41.1695149405833; Tue, 19 Sep
 2023 11:50:05 -0700 (PDT)
MIME-Version: 1.0
References: <20230915105933.495735-1-matteorizzo@google.com>
 <7a4f5128-28fd-3c5f-34c2-1c34f4448174@intel.com> <1d7573c0-ebbc-6ed2-f152-1045eb0542f9@os.amperecomputing.com>
 <CAHKB1w+rVyww0UrHhzeGfPA7FM482Z-7ApzXvekVqLHvTDAV3Q@mail.gmail.com>
 <ZQiLX0W2Tcr+wdJT@gmail.com> <CAHk-=wgGzB4u-WZsDpdgjwX1w5=9CLE0gorhaNFD09P1FUGeuQ@mail.gmail.com>
 <CAHKB1w+9GgY_e6J+rZ4zDaXrPZab5xteTuDEH0Z2hWe6x-pT5g@mail.gmail.com>
In-Reply-To: <CAHKB1w+9GgY_e6J+rZ4zDaXrPZab5xteTuDEH0Z2hWe6x-pT5g@mail.gmail.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Tue, 19 Sep 2023 11:49:48 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiWReaH-khCA_uiKC5xJSQkDudEfybdepSZXKvdXZkZsg@mail.gmail.com>
Message-ID: <CAHk-=wiWReaH-khCA_uiKC5xJSQkDudEfybdepSZXKvdXZkZsg@mail.gmail.com>
Subject: Re: [RFC PATCH 00/14] Prevent cross-cache attacks in the SLUB allocator
To:     Matteo Rizzo <matteorizzo@google.com>
Cc:     Ingo Molnar <mingo@kernel.org>,
        "Lameter, Christopher" <cl@os.amperecomputing.com>,
        Dave Hansen <dave.hansen@intel.com>, penberg@kernel.org,
        rientjes@google.com, iamjoonsoo.kim@lge.com,
        akpm@linux-foundation.org, vbabka@suse.cz,
        roman.gushchin@linux.dev, 42.hyeyoo@gmail.com,
        keescook@chromium.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-mm@kvack.org,
        linux-hardening@vger.kernel.org, tglx@linutronix.de,
        mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com,
        x86@kernel.org, hpa@zytor.com, corbet@lwn.net, luto@kernel.org,
        peterz@infradead.org, jannh@google.com, evn@google.com,
        poprdi@google.com, jordyzomer@google.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, 19 Sept 2023 at 08:48, Matteo Rizzo <matteorizzo@google.com> wrote:
>
> On Mon, 18 Sept 2023 at 20:05, Linus Torvalds
> <torvalds@linux-foundation.org> wrote:
> >
> > ... and equally importantly, what about DMA?
>
> I'm not exactly sure what you mean by this, I don't think this should
> affect the performance of DMA.

I was more worried about just basic correctness.

We've traditionally had a lot of issues with using virtual addresses
for dma, simply because we've got random drivers, and I'm not entirely
convinced that your "virt_to_phys()" update will catch it all.

IOW, even on x86-64 - which is hopefully better than most
architectures because it already has that double mapping issue - we
have things like

        unsigned long paddr = (unsigned long)vaddr - __PAGE_OFFSET;

in other places than just the __phys_addr() code.

The one place I grepped for looks to be just boot-time AMD memory
encryption, so wouldn't be any slab allocation, but ...

               Linus
