Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F10AEC433FE
	for <linux-doc@archiver.kernel.org>; Sun, 19 Dec 2021 22:12:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236767AbhLSWMe (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 19 Dec 2021 17:12:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38418 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236769AbhLSWMe (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 19 Dec 2021 17:12:34 -0500
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2CB2C061574
        for <linux-doc@vger.kernel.org>; Sun, 19 Dec 2021 14:12:33 -0800 (PST)
Received: by mail-ed1-x532.google.com with SMTP id z29so30755280edl.7
        for <linux-doc@vger.kernel.org>; Sun, 19 Dec 2021 14:12:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Z1EeGlidL5zxbN8lavZvrIotlPnJ2iSVy9AUU7Sk+Ag=;
        b=NdJgcvEjsZfkR59wZEXSS0eAS2OrzVKVMrHaeDy2k3yG7QDmcSTrqgVUsjoRTxYAYZ
         vCIPJCJjuPYvuxe2TKemOH14PEfxj7KcsAVyY5LORM9MPvai7r31koyJWODlLOnNa1hM
         YVOo44slRSUgIgcV41XWNlfxShfEvbw6SoJH0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Z1EeGlidL5zxbN8lavZvrIotlPnJ2iSVy9AUU7Sk+Ag=;
        b=v2GiVIoOmR/X4FxfFz3hxet2ganmej+lpUf4FXTPGIpwM+S1yQ95GARlhwFcBbztp/
         4PVjINy4Lp7T7k1iBZOxi1o917M57WB8a7eDbX4GXXUhp5gp6n67mSJMRIVO5xa8zOgO
         7xxpYDqyyypp9KzibiuisQRllbxmBU7jX4oPa/6MDPIFmYwL1RSIxXbti+6B9M05ojF9
         ASniJgUlQE1/TYGKtzV6lUI2Z59gdDEHzoS1FUPubcr7lsSaypbTkCeLRzOjEE330k4G
         neUX47oqoksbAWVTf66CB6vUtrc69y9caj52vC5CLmK6CIqL9oaLpnxIm6E23nL/YMIA
         FvCg==
X-Gm-Message-State: AOAM532rLEzEWHm2NrgBwXVmGYQVcm54fs+VjZGXfud4RgIs4x4abkPX
        okhF2i+AAo6FbA+dvC1EXlLd71AN2JWnyZQmMYg=
X-Google-Smtp-Source: ABdhPJwI+uy6YHXmtwlxIw/KcM1Z1PmbMLEggsazA+YDe9CfhOzKzFaIaPFpsHG5OCp7WddfrK4pyA==
X-Received: by 2002:a17:907:3e0a:: with SMTP id hp10mr10254711ejc.318.1639951952131;
        Sun, 19 Dec 2021 14:12:32 -0800 (PST)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com. [209.85.128.48])
        by smtp.gmail.com with ESMTPSA id qf22sm3281562ejc.85.2021.12.19.14.12.31
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 19 Dec 2021 14:12:31 -0800 (PST)
Received: by mail-wm1-f48.google.com with SMTP id z206so5702410wmc.1
        for <linux-doc@vger.kernel.org>; Sun, 19 Dec 2021 14:12:31 -0800 (PST)
X-Received: by 2002:a05:600c:1e01:: with SMTP id ay1mr9481320wmb.152.1639951940498;
 Sun, 19 Dec 2021 14:12:20 -0800 (PST)
MIME-Version: 1.0
References: <4D97206A-3B32-4818-9980-8F24BC57E289@vmware.com>
 <CAHk-=whxvVQReBqZeaV41=sAWfT4xTfn6sMSWDfkHKVS3zX85w@mail.gmail.com>
 <5A7D771C-FF95-465E-95F6-CD249FE28381@vmware.com> <CAHk-=wgMuSkumYxeaaxbKFoAbw_gjYo1eRXXSFcBHzNG2xauTA@mail.gmail.com>
 <CAHk-=whYT0Q1F=bxG0yi=LN5gXY64zBwefsbkLoRiP5p598d5A@mail.gmail.com>
 <fca16906-8e7d-5d04-6990-dfa8392bad8b@redhat.com> <Yb+gId/gXocrlJYD@casper.infradead.org>
 <CAHk-=wiAzmB-jiHvF+EZ1-b0X3ts4LAYHaVhzpzXEjmC0X95eg@mail.gmail.com>
 <Yb+oi8fg1dJe1uBm@casper.infradead.org> <CAHk-=wgLLRT_KeM5Se1AxGcf-g5MkCS-JmPy169Rpdeky_YkXg@mail.gmail.com>
 <Yb+r2W6RCKhO5toC@casper.infradead.org>
In-Reply-To: <Yb+r2W6RCKhO5toC@casper.infradead.org>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Sun, 19 Dec 2021 14:12:04 -0800
X-Gmail-Original-Message-ID: <CAHk-=wibQevWUPb4V67gs0FsUBKO+bSMvp9tpOU3PM4Mg_4i4Q@mail.gmail.com>
Message-ID: <CAHk-=wibQevWUPb4V67gs0FsUBKO+bSMvp9tpOU3PM4Mg_4i4Q@mail.gmail.com>
Subject: Re: [PATCH v1 06/11] mm: support GUP-triggered unsharing via
 FAULT_FLAG_UNSHARE (!hugetlb)
To:     Matthew Wilcox <willy@infradead.org>
Cc:     David Hildenbrand <david@redhat.com>,
        Nadav Amit <namit@vmware.com>,
        Jason Gunthorpe <jgg@nvidia.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Hugh Dickins <hughd@google.com>,
        David Rientjes <rientjes@google.com>,
        Shakeel Butt <shakeelb@google.com>,
        John Hubbard <jhubbard@nvidia.com>,
        Mike Kravetz <mike.kravetz@oracle.com>,
        Mike Rapoport <rppt@linux.ibm.com>,
        Yang Shi <shy828301@gmail.com>,
        "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
        Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
        Michal Hocko <mhocko@kernel.org>,
        Rik van Riel <riel@surriel.com>,
        Roman Gushchin <guro@fb.com>,
        Andrea Arcangeli <aarcange@redhat.com>,
        Peter Xu <peterx@redhat.com>,
        Donald Dutile <ddutile@redhat.com>,
        Christoph Hellwig <hch@lst.de>,
        Oleg Nesterov <oleg@redhat.com>, Jan Kara <jack@suse.cz>,
        Linux-MM <linux-mm@kvack.org>,
        "open list:KERNEL SELFTEST FRAMEWORK" 
        <linux-kselftest@vger.kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sun, Dec 19, 2021 at 2:02 PM Matthew Wilcox <willy@infradead.org> wrote:
>
> I'd like to get rid of ->mapcount for file pages too.  And those are
> definitely never mapped in the majority of cases.

Fair enough.

You'd probably be better off checking "is this mapping mapped" though.
Because otherwise you have to get the page lock to serialize each
page.

               Linus
