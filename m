Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 4EC7B7D089
	for <lwn-linux-doc@archive.lwn.net>; Wed,  7 Nov 2018 15:56:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731254AbeKHB1S (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 7 Nov 2018 20:27:18 -0500
Received: from mail-io1-f65.google.com ([209.85.166.65]:41706 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730583AbeKHB1S (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 7 Nov 2018 20:27:18 -0500
Received: by mail-io1-f65.google.com with SMTP id a5-v6so12242841ioq.8
        for <linux-doc@vger.kernel.org>; Wed, 07 Nov 2018 07:56:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=UA3nks6dFaGQKahoiLGstMR6jL9rjzjXSjUXCWIc7yo=;
        b=k1C5ofuI1ZiKeq9zgy7x6KrBJvutRffx2OvofpS3rMnZtR//wP+F6r1epcmqQeJjCo
         4875jAeUIIcedUjAz4YIAMBeKY2Rsgqjpw8pNMQu8/ZnGL7E/dRHHMU4qCqGJ2rILXTb
         PkxHAZHUwKSKaYYlmPSeqJlNO8CtZah/72Fr/sdYNg4g172Jogv2lsOVo+l/IATS9nW+
         JWTb/7vo0sK72aUWzcFXK8KIuW2enl+P0oUfzEBXFLABa03n1vsoTverXEUoffS2J6Xs
         cZ2WqL9FfFHzymMoh21S2ZKjS+x1ZyRwMc1rxIPECKoYhoTDf3kHOhmsxGE1ux/skTwO
         ltrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=UA3nks6dFaGQKahoiLGstMR6jL9rjzjXSjUXCWIc7yo=;
        b=Y/z8eVygHjgg3EcN21E1HSVEHQj0QP8O0Hl0jsSdO8rk7Q6uVwQA/lWo0VhacIIz8u
         65BRhM48BuE3sEUQIWC2NKphD9ulfm//9xhYu9uvjtO3Ec3QCRsaZd/WhD79RcAan4Y5
         sQZ442l0TRi0LkuMnHzPrHsgOvni7i2ubt5T3PwJTI3Bck6o0O3spDxwco1lap4m9bFC
         hQ2W+1uL8/v/DLyQKAB75u6SuxVFrQycE7m1acd1YwX5PBZUv9wvWsdpCG8MXY7oCJOp
         gbfJvGq4QL8JM69GQiNAP9xr1788cxdvCZqpmSjME+YCDMLIf60nmdiAJXy8XlemF7ti
         kVdw==
X-Gm-Message-State: AGRZ1gJWAYgNyFMe956rLVWYcg64iqUVt+TYWRRxjN23EkY954jT71pc
        0dtTJUYvRIV9IEpVCTJLEn82G/aDGY3Picn4n25mKQ==
X-Google-Smtp-Source: AJdET5fSwRELK0Y832KhrCakKuPRyGR5cRxcR591d3OlKTe5/oSl9qKkD66332Q8sqG6VcNd80BLwuVWwxyWrm3t24w=
X-Received: by 2002:a6b:6904:: with SMTP id e4-v6mr636228ioc.119.1541606181670;
 Wed, 07 Nov 2018 07:56:21 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a02:1846:0:0:0:0:0 with HTTP; Wed, 7 Nov 2018 07:56:21 -0800 (PST)
In-Reply-To: <20181107153456.GE2623@brain-police>
References: <cover.1541525354.git.andreyknvl@google.com> <CAAeHK+yOsP7V0gPu7EpqCbJZqbGQMZbAp6q1+=0dNGC24reyWg@mail.gmail.com>
 <20181107145922.GD2623@brain-police> <CAAeHK+zNgv9WxRpf7N3gmsLYGL6oUALAnyerMzeYZUz1LhoUuA@mail.gmail.com>
 <20181107153456.GE2623@brain-police>
From:   Andrey Konovalov <andreyknvl@google.com>
Date:   Wed, 7 Nov 2018 16:56:21 +0100
Message-ID: <CAAeHK+yRAVo5S1Fb__uzK=drpXRBuB8-KvL8yQL8sfUG-Tr1Mw@mail.gmail.com>
Subject: Re: [PATCH v10 00/22] kasan: add software tag-based mode for arm64
To:     Will Deacon <will.deacon@arm.com>,
        Catalin Marinas <catalin.marinas@arm.com>
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

On Wed, Nov 7, 2018 at 4:34 PM, Will Deacon <will.deacon@arm.com> wrote:
>
> I would like the patches that touch code under arch/arm64/ to be reviewed by
> somebody from the arm64 community. Since the core parts have already been
> reviewed, I was suggesting that you could split them out so that they are
> not blocked by the architecture code. Is it not possible to preserve the
> existing KASAN behaviour for arm64 with the core parts merged? I figured it
> must be, since you're not touching any other architectures here and they
> assumedly continue to function correctly.

It's possible to split out the core mm part, but it doesn't make much
sense to merge it separately from the arm64 changes.

> However, if you'd rather keep everything together, please can we give it a
> couple of weeks so we can at least get the architecture bits reviewed? Most
> people are out at LPC next week (and I'm at another conference this week).

OK, sounds good!

Catalin, could you take a look at the arm64 specific changes?
