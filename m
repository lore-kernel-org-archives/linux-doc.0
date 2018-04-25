Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 77EF47DD32
	for <lwn-linux-doc@archive.lwn.net>; Wed, 25 Apr 2018 14:45:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1754586AbeDYOpk (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 25 Apr 2018 10:45:40 -0400
Received: from mail-io0-f194.google.com ([209.85.223.194]:44390 "EHLO
        mail-io0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753508AbeDYOpj (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 25 Apr 2018 10:45:39 -0400
Received: by mail-io0-f194.google.com with SMTP id d11-v6so19232582iof.11
        for <linux-doc@vger.kernel.org>; Wed, 25 Apr 2018 07:45:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=YlBfK6n7Of0FzQdbj9r2UZ0nRYPmsU2alNg5wsFFVxM=;
        b=BpfeXz3cWKqH0Ir4jT9Op5NWUhoEdQwcxmapmgCMBDOpmywIXq54piBa8CFTGJyxqK
         emxLddiJb/SVpOeNfZVbaAyW1o24mnUMSkt27Dik11e9nbexTLyiwiOfGKZ3Ll0ypL+8
         Q3SIbHf/44KGk+aeOSMXJs3SJRoSaBTyBlJ51E9E7wrxvgAsILDljCnUYm5DtA/vGEzV
         XvuvyXLWjEy5uzfPraWZi3HsvljzBpW5v4WanaxGW1IDs58atlq20WPglQe8LOHYY2H8
         OVfLnmyT0hTTz7MDdxoTSSAH+FXK55SFlDgRQsNzPa9PcV5hVpo/8BjpRXLlo2n7b39h
         YKWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=YlBfK6n7Of0FzQdbj9r2UZ0nRYPmsU2alNg5wsFFVxM=;
        b=B7nnqK+anMyJPSS8DyP8frboEFXnC7EtmvkVQp68nkmmLFR10Q6Pr7jGGT8pr3XxTk
         8XSkPNFX0mg2w1hCyQ0UJv5HZGYZrPKQjUD2FCUYi7q6c8vOHxmzxyuSjCwYY1/2gnDy
         2biTg0PBX8rwjJBrJJ4YK1ST6tVif9U7Q/Obk7KuQCr5cnGySZHs/hIQ/kSMAGmRcPj4
         m33fQ0knWEDiTrs8zehgLZMVv3Py3EViqpy2aRPPY7O3WyIJQChy8458CZu2bbUrDKe9
         DYSAUIR27wMFRcWc48GFoakz4+runQnzwPwycfHzWkWmPARbTvlhR0M+hKHubOyeO91F
         M4/w==
X-Gm-Message-State: ALQs6tBZlB+H/J6pMPjiQA0yGYTMvdZJ/kLDqZiuRI4cV8TSjy97qbFe
        vm93X7KzzWOt45t0jwW7yI7+l0LPC3Vc0BJW3YHM5A==
X-Google-Smtp-Source: AIpwx48QK6d+WZcKCE7kty16J6CKVGzyUtUq0mXFQZ7ZXygiX4i+nJq67hcTnfdyRhPvNQR6sG6za3fbmk3S+YOkgWc=
X-Received: by 2002:a6b:b90b:: with SMTP id j11-v6mr32370038iof.58.1524667537766;
 Wed, 25 Apr 2018 07:45:37 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a02:6658:0:0:0:0:0 with HTTP; Wed, 25 Apr 2018 07:45:37
 -0700 (PDT)
In-Reply-To: <20180419093306.rn5bz264nxsn7d7c@node.shutemov.name>
References: <cover.1524077494.git.andreyknvl@google.com> <20180419093306.rn5bz264nxsn7d7c@node.shutemov.name>
From:   Andrey Konovalov <andreyknvl@google.com>
Date:   Wed, 25 Apr 2018 16:45:37 +0200
Message-ID: <CAAeHK+yb-U3h0666i3u3fF3=8XVcZUo1nxZ5CnOd9oUiDFP=Ng@mail.gmail.com>
Subject: Re: [PATCH 0/6] arm64: untag user pointers passed to the kernel
To:     "Kirill A. Shutemov" <kirill@shutemov.name>
Cc:     Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Mark Rutland <mark.rutland@arm.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Al Viro <viro@zeniv.linux.org.uk>,
        James Morse <james.morse@arm.com>,
        Kees Cook <keescook@chromium.org>,
        Bart Van Assche <bart.vanassche@wdc.com>,
        Kate Stewart <kstewart@linuxfoundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Philippe Ombredanne <pombredanne@nexb.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Ingo Molnar <mingo@kernel.org>,
        "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
        Dan Williams <dan.j.williams@intel.com>,
        "Aneesh Kumar K . V" <aneesh.kumar@linux.vnet.ibm.com>,
        Zi Yan <zi.yan@cs.rutgers.edu>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-doc@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
        Linux Memory Management List <linux-mm@kvack.org>,
        Dmitry Vyukov <dvyukov@google.com>,
        Kostya Serebryany <kcc@google.com>,
        Evgeniy Stepanov <eugenis@google.com>,
        Lee Smith <Lee.Smith@arm.com>,
        Ramana Radhakrishnan <Ramana.Radhakrishnan@arm.com>,
        Jacob Bramley <Jacob.Bramley@arm.com>,
        Ruben Ayrapetyan <Ruben.Ayrapetyan@arm.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Apr 19, 2018 at 11:33 AM, Kirill A. Shutemov
<kirill@shutemov.name> wrote:
> On Wed, Apr 18, 2018 at 08:53:09PM +0200, Andrey Konovalov wrote:
>> Hi!
>>
>> arm64 has a feature called Top Byte Ignore, which allows to embed pointer
>> tags into the top byte of each pointer. Userspace programs (such as
>> HWASan, a memory debugging tool [1]) might use this feature and pass
>> tagged user pointers to the kernel through syscalls or other interfaces.
>>
>> This patch makes a few of the kernel interfaces accept tagged user
>> pointers. The kernel is already able to handle user faults with tagged
>> pointers and has the untagged_addr macro, which this patchset reuses.
>>
>> We're not trying to cover all possible ways the kernel accepts user
>> pointers in one patchset, so this one should be considered as a start.
>
> How many changes do you anticipate?
>
> This patchset looks small and reasonable, but I see a potential to become a
> boilerplate. Would we need to change every driver which implements ioctl()
> to strip these bits?

I've replied to somewhat similar question in one of the previous
versions of the patchset.

"""
There are two different approaches to untagging the user pointers that I see:

1. Untag user pointers right after they are passed to the kernel.

While this might be possible for pointers that are passed to syscalls
as arguments (Catalin's "hack"), this leaves user pointers, that are
embedded into for example structs that are passed to the kernel. Since
there's no specification of the interface between user space and the
kernel, different kernel parts handle user pointers differently and I
don't see an easy way to cover them all.

2. Untag user pointers where they are used in the kernel.

Although there's no specification on the interface between the user
space and the kernel, the kernel still has to use one of a few
specific ways to access user data (copy_from_user, etc.). So the idea
here is to add untagging into them. This patchset mostly takes this
approach (with the exception of memory subsystem syscalls).

If there's a better approach, I'm open to suggestions.
"""

So if we go with the first way, we'll need to go through every syscall
and ioctl handler, which doesn't seem feasible.
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
