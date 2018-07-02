Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 5BDC07D043
	for <lwn-linux-doc@archive.lwn.net>; Mon,  2 Jul 2018 20:22:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1752686AbeGBUW2 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 2 Jul 2018 16:22:28 -0400
Received: from mail-ua0-f193.google.com ([209.85.217.193]:44839 "EHLO
        mail-ua0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752185AbeGBUW0 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 2 Jul 2018 16:22:26 -0400
Received: by mail-ua0-f193.google.com with SMTP id v15-v6so10825628ual.11
        for <linux-doc@vger.kernel.org>; Mon, 02 Jul 2018 13:22:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=DZTBWkBvc3s6b5/8FNQDgU2F5m6kB0RUONZYE0rCNzA=;
        b=RQw33hFZlr62q4fW1W2GrPeZcbVZLDaSJZoa6oo6OSrbiwuPJlR+B6Y6kTyRV/x7Rq
         +cXPwxjfqVPND/f2uASUgl1r2G/ouYqIsQlZVhPMcLoAQ1gApxM9qLOYag6N9AJJLEty
         AloaAEHgghdna0/N4yziYab+v5aN3wlXPwiyzRczljNB+0Iw6gw/NEYxnVVGSX6OKnRO
         RHZUGKMDU81fmvN+AGwGSHlfmo8p4iG2IEUP65SgbVeDJXeDO2ZKQAwUdW1TnGTWeRNx
         qMJvh3ANDyKYWnnAaaWWJkPr76bgLsRqNWuIYtfRPjrpfkongRWdgIY2Z5w/UGWQmszd
         lR+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=DZTBWkBvc3s6b5/8FNQDgU2F5m6kB0RUONZYE0rCNzA=;
        b=Xk+RXO16jlhPHPWzvfe8TECDBwj0grNJc+8Gc9TAOoAhDD6WTkKshf63npqXUM2EAF
         4lwAQ4hQOqTqAc/tLmyp5vS6OeLifGGSXA07teG7rP5gAtYByK+P6KDriXMgdJY4jvHW
         1uUT9PRzTJIN0wMnckmbUgkBn92IQ+XF/zZHTdjKRPM3JLvf6hlM7BswTPKsA77Dmmb8
         dHfBqoFlMY7F0/uCrMAKpKRpUTJPFGgRneKmV1UX/YVwve4OTdj0oMVjM0WQCB8oylI+
         KrxPG8pldez4kZwE1AZjJ2GaMr3xcBzRvjK0HKfa5Q8uIuRetGQc4wo8n7cf55pJbA8l
         XFwQ==
X-Gm-Message-State: APt69E1flnP0rkjnIlHYPSiLIFnvkb1qr8djY32UoBuUo2titqsBkzdv
        7R0X4puSQoUbY5HLA84c12xGlYDhEdg7Dp+ZH/gSsQ==
X-Google-Smtp-Source: AAOMgpccMptwiPW//Pk+1Cld7aNqUNL72OwwXGoGFwr2HD6EG3Je2acSfBi9JXQ/aYcB2KI3ZBvmP7elwYKfXvk23S0=
X-Received: by 2002:a9f:3d6e:: with SMTP id m46-v6mr16664810uai.17.1530562944456;
 Mon, 02 Jul 2018 13:22:24 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a1f:9d83:0:0:0:0:0 with HTTP; Mon, 2 Jul 2018 13:22:23 -0700 (PDT)
In-Reply-To: <20180702122112.267261b1e1609cf522753cf3@linux-foundation.org>
References: <cover.1530018818.git.andreyknvl@google.com> <20180627160800.3dc7f9ee41c0badbf7342520@linux-foundation.org>
 <CAAeHK+xz552VNpZxgWwU-hbTqF5_F6YVDw3fSv=4OT8mNrqPzg@mail.gmail.com>
 <20180628124039.8a42ab5e2994fb2876ff4f75@linux-foundation.org>
 <CAAeHK+xsBOKghUp9XhpfXGqU=gjSYuy3G2GH14zWNEmaLPy8_w@mail.gmail.com>
 <20180629194117.01b2d31e805808eee5c97b4d@linux-foundation.org>
 <CAFKCwrjxGEa6CLJnjmNy+92d2GSUkoymQ6Sm91CDpMZcJCcWCA@mail.gmail.com> <20180702122112.267261b1e1609cf522753cf3@linux-foundation.org>
From:   Evgenii Stepanov <eugenis@google.com>
Date:   Mon, 2 Jul 2018 13:22:23 -0700
Message-ID: <CAFKCwri_W8qEw-qMs+gXGqMGdZO82WpCiVpzcG4kinEyL7+zGg@mail.gmail.com>
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

On Mon, Jul 2, 2018 at 12:21 PM, Andrew Morton
<akpm@linux-foundation.org> wrote:
> On Mon, 2 Jul 2018 12:16:42 -0700 Evgenii Stepanov <eugenis@google.com> wrote:
>
>> On Fri, Jun 29, 2018 at 7:41 PM, Andrew Morton
>> <akpm@linux-foundation.org> wrote:
>> > On Fri, 29 Jun 2018 14:45:08 +0200 Andrey Konovalov <andreyknvl@google.com> wrote:
>> >
>> >> >> What kind of memory consumption testing would you like to see?
>> >> >
>> >> > Well, 100kb or so is a teeny amount on virtually any machine.  I'm
>> >> > assuming the savings are (much) more significant once the machine gets
>> >> > loaded up and doing work?
>> >>
>> >> So with clean kernel after boot we get 40 kb memory usage. With KASAN
>> >> it is ~120 kb, which is 200% overhead. With KHWASAN it's 50 kb, which
>> >> is 25% overhead. This should approximately scale to any amounts of
>> >> used slab memory. For example with 100 mb memory usage we would get
>> >> +200 mb for KASAN and +25 mb with KHWASAN. (And KASAN also requires
>> >> quarantine for better use-after-free detection). I can explicitly
>> >> mention the overhead in %s in the changelog.
>> >>
>> >> If you think it makes sense, I can also make separate measurements
>> >> with some workload. What kind of workload should I use?
>> >
>> > Whatever workload people were running when they encountered problems
>> > with KASAN memory consumption ;)
>> >
>> > I dunno, something simple.  `find / > /dev/null'?
>> >
>>
>> Looking at a live Android device under load, slab (according to
>> /proc/meminfo) + kernel stack take 8-10% available RAM (~350MB).
>> Kasan's overhead of 2x - 3x on top of it is not insignificant.
>>
>
> (top-posting repaired.  Please don't)
>
> For a debugging, not-for-production-use feature, that overhead sounds
> quite acceptable to me.  What problems is it known to cause?

Not having this overhead enables near-production use - ex. running
kasan/khasan kernel on a personal, daily-use device to catch bugs that
do not reproduce in test configuration. These are the ones that often
cost the most engineering time to track down.

CPU overhead is bad, but generally tolerable. RAM is critical, in our
experience. Once it gets low enough, OOM-killer makes your life
miserable.
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
