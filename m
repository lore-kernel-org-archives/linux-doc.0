Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 6BDA57D062
	for <lwn-linux-doc@archive.lwn.net>; Mon,  2 Jul 2018 19:17:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1753524AbeGBTQs (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 2 Jul 2018 15:16:48 -0400
Received: from mail-ua0-f193.google.com ([209.85.217.193]:35749 "EHLO
        mail-ua0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753002AbeGBTQp (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 2 Jul 2018 15:16:45 -0400
Received: by mail-ua0-f193.google.com with SMTP id q12-v6so1299727ual.2
        for <linux-doc@vger.kernel.org>; Mon, 02 Jul 2018 12:16:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=zM8QdUYcU79fmKmDab6fB3QO6ufAC+g62NgcxdseyEE=;
        b=hkun1gktPhl05hCgoKO9IHYr2GlqavZXde45ML0ZGNGf+MSUtAmd/O1bJp/e49UdW3
         uK6elNgGXRJ7Y7TEqXapmnMJawKGKoS/WS3jTVVdi6Gy2oc87msugrkKdUwqkbfIx+v2
         ghEiTylkhhL2XIdHIj2T6dVsQ+ULY/X4AnmyxQZrODy6Hz1tNcMKoM9fufgSx/dYnHJ8
         tgr8nrTkgFd1w2yHCAV44n5lFJRxxuayg4bhEyWY25mV3TZoKqXofAOnX3YmpZ7et2Dm
         pdKQ8BdP+DiDaV6PmgXDB+0UmY5hUIt1kYX5hoGkPljjfImmVGHCiy9SkCavNZVrCIZt
         0jSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=zM8QdUYcU79fmKmDab6fB3QO6ufAC+g62NgcxdseyEE=;
        b=g6sM2bjX2Nr3+Ad1MVP5IJeG7ahXSbS1S2T3RV8+Fk3Kycfw5lPWQsGcXiowsjIh1u
         HlthIJYiRti2dgF3KgHqH9TCiwqHffYEVfuhp5zHWZLlM4fucKzEtD/Gx5wE55c6sYEo
         niQD1acoQ+cDUIziVYo2I75J6qvFz6+gchw23pciB2WEuL4nG1w/Zl6ftwhik2UgRozg
         qISSk7KZu2hbD7w85kfPGnxmeJ+IkGMf9vfO0BXOGB3RzhTRX+5PCCONNYpiZA6blevR
         mFZn9bzesxHu4jm4ZdQWLKEfa3MkZjBUZynJCL76ZQ5u1dtD32ZsvQt4A/vOdXGsopxD
         vrbw==
X-Gm-Message-State: APt69E2qElwlA3XvTw6i1ihQWIdm4xQZ31Wzns7dfeUoiqDlPtFM+yE7
        Zx9zna0Hxp9MT89mqNlCOZmbinexXag9AiEReg80uA==
X-Google-Smtp-Source: AAOMgpemPtYrmgCK0Q5ateivPvC0Req6qaZzLHXDJH1esP4jmEjDxbCLYUkb6FbOxJxJzudffyuQCciGqORSzzSDYOU=
X-Received: by 2002:a9f:2523:: with SMTP id 32-v6mr8853089uaz.101.1530559003965;
 Mon, 02 Jul 2018 12:16:43 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a1f:9d83:0:0:0:0:0 with HTTP; Mon, 2 Jul 2018 12:16:42 -0700 (PDT)
In-Reply-To: <20180629194117.01b2d31e805808eee5c97b4d@linux-foundation.org>
References: <cover.1530018818.git.andreyknvl@google.com> <20180627160800.3dc7f9ee41c0badbf7342520@linux-foundation.org>
 <CAAeHK+xz552VNpZxgWwU-hbTqF5_F6YVDw3fSv=4OT8mNrqPzg@mail.gmail.com>
 <20180628124039.8a42ab5e2994fb2876ff4f75@linux-foundation.org>
 <CAAeHK+xsBOKghUp9XhpfXGqU=gjSYuy3G2GH14zWNEmaLPy8_w@mail.gmail.com> <20180629194117.01b2d31e805808eee5c97b4d@linux-foundation.org>
From:   Evgenii Stepanov <eugenis@google.com>
Date:   Mon, 2 Jul 2018 12:16:42 -0700
Message-ID: <CAFKCwrjxGEa6CLJnjmNy+92d2GSUkoymQ6Sm91CDpMZcJCcWCA@mail.gmail.com>
Subject: Re: [PATCH v4 00/17] khwasan: kernel hardware assisted address sanitizer
To:     Andrew Morton <akpm@linux-foundation.org>
Cc:     Andrey Konovalov <andreyknvl@google.com>,
        Andrey Ryabinin <aryabinin@virtuozzo.com>,
        Alexander Potapenko <glider@google.com>,
        Dmitry Vyukov <dvyukov@google.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        Christoph Lameter <cl@linux.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Marc Zyngier <marc.zyngier@arm.com>,
        Dave Martin <dave.martin@arm.com>,
        Ard Biesheuvel <ard.biesheuvel@linaro.org>,
        "Eric W . Biederman" <ebiederm@xmission.com>,
        Ingo Molnar <mingo@kernel.org>,
        Paul Lawrence <paullawrence@google.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Arnd Bergmann <arnd@arndb.de>,
        "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kate Stewart <kstewart@linuxfoundation.org>,
        Mike Rapoport <rppt@linux.vnet.ibm.com>,
        kasan-dev <kasan-dev@googlegroups.com>,
        linux-doc@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-sparse@vger.kernel.org,
        Linux Memory Management List <linux-mm@kvack.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Kostya Serebryany <kcc@google.com>,
        Lee Smith <Lee.Smith@arm.com>,
        Ramana Radhakrishnan <Ramana.Radhakrishnan@arm.com>,
        Jacob Bramley <Jacob.Bramley@arm.com>,
        Ruben Ayrapetyan <Ruben.Ayrapetyan@arm.com>,
        Jann Horn <jannh@google.com>,
        Mark Brand <markbrand@google.com>,
        Chintan Pandya <cpandya@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Looking at a live Android device under load, slab (according to
/proc/meminfo) + kernel stack take 8-10% available RAM (~350MB).
Kasan's overhead of 2x - 3x on top of it is not insignificant.

On Fri, Jun 29, 2018 at 7:41 PM, Andrew Morton
<akpm@linux-foundation.org> wrote:
> On Fri, 29 Jun 2018 14:45:08 +0200 Andrey Konovalov <andreyknvl@google.com> wrote:
>
>> >> What kind of memory consumption testing would you like to see?
>> >
>> > Well, 100kb or so is a teeny amount on virtually any machine.  I'm
>> > assuming the savings are (much) more significant once the machine gets
>> > loaded up and doing work?
>>
>> So with clean kernel after boot we get 40 kb memory usage. With KASAN
>> it is ~120 kb, which is 200% overhead. With KHWASAN it's 50 kb, which
>> is 25% overhead. This should approximately scale to any amounts of
>> used slab memory. For example with 100 mb memory usage we would get
>> +200 mb for KASAN and +25 mb with KHWASAN. (And KASAN also requires
>> quarantine for better use-after-free detection). I can explicitly
>> mention the overhead in %s in the changelog.
>>
>> If you think it makes sense, I can also make separate measurements
>> with some workload. What kind of workload should I use?
>
> Whatever workload people were running when they encountered problems
> with KASAN memory consumption ;)
>
> I dunno, something simple.  `find / > /dev/null'?
>
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
