Received: from mail-yw1-f225.google.com (mail-yw1-f225.google.com [209.85.128.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B9622AD25
	for <linux-doc@vger.kernel.org>; Tue, 27 May 2025 23:01:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.225
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748386903; cv=none; b=Fq/oaSLouvkX4h6N8GDYSePpjRVoEz5AwqjrDDPwJwfLwJRncvBhb+OaP0c7cuwawNxiolRxDhyBSbvvvF9s3sBl/nhjDLiPcw+jY14jwdX4X6Hc8uDx2C098TgJh69SEqcZ+Cz5giLdaO4bmrFGZXGVYP5Yj6AXfXgTRPRSwDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748386903; c=relaxed/simple;
	bh=Oh4wnE8/uHzzTpz7N/554aP/gP3pNcWLgWS8S1R97vA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=TUthVhXiq/8RckFhc8JnezbYXcL+/nf0K5e13jDiBezk1+7Sj2Doo0yyX/FAtUHiwahFO+UyUPBeyf6rccsTYK4MWvD76xVbuRsVfmwlUOepcCTZwLhQ5+6EpD6KKZoc1AGsRe0quZLVgSGv6gibRvEYd2pgS7X/cePcAjitVzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=fail smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=RSdErIpM; arc=none smtp.client-ip=209.85.128.225
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="RSdErIpM"
Received: by mail-yw1-f225.google.com with SMTP id 00721157ae682-70e3e0415a7so4026827b3.0
        for <linux-doc@vger.kernel.org>; Tue, 27 May 2025 16:01:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1748386897; x=1748991697; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YYNcL1NtZ5akTZQnabkGr4yBzlXV8nrK5c9bkd1cuzQ=;
        b=RSdErIpMUlD3LpJ4MGUzAUKLtIr3ZxODPJJS+rLFKKC/BMtyLkmPdcOolXTa6MIesd
         ONt2jff7nTo1dI4kJZ4PzJmtdZ1DXUnNjW5TMXOL6iJixFtKq4g03y9fdJl85DfXs05o
         rP9Ih9lRJXDeLS2udQrqbWJiQ7jtBn9SZSJXUqTwB6pt1dZUujhn+OYvBOlMlLwwDWWp
         9d6Z14ZgXugXr1Q6fo9HnCC1G0ch/dhf2JAoO32nAywlanrcUv3p5snRP+M5zKb6Z3gR
         etGnfpzXIax5meM+RWry5bGWBAKaiZTTBnnJw1dfCo3JcfEo3qsuan8BEK065SXF/dHs
         8C+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748386897; x=1748991697;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YYNcL1NtZ5akTZQnabkGr4yBzlXV8nrK5c9bkd1cuzQ=;
        b=wS9aB2K5w5ZIgIN3vDtFxi5n6OvayGgCtELpLg9isqZ2UJ2Bz88k0RMkdgbBYAutnW
         9TkgII0FnMF9rQP0/xWy4dObbjtUEnmWMbc+j2nQpBmWAGKf9NeenCBztn2rJc9ceF5r
         XJjSN0Gn6NKC5vZriWGtnxlqgZ7lNYgK+OhjgXqfOvVLauLytGxj7JEIOfyUgq4BvTwS
         UbYrjzsrByLBHuWbq9Of7KUNdXHHcKLsZSTUytpCOo/rNc2CIVu/ug2/1EA5ANYF0uAc
         EdRfpX0dA6jRVwzcrU8A2ydxkOeYFQ+vKY+++/QplSTyffKdy8DP/320yc2oK2WdJkST
         Yzmw==
X-Forwarded-Encrypted: i=1; AJvYcCUKH+Xxn7tfYvOReklEPAf5ODTQrncIQT2d+mxbPei+Yrl9oRPQ2Ua4L7KyJd6gJdtiV3koM3zIW6Y=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3v6f6QAqpn2lwjEMRyDFwur+eeGNUhojw4EYhSk+AdtZVVDew
	fIY64yo4kh1+JZeeWqbjtC/knKcJ0yHHGeGwHYz8NezAO+SQTbw8bqNDfI1d7DGyIlcmsjxt70I
	MO57ZCZC7UU2Giz6gOf35dgEcyTwBtbtdICQJ
X-Gm-Gg: ASbGncv7Fh2mcWkUf8Jcr0pt0xKRjDgqq6kOzvKSR9zve7zPTn6YyNYcIiC761k3PaL
	AwNKdhFCgy8Kf1IkHflkHvxfnqEmsrDA3FzGZwg07kUjCDazOIyTqfBpxvTKZHOUfpkfLfxFCd6
	aj/c+en5IcQBAqCq/uVBD/lS9YLrMWmnwacSJNzFjy+mVEaY2lYjHFcwqYi0A9X0uhKBFVCA6b/
	voSKzbvpcHzOtusjvYNi9fkDsjE9V1JKSqadt5hUVRZbT0+9O9Q+BAYvY0GujiC7q+GQSpeatRy
	N+rPHbWUrLDybt6Qpu98s0soQ4mNsPhk/oLF2AhoOIL83w==
X-Google-Smtp-Source: AGHT+IFfNe7/T37svCesGZ4bEZgar5P3Qzel63fMEbi26QIdlJ2ZfyzIq4dxWlmeUOH8aLVxaI4eZcQ6E9mn
X-Received: by 2002:a05:690c:61ca:b0:70e:7e33:fbd6 with SMTP id 00721157ae682-70e83509efcmr36692827b3.17.1748386896834;
        Tue, 27 May 2025 16:01:36 -0700 (PDT)
Received: from c7-smtp-2023.dev.purestorage.com ([208.88.159.128])
        by smtp-relay.gmail.com with ESMTPS id 00721157ae682-70ed5eb515asm144997b3.68.2025.05.27.16.01.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 May 2025 16:01:36 -0700 (PDT)
X-Relaying-Domain: purestorage.com
Received: from dev-ushankar.dev.purestorage.com (dev-ushankar.dev.purestorage.com [10.7.70.36])
	by c7-smtp-2023.dev.purestorage.com (Postfix) with ESMTP id 28F4A340199;
	Tue, 27 May 2025 17:01:36 -0600 (MDT)
Received: by dev-ushankar.dev.purestorage.com (Postfix, from userid 1557716368)
	id 1CE44E539B9; Tue, 27 May 2025 17:01:36 -0600 (MDT)
From: Uday Shankar <ushankar@purestorage.com>
Subject: [PATCH v7 0/8] ublk: decouple server threads from
 ublk_queues/hctxs
Date: Tue, 27 May 2025 17:01:23 -0600
Message-Id: <20250527-ublk_task_per_io-v7-0-cbdbaf283baa@purestorage.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAENENmgC/3XPTWrDMBAF4KsEraswGv131XuUYmRbSoSb2Eixa
 Qm+e+VAqaHK8g28b2buJPsUfSavhztJfok5jtcS9MuBdGd3PXka+5IJAkoQYOjcfg7NzeWhmXx
 q4kg7ZXkXFJheO1JqU/Ihfj3I94+SzzHfxvT92LCwbbphggEgohBcHzkYYw2jjM657Bxcepvm5
 LeaO/ljN17IBi34W35yyYIUaGu10dqr0EuoM3zHMKgwfGMMY94EIaVwdUbsGVlhRGGkQAatZU6
 oUGfknlEVRhbGomKu120I+OQp9cdI0BVGFcahQ2u04R2w/8y6rj/wcgVlDwIAAA==
X-Change-ID: 20250408-ublk_task_per_io-c693cf608d7a
To: Ming Lei <ming.lei@redhat.com>, Jens Axboe <axboe@kernel.dk>, 
 Caleb Sander Mateos <csander@purestorage.com>, 
 Andrew Morton <akpm@linux-foundation.org>, Shuah Khan <shuah@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>
Cc: linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org, 
 Uday Shankar <ushankar@purestorage.com>
X-Mailer: b4 0.14.2

This patch set aims to allow ublk server threads to better balance load
amongst themselves by decoupling server threads from ublk_queues/hctxs,
so that multiple threads can service I/Os that are issued from a single
CPU. This can improve performance for workloads in which ublk server CPU
is a bottleneck, and for which load is issued from CPUs which are not
balanced across ublk_queues/hctxs.

Performance
-----------

First create two ublk devices with:

ublkb0: ./kublk add -t null -q 2 --nthreads 2
ublkb1: ./kublk add -t null -q 2 --nthreads 2 --per_io_tasks

Then run load with:

taskset -c 1 fio/t/io_uring -r5 -p0 /dev/ublkb0: 1.90M IOPS
taskset -c 1 fio/t/io_uring -r5 -p0 /dev/ublkb1: 2.18M IOPS

Since ublkb1 has per-io-tasks, the second command is able to make use of
both ublk server worker threads and therefore has increased max
throughput.

Caveats:
- This testing was done on a system with 2 numa nodes, but the penalty
  of having I/O cross a numa (or LLC) boundary in the per_io_tasks case
  is quite high. So these numbers were obtained after moving all ublk
  server threads and the application threads to CPUs on the same numa
  node/LLC.
- One might expect the scaling to be linear - because ublkb1 can make
  use of twice as many ublk server threads, it should be able to drive
  twice the throughput. However this is not true (the improvement is
  ~15%), and needs further investigation.

Signed-off-by: Uday Shankar <ushankar@purestorage.com>
---
Changes in v7:
- Fix queue_rqs batch dispatch for per-io daemons
- Kick round-robin tag allocation changes to a followup
- Add explicit feature flag for per-task daemons (Ming Lei, Caleb Sander
  Mateos)
- Move some variable assignments to avoid redundant computation (Caleb
  Sander Mateos)
- Switch from storing pointers in ublk_io to computing based on address
  with container_of in a couple places (Ming Lei)
- Link to v6: https://lore.kernel.org/r/20250507-ublk_task_per_io-v6-0-a2a298783c01@purestorage.com

Changes in v6:
- Add a feature flag for this feature, called UBLK_F_RR_TAGS (Ming Lei)
- Add test for this feature (Ming Lei)
- Add documentation for this feature (Ming Lei)
- Link to v5: https://lore.kernel.org/r/20250416-ublk_task_per_io-v5-0-9261ad7bff20@purestorage.com

Changes in v5:
- Set io->task before ublk_mark_io_ready (Caleb Sander Mateos)
- Set io->task atomically, read it atomically when needed
- Return 0 on success from command-specific helpers in
  __ublk_ch_uring_cmd (Caleb Sander Mateos)
- Rename ublk_handle_need_get_data to ublk_get_data (Caleb Sander
  Mateos)
- Link to v4: https://lore.kernel.org/r/20250415-ublk_task_per_io-v4-0-54210b91a46f@purestorage.com

Changes in v4:
- Drop "ublk: properly serialize all FETCH_REQs" since Ming is taking it
  in another set
- Prevent data races by marking data structures which should be
  read-only in the I/O path as const (Ming Lei)
- Link to v3: https://lore.kernel.org/r/20250410-ublk_task_per_io-v3-0-b811e8f4554a@purestorage.com

Changes in v3:
- Check for UBLK_IO_FLAG_ACTIVE on I/O again after taking lock to ensure
  that two concurrent FETCH_REQs on the same I/O can't succeed (Caleb
  Sander Mateos)
- Link to v2: https://lore.kernel.org/r/20250408-ublk_task_per_io-v2-0-b97877e6fd50@purestorage.com

Changes in v2:
- Remove changes split into other patches
- To ease error handling/synchronization, associate each I/O (instead of
  each queue) to the last task that issues a FETCH_REQ against it. Only
  that task is allowed to operate on the I/O.
- Link to v1: https://lore.kernel.org/r/20241002224437.3088981-1-ushankar@purestorage.com

---
Uday Shankar (8):
      ublk: have a per-io daemon instead of a per-queue daemon
      selftests: ublk: kublk: plumb q_id in io_uring user_data
      selftests: ublk: kublk: tie sqe allocation to io instead of queue
      selftests: ublk: kublk: lift queue initialization out of thread
      selftests: ublk: kublk: move per-thread data out of ublk_queue
      selftests: ublk: kublk: decouple ublk_queues from ublk server threads
      selftests: ublk: add test for per io daemons
      Documentation: ublk: document UBLK_F_PER_IO_DAEMON

 Documentation/block/ublk.rst                       |  35 ++-
 drivers/block/ublk_drv.c                           | 108 +++----
 include/uapi/linux/ublk_cmd.h                      |   9 +
 tools/testing/selftests/ublk/Makefile              |   1 +
 tools/testing/selftests/ublk/fault_inject.c        |   4 +-
 tools/testing/selftests/ublk/file_backed.c         |  20 +-
 tools/testing/selftests/ublk/kublk.c               | 345 ++++++++++++++-------
 tools/testing/selftests/ublk/kublk.h               |  73 +++--
 tools/testing/selftests/ublk/null.c                |  22 +-
 tools/testing/selftests/ublk/stripe.c              |  17 +-
 tools/testing/selftests/ublk/test_generic_12.sh    |  55 ++++
 .../selftests/ublk/trace/count_ios_per_tid.bt      |  11 +
 12 files changed, 470 insertions(+), 230 deletions(-)
---
base-commit: 533c87e2ed742454957f14d7bef9f48d5a72e72d
change-id: 20250408-ublk_task_per_io-c693cf608d7a

Best regards,
-- 
Uday Shankar <ushankar@purestorage.com>

