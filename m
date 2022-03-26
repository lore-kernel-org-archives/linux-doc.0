Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DABFC433F5
	for <linux-doc@archiver.kernel.org>; Sat, 26 Mar 2022 20:53:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230431AbiCZUzJ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 26 Mar 2022 16:55:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54604 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232556AbiCZUzH (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 26 Mar 2022 16:55:07 -0400
Received: from mail-vk1-xa2f.google.com (mail-vk1-xa2f.google.com [IPv6:2607:f8b0:4864:20::a2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C52502AE6
        for <linux-doc@vger.kernel.org>; Sat, 26 Mar 2022 13:53:28 -0700 (PDT)
Received: by mail-vk1-xa2f.google.com with SMTP id j204so6018825vkj.8
        for <linux-doc@vger.kernel.org>; Sat, 26 Mar 2022 13:53:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=pcKa0lFs61IqH0Q2OuV1GgPXmb8CKZ6CqPPFd4s4Pdo=;
        b=Xspes3HTVVdABfoVajMr3OEvWhBDkkTooZMWaUYGSrZFUpahQoYkrv1Q9EzqmaKA6V
         kg+1PcsBi4kGIrJg+pUt5M4OOn6UA49m2MCMFBuj6JiDN0sEwAGFnY+hoW9QEgu1rVpQ
         o2guAsbCVInzLWGCRoOj7XPHcpFsZU+vWVk3XpAyXieCwDkxD7S52atyPdGYgPbtP6tv
         fm78xa7C1zsHUPJGF83xIy0WJq7gTKNnZSE7OX8g2mR8Yy75CgDLFXEugTIfZNO880bs
         ThSuTnxmSYG0/DYmWqUQ1ylGBwUJgyRojWOMdyLGd+zQijI7sjenkZgM7B9GZjqL8hYY
         Z3fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pcKa0lFs61IqH0Q2OuV1GgPXmb8CKZ6CqPPFd4s4Pdo=;
        b=UpvK+y9+HpUL2E0eazSJGMtDlrK+f4XPyod5KIua0hIJhyeEQJFiUhBETVZznzwjHS
         iZXmWcu/WjdRpPaYWLv76sd2sBUbzXAoRIo9CUVtFaDzeMkIuPmfKpUiI+335YQmtr+K
         w6TCITT0ZOuYO8G9WeGqV4tPM+me/Xifw0Z7VwreyclOk4OHtXyGj+Whj92beYNOMD0g
         2wYhm+YuZmhwU3ac8YZ3+LPFGo5/dF5gR9jZSgqVazk+QZnOjeDCsIDf9T5sdA9acjji
         T1/XqnVm8ir1q2gGe+CVxuaUfhKo/NvffgHH9EvIdIJ0E95HBj5jv1lspDoPuRgraBvr
         LzPQ==
X-Gm-Message-State: AOAM530ANamN96P2XRQndKvqCIdkRC/JfLt6T0BbPG1fIMymxfWz8WYa
        DfEh5uuen+m1SXSQXKnj6z1tapmKVRDPieogEX3Xqg==
X-Google-Smtp-Source: ABdhPJyBTheGCd1/qWmKwHBWy11nbe8qMWIxCfeR6u/YZP/6FIuOSSlgRCNPyk+BnY3kdnzeEIN3aw8VCvkZ7FRAqak=
X-Received: by 2002:a05:6122:887:b0:332:699e:7e67 with SMTP id
 7-20020a056122088700b00332699e7e67mr7482497vkf.35.1648328007397; Sat, 26 Mar
 2022 13:53:27 -0700 (PDT)
MIME-Version: 1.0
References: <20220326010003.3155137-1-yuzhao@google.com> <CAHk-=wjp=jEhjvD9GPnHfuV5Kc1=rUnf84b_qscLJ8fkY74u3Q@mail.gmail.com>
 <CAOUHufbqum18T4kZ=d_hMehz=N=3iSuNfGrLof5tB8kjGkk8yw@mail.gmail.com> <CAHk-=whbdpeeKbCYggJqfk0ExEPyxSW-yXSsNUqsGpd5ozt-Kg@mail.gmail.com>
In-Reply-To: <CAHk-=whbdpeeKbCYggJqfk0ExEPyxSW-yXSsNUqsGpd5ozt-Kg@mail.gmail.com>
From:   Yu Zhao <yuzhao@google.com>
Date:   Sat, 26 Mar 2022 14:53:16 -0600
Message-ID: <CAOUHufa8aDno3tSF3cuxCe2+FiuBG8gjBED=kAwY6PhkGfrkoQ@mail.gmail.com>
Subject: Re: [page-reclaim] Re: [GIT PULL] Multi-gen LRU for 5.18-rc1
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Andi Kleen <ak@linux.intel.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Aneesh Kumar <aneesh.kumar@linux.ibm.com>,
        Barry Song <baohua@kernel.org>,
        Brian Geffon <bgeffon@google.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Daniel Byrne <djbyrne@mtu.edu>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Donald Carr <d@chaos-reins.com>,
        Hillf Danton <hdanton@sina.com>,
        =?UTF-8?Q?Holger_Hoffst=C3=A4tte?= <holger@applied-asynchrony.com>,
        Jan Alexander Steffens <heftig@archlinux.org>,
        Jens Axboe <axboe@kernel.dk>,
        Jesse Barnes <jsbarnes@google.com>,
        Johannes Weiner <hannes@cmpxchg.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Konstantin Kharlamov <Hi-Angel@yandex.ru>,
        Matthew Wilcox <willy@infradead.org>,
        Mel Gorman <mgorman@suse.de>,
        Michael Larabel <Michael@michaellarabel.com>,
        Michal Hocko <mhocko@kernel.org>,
        Mike Rapoport <rppt@kernel.org>,
        Oleksandr Natalenko <oleksandr@natalenko.name>,
        Rik van Riel <riel@surriel.com>,
        Shuang Zhai <szhai2@cs.rochester.edu>,
        Sofia Trinh <sofia.trinh@edi.works>,
        Steven Barrett <steven@liquorix.net>,
        Suleiman Souhlal <suleiman@google.com>,
        Vaibhav Jain <vaibhav@linux.ibm.com>,
        Vlastimil Babka <vbabka@suse.cz>,
        Will Deacon <will@kernel.org>,
        Ying Huang <ying.huang@intel.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux-MM <linux-mm@kvack.org>,
        Kernel Page Reclaim v2 <page-reclaim@google.com>,
        "the arch/x86 maintainers" <x86@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sat, Mar 26, 2022 at 2:28 PM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Fri, Mar 25, 2022 at 6:16 PM Yu Zhao <yuzhao@google.com> wrote:
> >
> > No. I could ask Stephen to see if he is willing to take this series. I
> > was hoping to go through Andrew since his tree is what most MM
> > developers test. I haven't heard from Andrew, so I assume he has no
> > strong opinion and I don't want to put him in a different position.
>
> So I'd definitely want to see this in linux-next for a while, which
> implies it's not ready for this merge window.

Thanks for the clear instructions. Will follow them.
