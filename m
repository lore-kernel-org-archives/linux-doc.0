Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3EBB364EB7
	for <linux-doc@vger.kernel.org>; Tue, 30 Jun 2026 15:21:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782832908; cv=none; b=ifP4BngnFuWVIJ+tP9Z8X06517+QKpX1LOvpNWUJrbba7Gyp1iYsHhJCRK1C7ho/hqRczWvBapIYvEDwBPwe83z+sEzkPfzP4Czi1Ze//ikWOPtSlOuZ+GGGtlAAwPWjMcsOV0K42qYGMIsFYRubaijumEvTkEwGGmVCGGH9fZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782832908; c=relaxed/simple;
	bh=YYUrAaLIhRqXfDT85XaO6Hv+Qgi0BpeXAFkj2tNrA2I=;
	h=Subject:From:To:Cc:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uM1B8TH8mGz6NfIECRwxT1wfLlzGpEJWdyIXqPlNCe/HwlUUd1RbW1tVgOQSfCoR+v6pIBONuun7j6EFPfe5mgk74V0tAjDTl/faVZvC+IABolmtuVVLJhckxehUTeGbqD9J2skJPHLY1wsR3jTV2t6o1TnyNeP23JAwAojW0Hg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Br1G424F; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Br1G424F"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-c88cc025f54so2762715a12.1
        for <linux-doc@vger.kernel.org>; Tue, 30 Jun 2026 08:21:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782832905; x=1783437705; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:user-agent:references
         :in-reply-to:message-id:date:cc:to:from:subject:from:to:cc:subject
         :date:message-id:reply-to;
        bh=uOi+3GdOe+ezUoAPCNx4QDJRphwXMA4gdByDmvY1xU4=;
        b=Br1G424Frff2jGFhOuvaB8Fytyex01+6dPRrTc3/4OwR9XT7kOyv5f2isra5GJh4Ia
         /T1ToxlgkCI9nds2y6c9KQNN7sQwvc0ex80Bi3Qqpu8PwiyhnfXFQMvjb7K6lN5GAl+Q
         OvZUHl8bIDhhbdEt3RPxAYVf30ZXBgf0PgZxaxVWjlBoLB5r1rfSnPeXgxEmgBvsH6Hy
         685rVvJSUA3SoyTfc+PJV1zxvpwnlnYATDq6x+vT55Ql9iQbEFv15+kQU3Uw4NIO6QqJ
         i/mwEJd1oDR9mChXs4qszlOF5Ffu9eWYv6omp6Lz0nykSO5tersUkc5z6ypji/0ZD+Rs
         ArrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782832905; x=1783437705;
        h=content-transfer-encoding:mime-version:user-agent:references
         :in-reply-to:message-id:date:cc:to:from:subject:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uOi+3GdOe+ezUoAPCNx4QDJRphwXMA4gdByDmvY1xU4=;
        b=pu/jk1AuedIWY+ixXE8oZqsXKLHdXKGd1V+HIPDjY3LLvKGbwCdKCcSo9BRJZVaXHD
         2l2ltcHhkqy8doF9Lm3aFN1sLtMbgcuMkH4vovw/o76UBo8ObnWRO8Fq2rKQ2002b/AV
         ORDKEGb4IIQVleap2Xuql5tevcmg7wUwNrfOCPzJd7PDHG8kz/6LWkjfDRnwK8nEHW0M
         lyNJubaA31jj1mjJPEsY8iMKu6U3RbvpbbzcPR7HCW6Qk1pvYoZAvzFIxlIDxoUboteo
         psvwgabrh+OzR+KC8kbyTMRSTWUCED4ioxDLRJuRL+Avox6+XiEaEuB4WgOMZMzayvo5
         io4w==
X-Gm-Message-State: AOJu0Ywbw68hJjJFhqzQ2f6gpwndix4PVk5XAtfFTraT8SkRUmys4O6V
	6JEgVl3znozj3j+GLn87m9K7B3NemSQv9hHMvmJnEjzbWylpiDKpeoUA
