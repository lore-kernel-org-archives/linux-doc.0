Received: from mail-pl1-f228.google.com (mail-pl1-f228.google.com [209.85.214.228])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF2D621E0B7
	for <linux-doc@vger.kernel.org>; Thu, 29 May 2025 23:47:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.228
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748562458; cv=none; b=XnHO4CIOD5p56/Bf7i2hwW3jjhSrFBo0JKJAPV+H0XyRTL9IMndzCUTBtIgtgL1drQzBdz2HQp+dgC/9sMmdVFJuKqJNFFDDhpXKmcW7lUCuswCDPs1URfsZpJhKTLy3xgOvE0fUGcbVfE2+yFUSq6GXksEYdxMYA8DcUMr3ylo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748562458; c=relaxed/simple;
	bh=KFzR2R0oE+f8Zx4hoiyK9LWJS5zkAw4p1aYmlL54wbY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dAhUICVnSoF870TToKdrTdraiRYui2cz5YLB7pLBxFwmMV9cdGk/nO3Uchs2AruxaXhfUEr7ydLallFStu9eE8Fl/kjAVzqZWqdoOiZooQORaDXwt/ryOs+PMfp95D/pKUm/2GBI/kBqMrgjF376Fa244SaVUdh2FgAKNbF720c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=fail smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=HVM4EM5o; arc=none smtp.client-ip=209.85.214.228
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="HVM4EM5o"
Received: by mail-pl1-f228.google.com with SMTP id d9443c01a7336-234488c2ea6so15999045ad.3
        for <linux-doc@vger.kernel.org>; Thu, 29 May 2025 16:47:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1748562456; x=1749167256; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZpDwixmcLhBwd2X2YXKWEWGwjdFqClV/mbfesZkbLZ4=;
        b=HVM4EM5o3m5NnyEnDtFVv851YsRsOYFOfvZ5S1meTMdIU7rIo79NCE6BVgQbbJqLw3
         PIVBnT2YWC8n/NNFeclz3BHE/1/apz4YPqNxoAsg59bmNnoWMAnJdiuMwsretwYUcKHU
         fffqBc4ghupzcLgrSnVVUAhzC3XvvZ7fJkZuD8R/OHn5unKdzJvMy6X5QZhhzcUFyPrY
         2dy6o8JtHfaA5SrkN4fSMkpGbhwb7HfotO9us3pei2LYmngGYe4hRGvc3EttEkLEBIeH
         +t+m0wCV4CrvC62wKOnlhZiXOPWYXG/VW579qtgzAgNuF0QbBDJUELhIvhwZ+YkPaTcU
         nCbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748562456; x=1749167256;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZpDwixmcLhBwd2X2YXKWEWGwjdFqClV/mbfesZkbLZ4=;
        b=NrRQoZLEGpZtcNbC7qSKxkGPzSVQUh1wUhR3EJ7VkQt/tUky/zgqywM/cGjwUGjf+9
         PrSbXSUgWOq1wesu7OCvEDCBry3IKG4lJtHKyvdZwCDeL59qQ26fSvTsWJhz45KBfpZK
         PLwj0gwT83RjgiCX/I/BJm2JxOh5vBdxhSuxax84m4pammwMxPqdzVnee/1OhsiH4JPs
         bdOAPIr9ApkkC+VZqI7eUA0VufAhusRLjrtkI/qNgbTVpBQbNTj3uy22NilsrkRdGpPM
         tWF+SzxYGJhqwEs6z8qbM9feYqSa83LIvPFMLYj1WCOtkOdf0H+48Yi09BK1umB2IV7a
         hzhQ==
X-Forwarded-Encrypted: i=1; AJvYcCUASvonErUX+tg7H/mMFzqcDkrpwDeeeiZeFA/Qvl+IvDUA14RmYKDhrFFxXEbaDSsY4ZCuVuqVlAo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+A7MFwSUvBsdwOAuWc65nAs0z4QzYoiNLy70CdymyZWOGR+lY
	BC6khdp4/Rfnpl7Mpft9tPgj58ywqEaKmT5exUGSoxmT2Nv1rxkYt41XuVuTTyGqAtITd1Ersgd
	wLvrCjtrQd1cBh2ttfhyB57G8J9hN/iMiOtlT+EERjDXrZ+6Br4mF
