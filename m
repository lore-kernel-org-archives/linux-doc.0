Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_HI,T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id C74A57E6A4
	for <lwn-linux-doc@archive.lwn.net>; Thu, 15 Mar 2018 21:21:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1752763AbeCOVVL (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 15 Mar 2018 17:21:11 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:34366 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1752619AbeCOVVL (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 15 Mar 2018 17:21:11 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id 71077406E8B9;
        Thu, 15 Mar 2018 21:21:10 +0000 (UTC)
Received: from llong.com (dhcp-17-75.bos.redhat.com [10.18.17.75])
        by smtp.corp.redhat.com (Postfix) with ESMTP id A735EC1FB3;
        Thu, 15 Mar 2018 21:21:06 +0000 (UTC)
From:   Waiman Long <longman@redhat.com>
To:     Tejun Heo <tj@kernel.org>, Li Zefan <lizefan@huawei.com>,
        Johannes Weiner <hannes@cmpxchg.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@redhat.com>
Cc:     cgroups@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, kernel-team@fb.com, pjt@google.com,
        luto@amacapital.net, efault@gmx.de, torvalds@linux-foundation.org,
        Roman Gushchin <guro@fb.com>, Waiman Long <longman@redhat.com>
Subject: [PATCH v5 0/2] cpuset: Enable cpuset controller in default hierarchy
Date:   Thu, 15 Mar 2018 17:20:40 -0400
Message-Id: <1521148842-15486-1-git-send-email-longman@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.7]); Thu, 15 Mar 2018 21:21:10 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.7]); Thu, 15 Mar 2018 21:21:10 +0000 (UTC) for IP:'10.11.54.5' DOMAIN:'int-mx05.intmail.prod.int.rdu2.redhat.com' HELO:'smtp.corp.redhat.com' FROM:'longman@redhat.com' RCPT:''
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

v5:
 - Add patch 2 to provide the cpuset.flags control knob for the
   sched_load_balance flag which should be the only feature that is
   essential as a replacement of the "isolcpus" kernel boot parameter.

v4:
 - Further minimize the feature set by removing the flags control knob.

v3:
 - Further trim the additional features down to just memory_migrate.
 - Update Documentation/cgroup-v2.txt.

The purpose of this patchset is to provide a minimal set of cpuset
features for cgroup v2. That minimal set includes the cpus, mems and
their effective_* counterparts as well as a new flags control knob
that currently supports only the sched_load_balance flag.

This patchset does not exclude the possibility of adding more flags
and features in the future after careful consideration.

Patch 1 enables cpuset in cgroup v2 with cpus, mems and their
effective_* counterparts.

Patch 2 adds flags with support for the sched_load_balance only.

Waiman Long (2):
  cpuset: Enable cpuset controller in default hierarchy
  cpuset: Add cpuset.flags control knob to v2

 Documentation/cgroup-v2.txt | 128 ++++++++++++++++++++++++++++++++++++----
 kernel/cgroup/cpuset.c      | 140 +++++++++++++++++++++++++++++++++++++++++++-
 2 files changed, 256 insertions(+), 12 deletions(-)

-- 
1.8.3.1

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
