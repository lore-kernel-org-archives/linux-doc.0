Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-13.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,T_DKIMWL_WL_MED,USER_IN_DEF_DKIM_WL autolearn=ham
	autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 01C9E7D57F
	for <lwn-linux-doc@archive.lwn.net>; Thu,  6 Sep 2018 11:06:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727625AbeIFPlU (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 6 Sep 2018 11:41:20 -0400
Received: from mail-it0-f66.google.com ([209.85.214.66]:36215 "EHLO
        mail-it0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726505AbeIFPlU (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 6 Sep 2018 11:41:20 -0400
Received: by mail-it0-f66.google.com with SMTP id u13-v6so13593903iti.1
        for <linux-doc@vger.kernel.org>; Thu, 06 Sep 2018 04:06:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=eQUtzab2F5p5J0hzS+43NK1LRC4wjId0Bpq0D/n7OE8=;
        b=MihKNWiesmAWUZOBS9DNoR+kr6cqqIobt7djEp08rqurqST70dbrR0u5Z+yEllMTfM
         eyYDEbfNSzopXYn4kQps9z4bJYAbxgZSYvW4JL1qy2KSCc4KnXer4jGrQ+h81sQB8z3z
         2AjFiUYp2qIh5WwlY/4q13b9+yOMUY2nYP0Z7YWN3n8UjLR1Nbr9C4V2pA1S/F/a7JHx
         fA85oIh+lyFwa8HscWiEbIxWh+Mp5RpxgGrS2tSqrkx0WH00oEw48lnO7lyFRB0FGLq2
         K5t5kGGXOD56nfGE44edQeyWUGPU1Hsb1xVCbQ/Wmx4Q5LDPaRNmvgsGTDc9weVwZNE7
         EpQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=eQUtzab2F5p5J0hzS+43NK1LRC4wjId0Bpq0D/n7OE8=;
        b=Y4N7hvkDJftJieWrf2fen1LOSzPvL/KjxgVfsnqoQFlD/3bqqLoiQzF3G5TZuRpAYz
         S+/nF7Fl4+zeawyDnaLPZGm1HLHskCaYJqD9ZMYxTqGlSoVMEPRdMmEMqwZT0aTbpUJc
         8pAS8ksC0u6RTGthRomH49KjfXz6WA7zgzFSaE9rMngo7/gTeHH8W2XhoxuHbJYsdSY6
         QqZZvkV8uKntHsRjENbmonIaRNILF9N9PKRu3uqYPx4pzORYfTn3N2z0aMeoWTI0OMGC
         97WFFnePYYqS2U46Yvc2E5fnqkEtUa8xakyupziY0SEbsMVSSUgAtpZq7r0C1rDlcuzh
         2WYQ==
X-Gm-Message-State: APzg51D+U2phV1RBuFIU0wRO6/UZruEaGJ+TQopDXThJM8K7uFd+G8HO
        uaeQuh2USxEw32oPisA/qeyoWyb65ga7DS4EYS2/Yw==
X-Google-Smtp-Source: ANB0VdbtB5Cl72G1F2KRoy/KhSv1EQN/rOfZCfw8OiuHMBrWWenQptarfbU8+rIVyospx5/9tNsf7IqdVdAvGaahbsM=
X-Received: by 2002:a24:5f92:: with SMTP id r140-v6mr1938778itb.95.1536231983791;
 Thu, 06 Sep 2018 04:06:23 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a02:554:0:0:0:0:0 with HTTP; Thu, 6 Sep 2018 04:06:23 -0700 (PDT)
In-Reply-To: <20180906100543.GI3592@arm.com>
References: <cover.1535462971.git.andreyknvl@google.com> <20180905141032.b1ddaab53d1b2b3bada95415@linux-foundation.org>
 <20180906100543.GI3592@arm.com>
From:   Andrey Konovalov <andreyknvl@google.com>
Date:   Thu, 6 Sep 2018 13:06:23 +0200
Message-ID: <CAAeHK+wStsNwh2oKv-KCG4kx5538FuDMQ6Yw2X=sK5LPrw2DZg@mail.gmail.com>
Subject: Re: [PATCH v6 00/18] khwasan: kernel hardware assisted address sanitizer
To:     Will Deacon <will.deacon@arm.com>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
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
        kasan-dev <kasan-dev@googlegroups.com>,
        linux-doc@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-sparse@vger.kernel.org,
        Linux Memory Management List <linux-mm@kvack.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
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

On Thu, Sep 6, 2018 at 12:05 PM, Will Deacon <will.deacon@arm.com> wrote:
> On Wed, Sep 05, 2018 at 02:10:32PM -0700, Andrew Morton wrote:
>> On Wed, 29 Aug 2018 13:35:04 +0200 Andrey Konovalov <andreyknvl@google.com> wrote:
>>
>> > This patchset adds a new mode to KASAN [1], which is called KHWASAN
>> > (Kernel HardWare assisted Address SANitizer).
>>
>> We're at v6 and there are no reviewed-by's or acked-by's to be seen.
>> Is that a fair commentary on what has been happening, or have people
>> been remiss in sending and gathering such things?
>
> I still have concerns about the consequences of merging this as anything
> other than a debug option [1]. Unfortunately, merging it as a debug option
> defeats the whole point, so I think we need to spend more effort on developing
> tools that can help us to find and fix the subtle bugs which will arise from
> enabling tagged pointers in the kernel.

I totally don't mind calling it a debug option. Do I need to somehow
specify it somewhere?

Why does it defeat the point? The point is to ease KASAN-like testing
on devices with limited memory.
