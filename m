Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE autolearn=ham
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 1D2BA7D90D
	for <lwn-linux-doc@archive.lwn.net>; Tue,  9 Jul 2019 00:09:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726560AbfGIAJQ (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 8 Jul 2019 20:09:16 -0400
Received: from mail-ed1-f66.google.com ([209.85.208.66]:33960 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726238AbfGIAJQ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 8 Jul 2019 20:09:16 -0400
Received: by mail-ed1-f66.google.com with SMTP id s49so16106327edb.1
        for <linux-doc@vger.kernel.org>; Mon, 08 Jul 2019 17:09:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=98rToMWmhy/jqHktBRjZkc7KbW9VRwSYkaJRbC3br4I=;
        b=i3oe6W0BGcSkTepcfGEJAhzFh8lQOwvniDzY3lf8xxhn8MfBi54r7Fl2n2nGdZvlrv
         7qtP66giWRCRfgSjdETIbISxBkBjHk349VzwNpp/XUSzNBj2A4jXAiMANZzOUckZ3zsy
         GZCrXZ4v9OgdNrrN316v6BDBm1BJmbH4r/ZIXLqHFYfLRWALRxuNxJYNFhA9oLquz8Sq
         NBAeaau88Q7EXNC0lm/sm5RyVSXsNXKR6Zxnb9akp6QytAnKknq+Tmi5c0hVCRIb8prp
         RPVziOWqDM+agE/TcfMw0rzPWiH28hw1sqnvRf/EiFr1TJQ3LYqFuANfxTtWwFTIEXSQ
         QoYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=98rToMWmhy/jqHktBRjZkc7KbW9VRwSYkaJRbC3br4I=;
        b=oLMtpdYVIuSTdBVhOwe4QCdvwyQM+oUNxkxHd0RPOHQ9RzxkTQx0CRZhTNxq3Ms5gF
         qAoAWuMogCG8EPWv/U2P+YIXwBt2n83Osr+jZR8zDupmQt4nKYczfOyZVddrvUIGE5VQ
         j9Sk39+GXzHkwS3mXeFH+cc5Gsl8GQw+KQOX8b2UyexREi14zT/XDwKxGUaM8bKVvV5O
         jRmiABXWkfqQYCR0w3k7kgbenbcTR7K5d9d7graVz0VQ0H07K6zlyKzGUA0dJ3Wo0hUn
         mbD1ZWvcebdDtujyHuB93gR3MPDY4itIaaF/eDGtzcPJIUqeElD0x/Cgk/DXI9fFF+1H
         Zp2g==
X-Gm-Message-State: APjAAAVjQ03xX1Y2SmR8bUHmuNbJU3UT5rD/oHmqvXgNVLXW5/NRDgbb
        2RAUbUgQnWjvDJfeIDP8w8mh48rMf9oeRWSrImkn9A==
X-Google-Smtp-Source: APXvYqwU07Zh/QKPE/nEPDgFLpdMlrr6cwb9a/ibICEkDuXQ69QLQF/9cX8my8Dhn7VceVLo/ycOsWAviGk5vIhAkmk=
X-Received: by 2002:a17:906:7c8d:: with SMTP id w13mr18501893ejo.264.1562630955016;
 Mon, 08 Jul 2019 17:09:15 -0700 (PDT)
MIME-Version: 1.0
References: <20190708211528.12392-1-pasha.tatashin@soleen.com> <87sgrgjd6i.fsf@xmission.com>
In-Reply-To: <87sgrgjd6i.fsf@xmission.com>
From:   Pavel Tatashin <pasha.tatashin@soleen.com>
Date:   Mon, 8 Jul 2019 20:09:04 -0400
Message-ID: <CA+CK2bAOPkN=qEdE38R0FRnrzRK0EqLid7eUVnTj1acmaFHY_w@mail.gmail.com>
Subject: Re: [v1 0/5] allow to reserve memory for normal kexec kernel
To:     "Eric W. Biederman" <ebiederm@xmission.com>
Cc:     James Morris <jmorris@namei.org>, Sasha Levin <sashal@kernel.org>,
        kexec@lists.infradead.org, LKML <linux-kernel@vger.kernel.org>,
        corbet@lwn.net, Catalin Marinas <catalin.marinas@arm.com>,
        will@kernel.org, linux-doc@vger.kernel.org,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

> Something is very very wrong there.
>
> Last I measured memory bandwidth seriously I could touch a Gigabyte per
> second easily, and that was nearly 20 years ago.  Did you manage to
> disable caching or have some particularly slow code that does the
> reolocations.
>
> There is a serious cost to reserving memory in that it is simply not
> available at other times.  For kexec on panic there is no other reliable
> way to get memory that won't be DMA'd to.

Hi Eric,

Thank you for your comments.

Indeed, but sometimes fast reboot is more important than the cost of
reserving 32M-64M of memory.

>
> We have options in this case and I would strongly encourage you to track
> down why that copy in relocation is so very slow.  I suspect a 4KiB page
> size is large enough that it can swamp pointer following costs.
>
> My back of the napkin math says even 20 years ago your copying costs
> should be only 0.037s.  The only machine I have ever tested on where
> the copy costs were noticable was my old 386.
>
> Maybe I am out to lunch here but a claim that your memory only runs
> at 100MiB/s (the speed of my spinning rust hard drive) is rather
> incredible.

I agree,  my measurement on this machine was 2,857MB/s. Perhaps when
MMU is disabled ARM64 also has caching disabled? The function that
loops through array of pages and relocates them to final destination
is this:

https://soleen.com/source/xref/linux/arch/arm64/kernel/relocate_kernel.S?r=d2912cb1#29

A comment before calling it:

205   /*
206   * cpu_soft_restart will shutdown the MMU, disable data caches, then
207   * transfer control to the reboot_code_buffer which contains a copy of
208   * the arm64_relocate_new_kernel routine.  arm64_relocate_new_kernel
209   * uses physical addressing to relocate the new image to its final
210   * position and transfers control to the image entry point when the
211   * relocation is complete.
212   * In kexec case, kimage->start points to purgatory assuming that
213   * kernel entry and dtb address are embedded in purgatory by
214   * userspace (kexec-tools).
215   * In kexec_file case, the kernel starts directly without purgatory.
216   */
https://soleen.com/source/xref/linux/arch/arm64/kernel/machine_kexec.c?r=d2912cb1#206

So, as I understand at least data caches are disabled, and MMU is
disabled, perhaps this is why this function is so incredibly slow?

Perhaps, there is a better way to fix this problem by keeping caches
enabled while still relocating? Any suggestions from Aarch64
developers?

Pasha
