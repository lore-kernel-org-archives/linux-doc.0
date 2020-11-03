Return-Path: <SRS0=f+/j=EJ=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51CF1C388F9
	for <linux-doc@archiver.kernel.org>; Tue,  3 Nov 2020 22:18:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 16D4B223C7
	for <linux-doc@archiver.kernel.org>; Tue,  3 Nov 2020 22:18:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Syi5K4Qt"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729966AbgKCWR5 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 3 Nov 2020 17:17:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36018 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729085AbgKCWRz (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 3 Nov 2020 17:17:55 -0500
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 724B3C061A04
        for <linux-doc@vger.kernel.org>; Tue,  3 Nov 2020 14:17:55 -0800 (PST)
Received: by mail-lj1-x242.google.com with SMTP id o13so12474667ljj.11
        for <linux-doc@vger.kernel.org>; Tue, 03 Nov 2020 14:17:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YdCtwbqMAyOyGH0CTbWZbzS3jok6JKd1ti4BRTFY2CQ=;
        b=Syi5K4QtbQmsVKQreoJMI67JfTtNeBwyJGgNHs5/l8LirTZcgUymPH9ZkuqsuVoHSi
         njcQFA+9ndjY5DFHyaiesqLCeohkhCicpG1nFs6yGRNWFYI4nQ1M+/Rw/DKpaaN/6EHw
         3IrihZljAgYQ8fefQ9BNL0kAqXdeNfodiarJ9DcqXAKdYjvirhsQCCYuX/6RG3WJ6BfI
         DdB0unYf1/rAkex2nEfEiHVr4WvG6VG/GY6wuiaR0DN0xBHChJbby3VHhAvCHEOIhgtx
         CeS8hL24PxrffNrhqJIWIu04krjnKPFLTcqqau7BBAJXLtHfU16GwFapDDmMlwFe/eYd
         N2XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YdCtwbqMAyOyGH0CTbWZbzS3jok6JKd1ti4BRTFY2CQ=;
        b=bEd2exTXRXVdy8tQABQTgtyfggvXM+NJ0VfIbk0ztHuikTwDR/AY6e2GLYXnVYV8OE
         feVMWi/NNeYUU55WI5xjhkW3VJ5KipWbjtdbqW6PyvCE/54r6AalyYYTIrUDBUSfovit
         fvJSgccH64m3MXDPQKj7xq7w4kE5Iwsmra/jT4mRwGD7zA1/sXI9PnWEL30YK1C0rJpE
         UIUH+cqIx6cfOvSBTAJ4+PA6HPbSgSdb/94wQ4LPiMqmjucgw6k1s6tdYuTXPzhtUi+I
         7bSkd8g7iLkAjYL43yYp4A+YBpWYk/E9AWM1j/ijJfa8rERHPWsTB3UtHigR8D45QrKY
         Bd7Q==
X-Gm-Message-State: AOAM532gm56dJbLXEo0Qhz+uNTMDNXwqJ9b+xEnoXxsjIDusyPHUDB1D
        6dkfH1jIHlh2+HA0dCQ+PZeZzlYNyzcSi+kIZqkFXA==
X-Google-Smtp-Source: ABdhPJwqqJGhaA3LrQ9gKploTm4XfKyPF3dSnpWL5/VLaLkfLNDvHlDSES6Yl3ycBU489bw5LRJA3NvGR8tWbXI9tYE=
X-Received: by 2002:a2e:8816:: with SMTP id x22mr8822321ljh.377.1604441873724;
 Tue, 03 Nov 2020 14:17:53 -0800 (PST)
MIME-Version: 1.0
References: <20201103175841.3495947-1-elver@google.com> <20201103175841.3495947-4-elver@google.com>
In-Reply-To: <20201103175841.3495947-4-elver@google.com>
From:   Jann Horn <jannh@google.com>
Date:   Tue, 3 Nov 2020 23:17:26 +0100
Message-ID: <CAG48ez34gt7_itkCHiz6z__oepD89=sYWu11=3aq8ASV8ph5pQ@mail.gmail.com>
Subject: Re: [PATCH v7 3/9] arm64, kfence: enable KFENCE for ARM64
To:     Marco Elver <elver@google.com>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Alexander Potapenko <glider@google.com>,
        "H . Peter Anvin" <hpa@zytor.com>,
        "Paul E . McKenney" <paulmck@kernel.org>,
        Andrey Konovalov <andreyknvl@google.com>,
        Andrey Ryabinin <aryabinin@virtuozzo.com>,
        Andy Lutomirski <luto@kernel.org>,
        Borislav Petkov <bp@alien8.de>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Christoph Lameter <cl@linux.com>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        David Rientjes <rientjes@google.com>,
        Dmitry Vyukov <dvyukov@google.com>,
        Eric Dumazet <edumazet@google.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Hillf Danton <hdanton@sina.com>,
        Ingo Molnar <mingo@redhat.com>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Joonsoo Kim <iamjoonsoo.kim@lge.com>,
        =?UTF-8?Q?J=C3=B6rn_Engel?= <joern@purestorage.com>,
        Kees Cook <keescook@chromium.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Pekka Enberg <penberg@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        SeongJae Park <sjpark@amazon.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Vlastimil Babka <vbabka@suse.cz>,
        Will Deacon <will@kernel.org>,
        "the arch/x86 maintainers" <x86@kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        kernel list <linux-kernel@vger.kernel.org>,
        kasan-dev <kasan-dev@googlegroups.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux-MM <linux-mm@kvack.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Nov 3, 2020 at 6:59 PM Marco Elver <elver@google.com> wrote:
> Add architecture specific implementation details for KFENCE and enable
> KFENCE for the arm64 architecture. In particular, this implements the
> required interface in <asm/kfence.h>.
>
> KFENCE requires that attributes for pages from its memory pool can
> individually be set. Therefore, force the entire linear map to be mapped
> at page granularity. Doing so may result in extra memory allocated for
> page tables in case rodata=full is not set; however, currently
> CONFIG_RODATA_FULL_DEFAULT_ENABLED=y is the default, and the common case
> is therefore not affected by this change.
>
> Reviewed-by: Dmitry Vyukov <dvyukov@google.com>
> Co-developed-by: Alexander Potapenko <glider@google.com>
> Signed-off-by: Alexander Potapenko <glider@google.com>
> Signed-off-by: Marco Elver <elver@google.com>

Reviewed-by: Jann Horn <jannh@google.com>
