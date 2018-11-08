Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,USER_IN_DEF_DKIM_WL autolearn=unavailable autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id D3DF67D099
	for <lwn-linux-doc@archive.lwn.net>; Thu,  8 Nov 2018 14:48:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726931AbeKIAYC (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 8 Nov 2018 19:24:02 -0500
Received: from mail-it1-f195.google.com ([209.85.166.195]:53745 "EHLO
        mail-it1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727072AbeKIAYC (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 8 Nov 2018 19:24:02 -0500
Received: by mail-it1-f195.google.com with SMTP id r12-v6so1881211ita.3
        for <linux-doc@vger.kernel.org>; Thu, 08 Nov 2018 06:48:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=UT2LNLgTHTkAKpTXl4DqZJH7JJqcSLLb7Ngoy3nD7IY=;
        b=DgjzYi78G7HfWfbIMYpQpW/YmlvU4aWzlH//oD5cqPFf0HEQ1Ff674iUdBEmkPEQFd
         H0RSFkVg6ZBJ7jVMEiXdnBOBLTF9zV5wDiIlwImEScnQ73lVmb+R3GTakfk/uDPlg85x
         8rgULTX+5erC9B04Fkfd1tgOy00WDbBLwKmfayRQDIwkSpcCUXAS1ccagbrg0cebcLUz
         Nrc2wCyQKGeR6COkeS4oBeGR+TrMQzV8WRv6Pz3ppPniftBkWsqZz/tbmHaIvdS+TuHw
         7RIwu4pevidwkzsJxSDYSvWV4wE8K1+M8fHjZ3v+gAkVbS8psklrSd0OxMtKG2b1aL7n
         CBlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=UT2LNLgTHTkAKpTXl4DqZJH7JJqcSLLb7Ngoy3nD7IY=;
        b=svWe82w6Nq2fCpxoGhkqcQfXaXz5lzrrDT9JW4HjUtIp/sH9owdT5M9eFrdH/HKa0U
         /eP0uglE6BaVMk6KvdvoDNy+BibVQyMIwKV1/Wx1qDKVZx59t8Rw3vzvBZv4F1gdikQQ
         ayaQEvK8k/Jr7W/4XjaHoGp7vgsjpScCtzBan3TWR9ttlM3GhnwzYOL6kImzIsBg+Lsj
         87zJZ5AxURw+a2696l198Psp2k9r65Kgt+SdSZpnc4+vgMYY+WwoXoADm/CTZUjgXa5y
         Bt2J8lVmuyuDEPywB46jdV/J0rPDsUqOn32QUupGAfu7BgolqU2Ep1h/5zqrv7h7xHKZ
         HwiQ==
X-Gm-Message-State: AGRZ1gKHTAzVcYOr43AmreTTZpyn4ahDsHipnYKiRZrtvANGJZb6n5Nu
        kmXuLIkKmnDRCAOXrGhv5bzHAFh6y3uxZiI1O640EA==
X-Google-Smtp-Source: AJdET5e4Ri0qVbkbhxxVyH/nwORS8569rkWM8UCdfSxsWcrmbYX2HFdYVvkuKvsqGgZF73ovhwCo9t0TwEGI/joAh/A=
X-Received: by 2002:a24:16cb:: with SMTP id a194-v6mr1189806ita.40.1541688491836;
 Thu, 08 Nov 2018 06:48:11 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a02:1846:0:0:0:0:0 with HTTP; Thu, 8 Nov 2018 06:48:10 -0800 (PST)
In-Reply-To: <cover.1541687720.git.andreyknvl@google.com>
References: <cover.1541687720.git.andreyknvl@google.com>
From:   Andrey Konovalov <andreyknvl@google.com>
Date:   Thu, 8 Nov 2018 15:48:10 +0100
Message-ID: <CAAeHK+w1Qv6owkdWfjbXMFqOA8BURDN5gviw8vpgi3eon1dWmA@mail.gmail.com>
Subject: Re: [PATCH v8 0/8] arm64: untag user pointers passed to the kernel
To:     Catalin Marinas <catalin.marinas@arm.com>
Cc:     Will Deacon <will.deacon@arm.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Kees Cook <keescook@chromium.org>,
        Kate Stewart <kstewart@linuxfoundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Ingo Molnar <mingo@kernel.org>,
        "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
        Shuah Khan <shuah@kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Linux Memory Management List <linux-mm@kvack.org>,
        linux-arch <linux-arch@vger.kernel.org>,
        "open list:KERNEL SELFTEST FRAMEWORK" 
        <linux-kselftest@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Dmitry Vyukov <dvyukov@google.com>,
        Kostya Serebryany <kcc@google.com>,
        Evgeniy Stepanov <eugenis@google.com>,
        Lee Smith <Lee.Smith@arm.com>,
        Ramana Radhakrishnan <Ramana.Radhakrishnan@arm.com>,
        Jacob Bramley <Jacob.Bramley@arm.com>,
        Ruben Ayrapetyan <Ruben.Ayrapetyan@arm.com>,
        Chintan Pandya <cpandya@codeaurora.org>,
        Luc Van Oostenryck <luc.vanoostenryck@gmail.com>,
        Andrey Konovalov <andreyknvl@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Nov 8, 2018 at 3:36 PM, Andrey Konovalov <andreyknvl@google.com> wrote:

[...]

> Changes in v8:
> - Rebased onto 65102238 (4.20-rc1).
> - Added a note to the cover letter on why syscall wrappers/shims that untag
>   user pointers won't work.
> - Added a note to the cover letter that this patchset has been merged into
>   the Pixel 2 kernel tree.
> - Documentation fixes, in particular added a list of syscalls that don't
>   support tagged user pointers.

Hi Catalin,

I've changed the documentation to be more specific, please take a look.

I haven't done anything about adding a way for the user to find out
that the kernel supports this ABI extension. I don't know what would
the the preferred way to do this, and we haven't received any comments
on that from anybody else. Probing "on some innocuous syscall
currently returning -EFAULT on tagged pointer arguments" works though,
as you mentioned.

As mentioned in the cover letter, this patchset has been merged into
the Pixel 2 kernel tree.

Thanks!
