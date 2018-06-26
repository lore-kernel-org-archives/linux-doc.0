Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 0CF057D043
	for <lwn-linux-doc@archive.lwn.net>; Tue, 26 Jun 2018 12:47:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S934873AbeFZMry (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 26 Jun 2018 08:47:54 -0400
Received: from mail-it0-f66.google.com ([209.85.214.66]:53775 "EHLO
        mail-it0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S935339AbeFZMrw (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 26 Jun 2018 08:47:52 -0400
Received: by mail-it0-f66.google.com with SMTP id a195-v6so2103123itd.3
        for <linux-doc@vger.kernel.org>; Tue, 26 Jun 2018 05:47:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=PT1XIj0WBeJ5DCWbGQC8il7OaNsRxYvPefALlLLBAlM=;
        b=jewM3dazMVYE15hJMjHLaByrCjeLeTSk2dAjzJgT3BpP6M6oJ9tp9yZW16DMih9DSq
         hABl+fFPZcGrbLRLnOeqxteyFtVTHn84SDfnEN1qArqrxB/h3FdVhlvUFlOEx6zKPyU7
         4KeaYrNg5uKiFveaUrbqch7/Tx7bp1DSVqB2q2NP2RBIk84zzxkgUtl8rf7ZDgN4H666
         Tf+OnRTpqxLsFn+jQxdK9dgjAEYFCDTbXlkvZJV64oytpvZch07LGFYwfJXNLRwHod4b
         LggXzXEw82dVm6XgFhpaW1MSMCLH7NHUXtWpQ8IcCWzp/YKSPI4LeLN0Mjl77lwzMUjC
         FYqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=PT1XIj0WBeJ5DCWbGQC8il7OaNsRxYvPefALlLLBAlM=;
        b=AGnNJhzpeb5M2DCsXroXazVlIhJOrtyQq7pD3pmTssfj5Acsh50vNAoLiefzh/XjOP
         b7ozMgf7YNlCnf3eO/9BLI0ByRa6ZvdsYpj/rP+dUfilM/Q9kbKTp16Oj1QmPbCr1+Lk
         fmtvK2h+BzbgOJWU6Emutcxzp9nk+hiUDaXXU8LIARFU77n8pRbyFaYImfYajXQFosng
         aoWyeLtlN1PO+35EWZ8PmVMHp4X9o9xAD153Cuydryh5lYuRPQKAoeYanv3jjvUD2yrA
         qXbBo8Z9379nB2shZkKDuwvVa3C4/RLid2k/WGztK9P76sTAJK7rGQODvHgl/syZMl5t
         7D5w==
X-Gm-Message-State: APt69E1xNHiVwHX1OBCkWdK3R5vB+iLkTywT7cbBQcHV30LF8HYff6Lf
        MNkR9ohdEXNe9D51WVgh2w1l1rpJuUwP2SUMt7jRcA==
X-Google-Smtp-Source: AAOMgpeFt9MYc+nUWUxqfPYxeX4Gst0QmKHGyId1gCbo5mZlebpGU2DGRL+oHyER7ziGGo/QFk8w6TmoHEgus7D0Nac=
X-Received: by 2002:a24:ca43:: with SMTP id k64-v6mr1396237itg.44.1530017271527;
 Tue, 26 Jun 2018 05:47:51 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a02:9082:0:0:0:0:0 with HTTP; Tue, 26 Jun 2018 05:47:50
 -0700 (PDT)
In-Reply-To: <cover.1529507994.git.andreyknvl@google.com>
References: <cover.1529507994.git.andreyknvl@google.com>
From:   Andrey Konovalov <andreyknvl@google.com>
Date:   Tue, 26 Jun 2018 14:47:50 +0200
Message-ID: <CAAeHK+zqtyGzd_CZ7qKZKU-uZjZ1Pkmod5h8zzbN0xCV26nSfg@mail.gmail.com>
Subject: Re: [PATCH v4 0/7] arm64: untag user pointers passed to the kernel
To:     Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Al Viro <viro@zeniv.linux.org.uk>,
        Andrey Konovalov <andreyknvl@google.com>,
        Kees Cook <keescook@chromium.org>,
        Kate Stewart <kstewart@linuxfoundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Ingo Molnar <mingo@kernel.org>,
        "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
        Shuah Khan <shuah@kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-doc@vger.kernel.org,
        Linux Memory Management List <linux-mm@kvack.org>,
        linux-arch@vger.kernel.org, linux-kselftest@vger.kernel.org,
        LKML <linux-kernel@vger.kernel.org>
Cc:     Dmitry Vyukov <dvyukov@google.com>,
        Kostya Serebryany <kcc@google.com>,
        Evgeniy Stepanov <eugenis@google.com>,
        Lee Smith <Lee.Smith@arm.com>,
        Ramana Radhakrishnan <Ramana.Radhakrishnan@arm.com>,
        Jacob Bramley <Jacob.Bramley@arm.com>,
        Ruben Ayrapetyan <Ruben.Ayrapetyan@arm.com>,
        Chintan Pandya <cpandya@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Jun 20, 2018 at 5:24 PM, Andrey Konovalov <andreyknvl@google.com> wrote:
> arm64 has a feature called Top Byte Ignore, which allows to embed pointer
> tags into the top byte of each pointer. Userspace programs (such as
> HWASan, a memory debugging tool [1]) might use this feature and pass
> tagged user pointers to the kernel through syscalls or other interfaces.
>
> This patch makes a few of the kernel interfaces accept tagged user
> pointers. The kernel is already able to handle user faults with tagged
> pointers and has the untagged_addr macro, which this patchset reuses.
>
> We're not trying to cover all possible ways the kernel accepts user
> pointers in one patchset, so this one should be considered as a start.
>
> Thanks!
>
> [1] http://clang.llvm.org/docs/HardwareAssistedAddressSanitizerDesign.html

Hi!

Is there anything I should do to move forward with this?

I've received zero replies to this patch set (v3 and v4) over the last month.

Thanks!
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
