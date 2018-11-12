Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-15.1 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 3880A7D089
	for <lwn-linux-doc@archive.lwn.net>; Mon, 12 Nov 2018 18:21:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729380AbeKMEQT (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 12 Nov 2018 23:16:19 -0500
Received: from mail-it1-f196.google.com ([209.85.166.196]:35861 "EHLO
        mail-it1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729281AbeKMEQT (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 12 Nov 2018 23:16:19 -0500
Received: by mail-it1-f196.google.com with SMTP id w7-v6so14618845itd.1
        for <linux-doc@vger.kernel.org>; Mon, 12 Nov 2018 10:21:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=geKejWl5cbp9aeQ9u1hj0Qxeefnkhk/CQJ6/fS3K2S8=;
        b=HHIh8qGVKb5ZyO+fe/FyBUZ9e9fYii5q1y+Nj8hQ7B8W4HenkgrhpDq6nwdmPjWGy7
         e/90tIil+ZSWKjjrF9axKmCl3wIcC1fc7haDOHuwcDnrZauI65g38rwGn1wAODSqNBAa
         G+ePW1oNIl7QbOA2faz31S2kGajU5k63OGvROWZhnwpHLZEDnWCxy5reDw1OpKvazFXM
         F+CnhyCV1eMnqLlDET/EfrrGAEzBj0zEkT+OP/vBNrUHNOiwZjCWrB1JoO/nqd5xOaQ3
         wwq5McdZhyzoKe4OA88Tj6utayI0klc9JN6BOPD7ThciEoXuVXAKRb40sxgHpQ6w6PNg
         zN7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=geKejWl5cbp9aeQ9u1hj0Qxeefnkhk/CQJ6/fS3K2S8=;
        b=uRoqKFznTgullkzRwLf7CjvZWU9vmICxUyK8ZfY3epj0s6CR7dj8YADmwemqyRGEoV
         RJh5WpuHkJqmGaN06YNuDntQQOdkRKKlLDDtwDrI5JHMYRsbm3wzD9OTYFAEeCavN2Ng
         VEXCKB8b3Cx9WYB2atiepGmuxgglZvXmWngFNSOFXw1ejVzBh1iW6KyI6mFCjmeyqYE8
         jryA7YfDSmfeQS4rf/wQACu7WncO+hblUlB55dmywljLehtooQIj6eLEcYqeu+hTJV+q
         66FET7rA65XWG0sRViWdyIHO6MQYe68SDFxJbW4uGwEpnyKXA9uQl83uhTL2rIUUMr3q
         /AXw==
X-Gm-Message-State: AGRZ1gIlP6GlAUb1jnZ6NxUnK0kpBTFrE+dJLCX+ObB00Cuv8ycCyHUJ
        WrKduswEiaUOw5yeAKsEM0j/7uP20b70U2Q6DF+mrA==
X-Google-Smtp-Source: AJdET5eQmEYjUSS0/+TVQpmFYSn6iU3SpBqsunNuElpqc1lRgMfHaIIZ2c7K5Wnbt6bx4KhSiXzW40hhOcJOkIn2zSk=
X-Received: by 2002:a02:5f18:: with SMTP id r24-v6mr1855671jab.10.1542046915156;
 Mon, 12 Nov 2018 10:21:55 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a02:7050:0:0:0:0:0 with HTTP; Mon, 12 Nov 2018 10:21:54
 -0800 (PST)
In-Reply-To: <20181107170458.jirk2b3tszrcagbt@lakrids.cambridge.arm.com>
References: <cover.1541525354.git.andreyknvl@google.com> <ea8f0391d7befab4afec34d2a009028cd9e0f326.1541525354.git.andreyknvl@google.com>
 <20181107170458.jirk2b3tszrcagbt@lakrids.cambridge.arm.com>
From:   Andrey Konovalov <andreyknvl@google.com>
Date:   Mon, 12 Nov 2018 19:21:54 +0100
Message-ID: <CAAeHK+zgaNtWsGUF1h1zu9NpZBinyEKNuUUYe14TkMXWRRFhdQ@mail.gmail.com>
Subject: Re: [PATCH v10 05/22] kasan: add CONFIG_KASAN_GENERIC and CONFIG_KASAN_SW_TAGS
To:     Mark Rutland <mark.rutland@arm.com>
Cc:     Andrey Ryabinin <aryabinin@virtuozzo.com>,
        Alexander Potapenko <glider@google.com>,
        Dmitry Vyukov <dvyukov@google.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        Christoph Lameter <cl@linux.com>,
        Andrew Morton <akpm@linux-foundation.org>,
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
        kasan-dev@googlegroups.com,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-sparse@vger.kernel.org,
        Linux Memory Management List <linux-mm@kvack.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Kostya Serebryany <kcc@google.com>,
        Evgeniy Stepanov <eugenis@google.com>,
        Lee Smith <Lee.Smith@arm.com>,
        Ramana Radhakrishnan <Ramana.Radhakrishnan@arm.com>,
        Jacob Bramley <Jacob.Bramley@arm.com>,
        Ruben Ayrapetyan <Ruben.Ayrapetyan@arm.com>,
        Jann Horn <jannh@google.com>,
        Mark Brand <markbrand@google.com>,
        Chintan Pandya <cpandya@codeaurora.org>,
        Vishwath Mohan <vishwath@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Nov 7, 2018 at 6:04 PM, Mark Rutland <mark.rutland@arm.com> wrote:
> On Tue, Nov 06, 2018 at 06:30:20PM +0100, Andrey Konovalov wrote:
>> This commit splits the current CONFIG_KASAN config option into two:
>> 1. CONFIG_KASAN_GENERIC, that enables the generic KASAN mode (the one
>>    that exists now);
>> 2. CONFIG_KASAN_SW_TAGS, that enables the software tag-based KASAN mode.
>>
>> The name CONFIG_KASAN_SW_TAGS is chosen as in the future we will have
>> another hardware tag-based KASAN mode, that will rely on hardware memory
>> tagging support in arm64.
>>
>> With CONFIG_KASAN_SW_TAGS enabled, compiler options are changed to
>> instrument kernel files with -fsantize=kernel-hwaddress (except the ones
>> for which KASAN_SANITIZE := n is set).
>>
>> Both CONFIG_KASAN_GENERIC and CONFIG_KASAN_SW_TAGS support both
>> CONFIG_KASAN_INLINE and CONFIG_KASAN_OUTLINE instrumentation modes.
>>
>> This commit also adds empty placeholder (for now) implementation of
>> tag-based KASAN specific hooks inserted by the compiler and adjusts
>> common hooks implementation to compile correctly with each of the
>> config options.
>>
>> Reviewed-by: Andrey Ryabinin <aryabinin@virtuozzo.com>
>> Reviewed-by: Dmitry Vyukov <dvyukov@google.com>
>> Signed-off-by: Andrey Konovalov <andreyknvl@google.com>
>> ---
>>  arch/arm64/Kconfig                  |  1 +
>>  include/linux/compiler-clang.h      |  5 +-
>>  include/linux/compiler-gcc.h        |  6 ++
>>  include/linux/compiler_attributes.h | 13 -----
>>  include/linux/kasan.h               | 16 ++++--
>>  lib/Kconfig.kasan                   | 87 +++++++++++++++++++++++------
>>  mm/kasan/Makefile                   |  6 +-
>>  mm/kasan/generic.c                  |  2 +-
>>  mm/kasan/kasan.h                    |  3 +-
>>  mm/kasan/tags.c                     | 75 +++++++++++++++++++++++++
>>  mm/slub.c                           |  2 +-
>>  scripts/Makefile.kasan              | 27 ++++++++-
>>  12 files changed, 201 insertions(+), 42 deletions(-)
>>  create mode 100644 mm/kasan/tags.c
>>
>> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
>> index 787d7850e064..8b331dcfb48e 100644
>> --- a/arch/arm64/Kconfig
>> +++ b/arch/arm64/Kconfig
>> @@ -111,6 +111,7 @@ config ARM64
>>       select HAVE_ARCH_JUMP_LABEL
>>       select HAVE_ARCH_JUMP_LABEL_RELATIVE
>>       select HAVE_ARCH_KASAN if !(ARM64_16K_PAGES && ARM64_VA_BITS_48)
>> +     select HAVE_ARCH_KASAN_SW_TAGS if !(ARM64_16K_PAGES && ARM64_VA_BITS_48)
>
> Given this relies on a compiler feature, can we please gate this on
> compiler feature detection? e.g. in some common Kconfig have:
>
>         select CC_HAS_ASAN_HWADDRESS if $(cc-option -fsanitize=kernel-hwaddress)
>
> ... and on arm64 we can do:
>
>         select HAVE_ARCH_KASAN_SW_TAGS if !(ARM64_16K_PAGES && ARM64_VA_BITS_48)
>
> ... and core KASAN Kconfig can have:
>
> config KASAN_SW_TAGS
>         depends on HAVE_ARCH_KASAN_SW_TAGS
>         depends on CC_HAS_ASAN_HWADDRESS
>
> [...]
>
>> +ifeq ($(call cc-option, $(CFLAGS_KASAN) -Werror),)
>> +    ifneq ($(CONFIG_COMPILE_TEST),y)
>> +        $(warning Cannot use CONFIG_KASAN_SW_TAGS: \
>> +            -fsanitize=hwaddress is not supported by compiler)
>> +    endif
>> +endif
>
> ... and then this warning shouldn't be possible, and can go.

Will do in v11, thanks!
