Return-Path: <SRS0=vG9z=DM=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10B46C4363A
	for <linux-doc@archiver.kernel.org>; Mon,  5 Oct 2020 08:14:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BD8842080C
	for <linux-doc@archiver.kernel.org>; Mon,  5 Oct 2020 08:14:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725978AbgJEIOa (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 5 Oct 2020 04:14:30 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:57849 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725895AbgJEIOa (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 5 Oct 2020 04:14:30 -0400
Received: from mail-wr1-f70.google.com ([209.85.221.70])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <andrea.righi@canonical.com>)
        id 1kPLdb-0001H6-8n
        for linux-doc@vger.kernel.org; Mon, 05 Oct 2020 08:14:27 +0000
Received: by mail-wr1-f70.google.com with SMTP id d13so3669328wrr.23
        for <linux-doc@vger.kernel.org>; Mon, 05 Oct 2020 01:14:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=04NfvqcE293cqSxzmzA7UDEenFQaTMOEO1JaCZLQgms=;
        b=TU9CoiFypIduCQl4mr0WDiWtfzvd57M2gdS6DGKokW8IKeZjJ9NxcIO0vJqqpQ6Sco
         6WWYr+9GSsofQC3IV3kLmb/KX6yFd9hoAFnkkrW3svLixb+I4wwdYockhV6bH9OkDSrU
         yx3fKjwj+13xH/s/fC6gOpAhqHdTtsQcddm/aeqg0BnWBkx1hmTBgX8SMRS7KdKt4y1a
         cHiNI3bZs6D3oT+uvBjckq+GbJQlXbi2aUwBRXzDkIncVZVzAreB54nxWWDY9IbfU1AU
         UtvapoewP+CKMN9IEMMachWiKHyDfw+8efArexSzFVHWgZbAi3Gq3+/EvS/DOGNxJqob
         WQsw==
X-Gm-Message-State: AOAM533jgjQpyVIKd+HcfrFfYO2eYSGuUOMl/tmIO84PPFfFTXldV9Th
        jbLowBzKdkc1+tfJfmFTQZ+5VE6k6fhoI74ntp0jLSz8Hs3NoegQJ6Q8dk5I+wVptCSNdANFTTX
        +r4URIRBNMP/wJ7GTbQ3N1mstcM3hVX/+XloJmg==
X-Received: by 2002:adf:c3c2:: with SMTP id d2mr1763590wrg.191.1601885666767;
        Mon, 05 Oct 2020 01:14:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy/vSx89vE5EQY/p7M5JNzqT6l1/+ZcZKgMzOZLy7zCPdPEe+yrwl2TQ5atBaon8TgjIaK/tQ==
X-Received: by 2002:adf:c3c2:: with SMTP id d2mr1763556wrg.191.1601885666376;
        Mon, 05 Oct 2020 01:14:26 -0700 (PDT)
Received: from xps-13-7390.homenet.telecomitalia.it (host-79-36-133-218.retail.telecomitalia.it. [79.36.133.218])
        by smtp.gmail.com with ESMTPSA id a15sm13168855wrn.3.2020.10.05.01.14.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2020 01:14:25 -0700 (PDT)
From:   Andrea Righi <andrea.righi@canonical.com>
To:     Michal Hocko <mhocko@kernel.org>,
        Vladimir Davydov <vdavydov.dev@gmail.com>
Cc:     Li Zefan <lizefan@huawei.com>, Tejun Heo <tj@kernel.org>,
        Johannes Weiner <hannes@cmpxchg.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Luigi Semenzato <semenzato@google.com>,
        "Rafael J . Wysocki" <rafael@kernel.org>, cgroups@vger.kernel.org,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org
Subject: [PATCH RFC v2] Opportunistic memory reclaim
Date:   Mon,  5 Oct 2020 10:13:11 +0200
Message-Id: <20201005081313.732745-1-andrea.righi@canonical.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

## Overview

Opportunistic memory reclaim aims to introduce a new interface that
allows user-space to trigger an artificial memory pressure condition and
force the kernel to reclaim memory (dropping page cache pages, swapping
out anonymous memory, etc.).

### Motivation

Reclaiming memory in advance to prepare the system to be more responsive
when needed.

### Use cases

 - Reduce system memory footprint
 - Speed up hibernation time
 - Speed up VM migration time
 - Prioritize responsiveness of foreground applications vs background
   applications
 - Prepare the system to be more responsiveness during large allocation
   bursts

## Interface

This feature is provided by adding a new file to each memcg:
memory.swap.reclaim.

Writing a number to this file forces a memcg to reclaim memory up to
that number of bytes ("max" means as much memory as possible). Reading
from the this file returns the amount of bytes reclaimed in the last
opportunistic memory reclaim attempt.

Memory reclaim can be interrupted sending a signal to the process that
is writing to memory.swap.reclaim (i.e., to set a timeout for the whole
memory reclaim run).

## Example usage

This feature has been successfully used to improve hibernation time of
cloud computing instances.

Certain cloud providers allow to run "spot instances": low-priority
instances that run when there are spare resources available and can be
stopped at any time to prioritize other more privileged instances [2].

Hibernation can be used to stop these low-priority instances nicely,
rather than losing state when the instance is shut down. Being able to
quickly stop low-priority instances can be critical to provide a better
quality of service in the overall cloud infrastructure [1].

The main bottleneck of hibernation is represented by the I/O generated
to write all the main memory (hibernation image) to a persistent
storage.

Opportunistic memory reclaimed can be used to reduce the size of the
hibernation image in advance, for example if the system is idle for a
certain amount of time, so if an hibernation request happens, the kernel
has already saved most of the memory to the swap device (caches have
been dropped, etc.) and hibernation can complete quickly.

## Testing and results

Here is a simple test case to show the effectiveness of this feature.

Environment:
```
   - VM (kvm):
     8GB of RAM
     disk speed: 100 MB/s
     8GB swap file on ext4 (/swapfile)
```

Test case:
```
  - allocate 85% of memory
  - wait for 60s almost in idle
  - hibernate and resume the system (measuring the time)
```

Result:
  - average of 10 runs tested with `/sys/power/image_size=default` and
    `/sys/power/image_size=0`:
```
                                 5.9-vanilla   5.9-mm_reclaim
                                 -----------   --------------
  [hibernate] image_size=default      49.07s            3.40s
     [resume] image_size=default      18.35s            7.13s

  [hibernate] image_size=0            71.55s            4.72s
     [resume] image_size=0             7.49s            7.41s
```

NOTE #1: in the `5.9-mm_reclaim` case a simple user-space daemon detects
when the system is idle for a certain amount of time and triggers the
opportunistic memory reclaim.

NOTE #2: `/sys/power/image_size=0` can be used with `5.9-vanilla` to
speed up resume time (because it shrinks even more the hibernation
image) at the cost of increasing hibernation time; with `5.9-mm_reclaim`
performance are pretty much identical in both cases, because the
hibernation image is already reduced to the minimum when the hibernation
request happens.

## Conclusion

Being able to trigger memory reclaim from user-space allows to prepare
the system in advance to be more responsive when needed.

This feature has been used with positive test results to speed up
hibernation time of cloud computing instances, but it can also provide
benefits to other use cases, for example:

 - prioritize responsiveness of foreground applications vs background
   applications

 - improve system responsiveness during large allocation bursts
   (preparing system by reclaiming memory in advance, e.g. using some
   idle cycles)

 - reduce overall system memory footprint (especially in VM / cloud
   computing environments)

## See also

 - [1] https://lwn.net/Articles/821158/
 - [2] https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/spot-interruptions.html
 - [3] user-space tools/scripts: https://github.com/arighi/opportunistic-memory-reclaim
 - [4] previous version: https://lore.kernel.org/lkml/20200601160636.148346-1-andrea.righi@canonical.com/

## Changes in v2:
 - move ABI from hibernation to memcg (since this feature can be used
   also in other contexts and it's not hibernation-specific)
 - drop memory release functionality (to re-load swapped out pages,
   since it ended being not very useful)
 - added the possibility to show the number of memory reclaimed in the
   last attempt (per-memcg)

----------------------------------------------------------------
Andrea Righi (2):
      mm: memcontrol: make shrink_all_memory() memcg aware
      mm: memcontrol: introduce opportunistic memory reclaim

 Documentation/admin-guide/cgroup-v2.rst | 18 ++++++++++
 include/linux/memcontrol.h              |  4 +++
 include/linux/swap.h                    |  9 ++++-
 mm/memcontrol.c                         | 59 +++++++++++++++++++++++++++++++++
 mm/vmscan.c                             |  6 ++--
 5 files changed, 92 insertions(+), 4 deletions(-)

