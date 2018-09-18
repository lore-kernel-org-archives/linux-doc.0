Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-13.4 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 2B7747D57F
	for <lwn-linux-doc@archive.lwn.net>; Tue, 18 Sep 2018 16:50:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729900AbeIRWYM (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 18 Sep 2018 18:24:12 -0400
Received: from mail-io1-f66.google.com ([209.85.166.66]:38270 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728065AbeIRWYM (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 18 Sep 2018 18:24:12 -0400
Received: by mail-io1-f66.google.com with SMTP id y3-v6so2140269ioc.5
        for <linux-doc@vger.kernel.org>; Tue, 18 Sep 2018 09:50:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=S7NSi8y5oqjKqVQu+A5gE7d9gD4oGqqQyNJAQWjDqVs=;
        b=LDg/YjO/irWKmN3s7HJilg47wiCRlMtNAtqwm4Y2t7gql3JwLohRZY/iiFRWMvJXEi
         Bbue0MpGpWl/EoWn9/bv4s41xCyq8PbMyNLR+7BUc+fQnF865gSe0xjUejt1gtatCXS6
         5PWWQD+RJZys8UUF4turVeLvp4PFU8U73/ZIGfkAGUjajugrarm6EDCCOrZNVpW/biF8
         xg1oX1lH2uVEXpYmeZuzJma3tD/7kKbf6IR9+OA1XDA/WIJf1XUZC+WuLKPYVImwErRY
         5KGhr7jDpWKN5c9+c+toHhsCCmrLtQdSUlkCVjxI6y/hP9cm/mdL3NcFH6rcUTOIr4cT
         V/AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=S7NSi8y5oqjKqVQu+A5gE7d9gD4oGqqQyNJAQWjDqVs=;
        b=buZWos+vnGxeuy0Ce5+D/gkcy9YpQkGCTE9QbA3Nrw7tB9sI/xHKptZcFfrj8jF+Kn
         jqtauV7PNjqeXMTKAEwzB/a4HBEBYDuuwfm0OqgZIlrkHA8mZiXOUrJ7svZ1tQD2e6JY
         GuoUMoekOpWbsSMD18Xb8T0CwVb+6DCzhnE1K5clPuwot+NOIByv9PGufEEIZlK9e/L9
         od8iqKs+6fTg+/PxR67R/Iluixqh1cJRSO0Qhfh1fNgK3h/3n6jJRw8bCmB2Syf2p8pu
         nNcfYbS3GJnNYyi2HDF2+ORGACekjZZo6NZaeHPvcgbdu3AhTjlaRcZSzp5UbKtmx1If
         Qdxw==
X-Gm-Message-State: APzg51BExHeb1Q788AMI3gxA20T4NOuOEBtyqMizhay2u/82LUces14/
        NG8TTDcUs1InOTY1CwEwQoxUDRcKFCAZpnsYy9rhsA==
X-Google-Smtp-Source: ANB0VdYx/8DId4QQx4kOmfZXWV7OZTbWXv2pf6J0pgoluaAvMz9R2OKl2U9UJdBIxGtqcOJvE/HXrOT5fcrpY2gTzGc=
X-Received: by 2002:a6b:2147:: with SMTP id h68-v6mr25437479ioh.192.1537289445779;
 Tue, 18 Sep 2018 09:50:45 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a02:c54e:0:0:0:0:0 with HTTP; Tue, 18 Sep 2018 09:50:45
 -0700 (PDT)
In-Reply-To: <CACT4Y+awX48sFAYFCgx1Q-nJ=QrBhr08psMmHr+hDeCsQc0NRw@mail.gmail.com>
References: <cover.1535462971.git.andreyknvl@google.com> <95b5beb7ec13b7e998efe84c9a7a5c1fa49a9fe3.1535462971.git.andreyknvl@google.com>
 <CACT4Y+awX48sFAYFCgx1Q-nJ=QrBhr08psMmHr+hDeCsQc0NRw@mail.gmail.com>
From:   Andrey Konovalov <andreyknvl@google.com>
Date:   Tue, 18 Sep 2018 18:50:45 +0200
Message-ID: <CAAeHK+z3W+JqC2d=-ZddsLv5D7BWa6oKpEdJFiyS1DbEYVnmqA@mail.gmail.com>
Subject: Re: [PATCH v6 08/18] khwasan: preassign tags to objects with ctors or SLAB_TYPESAFE_BY_RCU
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

On Wed, Sep 12, 2018 at 6:36 PM, Dmitry Vyukov <dvyukov@google.com> wrote:
> On Wed, Aug 29, 2018 at 1:35 PM, Andrey Konovalov <andreyknvl@google.com> wrote:

>>         if (!shuffle) {
>> +               start = khwasan_preset_slub_tag(s, start);
>>                 for_each_object_idx(p, idx, s, start, page->objects) {
>>                         setup_object(s, page, p);
>> +                       p = khwasan_preset_slub_tag(s, p);
>
>
> As I commented in the previous patch, can't we do this in
> kasan_init_slab_obj(), which should be called in all the right places
> already?
>

As per offline discussion, will do in v7.
