Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1324C433F5
	for <linux-doc@archiver.kernel.org>; Tue, 12 Oct 2021 07:44:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8A33960F23
	for <linux-doc@archiver.kernel.org>; Tue, 12 Oct 2021 07:44:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234277AbhJLHqm (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 12 Oct 2021 03:46:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26614 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233988AbhJLHqk (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 12 Oct 2021 03:46:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1634024678;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=5qXnnlO7kmq8KXinp8tIkwKgaF8XM9siD+0byK0/zq8=;
        b=PURW0SUzTEZnsShmhYPR70zfxi31XpUysg6nrNzdnSFY8OZn4+onzw5ZMWAFN167nFb0Og
        0fNLH/f+NJeEFucNcURfmfOTFTspAlmAL9ScrAYQ2SjCrV/fiuAE9f3fN5Q+mcTo3x7hhq
        lRvYc9YBiJVbuQC47YTz7eOxsWj9+ik=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-568-k-8FV9CRNlSxZ7xNWubbzA-1; Tue, 12 Oct 2021 03:44:37 -0400
X-MC-Unique: k-8FV9CRNlSxZ7xNWubbzA-1
Received: by mail-wr1-f69.google.com with SMTP id r16-20020adfbb10000000b00160958ed8acso15057294wrg.16
        for <linux-doc@vger.kernel.org>; Tue, 12 Oct 2021 00:44:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:to:cc:references:from:organization:subject
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=5qXnnlO7kmq8KXinp8tIkwKgaF8XM9siD+0byK0/zq8=;
        b=wWHndq0Cw7E3VkACFLmRN/KK+l3TZgfLDaxJfCZe/ZySCK+MwvjSbzf6l3SKOPF4UQ
         XkQk2TzVEWyPaf9dhcb0i2xTMnKWMGDDKP/2G1LzdzUz8rJRAQ4NrC7QM44CceKIlsaK
         DBQRQHGaDcnMaDdb+MuJ/nFQsYXiTHSHnnZ+/ss0ahKbKcCso5AnNNtAvTa6mFiHxSvq
         GKmEGfA+fwV704kVulj1x4P9L3VDBhic6DK/yUrmyQpwMifI44dyRWbX+sWqBJ5Rilie
         S0QbhsHKdNbyqMm43obBSNS+EV3E7DtoA6a6EmBlmk3OjKDOjG2rUohQIL5KrmmLvc6d
         TJgw==
X-Gm-Message-State: AOAM530pAMvBFe/Y1ifRPLaXzfwZ5vlF2CQeOdYuXs9oVrMXZjhctloy
        AISRCO8cMWSqoL0frZww8gPQ6qpPWRgwVDb2KjLgmbXbg1o4J39suFEbYGfLs5XRb5wvAsaF9ch
        /nqKesfJom2qJI+XFR5Kf
X-Received: by 2002:adf:ee8a:: with SMTP id b10mr21815798wro.335.1634024676374;
        Tue, 12 Oct 2021 00:44:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxHGKdxQCouYshY4aHJhSF1VyN+YjnwylycEyRo5FvejOGeaHtR7VXF5SvMyOExKtPUdEbvdA==
X-Received: by 2002:adf:ee8a:: with SMTP id b10mr21815766wro.335.1634024676163;
        Tue, 12 Oct 2021 00:44:36 -0700 (PDT)
Received: from [192.168.3.132] (p5b0c6a12.dip0.t-ipconnect.de. [91.12.106.18])
        by smtp.gmail.com with ESMTPSA id s13sm1740601wmc.47.2021.10.12.00.43.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Oct 2021 00:44:35 -0700 (PDT)
To:     Suren Baghdasaryan <surenb@google.com>,
        Michal Hocko <mhocko@suse.com>
Cc:     Kees Cook <keescook@chromium.org>, Pavel Machek <pavel@ucw.cz>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        John Hubbard <jhubbard@nvidia.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Colin Cross <ccross@google.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Dave Hansen <dave.hansen@intel.com>,
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
        =?UTF-8?B?Q2hpbndlbiBDaGFuZyAo5by16Yym5paHKQ==?= 
        <chinwen.chang@mediatek.com>,
        Axel Rasmussen <axelrasmussen@google.com>,
        Andrea Arcangeli <aarcange@redhat.com>,
        Jann Horn <jannh@google.com>, apopple@nvidia.com,
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
        Muchun Song <songmuchun@bytedance.com>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Thomas Cedeno <thomascedeno@google.com>, sashal@kernel.org,
        cxfcosmos@gmail.com, LKML <linux-kernel@vger.kernel.org>,
        linux-fsdevel@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-mm <linux-mm@kvack.org>,
        kernel-team <kernel-team@android.com>
References: <92cbfe3b-f3d1-a8e1-7eb9-bab735e782f6@rasmusvillemoes.dk>
 <20211007101527.GA26288@duo.ucw.cz>
 <CAJuCfpGp0D9p3KhOWhcxMO1wEbo-J_b2Anc-oNwdycx4NTRqoA@mail.gmail.com>
 <YV8jB+kwU95hLqTq@dhcp22.suse.cz>
 <CAJuCfpG-Nza3YnpzvHaS_i1mHds3nJ+PV22xTAfgwvj+42WQNA@mail.gmail.com>
 <YV8u4B8Y9AP9xZIJ@dhcp22.suse.cz>
 <CAJuCfpHAG_C5vE-Xkkrm2kynTFF-Jd06tQoCWehHATL0W2mY_g@mail.gmail.com>
 <202110071111.DF87B4EE3@keescook> <YV/mhyWH1ZwWazdE@dhcp22.suse.cz>
 <202110081344.FE6A7A82@keescook> <YWP3c/bozz5npQ8O@dhcp22.suse.cz>
 <CAJuCfpHQVMM4+6Lm_EnFk06+KrOjSjGA19K2cv9GmP3k9LW5vg@mail.gmail.com>
From:   David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH v10 3/3] mm: add anonymous vma name refcounting
Message-ID: <26f9db1e-69e9-1a54-6d49-45c0c180067c@redhat.com>
Date:   Tue, 12 Oct 2021 09:43:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAJuCfpHQVMM4+6Lm_EnFk06+KrOjSjGA19K2cv9GmP3k9LW5vg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

> I'm still evaluating the proposal to use memfds but I'm not sure if
> the issue that David Hildenbrand mentioned about additional memory
> consumed in pagecache (which has to be addressed) is the only one we
> will encounter with this approach. If anyone knows of any potential
> issues with using memfds as named anonymous memory, I would really
> appreciate your feedback before I go too far in that direction.

[MAP_PRIVATE memfd only behave that way with 4k, not with huge pages, so 
I think it just has to be fixed. It doesn't make any sense to allocate a 
page for the pagecache ("populate the file") when accessing via a 
private mapping that's supposed to leave the file untouched]

My gut feeling is if you really need a string as identifier, then try 
going with memfds. Yes, we might hit some road blocks to be sorted out, 
but it just logically makes sense to me: Files have names. These names 
exist before mapping and after mapping. They "name" the content.

Maybe it's just me, but the whole interface, setting the name via a 
prctl after the mapping was already instantiated doesn't really spark 
joy at my end. That's not a strong pushback, but if we can avoid it 
using something that's already there, that would be very much preferred.

-- 
Thanks,

David / dhildenb

