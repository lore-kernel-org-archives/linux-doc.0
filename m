Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,USER_IN_DEF_DKIM_WL autolearn=ham
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id C1EEE7D08A
	for <lwn-linux-doc@archive.lwn.net>; Tue, 26 Feb 2019 14:39:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727180AbfBZOjU (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 26 Feb 2019 09:39:20 -0500
Received: from mail-pg1-f196.google.com ([209.85.215.196]:40514 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726810AbfBZOjU (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 26 Feb 2019 09:39:20 -0500
Received: by mail-pg1-f196.google.com with SMTP id u9so6308994pgo.7
        for <linux-doc@vger.kernel.org>; Tue, 26 Feb 2019 06:39:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dfiBLpo8ppzHN31Df3pK9Pue7IUmmemEwHEq/+qIHW8=;
        b=qrniw8KQBsnVcBdkLwXYTHP1tzALWjLL3wqY47zLDB86u7VpyXqsBCFNMPUvx2rcQ5
         tleEIn43VcQEIxdaz5Lq3qoXKxfo59ovHYPtXDa7JwcKInE8AMfYDGNxNizwMWMWQjde
         EhSO6jW2VXILtMDY8JQSd+bipZZVCQ+CR0EOZ2zJgqQHGK2gbFfefcVUCOF/9F/FdN4j
         khe0Gzu8tDmq3gffWUNVCHAG7gYifd/AMvfrRv8bNWrE6v7GDGV6bjcxEvsAriDj0zwX
         9ukzSjG/hOjO6EfG3Aixqm8fiGMNQyIAiftpSDpkdyIWPy343s9BUOUiQ9YAblVGHraC
         nJQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dfiBLpo8ppzHN31Df3pK9Pue7IUmmemEwHEq/+qIHW8=;
        b=KCFOjHeuHHfgN4S7i/Ili/3MjsT8UYbTSiQa6F9unOJUT7FGxXtna/oxqkVwLk21IU
         dyporQZVJphVSw0d4N5uxg4jfZvtY2HCyeR+Uud5YGoTYjhuIx7Vt378ofcBBXrOySx9
         8ndDlgXMNU0WKAZnvUrABWE0eqek03VOnfxuUtRO0A0dhBTuQb7npgEP+GfayXNqT1lz
         GxHHeyVvx8xwQ0Eehyadcf5gHd9WJFhf3nAeZuaf6dXJLZEIJRe6mjcuv55lpYCUhNt5
         fIf6MnC1SK7weJXW5OqufykeDnEwZMAdu/KJVl82KqDQWVljcbXkD1ABzz5tSKaUhjKy
         qk3w==
X-Gm-Message-State: AHQUAuaY4Ni8mlJYjn+K+GCdzq8BqQu/ksjwU5B9TpR1mi5OUvDL2zwj
        +IvrGRq48B8Mk56ENoODp61MjTqg5j3ZAsVlyS1laA==
X-Google-Smtp-Source: AHgI3IbzQ3IeJ3DdtureLg8xHbfzWl4k26RcwSMIdPdFZQbQ2oXfH0JWdLJfU9vlDhlDrZoE5TP5lbkNIdumuA65DBY=
X-Received: by 2002:a65:6651:: with SMTP id z17mr23465185pgv.95.1551191958932;
 Tue, 26 Feb 2019 06:39:18 -0800 (PST)
MIME-Version: 1.0
References: <cover.1550839937.git.andreyknvl@google.com> <8343cd77ca301df15839796f3b446b75ce5ffbbf.1550839937.git.andreyknvl@google.com>
 <73f2f3fe-9a66-22a1-5aae-c282779a75f5@intel.com>
In-Reply-To: <73f2f3fe-9a66-22a1-5aae-c282779a75f5@intel.com>
From:   Andrey Konovalov <andreyknvl@google.com>
Date:   Tue, 26 Feb 2019 15:39:08 +0100
Message-ID: <CAAeHK+yQU8khtOoyDKqmHterCa16P7oWe9AMiPnrxE+Gyb_7aw@mail.gmail.com>
Subject: Re: [PATCH v10 07/12] fs, arm64: untag user pointers in fs/userfaultfd.c
To:     Dave Hansen <dave.hansen@intel.com>
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
        Vincenzo Frascino <vincenzo.frascino@arm.com>,
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
        Dave Martin <Dave.Martin@arm.com>,
        Kevin Brodsky <kevin.brodsky@arm.com>,
        Szabolcs Nagy <Szabolcs.Nagy@arm.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sat, Feb 23, 2019 at 12:06 AM Dave Hansen <dave.hansen@intel.com> wrote:
>
> On 2/22/19 4:53 AM, Andrey Konovalov wrote:
> > userfaultfd_register() and userfaultfd_unregister() use provided user
> > pointers for vma lookups, which can only by done with untagged pointers.
>
> So, we have to patch all these sites before the tagged values get to the
> point of hitting the vma lookup functions.  Dumb question: Why don't we
> just patch the vma lookup functions themselves instead of all of these
> callers?

That might be a working approach as well. We'll still need to fix up
places where the vma fields are accessed directly. Catalin, what do
you think?
