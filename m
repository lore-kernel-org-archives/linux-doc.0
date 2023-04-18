Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0341CC77B71
	for <linux-doc@archiver.kernel.org>; Tue, 18 Apr 2023 05:17:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230203AbjDRFRF (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 18 Apr 2023 01:17:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54876 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230000AbjDRFRB (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 18 Apr 2023 01:17:01 -0400
Received: from 66-220-144-179.mail-mxout.facebook.com (66-220-144-179.mail-mxout.facebook.com [66.220.144.179])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64F1359D7
        for <linux-doc@vger.kernel.org>; Mon, 17 Apr 2023 22:16:59 -0700 (PDT)
Received: by devbig1114.prn1.facebook.com (Postfix, from userid 425415)
        id C84683AA01EF; Mon, 17 Apr 2023 22:14:10 -0700 (PDT)
From:   Stefan Roesch <shr@devkernel.io>
To:     kernel-team@fb.com
Cc:     shr@devkernel.io, linux-mm@kvack.org, riel@surriel.com,
        mhocko@suse.com, david@redhat.com, linux-kselftest@vger.kernel.org,
        linux-doc@vger.kernel.org, akpm@linux-foundation.org,
        hannes@cmpxchg.org, willy@infradead.org
Subject: [PATCH v9 0/3] mm: process/cgroup ksm support
Date:   Mon, 17 Apr 2023 22:13:39 -0700
Message-Id: <20230418051342.1919757-1-shr@devkernel.io>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

So far KSM can only be enabled by calling madvise for memory regions. To
be able to use KSM for more workloads, KSM needs to have the ability to b=
e
enabled / disabled at the process / cgroup level.

Use case 1:
The madvise call is not available in the programming language. An example=
 for
this are programs with forked workloads using a garbage collected languag=
e without
pointers. In such a language madvise cannot be made available.

In addition the addresses of objects get moved around as they are garbage
collected. KSM sharing needs to be enabled "from the outside" for these t=
ype of
workloads.

Use case 2:
The same interpreter can also be used for workloads where KSM brings no
benefit or even has overhead. We'd like to be able to enable KSM on a wor=
kload
by workload basis.

Use case 3:
With the madvise call sharing opportunities are only enabled for the curr=
ent
process: it is a workload-local decision. A considerable number of sharin=
g
opportunities may exist across multiple workloads or jobs (if they are pa=
rt
of the same security domain). Only a higler level entity like a job sched=
uler
or container can know for certain if its running one or more instances of=
 a
job. That job scheduler however doesn't have the necessary internal workl=
oad
knowledge to make targeted madvise calls.

Security concerns:
In previous discussions security concerns have been brought up. The probl=
em is
that an individual workload does not have the knowledge about what else i=
s
running on a machine. Therefore it has to be very conservative in what me=
mory
areas can be shared or not. However, if the system is dedicated to runnin=
g
multiple jobs within the same security domain, its the job scheduler that=
 has
the knowledge that sharing can be safely enabled and is even desirable.

Performance:
Experiments with using UKSM have shown a capacity increase of around 20%.

Here are the metrics from an instagram workload (taken from a machine wit=
h
64GB main memory):

   full_scans: 445
   general_profit: 20158298048
   max_page_sharing: 256
   merge_across_nodes: 1
   pages_shared: 129547
   pages_sharing: 5119146
   pages_to_scan: 4000
   pages_unshared: 1760924
   pages_volatile: 10761341
   run: 1
   sleep_millisecs: 20
   stable_node_chains: 167
   stable_node_chains_prune_millisecs: 2000
   stable_node_dups: 2751
   use_zero_pages: 0
   zero_pages_sharing: 0

After the service is running for 30 minutes to an hour, 4 to 5 million sh=
ared
pages are common for this workload when using KSM.


Detailed changes:

1. New options for prctl system command
This patch series adds two new options to the prctl system call. The firs=
t
one allows to enable KSM at the process level and the second one to query=
 the
setting.

The setting will be inherited by child processes.

With the above setting, KSM can be enabled for the seed process of a cgro=
up
and all processes in the cgroup will inherit the setting.

2. Changes to KSM processing
When KSM is enabled at the process level, the KSM code will iterate over =
all
the VMA's and enable KSM for the eligible VMA's.

When forking a process that has KSM enabled, the setting will be inherite=
d by
the new child process.

3. Add general_profit metric
The general_profit metric of KSM is specified in the documentation, but n=
ot
calculated. This adds the general profit metric to /sys/kernel/debug/mm/k=
sm.

4. Add more metrics to ksm_stat
This adds the process profit metric to /proc/<pid>/ksm_stat.

5. Add more tests to ksm_tests and ksm_functional_tests
This adds an option to specify the merge type to the ksm_tests. This allo=
ws to
test madvise and prctl KSM.

It also adds a two new tests to ksm_functional_tests: one to test the new
prctl options and the other one is a fork test to verify that the KSM pro=
cess
setting is inherited by client processes.


Changes:
- V9:
  - simplify __ksm_add_vma()
  - Adding return to test_prctl() in ksm_functional_tests.c
  - Removing assignment in defining debug variable in ksm_tests.c
 =20
- V8:
  - Refreshed to latest mm-unstable
  - Added check for arg3 - arg5 in prctl function
  - Don't return an error ksm_enable_merge_any if MMF_VM_MERGE_ANY bit is
    already set

  - unmap after merge in ksm_tests program
  - use tmp variable in main function in ksm_tests program
 =20
  - Specify all 5 parameters in call to prctl in test programs
  - Rename test_ksm_prctl() to test_prctl()
  - Skip if first test in test_prctl failed with skip result
  - Exit early for failures in test_prctl

  - Rename test_ksm_fork() to test_prctl_fork()
  - Similar changes to test_prctl also for test_prctl_fork()
  - Change number of test
 =20
- V7:
  - Removed ksm_add_mm() function
  - added ksm_enable_merge_any() function
  - Made ksm_add_vmas() function static
  - Simplified ksm_fork function to only MMF_VM_MERGE_ANY bit
  - Moved setting of bit MMF_VM_MERGE_ANY to ksm_enable_merge_any()
  - Removed flag parameter from __ksm_enter
  - Removed flag parameter from __ksm_exit
  - Clear bit MMF_VM_MERGE_ANY in __ksm_exit
  - call ksm_add_vma only in mmap_region() and do_brk_flags()

  - Removed check_ksm_fork() and check_ksm_merge_type from ksm_tests
  - Removed -F and -G command line options
  - Removed enum options for above tests
  - Added -d option to enable debug mode
  - Added debug variable for storing debug option

- V6:
  - Fix error condition in prctl call
  - Remove ksm_merge_type function and ksm_stat output
  - Some minor changes like whitespace and removing a cast.
 =20
- V5:
  - When the prctl system call is invoked, mark all compatible VMA
    as mergeable
  - Instead of checcking during scan if VMA is mergeable, mark the VMA
    mergeable when the VMA is created (in case the VMA is compatible)
    - Remove earlier changes, they are no longer necessary
  - Unset the flag MMF_VM_MERGE_ANY in gmap_mark_unmergeable().
  - When unsetting the MMF_VM_MERGE_ANY flag with prctl, only unset the
    flag
  - Remove pages_volatile function (with the simplar general_profit calcu=
lation,
    the function is no longer needed)
  - Use simpler formula for calculation of general_profit

- V4:
  - removing check in prctl for MMF_VM_MERGEABLE in PR_SET_MEMORY_MERGE
    handling
  - Checking for VM_MERGEABLE AND MMF_VM_MERGE_ANY to avoid chaning vm_fl=
ags
    - This requires also checking that the vma is compatible. The
      compatibility check is provided by a new helper
    - processes which have set MMF_VM_MERGE_ANY, only need to call the
      helper and not madvise.
  - removed unmerge_vmas function, this function is no longer necessary,
    clearing the MMF_VM_MERGE_ANY bit is sufficient

- V3:
  - folded patch 1 - 6
  - folded patch 7 - 14
  - folded patch 15 - 19
  - Expanded on the use cases in the cover letter
  - Added a section on security concerns to the cover letter

- V2:
  - Added use cases to the cover letter
  - Removed the tracing patch from the patch series and posted it as an
    individual patch
  - Refreshed repo



Stefan Roesch (3):
  mm: add new api to enable ksm per process
  mm: add new KSM process and sysfs knobs
  selftests/mm: add new selftests for KSM

 Documentation/ABI/testing/sysfs-kernel-mm-ksm |   8 +
 Documentation/admin-guide/mm/ksm.rst          |   5 +-
 arch/s390/mm/gmap.c                           |   7 +
 fs/proc/base.c                                |   3 +
 include/linux/ksm.h                           |  25 ++-
 include/linux/sched/coredump.h                |   1 +
 include/uapi/linux/prctl.h                    |   2 +
 kernel/sys.c                                  |  27 +++
 mm/ksm.c                                      | 125 +++++++++++--
 mm/mmap.c                                     |   3 +
 tools/include/uapi/linux/prctl.h              |   2 +
 tools/testing/selftests/mm/Makefile           |   2 +-
 .../selftests/mm/ksm_functional_tests.c       |  91 ++++++++-
 tools/testing/selftests/mm/ksm_tests.c        | 172 ++++++++++++++----
 14 files changed, 414 insertions(+), 59 deletions(-)


base-commit: f80a6c7a37be043f7b074d1e19638675315e3566
--=20
2.31.1

