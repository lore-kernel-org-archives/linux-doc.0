Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CBB8C433F5
	for <linux-doc@archiver.kernel.org>; Tue,  8 Feb 2022 08:20:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349177AbiBHIUp (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 8 Feb 2022 03:20:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349204AbiBHITs (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 8 Feb 2022 03:19:48 -0500
Received: from mail-il1-x14a.google.com (mail-il1-x14a.google.com [IPv6:2607:f8b0:4864:20::14a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6320C03FEE0
        for <linux-doc@vger.kernel.org>; Tue,  8 Feb 2022 00:19:41 -0800 (PST)
Received: by mail-il1-x14a.google.com with SMTP id a3-20020a92d103000000b002bdfc5108dfso5519790ilb.9
        for <linux-doc@vger.kernel.org>; Tue, 08 Feb 2022 00:19:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc:content-transfer-encoding;
        bh=MIB++7G+/LCy16uIS5SE62AmAfXnIjlhBHvrLUsKEns=;
        b=j04x2wOt2cZHbDzPHqdx2vq9JtnvFNLOAiVY3qfGUiWCnq3cnJPNG2/mmfrtuDXHjE
         CBnj5o5JUsSj+nfz3qSJl/mv7bqUj57dW6tzR5ZDewYq6AFhTcKVzQTb5Cbi/4JBlI0m
         cG6HHx6Ice5xypjaoYERkrXU4jQSN1fcndUbRjnoxR01y1ork4tsgZT4NBEF53Bb1rKJ
         tZI8+cZgwHl51rjkt/+vrgZUGvQfvcxOizfgWPOAUBbm46MeVmMNFUUiRCuLXDt2tmnP
         A0xtSEKDRkzS2qauLrPiS9wSlrrkURAU701cZy5LzdPkcJ2auSuEVyDmOgFtZqWlOg5V
         38yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc:content-transfer-encoding;
        bh=MIB++7G+/LCy16uIS5SE62AmAfXnIjlhBHvrLUsKEns=;
        b=5Oc4lxvTj1cGK8PPKt8vXEr8hmT8SejXoOrJVj9/+veTxnIL25GTKR67jdxS9aZWq3
         jVxzSuL6/N5QeBxLVbiQy3CGz6Tfw8x3/w17s4408hsj/UwLSwtbPpXg/oIF6wzYaDhm
         cuR/d5kKuU/Zkr+yHW6TUnhJ/vvX1UkWKb9aMBkZ6JzFs23DzDxM5wk7y4dZR0Be9h82
         PfPKOO7guuk93H/l7Rh7pGukbEng5/ruyXkvGuRLtw856DPPRxWfYyges7qOWeNXcivf
         8u8oisuKJTs0sqvTQvy5uK8q6NZ6lg9n2oyM7J3wssptNIslUEdslBxPYlyp+PDOt1WO
         QDFA==
X-Gm-Message-State: AOAM531tjpXcCP2RiEc3Zbd2O1ypWzj/b8NW8asZcdXgwyTPB+dW8gHk
        oK4BpTVFhK0ewHoO5ST0xWfbzuYqAFk=
X-Google-Smtp-Source: ABdhPJwvGsx9x7biM2i13AIBVIwwI7yLTvs/RgJHVZky0l2R0ILRLR7J5MVRvavlQNnwnqDruUBvYL02o6s=
X-Received: from yuzhao.bld.corp.google.com ([2620:15c:183:200:5f31:19c3:21f5:7300])
 (user=yuzhao job=sendgmr) by 2002:a92:dacb:: with SMTP id o11mr720466ilq.188.1644308381316;
 Tue, 08 Feb 2022 00:19:41 -0800 (PST)
Date:   Tue,  8 Feb 2022 01:19:00 -0700
In-Reply-To: <20220208081902.3550911-1-yuzhao@google.com>
Message-Id: <20220208081902.3550911-11-yuzhao@google.com>
Mime-Version: 1.0
References: <20220208081902.3550911-1-yuzhao@google.com>
X-Mailer: git-send-email 2.35.0.263.gb82422642f-goog
Subject: [PATCH v7 10/12] mm: multigenerational LRU: thrashing prevention
From:   Yu Zhao <yuzhao@google.com>
To:     Andrew Morton <akpm@linux-foundation.org>,
        Johannes Weiner <hannes@cmpxchg.org>,
        Mel Gorman <mgorman@suse.de>, Michal Hocko <mhocko@kernel.org>
Cc:     Andi Kleen <ak@linux.intel.com>,
        Aneesh Kumar <aneesh.kumar@linux.ibm.com>,
        Barry Song <21cnbao@gmail.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Hillf Danton <hdanton@sina.com>, Jens Axboe <axboe@kernel.dk>,
        Jesse Barnes <jsbarnes@google.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Matthew Wilcox <willy@infradead.org>,
        Michael Larabel <Michael@michaellarabel.com>,
        Mike Rapoport <rppt@kernel.org>,
        Rik van Riel <riel@surriel.com>,
        Vlastimil Babka <vbabka@suse.cz>,
        Will Deacon <will@kernel.org>,
        Ying Huang <ying.huang@intel.com>,
        linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        page-reclaim@google.com, x86@kernel.org,
        Yu Zhao <yuzhao@google.com>, Brian Geffon <bgeffon@google.com>,
        Jan Alexander Steffens <heftig@archlinux.org>,
        Oleksandr Natalenko <oleksandr@natalenko.name>,
        Steven Barrett <steven@liquorix.net>,
        Suleiman Souhlal <suleiman@google.com>,
        Daniel Byrne <djbyrne@mtu.edu>,
        Donald Carr <d@chaos-reins.com>,
        "=?UTF-8?q?Holger=20Hoffst=C3=A4tte?=" 
        <holger@applied-asynchrony.com>,
        Konstantin Kharlamov <Hi-Angel@yandex.ru>,
        Shuang Zhai <szhai2@cs.rochester.edu>,
        Sofia Trinh <sofia.trinh@edi.works>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Add /sys/kernel/mm/lru_gen/min_ttl_ms for thrashing prevention, as
requested by many desktop users [1].

When set to value N, it prevents the working set of N milliseconds
from getting evicted. The OOM killer is triggered if this working set
can't be kept in memory. Based on the average human detectable lag
(~100ms), N=3D1000 usually eliminates intolerable lags due to thrashing.
Larger values like N=3D3000 make lags less noticeable at the risk of
premature OOM kills.

Compared with the size-based approach, e.g., [2], this time-based
approach has the following advantages:
1) It's easier to configure because it's agnostic to applications and
   memory sizes.
2) It's more reliable because it's directly wired to the OOM killer.

[1] https://lore.kernel.org/lkml/Ydza%2FzXKY9ATRoh6@google.com/
[2] https://lore.kernel.org/lkml/20211130201652.2218636d@mail.inbox.lv/

Signed-off-by: Yu Zhao <yuzhao@google.com>
Acked-by: Brian Geffon <bgeffon@google.com>
Acked-by: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
Acked-by: Oleksandr Natalenko <oleksandr@natalenko.name>
Acked-by: Steven Barrett <steven@liquorix.net>
Acked-by: Suleiman Souhlal <suleiman@google.com>
Tested-by: Daniel Byrne <djbyrne@mtu.edu>
Tested-by: Donald Carr <d@chaos-reins.com>
Tested-by: Holger Hoffst=C3=A4tte <holger@applied-asynchrony.com>
Tested-by: Konstantin Kharlamov <Hi-Angel@yandex.ru>
Tested-by: Shuang Zhai <szhai2@cs.rochester.edu>
Tested-by: Sofia Trinh <sofia.trinh@edi.works>
---
 mm/vmscan.c | 64 +++++++++++++++++++++++++++++++++++++++++++++++++----
 1 file changed, 60 insertions(+), 4 deletions(-)

diff --git a/mm/vmscan.c b/mm/vmscan.c
index 700c35f2a030..4d37d63668b5 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -4335,7 +4335,8 @@ static long get_nr_evictable(struct lruvec *lruvec, u=
nsigned long max_seq,
 	return total > 0 ? total : 0;
 }
=20
-static void age_lruvec(struct lruvec *lruvec, struct scan_control *sc)
+static bool age_lruvec(struct lruvec *lruvec, struct scan_control *sc,
+		       unsigned long min_ttl)
 {
 	bool need_aging;
 	long nr_to_scan;
@@ -4344,14 +4345,22 @@ static void age_lruvec(struct lruvec *lruvec, struc=
t scan_control *sc)
 	DEFINE_MAX_SEQ(lruvec);
 	DEFINE_MIN_SEQ(lruvec);
=20
+	if (min_ttl) {
+		int gen =3D lru_gen_from_seq(min_seq[TYPE_FILE]);
+		unsigned long birth =3D READ_ONCE(lruvec->lrugen.timestamps[gen]);
+
+		if (time_is_after_jiffies(birth + min_ttl))
+			return false;
+	}
+
 	mem_cgroup_calculate_protection(NULL, memcg);
=20
 	if (mem_cgroup_below_min(memcg))
-		return;
+		return false;
=20
 	nr_to_scan =3D get_nr_evictable(lruvec, max_seq, min_seq, swappiness, &ne=
ed_aging);
 	if (!nr_to_scan)
-		return;
+		return false;
=20
 	nr_to_scan >>=3D sc->priority;
=20
@@ -4360,11 +4369,18 @@ static void age_lruvec(struct lruvec *lruvec, struc=
t scan_control *sc)
=20
 	if (nr_to_scan && need_aging && (!mem_cgroup_below_low(memcg) || sc->memc=
g_low_reclaim))
 		try_to_inc_max_seq(lruvec, max_seq, sc, swappiness, false);
+
+	return true;
 }
=20
+/* to protect the working set of the last N jiffies */
+static unsigned long lru_gen_min_ttl __read_mostly;
+
 static void lru_gen_age_node(struct pglist_data *pgdat, struct scan_contro=
l *sc)
 {
 	struct mem_cgroup *memcg;
+	bool success =3D false;
+	unsigned long min_ttl =3D READ_ONCE(lru_gen_min_ttl);
=20
 	VM_BUG_ON(!current_is_kswapd());
=20
@@ -4390,11 +4406,28 @@ static void lru_gen_age_node(struct pglist_data *pg=
dat, struct scan_control *sc)
 	do {
 		struct lruvec *lruvec =3D mem_cgroup_lruvec(memcg, pgdat);
=20
-		age_lruvec(lruvec, sc);
+		if (age_lruvec(lruvec, sc, min_ttl))
+			success =3D true;
=20
 		cond_resched();
 	} while ((memcg =3D mem_cgroup_iter(NULL, memcg, NULL)));
=20
+	/*
+	 * The main goal is to OOM kill if every generation from all memcgs is
+	 * younger than min_ttl. However, another theoretical possibility is all
+	 * memcgs are either below min or empty.
+	 */
+	if (!success && mutex_trylock(&oom_lock)) {
+		struct oom_control oc =3D {
+			.gfp_mask =3D sc->gfp_mask,
+			.order =3D sc->order,
+		};
+
+		out_of_memory(&oc);
+
+		mutex_unlock(&oom_lock);
+	}
+
 	current->reclaim_state->mm_walk =3D NULL;
 }
=20
@@ -5107,6 +5140,28 @@ static void lru_gen_change_state(bool enable)
  *                          sysfs interface
  *************************************************************************=
*****/
=20
+static ssize_t show_min_ttl(struct kobject *kobj, struct kobj_attribute *a=
ttr, char *buf)
+{
+	return sprintf(buf, "%u\n", jiffies_to_msecs(READ_ONCE(lru_gen_min_ttl)))=
;
+}
+
+static ssize_t store_min_ttl(struct kobject *kobj, struct kobj_attribute *=
attr,
+			     const char *buf, size_t len)
+{
+	unsigned int msecs;
+
+	if (kstrtouint(buf, 0, &msecs))
+		return -EINVAL;
+
+	WRITE_ONCE(lru_gen_min_ttl, msecs_to_jiffies(msecs));
+
+	return len;
+}
+
+static struct kobj_attribute lru_gen_min_ttl_attr =3D __ATTR(
+	min_ttl_ms, 0644, show_min_ttl, store_min_ttl
+);
+
 static ssize_t show_enable(struct kobject *kobj, struct kobj_attribute *at=
tr, char *buf)
 {
 	unsigned int caps =3D 0;
@@ -5155,6 +5210,7 @@ static struct kobj_attribute lru_gen_enabled_attr =3D=
 __ATTR(
 );
=20
 static struct attribute *lru_gen_attrs[] =3D {
+	&lru_gen_min_ttl_attr.attr,
 	&lru_gen_enabled_attr.attr,
 	NULL
 };
--=20
2.35.0.263.gb82422642f-goog

