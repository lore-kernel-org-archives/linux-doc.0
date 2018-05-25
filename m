Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 6276E7D072
	for <lwn-linux-doc@archive.lwn.net>; Fri, 25 May 2018 01:54:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S965335AbeEYBwN (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 24 May 2018 21:52:13 -0400
Received: from ext-host0001.ascade.co.jp ([218.224.228.194]:63519 "EHLO
        ns.ascade.co.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S935594AbeEYBwL (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 24 May 2018 21:52:11 -0400
Received: from server0001.ascade.co.jp (server0001.ascade.co.jp [10.1.1.63])
        by ns.ascade.co.jp (Postfix) with ESMTP id 8563EA0021;
        Fri, 25 May 2018 10:52:09 +0900 (JST)
Received: from [IPv6:::1] (server0001.ascade.co.jp [10.1.1.63])
        by server0001.ascade.co.jp (Postfix) with ESMTP id 1DD10100512;
        Fri, 25 May 2018 10:52:08 +0900 (JST)
Subject: Re: [PATCH v2 0/7] mm: pages for hugetlb's overcommit may be able to
 charge to memcg
To:     Michal Hocko <mhocko@kernel.org>
Cc:     Mike Kravetz <mike.kravetz@oracle.com>,
        Johannes Weiner <hannes@cmpxchg.org>,
        Vladimir Davydov <vdavydov.dev@gmail.com>,
        Jonathan Corbet <corbet@lwn.net>,
        "Luis R. Rodriguez" <mcgrof@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Roman Gushchin <guro@fb.com>,
        David Rientjes <rientjes@google.com>,
        "Aneesh Kumar K.V" <aneesh.kumar@linux.vnet.ibm.com>,
        Naoya Horiguchi <n-horiguchi@ah.jp.nec.com>,
        Anshuman Khandual <khandual@linux.vnet.ibm.com>,
        Marc-Andre Lureau <marcandre.lureau@redhat.com>,
        Punit Agrawal <punit.agrawal@arm.com>,
        Dan Williams <dan.j.williams@intel.com>,
        Vlastimil Babka <vbabka@suse.cz>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
        linux-mm@kvack.org, cgroups@vger.kernel.org
References: <e863529b-7ce5-4fbe-8cff-581b5789a5f9@ascade.co.jp>
 <240f1b14-ed7d-4983-6c52-be4899d4caa5@oracle.com>
 <8711fed5-fc35-a11a-3a17-740a9dca1f2a@ascade.co.jp>
 <20180522185407.GC20441@dhcp22.suse.cz>
 <455b1a07-d7e3-102b-65e7-3892947b7675@ascade.co.jp>
 <20180524082044.GW20441@dhcp22.suse.cz>
 <b2afbff6-b59f-7105-3808-64d41bd4a3a8@ascade.co.jp>
 <20180524132414.GI20441@dhcp22.suse.cz>
From:   TSUKADA Koutaro <tsukada@ascade.co.jp>
Message-ID: <504b1ca0-9030-29be-4657-9cc18575eacb@ascade.co.jp>
Date:   Fri, 25 May 2018 10:51:50 +0900
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <20180524132414.GI20441@dhcp22.suse.cz>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 2018/05/24 22:24, Michal Hocko wrote
[...]> I do not see anything like that. adjust_pool_surplus is simply and
> accounting thing. At least the last time I've checked. Maybe your
> patchset handles that?

As you said, my patch did not consider handling when manipulating the
pool. And even if that handling is done well, it will not be a valid
reason to charge surplus hugepage to memcg.

[...]
>> Absolutely you are saying the right thing, but, for example, can mlock(2)ed
>> pages be swapped out by reclaim?(What is the difference between mlock(2)ed
>> pages and hugetlb page?)
> 
> No mlocked pages cannot be reclaimed and that is why we restrict them to
> a relatively small amount.

I understood the concept of memcg.

[...]
> Fatal? Not sure. It simply tries to add an alien memory to the memcg
> concept so I would pressume an unexpected behavior (e.g. not being able
> to reclaim memcg or, over reclaim, trashing etc.).

As you said, it must be an alien. Thanks to the interaction up to here,
I understood that my solution is inappropriate. I will look for another
way.

Thank you for your kind explanation.

-- 
Thanks,
Tsukada


--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
