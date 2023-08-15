Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B1D0C001B0
	for <linux-doc@archiver.kernel.org>; Tue, 15 Aug 2023 08:52:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235761AbjHOIv7 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 15 Aug 2023 04:51:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235756AbjHOIvj (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 15 Aug 2023 04:51:39 -0400
Received: from mail-qk1-x72c.google.com (mail-qk1-x72c.google.com [IPv6:2607:f8b0:4864:20::72c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7EE7F107
        for <linux-doc@vger.kernel.org>; Tue, 15 Aug 2023 01:51:36 -0700 (PDT)
Received: by mail-qk1-x72c.google.com with SMTP id af79cd13be357-76ad842d12fso350239085a.3
        for <linux-doc@vger.kernel.org>; Tue, 15 Aug 2023 01:51:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692089495; x=1692694295;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z+coH+wpo6G1L3l1018KvkQFkkscoUmA9S4G4+U1liU=;
        b=jILeAcT8F/ZjGUdCFDoqyCtIzNFR4fZCkJfWZolfBjmDI9bsSwBAoFtDuPApcyHwj9
         uOfZlWquq423IT7P9r5L2h6e/NI2BkhCg6puek3BOqaFF1IQmDUCTnQvXpZMfpkZ99pv
         X+FFE5S78IyXIE5RBSNAsuFh32j5KE0r2DfJ4kGqov5usQLMRPL5qBvcuI7GY2f8sqSf
         u+bFd9TYSxITCA9p6WGIP0Uvgym9xMJHr05U4bBWLCbCWMZ6DILTxgd3bf4ZqAsxxTJe
         zbf6QemG6K8EOJl6IfJ5Lz/IBMGE5M3OUs6xVMPPyIFhz1np7bPxZmW6IuNSsJvxE7nV
         DQdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692089495; x=1692694295;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z+coH+wpo6G1L3l1018KvkQFkkscoUmA9S4G4+U1liU=;
        b=i09mvbuHUNqcoCHeCPtzTZOs5C9x8wJSIaZPQvvvBIT2tzgArOMqMWzxsenYM6a47h
         nPZnXeEoibTzgvPiosduXSiprTZg2uONjB/kX/mVOiSg28t9p+Xp7S0Md73WHXk4p6wk
         o1xhX9TSAWUfFuSptTk2vncDMXDjoo4W3RbaPRH3sycvAXGIvCgylvg16ivqnDvHsGq4
         y6WkvWYkN3Kg65dOwtmxwtHfimlrMSr4JxoXm/FQnuqNGhNsiK5iRfUpsCVmvjfJ50TL
         BXh+WadVgjYycVQxNuMS7T9w1t6Gu6NJRPbcrl8MtAyWxUDZJ0O+VgDDWO6DnXlP5unO
         fITg==
X-Gm-Message-State: AOJu0YxBPn9RNJm6kZH6qmXAH5Lmc5E0AhhSq3Q/oU+TXIbT307An1D1
        5fEC0HoO38SkVSquUq6J+3n5MOm6PfLTmAG9EjKWjg==
X-Google-Smtp-Source: AGHT+IGJOuWTMZv1UV4dsXeO6kHmmRY773XBZqzKSZ9eHc4ibHw4V17klynujZBGolKHTNLjULDkWQaZap43tGUDG/I=
X-Received: by 2002:a05:620a:2452:b0:767:3b7d:687c with SMTP id
 h18-20020a05620a245200b007673b7d687cmr15500893qkn.15.1692089495607; Tue, 15
 Aug 2023 01:51:35 -0700 (PDT)
MIME-Version: 1.0
References: <20230813182552.31792-1-fmdefrancesco@gmail.com>
In-Reply-To: <20230813182552.31792-1-fmdefrancesco@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 15 Aug 2023 10:51:24 +0200
Message-ID: <CACRpkdbq8UCtvtRH7FZUEqvTxPQcoGbrKvf_mT5QHMAfVoYNNQ@mail.gmail.com>
Subject: Re: [PATCH v2] Documentation/page_tables: Add info about MMU/TLB and
 Page Faults
To:     "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Mike Rapoport <rppt@kernel.org>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        Andrew Morton <akpm@linux-foundation.org>,
        Ira Weiny <ira.weiny@intel.com>,
        Matthew Wilcox <willy@infradead.org>,
        Randy Dunlap <rdunlap@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Fabio,

overall this v2 looks good!

The below are my grammar and spelling nitpicks.

On Sun, Aug 13, 2023 at 8:25=E2=80=AFPM Fabio M. De Francesco
<fmdefrancesco@gmail.com> wrote:

> Extend page_tables.rst by adding a section about the role of MMU and TLB
> in translating between virtual addresses and physical page frames.
> Furthermore explain the concept behind Page Faults and how the Linux
> kernel handles TLB misses. Finally briefly explain how and why to disable
> the page faults handler.
>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Ira Weiny <ira.weiny@intel.com>
> Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Matthew Wilcox <willy@infradead.org>
> Cc: Mike Rapoport <rppt@kernel.org>
> Cc: Randy Dunlap <rdunlap@infradead.org>
> Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
(...)
> +If the above-mentioned conditions happen in user-space, the kernel sends=
 a
> +`Segmentation Fault` (SIGSEGV) signal to the current thread. That signal=
 usually
> +causes the termination of the thread and of the process it belongs to.
> +
> +Instead, there are also common and expected other causes of page faults.=
 These

The word you are looking for is "Additionally" right?

"Additionally, there are..."

> +These techniques improve memory efficiency, reduce latency, and minimize=
 space
> +occupation. This document won't go deeper into the details of "Lazy Allo=
cation"
> +and "Copy-on-Write" because these subjects are out of scope for they bel=
ong to

"for they belong" -> "as they belong"
(I think)

> +Swapping differentiate itself from the other mentioned techniques becaus=
e it's

differentiates

> +not so desirable since it's performed as a means to reduce memory under =
heavy
> +pressure.

"not so desirable" -> "undesirable"

> +Swapping can't work for memory mapped by kernel logical addresses. These=
 are a

"kernel logical addresses" -> "kernel-internal logical addresses"

> +If everything fails to make room for the data that must reside be presen=
t in

"If everything fails" -> "If the kernel fails"

> +This document is going to simplify and show an high altitude view of how=
 the
> +Linux kernel handles these page faults, creates tables and tables' entri=
es,
> +check if memory is present and, if not, requests to load data from persi=
stent
> +storage or from other devices, and updates the MMU and its caches...

Skip "..." for just period "."

> +The first steps are architectures dependent. Most architectures jump to

architectures -> architecture

> +Whatever the routes, all architectures end up to the invocation of
> +`handle_mm_fault()` which, in turn, (likely) ends up calling
> +`__handle_mm_fault()` to carry out the actual work of allocation of the =
page
> +tables.

"of allocation of the" -> "of allocating the"

> +`__handle_mm_fault()` carries out its work by calling several functions =
to
> +find the entry's offsets of the upper layers of the page tables and allo=
cate
> +the tables that it may need to.

Skip the last "to".

> +Linux supports larger page sizes than the usual 4KB (i.e., the so called
> +`huge pages`). When using these kinds of larger pages, higher level page=
s can
> +directly map them, with no need to use lower level page entries (PTE). H=
uge
> +pages contain large contiguos physical regions that usually span from 2M=
B to

contiguous

> +The huge pages bring with them several benefits like reduced TLB pressur=
e,
> +reduced page table overhead, memory allocation efficiency, and performan=
ce
> +improvement for certain workloads. However, these benefits come with
> +trade-offs, like wasted memory and allocation challenges. Huge pages are=
 out
> +of scope of the present document, therefore, it won't go into further de=
tails.

Since you explain what they are, it feels they are in scope?
I would just skip the last sentence.

> +To conclude this brief overview from very high altitude of how Linux han=
dles

To conclude this high altitude view of...

> +Several code path make use of the latter two functions because they need=
 to

code paths

With or without the above suggestions:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
