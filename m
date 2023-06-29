Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EBC4EB64DD
	for <linux-doc@archiver.kernel.org>; Thu, 29 Jun 2023 20:51:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232195AbjF2UvI (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 29 Jun 2023 16:51:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232260AbjF2Uu4 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 29 Jun 2023 16:50:56 -0400
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com [IPv6:2607:f8b0:4864:20::1149])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8792635A6
        for <linux-doc@vger.kernel.org>; Thu, 29 Jun 2023 13:50:54 -0700 (PDT)
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-5734d919156so9275517b3.3
        for <linux-doc@vger.kernel.org>; Thu, 29 Jun 2023 13:50:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1688071853; x=1690663853;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=0eR1m0YpsGhZ6GlqZ9XuYhhV42VymJr50nJOc8nZiNo=;
        b=3cQsv9mPUr/J47bNoSUJhw0yv5GwYe9VZP9mYSYio932WB5S45QeiLp3sUUgqKWWVH
         dSxCe5jkZQeEy91/Za56iq/BaKt7D2eO5CKC5tFRQYXavX5XUCleRaiiLN/LYOpTc3Q5
         TlyJDS6v9N9nUKx4AeHRICAHwHnZXdJB2EprVzPDgrV+x6B+GNNBpU5V0gfMamqVpbki
         nvs6vizS27HjxtsanHmKiVM1v+306yk8JhmYhHT5HisNsno4bY2z/AyQxRY5mcHLj0/S
         73GQMk4SEbiPfcHxLnui5ipf505zkiJKpuRvNi5XJnjd8ujS1kh0z5BvTGrPJHuMpVHk
         xgHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688071853; x=1690663853;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0eR1m0YpsGhZ6GlqZ9XuYhhV42VymJr50nJOc8nZiNo=;
        b=dK6ngr+DxWOnlt2vK5JF/58m2baSsA3TsrRx3z+88lUdBtHmFAapOn3ESZ/zxws8dz
         /SiFcsEDUmVWA4b+4njRpz95ZmmlLjJPMoKmxXzi7/WwI66SYgEcYaGqfJWWyM+n+r2q
         45qudY4NVeYajWaaJjuwp12H1hEHmF/7BqnRUw17yiKNll6nAOmdpMv7qqgGU58P+waS
         SE9tvP+/yZI2n/ynGYfS8qJ/cNHzKd25lCcORE1qJAEjIGl602keRO3JbO5DMX2PPk8K
         /Ld/dXAgtUs7X61VNV2d3xzf9j8Adumvj+lrVgGi6/0qP44hKxAsM7LBK1Agh/74i/L9
         j6ig==
X-Gm-Message-State: ABy/qLaz14TbMfqasIkxw7bxtQp5fTS7F/W0u8ugnvkssSFopxxW8ztZ
        FkMv7ns7Fp/zSx3+gi9unZXL9tG1qAcqT8gPRmbe
X-Google-Smtp-Source: APBJJlGMR6Hew5dlxFm7tULAhbAWqjtH0IRMMwzkK9vijNpv3CfU43JDb01xtUzDErorDPisxqOLpILC+1eZPblYAKLk
X-Received: from axel.svl.corp.google.com ([2620:15c:2a3:200:e20f:5917:3efa:d4bb])
 (user=axelrasmussen job=sendgmr) by 2002:a0d:dfd0:0:b0:56c:e2da:f440 with
 SMTP id i199-20020a0ddfd0000000b0056ce2daf440mr4758ywe.0.1688071853655; Thu,
 29 Jun 2023 13:50:53 -0700 (PDT)
Date:   Thu, 29 Jun 2023 13:50:38 -0700
In-Reply-To: <20230629205040.665834-1-axelrasmussen@google.com>
Mime-Version: 1.0
References: <20230629205040.665834-1-axelrasmussen@google.com>
X-Mailer: git-send-email 2.41.0.255.g8b1d071c50-goog
Message-ID: <20230629205040.665834-4-axelrasmussen@google.com>
Subject: [PATCH v2 4/6] selftests/mm: refactor uffd_poll_thread to allow
 custom fault handlers
