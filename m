Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 899787D072
	for <lwn-linux-doc@archive.lwn.net>; Fri, 25 May 2018 01:56:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1754999AbeEYB4V (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 24 May 2018 21:56:21 -0400
Received: from ext-host0001.ascade.co.jp ([218.224.228.194]:63543 "EHLO
        ns.ascade.co.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754765AbeEYB4S (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 24 May 2018 21:56:18 -0400
Received: from server0001.ascade.co.jp (server0001.ascade.co.jp [10.1.1.63])
        by ns.ascade.co.jp (Postfix) with ESMTP id EFDB4A0021;
        Fri, 25 May 2018 10:56:16 +0900 (JST)
Received: from [IPv6:::1] (server0001.ascade.co.jp [10.1.1.63])
        by server0001.ascade.co.jp (Postfix) with ESMTP id 94106100512;
        Fri, 25 May 2018 10:56:15 +0900 (JST)
Subject: Re: [PATCH v2 0/7] mm: pages for hugetlb's overcommit may be able to
 charge to memcg
To:     Mike Kravetz <mike.kravetz@oracle.com>
Cc:     Michal Hocko <mhocko@kernel.org>,
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
 <20180522135148.GA20441@dhcp22.suse.cz>
 <af1a3050-7365-428a-dfb1-2f3da37dc9ff@ascade.co.jp>
 <4078bc2d-4aaf-cd1b-0145-5915e382852f@oracle.com>
From:   TSUKADA Koutaro <tsukada@ascade.co.jp>
Message-ID: <5943db59-1c33-7004-7574-fc07e577e1ee@ascade.co.jp>
Date:   Fri, 25 May 2018 10:55:58 +0900
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <4078bc2d-4aaf-cd1b-0145-5915e382852f@oracle.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 2018/05/25 2:45, Mike Kravetz wrote:
[...]
>> THP does not guarantee to use the Huge Page, but may use the normal page.
> 
> Note.  You do not want to use THP because "THP does not guarantee".

[...]
>> One of the answers I have reached is to use HugeTLBfs by overcommitting
>> without creating a pool(this is the surplus hugepage).
> 
> Using hugetlbfs overcommit also does not provide a guarantee.  Without
> doing much research, I would say the failure rate for obtaining a huge
> page via THP and hugetlbfs overcommit is about the same.  The most
> difficult issue in both cases will be obtaining a "huge page" number of
> pages from the buddy allocator.

Yes. If do not support multiple size hugetlb pages such as x86, because
number of pages between THP and hugetlb is same, the failure rate of
obtaining a compound page is same, as you said.

> I really do not think hugetlbfs overcommit will provide any benefit over
> THP for your use case.

I think that what you say is absolutely right.

>  Also, new user space code is required to "fall back"
> to normal pages in the case of hugetlbfs page allocation failure.  This
> is not needed in the THP case.

I understand the superiority of THP, but there are scenes where khugepaged
occupies cpu due to page fragmentation. Instead of overcommit, setup a
persistent pool once, I think that hugetlb can be superior, such as memory
allocation performance exceeding THP. I will try to find a good way to use
hugetlb page.

I sincerely thank you for your help.

-- 
Thanks,
Tsukada

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
