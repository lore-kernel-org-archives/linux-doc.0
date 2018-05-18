Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 422987D048
	for <lwn-linux-doc@archive.lwn.net>; Fri, 18 May 2018 04:34:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1750977AbeEREey (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 18 May 2018 00:34:54 -0400
Received: from ext-host0001.ascade.co.jp ([218.224.228.194]:61252 "EHLO
        ns.ascade.co.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750838AbeEREex (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 18 May 2018 00:34:53 -0400
X-Greylist: delayed 423 seconds by postgrey-1.27 at vger.kernel.org; Fri, 18 May 2018 00:34:52 EDT
Received: from server0001.ascade.co.jp (server0001.ascade.co.jp [10.1.1.63])
        by ns.ascade.co.jp (Postfix) with ESMTP id BAB3C993D1;
        Fri, 18 May 2018 13:34:51 +0900 (JST)
Received: from [IPv6:::1] (server0001.ascade.co.jp [10.1.1.63])
        by server0001.ascade.co.jp (Postfix) with ESMTP id 08ED81004E1;
        Fri, 18 May 2018 13:34:42 +0900 (JST)
Subject: [PATCH v2 3/7] memcg: use compound_order rather than hpage_nr_pages
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
Message-ID: <262267fe-d98c-0b25-9013-3dafb52e8679@ascade.co.jp>
Date:   Fri, 18 May 2018 13:34:26 +0900
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

The current memcg implementation assumes that the compound page is THP.
In order to be able to charge surplus hugepage, we use compound_order.

Signed-off-by: TSUKADA Koutaro <tsukada@ascade.co.jp>
---
 memcontrol.c |   10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/mm/memcontrol.c b/mm/memcontrol.c
index 2bd3df3..a8f1ff8 100644
--- a/mm/memcontrol.c
+++ b/mm/memcontrol.c
@@ -4483,7 +4483,7 @@ static int mem_cgroup_move_account(struct page *page,
 				   struct mem_cgroup *to)
 {
 	unsigned long flags;
-	unsigned int nr_pages = compound ? hpage_nr_pages(page) : 1;
+	unsigned int nr_pages = compound ? (1 << compound_order(page)) : 1;
 	int ret;
 	bool anon;

@@ -5417,7 +5417,7 @@ int mem_cgroup_try_charge(struct page *page, struct mm_struct *mm,
 			  bool compound)
 {
 	struct mem_cgroup *memcg = NULL;
-	unsigned int nr_pages = compound ? hpage_nr_pages(page) : 1;
+	unsigned int nr_pages = compound ? (1 << compound_order(page)) : 1;
 	int ret = 0;

 	if (mem_cgroup_disabled())
@@ -5478,7 +5478,7 @@ int mem_cgroup_try_charge(struct page *page, struct mm_struct *mm,
 void mem_cgroup_commit_charge(struct page *page, struct mem_cgroup *memcg,
 			      bool lrucare, bool compound)
 {
-	unsigned int nr_pages = compound ? hpage_nr_pages(page) : 1;
+	unsigned int nr_pages = compound ? (1 << compound_order(page)) : 1;

 	VM_BUG_ON_PAGE(!page->mapping, page);
 	VM_BUG_ON_PAGE(PageLRU(page) && !lrucare, page);
@@ -5522,7 +5522,7 @@ void mem_cgroup_commit_charge(struct page *page, struct mem_cgroup *memcg,
 void mem_cgroup_cancel_charge(struct page *page, struct mem_cgroup *memcg,
 		bool compound)
 {
-	unsigned int nr_pages = compound ? hpage_nr_pages(page) : 1;
+	unsigned int nr_pages = compound ? (1 << compound_order(page)) : 1;

 	if (mem_cgroup_disabled())
 		return;
@@ -5729,7 +5729,7 @@ void mem_cgroup_migrate(struct page *oldpage, struct page *newpage)

 	/* Force-charge the new page. The old one will be freed soon */
 	compound = PageTransHuge(newpage);
-	nr_pages = compound ? hpage_nr_pages(newpage) : 1;
+	nr_pages = compound ? (1 << compound_order(newpage)) : 1;

 	page_counter_charge(&memcg->memory, nr_pages);
 	if (do_memsw_account())

-- 
Tsukada

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
