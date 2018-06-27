Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id A9A1C7D062
	for <lwn-linux-doc@archive.lwn.net>; Wed, 27 Jun 2018 15:06:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S965492AbeF0PF7 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 27 Jun 2018 11:05:59 -0400
Received: from mail-io0-f194.google.com ([209.85.223.194]:38534 "EHLO
        mail-io0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S964839AbeF0PF6 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 27 Jun 2018 11:05:58 -0400
Received: by mail-io0-f194.google.com with SMTP id l19-v6so2211933ioj.5
        for <linux-doc@vger.kernel.org>; Wed, 27 Jun 2018 08:05:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=TePJl1h2RCmQRgrewmfbWlz5NvEyMQff5xprdx8Rzxc=;
        b=f4rtUxPUdJTLqH2GN3ZocuEELaGtPnagDEqgWZzZYD7fGEMTtpV3JCjEkiNXT8Sp1u
         11BRrVbkZqFSb9Rt8LJ7AgBUYHSEpUa/RsmzGZd6BqqmA03Li0dkTxjj4TSM/RGhxbF7
         guvsQfT3+cYUTrveCPgSfHA+SlZR8LjmWwXbFBFyvdDxa1k1ZS6O/0JdJH/SpBNqj7q6
         FbMW4SqazCWUkOVDbSSecPbZ9hhBHRrYqrFOoerynwB8s0yw9di0Gf2XCTTTa/aScRt4
         Kidkn+MZvyuJ2W6VNcBTmN7CXe03doy5Je/dy4jB6Fg0w/GFAq2oDVr5L1gQ1ocTXXl0
         9F1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=TePJl1h2RCmQRgrewmfbWlz5NvEyMQff5xprdx8Rzxc=;
        b=ASnWnEpzkrQt9CSlGZUGw3T/OkuZOMfbnCzktvZvih+d/vwDtl/wkanV7LDTeu4fi1
         KHuS7GDsPJTFV1il92dBxsbLOIpigV02B/K4p8mdqDF025rFh7NvPTTkjW37VLMJnpCW
         MCiY1p5Bxs8A7h5ZbhhjniCktkN44e91/C0T6DpawQjImZ8BBvc9ASC2sp2bO3dEJ0AO
         NZ3zAHJBHlXtBePM83MaGCVo1cTQNGC5a4fQIMnI5CRbpyrRkLTS8jjchdGSUjYBPBmk
         bdCVoAck7pD/id9MooT9fy8Sz+pdJv1CvHiWFTm4gDhqNT0Bw8sT1SPRYJnV3kW8hXT8
         5yaQ==
X-Gm-Message-State: APt69E3POYpu1avhWjZUq605q12ebp3fEECFj1VKrEOXheZBuAt03ov6
        WqOUd1AAe2uOcU5jCsnuI1y1cIST0JwARqvAwRJH+A==
X-Google-Smtp-Source: AAOMgpe57m9g/EDqEu7Zvf3nws/5yi6cIZiZ8waZ3JnXOdU/6oKdQOh/DFAcHPxhmBfyFY/ZE52M+ax/NDR6w0et1Sc=
X-Received: by 2002:a6b:8495:: with SMTP id o21-v6mr5159519ioi.119.1530111957761;
 Wed, 27 Jun 2018 08:05:57 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a02:9082:0:0:0:0:0 with HTTP; Wed, 27 Jun 2018 08:05:57
 -0700 (PDT)
In-Reply-To: <20180626172900.ufclp2pfrhwkxjco@armageddon.cambridge.arm.com>
References: <cover.1529507994.git.andreyknvl@google.com> <CAAeHK+zqtyGzd_CZ7qKZKU-uZjZ1Pkmod5h8zzbN0xCV26nSfg@mail.gmail.com>
 <20180626172900.ufclp2pfrhwkxjco@armageddon.cambridge.arm.com>
From:   Andrey Konovalov <andreyknvl@google.com>
Date:   Wed, 27 Jun 2018 17:05:57 +0200
Message-ID: <CAAeHK+yqWKTdTG+ymZ2-5XKiDANV+fmUjnQkRy-5tpgphuLJRA@mail.gmail.com>
Subject: Re: [PATCH v4 0/7] arm64: untag user pointers passed to the kernel
To:     Catalin Marinas <catalin.marinas@arm.com>
Cc:     Will Deacon <will.deacon@arm.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Al Viro <viro@zeniv.linux.org.uk>,
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
        LKML <linux-kernel@vger.kernel.org>,
        Chintan Pandya <cpandya@codeaurora.org>,
        Jacob Bramley <Jacob.Bramley@arm.com>,
        Ruben Ayrapetyan <Ruben.Ayrapetyan@arm.com>,
        Lee Smith <Lee.Smith@arm.com>,
        Kostya Serebryany <kcc@google.com>,
        Dmitry Vyukov <dvyukov@google.com>,
        Ramana Radhakrishnan <Ramana.Radhakrishnan@arm.com>,
        Evgeniy Stepanov <eugenis@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Jun 26, 2018 at 7:29 PM, Catalin Marinas
<catalin.marinas@arm.com> wrote:
> Hi Andrey,
>
> On Tue, Jun 26, 2018 at 02:47:50PM +0200, Andrey Konovalov wrote:
>> On Wed, Jun 20, 2018 at 5:24 PM, Andrey Konovalov <andreyknvl@google.com> wrote:
>> > arm64 has a feature called Top Byte Ignore, which allows to embed pointer
>> > tags into the top byte of each pointer. Userspace programs (such as
>> > HWASan, a memory debugging tool [1]) might use this feature and pass
>> > tagged user pointers to the kernel through syscalls or other interfaces.
>> >
>> > This patch makes a few of the kernel interfaces accept tagged user
>> > pointers. The kernel is already able to handle user faults with tagged
>> > pointers and has the untagged_addr macro, which this patchset reuses.
>> >
>> > We're not trying to cover all possible ways the kernel accepts user
>> > pointers in one patchset, so this one should be considered as a start.
>> >
>> > Thanks!
>> >
>> > [1] http://clang.llvm.org/docs/HardwareAssistedAddressSanitizerDesign.html
>>
>> Is there anything I should do to move forward with this?
>>
>> I've received zero replies to this patch set (v3 and v4) over the last
>> month.
>
> The patches in this series look fine but my concern is that they are not
> sufficient and we don't have (yet?) a way to identify where such
> annotations are required. You even say in patch 6 that this is "some
> initial work for supporting non-zero address tags passed to the kernel".
> Unfortunately, merging (or relaxing) an ABI without a clear picture is
> not really feasible.
>
> While I support this work, as a maintainer I'd like to understand
> whether we'd be in a continuous chase of ABI breaks with every kernel
> release or we have a better way to identify potential issues. Is there
> any way to statically analyse conversions from __user ptr to long for
> example? Or, could we get the compiler to do this for us?


OK, got it, I'll try to figure out a way to find these conversions.

Thanks!
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