X-Gm-Gg: ASbGncsQpQB17cvwOxyNbnQMuDF7qn+9subfH6Wpz0B7UrGA6XVNamZZEtSIysFwCqu
	zT7tcU40IskhvDCBISc379XC+5ylKbu6QK3zeXx68uElrYWy/EmYBofVjN9eqN0pB3BcJpI6JIW
	EZqYnnoeZZ2M94MhMDFN+xPA2i32beo29ObGWIbPLLREYWB/QnC8TlEGK3qcfCim0iic+ABaxNX
	XUYtUYlHF9HzKOEYdQUvYXhf2mGimMMJ0jJqOu58mSVXG5nNI7R2r9oFO9OKn3VIiuD8v/Vt/4y
	elzEEvDb0ye+VOjag2mK1bhamx1tQwGEXg8awUd95g==
X-Google-Smtp-Source: AGHT+IF+JXhCtFUI7qIQoWLQaSp7IslKBmx1r2vGs1hjp44ssVnCEbbybY4kaM+WQWqB2rfGGO71/R3O8mVk
X-Received: by 2002:a17:902:f652:b0:234:f580:9ed with SMTP id d9443c01a7336-235390e41b7mr1149165ad.21.1748562455933;
        Thu, 29 May 2025 16:47:35 -0700 (PDT)
Received: from c7-smtp-2023.dev.purestorage.com ([2620:125:9017:12:36:3:5:0])
        by smtp-relay.gmail.com with ESMTPS id d9443c01a7336-23506d37f6csm1336845ad.83.2025.05.29.16.47.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 May 2025 16:47:35 -0700 (PDT)
X-Relaying-Domain: purestorage.com
Received: from dev-ushankar.dev.purestorage.com (dev-ushankar.dev.purestorage.com [IPv6:2620:125:9007:640:7:70:36:0])
	by c7-smtp-2023.dev.purestorage.com (Postfix) with ESMTP id 223603404BD;
	Thu, 29 May 2025 17:47:35 -0600 (MDT)
Received: by dev-ushankar.dev.purestorage.com (Postfix, from userid 1557716368)
	id D603DE4133B; Thu, 29 May 2025 17:47:34 -0600 (MDT)
From: Uday Shankar <ushankar@purestorage.com>
Date: Thu, 29 May 2025 17:47:17 -0600
Subject: [PATCH v8 8/9] selftests: ublk: add stress test for per io daemons
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250529-ublk_task_per_io-v8-8-e9d3b119336a@purestorage.com>
References: <20250529-ublk_task_per_io-v8-0-e9d3b119336a@purestorage.com>
In-Reply-To: <20250529-ublk_task_per_io-v8-0-e9d3b119336a@purestorage.com>
To: Ming Lei <ming.lei@redhat.com>, Jens Axboe <axboe@kernel.dk>, 
 Caleb Sander Mateos <csander@purestorage.com>, 
 Andrew Morton <akpm@linux-foundation.org>, Shuah Khan <shuah@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>
Cc: linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org, 
 Uday Shankar <ushankar@purestorage.com>
X-Mailer: b4 0.14.2

Add a new test_stress_06 for the per io daemons feature. This is just a
copy of test_stress_01 with the per_io_tasks flag added, with varying
amounts of nthreads. This test is able to reproduce a panic which was
caught manually during development [1]; in the current version of this
patch set, it passes.

Note that this commit also makes all stress tests using the
run_io_and_remove helper more stressful by additionally exercising the
batch submit (queue_rqs) path.

[1] https://lore.kernel.org/linux-block/aDgwGoGCEpwd1mFY@fedora/

