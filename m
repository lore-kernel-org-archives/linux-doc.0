Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55343C433EF
	for <linux-doc@archiver.kernel.org>; Mon, 28 Mar 2022 13:47:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243447AbiC1NtR (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 28 Mar 2022 09:49:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53268 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242370AbiC1NtR (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 28 Mar 2022 09:49:17 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 0BB484E3AB
        for <linux-doc@vger.kernel.org>; Mon, 28 Mar 2022 06:47:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1648475256;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=upPLPBWyZnJnaDaesOEGnaSGwMR9qWYqjr9tyy5b2iI=;
        b=cYYP88tcOIPbaUWbY7d01JkRjQFjnuAu5qrSku1D1PVv0Cf1MLkyHKKQU5uDvzB51iSeqU
        rq0ip2TROTaQHkprHEstA7/W/A1FeVOBN2ifFQ8pU8MhIWO5R+/LMT5d9JZYKWdSbI1NsU
        1KHsepsc1YM4hHNJSPYp/82dzhlGnIY=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-522-3H4Hm70OMey4dbENsM6uVA-1; Mon, 28 Mar 2022 09:47:33 -0400
X-MC-Unique: 3H4Hm70OMey4dbENsM6uVA-1
Received: by mail-wr1-f70.google.com with SMTP id a17-20020a5d6cb1000000b00203f85a2ed9so4344591wra.7
        for <linux-doc@vger.kernel.org>; Mon, 28 Mar 2022 06:47:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=upPLPBWyZnJnaDaesOEGnaSGwMR9qWYqjr9tyy5b2iI=;
        b=0ptXMQJ+9nRDb6OXhfB0Oc0KU5fnRqkg92pxREXsX5MOgngoi+kfDl9t5S18JkIyEg
         K+osYnfdeM+C4mEuDlSW7JeSPJMihJdfaWYU+b7g2yAHb8FZHl8fAram7pIFZPensv5A
         Ui+zPZae+Cyx4kiY/6cyOP50BBQ3LW60/u7WbK+yL7ozGy605V13rhRKxtH2IRIEBKoo
         YSSk/5ApEHOqKhCSdFuK6wQDRJk52IkverFqPqZlLapCGZ5y2dFsMIX6kVZ1M+mEbL2X
         BBazHKeuC/j7SKDlING8R02zWPgHOgzjozdEJN9jHhv2CSVUOf8l5Xs6eukD+DYE1oe9
         D7Cw==
X-Gm-Message-State: AOAM5305a6iGoO7bj1pgLj5swyDGJ8xgMPghDrxF5kAuyrdLtLo9P44f
        IyG0MuwjnncUVBh66kErZcfTwu5Bc9mIduKUFSNihIOBk1xYYCyRquQjwEUW+Cju9p81NOWmVdr
        oUtjgZJ57ssSD8eKoJyOG
X-Received: by 2002:a05:600c:4f46:b0:38c:d4cd:ee31 with SMTP id m6-20020a05600c4f4600b0038cd4cdee31mr23930332wmq.16.1648475252682;
        Mon, 28 Mar 2022 06:47:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwxoK+tzHkV68lkc8leXnZUz8lWiwrIHpb4NjUHncSUU386GL1+Cxe87sNc+LG0TStZQtOM9Q==
X-Received: by 2002:a05:600c:4f46:b0:38c:d4cd:ee31 with SMTP id m6-20020a05600c4f4600b0038cd4cdee31mr23930259wmq.16.1648475252354;
        Mon, 28 Mar 2022 06:47:32 -0700 (PDT)
Received: from ?IPV6:2003:cb:c704:2200:50d1:ff5c:5927:203a? (p200300cbc704220050d1ff5c5927203a.dip0.t-ipconnect.de. [2003:cb:c704:2200:50d1:ff5c:5927:203a])
        by smtp.gmail.com with ESMTPSA id c4-20020a056000184400b0020584c40778sm13128032wri.103.2022.03.28.06.47.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Mar 2022 06:47:31 -0700 (PDT)
Message-ID: <e1d399da-bebd-062d-aaff-ace3fd542c3f@redhat.com>
Date:   Mon, 28 Mar 2022 15:47:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [page-reclaim] Re: [GIT PULL] Multi-gen LRU for 5.18-rc1
Content-Language: en-US
To:     Matthew Wilcox <willy@infradead.org>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Yu Zhao <yuzhao@google.com>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Andi Kleen <ak@linux.intel.com>,
        Aneesh Kumar <aneesh.kumar@linux.ibm.com>,
        Barry Song <baohua@kernel.org>,
        Brian Geffon <bgeffon@google.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Daniel Byrne <djbyrne@mtu.edu>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Donald Carr <d@chaos-reins.com>,
        Hillf Danton <hdanton@sina.com>,
        =?UTF-8?Q?Holger_Hoffst=c3=a4tte?= <holger@applied-asynchrony.com>,
        Jan Alexander Steffens <heftig@archlinux.org>,
        Jens Axboe <axboe@kernel.dk>,
        Jesse Barnes <jsbarnes@google.com>,
        Johannes Weiner <hannes@cmpxchg.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Konstantin Kharlamov <Hi-Angel@yandex.ru>,
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
        the arch/x86 maintainers <x86@kernel.org>
References: <20220326010003.3155137-1-yuzhao@google.com>
 <CAHk-=wjp=jEhjvD9GPnHfuV5Kc1=rUnf84b_qscLJ8fkY74u3Q@mail.gmail.com>
 <CAOUHufbqum18T4kZ=d_hMehz=N=3iSuNfGrLof5tB8kjGkk8yw@mail.gmail.com>
 <20220326134928.ad739eeecd5d0855dbdc6257@linux-foundation.org>
 <400edaab-7c6c-f4d1-9a94-e8d0803857fa@redhat.com>
 <YkG7mD8kT0uAk3Iy@casper.infradead.org>
From:   David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <YkG7mD8kT0uAk3Iy@casper.infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 28.03.22 15:43, Matthew Wilcox wrote:
> On Mon, Mar 28, 2022 at 02:29:20PM +0200, David Hildenbrand wrote:
>> I'd appreciate if we could merge most MM-related stuff through the -MM
>> tree; it exists for a reason IMHO. Andrew, you usually have a very good
>> feeling when something's ready to be merged upstream (sufficient review
>> from relevant folks, sufficient exposure via -mm and -next, ...).
> 
> The problem is that the MM tree is completely unusable when patches going
> in through other trees need to be based on it.  The MM workflow clearly
> works well for Andrew, but it doesn't work well for us as a community.
> 
> Fortunately folios is past that point now, but I fear that maple tree
> will get to that point if it doesn't go in through Andrew's tree this
> cycle, as it may have other users.

Yes, there are most certainly special cases, like folios and eventually
like the maple tree rework. But I consider these exceptions to the
general rule. And the exceptions should follow the same ACKing/review
process as other -MM stuff, as Linus nicely identified here.

-- 
Thanks,

David / dhildenb

