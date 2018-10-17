Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-13.4 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,USER_IN_DEF_DKIM_WL autolearn=unavailable autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 97BF77D08A
	for <lwn-linux-doc@archive.lwn.net>; Wed, 17 Oct 2018 14:20:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726727AbeJQWQi (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 17 Oct 2018 18:16:38 -0400
Received: from mail-io1-f65.google.com ([209.85.166.65]:44824 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727583AbeJQWQh (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 17 Oct 2018 18:16:37 -0400
Received: by mail-io1-f65.google.com with SMTP id s6-v6so8275469ioa.11
        for <linux-doc@vger.kernel.org>; Wed, 17 Oct 2018 07:20:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=KPdp+rW27wHQyFO6nfUOPLD9Kud1YSjqrG6RP/U4vO4=;
        b=pl68ASzFVQ+2xtpAA8zTjWi98A1rIKG9CJKpMk/r36jQ01qiPPVVMZePVU0kwz9ZbD
         p/Gh/hAwsRS4EODiilGDQay0utTHcfNUNBwtaf7jckHnBJdC529id2E/dxYPNZ3FluEk
         jknc0oKbCw902OVFq6yNx+V5nC5TXvksJsy8TB1tnC/iU4ZxEPl2tuo+lzZzL/hAMCvW
         8SRkdMXzCaHy11+nA582qx9/ZCZx/YrKqkIGQVyDDp7forlvZiyCuSxF7FSE95Qoy2/l
         Ts2mjnPRSUUzmuGjHgQqUKQxTbyZfQF2ew+jLNEpHSD/EJzBmhFxNoqB+yR3cOUmMVg8
         X07g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=KPdp+rW27wHQyFO6nfUOPLD9Kud1YSjqrG6RP/U4vO4=;
        b=IoihctBwRsA96a+BhDIjlzpahIsjefKEeFqy80ofCZihAdjIqRZ6Ln1+v9mxxqW7Pu
         8pYLQO+sHHIUTaCQAWs1cGBka3WbvIrvHAOZKY/iXsbM7q1znv4ixgTCYqrsPHi12R9Y
         xEoL/9W2xSYT8lSBSq3GSzj0nWNKxa3WmzaUiYLPw2d4Mk/lvcIENH6PhS7Yx2Zax4EA
         GKxScO7cE9wP32jnnmNc/R3XmeD+GhnlaXdmamNQGUYk7/bD6tTyUIrxC3KV4lr8Pvcj
         0WK7nYtQG8jEx+dPFYP+9j845lK8g0X4MzfcAjmQI4KrqzwQ4ZwHWnc8VT+LwGKwSLvT
         pjPg==
X-Gm-Message-State: ABuFfohNdbgW4Bf7dB0FJEARNdSmAZSYSs6DKxwH9YdsbRB5qKFmrnh/
        tRIoZOvtCveJvWbh9G9l5ONR5WnRmbav3C4zzUmeQg==
X-Google-Smtp-Source: ACcGV60oSk5FJagld0c+Bt5OLedbhdgTdWMGc2Mf46UABi07ksiLuwrLx+XXE5SdNsBKUciqn2miuFV1RaXycpZu2GM=
X-Received: by 2002:a6b:93d6:: with SMTP id v205-v6mr16087356iod.192.1539786041605;
 Wed, 17 Oct 2018 07:20:41 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a02:3d47:0:0:0:0:0 with HTTP; Wed, 17 Oct 2018 07:20:41
 -0700 (PDT)
In-Reply-To: <be684ce5-92fd-e970-b002-83452cf50abd@arm.com>
References: <cover.1538485901.git.andreyknvl@google.com> <be684ce5-92fd-e970-b002-83452cf50abd@arm.com>
From:   Andrey Konovalov <andreyknvl@google.com>
Date:   Wed, 17 Oct 2018 16:20:41 +0200
Message-ID: <CAAeHK+yEZTLjgSj8YUzeJec9Pp2TwuLT5nCa1OpfBLXJkx_hhg@mail.gmail.com>
Subject: Re: [PATCH v7 0/8] arm64: untag user pointers passed to the kernel
To:     Vincenzo Frascino <vincenzo.frascino@arm.com>
Cc:     Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
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
        Chintan Pandya <cpandya@codeaurora.org>,
        Jacob Bramley <Jacob.Bramley@arm.com>,
        Ruben Ayrapetyan <Ruben.Ayrapetyan@arm.com>,
        Lee Smith <Lee.Smith@arm.com>,
        Kostya Serebryany <kcc@google.com>,
        Dmitry Vyukov <dvyukov@google.com>,
        Ramana Radhakrishnan <Ramana.Radhakrishnan@arm.com>,
        Luc Van Oostenryck <luc.vanoostenryck@gmail.com>,
        Evgeniy Stepanov <eugenis@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Oct 17, 2018 at 4:06 PM, Vincenzo Frascino
<vincenzo.frascino@arm.com> wrote:
> Hi Andrey,
> I have been thinking a bit lately on how to address the problem of user t=
agged pointers passed to the kernel through syscalls, and IMHO probably the=
 best way we have to catch them all and make sure that the approach is main=
tainable in the long term is to introduce shims that tag/untag the pointers=
 passed to the kernel.
>
> In details, what I am proposing can live either in userspace (preferred s=
olution so that we do not have to relax the ABI) or in kernel space and can=
 be summarized as follows:
>  - A shim is specific to a syscall and is called by the libc when it need=
s to invoke the respective syscall.
>  - It is required only if the syscall accepts pointers.
>  - It saves the tags of a pointers passed to the syscall in memory (same =
approach if the we are passing a struct that contains pointers to the kerne=
l, with the difference that all the tags of the pointers in the struct need=
 to be saved singularly)
>  - Untags the pointers
>  - Invokes the syscall
>  - Retags the pointers with the tags stored in memory
>  - Returns
>
> What do you think?

Hi Vincenzo,

If I correctly understand what you are proposing, I'm not sure if that
would work with the countless number of different ioctl calls. For
example when an ioctl accepts a struct with a bunch of pointer fields.
In this case a shim like the one you propose can't live in userspace,
since libc doesn't know about the interface of all ioctls, so it can't
know which fields to untag. The kernel knows about those interfaces
(since the kernel implements them), but then we would need a custom
shim for each ioctl variation, which doesn't seem practical.

Thanks!
