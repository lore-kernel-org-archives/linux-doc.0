Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 6C6C77D581
	for <lwn-linux-doc@archive.lwn.net>; Wed, 12 Sep 2018 17:35:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727762AbeILWl2 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 12 Sep 2018 18:41:28 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:51592 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727010AbeILWl2 (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 12 Sep 2018 18:41:28 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id D63B2402243B;
        Wed, 12 Sep 2018 17:35:53 +0000 (UTC)
Received: from llong.com (dhcp-17-55.bos.redhat.com [10.18.17.55])
        by smtp.corp.redhat.com (Postfix) with ESMTP id B994A2166BA2;
        Wed, 12 Sep 2018 17:35:50 +0000 (UTC)
From:   Waiman Long <longman@redhat.com>
To:     Alexander Viro <viro@zeniv.linux.org.uk>,
        Jonathan Corbet <corbet@lwn.net>,
        Andrew Morton <akpm@linux-foundation.org>
Cc:     linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
        linux-mm@kvack.org, linux-doc@vger.kernel.org,
        "Luis R. Rodriguez" <mcgrof@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Jan Kara <jack@suse.cz>,
        "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>,
        Ingo Molnar <mingo@kernel.org>,
        Miklos Szeredi <mszeredi@redhat.com>,
        Matthew Wilcox <willy@infradead.org>,
        Larry Woodman <lwoodman@redhat.com>,
        James Bottomley <James.Bottomley@HansenPartnership.com>,
        "Wangkai (Kevin C)" <wangkai86@huawei.com>,
        Michal Hocko <mhocko@kernel.org>,
        Waiman Long <longman@redhat.com>
Subject: [PATCH v4 0/3] fs/dcache: Track # of negative dentries
Date:   Wed, 12 Sep 2018 13:35:39 -0400
Message-Id: <1536773742-32687-1-git-send-email-longman@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.6]); Wed, 12 Sep 2018 17:35:54 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.6]); Wed, 12 Sep 2018 17:35:54 +0000 (UTC) for IP:'10.11.54.6' DOMAIN:'int-mx06.intmail.prod.int.rdu2.redhat.com' HELO:'smtp.corp.redhat.com' FROM:'longman@redhat.com' RCPT:''
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

 v3->v4:
  - Drop patch 4 as it is just a minor optimization.
  - Add a cc:stable tag to patch 1.
  - Clean up some comments in patch 3.

 v2->v3:
  - With confirmation that the dummy array in dentry_stat structure
    was never a replacement of a previously used field, patch 3 is now
    reverted back to use one of dummy field as the negative dentry count
    instead of adding a new field.

 v1->v2:
  - Clarify what the new nr_dentry_negative per-cpu counter is tracking
    and open-code the increment and decrement as suggested by Dave Chinner.
  - Append the new nr_dentry_negative count as the 7th element of dentry-state
    instead of replacing one of the dummy entries.
  - Remove patch "fs/dcache: Make negative dentries easier to be
    reclaimed" for now as I need more time to think about what
    to do with it.
  - Add 2 more patches to address issues found while reviewing the
    dentry code.
  - Add another patch to change the conditional branch of
    nr_dentry_negative accounting to conditional move so as to reduce
    the performance impact of the accounting code.

This patchset addresses 2 issues found in the dentry code and adds a
new nr_dentry_negative per-cpu counter to track the total number of
negative dentries in all the LRU lists.

Patch 1 fixes a bug in the accounting of nr_dentry_unused in
shrink_dcache_sb().

Patch 2 removes the ____cacheline_aligned_in_smp tag from super_block
LRU lists.

Patch 3 adds the new nr_dentry_negative per-cpu counter.

Various filesystem related tests were run and no statistically
significant changes in performance outside of the possible noise range
was observed.

Waiman Long (3):
  fs/dcache: Fix incorrect nr_dentry_unused accounting in
    shrink_dcache_sb()
  fs: Don't need to put list_lru into its own cacheline
  fs/dcache: Track & report number of negative dentries

 Documentation/sysctl/fs.txt | 26 ++++++++++++++++----------
 fs/dcache.c                 | 38 +++++++++++++++++++++++++++++++++-----
 include/linux/dcache.h      |  7 ++++---
 include/linux/fs.h          |  9 +++++----
 4 files changed, 58 insertions(+), 22 deletions(-)

-- 
1.8.3.1

