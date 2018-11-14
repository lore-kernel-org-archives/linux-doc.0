Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-15.1 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id BD06F7D089
	for <lwn-linux-doc@archive.lwn.net>; Wed, 14 Nov 2018 19:52:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726379AbeKOF5G (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 15 Nov 2018 00:57:06 -0500
Received: from mail-it1-f193.google.com ([209.85.166.193]:50481 "EHLO
        mail-it1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725756AbeKOF5F (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 15 Nov 2018 00:57:05 -0500
Received: by mail-it1-f193.google.com with SMTP id k206-v6so25833222ite.0
        for <linux-doc@vger.kernel.org>; Wed, 14 Nov 2018 11:52:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=rsDFMuOwLKTLtBUJs8qWhs3U6FBd/SL9WGlQSq1WV5o=;
        b=lObfJOv1sqhsO2xY1GvaXtH0NOmtlUeEn9A9yX2fqn0LUhC3lkQUz2uBP7p5BDNdFk
         hpARwLqemAPlcH5kQiTfYukXRIfn7PN0+AvdhaYi2cJPrgPnLSgDKNCkzIb3LdDJakE2
         kZapkAaiBYqX/Qp3sQx0/iTeNKsngSu4BaKchmsPtFlNIuwyFGWNEF3SDVg8SQcPSjuj
         CoDv5eV92exOXSgRxhv/KhUGLsudBHtyQZXmA2GFRyzsYYrUXNDIMCMYPUi3xuurdIaf
         IanOZ7uTmVHsRYwZjZkSQvDlwUw5KUYqgJc50Bi8vKaxaLwa32BLoMjEhk29ycOR69ni
         trvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=rsDFMuOwLKTLtBUJs8qWhs3U6FBd/SL9WGlQSq1WV5o=;
        b=tb2H32/JFmaciLTK34VCFqTZpCXHqMDnzJ2Gp9wPJfrzsYVHSdFoqjBXssCPiLpnx+
         YpmmkeDwEnAgQKJLV/xwOh6045nmFh0C0PpcbmYzrHivlTSpbOU/uB0E5IXo7VcRahrW
         lZ1EmKuBQmR8auAYlVG5UuiemLkTSJXlUt+U2KzuvksAtxqqCnILOR/mERxp8PlJiyKl
         Pn5n0u8GB5+8AHPlOiMFo5GFohdsH6nFmq+MWfTEQkeHBMuv2BWXf1PjALuOt/rpmFPu
         nkFZR9UiOiGU4yYgzd+n9hnwcq1XwbR7SAOYwfqSSNp5o0Rx2AeG9/8vpRGb4laphBUB
         KyuQ==
X-Gm-Message-State: AGRZ1gKdi0JfvhJZmDMLFn7b25pierr50pA96/OMrYu5+vixbid/wLOb
        8taz9UyioAJmTsgFDmVycZSejzM4yZfJkYJJD1qGFQ==
X-Google-Smtp-Source: AJdET5eHeI1RaAzzNNZd7JKWEz8b8fTRila9fZXG8tGRn9CSIcp0R3pw2mJ35MVXNz5LcgFdMqss0nYStfMvhwqqOd8=
X-Received: by 2002:a02:4f88:: with SMTP id r8mr2981495jad.69.1542225149636;
 Wed, 14 Nov 2018 11:52:29 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a02:7050:0:0:0:0:0 with HTTP; Wed, 14 Nov 2018 11:52:29
 -0800 (PST)
In-Reply-To: <20181107181054.GC255021@arrakis.emea.arm.com>
References: <cover.1541525354.git.andreyknvl@google.com> <b2aa056b65b8f1a410379bf2f6ef439d5d99e8eb.1541525354.git.andreyknvl@google.com>
 <20181107181054.GC255021@arrakis.emea.arm.com>
From:   Andrey Konovalov <andreyknvl@google.com>
Date:   Wed, 14 Nov 2018 20:52:29 +0100
Message-ID: <CAAeHK+zSEUq-bBide_kqwY831vQpxYUpjUNhPKSD0aC4OyewKw@mail.gmail.com>
Subject: Re: [PATCH v10 08/22] kasan, arm64: untag address in __kimg_to_phys
 and _virt_addr_is_linear
To:     Catalin Marinas <catalin.marinas@arm.com>
Cc:     Andrey Ryabinin <aryabinin@virtuozzo.com>,
        Alexander Potapenko <glider@google.com>,
        Dmitry Vyukov <dvyukov@google.com>,
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
        kasan-dev@googlegroups.com,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-sparse@vger.kernel.org,
        Linux Memory Management List <linux-mm@kvack.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Vishwath Mohan <vishwath@google.com>,
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

On Wed, Nov 7, 2018 at 7:10 PM, Catalin Marinas <catalin.marinas@arm.com> wrote:
> On Tue, Nov 06, 2018 at 06:30:23PM +0100, Andrey Konovalov wrote:
>> --- a/arch/arm64/include/asm/memory.h
>> +++ b/arch/arm64/include/asm/memory.h
>> @@ -92,6 +92,15 @@
>>  #define KASAN_THREAD_SHIFT   0
>>  #endif
>>
>> +#ifdef CONFIG_KASAN_SW_TAGS
>> +#define KASAN_TAG_SHIFTED(tag)               ((unsigned long)(tag) << 56)
>> +#define KASAN_SET_TAG(addr, tag)     (((addr) & ~KASAN_TAG_SHIFTED(0xff)) | \
>> +                                             KASAN_TAG_SHIFTED(tag))
>> +#define KASAN_RESET_TAG(addr)                KASAN_SET_TAG(addr, 0xff)
>> +#else
>> +#define KASAN_RESET_TAG(addr)                addr
>> +#endif
>
> I think we should reuse the untagged_addr() macro we have in uaccess.h
> (make it more general and move to another header file).

Will do in v11, thanks!
