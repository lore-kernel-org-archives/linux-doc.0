Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id A6ED17D062
	for <lwn-linux-doc@archive.lwn.net>; Thu, 28 Jun 2018 18:29:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S967884AbeF1S3L (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 28 Jun 2018 14:29:11 -0400
Received: from mail-it0-f68.google.com ([209.85.214.68]:35875 "EHLO
        mail-it0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S967810AbeF1S3J (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 28 Jun 2018 14:29:09 -0400
Received: by mail-it0-f68.google.com with SMTP id j135-v6so13971669itj.1
        for <linux-doc@vger.kernel.org>; Thu, 28 Jun 2018 11:29:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=TQhutihisTXpuVK+GeZtz9M18UfcHNomSTyGrQh5D3k=;
        b=JSZ1csOr3Sm14ZQDqMhEU2FZtPA0izBLiOxP7kTlJIKJBlUSOqsi4bUtHeSOnY7Lej
         K09YeARZuPuy6SF5GiBwk6X1toDdp3b3YB2rixnh8+86UceBRZ5kgzoHDFsITEvgvGd/
         uahw5P2T69SZ5kfCbr12maADD5tCS/ZEAR8GHZFfuQKA6qgRDyuQiWxpUUJnSBj5agOe
         zLqTgtTOMjFEi2MuyJE208a+0Jkk+YUxpOaZFyEB17FoYJjbcEjBviVkQBO0WcTnFBbz
         GD9E+NkwvHmcxRLNTnVB5RbHpaDmR2eMFggQYznfD12PRgxvJnr+9yj8tlOYLUCkpZKa
         qTYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=TQhutihisTXpuVK+GeZtz9M18UfcHNomSTyGrQh5D3k=;
        b=k3hipPcAPJZF1SYj+nhzpnelrbKptbHYfVa7Pre+y9ZEq2bL6v6wjO6kQ+KUXsww/a
         PsB9hao1hJM+5I3buOk06YLqS/Rba+7q8bfqdVrb7gobmbWSJWZ0T/QKjH+75KUEOHXD
         j7sBdpd/gMn9ZvMO9b8CzHM/xjA7Sey1ynFTerVUoqbDbjX5Kygr6pxE6WkZYxqDq8K4
         T1L/SQPR2/bR5PLMYqRiRO5MtVQgzcCcY7diiPeTOSmnKXNLZDNWwJL/Om5wBEwbBjU2
         rNafrYksjrTPCW9PQM34dNvU9uN8tmvzdP8p/5S3LIbSPuwPAM/GoiNEcrpJyGCFtpvb
         LIUQ==
X-Gm-Message-State: APt69E27P1wFyeyKRWhEtFbuMRBUWzr3AnhIT4EGGCTt1eoDGwi1ZpQ3
        QlsGsVQdwULjaw1cM+jqA7JzmCKyLNVtrihzqN6Piw==
X-Google-Smtp-Source: AAOMgpdfCxEmrXGN9cYPDwN3cYkZXTvqm5ONB3XHlhMsbqBrB38enIQPq9jbMYnsmumlsBlFJR0maFDxu1GlsCUtjOY=
X-Received: by 2002:a24:ca43:: with SMTP id k64-v6mr10130862itg.44.1530210548456;
 Thu, 28 Jun 2018 11:29:08 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a02:9082:0:0:0:0:0 with HTTP; Thu, 28 Jun 2018 11:29:07
 -0700 (PDT)
In-Reply-To: <20180627160800.3dc7f9ee41c0badbf7342520@linux-foundation.org>
References: <cover.1530018818.git.andreyknvl@google.com> <20180627160800.3dc7f9ee41c0badbf7342520@linux-foundation.org>
From:   Andrey Konovalov <andreyknvl@google.com>
Date:   Thu, 28 Jun 2018 20:29:07 +0200
Message-ID: <CAAeHK+xz552VNpZxgWwU-hbTqF5_F6YVDw3fSv=4OT8mNrqPzg@mail.gmail.com>
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

On Thu, Jun 28, 2018 at 1:08 AM, Andrew Morton
<akpm@linux-foundation.org> wrote:
> On Tue, 26 Jun 2018 15:15:10 +0200 Andrey Konovalov <andreyknvl@google.com> wrote:
>> ====== Benchmarks
>>
>> The following numbers were collected on Odroid C2 board. Both KASAN and
>> KHWASAN were used in inline instrumentation mode.
>>
>> Boot time [1]:
>> * ~1.7 sec for clean kernel
>> * ~5.0 sec for KASAN
>> * ~5.0 sec for KHWASAN
>>
>> Slab memory usage after boot [2]:
>> * ~40 kb for clean kernel
>> * ~105 kb + 1/8th shadow ~= 118 kb for KASAN
>> * ~47 kb + 1/16th shadow ~= 50 kb for KHWASAN
>>
>> Network performance [3]:
>> * 8.33 Gbits/sec for clean kernel
>> * 3.17 Gbits/sec for KASAN
>> * 2.85 Gbits/sec for KHWASAN
>>
>> Note, that KHWASAN (compared to KASAN) doesn't require quarantine.
>>
>> [1] Time before the ext4 driver is initialized.
>> [2] Measured as `cat /proc/meminfo | grep Slab`.
>> [3] Measured as `iperf -s & iperf -c 127.0.0.1 -t 30`.
>
> The above doesn't actually demonstrate the whole point of the
> patchset: to reduce KASAN's very high memory consumption?

You mean that memory usage numbers collected after boot don't give a
representative picture of actual memory consumption on real workloads?

What kind of memory consumption testing would you like to see?
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
