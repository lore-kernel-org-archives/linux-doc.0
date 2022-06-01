Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54915CCA473
	for <linux-doc@archiver.kernel.org>; Wed,  1 Jun 2022 21:10:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231351AbiFAVK2 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 1 Jun 2022 17:10:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54758 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231299AbiFAVKH (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 1 Jun 2022 17:10:07 -0400
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D65737A18
        for <linux-doc@vger.kernel.org>; Wed,  1 Jun 2022 14:10:02 -0700 (PDT)
Received: by mail-yb1-xb49.google.com with SMTP id z67-20020a254c46000000b0065cd3d2e67eso2441076yba.7
        for <linux-doc@vger.kernel.org>; Wed, 01 Jun 2022 14:10:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=GEuH7v2hm8gPbs+X2v5W8KutfNkKgsCF+/5mNPJwBK0=;
        b=NeP/OeNWbhVp3hYIumiRRFBaPXdgXyAjdD7Zj0iRpLOZr9GndhZskF8GFrI0+0V7jy
         UN8+h16HnW6rKS6i3HCFhE+iWsyJjtYRQW2in2IqUsCcb3Qwky5IW2whpRmS441F3S2C
         FxHMvZZe/UEWlqji0Ii/+wf3NDCs73ENyGUtGHUqrxfp0B7MbA8Omg4W5On4qYlsLGPy
         sp9/TGzUmEa5ZQIxOm6KVUET5G5/zTqvPFKuPvalDfVXTeP66q18+53RNjMKYeRRNw2I
         3z58aWIWYSn4SGF4HorICFDufV7uC0oZ6W8Ws9D9zWp/n+KcdLIyLZuJb78wLY1gcDuL
         FsHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=GEuH7v2hm8gPbs+X2v5W8KutfNkKgsCF+/5mNPJwBK0=;
        b=hIOofRtnwrBv67CHUS1WhgjjsYMzEt0sqiyUNj8nclmoV7O8WckguQ3G02UuZm1pP1
         nYLrDGF5RJofCjUhmyw2c+Guny8YUNSr2H8wC5nhuJkLbragO0K7gQVMrxD63xhWVBe0
         cNrA5SWAy/z+c9ALxJyl3ehRh1leByf2VhB+/VLZPm6MHIx7p0DNqgOQZmYfAngQnn0d
         1kmtCpsNHlcFCC0+yei/wrKaXLnz3KPU5Uv6IPnbL7mZLWhNZOmVhofX4DL9+IKydrRo
         Z3FIIA4o/85o57klJFT0HCMx9rMSPevK8WWu91S80bm3D1skLotVYJNYMUBMk0MEtpXN
         /iIQ==
X-Gm-Message-State: AOAM532UPHJ1U42i4AbgLcQpRiqWGfxCrtJ08Eu1I4SUGGdfF/oj7Q/x
        Z+JO8g+tAcVsurBAJass9+t8uH/fKEfJY3fSDoXU
X-Google-Smtp-Source: ABdhPJxLYxJTU4wKWdQdJErOlnXgmFSzr5QQlaHudjQxgiYWQ/To+IWy0QKQkX1/fZdej8cYja73KHAsf5mUjbmiy+G7
X-Received: from ajr0.svl.corp.google.com ([2620:15c:2cd:203:aaec:e358:9f0e:2b26])
 (user=axelrasmussen job=sendgmr) by 2002:a25:9ac1:0:b0:65c:bf5a:ce24 with
 SMTP id t1-20020a259ac1000000b0065cbf5ace24mr1913952ybo.378.1654117801445;
 Wed, 01 Jun 2022 14:10:01 -0700 (PDT)
Date:   Wed,  1 Jun 2022 14:09:48 -0700
In-Reply-To: <20220601210951.3916598-1-axelrasmussen@google.com>
Message-Id: <20220601210951.3916598-4-axelrasmussen@google.com>
Mime-Version: 1.0
References: <20220601210951.3916598-1-axelrasmussen@google.com>
X-Mailer: git-send-email 2.36.1.255.ge46751e96f-goog
Subject: [PATCH v3 3/6] userfaultfd: selftests: modify selftest to use /dev/userfaultfd
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

We clearly want to ensure both userfaultfd(2) and /dev/userfaultfd keep
working into the future, so just run the test twice, using each
interface.

Signed-off-by: Axel Rasmussen <axelrasmussen@google.com>
---
 tools/testing/selftests/vm/userfaultfd.c | 37 +++++++++++++++++++++---
 1 file changed, 33 insertions(+), 4 deletions(-)

diff --git a/tools/testing/selftests/vm/userfaultfd.c b/tools/testing/selftests/vm/userfaultfd.c
index 0bdfc1955229..1badb5d31bf9 100644
--- a/tools/testing/selftests/vm/userfaultfd.c
+++ b/tools/testing/selftests/vm/userfaultfd.c
@@ -77,6 +77,9 @@ static int bounces;
 #define TEST_SHMEM	3
 static int test_type;
 
+/* test using /dev/userfaultfd, instead of userfaultfd(2) */
+static bool test_dev_userfaultfd;
+
 /* exercise the test_uffdio_*_eexist every ALARM_INTERVAL_SECS */
 #define ALARM_INTERVAL_SECS 10
 static volatile bool test_uffdio_copy_eexist = true;
@@ -154,12 +157,14 @@ static void usage(void)
 			ret, __LINE__);				\
 	} while (0)
 
