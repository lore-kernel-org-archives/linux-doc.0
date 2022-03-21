Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66C43C433EF
	for <linux-doc@archiver.kernel.org>; Mon, 21 Mar 2022 09:12:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345715AbiCUJOR (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 21 Mar 2022 05:14:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49418 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345706AbiCUJOQ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 21 Mar 2022 05:14:16 -0400
X-Greylist: delayed 303 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Mon, 21 Mar 2022 02:12:51 PDT
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.74])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8AFF9DD97A
        for <linux-doc@vger.kernel.org>; Mon, 21 Mar 2022 02:12:50 -0700 (PDT)
Received: from mail-wm1-f54.google.com ([209.85.128.54]) by
 mrelayeu.kundenserver.de (mreue109 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1M26j1-1nUJH10RuD-002U9o for <linux-doc@vger.kernel.org>; Mon, 21 Mar 2022
 10:07:46 +0100
Received: by mail-wm1-f54.google.com with SMTP id v130-20020a1cac88000000b00389d0a5c511so9877050wme.5;
        Mon, 21 Mar 2022 02:07:46 -0700 (PDT)
X-Gm-Message-State: AOAM530SNbEGYnPIrldtWRMxPTmhjpyqjW8gyGOFEqqt57jsO76fq0bo
        7BZ5XWF1AbFMZPnjJXkD/8OnaggpyphUtlwgGdU=
X-Google-Smtp-Source: ABdhPJwHrKUKxYkZNzmmlwfspjQ9k/71XpCyBvdLMSQD+yuTHl2E5JvC+V3hbYc0A6xq6NZLQGug9dNQCUt046C6+7g=
X-Received: by 2002:a1c:f20b:0:b0:389:c99a:4360 with SMTP id
 s11-20020a1cf20b000000b00389c99a4360mr26314299wmc.174.1647852195434; Mon, 21
 Mar 2022 01:43:15 -0700 (PDT)
MIME-Version: 1.0
References: <20220319142759.1026237-1-chenhuacai@loongson.cn>
 <20220319143817.1026708-1-chenhuacai@loongson.cn> <20220319143817.1026708-4-chenhuacai@loongson.cn>
In-Reply-To: <20220319143817.1026708-4-chenhuacai@loongson.cn>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Mon, 21 Mar 2022 09:42:59 +0100
X-Gmail-Original-Message-ID: <CAK8P3a1ST1hBnhepvoQ9UTbAM=56JEU=-OiBAFQeK2rgaZ5aWw@mail.gmail.com>
Message-ID: <CAK8P3a1ST1hBnhepvoQ9UTbAM=56JEU=-OiBAFQeK2rgaZ5aWw@mail.gmail.com>
Subject: Re: [PATCH V8 11/22] LoongArch: Add process management
To:     Huacai Chen <chenhuacai@kernel.org>
Cc:     Arnd Bergmann <arnd@arndb.de>, Andy Lutomirski <luto@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Peter Zijlstra <peterz@infradead.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        David Airlie <airlied@linux.ie>,
        Jonathan Corbet <corbet@lwn.net>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        linux-arch <linux-arch@vger.kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Xuefeng Li <lixuefeng@loongson.cn>,
        Yanteng Si <siyanteng@loongson.cn>,
        Huacai Chen <chenhuacai@gmail.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Huacai Chen <chenhuacai@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:mwPz/TXQksmslEYCQXxaPy7nIL6j6jcaqe+FYuFaF0ODNkG6SV6
 QsjdFeH8sUr4SwLBvgJEHhWEKNk9XN2ECbzXmKl7Mnjkl0g+8XvJFoOU8URcKOLq4lb+wWy
 8oDhP461fFltrUfT7zLfVmNf3DPFbMzCvb6x0HizwMI/1LAiVI/RGrQDDU5cgyWtDLm2RXm
 6Q8gNZMB20ESTxCTQUXrQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:qe4Nz2dRPNs=:254gLaatMRh6CZxqwNIkfY
 BWoYD0u0Iw5IyKU7aeckuw66oAR0lg50aexgfI8OSL2rKYM9atRzNYTpY7h6biIbg0jk7XfiY
 El5nEmLPZIVPLxPrgIuWQakZU1u2FDwoiVsYK7qYEIb6hm4wmIpZ720ir1O9DV2X3pwZ2h52Z
 bZulheTQzl2ZC/VQcHdr42xr/7FO//0Y7OQkNGjUgAEu3zhnrTT4hxumFONO4oKxfpVEOLCK8
 3egQO4d14k22axcniY0Gqoab/rx7ULfw/aL/WOhROs0eivSEtW+T0rVIrlO+YM/pN8BrBQfwd
 lguYDDzcd32dx76vu3vch6NL0UydY7AWzptsR7JVYKKfJyNqUZtF5NJRnD2e1E0mvIS+XBnOy
 5Z24TQslHqYuzrgCoCllskfku0TGx51X5sHquQlNmi+JM03msaLVX4arnsN2P0sGIIUdbUXgD
 Qtkx9j2A3w24buUyV1ChqXB0j820aHLB+72kIr8YBfV+5w/HHcy4v6QEQrDkj9lN98JwMGgMU
 EI4NIMX/2gzNAAHbQkrIr0clALLdBZZ/932KrrPgpZ/V0n5KUR3V8Qn8xq22MKjereF095znF
 ebBtZQsiWhXd/TYennhTllRnXAbndI2k8CjzkH01G9QjlfUTa4WiV1GnWHlswJ0hguX3S5eyk
 Y+QQwS0LdlhrTuHl9gNWuKMxt6OBbjpUHMn8m3gFZrhzcs0vufhXyfrJxbcFKawO8id+ocrp2
 XBRWXHe8VHmrBKON0GwfniI8RBow2XSxvPYG2O5Bmas4A89FOF4dFBF6YelO/cKRAbqCiBRmk
 Ao6eiDOpcBXB1i+03J3vAG4iGuPLqfra39vnD7RP85zVWc0e7I=
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sat, Mar 19, 2022 at 3:38 PM Huacai Chen <chenhuacai@kernel.org> wrote:

> +#ifdef CONFIG_PAGE_SIZE_64KB
> +#define THREAD_SIZE_ORDER (0)
> +#endif
> +
> +#define THREAD_SIZE (PAGE_SIZE << THREAD_SIZE_ORDER)
> +#define THREAD_MASK (THREAD_SIZE - 1UL)
> +

Having a 64KB stack area is rather wasteful. I think you should use a sub-page
allocation in this configuration, or possibly disallow 64KB page configuration
entirely.

Note that you have to use full pages when using CONFIG_VMAP_STACK, but
you don't seem to support that at the moment, so allocating only 16KB stacks
on a 64KB page config should still work.

       Arnd
