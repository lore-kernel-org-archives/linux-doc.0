Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 8A1967D089
	for <lwn-linux-doc@archive.lwn.net>; Fri,  2 Nov 2018 13:16:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726265AbeKBWYB (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 2 Nov 2018 18:24:01 -0400
Received: from relay.sw.ru ([185.231.240.75]:40638 "EHLO relay.sw.ru"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726104AbeKBWYB (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 2 Nov 2018 18:24:01 -0400
Received: from [172.16.25.12]
        by relay.sw.ru with esmtp (Exim 4.90_1)
        (envelope-from <aryabinin@virtuozzo.com>)
        id 1gIZJW-00066L-5X; Fri, 02 Nov 2018 16:16:38 +0300
Subject: Re: [GIT PULL] Compiler Attributes for v4.20-rc1
To:     Linus Torvalds <torvalds@linux-foundation.org>,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc:     dan.carpenter@oracle.com, adilger.kernel@dilger.ca,
        yamada.masahiro@socionext.com, michal.lkml@markovi.net,
        rostedt@goodmis.org, mchehab+samsung@kernel.org, olof@lxom.net,
        Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
        David Miller <davem@davemloft.net>,
        Kees Cook <keescook@chromium.org>, tglx@linutronix.de,
        Ingo Molnar <mingo@kernel.org>, paullawrence@google.com,
        sandipan@linux.vnet.ibm.com, andreyknvl@google.com,
        David Woodhouse <dwmw2@infradead.org>, will.deacon@arm.com,
        Philippe Ombredanne <pombredanne@nexb.com>,
        paul.burton@mips.com, rientjes@google.com, w@1wt.eu,
        msebor@gmail.com, sparse@chrisli.org,
        Jonathan Corbet <corbet@lwn.net>,
        Theodore Ts'o <tytso@mit.edu>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>, joe@perches.com,
        Arnd Bergmann <arnd@arndb.de>, asmadeus@codewreck.org,
        stefan@agner.ch, luc.vanoostenryck@gmail.com,
        Nick Desaulniers <ndesaulniers@google.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        linux-doc@vger.kernel.org, linux-ext4@vger.kernel.org,
        linux-sparse@vger.kernel.org, linux-kbuild@vger.kernel.org
References: <20181022105944.GA1411@gmail.com>
 <CAHk-=whpBiV5sVTvPsWOVx5WYOouxbNG1fWeCdpK4oFiaH0Zqg@mail.gmail.com>
 <CAHk-=widcG7zGELniGoqjPyBZAHehA_Gyi2n1aRO94G7SBzwNQ@mail.gmail.com>
From:   Andrey Ryabinin <aryabinin@virtuozzo.com>
Message-ID: <06d822ab-5bc8-2d63-05be-f694c699658d@virtuozzo.com>
Date:   Fri, 2 Nov 2018 16:17:23 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <CAHk-=widcG7zGELniGoqjPyBZAHehA_Gyi2n1aRO94G7SBzwNQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org



On 11/02/2018 04:46 AM, Linus Torvalds wrote:
> On Thu, Nov 1, 2018 at 10:06 AM Linus Torvalds
> <torvalds@linux-foundation.org> wrote:
>>
>> The logic for using __no_sanitize_address *used* to be
>>
>>     #if GCC_VERSION >= 40902
> 
> Ok, looking around, I think this has less to do with the attribute
> being recognized, and simply just being because KASAN itself wants
> gcc-4.9.2.
> 
> I'm actually not seeing that KASAN dependency in the Kconfig scripts
> (and it probably _should_ be now that we can just add compiler version
> dependencies there), but that explains why the gcc version check is
> different from "gcc supports the attribute".
> 
> Anyway, I decided to do the merge by just getting rid of the
> GCC_VERSION check around __no_sanitize_address_or_inline entirely. If
> you enable KASAN, then a function with that marking just won't be
> marked inline.
> 
> End result: pulled. I'm as confused as you are as to why
> __no_sanitize_address_or_inline is in the gcc header, but I guess it
> ends up being the same issue: KASAN depends on gcc even if that
> dependency doesn't seem to be spelled out in lib/Kconfig.kasan.
> 
> So I _think_ the KASAN config should have a
> 
>     depends on CC_IS_GCC && GCC_VERSION >= 40902
> 
> on it, but maybe there is something I'm missing.
> 

I'd rather use cc-option instead of version check, since we also support clang.

It should be possible to express compiler requirements for subfeatures
like stack/inline instrumentation in Kconfig. But that would be not that trivial, 
see the scripts/Makefile.kasan

> But from a pull standpoint, I don't want to mess with those
> (unrelated) issues, so I just kept the merge resolution as simple and
> straightforward as possible.
> 
> Miguel, please do double-check the merge (it's not pushed out yet, I'm
> doing the usual build tests etc first).
> 
>                     Linus
> 
