Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 97CB67DD32
	for <lwn-linux-doc@archive.lwn.net>; Wed,  7 Nov 2018 14:57:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388015AbeKHA0s (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 7 Nov 2018 19:26:48 -0500
Received: from mail-it1-f195.google.com ([209.85.166.195]:33766 "EHLO
        mail-it1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387788AbeKHA0r (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 7 Nov 2018 19:26:47 -0500
Received: by mail-it1-f195.google.com with SMTP id p11-v6so13265322itf.0
        for <linux-doc@vger.kernel.org>; Wed, 07 Nov 2018 06:56:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=pVk9DO33xtV8EwqR0kDZRvHvlGf++c/dWD1i8q1/NwU=;
        b=bgarql7u4IPcC1RUpqErefUbjfsJ0u01JrKNYaJ00WLPhUzCxP+gnOOJjGt6KfG2HN
         6pSRy/8yDGT+DZF5qpmpELdbcC9EtmyMlWJtV67C2zkGJ177454q2aI5u2DYLW7g8X8a
         blSofz6cVEgw6Wu6r4Nu2iCHFDp8fi2kt0rSdFZWJSXVh+7w3NACczLkvV9EjeayY34/
         h5eY542HPNz0+i7PSllNVISWgPb5tclIRNYN38SERRwaWVFCqv0ItEdkLIb4ICgC39ER
         /vvGVFmU4pKYXEB9um1rGVkOVViNFMSfWoCaRuMQNpj2g+u3pUm0fOg5do6DAjlGo7cZ
         /YKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=pVk9DO33xtV8EwqR0kDZRvHvlGf++c/dWD1i8q1/NwU=;
        b=A3AXVACuhj231sCBssi81lgmTy0jxbT/10e5Yl5t6tpgq3j1K5r9ZxB4r3TMacSEQt
         u/SLUXE13EL5Ycq6VdRe+SqTd2FN8kr253AwfZvGZR06RRr52gygtM5xrxEiNqV8AHa0
         Us4RHaCJPrJtByUL7a4MB5aLFvLJlFIKtwMW7mNYJ9kIz+QhxnEVWcDw4yN14mUzrbGo
         6mw76m5WlzT7t+KFNvdzbIIBsMcrULzCY0PZcd8CXW0Zw+JLUH7YJ3uu90TsjO8kjMP6
         COZqXdDEO18jnTIh7JnbcYPPxDdjyM/Gk6utjJU2hr1ggeMYmM+YB+epwr1CTNaCZgwO
         wUsw==
X-Gm-Message-State: AGRZ1gJL1bHr9JAu1ipdRad0dac4QbpjS3yJPBL8R4neU4MJOtH6V6fB
        xCa/2rBWh6Gs2Fn8Py1AcPg8dWzknOxbH9YhN71f0g==
X-Google-Smtp-Source: AJdET5d/p31FJAoulW5xTOAjnTDF/Dv7gMx9O9ru6UhCQNfcgkLjkgJDynOyOOqH3aGI/Z4FkZoQd7mmi5kr/LI+CkI=
X-Received: by 2002:a24:16cb:: with SMTP id a194-v6mr461782ita.40.1541602564074;
 Wed, 07 Nov 2018 06:56:04 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a02:1846:0:0:0:0:0 with HTTP; Wed, 7 Nov 2018 06:56:03 -0800 (PST)
In-Reply-To: <cover.1541525354.git.andreyknvl@google.com>
References: <cover.1541525354.git.andreyknvl@google.com>
From:   Andrey Konovalov <andreyknvl@google.com>
Date:   Wed, 7 Nov 2018 15:56:03 +0100
Message-ID: <CAAeHK+yOsP7V0gPu7EpqCbJZqbGQMZbAp6q1+=0dNGC24reyWg@mail.gmail.com>
Subject: Re: [PATCH v10 00/22] kasan: add software tag-based mode for arm64
To:     Andrew Morton <akpm@linux-foundation.org>
Cc:     Kostya Serebryany <kcc@google.com>,
        Evgeniy Stepanov <eugenis@google.com>,
        Lee Smith <Lee.Smith@arm.com>,
        Ramana Radhakrishnan <Ramana.Radhakrishnan@arm.com>,
        Jacob Bramley <Jacob.Bramley@arm.com>,
        Ruben Ayrapetyan <Ruben.Ayrapetyan@arm.com>,
        Jann Horn <jannh@google.com>,
        Mark Brand <markbrand@google.com>,
        Chintan Pandya <cpandya@codeaurora.org>,
        Vishwath Mohan <vishwath@google.com>,
        Andrey Konovalov <andreyknvl@google.com>,
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
        kasan-dev@googlegroups.com,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-sparse@vger.kernel.org,
        Linux Memory Management List <linux-mm@kvack.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Nov 6, 2018 at 6:30 PM, Andrey Konovalov <andreyknvl@google.com> wrote:
> This patchset adds a new software tag-based mode to KASAN [1].
> (Initially this mode was called KHWASAN, but it got renamed,
>  see the naming rationale at the end of this section).

[...]

> Reviewed-by: Andrey Ryabinin <aryabinin@virtuozzo.com>
> Reviewed-by: Dmitry Vyukov <dvyukov@google.com>
> Signed-off-by: Andrey Konovalov <andreyknvl@google.com>

Hi Andrew,

This patchset has now been reviewed-by KASAN maintainers. Could you
take a look and consider taking this into the -mm tree?

Thanks!