-#define err(fmt, ...)				\
+#define errexit(exitcode, fmt, ...)		\
 	do {					\
 		_err(fmt, ##__VA_ARGS__);	\
-		exit(1);			\
+		exit(exitcode);			\
 	} while (0)
 
+#define err(fmt, ...) errexit(1, fmt, ##__VA_ARGS__)
+
 static void uffd_stats_reset(struct uffd_stats *uffd_stats,
 			     unsigned long n_cpus)
 {
@@ -383,13 +388,31 @@ static void assert_expected_ioctls_present(uint64_t mode, uint64_t ioctls)
 	}
 }
 
+static void __userfaultfd_open_dev(void)
+{
+	int fd;
+
+	uffd = -1;
+	fd = open("/dev/userfaultfd", O_RDWR | O_CLOEXEC);
+	if (fd < 0)
+		return;
+
+	uffd = ioctl(fd, USERFAULTFD_IOC_NEW,
+		     O_CLOEXEC | O_NONBLOCK | UFFD_USER_MODE_ONLY);
+	close(fd);
+}
+
 static void userfaultfd_open(uint64_t *features)
 {
 	struct uffdio_api uffdio_api;
 
-	uffd = syscall(__NR_userfaultfd, O_CLOEXEC | O_NONBLOCK | UFFD_USER_MODE_ONLY);
+	if (test_dev_userfaultfd)
+		__userfaultfd_open_dev();
+	else
+		uffd = syscall(__NR_userfaultfd,
+			       O_CLOEXEC | O_NONBLOCK | UFFD_USER_MODE_ONLY);
 	if (uffd < 0)
-		err("userfaultfd syscall not available in this kernel");
+		errexit(KSFT_SKIP, "creating userfaultfd failed");
 	uffd_flags = fcntl(uffd, F_GETFD, NULL);
 
 	uffdio_api.api = UFFD_API;
@@ -1691,6 +1714,12 @@ int main(int argc, char **argv)
 	}
 	printf("nr_pages: %lu, nr_pages_per_cpu: %lu\n",
 	       nr_pages, nr_pages_per_cpu);
+
+	test_dev_userfaultfd = false;
+	if (userfaultfd_stress())
+		return 1;
+
+	test_dev_userfaultfd = true;
 	return userfaultfd_stress();
 }
 
-- 
2.36.1.255.ge46751e96f-goog

