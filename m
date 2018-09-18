Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-13.4 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id B28E97DD4F
	for <lwn-linux-doc@archive.lwn.net>; Tue, 18 Sep 2018 18:42:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729618AbeISAQw (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 18 Sep 2018 20:16:52 -0400
Received: from mail-it0-f68.google.com ([209.85.214.68]:37216 "EHLO
        mail-it0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729782AbeISAQw (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 18 Sep 2018 20:16:52 -0400
Received: by mail-it0-f68.google.com with SMTP id h20-v6so4381045itf.2
        for <linux-doc@vger.kernel.org>; Tue, 18 Sep 2018 11:42:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=4d36XmtxBW5NFyXdurff1rHNSewgLeeQvwdnKIbecc0=;
        b=dpfC5YF8D4Eyb/jgB8z9LJJb7npv0hinuVPaY7/zuloofzBIfb4ihj0G3iopVdCYUv
         2ybQTIkNExxXDJbyihrMZbqq/bhkMg9eYncAerKmgc7GFWXQvNrG/18q/3Kns3kQKFB/
         015ITZ6xbbs54B8zqSLOU+NVDUtTh/BITt0R5FI9icsrPueY12xsfIhTnMRSTfM4UP8r
         sX7c/eIp9okOCVZfZaDkoFZK7yRgbw5ijHBi1/tEH3kWcYfBoblqgkw7KJ2B+W3+tmcf
         7lBxCTDl09bxUuIV0qw6lMXWv48JE+gxubVMeeAE7rJJGW2p/Z7VCFmUOF4W/8kNgCzs
         a2yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=4d36XmtxBW5NFyXdurff1rHNSewgLeeQvwdnKIbecc0=;
        b=Yc/4jCzz1H6vA7w198JinVny6I3W9iLUH6S2BBLBjy0ThEqbawdRWwMynIBuddcBAZ
         00QhIhQidp9+kMeZzO7mEZRuLhUPnsFu8WpBiOR8nVhS5dxkR4iy1BsKI5uLn77TLbt1
         wTMCg7ev3gjMENQtxmDkJWW5gv83i3+mK4ER6UMBVXf1UjI/I11eWepTVYSsqf6rAY17
         v9ZKDjIFu8HkkH1S3EVC9of/dbqkI8JO2YaHL97kJXqLxjbihIid0X/LIq1Xee1B/QW9
         yh/1NU6swiNoUCb31nkwf9KtMydSoyAjk2Y7hIe6hpp46Qj86ux2WVrgB6rifm7fiwzG
         KbFg==
X-Gm-Message-State: APzg51AiZ24rBxX4IcbYHEA6E071dYotc41jHv9ScrFlyiWUjVhDzFj4
        8V2lIW/UUd2vnqwkY8jjCWybExKkoPYelXaPqSXkRg==
X-Google-Smtp-Source: ANB0VdYdcTxqpzntHjnCUJ1d3zVspY4qpnFDX1LOIND654hhtFQOMVr480zjb+rTk2Eoty/k+X6m+unvHyWRYDr3oZg=
X-Received: by 2002:a24:9f07:: with SMTP id c7-v6mr15535988ite.53.1537296177299;
 Tue, 18 Sep 2018 11:42:57 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a02:c54e:0:0:0:0:0 with HTTP; Tue, 18 Sep 2018 11:42:56
 -0700 (PDT)
In-Reply-To: <CACT4Y+a0A1n+FjbiQSEh4UMUPkq4KnqEOEXkfo-X+EwsVFZxMg@mail.gmail.com>
References: <cover.1535462971.git.andreyknvl@google.com> <1a3b3030b6ee01931b397583b69f3af94e2a2308.1535462971.git.andreyknvl@google.com>
 <CACT4Y+a0A1n+FjbiQSEh4UMUPkq4KnqEOEXkfo-X+EwsVFZxMg@mail.gmail.com>
From:   Andrey Konovalov <andreyknvl@google.com>
Date:   Tue, 18 Sep 2018 20:42:56 +0200
Message-ID: <CAAeHK+wDhpX_E7cL8D4-BnM4WCT_Bb2Gp6wfqk7+P-4XAoiMOg@mail.gmail.com>
Subject: Re: [PATCH v6 17/18] khwasan: update kasan documentation
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

On Wed, Sep 12, 2018 at 8:39 PM, Dmitry Vyukov <dvyukov@google.com> wrote:
> On Wed, Aug 29, 2018 at 1:35 PM, Andrey Konovalov <andreyknvl@google.com> wrote:
>> This patch updates KASAN documentation to reflect the addition of KHWASAN.

>> -Currently KASAN is supported only for the x86_64 and arm64 architectures.
>> +KASAN uses compile-time instrumentation to insert validity checks before every
>> +memory access, and therefore requires a compiler version that supports that.
>> +For classic KASAN you need GCC version 4.9.2 or later. GCC 5.0 or later is
>> +required for detection of out-of-bounds accesses on stack and global variables.
>> +KHWASAN in turns is only supported in clang and requires revision 330044 or
>
> in turn?
>

>> -and choose between CONFIG_KASAN_OUTLINE and CONFIG_KASAN_INLINE. Outline and
>> -inline are compiler instrumentation types. The former produces smaller binary
>> -the latter is 1.1 - 2 times faster. Inline instrumentation requires a GCC
>> +and choose between CONFIG_KASAN_GENERIC (to enable classic KASAN) and
>> +CONFIG_KASAN_HW (to enabled KHWASAN). You also need to choose choose between
>
> to enable
>

>> +     print_address_description+0x73/0x280 mm/kasan/report.c:254
>
>
> KASAN does not print line numbers per se.
> I think we need to show unmodified output to not confuse readers
> (probably remove the useless ? lines).

Will fix all in v7.
