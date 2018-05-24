Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 5133A7D072
	for <lwn-linux-doc@archive.lwn.net>; Thu, 24 May 2018 17:47:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1030653AbeEXRqA (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 24 May 2018 13:46:00 -0400
Received: from aserp2130.oracle.com ([141.146.126.79]:55442 "EHLO
        aserp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1030394AbeEXRp6 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 24 May 2018 13:45:58 -0400
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
        by aserp2130.oracle.com (8.16.0.22/8.16.0.22) with SMTP id w4OHemAU109478;
        Thu, 24 May 2018 17:45:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2017-10-26;
 bh=tbB8TuG50cOSrOOKadBn/EKD46tSR/PLI+KmYDnlKXA=;
 b=CcfmnPGv+CGIabUI0lJTEAoQ4ZzBNhQzFsf/KnzMUI8BN9fRPRoB3zpiYGbHuzHoTdKD
 iUiJ7b1f1g9//6lbsEjNnl6fjgRjcnCNSC8iMNCgWMNmYawDMNGT6dOld4a2k1NW6qMS
 rMD06RcY7CIiUFDcbS4+2tOgx6i5/NH0Amw9NfiVyXiT8XlLSr9Q3jvP34T3ww2WAz4t
 d94ErM+wtw5Ceuj+AKCG5XD+1LGN58llt68N9g/N+Jn4wUaHwoZM1fKN7lQ/V/kL9KLq
 kILy0rOW32QFXHfWm/puj5L/0WxpFsl5F1nzUNdZomgmK6tb4JX2pAR1B4BvXJNX4c6b Ew== 
Received: from userv0021.oracle.com (userv0021.oracle.com [156.151.31.71])
        by aserp2130.oracle.com with ESMTP id 2j4nh7hjfy-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 24 May 2018 17:45:15 +0000
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
        by userv0021.oracle.com (8.14.4/8.14.4) with ESMTP id w4OHjC2l006477
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 24 May 2018 17:45:12 GMT
Received: from abhmp0007.oracle.com (abhmp0007.oracle.com [141.146.116.13])
        by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id w4OHjA3U008450;
        Thu, 24 May 2018 17:45:10 GMT
Received: from [192.168.1.164] (/50.38.38.67)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Thu, 24 May 2018 10:45:10 -0700
Subject: Re: [PATCH v2 0/7] mm: pages for hugetlb's overcommit may be able to
 charge to memcg
To:     TSUKADA Koutaro <tsukada@ascade.co.jp>,
        Michal Hocko <mhocko@kernel.org>
Cc:     Johannes Weiner <hannes@cmpxchg.org>,
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
From:   Mike Kravetz <mike.kravetz@oracle.com>
Message-ID: <4078bc2d-4aaf-cd1b-0145-5915e382852f@oracle.com>
Date:   Thu, 24 May 2018 10:45:08 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <af1a3050-7365-428a-dfb1-2f3da37dc9ff@ascade.co.jp>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Proofpoint-Virus-Version: vendor=nai engine=5900 definitions=8902 signatures=668700
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=919
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1711220000 definitions=main-1805240201
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 05/23/2018 09:26 PM, TSUKADA Koutaro wrote:
> 
> I do not know if it is really a strong use case, but I will explain my
> motive in detail. English is not my native language, so please pardon
> my poor English.
> 
> I am one of the developers for software that managing the resource used
> from user job at HPC-Cluster with Linux. The resource is memory mainly.
> The HPC-Cluster may be shared by multiple people and used. Therefore, the
> memory used by each user must be strictly controlled, otherwise the
> user's job will runaway, not only will it hamper the other users, it will
> crash the entire system in OOM.
> 
> Some users of HPC are very nervous about performance. Jobs are executed
> while synchronizing with MPI communication using multiple compute nodes.
> Since CPU wait time will occur when synchronizing, they want to minimize
> the variation in execution time at each node to reduce waiting times as
> much as possible. We call this variation a noise.
> 
> THP does not guarantee to use the Huge Page, but may use the normal page.

Note.  You do not want to use THP because "THP does not guarantee".

> This mechanism is one cause of variation(noise).
> 
> The users who know this mechanism will be hesitant to use THP. However,
> the users also know the benefits of the Huge Page's TLB hit rate
> performance, and the Huge Page seems to be attractive. It seems natural
> that these users are interested in HugeTLBfs, I do not know at all
> whether it is the right approach or not.
> 
> At the very least, our HPC system is pursuing high versatility and we
> have to consider whether we can provide it if users want to use HugeTLBfs.
> 
> In order to use HugeTLBfs we need to create a persistent pool, but in
> our use case sharing nodes, it would be impossible to create, delete or
> resize the pool.
> 
> One of the answers I have reached is to use HugeTLBfs by overcommitting
> without creating a pool(this is the surplus hugepage).

Using hugetlbfs overcommit also does not provide a guarantee.  Without
doing much research, I would say the failure rate for obtaining a huge
page via THP and hugetlbfs overcommit is about the same.  The most
difficult issue in both cases will be obtaining a "huge page" number of
pages from the buddy allocator.

I really do not think hugetlbfs overcommit will provide any benefit over
THP for your use case.  Also, new user space code is required to "fall back"
to normal pages in the case of hugetlbfs page allocation failure.  This
is not needed in the THP case.
-- 
Mike Kravetz
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
