Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id C2BE07D048
	for <lwn-linux-doc@archive.lwn.net>; Fri, 18 May 2018 04:37:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751304AbeEREhs (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 18 May 2018 00:37:48 -0400
Received: from ext-host0001.ascade.co.jp ([218.224.228.194]:61283 "EHLO
        ns.ascade.co.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750959AbeEREhq (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 18 May 2018 00:37:46 -0400
Received: from server0001.ascade.co.jp (server0001.ascade.co.jp [10.1.1.63])
        by ns.ascade.co.jp (Postfix) with ESMTP id 58340993BD;
        Fri, 18 May 2018 13:37:45 +0900 (JST)
Received: from [IPv6:::1] (server0001.ascade.co.jp [10.1.1.63])
        by server0001.ascade.co.jp (Postfix) with ESMTP id 1080010050E;
        Fri, 18 May 2018 13:37:43 +0900 (JST)
Subject: [PATCH v2 5/7] hugetlb: add charge_surplus_hugepages attribute
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
Message-ID: <2e8b5907-36e1-094b-ec87-149e1f0b7f69@ascade.co.jp>
Date:   Fri, 18 May 2018 13:37:37 +0900
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

Add an entry for charge_surplus_hugepages to sysfs.

Signed-off-by: TSUKADA Koutaro <tsukada@ascade.co.jp>
---
 hugetlb.c |   25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index 9a9549c..2f9bdbc 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -2662,6 +2662,30 @@ static ssize_t surplus_hugepages_show(struct kobject *kobj,
 }
 HSTATE_ATTR_RO(surplus_hugepages);

+static ssize_t charge_surplus_hugepages_show(struct kobject *kobj,
+					struct kobj_attribute *attr, char *buf)
+{
+	struct hstate *h = kobj_to_hstate(kobj, NULL);
+	return sprintf(buf, "%d\n", h->charge_surplus_huge_pages);
+}
+
+static ssize_t charge_surplus_hugepages_store(struct kobject *kobj,
+		struct kobj_attribute *attr, const char *buf, size_t len)
+{
+	int err;
+	unsigned long input;
+	struct hstate *h = kobj_to_hstate(kobj, NULL);
+
+	err = kstrtoul(buf, 10, &input);
+	if (err)
+		return err;
+
+	h->charge_surplus_huge_pages = input ? true : false;
+
+	return len;
+}
+HSTATE_ATTR(charge_surplus_hugepages);
+
 static struct attribute *hstate_attrs[] = {
 	&nr_hugepages_attr.attr,
 	&nr_overcommit_hugepages_attr.attr,
@@ -2671,6 +2695,7 @@ static ssize_t surplus_hugepages_show(struct kobject *kobj,
 #ifdef CONFIG_NUMA
 	&nr_hugepages_mempolicy_attr.attr,
 #endif
+	&charge_surplus_hugepages_attr.attr,
 	NULL,
 };

-- 
Tsukada


--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
