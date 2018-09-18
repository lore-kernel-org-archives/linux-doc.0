Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-13.4 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 8C0867D57F
	for <lwn-linux-doc@archive.lwn.net>; Tue, 18 Sep 2018 17:09:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730194AbeIRWmy (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 18 Sep 2018 18:42:54 -0400
Received: from mail-it0-f65.google.com ([209.85.214.65]:50183 "EHLO
        mail-it0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730195AbeIRWmy (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 18 Sep 2018 18:42:54 -0400
Received: by mail-it0-f65.google.com with SMTP id j81-v6so4338181ite.0
        for <linux-doc@vger.kernel.org>; Tue, 18 Sep 2018 10:09:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=pUKdOE3Y16h6545zaISUxKO9AusnuLo4zm5dn+P7adE=;
        b=C0uNsreNAMljFxjNIys+dCasy4mqL6VgTLuydxYwxb066BXxAiZscXj+AFbzomIbsu
         m9bczDEEE07ZNmYj7GaHnzYEFZeeM6qeilHPnkzNq8KqMnNJNLHC0VzsfFmmjoQaECiE
         UtUk2GB0FyHFvKKYGwfqbJrEKZk9HqNH0Owbt3tqGua2TplKRrGSBwv7S5HSd+TeE8DR
         EjaiDgQiNvKyemuiH1P5sf7KPRWW+qqOTzgMBuofUd6yLZ3o43Hs8QWmsdIw1tkUa+J1
         kmZ4gbgLZxW7JiBmONHre5OPejBQPX4GjwTrxaOvZW51atc7sjTMGP2dfPV7CoyjNzr2
         JRSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=pUKdOE3Y16h6545zaISUxKO9AusnuLo4zm5dn+P7adE=;
        b=qi8YIq32Q9Sw083pPRCjlq6oCOsQXJnoBgu53BmPjAiH9DMMyCHPZ+lpmt98p4mC4m
         yM53WmBc+4Z0JVY9GGEfpviMcWfINkaM22r3H/hwPzUoWK8yJF4wwPI+tXvALHGewOAD
         q6huch5nIzbmTvL+jBk6eYTA0XBmN4y6aGDScSr0m21r7qDvtASZ3LPu6lSKG0Hu60Rp
         5wswcVLSqcxAw0DD/Jv42Bg+XqN2x5TW8L1sla+n58uYpTztl8hYNoGjmcBWj5jH2Z+6
         dbNh3irypTppjoqp5pgXtP4GvuBw64aUCaauAg9BEoixDsC4z+CFNq9aooeGzMmE9QUt
         QF/Q==
X-Gm-Message-State: APzg51CSkjX2fH0s0axfPHy258Ea3YYB+i5KK6vrGMGdSWMROe1zxlrs
        dFzI8cX6jzdaOPy1MgbKU1IMPsAcfArvLCNpl42DPg==
X-Google-Smtp-Source: ANB0VdYVAEeWxZzFwgNruJ8fgTBcMGjdKxGatm1f24qFQHg4mPHEPk93xmFXw+rRSvSQp/4IthRz1nC0MUZEng8uj8E=
X-Received: by 2002:a02:9962:: with SMTP id d31-v6mr28144620jak.1.1537290562857;
 Tue, 18 Sep 2018 10:09:22 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a02:c54e:0:0:0:0:0 with HTTP; Tue, 18 Sep 2018 10:09:22
 -0700 (PDT)
In-Reply-To: <CACT4Y+aJ36LGLG=TVOGQoJ+fB4Xc9CjdxAs8KZpUm3AsNEoHFw@mail.gmail.com>
References: <cover.1535462971.git.andreyknvl@google.com> <19d757c2cafc277f0143a8ac34e179061f3487f5.1535462971.git.andreyknvl@google.com>
 <CACT4Y+aJ36LGLG=TVOGQoJ+fB4Xc9CjdxAs8KZpUm3AsNEoHFw@mail.gmail.com>
From:   Andrey Konovalov <andreyknvl@google.com>
Date:   Tue, 18 Sep 2018 19:09:22 +0200
Message-ID: <CAAeHK+xBX4X0oxhjOrjJfwdqcvU80VPhUsi38mEczzHRb01Wew@mail.gmail.com>
Subject: Re: [PATCH v6 06/18] khwasan, arm64: untag virt address in
 __kimg_to_phys and _virt_addr_is_linear
To:     Dmitry Vyukov <dvyukov@google.com>
Cc:     Andrey Ryabinin <aryabinin@virtuozzo.com>,
        Alexander Potapenko <glider@google.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        Christoph Lameter <cl@linux.com>,
        Andrew Morton <akpm@linux-foundation.org>,
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
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-sparse@vger.kernel.org, Linux-MM <linux-mm@kvack.org>,
        "open list:KERNEL BUILD + fi..." <linux-kbuild@vger.kernel.org>,
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

On Wed, Sep 12, 2018 at 6:33 PM, Dmitry Vyukov <dvyukov@google.com> wrote:
> On Wed, Aug 29, 2018 at 1:35 PM, Andrey Konovalov <andreyknvl@google.com> wrote:

>> +#ifdef CONFIG_KASAN_HW
>> +#define KASAN_TAG_SHIFTED(tag)         ((unsigned long)(tag) << 56)
>> +#define KASAN_SET_TAG(addr, tag)       (((addr) & ~KASAN_TAG_SHIFTED(0xff)) | \
>> +                                               KASAN_TAG_SHIFTED(tag))
>> +#define KASAN_RESET_TAG(addr)          KASAN_SET_TAG(addr, 0xff)
>> +#endif
>> +
>
>
> Wouldn't it be better to
> #define KASAN_RESET_TAG(addr) addr
> when CONFIG_KASAN_HW is not enabled, and then not duplicate the macros
> below? That's what we do in kasan.h for all hooks.
> I see that a subsequent patch duplicates yet another macro in this
> file. While we could use:
>
> #define __kimg_to_phys(addr)   (KASAN_RESET_TAG(addr) - kimage_voffset)
>
> with and without kasan. Duplicating them increases risk that somebody
> will change only the non-kasan version but forget kasan version.

Will do in v7.
