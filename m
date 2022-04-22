Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6A51C433FE
	for <linux-doc@archiver.kernel.org>; Fri, 22 Apr 2022 22:35:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233150AbiDVWi1 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 22 Apr 2022 18:38:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233475AbiDVWhb (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 22 Apr 2022 18:37:31 -0400
Received: from mail-yw1-x114a.google.com (mail-yw1-x114a.google.com [IPv6:2607:f8b0:4864:20::114a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9D341F627F
        for <linux-doc@vger.kernel.org>; Fri, 22 Apr 2022 14:29:53 -0700 (PDT)
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-2ec0490dc1bso81612117b3.5
        for <linux-doc@vger.kernel.org>; Fri, 22 Apr 2022 14:29:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=/z1dLT2VgPLiDImKUFQxfJeCLXLbaB4rbFSQTc8Z7xg=;
        b=T7Y5iN0BPf96fnzNK7ZHU6vX0fBe/A3dst2c12cELyfKQ79U/HOQor03zypmVLp1If
         uI8UFZO5MKdK3bq3HmTy6OycGmGbCr8KvVuboRoot8Dmc47nfO5+vN9qfcW9MqGlSZ7l
         PRJ2hmyct17qJuveqLhAfzJw5ps3ymAMGZ1k31aYcUwdb+GtUMEGkKPlOcqofEoBIlHp
         pwIx3/Q96ETwqhck8u3dbsamL8jS0omSGAoJtcg/cJqrzRfcOKdB4BklXofPQ4mG7YPR
         o6lZ1l3IUTdb5dxqkIIoZHbZ7xu4gYhZCpWvRRUJynxmAwAapUiyc6b3GBWS6hzsOm6Y
         30ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=/z1dLT2VgPLiDImKUFQxfJeCLXLbaB4rbFSQTc8Z7xg=;
        b=vIuLojRD4szp3i4maZjTV4/UvzRf3PlyRsvk5SvYGyXRkORA0m7NSw5B+Dx6CClFh7
         P11ecaEPfvCax0326MrvRyciCrYHzkdiU6f9YzNMc5bKistNCuTEz9QNgzSL0l3RRmQe
         i5NA8irU/zs0Bq8/oGCJwIAJYqGMCEHIOFfD70DCMSX0l52vXqe14/LF7LzhQFJziiH4
         qda6EodiQsU2Wgo6WDu5dTu8J0xxPp5CNuIMePBZagODyYf3Eb16DrhORAF6X8J0YyYs
         E/L1bEt59xjdRinagoJU6HfPDcNYJ5GbhKcwWw5UTMYm0abNGIDIyXk071lyhoXWuEM3
         VhlQ==
X-Gm-Message-State: AOAM532PDqUNR3aemIIxC18YMKyIFrPqV+qnj0FDOUiTl7GHbJ2+X3V6
        0JmrFvXwZc2rz9DLrX4EcxJKQl+BcPCxLLAHOiE8
X-Google-Smtp-Source: ABdhPJxdF3c0ToaXlnNGfx2U55uFir0mnBR1xoNncmXKoo64JVGSzaYeOVGtOAX0slR2R1/1i4hxxc2yi3eMNWQBn9Hr
X-Received: from ajr0.svl.corp.google.com ([2620:15c:2cd:203:7ba6:20ac:a8f7:1dbd])
 (user=axelrasmussen job=sendgmr) by 2002:a25:cad8:0:b0:645:7633:d179 with
 SMTP id a207-20020a25cad8000000b006457633d179mr6471821ybg.304.1650662993181;
 Fri, 22 Apr 2022 14:29:53 -0700 (PDT)
Date:   Fri, 22 Apr 2022 14:29:40 -0700
In-Reply-To: <20220422212945.2227722-1-axelrasmussen@google.com>
Message-Id: <20220422212945.2227722-2-axelrasmussen@google.com>
Mime-Version: 1.0
References: <20220422212945.2227722-1-axelrasmussen@google.com>
X-Mailer: git-send-email 2.36.0.rc2.479.g8af0fa9b8e-goog
Subject: [PATCH v2 1/6] selftests: vm: add hugetlb_shared userfaultfd test to run_vmtests.sh
From:   Axel Rasmussen <axelrasmussen@google.com>
To:     Alexander Viro <viro@zeniv.linux.org.uk>,
        Andrew Morton <akpm@linux-foundation.org>,
        Charan Teja Reddy <charante@codeaurora.org>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        "Dmitry V . Levin" <ldv@altlinux.org>,
        Gleb Fotengauer-Malinovskiy <glebfm@altlinux.org>,
        Hugh Dickins <hughd@google.com>, Jan Kara <jack@suse.cz>,
        Jonathan Corbet <corbet@lwn.net>,
        Mel Gorman <mgorman@techsingularity.net>,
        Mike Kravetz <mike.kravetz@oracle.com>,
        Mike Rapoport <rppt@kernel.org>, Nadav Amit <namit@vmware.com>,
        Peter Xu <peterx@redhat.com>, Shuah Khan <shuah@kernel.org>,
        Suren Baghdasaryan <surenb@google.com>,
        Vlastimil Babka <vbabka@suse.cz>, zhangyi <yi.zhang@huawei.com>
Cc:     Axel Rasmussen <axelrasmussen@google.com>,
        linux-doc@vger.kernel.org, linux-fsdevel@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This not being included was just a simple oversight. There are certain
features (like minor fault support) which are only enabled on shared
mappings, so without including hugetlb_shared we actually lose a
significant amount of test coverage.

Signed-off-by: Axel Rasmussen <axelrasmussen@google.com>
---
 tools/testing/selftests/vm/run_vmtests.sh | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/vm/run_vmtests.sh b/tools/testing/selftests/vm/run_vmtests.sh
index a2302b5faaf2..5065dbd89bdb 100755
--- a/tools/testing/selftests/vm/run_vmtests.sh
+++ b/tools/testing/selftests/vm/run_vmtests.sh
@@ -121,9 +121,11 @@ run_test ./gup_test -a
 run_test ./gup_test -ct -F 0x1 0 19 0x1000
 
 run_test ./userfaultfd anon 20 16
-# Test requires source and destination huge pages.  Size of source
-# (half_ufd_size_MB) is passed as argument to test.
+# Hugetlb tests require source and destination huge pages. Pass in half the
+# size ($half_ufd_size_MB), which is used for *each*.
 run_test ./userfaultfd hugetlb "$half_ufd_size_MB" 32
+run_test ./userfaultfd hugetlb_shared "$half_ufd_size_MB" 32 "$mnt"/uffd-test
+rm -f "$mnt"/uffd-test
 run_test ./userfaultfd shmem 20 16
 
 #cleanup
-- 
2.36.0.rc2.479.g8af0fa9b8e-goog

