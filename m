Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AA4DECAAA1
	for <linux-doc@archiver.kernel.org>; Thu, 15 Sep 2022 17:56:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229838AbiIOR4l (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 15 Sep 2022 13:56:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229940AbiIOR4k (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 15 Sep 2022 13:56:40 -0400
Received: from mail-vs1-xe2d.google.com (mail-vs1-xe2d.google.com [IPv6:2607:f8b0:4864:20::e2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C44D7538D
        for <linux-doc@vger.kernel.org>; Thu, 15 Sep 2022 10:56:39 -0700 (PDT)
Received: by mail-vs1-xe2d.google.com with SMTP id c3so20130588vsc.6
        for <linux-doc@vger.kernel.org>; Thu, 15 Sep 2022 10:56:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=6R15UDYWCPlv8CkuUmhLYYnCsk3TgroblTtGcqD+OxI=;
        b=hv19UOihN1HQFux+vxC38XY8F2OZ/wbKgvNlfGEXlGZS0UsbNwXyrjIXKpKkAufId2
         w9j17Ofze2/94oPXDcBS5R/IrGvAUBhb172PMBmCUs28VGVdgEoxtvLA9Jxv4cmXJsYu
         LVuMTOrWqLcVUQbWJES0pKlEO4B1QK24xqTuo4XmrKUz81MWiISd1IwI2MBhVysQvmHO
         qY5XVzSrakxQ5lvg3OxJhNoSa4zFy0uBvr62rbfYg5OEROA1AziUU8PNGkqHFVSmbOVE
         md5NCH8LcDTye5nFr9brK4Y1ZwRf6UyNFLiZLhCtoDTLq3UJSxT1YfPaVX46p6sKZhsz
         xneA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=6R15UDYWCPlv8CkuUmhLYYnCsk3TgroblTtGcqD+OxI=;
        b=j4vYvOTm8HvnEO6zsZRt02Klkoo07Js6MtSbJ1scBi/zYgqd+FshaWKH7c3UITUMA/
         o0aCgLavulhZ7v8t2meAA8jZ5i6aH5hPVNRfcV1113FGXIZVl+MAr4MKAlCUr1+xRG20
         4w5Lu66DF2I9dE4sOAlKJHbKglreyjLhzhn/CKLA8719EsU0l2wz+945XHOoYXS6c1HS
         nXls5it5Aiym6+xzuOA9MR2wLbYq3HTeI0J1SUduVUOD2ZSRIHwIUMUre2kBmOKol5yP
         wcWjvWlQudQJp/sNsKYltkA3FImMPWiDdumNXlvqdOlYuFyl26nF+YbTZpnl0NiF9APt
         lMmg==
X-Gm-Message-State: ACrzQf2WuHDRgv4O4fP3OjyY2xVg9kPuiDywv9+xIN0O5AZSt91fN/Yv
        NvOVdkVpoh9BV9CaX3YFTbU5NkDbE4KlpHQPu7xIjw==
X-Google-Smtp-Source: AMsMyM6ljPOdRxZyAfL+Hv948pFu9ioMk+dFDU/D3NwzG7Itx8/f/6hSSSORm2EOreZJeGJFGzUSB4vUEORHPkMDreM=
X-Received: by 2002:a67:1d83:0:b0:398:928e:3b94 with SMTP id
 d125-20020a671d83000000b00398928e3b94mr621843vsd.46.1663264598547; Thu, 15
 Sep 2022 10:56:38 -0700 (PDT)
MIME-Version: 1.0
References: <20220815071332.627393-1-yuzhao@google.com> <20220911170814.f6a32b40e64397a61b1f8daf@linux-foundation.org>
In-Reply-To: <20220911170814.f6a32b40e64397a61b1f8daf@linux-foundation.org>
From:   Yu Zhao <yuzhao@google.com>
Date:   Thu, 15 Sep 2022 11:56:02 -0600
Message-ID: <CAOUHufZk-u0S+FyDEdxw1nehBKz_G_GG_3_LAzqyssx21Wd4Jw@mail.gmail.com>
Subject: Re: [PATCH v14 00/14] Multi-Gen LRU Framework
To:     Andrew Morton <akpm@linux-foundation.org>
Cc:     Andi Kleen <ak@linux.intel.com>,
        Aneesh Kumar <aneesh.kumar@linux.ibm.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Hillf Danton <hdanton@sina.com>, Jens Axboe <axboe@kernel.dk>,
        Johannes Weiner <hannes@cmpxchg.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Matthew Wilcox <willy@infradead.org>,
        Mel Gorman <mgorman@suse.de>,
        Michael Larabel <Michael@michaellarabel.com>,
        Michal Hocko <mhocko@kernel.org>,
        Mike Rapoport <rppt@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Tejun Heo <tj@kernel.org>, Vlastimil Babka <vbabka@suse.cz>,
        Will Deacon <will@kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Linux-MM <linux-mm@kvack.org>,
        "the arch/x86 maintainers" <x86@kernel.org>,
        Kernel Page Reclaim v2 <page-reclaim@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sun, Sep 11, 2022 at 6:08 PM Andrew Morton <akpm@linux-foundation.org> wrote:
>
> I'd like to move mglru into the mm-stable branch late this week.
>
> I'm not terribly happy about the level of review nor the carefulness of
> the code commenting (these things are related) and I have a note here
> that "mm: multi-gen LRU: admin guide" is due for an update and everyone
> is at conference anyway.  But let's please try to push things along anyway.

Thanks for the heads-up. Will add as many comments as I can and wrap
it up by the end of tomorrow.
