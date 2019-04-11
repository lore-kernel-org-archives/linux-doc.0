Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 459007D04D
	for <lwn-linux-doc@archive.lwn.net>; Thu, 11 Apr 2019 14:38:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726644AbfDKOiJ (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 11 Apr 2019 10:38:09 -0400
Received: from relay.sw.ru ([185.231.240.75]:39876 "EHLO relay.sw.ru"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726585AbfDKOiJ (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 11 Apr 2019 10:38:09 -0400
Received: from [172.16.25.169]
        by relay.sw.ru with esmtp (Exim 4.91)
        (envelope-from <ktkhai@virtuozzo.com>)
        id 1hEapr-0002mK-Np; Thu, 11 Apr 2019 17:37:51 +0300
Subject: Re: [RFC PATCH 0/2] mm/memcontrol: Finer-grained memory control
To:     Waiman Long <longman@redhat.com>, Tejun Heo <tj@kernel.org>,
        Li Zefan <lizefan@huawei.com>,
        Johannes Weiner <hannes@cmpxchg.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Michal Hocko <mhocko@kernel.org>,
        Vladimir Davydov <vdavydov.dev@gmail.com>
Cc:     linux-kernel@vger.kernel.org, cgroups@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-mm@kvack.org,
        Andrew Morton <akpm@linux-foundation.org>,
        Roman Gushchin <guro@fb.com>,
        Shakeel Butt <shakeelb@google.com>,
        Aaron Lu <aaron.lu@intel.com>, aryabinin@virtuozzo.com
References: <20190410191321.9527-1-longman@redhat.com>
From:   Kirill Tkhai <ktkhai@virtuozzo.com>
Message-ID: <1b6ee304-6176-15a0-c3fa-0b59cdd60085@virtuozzo.com>
Date:   Thu, 11 Apr 2019 17:37:51 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190410191321.9527-1-longman@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 10.04.2019 22:13, Waiman Long wrote:
> The current control mechanism for memory cgroup v2 lumps all the memory
> together irrespective of the type of memory objects. However, there
> are cases where users may have more concern about one type of memory
> usage than the others.
> 
> We have customer request to limit memory consumption on anonymous memory
> only as they said the feature was available in other OSes like Solaris.
> 
> To allow finer-grained control of memory, this patchset 2 new control
> knobs for memory controller:
>  - memory.subset.list for specifying the type of memory to be under control.
>  - memory.subset.high for the high limit of memory consumption of that
>    memory type.
> 
> For simplicity, the limit is not hierarchical and applies to only tasks
> in the local memory cgroup.
> 
> Waiman Long (2):
>   mm/memcontrol: Finer-grained control for subset of allocated memory
>   mm/memcontrol: Add a new MEMCG_SUBSET_HIGH event
> 
>  Documentation/admin-guide/cgroup-v2.rst |  35 +++++++++
>  include/linux/memcontrol.h              |   8 ++
>  mm/memcontrol.c                         | 100 +++++++++++++++++++++++-
>  3 files changed, 142 insertions(+), 1 deletion(-)

CC Andrey.

In Virtuozzo kernel we have similar functionality for limitation of page cache in a cgroup:

https://github.com/OpenVZ/vzkernel/commit/8ceef5e0c07c7621fcb0e04ccc48a679dfeec4a4
