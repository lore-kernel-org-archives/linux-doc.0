Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id C8FC37D062
	for <lwn-linux-doc@archive.lwn.net>; Thu, 28 Jun 2018 18:57:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S935283AbeF1S4q (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 28 Jun 2018 14:56:46 -0400
Received: from mail-it0-f66.google.com ([209.85.214.66]:38360 "EHLO
        mail-it0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S935137AbeF1S4n (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 28 Jun 2018 14:56:43 -0400
Received: by mail-it0-f66.google.com with SMTP id v83-v6so14066808itc.3
        for <linux-doc@vger.kernel.org>; Thu, 28 Jun 2018 11:56:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=QJLredR/79RWGbFALXpSskfLR/m9zdyp+5Dp0TDoMmQ=;
        b=rRTk85npRi7cYyKqwob9tgl8hYK1TDhfXTgwv5VWLghPmtm8ukMbpvhG3wbOJX63tM
         cCX7rWPjhhUdQUVLLkO9YbtGEwsa4sD010Tgdem17PELExPWWCXEcPXdm7IWypHFW4TV
         hOsa1l52cSFcieTAI8fn5APPmiRmvuqamKpGPMeFR/Zul9gX3ZmjdKjyN2WiWMwamhIF
         +UmR/KK8NhnTAoxEzr9AWRX2gtEW1LzYzfsU/DoDi6a6+axs7EeNT/sUQtJThv5moP77
         KqToVIXy7GwItZWdymlOOrdksJs++lOvr5c9slRzuFiokJOJ2/Dmr3IGXYI/rXi5oaXH
         Ibvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=QJLredR/79RWGbFALXpSskfLR/m9zdyp+5Dp0TDoMmQ=;
        b=VpmtJ+N3Wm5xVZfHKmbIeHbuob5xOS0HWrH0SVlEV0FIzVAbeHW8eGimuXkFhPav9b
         VSpcVh0lGJZ47E1MQBwiWc1IR1FXFEl0iJfplxcMG8kjJJmjosSFWLHhdXXDNE8pwkVJ
         tF3ayS9tN9Qrp3CBV0IgMEr4smzbndF1xfykdMGxv059aR2/yHQ++0gFU0HbMBPei/sx
         D+3wosmDfgynUj46F8TLjSVswU4u6ZkD2EtffcUVWJ6cJQ89X3EMjWRaKR5ramSeWSaf
         9uz+7z+QkRL9sVhxhTn3TbSvzWL1aO17Qdg5rD8f2zi3wMpN1B377rhzWK9ABHJr6hN1
         sSMg==
X-Gm-Message-State: APt69E1K2f+Wj0frKz+rTJHWVEFCbZZNCBAIC19C6qJ/nh1+/Oj4dCbQ
        NeNb/f71yu/JXS58fwaTzZ7d5WTkACFwxuIa/ZLBuw==
X-Google-Smtp-Source: ADUXVKJsATIqXThayEM1uuweUgOhQudlln4DuzwDj24Pe17jXQqcXEFonZB+OsdLuuyrQkOiZ+I7J27LMN1v1tVS/fA=
X-Received: by 2002:a24:4c6:: with SMTP id 189-v6mr9696835itb.53.1530212202616;
 Thu, 28 Jun 2018 11:56:42 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a02:9082:0:0:0:0:0 with HTTP; Thu, 28 Jun 2018 11:56:41
 -0700 (PDT)
In-Reply-To: <20180628105057.GA26019@e103592.cambridge.arm.com>
References: <cover.1530018818.git.andreyknvl@google.com> <20180628105057.GA26019@e103592.cambridge.arm.com>
From:   Andrey Konovalov <andreyknvl@google.com>
Date:   Thu, 28 Jun 2018 20:56:41 +0200
Message-ID: <CAAeHK+w0T43+h3xqU4a-qutxd-qiEhsvk0eaZpmAn-T0hpaLZQ@mail.gmail.com>
Subject: Re: [PATCH v4 00/17] khwasan: kernel hardware assisted address sanitizer
To:     Dave Martin <Dave.Martin@arm.com>
Cc:     Andrey Ryabinin <aryabinin@virtuozzo.com>,
        Alexander Potapenko <glider@google.com>,
        Dmitry Vyukov <dvyukov@google.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        Christoph Lameter <cl@linux.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Marc Zyngier <marc.zyngier@arm.com>,
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
        Chintan Pandya <cpandya@codeaurora.org>,
        Jacob Bramley <Jacob.Bramley@arm.com>,
        Jann Horn <jannh@google.com>,
        Ruben Ayrapetyan <Ruben.Ayrapetyan@arm.com>,
        Lee Smith <Lee.Smith@arm.com>,
        Kostya Serebryany <kcc@google.com>,
        Mark Brand <markbrand@google.com>,
        Ramana Radhakrishnan <Ramana.Radhakrishnan@arm.com>,
        Evgeniy Stepanov <eugenis@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Jun 28, 2018 at 12:51 PM, Dave Martin <Dave.Martin@arm.com> wrote:
> On Tue, Jun 26, 2018 at 03:15:10PM +0200, Andrey Konovalov wrote:
>> 1. By using the Top Byte Ignore arm64 CPU feature, we can store pointer
>>    tags in the top byte of each kernel pointer.
>
> [...]
>
> This is a change from the current situation, so the kernel may be
> making implicit assumptions about the top byte of kernel addresses.
>
> Randomising the top bits may cause things like address conversions and
> pointer arithmetic to break.
>
> For example, (q - p) will not produce the expected result if q and p
> have different tags.

If q and p have different tags, that means they come from different
allocations. I don't think it would make sense to calculate pointer
difference in this case.

>
> Conversions, such as between pointer and pfn, may also go wrong if not
> appropriately masked.
>
> There are also potential pointer comparison and aliasing issues if
> the tag bits are ever stripped or modified.
>
>
> What was your approach to tracking down all the points in the code
> where we have a potential issue?

I've been fuzzing the kernel built with KWHASAN with syzkaller. This
gives a decent coverage and I was able to find some places where
fixups were required this way. Right now the fuzzer is running without
issues. It doesn't prove that all such places are fixed, but I don't
know a better way to test this.
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
