Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id E70B17D043
	for <lwn-linux-doc@archive.lwn.net>; Fri, 29 Jun 2018 12:45:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S934629AbeF2MpM (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 29 Jun 2018 08:45:12 -0400
Received: from mail-it0-f66.google.com ([209.85.214.66]:52714 "EHLO
        mail-it0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S934333AbeF2MpJ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 29 Jun 2018 08:45:09 -0400
Received: by mail-it0-f66.google.com with SMTP id p4-v6so2652163itf.2
        for <linux-doc@vger.kernel.org>; Fri, 29 Jun 2018 05:45:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=2L8jTjtLtHQSNVQv6Mns8k+CBKnTFLV5Zm0q+pEDcJk=;
        b=u4z8/lxktq9wCjgY3H5dn8NA5BV9caRBfKx96G+knkGLKML/D6nh1cnq52drQyWZYH
         C325JKvy9dWa8SeRBMbf4+ADxVGFScValCpcgK/6b8A2iCny3UmtJvtRMBrfJHlAcHa3
         6RNbBroGd5xeQ0kY00MxTCdFoIfe9mpUMt/XWU/VRXcBKKP0GRwpHizlCNTytOKWra7A
         7NvTIHbVsUwu2+PHNtdRRGZRzqhq6Nu5y/V28skWFsyj+iRLdbdvi62ExkhkivPEq2H+
         /B31R5BfKz6yjQikgHLuN2DZwRkGF+SDcU+Uk7zB6FaisCgmTrTwiTBx+RdXzhtkhEr5
         5zjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=2L8jTjtLtHQSNVQv6Mns8k+CBKnTFLV5Zm0q+pEDcJk=;
        b=koyBdaGkID7yV1Pm4LQW/emhvnW3cQgkEV9fpJyBsQanbgep2zyZb3pgJZrMJil7vv
         hmo3uRKC6k846dIh6de0s5S+nGjqXc0LaKh/RsJVs6xwAlYj6coL6u95m/P6gbsI0daP
         mut/Zr2cw7pyPnXdoo3INluM92Ot6z49/0AmPqWGFsZxbtWErSdqksRXceDVN01AaVpJ
         +tOdkpZfgzFCdtr+XRNjdZ9b6u79n5JWZQwQp9Vpa06lBISPjwjc6Y9Tz/lR0gowpWO5
         ZUCFwKn0d80YMu1yEjuWHZjR9rvk/Fgbkrg9QDcU3Pzt6OvDdvlQcjt8cUzDmWnHDnlJ
         98pw==
X-Gm-Message-State: APt69E0ztAsOO9tEvFrDH1yJo/+RpsSLL0K8RIx4Q0usFVsrn69OE/yV
        r/2r6kD0AV2cQNFGPfPCsHDg+GF6wgGRZ3PfYMqJ5A==
X-Google-Smtp-Source: AAOMgpdSqolcKFiPUTmlejS51ZJyIk55fxWjRD03g3sQz8F4Rs5UQKM8Ulb1RbnjVcKdy7dz9UBECMoMjtMIbH2V8yA=
X-Received: by 2002:a24:b046:: with SMTP id b6-v6mr1725612itj.48.1530276308783;
 Fri, 29 Jun 2018 05:45:08 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a02:9082:0:0:0:0:0 with HTTP; Fri, 29 Jun 2018 05:45:08
 -0700 (PDT)
In-Reply-To: <20180628124039.8a42ab5e2994fb2876ff4f75@linux-foundation.org>
References: <cover.1530018818.git.andreyknvl@google.com> <20180627160800.3dc7f9ee41c0badbf7342520@linux-foundation.org>
 <CAAeHK+xz552VNpZxgWwU-hbTqF5_F6YVDw3fSv=4OT8mNrqPzg@mail.gmail.com> <20180628124039.8a42ab5e2994fb2876ff4f75@linux-foundation.org>
From:   Andrey Konovalov <andreyknvl@google.com>
Date:   Fri, 29 Jun 2018 14:45:08 +0200
Message-ID: <CAAeHK+xsBOKghUp9XhpfXGqU=gjSYuy3G2GH14zWNEmaLPy8_w@mail.gmail.com>
Subject: Re: [PATCH v4 00/17] khwasan: kernel hardware assisted address sanitizer
To:     Andrew Morton <akpm@linux-foundation.org>
Cc:     Andrey Ryabinin <aryabinin@virtuozzo.com>,
        Alexander Potapenko <glider@google.com>,
        Dmitry Vyukov <dvyukov@google.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        Christoph Lameter <cl@linux.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Marc Zyngier <marc.zyngier@arm.com>,
        Dave Martin <dave.martin@arm.com>,
        Ard Biesheuvel <ard.biesheuvel@linaro.org>,
        "Eric W . Biederman" <ebiederm@xmission.com>,
        Ingo Molnar <mingo@kernel.org>,
        Paul Lawrence <paullawrence@google.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Arnd Bergmann <arnd@arndb.de>,
        "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kate Stewart <kstewart@linuxfoundation.org>,
        Mike Rapoport <rppt@linux.vnet.ibm.com>,
        kasan-dev <kasan-dev@googlegroups.com>,
        linux-doc@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-sparse@vger.kernel.org,
        Linux Memory Management List <linux-mm@kvack.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Kostya Serebryany <kcc@google.com>,
        Evgeniy Stepanov <eugenis@google.com>,
        Lee Smith <Lee.Smith@arm.com>,
        Ramana Radhakrishnan <Ramana.Radhakrishnan@arm.com>,
        Jacob Bramley <Jacob.Bramley@arm.com>,
        Ruben Ayrapetyan <Ruben.Ayrapetyan@arm.com>,
        Jann Horn <jannh@google.com>,
        Mark Brand <markbrand@google.com>,
        Chintan Pandya <cpandya@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Jun 28, 2018 at 9:40 PM, Andrew Morton
<akpm@linux-foundation.org> wrote:
> On Thu, 28 Jun 2018 20:29:07 +0200 Andrey Konovalov <andreyknvl@google.com> wrote:
>
>> >> Slab memory usage after boot [2]:
>> >> * ~40 kb for clean kernel
>> >> * ~105 kb + 1/8th shadow ~= 118 kb for KASAN
>> >> * ~47 kb + 1/16th shadow ~= 50 kb for KHWASAN
>> >>
>> >> Network performance [3]:
>> >> * 8.33 Gbits/sec for clean kernel
>> >> * 3.17 Gbits/sec for KASAN
>> >> * 2.85 Gbits/sec for KHWASAN
>> >>
>> >> Note, that KHWASAN (compared to KASAN) doesn't require quarantine.
>> >>
>> >> [1] Time before the ext4 driver is initialized.
>> >> [2] Measured as `cat /proc/meminfo | grep Slab`.
>> >> [3] Measured as `iperf -s & iperf -c 127.0.0.1 -t 30`.
>> >
>> > The above doesn't actually demonstrate the whole point of the
>> > patchset: to reduce KASAN's very high memory consumption?
>>
>> You mean that memory usage numbers collected after boot don't give a
>> representative picture of actual memory consumption on real workloads?
>>
>> What kind of memory consumption testing would you like to see?
>
> Well, 100kb or so is a teeny amount on virtually any machine.  I'm
> assuming the savings are (much) more significant once the machine gets
> loaded up and doing work?

So with clean kernel after boot we get 40 kb memory usage. With KASAN
it is ~120 kb, which is 200% overhead. With KHWASAN it's 50 kb, which
is 25% overhead. This should approximately scale to any amounts of
used slab memory. For example with 100 mb memory usage we would get
+200 mb for KASAN and +25 mb with KHWASAN. (And KASAN also requires
quarantine for better use-after-free detection). I can explicitly
mention the overhead in %s in the changelog.

If you think it makes sense, I can also make separate measurements
with some workload. What kind of workload should I use?
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
