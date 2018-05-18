Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id F1EFF7D048
	for <lwn-linux-doc@archive.lwn.net>; Fri, 18 May 2018 04:42:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751184AbeEREmR (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 18 May 2018 00:42:17 -0400
Received: from ext-host0001.ascade.co.jp ([218.224.228.194]:61330 "EHLO
        ns.ascade.co.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750959AbeEREmQ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 18 May 2018 00:42:16 -0400
Received: from server0001.ascade.co.jp (server0001.ascade.co.jp [10.1.1.63])
        by ns.ascade.co.jp (Postfix) with ESMTP id DA91B993D0;
        Fri, 18 May 2018 13:32:47 +0900 (JST)
Received: from [IPv6:::1] (server0001.ascade.co.jp [10.1.1.63])
        by server0001.ascade.co.jp (Postfix) with ESMTP id 8F36A1004E1;
        Fri, 18 May 2018 13:32:46 +0900 (JST)
Subject: [PATCH v2 2/7] hugetlb: support migrate charging for surplus
 hugepages
To:     Johannes Weiner <hannes@cmpxchg.org>,
        Michal Hocko <mhocko@kernel.org>,
        Vladimir Davydov <vdavydov.dev@gmail.com>,
        Jonathan Corbet <corbet@lwn.net>,
        "Luis R. Rodriguez" <mcgrof@kernel.org>,
        Kees Cook <keescook@chromium.org>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Roman Gushchin <guro@fb.com>,
        David Rientjes <rientjes@google.com>,
        Mike Kravetz <mike.kravetz@oracle.com>,
        "Aneesh Kumar K.V" <aneesh.kumar@linux.vnet.ibm.com>,
        Naoya Horiguchi <n-horiguchi@ah.jp.nec.com>,
        Anshuman Khandual <khandual@linux.vnet.ibm.com>,
        Marc-Andre Lureau <marcandre.lureau@redhat.com>,
        Punit Agrawal <punit.agrawal@arm.com>,
        Dan Williams <dan.j.williams@intel.com>,
        Vlastimil Babka <vbabka@suse.cz>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
        linux-mm@kvack.org, cgroups@vger.kernel.org, tsukada@ascade.co.jp
References: <e863529b-7ce5-4fbe-8cff-581b5789a5f9@ascade.co.jp>
From:   TSUKADA Koutaro <tsukada@ascade.co.jp>
Message-ID: <48877585-85de-ad4b-6b35-8e6dd24a43c0@ascade.co.jp>
Date:   Fri, 18 May 2018 13:32:41 +0900
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <e863529b-7ce5-4fbe-8cff-581b5789a5f9@ascade.co.jp>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Surplus hugepages allocated for migration also charge to memory cgroup.

Signed-off-by: TSUKADA Koutaro <tsukada@ascade.co.jp>
---
 hugetlb.c |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index 679c151f..2e7b543 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -1687,6 +1687,8 @@ static struct page *alloc_migrate_huge_page(struct hstate *h, gfp_t gfp_mask,
 	if (!page)
 		return NULL;

+	surplus_hugepage_set_charge(h, page);
+
 	/*
 	 * We do not account these pages as surplus because they are only
 	 * temporary and will be released properly on the last reference

-- 
Tsukada

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
