Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04651C41513
	for <linux-doc@archiver.kernel.org>; Mon,  7 Aug 2023 09:40:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231602AbjHGJko (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 7 Aug 2023 05:40:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60778 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229491AbjHGJko (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 7 Aug 2023 05:40:44 -0400
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com [IPv6:2607:f8b0:4864:20::b35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DCDD410F8
        for <linux-doc@vger.kernel.org>; Mon,  7 Aug 2023 02:40:42 -0700 (PDT)
Received: by mail-yb1-xb35.google.com with SMTP id 3f1490d57ef6-d4f022c6c91so1439755276.2
        for <linux-doc@vger.kernel.org>; Mon, 07 Aug 2023 02:40:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691401242; x=1692006042;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z0BIx/DwsSPZgVGJC3d5waXyUmpwnTVitNmKM5gOvHE=;
        b=USDb3373iehLTf75iQhizKmSVDbZFFGRKRsJOyNXaLSF7qJFSVRrZ7OOGUAbr8hewW
         wAbhAITm0J3tScId7uL4BZ+5p/IPwRWHXebJqdOEpWdcnLaMpZbcOwxTreHwfT7f9vT5
         Yu5z+OkPYsAHTX68z35rbi7RtTBWvhtKqjtjyeuAmWAJDrqoejtwplYKDWm1GaGfJFE3
         re2hsNN6NXtOHVQKX6eTSQBQiXTmVnxbt7F1ZqOlU0/RVc/Whmc2zu5JIWD9ij8aMiBD
         ZikynjeXX7Mg2N08ouqti00b9pHhwmGSUnm/+052JO4lgeiuYzIRbZrmfZ3fUCxhZqPY
         68cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691401242; x=1692006042;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z0BIx/DwsSPZgVGJC3d5waXyUmpwnTVitNmKM5gOvHE=;
        b=av7qLMIIz3Sss/A2pEWZIe6KL2KDP+TiAbRUmeBH7tL9ikMSm2P9g9uc3Geyrag2Ts
         DGoH3DbSCXdPsyzcmxkZJUYSuvRFKNUCNst7ZuPrZn2jXf4xEDQ4h+MjYi0X6uXP03kY
         6aTSKqoM5u8U0ZOABUuKfSeRq8Tt6uFincqauNQhKBL2XWRt+xCfPfKU9J8zCTVkJWEY
         T3eDHBzxjbWRftV6U9elEWy4QjcDbaDCCrCA9Cyp9PkwXDmEkGRlU1rrlEVvqo+ih004
         KK5BlMm6lwm0Jw+A78vG5azaLdyDumXD0CKY3WINL8Iiqz10UZ9yX/pPRfs8fqsf63Mj
         qMmA==
X-Gm-Message-State: AOJu0Ywem5lp6pC95LaSsawC/qhwg7/LAF6rxrhRdaBnTVzaJ4qIMnqF
        6p8jfB0RCF306NAWWjle5rHs+yaLtoPGQjM7TnragA==
X-Google-Smtp-Source: AGHT+IFjgVVEbs75Yy6UHOvcZs/Zmb8sTBl4Zg/Gk6G3S+nGQ6xP3TrMvuSZUsuCKJDebDvYO7m7I7MdetFFTSLjqmY=
X-Received: by 2002:a25:d757:0:b0:d07:23bf:2824 with SMTP id
 o84-20020a25d757000000b00d0723bf2824mr9006539ybg.50.1691401242129; Mon, 07
 Aug 2023 02:40:42 -0700 (PDT)
MIME-Version: 1.0
References: <20230728120054.12306-1-fmdefrancesco@gmail.com>
In-Reply-To: <20230728120054.12306-1-fmdefrancesco@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 7 Aug 2023 11:40:30 +0200
Message-ID: <CACRpkdYcAWDZV0GkdP6gEJv971wjYQ-8WweHkreTJ-w7sfKKQg@mail.gmail.com>
Subject: Re: [PATCH] Documentation/page_tables: Add info about MMU/TLB and
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

I'm back from vacation! Overall this documentation looks good and
in line with the reset in this section.

On Fri, Jul 28, 2023 at 2:01=E2=80=AFPM Fabio M. De Francesco
<fmdefrancesco@gmail.com> wrote:

> +One cause of page faults is due to bugs (or maliciously crafted addresse=
s) and
> +happens when a process tries to access a range of memory that it doesn't=
 have
> +permission to. This could be because the memory is reserved for the kern=
el or
> +for another process, or because the process is trying to write to a read=
-only
> +section of memory. When this happens, the kernel sends a Segmentation Fa=
ult
> +(SIGSEGV) signal to the process, which usually causes the process to ter=
minate.

This "segmentation fault" (SIGSEGV reads "signal segmentation violation)
is actually a bit hard to understand for people not familiar
with the 1970ies hardware. The Wikipedia tries to explain it but gets a bit
long and confusing.
https://en.wikipedia.org/wiki/Segmentation_fault

The computers where the first Unix was developed (PDP machines) simply
named its MMU the "memory segmentation unit" so "segmentation fault"
is just a 1970ies way of saying "MMU access violation", which stuck inside
Unix and thus inside Linux. Here is the explanation:
https://wfjm.github.io/blogs/w11/2022-08-18-on-segments-and-pages.html

The binary loader would generously use the plentyful virtual memory
"segments" to split each executable into three segments when loading the bi=
nary,
still reflected in ELF binaries to this day:
https://en.wikipedia.org/wiki/Code_segment
https://en.wikipedia.org/wiki/Data_segment
https://en.wikipedia.org/wiki/.bss

Then the page table got special permissions set to each segment for read/wr=
ite
etc. Other programs and the kernel memory are also in inaccessible segments=
,
so accessing any of the own segments in the wrong way, or another programs
segment, or an unmapped segment (virtual memory) would all result in the
SIGSEGV opaque message "segmentation fault"

I don't know how to reflect this in a good way in the documentation
though, maybe
copy/paste/edit some of my text or I can try to write something as an addit=
ional
patch if you prefer.

Yours,
Linus Walleij