Suggested-by: Ming Lei <ming.lei@redhat.com>
Signed-off-by: Uday Shankar <ushankar@purestorage.com>
---
 tools/testing/selftests/ublk/Makefile          |  1 +
 tools/testing/selftests/ublk/test_common.sh    |  5 ++++
 tools/testing/selftests/ublk/test_stress_06.sh | 36 ++++++++++++++++++++++++++
 3 files changed, 42 insertions(+)

diff --git a/tools/testing/selftests/ublk/Makefile b/tools/testing/selftests/ublk/Makefile
index 5d7f4ecfb81612f919a89eb442f948d6bfafe225..1fb1a95d452c2e9a7ed78cb8b12be2b759074e11 100644
--- a/tools/testing/selftests/ublk/Makefile
+++ b/tools/testing/selftests/ublk/Makefile
@@ -38,6 +38,7 @@ TEST_PROGS += test_stress_02.sh
 TEST_PROGS += test_stress_03.sh
 TEST_PROGS += test_stress_04.sh
 TEST_PROGS += test_stress_05.sh
+TEST_PROGS += test_stress_06.sh
 
 TEST_GEN_PROGS_EXTENDED = kublk
 
diff --git a/tools/testing/selftests/ublk/test_common.sh b/tools/testing/selftests/ublk/test_common.sh
index 0145569ee7e9a45b41898c2c789842b4c8380f18..8a4dbd09feb0a885ec7539f1a285ed6f437fe3ab 100755
--- a/tools/testing/selftests/ublk/test_common.sh
+++ b/tools/testing/selftests/ublk/test_common.sh
@@ -278,6 +278,11 @@ __run_io_and_remove()
 	fio --name=job1 --filename=/dev/ublkb"${dev_id}" --ioengine=libaio \
 		--rw=randrw --norandommap --iodepth=256 --size="${size}" --numjobs="$(nproc)" \
 		--runtime=20 --time_based > /dev/null 2>&1 &
+	fio --name=batchjob --filename=/dev/ublkb"${dev_id}" --ioengine=io_uring \
+		--rw=randrw --norandommap --iodepth=256 --size="${size}" \
+		--numjobs="$(nproc)" --runtime=20 --time_based \
+		--iodepth_batch_submit=32 --iodepth_batch_complete_min=32 \
+		--force_async=7 > /dev/null 2>&1 &
 	sleep 2
 	if [ "${kill_server}" = "yes" ]; then
 		local state
diff --git a/tools/testing/selftests/ublk/test_stress_06.sh b/tools/testing/selftests/ublk/test_stress_06.sh
new file mode 100755
index 0000000000000000000000000000000000000000..3aee8521032e3962b8b070cda8eb295b01e7b124
--- /dev/null
+++ b/tools/testing/selftests/ublk/test_stress_06.sh
@@ -0,0 +1,36 @@
+#!/bin/bash
+# SPDX-License-Identifier: GPL-2.0
+
+. "$(cd "$(dirname "$0")" && pwd)"/test_common.sh
+TID="stress_06"
+ERR_CODE=0
+
+ublk_io_and_remove()
+{
+	run_io_and_remove "$@"
+	ERR_CODE=$?
+	if [ ${ERR_CODE} -ne 0 ]; then
+		echo "$TID failure: $*"
+		_show_result $TID $ERR_CODE
+	fi
+}
+
+if ! _have_program fio; then
+	exit "$UBLK_SKIP_CODE"
+fi
+
+_prep_test "stress" "run IO and remove device with per_io_tasks"
+
+_create_backfile 0 256M
+_create_backfile 1 128M
+_create_backfile 2 128M
+
+ublk_io_and_remove 8G -t null -q 4 --nthreads 5 --per_io_tasks &
+ublk_io_and_remove 256M -t loop -q 4 --nthreads 3 --per_io_tasks \
+        "${UBLK_BACKFILES[0]}" &
+ublk_io_and_remove 256M -t stripe -q 4 --nthreads 4 --per_io_tasks \
+        "${UBLK_BACKFILES[1]}" "${UBLK_BACKFILES[2]}" &
+wait
+
+_cleanup_test "stress"
+_show_result $TID $ERR_CODE

-- 
2.34.1

