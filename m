Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 575D37E22E
	for <lwn-linux-doc@archive.lwn.net>; Fri, 11 May 2018 12:36:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1752835AbeEKMgY (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 11 May 2018 08:36:24 -0400
Received: from mail-io0-f170.google.com ([209.85.223.170]:37146 "EHLO
        mail-io0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752752AbeEKMgX (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 11 May 2018 08:36:23 -0400
Received: by mail-io0-f170.google.com with SMTP id e20-v6so6829709iof.4
        for <linux-doc@vger.kernel.org>; Fri, 11 May 2018 05:36:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=nukVuubG0PtvETsOeOCDB8+hK3wKQhWo+f6+7KQfU24=;
        b=JRRUs0Aym53/FNuTLyJGgMysXql8jgDkqxpAe1w4LQQmjp1BarLmCSbnfjzYMNdT3e
         LoTTII+pPmRlR79QzMnZFZ0OHfIuvg3GoIXLVvdk+v/ZN6o0Ewsu6/VGKqAZMionm/TM
         xI+qEKJDnzTaaW3bOPRltcrnCiEO3seB/M3qGBn0uS5rl03WAMhfx5dNZc44soY7kQUy
         KoZUZRcLwwejdEUqHbSu4x+BCzrIMJxXzHhHmbVjn8SX2SAwfft1J6APMmxwdZ49PNzU
         GFHrRU19UtyNGm1KAHjttPsGUhySdOFUh9Hf8FB9yxaKSXulSG1FM6z7cBebEexfRBmK
         5fjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=nukVuubG0PtvETsOeOCDB8+hK3wKQhWo+f6+7KQfU24=;
        b=jCUSUGR6Cig/O88lNdmzcEfnov7+OUuGGG1+uj126y9rkwWbKE3ykydqiUO6zAENAP
         YKqorwGnaylHn0Y9Lc1YwyVOHAmaTY5XSvM6cFMD6HErQTpgpEY3N1ef7XvuX6mG5Ajd
         zbU6jtPEz+lQ6DG+ivL55WenzFNbOU3VqYy2Y9eVlfxLBw4XDDLlG0gESM2JjZpsOZ19
         YD3cNze/daNDpJoupBy3cRfviX3rAkjQnwkjKthygJMKZtCup6luz41HC5gUHxKfvkHZ
         BdFLS3asKHYSsBaIkt3lmsrQVC8ZnXynAXdxWZvrSMpm06yp/bBxthmSnbAn6hzqDMz4
         wfeQ==
X-Gm-Message-State: ALKqPweJldEcyZ1QR5zn+wlH407NS6LulquTN9HEMd7Evj/n7Mo5Cx6t
        eznU5Iw5J1n6rHUx9+3O4RygGx+RRyNfYpYT4AUvEuB6D24=
X-Google-Smtp-Source: AB8JxZqPPwr2n8Jby83evYFjEIEBVlfFFH98d8EVRx37cXxoeKOoq6bO8MXFcyU14bya2kmpX+T5mekM+UTWuqyimsg=
X-Received: by 2002:a6b:4514:: with SMTP id s20-v6mr5822734ioa.38.1526042182751;
 Fri, 11 May 2018 05:36:22 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a02:6646:0:0:0:0:0 with HTTP; Fri, 11 May 2018 05:36:22
 -0700 (PDT)
In-Reply-To: <20180508151137.zguepljs3pa7xv5g@armageddon.cambridge.arm.com>
References: <cover.1524077494.git.andreyknvl@google.com> <0db34d04fa16be162336106e3b4a94f3dacc0af4.1524077494.git.andreyknvl@google.com>
 <20180426174714.4jtb72q56w3xonsa@armageddon.cambridge.arm.com>
 <CAAeHK+zY8p9E4FZa7mbdgR=wR0u-RDS552dn=h9fKRC-ArYLdw@mail.gmail.com>
 <20180502153645.fui4ju3scsze3zkq@black.fi.intel.com> <CAAeHK+yTbmZfkeNbqbo+J90zsjsM99rwnYBGfQBxphHMMfgD7A@mail.gmail.com>
 <20180508151137.zguepljs3pa7xv5g@armageddon.cambridge.arm.com>
From:   Andrey Konovalov <andreyknvl@google.com>
Date:   Fri, 11 May 2018 14:36:22 +0200
Message-ID: <CAAeHK+yR9=SYEBg-Pvi+x3qSqQSG1u+79pk5vQvOcsp+o=zkxw@mail.gmail.com>
Subject: Re: [PATCH 4/6] mm, arm64: untag user addresses in mm/gup.c
To:     Catalin Marinas <catalin.marinas@arm.com>
Cc:     "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Kate Stewart <kstewart@linuxfoundation.org>,
        linux-doc@vger.kernel.org, Will Deacon <will.deacon@arm.com>,
        Linux Memory Management List <linux-mm@kvack.org>,
        Ingo Molnar <mingo@kernel.org>,
        Jacob Bramley <Jacob.Bramley@arm.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Dmitry Vyukov <dvyukov@google.com>,
        Bart Van Assche <bart.vanassche@wdc.com>,
        Ramana Radhakrishnan <Ramana.Radhakrishnan@arm.com>,
        Evgeniy Stepanov <eugenis@google.com>,
        Kees Cook <keescook@chromium.org>,
        Ruben Ayrapetyan <Ruben.Ayrapetyan@arm.com>,
        Lee Smith <Lee.Smith@arm.com>,
        Dan Williams <dan.j.williams@intel.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Al Viro <viro@zeniv.linux.org.uk>,
        Thomas Gleixner <tglx@linutronix.de>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Kostya Serebryany <kcc@google.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        LKML <linux-kernel@vger.kernel.org>,
        James Morse <james.morse@arm.com>,
        "Aneesh Kumar K . V" <aneesh.kumar@linux.vnet.ibm.com>,
        Philippe Ombredanne <pombredanne@nexb.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Zi Yan <zi.yan@cs.rutgers.edu>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, May 8, 2018 at 5:11 PM, Catalin Marinas <catalin.marinas@arm.com> wrote:
> On Wed, May 02, 2018 at 07:25:17PM +0200, Andrey Konovalov wrote:
>> On Wed, May 2, 2018 at 5:36 PM, Kirill A. Shutemov
>> <kirill.shutemov@linux.intel.com> wrote:
>> > On Wed, May 02, 2018 at 02:38:42PM +0000, Andrey Konovalov wrote:
>> >> > Does having a tagged address here makes any difference? I couldn't hit a
>> >> > failure with my simple tests (LD_PRELOAD a library that randomly adds
>> >> > tags to pointers returned by malloc).
>> >>
>> >> I think you're right, follow_page_mask is only called from
>> >> __get_user_pages, which already untagged the address. I'll remove
>> >> untagging here.
>> >
>> > It also called from follow_page(). Have you covered all its callers?
>>
>> Oh, missed that, will take a look.
>>
>> Thinking about that, would it make sense to add untagging to find_vma
>> (and others) instead of trying to cover all find_vma callers?
>
> I don't think adding the untagging to find_vma() is sufficient. In many
> cases the caller does a subsequent check like 'start < vma->vm_start'
> (see sys_msync() as an example, there are a few others as well).

OK.

> What I
> did in my tests was a WARN_ON_ONCE() in find_vma() if the address is
> tagged.

So this is similar to what I did.

Do you think trying to find "all places where we cast out __user" with
static analysis as Kirill suggested is something I should pursue? Or
is this patchset is good as is as the first approximation, since we
can fix more things where untagging is needed as we discover them one
by one?
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
