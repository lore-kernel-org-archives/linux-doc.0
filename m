Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FE0CC433F5
	for <linux-doc@archiver.kernel.org>; Tue, 21 Sep 2021 15:04:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1A9A5610A0
	for <linux-doc@archiver.kernel.org>; Tue, 21 Sep 2021 15:04:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233893AbhIUPGP (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 21 Sep 2021 11:06:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50589 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233840AbhIUPGP (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 21 Sep 2021 11:06:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1632236686;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=2x5rqD0I1Z8EQgTGoic1TcC/yhS9DgiwB+H8dUYgCd0=;
        b=g5CkODU5Q9Vwn45lgZzyLNfHXzeqUXK9OHsz5/l8HYxLpfdoeMXPwkwYfUkk19hF+a6EoZ
        GmHKT0nrs/unbtWboGmx/3weLyy48AOQujl9g704NTc35D2CHnFhw4VJOuYXYRyqaSipel
        rdATN1PlG3+XXVxfb4k+L1gxV35nGWw=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-174-FY-IhWZCOhK5D2uWvCmsKQ-1; Tue, 21 Sep 2021 11:04:45 -0400
X-MC-Unique: FY-IhWZCOhK5D2uWvCmsKQ-1
Received: by mail-qt1-f199.google.com with SMTP id o7-20020ac86d07000000b002a69537d614so89991308qtt.21
        for <linux-doc@vger.kernel.org>; Tue, 21 Sep 2021 08:04:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=2x5rqD0I1Z8EQgTGoic1TcC/yhS9DgiwB+H8dUYgCd0=;
        b=NCYTD3WGm1nDXtI2y1PtLo4wH7KzrjxrnP3snxHK9TqipPQ3LORjl52MZh2VxbFpzq
         SZijC2PZup/0XAt7maYGgBHCAk8hn8Wf5PEyZemizJw2ndX7Q7bv/i5fYlSXBJ39SPVr
         bYT23JYxKacuZpfwR1k0tkxkTg8PNFwZLsQYGfJzucJU9RKQehNU4ITh5lbkxmjUlvAo
         SA7DLiKMtL7+yOJDWU7db/iIxwzVH6+l9bfTHXB/s3xT21dyLuCnN+cfN9zp0kvTnbIZ
         1uGi1V51SjNQIh5ekUn1InV1INQ4q0pVR8CAYqPceVmcujftJs0CbX1idN8boOxvWtBl
         m7oA==
X-Gm-Message-State: AOAM530qQ+s0fAXwZ42A2vHQGZqYW2dHmv71Epp0ayllctyo0APtJYi+
        sscJonhajyD/82bK9BrMrVN/SSpvb2Ov3Zs3dLE1eylzhi7JqLzj5uFbhqWXxKZAbhRy3Dn0kdM
        BOuB8HyCfwrgrjxBOMXRD
X-Received: by 2002:a37:bfc6:: with SMTP id p189mr30693098qkf.33.1632236684763;
        Tue, 21 Sep 2021 08:04:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx8U6vZ7gnxEMCR81lmgXlrbyrYpmkZLoTOiSc+Z8PManocp5D4HOKaV68dPRX4Kc12+vjS/g==
X-Received: by 2002:a37:bfc6:: with SMTP id p189mr30693063qkf.33.1632236684470;
        Tue, 21 Sep 2021 08:04:44 -0700 (PDT)
Received: from t490s ([2607:fea8:56a2:9100::d3ec])
        by smtp.gmail.com with ESMTPSA id g17sm379283qkm.60.2021.09.21.08.04.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Sep 2021 08:04:43 -0700 (PDT)
Date:   Tue, 21 Sep 2021 11:04:42 -0400
From:   Peter Xu <peterx@redhat.com>
To:     Tiberiu Georgescu <tiberiu.georgescu@nutanix.com>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Jonathan Corbet <corbet@lwn.net>,
        "david@redhat.com" <david@redhat.com>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        "linux-mm@kvack.org" <linux-mm@kvack.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Ivan Teterevkov <ivan.teterevkov@nutanix.com>,
        Florian Schmidt <flosch@nutanix.com>,
        "Carl Waldspurger [C]" <carl.waldspurger@nutanix.com>,
        Jonathan Davies <jond@nutanix.com>
Subject: Re: [PATCH v2 1/1] Documentation: update pagemap with shmem
 exceptions
Message-ID: <YUn0ikP4Gip3Yc6L@t490s>
References: <20210920164931.175411-1-tiberiu.georgescu@nutanix.com>
 <20210920164931.175411-2-tiberiu.georgescu@nutanix.com>
 <YUjb91tWhd/YAgQW@t490s>
 <F6A49621-C7A4-4643-95C2-F47B02F132D2@nutanix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <F6A49621-C7A4-4643-95C2-F47B02F132D2@nutanix.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi, Tiberiu,

On Tue, Sep 21, 2021 at 08:52:32AM +0000, Tiberiu Georgescu wrote:
> I tested it some more, and it still looks like the mincore() syscall considers pages
> in the swap cache as "in memory". This is how I tested:
> 
> 1. Create a cgroup with 1M limit_in_bytes, and allow swapping
> 2. mmap 1024 pages (both shared and private present the same behaviour)
> 3. write to all pages in order
> 4. compare mincore output with pagemap output
> 
> This is an example of a usual mincore output in this scenario, shortened for
> coherency (4x8 instead of 16x64):
> 00000000
> 00000000
> 00001110   <- this bugs me
> 01111111
> 
> The last 7 bits are definitely marking pages present in memory, but there are
> some other bits set a little earlier. When comparing this output with the pagemap,
> indeed, there are 7 consecutive pages present, and the rest of them are
> swapped, including those 3 which are marked as present by mincore.
> At this point, I can only assume the bits in between are on the swap cache.
> 
> If you have another explanation, please share it with me. In the meanwhile,
> I will rework the doc patch, and see if there is any other way to differentiate
> clearly between the three types of pages. If not, I guess we'll stick to
> mincore() and a best-effort 5th step.

IIUC it could be because of that the pages are still in swap cache, so
mincore() will return 1 for them too.

What swap device are you using?  I'm wildly guessing you're not using frontswap
like zram.  If that's the case, would you try zram?  That should flush the page
synchronously iiuc, then all the "suspecious 1s" will go away above.

To do that, you may need to firstly turn off your current swap:

        # swapoff -a

Then to configure zram you need:

        # modprobe zram
        # echo 4G > /sys/block/zram0/disksize
        # mkswap --label zram0 /dev/zram0
        # swapon --priority 100 /dev/zram0

Quotting from here:

        https://wiki.archlinux.org/title/Improving_performance#zram_or_zswap

Then you can try run the same test program again.

Thanks,

-- 
Peter Xu

