Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 2A7887D072
	for <lwn-linux-doc@archive.lwn.net>; Fri, 29 Jun 2018 13:18:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S932882AbeF2NSf (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 29 Jun 2018 09:18:35 -0400
Received: from mail-it0-f67.google.com ([209.85.214.67]:35154 "EHLO
        mail-it0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932577AbeF2NSc (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 29 Jun 2018 09:18:32 -0400
Received: by mail-it0-f67.google.com with SMTP id l16-v6so2834212ita.0
        for <linux-doc@vger.kernel.org>; Fri, 29 Jun 2018 06:18:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=Kgi3MI2bWN9/Ht24AI/JWU8GN65KuvcgAOpjVIiDLWg=;
        b=qXViInOsn2ir/S8FtBvNPETGY7AsjG2kQ6PnWq8jyzewToeCSVxdyTksZrvar0rcD1
         MOB3/HHlg0jRBS1rWzibz4tg75T9V8StM+FUQNTvIWvN+hIiv5HXUIbwcs7ZzJ3JF33h
         mqNGGn+lkjCb7WQXwJuAoJ1ubi4l+rqRK7cjj4nLN/1II9GfzcXNdAJrB0x8cvvKFNXI
         NvrBj2b1MdjgGBnvK1M9jHmHR8np1UE23JKuZ0GbT193K8NpOLj2IkxCxM0uBXSo+6ZM
         fVDVxlwKcv4D/naNSZ6QbErbFnoTPId5AM7txhlIDnXuICiIOJx96yWrkcLpfMECYHTF
         ML/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=Kgi3MI2bWN9/Ht24AI/JWU8GN65KuvcgAOpjVIiDLWg=;
        b=CimPo08rxhoI8C5nbZCQx/RNznaRfW0WcNjfkQ6jGqgyz6toVYzFD/wYSw+gnnz5rD
         UPI5d+o1u3U0nfnLZUtz0H4fc+LUcDthzyBBOPjT7nSuGcJ+viX3xYO8AvuHb7e/w2aw
         WWQCk3COIGfIaT7xU/SBn6v2SgpDKHohR2IZi7GsZ4r4h2RUjeiqVTz+3SqkTRpf6VeL
         aLLwT4GpVwxrjXkaitSfRh5jPjbi+z8XFdVSRLxH65nVzC1HmL0RY+yDkwimByg5B7KL
         X9J0hJPOT6NYTKdRT3aM4r8DYZ/3hh9rS6twyCN2g5fTGiLJff0Cdwnx1XhB4NRpYqqt
         KX0g==
X-Gm-Message-State: APt69E3pKSDI3N4xeGcrbY7AfJmQzW8N6LqEHmINo3t73soZlcOEojnV
        z/7R/SISE6646h1UKsIb+oMg9xw357ckywGPdd2KjA==
X-Google-Smtp-Source: AAOMgpeXXhJ4EdfP31oWkIMLxBZSuC83E6CAZka/KN+oKbnByIgjS/rMGfOllYyigQhtlBo+WMHI6+gltEQt/hVXszo=
X-Received: by 2002:a02:9962:: with SMTP id d31-v6mr12065662jak.1.1530278311992;
 Fri, 29 Jun 2018 06:18:31 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a02:9082:0:0:0:0:0 with HTTP; Fri, 29 Jun 2018 06:18:31
 -0700 (PDT)
In-Reply-To: <20180629112613.7i4xesjyxolc63gu@ltop.local>
References: <cover.1530018818.git.andreyknvl@google.com> <20180628105057.GA26019@e103592.cambridge.arm.com>
 <CAAeHK+w0T43+h3xqU4a-qutxd-qiEhsvk0eaZpmAn-T0hpaLZQ@mail.gmail.com>
 <20180629110419.GC26019@e103592.cambridge.arm.com> <20180629112613.7i4xesjyxolc63gu@ltop.local>
From:   Andrey Konovalov <andreyknvl@google.com>
Date:   Fri, 29 Jun 2018 15:18:31 +0200
Message-ID: <CAAeHK+zXzTEo_DJ5a7KaVDQa06Gx98Oj2O3jMFJo_tNgkq822g@mail.gmail.com>
Subject: Re: [PATCH v4 00/17] khwasan: kernel hardware assisted address sanitizer
To:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Cc:     Dave Martin <Dave.Martin@arm.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Kate Stewart <kstewart@linuxfoundation.org>,
        linux-doc@vger.kernel.org,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        Paul Lawrence <paullawrence@google.com>,
        Linux Memory Management List <linux-mm@kvack.org>,
        Alexander Potapenko <glider@google.com>,
        Chintan Pandya <cpandya@codeaurora.org>,
        Christoph Lameter <cl@linux.com>,
        Ingo Molnar <mingo@kernel.org>,
        Jacob Bramley <Jacob.Bramley@arm.com>,
        Jann Horn <jannh@google.com>,
        Mark Brand <markbrand@google.com>,
        kasan-dev <kasan-dev@googlegroups.com>,
        linux-sparse@vger.kernel.org,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Andrey Ryabinin <aryabinin@virtuozzo.com>,
        Evgeniy Stepanov <eugenis@google.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Marc Zyngier <marc.zyngier@arm.com>,
        Ramana Radhakrishnan <Ramana.Radhakrishnan@arm.com>,
        Ruben Ayrapetyan <Ruben.Ayrapetyan@arm.com>,
        Mike Rapoport <rppt@linux.vnet.ibm.com>,
        Dmitry Vyukov <dvyukov@google.com>,
        Kostya Serebryany <kcc@google.com>,
        Ard Biesheuvel <ard.biesheuvel@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        LKML <linux-kernel@vger.kernel.org>,
        "Eric W . Biederman" <ebiederm@xmission.com>,
        Lee Smith <Lee.Smith@arm.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
        smatch@vger.kernel.org, Dan Carpenter <dan.carpenter@oracle.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Jun 29, 2018 at 1:26 PM, Luc Van Oostenryck
<luc.vanoostenryck@gmail.com> wrote:
> On Fri, Jun 29, 2018 at 12:04:22PM +0100, Dave Martin wrote:
>>
>> Can sparse be hacked to identify pointer subtractions where the pointers
>> are cannot be statically proved to point into the same allocation?

Re all the comments about finding all the places where we do pointer
subtraction/comparison:

I might be wrong, but I doubt you can easily do that with static analysis.

What we could do is to try to detect all such subtractions/comparisons
dynamically. The idea is to instrument all pointer/ulong
subtraction/comparison instructions and try to detect tags mismatch.
And then run some workload (e.g. syzkaller) to trigger more kernel
code. The question is how much false positives we would get, since I
imagine there would be a number of cases when we compare some random
ulongs.
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
