Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A1E6C433EF
	for <linux-doc@archiver.kernel.org>; Tue, 19 Jul 2022 19:57:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239923AbiGST5Y (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 19 Jul 2022 15:57:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239202AbiGST4v (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 19 Jul 2022 15:56:51 -0400
Received: from mail-yw1-x114a.google.com (mail-yw1-x114a.google.com [IPv6:2607:f8b0:4864:20::114a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BCC165D5AC
        for <linux-doc@vger.kernel.org>; Tue, 19 Jul 2022 12:56:45 -0700 (PDT)
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-31e5cc477dcso20544877b3.0
        for <linux-doc@vger.kernel.org>; Tue, 19 Jul 2022 12:56:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=hOhehCg3VD/THunYJJ5B4YThbuYZbL9+a5Qwaql9g98=;
        b=bNEJzZtKoIwRRVCbEhhzPBFWZtV6mxX5h0TNf42DduzDwcxSAljzJzxILukQgkAqZJ
         Fr4hgnnXxmToxkm5HMEiBThZjYFkjtQNe1w0gNK8HVvBtsDUcNgn+QTuCIz9wKiHWsOa
         rQ+x3lFIMfgeny/J1BHAsDcYfSwoYWcXCMgbYh/VWoIVx1qsJxbRI/zFLssciOfAf1OO
         4v+uBp9+wTcaNYpEFGhApHT+SfhxwXOIqt2T2pAjvhX1U9EHcdMMY5T/0cmp5MO2+olo
         EL/TuCXI7fV8EMi8yISn4WQ3LWCqnWkhxLy3WcnraSF8Qfb11rn+rA/jNwzFARxSTaeR
         vsiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=hOhehCg3VD/THunYJJ5B4YThbuYZbL9+a5Qwaql9g98=;
        b=qdq6Ft+id+fRMU/GKVZTNbMMucSSDDD0SvmDum1XrnjGFpi6IOUMiiMnFBSo4eXIiN
         KXyQxSeswJl4BMIWCys+VT8n87mMFaK1nlCx566lWaKK2eqL71CFTTNIk6Ebw1YC2/mw
         J2tGmhp5NrL6Cg/9tTrW6gMbsL+Z59Pc+3qHl+0LXUxdgtbXmOR0JyrMe4SFdoLZCWSj
         0sJhX0Bhz88g8hY6uoKQeL+rXDtD1tc902l0GxR+C1GZOMstU5y5HupcEmBPc/CrfM0X
         ePDNZ51QC0Gcu1+BP4sTD0iYhNSwqMxeAT94hSlMgOAK52nu+Ty345vZQOt+yHzoxo4m
         LcuQ==
X-Gm-Message-State: AJIora+btAH1M+H9NzVFAbo/8ceKtBa/Y+HpDs3a2JlwYf5cKtHpBVc/
        TjQIzXhqWriNiEXLnKNOrHDtvvuKNiRMvTiUzStb
X-Google-Smtp-Source: AGRyM1sJa7Fbwmi70rsvyDqxe2kH1B8xy8UoSr0mRkjdLSB4LR9SWeGIONuOcxkrQy2m8DeHjejHuwm+ncnhHIgcyBt6
X-Received: from ajr0.svl.corp.google.com ([2620:15c:2d4:203:a065:9221:e40d:4fbe])
 (user=axelrasmussen job=sendgmr) by 2002:a25:2e50:0:b0:669:9a76:beb with SMTP
 id b16-20020a252e50000000b006699a760bebmr34308174ybn.597.1658260604865; Tue,
 19 Jul 2022 12:56:44 -0700 (PDT)
Date:   Tue, 19 Jul 2022 12:56:28 -0700
In-Reply-To: <20220719195628.3415852-1-axelrasmussen@google.com>
Message-Id: <20220719195628.3415852-6-axelrasmussen@google.com>
Mime-Version: 1.0
References: <20220719195628.3415852-1-axelrasmussen@google.com>
X-Mailer: git-send-email 2.37.0.170.g444d1eabd0-goog
Subject: [PATCH v4 5/5] selftests: vm: add /dev/userfaultfd test cases to run_vmtests.sh
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
        linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        linux-kselftest@vger.kernel.org,
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
 tools/testing/selftests/vm/run_vmtests.sh | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/tools/testing/selftests/vm/run_vmtests.sh b/tools/testing/selftests/vm/run_vmtests.sh
index e70ae0f3aaf6..156f864030fc 100755
--- a/tools/testing/selftests/vm/run_vmtests.sh
+++ b/tools/testing/selftests/vm/run_vmtests.sh
@@ -121,12 +121,17 @@ run_test ./gup_test -a
 run_test ./gup_test -ct -F 0x1 0 19 0x1000
 
 run_test ./userfaultfd anon 20 16
+run_test ./userfaultfd anon:dev 20 16
 # Hugetlb tests require source and destination huge pages. Pass in half the
 # size ($half_ufd_size_MB), which is used for *each*.
 run_test ./userfaultfd hugetlb "$half_ufd_size_MB" 32
+run_test ./userfaultfd hugetlb:dev "$half_ufd_size_MB" 32
 run_test ./userfaultfd hugetlb_shared "$half_ufd_size_MB" 32 "$mnt"/uffd-test
 rm -f "$mnt"/uffd-test
+run_test ./userfaultfd hugetlb_shared:dev "$half_ufd_size_MB" 32 "$mnt"/uffd-test
+rm -f "$mnt"/uffd-test
 run_test ./userfaultfd shmem 20 16
+run_test ./userfaultfd shmem:dev 20 16
 
 #cleanup
 umount "$mnt"
-- 
2.37.0.170.g444d1eabd0-goog