X-Gm-Gg: AfdE7cmFWnZS70rL9QVdNSXNgLzMa8wW80qtKbQGWR6uOTl5qNYrOuRld/FB90MP2ZN
	56hYBvACw2rN35il0mrWDUc8CqETj/4jAyctaOicVCWVx3iSCXwHu90+q6UKPJa9LeZzPROuxT+
	ij1cJyTksypfQSpQM4UZZSQhrwiVvkDHmNGDkMnUvvmyRd9RaYdiC8oCvMiF+dEdH3oy6D+V1Ob
	QHNLqdTf4XoGP/BYOhG46hIkS3UZgJzBUhsOR+2n5RXpSZQIORS9m3uZ9n7/ukwhAJTFvicZ464
	40bvH2j72hO/WoYi6Tnd3274ikeN1HxssC55Mq9f+yFsPYzRjPu2EmEf7r+bxHkUn0vzXHvncHg
	UKM+1gXswTKYFgQG7R/MgODbJkx40KneE2+M/4CoMAx+U/wn5YwdTArjfuOLbDNl6cW1jOlnwrI
	u0Me4Y1qLtZlQ3fKo9amZr0gPP6Oqg7tve+vsv8lYdSnuzLPva6G/bouNStlc=
X-Received: by 2002:a05:6a20:9145:b0:3bf:6c08:fba8 with SMTP id adf61e73a8af0-3bfc547e6c1mr3588664637.60.1782832904691;
        Tue, 30 Jun 2026 08:21:44 -0700 (PDT)
Received: from [192.168.0.160] (c-98-225-44-182.hsd1.wa.comcast.net. [98.225.44.182])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c9bbf95be56sm1810819a12.16.2026.06.30.08.21.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 08:21:44 -0700 (PDT)
Subject: [PATCH v4 3/3] selftests/mm: add userfaultfd test for HMM unlockable
 path
From: Stanislav Kinsburskii <skinsburskii@gmail.com>
To: Liam.Howlett@oracle.com, akpm@linux-foundation.org,
 akpm@linux-foundation.org, david@kernel.org, jgg@ziepe.ca, corbet@lwn.net,
 leon@kernel.org, ljs@kernel.org, mhocko@suse.com, rppt@kernel.org,
 shuah@kernel.org, skhan@linuxfoundation.org, surenb@google.com,
 vbabka@kernel.org, skinsburskii@gmail.com
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-mm@kvack.org
Date: Tue, 30 Jun 2026 08:21:42 -0700
Message-ID: <178283290282.183052.2776436831525629180.stgit@skinsburskii>
In-Reply-To: <178283277041.183052.6873574850714079228.stgit@skinsburskii>
References: <178283277041.183052.6873574850714079228.stgit@skinsburskii>
User-Agent: StGit/0.19
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

From: Stanislav Kinsburskii <skinsburskii@linux.microsoft.com>

Add a selftest that exercises hmm_range_fault_unlockable() with a
userfaultfd-backed mapping. The test:

1. Creates an anonymous mmap region
2. Registers it with userfaultfd (UFFDIO_REGISTER_MODE_MISSING)
3. Spawns a handler thread that responds to page faults by filling
   pages with a known pattern (0xAB) via UFFDIO_COPY
4. Issues HMM_DMIRROR_READ_UNLOCKABLE to the test_hmm driver, which
   calls hmm_range_fault_unlockable() internally
5. Verifies the device read back the data provided by the userfaultfd
   handler

This requires changes to the test_hmm kernel module:
- New dmirror_range_fault_unlockable() that uses the new HMM API
- New dmirror_fault_unlockable() and dmirror_read_unlockable() wrappers
- New HMM_DMIRROR_READ_UNLOCKABLE ioctl (0x09)

Co-authored-by: Copilot <223556219+Copilot@users.noreply.github.com>
---
 lib/test_hmm.c                         |  122 ++++++++++++++++++++++++++
 lib/test_hmm_uapi.h                    |    1 
 tools/testing/selftests/mm/hmm-tests.c |  149 ++++++++++++++++++++++++++++++++
 3 files changed, 272 insertions(+)

