Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id D2C377D089
	for <lwn-linux-doc@archive.lwn.net>; Wed,  7 Nov 2018 15:11:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727203AbeKHAmX (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 7 Nov 2018 19:42:23 -0500
Received: from mail-it1-f194.google.com ([209.85.166.194]:55418 "EHLO
        mail-it1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726886AbeKHAmW (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 7 Nov 2018 19:42:22 -0500
Received: by mail-it1-f194.google.com with SMTP id b7-v6so23273740itd.5
        for <linux-doc@vger.kernel.org>; Wed, 07 Nov 2018 07:11:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=gSaho8qIaLLkIJAcf1Eztz8xA4nVJAZfCUbb2rWlRZg=;
        b=GecJQaPByED/rwO2pbLIzqWjDjp9TZYHw5ZtpvYkqu4vN9B0NSOZSPRFPRF59AnTjP
         OI54EddeN1XnPFKKNNNe2neZtGTjQLrXkj9z3/KsjuPp52N5Z+qumgCXbFR7c7FWxyoN
         cy4rL/b1BnyMmKOkDch6yRCpLCl/HIv3j4w7PWHaCI+144o1Cznoe8AalGzFs+WtoYer
         bxWb4j8KIWe2ZUxOGJwjcCmfyi3/75E8eBm9TDyBhxZhdYtBz76qNcvfO4fmWSF5elWC
         IlxJYanmyv2rJP3TTv114ZNAwTBaE2mO81NLkAnmGTqGTYnW15qgs1ZHJrO8Ftq7raP+
         4zDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=gSaho8qIaLLkIJAcf1Eztz8xA4nVJAZfCUbb2rWlRZg=;
        b=JmfotHp62q0+rh0bgTX2ehPUdkZ2vangLcw6nUB+DLuXXkY0rZ41eidTptvFutwMRE
         xzAUMr45eQFF44HWhNcELKoTLMpegYNGTHozYvRbn8cXspb+hGki3anx587EYd5uo21e
         3AER0TynWuE7ArbHYG1bt3w65gSr3pTKInGmQ7AGEExyKkyNP3IrbSNEshQgeWPKxCtW
         Blo0FCiuMMRVQHjDWHtF5b9HHA1RpV2/PvJkY96n7k552RzAUHK25ptXF2MgTDmj44Di
         vbIJigAy43dZCxaGLqzmanG1Vj4vA089F68UuXPI122sajNx9R79be9t2elrCzyQsYv0
         jzHA==
X-Gm-Message-State: AGRZ1gIrB0noWB6otRLO9eMnprXkPSgl9ifpeswadl4jMPF0rQS3ClFy
        pJKLhcuRdQ8jALNK2E3G4iBsN07DH0nk+mis7CMysg==
X-Google-Smtp-Source: AJdET5cc9hEkTiDH0SiNzeHJYMfVQRFSBHTdyQiNuOemZl3ds2+2P/SoAYGAEU7ghh/nN8XSVI89mNHwRxgW7RZ+Y2Y=
X-Received: by 2002:a24:dac7:: with SMTP id z190-v6mr471675itg.87.1541603496061;
 Wed, 07 Nov 2018 07:11:36 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a02:1846:0:0:0:0:0 with HTTP; Wed, 7 Nov 2018 07:11:35 -0800 (PST)
In-Reply-To: <20181107145922.GD2623@brain-police>
References: <cover.1541525354.git.andreyknvl@google.com> <CAAeHK+yOsP7V0gPu7EpqCbJZqbGQMZbAp6q1+=0dNGC24reyWg@mail.gmail.com>
 <20181107145922.GD2623@brain-police>
From:   Andrey Konovalov <andreyknvl@google.com>
Date:   Wed, 7 Nov 2018 16:11:35 +0100
Message-ID: <CAAeHK+zNgv9WxRpf7N3gmsLYGL6oUALAnyerMzeYZUz1LhoUuA@mail.gmail.com>
Subject: Re: [PATCH v10 00/22] kasan: add software tag-based mode for arm64
To:     Will Deacon <will.deacon@arm.com>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Kostya Serebryany <kcc@google.com>,
        Evgeniy Stepanov <eugenis@google.com>,
        Lee Smith <Lee.Smith@arm.com>,
        Ramana Radhakrishnan <Ramana.Radhakrishnan@arm.com>,
        Jacob Bramley <Jacob.Bramley@arm.com>,
        Ruben Ayrapetyan <Ruben.Ayrapetyan@arm.com>,
        Jann Horn <jannh@google.com>,
        Mark Brand <markbrand@google.com>,
        Chintan Pandya <cpandya@codeaurora.org>,
        Vishwath Mohan <vishwath@google.com>,
        Andrey Ryabinin <aryabinin@virtuozzo.com>,
        Alexander Potapenko <glider@google.com>,
        Dmitry Vyukov <dvyukov@google.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
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

On Wed, Nov 7, 2018 at 3:59 PM, Will Deacon <will.deacon@arm.com> wrote:
> On Wed, Nov 07, 2018 at 03:56:03PM +0100, Andrey Konovalov wrote:
>> On Tue, Nov 6, 2018 at 6:30 PM, Andrey Konovalov <andreyknvl@google.com> wrote:
>> > This patchset adds a new software tag-based mode to KASAN [1].
>> > (Initially this mode was called KHWASAN, but it got renamed,
>> >  see the naming rationale at the end of this section).
>>
>> [...]
>>
>> > Reviewed-by: Andrey Ryabinin <aryabinin@virtuozzo.com>
>> > Reviewed-by: Dmitry Vyukov <dvyukov@google.com>
>> > Signed-off-by: Andrey Konovalov <andreyknvl@google.com>
>>
>> Hi Andrew,
>>
>> This patchset has now been reviewed-by KASAN maintainers. Could you
>> take a look and consider taking this into the -mm tree?
>
> I would much prefer to take the arm64 parts (which still need to be reviewed
> by Catalin afaict) via the arm64 tree, so please can you split those out
> separately?

Which parts do you mean exactly, which patches? I don't think it makes
sense to split this patchset, as one part won't function without the
other.
