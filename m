Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E907EC433F5
	for <linux-doc@archiver.kernel.org>; Mon,  1 Nov 2021 03:22:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AA34C60F42
	for <linux-doc@archiver.kernel.org>; Mon,  1 Nov 2021 03:22:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230289AbhKADYe (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 31 Oct 2021 23:24:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48182 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230281AbhKADYd (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 31 Oct 2021 23:24:33 -0400
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A082C061746
        for <linux-doc@vger.kernel.org>; Sun, 31 Oct 2021 20:22:01 -0700 (PDT)
Received: by mail-pf1-x42b.google.com with SMTP id m26so15096712pff.3
        for <linux-doc@vger.kernel.org>; Sun, 31 Oct 2021 20:22:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=d7AxA2J6mhv+bht8XixY+W1JQpl37yZ6laI/nXYn3C0=;
        b=o14HbokIKEgFJ/+kSwtba04ArHM4PbGv5cAfsG+yxQrr3mu9txB/j7YZoacwW0n53U
         KHXMITwU33aL+BAQAq87pOyYVgfcRPG0pr5p2OBETIciA43aYYuoIdEx1LPa5JmL2zY0
         uqq6PLZnmevlKP3ExmYaWvviF9UR2W2VBRXpdo/fcljcA24DUe3FijIB0EsPqfGJrHZO
         pByF79Q52sxz3FLQBpXZp0Xst/4H4qBpiSD8qaJmm2ZMk0q3s15DKZpPAVpGXnxrGGIA
         PKA8qjJqQAl5tIOlEZFhUQTaL5rY4KLsbqrioOT/wUHGTNlRm+1L+vz/gz6iu8+ahmsJ
         j7rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=d7AxA2J6mhv+bht8XixY+W1JQpl37yZ6laI/nXYn3C0=;
        b=qVb0BVBb7skQzT/8aIzT9thyFOxmqeZBG+WJiOtVcfK4jNNKnrjmMoGDIMLF003TGF
         VNdhoBAZhX9ijxT3lxGSbHFu3cneNZWN33oLb+wFnK+c7k2QH026jPmiFB7jQNE2q2Fg
         VrzArWoxdg9EUzS8l8FDXVTmZSFvz9XUtToFqUpWZNwcZPX8tI3iuHI8AtFHkU5fXGKC
         2cvcektX+FXGAzmXcD7Ztnwg4Jc+Dwgvn7D5xW6d/eP0eIASr1R14k7t7Wf/wxMQYh/V
         WLdqCdV+RTWMNaQban06murRy1yyvEb77Ro7DqQI6T1jI6jUbEb+KBoHRvU4dAI4fYlp
         J9Jg==
X-Gm-Message-State: AOAM531MCQFfMAPfkRxoZwdqR96L8gRWic2fJnqxI3ZUDsC/VCED0I7a
        bnqfnts9wVPT11NqNsFf8cHsiw==
X-Google-Smtp-Source: ABdhPJxQ7X9kJ15+P3zlG5mfTmrbi3cQkgSx9cBXscXk4yAvFdy+Pp9Xdd0rTwUemwu2oHU1LiMDKA==
X-Received: by 2002:a05:6a00:26c1:b0:481:277:6485 with SMTP id p1-20020a056a0026c100b0048102776485mr5610897pfw.12.1635736920664;
        Sun, 31 Oct 2021 20:22:00 -0700 (PDT)
Received: from localhost.localdomain ([139.177.225.242])
        by smtp.gmail.com with ESMTPSA id f8sm11860963pjq.29.2021.10.31.20.21.53
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 31 Oct 2021 20:22:00 -0700 (PDT)
From:   Muchun Song <songmuchun@bytedance.com>
To:     mike.kravetz@oracle.com, akpm@linux-foundation.org,
        osalvador@suse.de, mhocko@suse.com, song.bao.hua@hisilicon.com,
        david@redhat.com, chenhuang5@huawei.com, bodeddub@amazon.com,
        corbet@lwn.net, willy@infradead.org, 21cnbao@gmail.com
Cc:     duanxiongchun@bytedance.com, fam.zheng@bytedance.com,
        smuchun@gmail.com, zhengqi.arch@bytedance.com,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, Muchun Song <songmuchun@bytedance.com>
Subject: [PATCH v7 0/5] Free the 2nd vmemmap page associated with each HugeTLB page
Date:   Mon,  1 Nov 2021 11:16:46 +0800
Message-Id: <20211101031651.75851-1-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.21.0 (Apple Git-122)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This series can minimize the overhead of struct page for 2MB HugeTLB pages
significantly. It further reduces the overhead of struct page by 12.5% for
a 2MB HugeTLB compared to the previous approach, which means 2GB per 1TB
HugeTLB. It is a nice gain. Comments and reviews are welcome. Thanks.

The main implementation and details can refer to the commit log of patch 1.
In this series, I have changed the following four helpers, the following
table shows the impact of the overhead of those helpers.

	+------------------+-----------------------+
	|       APIs       | head page | tail page |
	+------------------+-----------+-----------+
	|    PageHead()    |     Y     |     N     |
	+------------------+-----------+-----------+
	|    PageTail()    |     Y     |     N     |
	+------------------+-----------+-----------+
	|  PageCompound()  |     N     |     N     |
	+------------------+-----------+-----------+
	|  compound_head() |     Y     |     N     |
	+------------------+-----------+-----------+

	Y: Overhead is increased.
	N: Overhead is _NOT_ increased.

It shows that the overhead of those helpers on a tail page don't change
between "hugetlb_free_vmemmap=on" and "hugetlb_free_vmemmap=off". But the
overhead on a head page will be increased when "hugetlb_free_vmemmap=on"
(except PageCompound()). So I believe that Matthew Wilcox's folio series
will help with this.

The users of PageHead() and PageTail() are much less than compound_head()
and most users of PageTail() are VM_BUG_ON(), so I have done some tests
about the overhead of compound_head() on head pages.

I have tested the overhead of calling compound_head() on a head page, which
is 2.11ns (Measure the call time of 10 million times compound_head(), and
then average).

For a head page whose address is not aligned with PAGE_SIZE or a non-compound
page, the overhead of compound_head() is 2.54ns which is increased by 20%.
For a head page whose address is aligned with PAGE_SIZE, the overhead of
compound_head() is 2.97ns which is increased by 40%. Most pages are the former.
I do not think the overhead is significant since the overhead of compound_head()
itself is low.

Changlogs in v7:
  1. Fix a typo (change page_head_if_fake to page_fixed_fake_head) in the
     commit log of patch 2.
  2. Move details of implementation from cover letter to the commit log of
     patch 1.
  3. Add some overhead numbers to the cover letter.

Changlogs in v6:
  1. Add test case to tools/testing/selftests/vm/run_vmtests.sh.

Changlogs in v5:
  1. Move NR_RESET_STRUCT_PAGE to the front of reset_struct_pages().
  2. Collect Reviewed-by tags.

  Thanks Barry for his suggestions and reviews.

Changlogs in v4:
  1. Move hugetlb_free_vmemmap_enabled from hugetlb.h to page-flags.h.
  2. Collect Reviewed-by.
  3. Add a new patch to move vmemmap functions related to HugeTLB to
     the scope of the CONFIG_HUGETLB_PAGE_FREE_VMEMMAP.

  Thanks Barry for his suggestions and reviews.

Changlogs in v3:
  1. Rename page_head_if_fake() to page_fixed_fake_head().
  2. Introducing a new helper page_is_fake_head() to make code more readable.
  3. Update commit log of patch 3 to add more judgements.
  4. Add some comments in check_page_flags() in the patch 4.

  Thanks Barry for his suggestions and reviews.

Changlogs in v2:
  1. Drop two patches of introducing PAGEFLAGS_MASK from this series.
  2. Let page_head_if_fake() return page instead of NULL.
  3. Add a selftest to check if PageHead or PageTail work well.

Muchun Song (5):
  mm: hugetlb: free the 2nd vmemmap page associated with each HugeTLB
    page
  mm: hugetlb: replace hugetlb_free_vmemmap_enabled with a static_key
  mm: sparsemem: use page table lock to protect kernel pmd operations
  selftests: vm: add a hugetlb test case
  mm: sparsemem: move vmemmap related to HugeTLB to
    CONFIG_HUGETLB_PAGE_FREE_VMEMMAP

 Documentation/admin-guide/kernel-parameters.txt |   2 +-
 include/linux/hugetlb.h                         |   6 -
 include/linux/mm.h                              |   2 +
 include/linux/page-flags.h                      |  90 ++++++++++++++-
 mm/hugetlb_vmemmap.c                            |  68 ++++++-----
 mm/memory_hotplug.c                             |   2 +-
 mm/ptdump.c                                     |  16 ++-
 mm/sparse-vmemmap.c                             |  70 +++++++++---
 tools/testing/selftests/vm/.gitignore           |   1 +
 tools/testing/selftests/vm/Makefile             |   1 +
 tools/testing/selftests/vm/hugepage-vmemmap.c   | 144 ++++++++++++++++++++++++
 tools/testing/selftests/vm/run_vmtests.sh       |  11 ++
 12 files changed, 350 insertions(+), 63 deletions(-)
 create mode 100644 tools/testing/selftests/vm/hugepage-vmemmap.c

-- 
2.11.0

