Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EAB8C433F5
	for <linux-doc@archiver.kernel.org>; Tue, 16 Nov 2021 06:10:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7FC1261546
	for <linux-doc@archiver.kernel.org>; Tue, 16 Nov 2021 06:10:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233023AbhKPGNc (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 16 Nov 2021 01:13:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38422 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232503AbhKPGNb (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 16 Nov 2021 01:13:31 -0500
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com [IPv6:2607:f8b0:4864:20::b36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03AF2C061714
        for <linux-doc@vger.kernel.org>; Mon, 15 Nov 2021 22:10:35 -0800 (PST)
Received: by mail-yb1-xb36.google.com with SMTP id v138so54259327ybb.8
        for <linux-doc@vger.kernel.org>; Mon, 15 Nov 2021 22:10:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cKbvFtZ+QRZeI3FNBGdfQQxAtlb2rMZX444bX3hzMG8=;
        b=iLSyO1Wzty/HxSbjlG8/79WYkC7ybAYGe6n21M/rCnfX7DgCvNzRR8pL0wvcqd+M78
         Fatg0iIfjQwREHvF9nC6hqGp7GpSW/H73mCOKvjYVN47BFVo3vqfIQpVw1gpCOu25k2x
         7AtUlVKKX+hlqy+gj6NO/lXRjWaj0VWYqIVAX4k599LcgTXloavYAaaCPI4oLBPiD3So
         nqjSDZQ8+76XYR/zkmnWp2MrTk4mBVEhWeI2L+TTwvapiHtv2NLW2hN4az2OrcABC7+n
         uaQvDriLzyFQBjPMI+l/ANBhZEWViDhXMQqEwy2JjJDlAR5DYRkm270zUhZIlxz11DqF
         AvsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cKbvFtZ+QRZeI3FNBGdfQQxAtlb2rMZX444bX3hzMG8=;
        b=ppuOtrObuZugEYCBe4vHUQVh3KWHzlAyz0ypxvid45NK6fzfo4t2eTX1Tx3oHDSe1t
         0+U4NdqPA4KHIP64DpPGC1ERlK/sabJJursC9X0ktwDGQM+5+9k6O8p4WOA1llSESWu0
         S5lROP/DnVrB9+NbZzhje83SuZxkZ72b3g6vlUfg0SCq2Vmz2Nx6Zgkv3xuJWlNiLyrH
         +F7fTowyOBydlZZpnnxcoyYWV0ACIFQg9jVK7cVgpMErZyM1Gt5JCDFjnT94nfJCEMVN
         aXOc5DPMgWAaD9Mb84/1SWS5XjePo5LWQtj31LTvAvWBs+AtqxA4H5JpD6L4rB0RF/jS
         ctrA==
X-Gm-Message-State: AOAM5325OGPsmBCf/doNfTi4Ofc7eRlH742i0eXcU/G26coBkJQkF6wA
        rck1V92CyYbOnV3Qg8sdwfm/PUJHOKIp72jjsMIEEg==
X-Google-Smtp-Source: ABdhPJzN3pVN1nOnOBZej16gfngM79uRdjBdoa7a33PlJmhY0MQPFgpI2ys9scPvhjJczlcxmh/zFAf822pKoifh5E4=
X-Received: by 2002:a05:6902:110e:: with SMTP id o14mr5715852ybu.161.1637043033954;
 Mon, 15 Nov 2021 22:10:33 -0800 (PST)
MIME-Version: 1.0
References: <20211019215511.3771969-1-surenb@google.com> <20211019215511.3771969-2-surenb@google.com>
 <CAJuCfpGG-j00eDL8p3vNDh4ye2Ja4untoA20UdTkTubm3AfMEQ@mail.gmail.com> <20211115211905.faef6f9db3ce4a6fb9ed66a2@linux-foundation.org>
In-Reply-To: <20211115211905.faef6f9db3ce4a6fb9ed66a2@linux-foundation.org>
From:   Suren Baghdasaryan <surenb@google.com>
Date:   Mon, 15 Nov 2021 22:10:21 -0800
Message-ID: <CAJuCfpEqO8C7eRO1Mr+MULnuKxjjh1zq2j1yoGZhocghpr7V9w@mail.gmail.com>
Subject: Re: [PATCH v11 2/3] mm: add a field to store names for private
 anonymous memory
To:     Andrew Morton <akpm@linux-foundation.org>
Cc:     Colin Cross <ccross@google.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Michal Hocko <mhocko@suse.com>,
        Dave Hansen <dave.hansen@intel.com>,
        Kees Cook <keescook@chromium.org>,
        Matthew Wilcox <willy@infradead.org>,
        "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
        Vlastimil Babka <vbabka@suse.cz>,
        Johannes Weiner <hannes@cmpxchg.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Al Viro <viro@zeniv.linux.org.uk>,
        Randy Dunlap <rdunlap@infradead.org>,
        Kalesh Singh <kaleshsingh@google.com>,
        Peter Xu <peterx@redhat.com>, rppt@kernel.org,
        Peter Zijlstra <peterz@infradead.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        vincenzo.frascino@arm.com,
        Chinwen Chang <chinwen.chang@mediatek.com>,
        Axel Rasmussen <axelrasmussen@google.com>,
        Andrea Arcangeli <aarcange@redhat.com>,
        Jann Horn <jannh@google.com>, apopple@nvidia.com,
        John Hubbard <jhubbard@nvidia.com>,
        Yu Zhao <yuzhao@google.com>, Will Deacon <will@kernel.org>,
        fenghua.yu@intel.com, thunder.leizhen@huawei.com,
        Hugh Dickins <hughd@google.com>, feng.tang@intel.com,
        Jason Gunthorpe <jgg@ziepe.ca>, Roman Gushchin <guro@fb.com>,
        Thomas Gleixner <tglx@linutronix.de>, krisman@collabora.com,
        Chris Hyser <chris.hyser@oracle.com>,
        Peter Collingbourne <pcc@google.com>,
        "Eric W. Biederman" <ebiederm@xmission.com>,
        Jens Axboe <axboe@kernel.dk>, legion@kernel.org,
        Rolf Eike Beer <eb@emlix.com>,
        Cyrill Gorcunov <gorcunov@gmail.com>,
        Pavel Machek <pavel@ucw.cz>,
        Muchun Song <songmuchun@bytedance.com>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Thomas Cedeno <thomascedeno@google.com>, sashal@kernel.org,
        cxfcosmos@gmail.com, Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-fsdevel@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-mm <linux-mm@kvack.org>,
        kernel-team <kernel-team@android.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Nov 15, 2021 at 9:19 PM Andrew Morton <akpm@linux-foundation.org> wrote:
>
> On Tue, 19 Oct 2021 14:58:36 -0700 Suren Baghdasaryan <surenb@google.com> wrote:
>
> > As Andrew suggested, I checked the image sizes with allnoconfig builds:
> >
> > unpatched Linus' ToT
> >    text    data     bss     dec     hex filename
> > 1324759      32   73928 1398719 1557bf vmlinux
> >
> > After the first patch is applied (madvise refactoring)
> >    text    data     bss     dec     hex filename
> > 1322346      32   73928 1396306 154e52 vmlinux
> > >>> 2413 bytes decrease vs ToT <<<
> >
> > After all patches applied with CONFIG_ANON_VMA_NAME=n
> >    text    data     bss     dec     hex filename
> > 1322337      32   73928 1396297 154e49 vmlinux
> > >>> 2422 bytes decrease vs ToT <<<
> >
> > After all patches applied with CONFIG_ANON_VMA_NAME=y
> >    text    data     bss     dec     hex filename
> > 1325228      32   73928 1399188 155994 vmlinux
> > >>> 469 bytes increase vs ToT <<<
>
> Nice.  Presumably there are memory savings from no longer duplicating
> the vma names?

The third patch does have this effect.

>
> I fudged up a [0/n] changelog (please don't forget this) and merged it
> all for testing.

Thanks!
