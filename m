Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E16EC77B61
	for <linux-doc@archiver.kernel.org>; Thu, 13 Apr 2023 17:22:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230112AbjDMRWR (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 13 Apr 2023 13:22:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50404 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229617AbjDMRWQ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 13 Apr 2023 13:22:16 -0400
Received: from mail-pg1-x54a.google.com (mail-pg1-x54a.google.com [IPv6:2607:f8b0:4864:20::54a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5119826A6
        for <linux-doc@vger.kernel.org>; Thu, 13 Apr 2023 10:22:14 -0700 (PDT)
Received: by mail-pg1-x54a.google.com with SMTP id 185-20020a6302c2000000b005135edbb985so4478809pgc.1
        for <linux-doc@vger.kernel.org>; Thu, 13 Apr 2023 10:22:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1681406534; x=1683998534;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MUWO1kZAYR92KIzOOxoAG6fgcpTDrbsTBnBgIaXB7SI=;
        b=k9K7/cx14r1rZ44+YUmMJA/zyDFSnSwd4M/yoOo6MK1lBZbqEHHMPLqbgmJy4VHzWr
         BHtqD7duSRrul042d0Suw2viax09pK0xMVdFhDXpoxoBfhFfIuBKNDsrnzf3PtlFwTe0
         xZs14NrJu4rjfC+GuieNJRVga4Qv8eQWhGsY7num3+DbmUoQdqIvovvw7B75AYwZTkKG
         iKlZHnMH6l41XSupS5sXqcJVcqX0LpFcpp/+2ct//bBU6UJaLCpcjq4ly/wd092FSy5B
         RAM7fGGTnnv8Bkbvo6qpHrJ0vab0jDHA6Sxzq0hjEQ4MKc/Y3j5NGUn0fKFRnXbWoeyn
         RO7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681406534; x=1683998534;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MUWO1kZAYR92KIzOOxoAG6fgcpTDrbsTBnBgIaXB7SI=;
        b=HN7qDDaLTWgSF524Pmp+f1yX+frLaYFlqK8Dzr6G14toU08U/LB36ULS3Ap7d6xfJO
         99y9aPaOAYWb8OWvDfjR6/J8zfD7xU8plMpcP36oim598hU2jkf0sgudxnuvnJmzB/eo
         QNUVMN/QcP7rfeeeZvnoFtnKsZVQUxybROac2jMf/DesW2qI00J0Hg6kK6TCwkmWK0oR
         Mc9NMpMxHSbu4AbSy+aLP8wP1IRRfnNNUEG8+kOzWwFZu5ufP569JIg7133SO2bMH2p2
         TZ7k1BgDb0wfyoplxi2hzmCQYFpNXeCPItF1CCD8PazSBMm1tbtvB+HGIQ/O1TNWE26D
         Eu0g==
X-Gm-Message-State: AAQBX9clwN038/dZXMQRvHZ0EPikYVE0iWeO6L94scNedjgBVTj23FMG
        hennrXSCs3zVfgP4gSf6UOYqXIe+QgcsDIE+vg==
X-Google-Smtp-Source: AKy350buit0TKoFObhZndLsv+Oe7SecvOYrJwebJQwpxXJ4Pb+22Ci4SNV5J0w0/4fgc4zy9sZpOZtI2T9SDAix8Kg==
X-Received: from ackerleytng-cloudtop.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:1f5f])
 (user=ackerleytng job=sendgmr) by 2002:a17:90b:815:b0:246:a1b2:77fe with SMTP
 id bk21-20020a17090b081500b00246a1b277femr2564960pjb.3.1681406533842; Thu, 13
 Apr 2023 10:22:13 -0700 (PDT)
Date:   Thu, 13 Apr 2023 17:22:12 +0000
In-Reply-To: <20221202061347.1070246-2-chao.p.peng@linux.intel.com> (message
 from Chao Peng on Fri,  2 Dec 2022 14:13:39 +0800)
Mime-Version: 1.0
Message-ID: <diqzh6tjofy3.fsf@ackerleytng-cloudtop.c.googlers.com>
Subject: Re: [PATCH v10 1/9] mm: Introduce memfd_restricted system call to
 create restricted user memory
From:   Ackerley Tng <ackerleytng@google.com>
To:     Chao Peng <chao.p.peng@linux.intel.com>
Cc:     kvm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, linux-fsdevel@vger.kernel.org,
        linux-arch@vger.kernel.org, linux-api@vger.kernel.org,
        linux-doc@vger.kernel.org, qemu-devel@nongnu.org,
        pbonzini@redhat.com, corbet@lwn.net, seanjc@google.com,
        vkuznets@redhat.com, wanpengli@tencent.com, jmattson@google.com,
        joro@8bytes.org, tglx@linutronix.de, mingo@redhat.com,
        bp@alien8.de, arnd@arndb.de, naoya.horiguchi@nec.com,
        linmiaohe@huawei.com, x86@kernel.org, hpa@zytor.com,
        hughd@google.com, jlayton@kernel.org, bfields@fieldses.org,
        akpm@linux-foundation.org, shuah@kernel.org, rppt@kernel.org,
        steven.price@arm.com, mail@maciej.szmigiero.name, vbabka@suse.cz,
        vannapurve@google.com, yu.c.zhang@linux.intel.com,
        chao.p.peng@linux.intel.com, kirill.shutemov@linux.intel.com,
        luto@kernel.org, jun.nakajima@intel.com, dave.hansen@intel.com,
        ak@linux.intel.com, david@redhat.com, aarcange@redhat.com,
        ddutile@redhat.com, dhildenb@redhat.com, qperret@google.com,
        tabba@google.com, michael.roth@amd.com, mhocko@suse.com,
        wei.w.wang@intel.com
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Chao Peng <chao.p.peng@linux.intel.com> writes:

> From: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>

> Introduce 'memfd_restricted' system call with the ability to create
> memory areas that are restricted from userspace access through ordinary
> MMU operations (e.g. read/write/mmap). The memory content is expected to
> be used through the new in-kernel interface by a third kernel module.

> ...

> diff --git a/mm/restrictedmem.c b/mm/restrictedmem.c
> new file mode 100644
> index 000000000000..56953c204e5c
> --- /dev/null
> +++ b/mm/restrictedmem.c
> @@ -0,0 +1,318 @@
> +// SPDX-License-Identifier: GPL-2.0
> +#include "linux/sbitmap.h"
> +#include <linux/pagemap.h>
> +#include <linux/pseudo_fs.h>
> +#include <linux/shmem_fs.h>
> +#include <linux/syscalls.h>
> +#include <uapi/linux/falloc.h>
> +#include <uapi/linux/magic.h>
> +#include <linux/restrictedmem.h>
> +
> +struct restrictedmem_data {
> +	struct mutex lock;
> +	struct file *memfd;

Can this be renamed to file, or lower_file (as in stacking filesystems)?

It's a little confusing because this pointer doesn't actually refer to
an fd.

'memfd' is already used by udmabuf to refer to an actual fd [1], which
makes this a little misleading.

[1]  
https://elixir.bootlin.com/linux/v6.2.10/source/tools/testing/selftests/drivers/dma-buf/udmabuf.c#L63

> +	struct list_head notifiers;
> +};
> +
> ...

