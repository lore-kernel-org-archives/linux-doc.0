Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-13.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,T_DKIMWL_WL_MED,USER_IN_DEF_DKIM_WL autolearn=unavailable
	autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id E23CC7D584
	for <lwn-linux-doc@archive.lwn.net>; Wed,  5 Sep 2018 21:56:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727672AbeIFC1z (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 5 Sep 2018 22:27:55 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:46172 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728112AbeIFC1z (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 5 Sep 2018 22:27:55 -0400
Received: by mail-pg1-f195.google.com with SMTP id b129-v6so4069474pga.13
        for <linux-doc@vger.kernel.org>; Wed, 05 Sep 2018 14:55:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=p2RzG4vHvW4ubkOS/YqP9a3sMSX3q005JJhdPCB6fC0=;
        b=tJXhemKerPP5mblF+SCYncyX/16khI0ldHcN9GOay/w3HX6fd2ZQFsZhXZytnsyFXF
         H4ESSnOUNWJjY/C3mK96ND0aQ6ZTcpKUFRu4FvmEk+W+xA0zU0KOGIfWe6p+4pEbU7OL
         Q3OBZeTTOA/YI+Q8f4Ra+EL4poBO/3oO5bYE/twhZnIBuDq+VZZYqN9IzC09JXF1Dn0J
         fN3vyMJPrHkYtelNSG9m8I1FlXgDpKjLgoKytpJX/QYRGxCqkcq2VHYaimafbSWo6+Ch
         2aBVkG/z3PSUyNe6swDsk4f5aOOHV5Km5urOpCdkQkez1VwVpjuRoofhj9poMYqJ3SOV
         popQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=p2RzG4vHvW4ubkOS/YqP9a3sMSX3q005JJhdPCB6fC0=;
        b=JrH2aug/Uvy3kUfrreE90WID8KcgzZyKv/NdvBemdNXlmWG7qU4tHYs8KeIqcH9le7
         rY6lhCHhExAZoYNiWVLg9ZD1Zyz+YCsUznMGsk0d2fKoZEKHXSB4EJmiqzzeXdOMRqpr
         x2n0+ntgGyTqPhZgViFhmI7gqWNw7sJKR/8BshEz4UrOQduI3pNNoCNwwopYr8LXMN2O
         ZwSxR6rd/ujS0aOFR40Txpd/GP4U1GkTMxQBs0ntuK8SAkj6f2HEDWTvgZRBxL/GVjQt
         i0aYJbbWozUrycoBsWhuLa5BzYF15ZJVr1BmnnNVa3yuOPgV+0FT9UG6SpRh0Gu26tmC
         oifQ==
X-Gm-Message-State: APzg51B1UfwLPliTHxR+vmEsjeFmLWbxSiIJSS7Z/sRd7iW+GmGfpuMt
        yYOepctuT0ocF3LmmlyHrCY49uDIVd/rPR8yyaRRhw==
X-Google-Smtp-Source: ANB0VdZ4QSUTGy7LZadKlWwOCnjoxtL4RE9A3RiX8tZ+k3ow1myojzL6RWtwTPy+8s1YdlfWpdgmyK2tGNnxv0NV97w=
X-Received: by 2002:aa7:800f:: with SMTP id j15-v6mr42883437pfi.174.1536184546037;
 Wed, 05 Sep 2018 14:55:46 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1535462971.git.andreyknvl@google.com> <20180905141032.b1ddaab53d1b2b3bada95415@linux-foundation.org>
In-Reply-To: <20180905141032.b1ddaab53d1b2b3bada95415@linux-foundation.org>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Wed, 5 Sep 2018 14:55:34 -0700
Message-ID: <CAKwvOdn7fG0ykS5jjKMJsDmFoV7T3g6p=YucVLxrKgewhMT=Fw@mail.gmail.com>
Subject: Re: [PATCH v6 00/18] khwasan: kernel hardware assisted address sanitizer
To:     Andrew Morton <akpm@linux-foundation.org>,
        Andrey Ryabinin <aryabinin@virtuozzo.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>
Cc:     Andrey Konovalov <andreyknvl@google.com>,
        Alexander Potapenko <glider@google.com>,
        Dmitry Vyukov <dvyukov@google.com>,
        Christoph Lameter <cl@linux.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Marc Zyngier <marc.zyngier@arm.com>,
        Dave Martin <dave.martin@arm.com>,
        Ard Biesheuvel <ard.biesheuvel@linaro.org>,
        "Eric W . Biederman" <ebiederm@xmission.com>,
        Ingo Molnar <mingo@kernel.org>,
        Paul Lawrence <paullawrence@google.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Arnd Bergmann <arnd@arndb.de>,
        "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
        Greg KH <gregkh@linuxfoundation.org>,
        Kate Stewart <kstewart@linuxfoundation.org>,
        Mike Rapoport <rppt@linux.vnet.ibm.com>,
        kasan-dev <kasan-dev@googlegroups.com>,
        linux-doc@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-sparse@vger.kernel.org,
        Linux Memory Management List <linux-mm@kvack.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Kostya Serebryany <kcc@google.com>,
        Evgenii Stepanov <eugenis@google.com>,
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

On Wed, Sep 5, 2018 at 2:10 PM Andrew Morton <akpm@linux-foundation.org> wrote:
>
> On Wed, 29 Aug 2018 13:35:04 +0200 Andrey Konovalov <andreyknvl@google.com> wrote:
>
> > This patchset adds a new mode to KASAN [1], which is called KHWASAN
> > (Kernel HardWare assisted Address SANitizer).
>
> We're at v6 and there are no reviewed-by's or acked-by's to be seen.
> Is that a fair commentary on what has been happening, or have people
> been remiss in sending and gathering such things?
>

I'm anxious to use these for Pixel Android devices.  Looks like the
series has been aggregating changes from valuable feedback.  Maybe if
the ARM maintainers and KASAN maintainers could Ack or Nack these, we
could decide to merge these or what needs more work?

-- 
Thanks,
~Nick Desaulniers