From:   Axel Rasmussen <axelrasmussen@google.com>
To:     Alexander Viro <viro@zeniv.linux.org.uk>,
        Andrew Morton <akpm@linux-foundation.org>,
        Christian Brauner <brauner@kernel.org>,
        David Hildenbrand <david@redhat.com>,
        Huang Ying <ying.huang@intel.com>,
        Hugh Dickins <hughd@google.com>,
        James Houghton <jthoughton@google.com>,
        Jiaqi Yan <jiaqiyan@google.com>,
        Jonathan Corbet <corbet@lwn.net>,
        "Liam R. Howlett" <Liam.Howlett@oracle.com>,
        Miaohe Lin <linmiaohe@huawei.com>,
        Mike Kravetz <mike.kravetz@oracle.com>,
        "Mike Rapoport (IBM)" <rppt@kernel.org>,
        Muchun Song <muchun.song@linux.dev>,
        Nadav Amit <namit@vmware.com>,
        Naoya Horiguchi <naoya.horiguchi@nec.com>,
        Peter Xu <peterx@redhat.com>, Shuah Khan <shuah@kernel.org>,
        ZhangPeng <zhangpeng362@huawei.com>
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
        linux-kselftest@vger.kernel.org,
        Axel Rasmussen <axelrasmussen@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Previously, we had "one fault handler to rule them all", which used
several branches to deal with all of the scenarios required by all of
the various tests.

In upcoming patches, I plan to add a new test, which has its own
slightly different fault handling logic. Instead of continuing to add
cruft to the existing fault handler, let's allow tests to define custom
ones, separate from other tests.

Signed-off-by: Axel Rasmussen <axelrasmussen@google.com>
---
 tools/testing/selftests/mm/uffd-common.c |  5 ++++-
 tools/testing/selftests/mm/uffd-common.h |  3 +++
 tools/testing/selftests/mm/uffd-stress.c | 12 +++++++-----
 3 files changed, 14 insertions(+), 6 deletions(-)

diff --git a/tools/testing/selftests/mm/uffd-common.c b/tools/testing/selftests/mm/uffd-common.c
index ba20d7504022..02b89860e193 100644
--- a/tools/testing/selftests/mm/uffd-common.c
+++ b/tools/testing/selftests/mm/uffd-common.c
@@ -499,6 +499,9 @@ void *uffd_poll_thread(void *arg)
 	int ret;
 	char tmp_chr;
 
+	if (!args->handle_fault)
+		args->handle_fault = uffd_handle_page_fault;
+
 	pollfd[0].fd = uffd;
 	pollfd[0].events = POLLIN;
 	pollfd[1].fd = pipefd[cpu*2];
@@ -527,7 +530,7 @@ void *uffd_poll_thread(void *arg)
 			err("unexpected msg event %u\n", msg.event);
 			break;
 		case UFFD_EVENT_PAGEFAULT:
-			uffd_handle_page_fault(&msg, args);
+			args->handle_fault(&msg, args);
 			break;
 		case UFFD_EVENT_FORK:
 			close(uffd);
diff --git a/tools/testing/selftests/mm/uffd-common.h b/tools/testing/selftests/mm/uffd-common.h
index 197f5262fe0d..7c4fa964c3b0 100644
--- a/tools/testing/selftests/mm/uffd-common.h
+++ b/tools/testing/selftests/mm/uffd-common.h
@@ -77,6 +77,9 @@ struct uffd_args {
 	unsigned long missing_faults;
 	unsigned long wp_faults;
 	unsigned long minor_faults;
+
+	/* A custom fault handler; defaults to uffd_handle_page_fault. */
+	void (*handle_fault)(struct uffd_msg *msg, struct uffd_args *args);
 };
 
 struct uffd_test_ops {
diff --git a/tools/testing/selftests/mm/uffd-stress.c b/tools/testing/selftests/mm/uffd-stress.c
index 995ff13e74c7..50b1224d72c7 100644
--- a/tools/testing/selftests/mm/uffd-stress.c
+++ b/tools/testing/selftests/mm/uffd-stress.c
@@ -189,10 +189,8 @@ static int stress(struct uffd_args *args)
 				   locking_thread, (void *)cpu))
 			return 1;
 		if (bounces & BOUNCE_POLL) {
-			if (pthread_create(&uffd_threads[cpu], &attr,
-					   uffd_poll_thread,
-					   (void *)&args[cpu]))
-				return 1;
+			if (pthread_create(&uffd_threads[cpu], &attr, uffd_poll_thread, &args[cpu]))
+				err("uffd_poll_thread create");
 		} else {
 			if (pthread_create(&uffd_threads[cpu], &attr,
 					   uffd_read_thread,
@@ -247,9 +245,13 @@ static int userfaultfd_stress(void)
 {
 	void *area;
 	unsigned long nr;
-	struct uffd_args args[nr_cpus];
+	struct uffd_args *args;
 	uint64_t mem_size = nr_pages * page_size;
 
+	args = calloc(nr_cpus, sizeof(struct uffd_args));
+	if (!args)
+		err("allocating args array failed");
+
 	if (uffd_test_ctx_init(UFFD_FEATURE_WP_UNPOPULATED, NULL))
 		err("context init failed");
 
-- 
2.41.0.255.g8b1d071c50-goog

