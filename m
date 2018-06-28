Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 07EA47D062
	for <lwn-linux-doc@archive.lwn.net>; Thu, 28 Jun 2018 00:04:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751331AbeF1AEo (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 27 Jun 2018 20:04:44 -0400
Received: from mail-wm0-f65.google.com ([74.125.82.65]:52754 "EHLO
        mail-wm0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751155AbeF1AEm (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 27 Jun 2018 20:04:42 -0400
Received: by mail-wm0-f65.google.com with SMTP id e69-v6so4678150wme.2
        for <linux-doc@vger.kernel.org>; Wed, 27 Jun 2018 17:04:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=FRk1lMaiyEGoBtYTxhWnfRdlEb9O4EZ4T89a5HdwD5w=;
        b=jARUh2h0Qt1uWgCifk7mQNGwJQSIw+Pk7yNIQyKk7LGktQlxo9rpOmdGdZoKBTmPQm
         i6kbCq2cAE+DmdJC/eV4B/2GpzlObJE6juS6Hyq6tobuFxoogTNUzpdfxw5dqGnxM0F9
         hlpfL8ziJJmj5zZPtDK9lk7on9swlpkAkajm9pmGykOFRZVhIThxoB5SUM3/MsboeF1E
         pbFPIK1xVwiDZFfQd5eInIxd9IZrVIQH9G7dnwkXu/JitLu29bUUjIBfrob7EU4ocrsr
         38cM8l0o8dI8d2RId6GTtNSppvio8Fm13juTy/cPW8n7+w3fvi7cq4Sx22S/rth28py2
         nZUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FRk1lMaiyEGoBtYTxhWnfRdlEb9O4EZ4T89a5HdwD5w=;
        b=ob8yUqzPRMysumTh9BHF/7+mi3qK7F8aKtyRVRV730cN3vwxhb1heOz85lHwp5GjTo
         XpGEEybLNZpNqylpzZLCmJAsmY1NHdZZ3fJRif3zdxkB3LixtMbJo+bApVF9IlQLcq2F
         AARsIqmghX7QUmy6bpGzt/omfWfenAbGUCTQt3x5h25tihv4QYKQG1TEMAmHKPKquJVL
         rjSHlOm0WWm3me/Mq0aG+IImB7cK9HpM+KSnqCAW+uD18+IvSOCBgchNn6FgVhWtNqdo
         kdLzJaam/ZNhd7yfbGJ+sv/C49cRMrNmaSCyU00qvuPZItJObTcyBIxUxc/2qnXdhc6B
         F6Gw==
X-Gm-Message-State: APt69E0H9nnEp68aJI3OfXctpa/VHGv5aTiGd7S760Jii2JuUzUmEzuz
        xdcAkj2B4RCanKzZ40LUZ5M8zvE0GoAWdF0s5xqB7g==
X-Google-Smtp-Source: AAOMgpcjP7P1nPlAktqfyC6vHVRIqPDDS9l7wY8oiZP/cVGq9ircjVh4E+YOtQxd8d/TqrQ13RbXP2NRBa4q/pL/wdk=
X-Received: by 2002:a1c:f902:: with SMTP id x2-v6mr6140950wmh.116.1530144281284;
 Wed, 27 Jun 2018 17:04:41 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1530018818.git.andreyknvl@google.com> <20180627160800.3dc7f9ee41c0badbf7342520@linux-foundation.org>
In-Reply-To: <20180627160800.3dc7f9ee41c0badbf7342520@linux-foundation.org>
From:   Kostya Serebryany <kcc@google.com>
Date:   Wed, 27 Jun 2018 17:04:28 -0700
Message-ID: <CAN=P9pivApAo76Kjc0TUDE0kvJn0pET=47xU6e=ioZV2VqO0Rg@mail.gmail.com>
Subject: Re: [PATCH v4 00/17] khwasan: kernel hardware assisted address sanitizer
To:     Andrew Morton <akpm@linux-foundation.org>
Cc:     Andrey Konovalov <andreyknvl@google.com>, aryabinin@virtuozzo.com,
        Alexander Potapenko <glider@google.com>,
        Dmitry Vyukov <dvyukov@google.com>,
        Catalin Marinas <catalin.marinas@arm.com>, will.deacon@arm.com,
        cl@linux.com, mark.rutland@arm.com,
        Nick Desaulniers <ndesaulniers@google.com>,
        marc.zyngier@arm.com, dave.martin@arm.com,
        ard.biesheuvel@linaro.org, ebiederm@xmission.com, mingo@kernel.org,
        Paul Lawrence <paullawrence@google.com>, geert@linux-m68k.org,
        arnd@arndb.de, kirill.shutemov@linux.intel.com,
        Greg KH <gregkh@linuxfoundation.org>,
        Kate Stewart <kstewart@linuxfoundation.org>,
        rppt@linux.vnet.ibm.com, kasan-dev <kasan-dev@googlegroups.com>,
        linux-doc@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-sparse@vger.kernel.org,
        linux-mm@kvack.org, linux-kbuild@vger.kernel.org,
        Evgeniy Stepanov <eugenis@google.com>,
        Lee Smith <Lee.Smith@arm.com>,
        Ramana Radhakrishnan <Ramana.Radhakrishnan@arm.com>,
        Jacob Bramley <Jacob.Bramley@arm.com>,
        Ruben Ayrapetyan <Ruben.Ayrapetyan@arm.com>,
        Jann Horn <jannh@google.com>,
        Mark Brand <markbrand@google.com>, cpandya@codeaurora.org,
        Vishwath Mohan <vishwath@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Jun 27, 2018 at 4:08 PM Andrew Morton <akpm@linux-foundation.org> wrote:
>
> On Tue, 26 Jun 2018 15:15:10 +0200 Andrey Konovalov <andreyknvl@google.com> wrote:
>
> > This patchset adds a new mode to KASAN [1], which is called KHWASAN
> > (Kernel HardWare assisted Address SANitizer).
> >
> > The plan is to implement HWASan [2] for the kernel with the incentive,
> > that it's going to have comparable to KASAN performance, but in the same
> > time consume much less memory, trading that off for somewhat imprecise
> > bug detection and being supported only for arm64.
>
> Why do we consider this to be a worthwhile change?
>
> Is KASAN's memory consumption actually a significant problem?  Some
> data regarding that would be very useful.

On mobile, ASAN's and KASAN's memory usage is a significant problem.
Not sure if I can find scientific evidence of that.
CC-ing Vishwath Mohan who deals with KASAN on Android to provide
anecdotal evidence.

There are several other benefits too:
* HWASAN more reliably detects non-linear-buffer-overflows compared to
ASAN (same for kernel-HWASAN vs kernel-ASAN)
* Same for detecting use-after-free (since HWASAN doesn't rely on quarantine).
* Much easier to implement stack-use-after-return detection (which
IIRC KASAN doesn't have yet, because in KASAN it's too hard)

> If it is a large problem then we still have that problem on x86, so the
> problem remains largely unsolved?

The problem is more significant on mobile devices than on desktop/server.
I'd love to have [K]HWASAN on x86_64 as well, but it's less trivial since x86_64
doesn't have an analog of aarch64's top-byte-ignore hardware feature.


>
> > ====== Benchmarks
> >
> > The following numbers were collected on Odroid C2 board. Both KASAN and
> > KHWASAN were used in inline instrumentation mode.
> >
> > Boot time [1]:
> > * ~1.7 sec for clean kernel
> > * ~5.0 sec for KASAN
> > * ~5.0 sec for KHWASAN
> >
> > Slab memory usage after boot [2]:
> > * ~40 kb for clean kernel
> > * ~105 kb + 1/8th shadow ~= 118 kb for KASAN
> > * ~47 kb + 1/16th shadow ~= 50 kb for KHWASAN
> >
> > Network performance [3]:
> > * 8.33 Gbits/sec for clean kernel
> > * 3.17 Gbits/sec for KASAN
> > * 2.85 Gbits/sec for KHWASAN
> >
> > Note, that KHWASAN (compared to KASAN) doesn't require quarantine.
> >
> > [1] Time before the ext4 driver is initialized.
> > [2] Measured as `cat /proc/meminfo | grep Slab`.
> > [3] Measured as `iperf -s & iperf -c 127.0.0.1 -t 30`.
>
> The above doesn't actually demonstrate the whole point of the
> patchset: to reduce KASAN's very high memory consumption?
>
> --
> You received this message because you are subscribed to the Google Groups "kasan-dev" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to kasan-dev+unsubscribe@googlegroups.com.
> To post to this group, send email to kasan-dev@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgid/kasan-dev/20180627160800.3dc7f9ee41c0badbf7342520%40linux-foundation.org.
> For more options, visit https://groups.google.com/d/optout.
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
