Return-Path: <SRS0=pZ1j=DC=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.4 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1ED8C4363D
	for <linux-doc@archiver.kernel.org>; Fri, 25 Sep 2020 15:25:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 87B832344C
	for <linux-doc@archiver.kernel.org>; Fri, 25 Sep 2020 15:25:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="KM9OZ7Bi"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728888AbgIYPZZ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 25 Sep 2020 11:25:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728612AbgIYPZY (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 25 Sep 2020 11:25:24 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C2C6C0613CE
        for <linux-doc@vger.kernel.org>; Fri, 25 Sep 2020 08:25:24 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id j2so4018758wrx.7
        for <linux-doc@vger.kernel.org>; Fri, 25 Sep 2020 08:25:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=V7t4fEIEyVBsi/fjg9YkHb+gy/WAE7FgQtIkyl4FSCQ=;
        b=KM9OZ7Biuv/yQe+fyjAagbCVboVA9WGPjj/1U97fdkl6Hfxv+A5iWZSmt8hlFVjOPc
         W1HaNnR+6fTIz7NL3gQHy3UV0XhUJg8vM0a8mglzpBCR3uRNsQwXwHuMdrLHAWGGacmV
         IX84JJFO7YtnQ2OjSWbktlicNpCpTN0PlbP89Hpn2GwE5TxGjH7A9/Dk/WuX/Z0EZC72
         sBGlM35ZjCNN9OpaNA735G37RlDJokox2C6Qp7QuRfZjcGjX0qSqF+B3aEZpq1dvzHSt
         7reRdjaq6udHpT3S+OUHZoGiFz/6BBju4nvnXhR+va4WZuG9zAWx/DvRF/F7WFcIkz5K
         HnOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=V7t4fEIEyVBsi/fjg9YkHb+gy/WAE7FgQtIkyl4FSCQ=;
        b=CK8FIJmnZeoRjQguOLKFsvAEumvXhoW3mAtcviP+BOEsCbyf+dhk/Wr2HryGRy5Anr
         g25nPOEjn+I1stKR9RzG1ezC3qbSzrH4AbnSuw+ygT92BHH61KsVNKMc/2Gs6jw1man4
         GxELTdpXKxCLYzASo8Y1+z+kBYGWmB54qCYZQjIuaQn19qfSo0B1VcDsqFL5qC5K5N9w
         1f8evC91WbMywr+S3ilv2pCRSWBouIh/xKwjG6d9UhkdKcZnNyjC0SsqxBy8xfz6YcyQ
         ulAgSaXBREya7OWrdBpgdbiw05RNr+YLcwEzpViUlw1l5WHdwnzIWP/dEPcg0q+Y14pG
         m06A==
X-Gm-Message-State: AOAM530tbOoxT73oS21+izHGbnb/ulDCbi9sh0ym3YK2oZJ1W77rBsTt
        kA3v12FjxEKXVRPGFD3bUvtjtbbZd/LifPaABpLs6w==
X-Google-Smtp-Source: ABdhPJyZC6LaW4EhV/2oZznYx/893DZokEKtYHJPWcYE5I0O+k12BELKilXwNkpXCMze/LLQrSVCvwKYmQSG2pDbA6M=
X-Received: by 2002:a5d:4581:: with SMTP id p1mr5255102wrq.345.1601047522816;
 Fri, 25 Sep 2020 08:25:22 -0700 (PDT)
MIME-Version: 1.0
References: <20200921132611.1700350-1-elver@google.com> <20200921132611.1700350-4-elver@google.com>
 <20200921143059.GO2139@willie-the-truck>
In-Reply-To: <20200921143059.GO2139@willie-the-truck>
From:   Alexander Potapenko <glider@google.com>
Date:   Fri, 25 Sep 2020 17:25:11 +0200
Message-ID: <CAG_fn=WXknUnNmyniy_UE7daivSNmy0Da2KzNmX4wcmXC2Z_Mg@mail.gmail.com>
Subject: Re: [PATCH v3 03/10] arm64, kfence: enable KFENCE for ARM64
To:     Will Deacon <will@kernel.org>
Cc:     Marco Elver <elver@google.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        "H. Peter Anvin" <hpa@zytor.com>,
        "Paul E. McKenney" <paulmck@kernel.org>,
        Andrey Konovalov <andreyknvl@google.com>,
        Andrey Ryabinin <aryabinin@virtuozzo.com>,
        Andy Lutomirski <luto@kernel.org>,
        Borislav Petkov <bp@alien8.de>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Christoph Lameter <cl@linux.com>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        David Rientjes <rientjes@google.com>,
        Dmitriy Vyukov <dvyukov@google.com>,
        Eric Dumazet <edumazet@google.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Hillf Danton <hdanton@sina.com>,
        Ingo Molnar <mingo@redhat.com>, Jann Horn <jannh@google.com>,
        Jonathan.Cameron@huawei.com, Jonathan Corbet <corbet@lwn.net>,
        Joonsoo Kim <iamjoonsoo.kim@lge.com>,
        Kees Cook <keescook@chromium.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Pekka Enberg <penberg@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>, sjpark@amazon.com,
        Thomas Gleixner <tglx@linutronix.de>,
        Vlastimil Babka <vbabka@suse.cz>,
        "the arch/x86 maintainers" <x86@kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        kasan-dev <kasan-dev@googlegroups.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Memory Management List <linux-mm@kvack.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Will,

> Given that the pool is relatively small (i.e. when compared with our virtual
> address space), dedicating an area of virtual space sounds like it makes
> the most sense here. How early do you need it to be available?

How do we assign struct pages to a fixed virtual space area (I'm
currently experimenting with 0xffff7f0000000000-0xffff7f0000200000)?
Looks like filling page table entries (similarly to what's being done
in arch/arm64/mm/kasan_init.c) is not enough.
I thought maybe vmemmap_populate() would do the job, but it didn't
(virt_to_pfn() still returns invalid PFNs).
