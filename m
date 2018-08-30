Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 1C98B7D87A
	for <lwn-linux-doc@archive.lwn.net>; Thu, 30 Aug 2018 21:56:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727590AbeHaB7n (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 30 Aug 2018 21:59:43 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:34960 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727088AbeHaB7n (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 30 Aug 2018 21:59:43 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id 2BA4180A0CDE;
        Thu, 30 Aug 2018 21:55:27 +0000 (UTC)
Received: from llong.com (dhcp-17-8.bos.redhat.com [10.18.17.8])
        by smtp.corp.redhat.com (Postfix) with ESMTP id A66A02166B41;
        Thu, 30 Aug 2018 21:55:24 +0000 (UTC)
From:   Waiman Long <longman@redhat.com>
To:     Alexander Viro <viro@zeniv.linux.org.uk>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
        linux-mm@kvack.org, linux-doc@vger.kernel.org,
        "Luis R. Rodriguez" <mcgrof@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Jan Kara <jack@suse.cz>,
        "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Ingo Molnar <mingo@kernel.org>,
        Miklos Szeredi <mszeredi@redhat.com>,
        Matthew Wilcox <willy@infradead.org>,
        Larry Woodman <lwoodman@redhat.com>,
        James Bottomley <James.Bottomley@HansenPartnership.com>,
        "Wangkai (Kevin C)" <wangkai86@huawei.com>,
        Michal Hocko <mhocko@kernel.org>,
        Waiman Long <longman@redhat.com>
Subject: [PATCH v2 0/4] fs/dcache: Track # of negative dentries
Date:   Thu, 30 Aug 2018 17:55:03 -0400
Message-Id: <1535666107-25699-1-git-send-email-longman@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.8]); Thu, 30 Aug 2018 21:55:27 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.8]); Thu, 30 Aug 2018 21:55:27 +0000 (UTC) for IP:'10.11.54.6' DOMAIN:'int-mx06.intmail.prod.int.rdu2.redhat.com' HELO:'smtp.corp.redhat.com' FROM:'longman@redhat.com' RCPT:''
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

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

Patch 4 removes conditional branches in nr_dentry_negative accounting
code.

Various filesystem related tests were run and no statistically
significant changes in performance was observed.

Waiman Long (4):
  fs/dcache: Fix incorrect nr_dentry_unused accounting in
    shrink_dcache_sb()
  fs: Don't need to put list_lru into its own cacheline
  fs/dcache: Track & report number of negative dentries
  fs/dcache: Eliminate branches in nr_dentry_negative accounting

 Documentation/sysctl/fs.txt | 22 +++++++++++-------
 fs/dcache.c                 | 54 ++++++++++++++++++++++++++++++++++++++++-----
 include/linux/dcache.h      |  5 +++--
 include/linux/fs.h          |  9 ++++----
 kernel/sysctl.c             |  2 +-
 5 files changed, 72 insertions(+), 20 deletions(-)

-- 
1.8.3.1

