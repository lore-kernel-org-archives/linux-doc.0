Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78FBCE95A8E
	for <linux-doc@archiver.kernel.org>; Mon,  9 Oct 2023 09:04:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345584AbjJIJED (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 9 Oct 2023 05:04:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54358 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345707AbjJIJEC (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 9 Oct 2023 05:04:02 -0400
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7477EA2
        for <linux-doc@vger.kernel.org>; Mon,  9 Oct 2023 02:03:42 -0700 (PDT)
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-69fc829d7b1so1385949b3a.1
        for <linux-doc@vger.kernel.org>; Mon, 09 Oct 2023 02:03:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1696842222; x=1697447022; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zVPBUts0sM4ll2vXGLp7ZtXBxcW/h1TyBHpbZpV8ZlI=;
        b=hlTgykwID4cohBQxftpD30xjO1kTA+GlU3TXe/CGkYloPIuqBBvDww9+HKJQXDUak0
         r9BfCXXIPiAdPp4cOplzgSgVlILghz3dL9DMfq8Y6zLz3KC24CUSTcqtacqZ+hv0FGWT
         mr9btDAF+fbBI1Oo+3VNyJu6S56J87uwyJig7kF4EoMFIn3g1ji7Oxm2ABYoXzb2DRy1
         ky4JM7Zn5N4/xqs6KupzcWOSKEuC2jogIvJp69tISahpNLxVyhT4z6Q0n/6vESdETWcQ
         ns6ZuVHihoa0ri/D7B2wO7kl4pHxLWKQhKBo3RAGVHjdfhMF/WnSkOuxcLL39+Woc0lk
         5OBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696842222; x=1697447022;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zVPBUts0sM4ll2vXGLp7ZtXBxcW/h1TyBHpbZpV8ZlI=;
        b=V+/2YHbA0oXyL3O6nSRZPF3RZHS9CuGkKsdcOjK/h/3cPiRaloGoKwYunR7Qh0PrWI
         PSc93Jen36SNH1QVYSvUzEx0ywDanmdLA5S8Jjo/G6wA+aMin+FwPRzoEV2S4I6t/yRO
         MXIRE7EhoMyyiAJ8V86s9GYz/S3lROSoRk2CKhzm38JjCZjIB8Op/c3g3GryESqg7bnu
         h+aWVnppDVOdizDpMz41J/bmIoMiHC67/J4DuBgAJRyH5K5WHonmznEIBaucVlWK/AkZ
         EzHBYRyrZKJZL3OqvgKF4/nOprjWb5NVeKcykN5J/nT9nUB8JcCBiCr1sQRIbHaSrvtk
         C7ag==
X-Gm-Message-State: AOJu0YyTErHno2GQw/kA9Tp4Sa4BcjAXY4xqwr+xRUF54mJSZDAKcOG4
        vJvFtfwjquQdqNh+rad4s47bkQ==
X-Google-Smtp-Source: AGHT+IGL5ggcIxz/u0/Y14JkIJ+W5YgdS64GhkUPDuRS8uFzbKt1pKOfnH6ukCzYRqW5rAeL6aDlFA==
X-Received: by 2002:a05:6a20:72a2:b0:16b:d470:b403 with SMTP id o34-20020a056a2072a200b0016bd470b403mr9389736pzk.28.1696842221863;
        Mon, 09 Oct 2023 02:03:41 -0700 (PDT)
Received: from GL4FX4PXWL.bytedance.net ([139.177.225.243])
        by smtp.gmail.com with ESMTPSA id fk3-20020a056a003a8300b00690ca4356f1sm5884847pfb.198.2023.10.09.02.03.35
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 09 Oct 2023 02:03:41 -0700 (PDT)
From:   Peng Zhang <zhangpeng.00@bytedance.com>
To:     Liam.Howlett@oracle.com, corbet@lwn.net, akpm@linux-foundation.org,
        willy@infradead.org, brauner@kernel.org, surenb@google.com,
        michael.christie@oracle.com, mjguzik@gmail.com,
        mathieu.desnoyers@efficios.com, npiggin@gmail.com,
        peterz@infradead.org, oliver.sang@intel.com, mst@redhat.com
Cc:     zhangpeng.00@bytedance.com, maple-tree@lists.infradead.org,
        linux-mm@kvack.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org
Subject: [PATCH v4 00/10] Introduce __mt_dup() to improve the performance of fork()
Date:   Mon,  9 Oct 2023 17:03:10 +0800
Message-Id: <20231009090320.64565-1-zhangpeng.00@bytedance.com>
X-Mailer: git-send-email 2.37.0 (Apple Git-136)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi all,

This series introduces __mt_dup() to improve the performance of fork(). During
the duplication process of mmap, all VMAs are traversed and inserted one by one
into the new maple tree, causing the maple tree to be rebalanced multiple times.
Balancing the maple tree is a costly operation. To duplicate VMAs more
efficiently, mtree_dup() and __mt_dup() are introduced for the maple tree. They
can efficiently duplicate a maple tree.

Here are some algorithmic details about {mtree, __mt}_dup(). We perform a DFS
pre-order traversal of all nodes in the source maple tree. During this process,
we fully copy the nodes from the source tree to the new tree. This involves
memory allocation, and when encountering a new node, if it is a non-leaf node,
all its child nodes are allocated at once.

Some previous discussions can be referred to as [1]. For a more detailed
analysis of the algorithm, please refer to the logs for patch [3/10] and patch
[10/10]

There is a "spawn" in byte-unixbench[2], which can be used to test the
performance of fork(). I modified it slightly to make it work with
different number of VMAs.

Below are the test results. The first row shows the number of VMAs.
The second and third rows show the number of fork() calls per ten seconds,
corresponding to next-20231006 and the this patchset, respectively. The
test results were obtained with CPU binding to avoid scheduler load
balancing that could cause unstable results. There are still some
fluctuations in the test results, but at least they are better than the
original performance.

21     121   221    421    821    1621   3221   6421   12821  25621  51221
112100 76261 54227  34035  20195  11112  6017   3161   1606   802    393
114558 83067 65008  45824  28751  16072  8922   4747   2436   1233   599
2.19%  8.92% 19.88% 34.64% 42.37% 44.64% 48.28% 50.17% 51.68% 53.74% 52.42%

Thanks for Liam's review.

Changes since v3:
 - Modified the user-space kmem_cache_alloc_bulk() to align its behavior with
   that of the kernel.
 - Made minor modifications to the comments for {__mt,mtree}_dup() and their
   sub-functions.
 - Made minor modifications to the error handling of mas_dup_alloc().
 - Adjusted the code style of undo_dup_mmap() and also fixed a potential bug in
   it.
 - Rebased onto next-20231006.

[1] https://lore.kernel.org/lkml/463899aa-6cbd-f08e-0aca-077b0e4e4475@bytedance.com/
[2] https://github.com/kdlucas/byte-unixbench/tree/master

v1: https://lore.kernel.org/lkml/20230726080916.17454-1-zhangpeng.00@bytedance.com/
v2: https://lore.kernel.org/lkml/20230830125654.21257-1-zhangpeng.00@bytedance.com/
v3: https://lore.kernel.org/lkml/20230925035617.84767-1-zhangpeng.00@bytedance.com/

Peng Zhang (10):
  maple_tree: Add mt_free_one() and mt_attr() helpers
  maple_tree: Introduce {mtree,mas}_lock_nested()
  maple_tree: Introduce interfaces __mt_dup() and mtree_dup()
  radix tree test suite: Align kmem_cache_alloc_bulk() with kernel
    behavior.
  maple_tree: Add test for mtree_dup()
  maple_tree: Update the documentation of maple tree
  maple_tree: Skip other tests when BENCH is enabled
  maple_tree: Update check_forking() and bench_forking()
  maple_tree: Preserve the tree attributes when destroying maple tree
  fork: Use __mt_dup() to duplicate maple tree in dup_mmap()

 Documentation/core-api/maple_tree.rst |   4 +
 include/linux/maple_tree.h            |   7 +
 include/linux/mm.h                    |   1 +
 kernel/fork.c                         |  34 ++-
 lib/maple_tree.c                      | 300 ++++++++++++++++++++-
 lib/test_maple_tree.c                 |  69 +++--
 mm/internal.h                         |   3 +-
 mm/memory.c                           |   7 +-
 mm/mmap.c                             |  50 +++-
 tools/include/linux/spinlock.h        |   1 +
 tools/testing/radix-tree/linux.c      |  45 +++-
 tools/testing/radix-tree/maple.c      | 363 ++++++++++++++++++++++++++
 12 files changed, 818 insertions(+), 66 deletions(-)

-- 
2.20.1

