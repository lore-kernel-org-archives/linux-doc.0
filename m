Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7614AC00140
	for <linux-doc@archiver.kernel.org>; Mon,  8 Aug 2022 17:57:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244219AbiHHR5e (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 8 Aug 2022 13:57:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244092AbiHHR5B (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 8 Aug 2022 13:57:01 -0400
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A7751839A
        for <linux-doc@vger.kernel.org>; Mon,  8 Aug 2022 10:56:34 -0700 (PDT)
Received: by mail-yb1-xb4a.google.com with SMTP id i194-20020a253bcb000000b00676d86fc5d7so7884025yba.9
        for <linux-doc@vger.kernel.org>; Mon, 08 Aug 2022 10:56:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:from:to:cc;
        bh=D9R60mZ4udMapF+NpFfSHyOa59OoX0uMh+RPjpQzj1Q=;
        b=eNRxM030DKLOhrtL5bqYSMNughx6a2UFrcdYQNOMy2xGwEM8RIYbzDgO0Qr+cRrlG7
         leQpFy4g/mdb/tV0YTxYoL1QksZqc0IxxJg0F3wxsSX1ccKSaYzblLNYO6keoTM8Req6
         cajjuxZ1ZB7s1XMrbeIoJVspmPJzRx4I6ee+JExSGu3vzVquaX6zNwS1ls9m58bW6oRu
         w2kL8A1B7NhrHkoLMksRCh7L7msDEXutktd6wE5DOs2Sfh1C/tAS+/lhZV9YGI6OI1HK
         ZpwKo2QlPJonELBxUwyauzx1CTN7Nbn2HpJzaUwn7+t1OTlJI0M0LNoOhXINFzQgP+n9
         Y/Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:x-gm-message-state:from:to:cc;
        bh=D9R60mZ4udMapF+NpFfSHyOa59OoX0uMh+RPjpQzj1Q=;
        b=5TSLj/y20dBq6o+evOnpogrGgP46Zzcm9QqWbyOlmmw5q92XHIrJuo8Ia83HJ4rXGE
         Y54HboBJM8vv4oDIr2hSe52zZSO+TNDDPc/gmAVVOANRECBYCAcYj6U0FmmZK3gtiNnk
         YQJn6MktnANfRYxV4LolkCRbyzOmsmuNmqh/yUXEEvFHoY4TSBa9WzI73mhcyKrxFsa3
         EK9Km4zPSLBJ98+tbiWBH1JfKRmPX2r6SclxnyRiOPap2H7WgQrZla1qvpG78ON3eLSb
         Sn171LC0eUJUlOt8RTZ4oCkNe8FJsxusdCE+F8YvF3TmFsM8VZwQMUcM847Dkq0AhXB2
         L0nw==
X-Gm-Message-State: ACgBeo2DBYhHB2McMxBanCDP6MMFaGcfv4FjSUosQlbbDFpmBPOe576e
        H5JLLrGhbupkTKdluSv5DWLP0xgOrST96zAO8zSi
X-Google-Smtp-Source: AA6agR5KTaywCydCwtykG2+H6b+nQdzztDWi7EZVgv5coCe9zqkxOlqe6qANypuRRJkuoUBTS0lz5yfLxOdFKFcdDmID
X-Received: from ajr0.svl.corp.google.com ([2620:15c:2d4:203:7a2a:3bb5:f3a0:3bbc])
 (user=axelrasmussen job=sendgmr) by 2002:a0d:e881:0:b0:31f:3bff:2224 with
 SMTP id r123-20020a0de881000000b0031f3bff2224mr19837540ywe.302.1659981393328;
 Mon, 08 Aug 2022 10:56:33 -0700 (PDT)
Date:   Mon,  8 Aug 2022 10:56:14 -0700
In-Reply-To: <20220808175614.3885028-1-axelrasmussen@google.com>
Message-Id: <20220808175614.3885028-6-axelrasmussen@google.com>
Mime-Version: 1.0
References: <20220808175614.3885028-1-axelrasmussen@google.com>
X-Mailer: git-send-email 2.37.1.559.g78731f0fdb-goog
Subject: [PATCH v5 5/5] selftests: vm: add /dev/userfaultfd test cases to run_vmtests.sh
From:   Axel Rasmussen <axelrasmussen@google.com>
To:     Alexander Viro <viro@zeniv.linux.org.uk>,
        Andrew Morton <akpm@linux-foundation.org>,
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
        linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
        linux-mm@kvack.org, linux-security-module@vger.kernel.org,
        Shuah Khan <skhan@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This new mode was recently added to the userfaultfd selftest. We want to
exercise both userfaultfd(2) as well as /dev/userfaultfd, so add both
test cases to the script.

Reviewed-by: Shuah Khan <skhan@linuxfoundation.org>
Acked-by: Peter Xu <peterx@redhat.com>
Signed-off-by: Axel Rasmussen <axelrasmussen@google.com>
---
 tools/testing/selftests/vm/run_vmtests.sh | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/tools/testing/selftests/vm/run_vmtests.sh b/tools/testing/selftests/vm/run_vmtests.sh
index b8e7f6f38d64..e780e76c26b8 100755
--- a/tools/testing/selftests/vm/run_vmtests.sh
+++ b/tools/testing/selftests/vm/run_vmtests.sh
@@ -120,13 +120,16 @@ run_test ./gup_test -a
 # Dump pages 0, 19, and 4096, using pin_user_pages:
 run_test ./gup_test -ct -F 0x1 0 19 0x1000
 
-run_test ./userfaultfd anon 20 16
-# Hugetlb tests require source and destination huge pages. Pass in half the
-# size ($half_ufd_size_MB), which is used for *each*.
-run_test ./userfaultfd hugetlb "$half_ufd_size_MB" 32
-run_test ./userfaultfd hugetlb_shared "$half_ufd_size_MB" 32 "$mnt"/uffd-test
-rm -f "$mnt"/uffd-test
-run_test ./userfaultfd shmem 20 16
+uffd_mods=("" ":dev")
+for mod in "${uffd_mods[@]}"; do
+	run_test ./userfaultfd anon${mod} 20 16
+	# Hugetlb tests require source and destination huge pages. Pass in half
+	# the size ($half_ufd_size_MB), which is used for *each*.
+	run_test ./userfaultfd hugetlb${mod} "$half_ufd_size_MB" 32
+	run_test ./userfaultfd hugetlb_shared${mod} "$half_ufd_size_MB" 32 "$mnt"/uffd-test
+	rm -f "$mnt"/uffd-test
+	run_test ./userfaultfd shmem${mod} 20 16
+done
 
 #cleanup
 umount "$mnt"
-- 
2.37.1.559.g78731f0fdb-goog

