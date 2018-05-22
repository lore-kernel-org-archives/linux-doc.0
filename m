Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 547557D062
	for <lwn-linux-doc@archive.lwn.net>; Tue, 22 May 2018 20:29:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1752658AbeEVU3U (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 22 May 2018 16:29:20 -0400
Received: from aserp2130.oracle.com ([141.146.126.79]:53974 "EHLO
        aserp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751601AbeEVU3T (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 22 May 2018 16:29:19 -0400
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
        by aserp2130.oracle.com (8.16.0.22/8.16.0.22) with SMTP id w4MKPi2T057119;
        Tue, 22 May 2018 20:28:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2017-10-26;
 bh=nejuSqe2DUTcwHUGYJa1QQhWa0q7LOwFVJP5QjpN7ek=;
 b=J+ObywwCY6k93UmaPVod27GNGoAUtZGL/E1Br+vXqpC/QsJ2VdgAJ+kVbeCgDD8TAY+A
 O6rFAV3Q2JeygMPmHuK/pRSaDs0ZxWTjkJQlME6qZ6I7D5M/Cce95AaSOCYW+9Akb0Rt
 W8F58JuZP1a1dJZcOzWv7dc+fgVd7zuVsRHXIuqJBUBKN3aayIBTrYBqng34Ykpz6qfW
 Zfjit6kZ/ieJ9gYOGxnPfsdpv4ho+gCpjiN3BYcjrpYsvf0NPaGJUVFjaKP6tV90MOOt
 CzAn6FLdpiIMSbxyKlOpYwBjWSMguVN2rwiC9LijnNHv8WvTdkOEo6ufW31SkNO1f+NK PA== 
Received: from userv0022.oracle.com (userv0022.oracle.com [156.151.31.74])
        by aserp2130.oracle.com with ESMTP id 2j4nh79b44-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 22 May 2018 20:28:36 +0000
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
        by userv0022.oracle.com (8.14.4/8.14.4) with ESMTP id w4MKSYLb002725
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 22 May 2018 20:28:34 GMT
Received: from abhmp0016.oracle.com (abhmp0016.oracle.com [141.146.116.22])
        by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id w4MKSWJw005572;
        Tue, 22 May 2018 20:28:32 GMT
Received: from [192.168.1.164] (/50.38.38.67)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Tue, 22 May 2018 13:28:32 -0700
Subject: Re: [PATCH v2 0/7] mm: pages for hugetlb's overcommit may be able to
 charge to memcg
To:     TSUKADA Koutaro <tsukada@ascade.co.jp>
Cc:     Johannes Weiner <hannes@cmpxchg.org>,
        Michal Hocko <mhocko@kernel.org>,
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
From:   Mike Kravetz <mike.kravetz@oracle.com>
Message-ID: <5c32a05e-da2e-84b8-3435-4cd5f8a1f0f9@oracle.com>
Date:   Tue, 22 May 2018 13:28:30 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <8711fed5-fc35-a11a-3a17-740a9dca1f2a@ascade.co.jp>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Proofpoint-Virus-Version: vendor=nai engine=5900 definitions=8901 signatures=668700
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=2 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=677
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1711220000 definitions=main-1805220211
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 05/22/2018 06:04 AM, TSUKADA Koutaro wrote:
> 
> I stared at the commit log of mm/hugetlb_cgroup.c, but it did not seem to
> have specially considered of surplus hugepages. Later, I will send a mail
> to hugetlb cgroup's committer to ask about surplus hugepages charge
> specifications.
> 

I went back and looked at surplus huge page allocation.  Previously, I made
a statement that the hugetlb controller accounts for surplus huge pages.
Turns out that may not be 100% correct.

Thanks to Michal, all surplus huge page allocation is performed via the
alloc_surplus_huge_page() routine.  This will ultimately call into the
buddy allocator without any cgroup charges.  Calls to alloc_surplus_huge_page
are made from:
- alloc_huge_page() when allocating a huge page to a mapping/file.  In this
  case, appropriate calls to the hugetlb controller are in place.  So, any
  limits are enforced here.
- gather_surplus_pages() when allocating and setting aside 'reserved' huge
  pages. No accounting is performed here.  Do note that in this case the
  allocated huge pages are not assigned to the mapping/file.  Even though
  'reserved', they are deposited into the global pool and also counted as
  'free'.  When these reserved pages are ultimately used to populate a
  file/mapping, the code path goes through alloc_huge_page() where appropriate
  calls to the hugetlb controller are in place.

So, the bottom line is that surplus huge pages are not accounted for when
they are allocated as 'reserves'.  It is not until these reserves are actually
used that accounting limits are checked.  This 'seems' to align with general
allocation of huge pages within the pool.  No accounting is done until they
are actually allocated to a mapping/file.

-- 
Mike Kravetz
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
