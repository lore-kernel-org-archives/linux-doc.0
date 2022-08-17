Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45BBBC25B08
	for <linux-doc@archiver.kernel.org>; Wed, 17 Aug 2022 21:47:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242100AbiHQVri (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 17 Aug 2022 17:47:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48918 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241794AbiHQVrh (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 17 Aug 2022 17:47:37 -0400
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com [IPv6:2607:f8b0:4864:20::1149])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AEE13AB1AA
        for <linux-doc@vger.kernel.org>; Wed, 17 Aug 2022 14:47:35 -0700 (PDT)
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-334ab1f0247so62370617b3.7
        for <linux-doc@vger.kernel.org>; Wed, 17 Aug 2022 14:47:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:from:to:cc;
        bh=cU7/6qINBgFAfTXfLa178LOY1yjmrSCVESmZNe7FU4M=;
        b=hkkW+cPBtBwBtd13GQEN9rmENzaMrtG41NPJb/PgUS0IMKflR0ybOP+DOGkh+tegM3
         KBc0tw/HnrcDhmSWECnXug+OFT36fJNH86hY9N4cveCHsYT2LEukQiA09NHf7PSze2Ze
         gZ6LkYMOcbz5YFTbs94rJ/F5oy6jy0zQu2NiuE5bYAa5RNRIKLPf9+P9+LOt+MgI9FBW
         Sp/z8rhpongmYqFSVPDBXxTdr6wo5uIPwD7YOlJ9g45SO426YhCNSRnTzgnZf4HMx+Qs
         ciFa5HfjDwGNQvaxJcZqAUAIcrXkTU0CcM/vlFfkF1C7iOesvdf8kAzEvWJPbtltnegU
         mAiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:x-gm-message-state:from:to:cc;
        bh=cU7/6qINBgFAfTXfLa178LOY1yjmrSCVESmZNe7FU4M=;
        b=c18B2bop6G+lTqyclq6JFfoJffE5d7G61BRXuRCIeXSgxpESxYCI4P4a2y7ZeGeMLh
         ayI4lst5L729jr92jjNbIo5mbUNE5eunl/JZXYolHIi0vj42iioP2B9LGB82bj8/fMsF
         OtEJ3oG87ia7PDmD7bYl1KW2RmYU3FjxLCvrpRY39iVVo6z9+Glq7cQIPNYYaFIvg3JA
         wTm36f7JEmB8ZbGPJITajdNB8IJVOmZdboWlTM6u3h+8mX4lZGImNwtYJ1BfS8FgUh3k
         Nk1gSLkYf7CmdxeJQfzeP+XEtfaWYmrgxuNngvDqUn6pKhSlr3zGucERmcLdfZ399gp9
         vlYA==
X-Gm-Message-State: ACgBeo1EJmlqvdcdEa6QoNn6fBDZeH5uAjk3qcYldKgmnNqW7WyfOexO
        cYnCmAuyaJObeSW77QIt9dXTFOEqpCjBUwnDYEAP
X-Google-Smtp-Source: AA6agR6m2oPxeL8QFTcUaPmrHHrUfsAkYPB07Q9g2heOngwoQkb+NCEv/HhiuzywTvWsUou7cQl2z0Qm9xTtUBZYcsCH
X-Received: from ajr0.svl.corp.google.com ([2620:15c:2d4:203:2f41:f176:4bac:b729])
 (user=axelrasmussen job=sendgmr) by 2002:a81:ae0a:0:b0:324:59ab:feec with
 SMTP id m10-20020a81ae0a000000b0032459abfeecmr144125ywh.7.1660772854950; Wed,
 17 Aug 2022 14:47:34 -0700 (PDT)
Date:   Wed, 17 Aug 2022 14:47:24 -0700
In-Reply-To: <20220817214728.489904-1-axelrasmussen@google.com>
Message-Id: <20220817214728.489904-2-axelrasmussen@google.com>
Mime-Version: 1.0
References: <20220817214728.489904-1-axelrasmussen@google.com>
X-Mailer: git-send-email 2.37.1.595.g718a3a8f04-goog
Subject: [PATCH v6 1/5] selftests: vm: add hugetlb_shared userfaultfd test to run_vmtests.sh
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

This not being included was just a simple oversight. There are certain
features (like minor fault support) which are only enabled on shared
mappings, so without including hugetlb_shared we actually lose a
significant amount of test coverage.

Reviewed-by: Shuah Khan <skhan@linuxfoundation.org>
Reviewed-by: Peter Xu <peterx@redhat.com>
Signed-off-by: Axel Rasmussen <axelrasmussen@google.com>
---
 tools/testing/selftests/vm/run_vmtests.sh | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/vm/run_vmtests.sh b/tools/testing/selftests/vm/run_vmtests.sh
index de86983b8a0f..b8e7f6f38d64 100755
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
2.37.1.595.g718a3a8f04-goog