diff --git a/lib/test_hmm.c b/lib/test_hmm.c
index c4adbf98fac7..085e3b941b83 100644
--- a/lib/test_hmm.c
+++ b/lib/test_hmm.c
@@ -389,6 +389,84 @@ static int dmirror_range_fault(struct dmirror *dmirror,
 	return ret;
 }
 
+static int dmirror_range_fault_unlockable(struct dmirror *dmirror,
+					  struct hmm_range *range)
+{
+	struct mm_struct *mm = dmirror->notifier.mm;
+	unsigned long timeout =
+		jiffies + msecs_to_jiffies(HMM_RANGE_DEFAULT_TIMEOUT);
+	int locked;
+	int ret;
+
+	while (true) {
+		if (time_after(jiffies, timeout)) {
+			ret = -EBUSY;
+			goto out;
+		}
+
+		range->notifier_seq = mmu_interval_read_begin(range->notifier);
+		locked = 1;
+		mmap_read_lock(mm);
+		ret = hmm_range_fault_unlockable(range, &locked);
+		if (locked)
+			mmap_read_unlock(mm);
+		if (ret) {
+			if (ret == -EBUSY)
+				continue;
+			goto out;
+		}
+		if (!locked)
+			continue;
+
+		mutex_lock(&dmirror->mutex);
+		if (mmu_interval_read_retry(range->notifier,
+					    range->notifier_seq)) {
+			mutex_unlock(&dmirror->mutex);
+			continue;
+		}
+		break;
+	}
+
+	ret = dmirror_do_fault(dmirror, range);
+
+	mutex_unlock(&dmirror->mutex);
+out:
+	return ret;
+}
+
+static int dmirror_fault_unlockable(struct dmirror *dmirror,
+				    unsigned long start,
+				    unsigned long end, bool write)
+{
+	struct mm_struct *mm = dmirror->notifier.mm;
+	unsigned long addr;
+	unsigned long pfns[32];
+	struct hmm_range range = {
+		.notifier = &dmirror->notifier,
+		.hmm_pfns = pfns,
+		.pfn_flags_mask = 0,
+		.default_flags =
+			HMM_PFN_REQ_FAULT | (write ? HMM_PFN_REQ_WRITE : 0),
+		.dev_private_owner = dmirror->mdevice,
+	};
+	int ret = 0;
+
+	if (!mmget_not_zero(mm))
+		return -EFAULT;
+
+	for (addr = start; addr < end; addr = range.end) {
+		range.start = addr;
+		range.end = min(addr + (ARRAY_SIZE(pfns) << PAGE_SHIFT), end);
+
+		ret = dmirror_range_fault_unlockable(dmirror, &range);
+		if (ret)
+			break;
+	}
+
+	mmput(mm);
+	return ret;
+}
+
 static int dmirror_fault(struct dmirror *dmirror, unsigned long start,
 			 unsigned long end, bool write)
 {
@@ -488,6 +566,47 @@ static int dmirror_read(struct dmirror *dmirror, struct hmm_dmirror_cmd *cmd)
 	return ret;
 }
 
