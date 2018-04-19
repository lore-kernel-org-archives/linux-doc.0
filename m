Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id DE56A7E279
	for <lwn-linux-doc@archive.lwn.net>; Thu, 19 Apr 2018 13:48:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1752757AbeDSNs3 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 19 Apr 2018 09:48:29 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:44458 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1752780AbeDSNrO (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 19 Apr 2018 09:47:14 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id EB78B42F0B9B;
        Thu, 19 Apr 2018 13:47:13 +0000 (UTC)
Received: from llong.com (dhcp-17-164.bos.redhat.com [10.18.17.164])
        by smtp.corp.redhat.com (Postfix) with ESMTP id D760E215CDA7;
        Thu, 19 Apr 2018 13:47:12 +0000 (UTC)
From:   Waiman Long <longman@redhat.com>
To:     Tejun Heo <tj@kernel.org>, Li Zefan <lizefan@huawei.com>,
        Johannes Weiner <hannes@cmpxchg.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@redhat.com>
Cc:     cgroups@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, kernel-team@fb.com, pjt@google.com,
        luto@amacapital.net, Mike Galbraith <efault@gmx.de>,
        torvalds@linux-foundation.org, Roman Gushchin <guro@fb.com>,
        Juri Lelli <juri.lelli@redhat.com>,
        Waiman Long <longman@redhat.com>
Subject: [PATCH v7 0/5] cpuset: Enable cpuset controller in default hierarchy
Date:   Thu, 19 Apr 2018 09:46:59 -0400
Message-Id: <1524145624-23655-1-git-send-email-longman@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.7]); Thu, 19 Apr 2018 13:47:14 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.7]); Thu, 19 Apr 2018 13:47:14 +0000 (UTC) for IP:'10.11.54.6' DOMAIN:'int-mx06.intmail.prod.int.rdu2.redhat.com' HELO:'smtp.corp.redhat.com' FROM:'longman@redhat.com' RCPT:''
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

v7:
 - Add a root-only cpuset.cpus.isolated control file for CPU isolation.
 - Enforce that load_balancing can only be turned off on cpusets with
   CPUs from the isolated list.
 - Update sched domain generation to allow cpusets with CPUs only
   from the isolated CPU list to be in separate root domains.

v6:
 - Hide cpuset control knobs in root cgroup.
 - Rename effective_cpus and effective_mems to cpus.effective and
   mems.effective respectively.
 - Remove cpuset.flags and add cpuset.sched_load_balance instead
   as the behavior of sched_load_balance has changed and so is
   not a simple flag.
 - Update cgroup-v2.txt accordingly.

v5:
 - Add patch 2 to provide the cpuset.flags control knob for the
   sched_load_balance flag which should be the only feature that is
   essential as a replacement of the "isolcpus" kernel boot parameter.

v4:
 - Further minimize the feature set by removing the flags control knob.

v3:
 - Further trim the additional features down to just memory_migrate.
 - Update Documentation/cgroup-v2.txt.

v6 patch: https://lkml.org/lkml/2018/3/21/530

The purpose of this patchset is to provide a basic set of cpuset
features for cgroup v2. This basic set includes the non-root "cpus",
"mems", "cpus.effective" and "mems.effective", "sched_load_balance"
control file as well as a root-only "cpus.isolated".

The root-only "cpus.isolated" file is added to support use cases similar
to the "isolcpus" kernel parameter. CPUs from the isolated list can be
put into child cpusets where "sched_load_balance" can be disabled to
allow finer control of task-cpu mappings of those isolated CPUs.

On the other hand, enabling the "sched_load_balance" on a cpuset with
only CPUs from the isolated list will allow those CPUs to use a separate
root domain from that of the root cpuset.

This patchset does not exclude the possibility of adding more features
in the future after careful consideration.

Patch 1 enables cpuset in cgroup v2 with cpus, mems and their
effective counterparts.

Patch 2 adds sched_load_balance whose behavior changes in v2 to become
hierarchical and includes an implicit !cpu_exclusive.

Patch 3 adds a new root-only "cpuset.cpus.isolated" control file for
CPU isolation purpose.

Patch 4 adds the limitation that "sched_load_balance" can only be turned
off in a cpuset if all the CPUs in the cpuset are already in the root's
"cpuset.cpus.isolated".

Patch 5 modifies the sched domain generation code to generate separate root
sched domains if all the CPUs in a cpuset comes from "cpuset.cpus.isolated".

In other words, all the CPUs that need to be isolated or in separate
root domains have to be put into the "cpuset.cpus.isolated" first. Then
child cpusets can be created to partition those isolated CPUs into
either separate root domains with "sched_load_balance" on or really
isolated CPUs with "sched_load_balance" off. Load balancing cannot
be turned off at root.

Waiman Long (5):
  cpuset: Enable cpuset controller in default hierarchy
  cpuset: Add cpuset.sched_load_balance to v2
  cpuset: Add a root-only cpus.isolated v2 control file
  cpuset: Restrict load balancing off cpus to subset of cpus.isolated
  cpuset: Make generate_sched_domains() recognize isolated_cpus

 Documentation/cgroup-v2.txt | 138 ++++++++++++++++++++-
 kernel/cgroup/cpuset.c      | 287 +++++++++++++++++++++++++++++++++++++++++---
 2 files changed, 404 insertions(+), 21 deletions(-)

-- 
1.8.3.1

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