+static int dmirror_read_unlockable(struct dmirror *dmirror,
+				   struct hmm_dmirror_cmd *cmd)
+{
+	struct dmirror_bounce bounce;
+	unsigned long start, end;
+	unsigned long size = cmd->npages << PAGE_SHIFT;
+	int ret;
+
+	start = cmd->addr;
+	end = start + size;
+	if (end < start)
+		return -EINVAL;
+
+	ret = dmirror_bounce_init(&bounce, start, size);
+	if (ret)
+		return ret;
+
+	while (1) {
+		mutex_lock(&dmirror->mutex);
+		ret = dmirror_do_read(dmirror, start, end, &bounce);
+		mutex_unlock(&dmirror->mutex);
+		if (ret != -ENOENT)
+			break;
+
+		start = cmd->addr + (bounce.cpages << PAGE_SHIFT);
+		ret = dmirror_fault_unlockable(dmirror, start, end, false);
+		if (ret)
+			break;
+		cmd->faults++;
+	}
+
+	if (ret == 0) {
+		if (copy_to_user(u64_to_user_ptr(cmd->ptr), bounce.ptr,
+				 bounce.size))
+			ret = -EFAULT;
+	}
+	cmd->cpages = bounce.cpages;
+	dmirror_bounce_fini(&bounce);
+	return ret;
+}
+
 static int dmirror_do_write(struct dmirror *dmirror, unsigned long start,
 			    unsigned long end, struct dmirror_bounce *bounce)
 {
@@ -1572,6 +1691,9 @@ static long dmirror_fops_unlocked_ioctl(struct file *filp,
 		dmirror->flags = cmd.npages;
 		ret = 0;
 		break;
+	case HMM_DMIRROR_READ_UNLOCKABLE:
+		ret = dmirror_read_unlockable(dmirror, &cmd);
+		break;
 
 	default:
 		return -EINVAL;
diff --git a/lib/test_hmm_uapi.h b/lib/test_hmm_uapi.h
index f94c6d457338..076df6df9227 100644
--- a/lib/test_hmm_uapi.h
+++ b/lib/test_hmm_uapi.h
@@ -38,6 +38,7 @@ struct hmm_dmirror_cmd {
 #define HMM_DMIRROR_CHECK_EXCLUSIVE	_IOWR('H', 0x06, struct hmm_dmirror_cmd)
 #define HMM_DMIRROR_RELEASE		_IOWR('H', 0x07, struct hmm_dmirror_cmd)
 #define HMM_DMIRROR_FLAGS		_IOWR('H', 0x08, struct hmm_dmirror_cmd)
+#define HMM_DMIRROR_READ_UNLOCKABLE	_IOWR('H', 0x09, struct hmm_dmirror_cmd)
 
 #define HMM_DMIRROR_FLAG_FAIL_ALLOC	(1ULL << 0)
 
diff --git a/tools/testing/selftests/mm/hmm-tests.c b/tools/testing/selftests/mm/hmm-tests.c
index e4c49699f3f7..ce3449d04e92 100644
--- a/tools/testing/selftests/mm/hmm-tests.c
+++ b/tools/testing/selftests/mm/hmm-tests.c
@@ -28,6 +28,10 @@
 #include <sys/mman.h>
 #include <sys/ioctl.h>
 #include <sys/time.h>
+#include <sys/syscall.h>
+#include <sys/eventfd.h>
+#include <linux/userfaultfd.h>
+#include <poll.h>
 
 /*
  * This is a private UAPI to the kernel test module so it isn't exported
@@ -2948,4 +2952,149 @@ TEST_F_TIMEOUT(hmm, benchmark_thp_migration, 120)
 					&thp_results, &regular_results);
 	}
 }
+/*
+ * Test that HMM can fault in pages backed by userfaultfd using the
+ * hmm_range_fault_unlockable() path. This exercises the lock-drop retry
+ * logic in the HMM framework.
+ */
+struct uffd_thread_args {
+	int uffd;
+	int stop_fd;
+	void *page_buffer;
+	unsigned long page_size;
+};
+
+static void *uffd_handler_thread(void *arg)
+{
+	struct uffd_thread_args *args = arg;
+	struct uffd_msg msg;
+	struct uffdio_copy copy;
+	struct pollfd pollfd[2];
+	int ret;
+
+	pollfd[0].fd = args->uffd;
+	pollfd[0].events = POLLIN;
+	pollfd[1].fd = args->stop_fd;
+	pollfd[1].events = POLLIN;
+
+	while (1) {
+		ret = poll(pollfd, 2, -1);
+		if (ret <= 0)
+			break;
+		if (pollfd[1].revents)
+			break;
+		if (!(pollfd[0].revents & POLLIN))
+			break;
+
+		ret = read(args->uffd, &msg, sizeof(msg));
+		if (ret != sizeof(msg))
+			break;
+
+		if (msg.event != UFFD_EVENT_PAGEFAULT)
+			break;
+
+		/* Fill the page with a known pattern */
+		memset(args->page_buffer, 0xAB, args->page_size);
+
+		copy.dst = msg.arg.pagefault.address & ~(args->page_size - 1);
+		copy.src = (unsigned long)args->page_buffer;
+		copy.len = args->page_size;
+		copy.mode = 0;
+		copy.copy = 0;
+
+		ret = ioctl(args->uffd, UFFDIO_COPY, &copy);
+		if (ret < 0)
+			break;
+	}
+
+	return NULL;
+}
+
+TEST_F(hmm, userfaultfd_read)
+{
+	struct hmm_buffer *buffer;
+	struct uffd_thread_args uffd_args;
+	unsigned long npages;
+	unsigned long size;
+	unsigned long i;
+	unsigned char *ptr;
+	pthread_t thread;
+	int uffd;
+	int stop_fd;
+	int ret;
+	struct uffdio_api api;
+	struct uffdio_register reg;
+	uint64_t stop = 1;
+	ssize_t nwrite;
+
+	npages = 4;
+	size = npages << self->page_shift;
+
+	/* Create userfaultfd */
+	uffd = syscall(__NR_userfaultfd, O_CLOEXEC | O_NONBLOCK);
+	if (uffd < 0)
+		SKIP(return, "userfaultfd not available");
+
+	api.api = UFFD_API;
+	api.features = 0;
+	ret = ioctl(uffd, UFFDIO_API, &api);
+	ASSERT_EQ(ret, 0);
+
+	buffer = malloc(sizeof(*buffer));
+	ASSERT_NE(buffer, NULL);
+
+	buffer->fd = -1;
+	buffer->size = size;
+	buffer->mirror = malloc(size);
+	ASSERT_NE(buffer->mirror, NULL);
+
+	/* Create anonymous mapping */
+	buffer->ptr = mmap(NULL, size,
+			   PROT_READ | PROT_WRITE,
+			   MAP_PRIVATE | MAP_ANONYMOUS,
+			   -1, 0);
+	ASSERT_NE(buffer->ptr, MAP_FAILED);
+
+	/* Register the region with userfaultfd */
+	reg.range.start = (unsigned long)buffer->ptr;
+	reg.range.len = size;
+	reg.mode = UFFDIO_REGISTER_MODE_MISSING;
+	ret = ioctl(uffd, UFFDIO_REGISTER, &reg);
+	ASSERT_EQ(ret, 0);
+
+	/* Set up the handler thread */
+	uffd_args.uffd = uffd;
+	stop_fd = eventfd(0, EFD_CLOEXEC);
+	ASSERT_GE(stop_fd, 0);
+	uffd_args.stop_fd = stop_fd;
+	uffd_args.page_buffer = malloc(self->page_size);
+	ASSERT_NE(uffd_args.page_buffer, NULL);
+	uffd_args.page_size = self->page_size;
+
+	ret = pthread_create(&thread, NULL, uffd_handler_thread, &uffd_args);
+	ASSERT_EQ(ret, 0);
+
+	/*
+	 * Use the unlockable read path which allows the mmap lock to be
+	 * dropped during the fault, enabling userfaultfd resolution.
+	 */
+	ret = hmm_dmirror_cmd(self->fd, HMM_DMIRROR_READ_UNLOCKABLE,
+			      buffer, npages);
+	ASSERT_EQ(ret, 0);
+	ASSERT_EQ(buffer->cpages, npages);
+
+	/* Verify the device read the data filled by the uffd handler */
+	ptr = buffer->mirror;
+	for (i = 0; i < size; ++i)
+		ASSERT_EQ(ptr[i], (unsigned char)0xAB);
+
+	nwrite = write(stop_fd, &stop, sizeof(stop));
+	ASSERT_EQ(nwrite, sizeof(stop));
+	pthread_join(thread, NULL);
+	close(stop_fd);
+	free(uffd_args.page_buffer);
+	close(uffd);
+	hmm_buffer_free(buffer);
+}
+
 TEST_HARNESS_MAIN


