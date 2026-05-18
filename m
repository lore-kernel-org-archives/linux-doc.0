Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36BF9390224
	for <linux-doc@vger.kernel.org>; Mon, 18 May 2026 19:12:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779131559; cv=none; b=UmnGXAVAExWawlDUnbwyHBeAFK3cKZ2tzH3T4LywRKoOlSxChc4baWThcaAIustJMnLBexrb/VzAvyYUOuyvi6zm6bsZbStndPq1mJTJXvD3fmjrtXMa5Udp285u1HmAjTbeuyI4kB1aDlN7/cGmwumInLsOaoV5LN6NBi9qgyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779131559; c=relaxed/simple;
	bh=RljyayX1PyhhLkcz/gwwb9ZSAUXbtpbGzWUaxpfKHrw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=rq8eWSGf9JoeF+cnOtF//MJK99PfyesdlHb5rLwEBwONKAmUo8WRZqAWDzqPM0uRU8QWcgl4UqPzXv3ms4MxqZ2ONx3+cnDe2gLEXcqfQRQ1UDULakIvDm2FL2RVnu4fj+om6QtzISIGN73GjHPedsJ49ClI+gsoPwdn1g1o7PQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LdpCApab; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LdpCApab"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-43fe62837baso1484048f8f.3
        for <linux-doc@vger.kernel.org>; Mon, 18 May 2026 12:12:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779131550; x=1779736350; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G8rvqbbv4pCegDpTmp8AOnsZ/Yo8hHTCvqhnXp9eK9A=;
        b=LdpCApabLeLn3LB2LR54zKUbb1X5xcpMSnDjlbR6jc5nJjTN+km+N9OQq8Ox6aE08Y
         9FG9BeNHOU6ujGKYH2los/54NUTum6rVhtOTK9Yo0A96xfZYUorAeOA6UJo9iVtGPPGp
         MFQbK6vxqpsBKL3Nscui25Cxi34KBfmMvhDHJ7K9WgjZmp/5SYwsKowobEBG6/amxHYR
         qNw1Awn4/XYYiILB0Efe29W/QEsOmt7zAQVF5ZnhlObIBKkhi3cibjuAbsJm8n4HWH4s
         e2eWw2xkfGxGXTjhTDCfpaivE1w3bH9OGDvRFKlfoOXlQUg2h+k2VR1UZEirWl+E23T4
         q1yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779131550; x=1779736350;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=G8rvqbbv4pCegDpTmp8AOnsZ/Yo8hHTCvqhnXp9eK9A=;
        b=WqcXVw8ZiLYmGyXjZ+bbgVI7BWK1g+WV+lZMgOiN929MHthNjJlISuSxtx28Wjubm1
         2XDA7y2UmXtnCcKkppC5cR5KJ9OcquXAYXfa2CmKZUDU02ZNtxqysAS53HfvDnnQG41p
         zbGLF20VNfsv6iYu3xK15yzPG507nsINaaTAKIav/fnj9TD7Ip0gr2Ug3aWZ+SonsUzP
         OXFGUDEnj+SZ4aW/ZIS+gnPLT3dUcWOjituHOrPUw1P86/sM5V1qvI3byDftctQM41pK
         oouTEx/bvascgaWotfgb8IPBxy9UM9no90VyuLl4CbjMFBduGWRM3uqEeqkeyVfZcu+f
         cGLw==
X-Forwarded-Encrypted: i=1; AFNElJ+BRhEHJPuwqegJ0NorV5ZDlfmutNN28ux6O9FbqN6/LdwRzlPfyLQgpdTlUXGtlpbeiHBj4yF+Jl0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxYBgLZMRSVYb5N/JOFma0ypV+iX1IRtdCEOyS+xmJSbRnnubNN
	EAwzvwj5P7YIrkhPl4jLECPEefzDvCeh2/NV3ngpzp0CG/wIpYuQ7RhfNLsAsaZbnOI=
X-Gm-Gg: Acq92OEAik5eEo+43xzPYG8OHLuFf00tYZuwEo7pcIsBf3uhBkev6zOUTe4PGJta0J6
	FrfcqKkaYwX56D3orYQMqXUF91Dc7acIFIlhdKgVaX4ulrJVCQlMVnwqCe3zzbQhAX4fIB2ZSZm
	Oc/byCOpeQtgjvexGeFgbVi+RqJg8sme9+5lM7nAk+7D4ii4kgz3yoUe55uOshFW+mkygZj9AMx
	DEshNSxrGFRHo3K5/oOJM7kwoHmVNqyLkcC3BjIMfbqgUmLh3U5zRS8vxbJedkdWLa5G8OtxGAR
	EZirKFaCLYnW1BNWoOupQ8P5lZOmTExkI7xq+z8FlsW33S5G4suTmlopjHtHjI4QWmvpjlt2p0B
	on2o5+ipp3WdG1NOj9gJj5ERCVHktqkMk7kr07t0grd2Um/6oSxET6kWtaKkq1agzPr+Yu7z+/n
	bZEa1JtOPPa8cnCE9hxjVQjP8mCi8t1z45NSw8b0uGgyel6NiTQT8DhxxojtYmgg==
X-Received: by 2002:a05:6000:1247:b0:45e:6518:3299 with SMTP id ffacd0b85a97d-45e651832f5mr15730841f8f.5.1779131549508;
        Mon, 18 May 2026 12:12:29 -0700 (PDT)
Received: from mshcherba-RedmiBook-16.. ([188.163.115.207])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da15a6454sm40043167f8f.34.2026.05.18.12.12.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 12:12:29 -0700 (PDT)
From: Maksym Shcherba <mshcherba2000@gmail.com>
X-Google-Original-From: Maksym Shcherba <maksym.shcherba@lnu.edu.ua>
To: sj@kernel.org,
	akpm@linux-foundation.org
Cc: david@kernel.org,
	ljs@kernel.org,
	liam@infradead.org,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	damon@lists.linux.dev,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Maksym Shcherba <maksym.shcherba@lnu.edu.ua>
Subject: [PATCH 6/6] selftests/damon: add a test for update_schemes_quota_goals
Date: Mon, 18 May 2026 22:09:32 +0300
Message-Id: <20260518190932.42270-6-maksym.shcherba@lnu.edu.ua>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260518190932.42270-1-maksym.shcherba@lnu.edu.ua>
References: <20260518190932.42270-1-maksym.shcherba@lnu.edu.ua>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The new update_schemes_quota_goals sysfs command allows users to manually
update the current_value of quota goals.

Add a selftest for the command. The test writes a dummy value to
current_value, executes the update command, and verifies that the dummy
value is successfully overwritten by the kernel.

Assisted-by: Antigravity:Gemini-3.1-Pro
Signed-off-by: Maksym Shcherba <maksym.shcherba@lnu.edu.ua>
---
 tools/testing/selftests/damon/Makefile        |  1 +
 .../damon/sysfs_update_schemes_quota_goals.py | 86 +++++++++++++++++++
 2 files changed, 87 insertions(+)
 create mode 100755 tools/testing/selftests/damon/sysfs_update_schemes_quota_goals.py

diff --git a/tools/testing/selftests/damon/Makefile b/tools/testing/selftests/damon/Makefile
index 2180c328a825..a692ebaa6c8a 100644
--- a/tools/testing/selftests/damon/Makefile
+++ b/tools/testing/selftests/damon/Makefile
@@ -13,6 +13,7 @@ TEST_PROGS += sysfs.py
 TEST_PROGS += sysfs_update_schemes_tried_regions_wss_estimation.py
 TEST_PROGS += damos_quota.py damos_quota_goal.py damos_apply_interval.py
 TEST_PROGS += damos_tried_regions.py damon_nr_regions.py
+TEST_PROGS += sysfs_update_schemes_quota_goals.py
 TEST_PROGS += reclaim.sh lru_sort.sh
 
 # regression tests (reproducers of previously found bugs)
diff --git a/tools/testing/selftests/damon/sysfs_update_schemes_quota_goals.py b/tools/testing/selftests/damon/sysfs_update_schemes_quota_goals.py
new file mode 100755
index 000000000000..745b97f75bc2
--- /dev/null
+++ b/tools/testing/selftests/damon/sysfs_update_schemes_quota_goals.py
@@ -0,0 +1,86 @@
+#!/usr/bin/env python3
+# SPDX-License-Identifier: GPL-2.0
+
+"""
+Test the update_schemes_quota_goals sysfs command.
+
+Start DAMON with a scheme that has a some_mem_psi_us quota goal.  Write a
+physically impossible dummy value to the goal's current_value sysfs file.
+Wait for a while, ensure the dummy value is not overwritten asynchronously,
+then write 'update_schemes_quota_goals' to the state file and verify that
+the dummy value is overwritten by the kernel.
+"""
+
+import os
+import time
+
+import _damon_sysfs
+
+
+def main():
+    goal = _damon_sysfs.DamosQuotaGoal(
+            metric=_damon_sysfs.qgoal_metric_some_mem_psi_us,
+            target_value=1000)
+    kdamonds = _damon_sysfs.Kdamonds([_damon_sysfs.Kdamond(
+            contexts=[_damon_sysfs.DamonCtx(
+                ops='paddr',
+                schemes=[_damon_sysfs.Damos(
+                    action='stat',
+                    quota=_damon_sysfs.DamosQuota(
+                        goals=[goal], reset_interval_ms=100),
+                    )]  # schemes
+                )]  # contexts
+            )])  # kdamonds
+
+    err = kdamonds.start()
+    if err is not None:
+        print('kdamond start failed: %s' % err)
+        exit(1)
+
+    # Write a dummy value to current_value to ensure the command actually
+    # overwrites it. We use 2x the quota reset interval in microseconds,
+    # which is a physically impossible value for the kernel to measure.
+    impossible_value = goal.quota.reset_interval_ms * 2000
+    err = _damon_sysfs.write_file(
+            os.path.join(goal.sysfs_dir(), 'current_value'),
+            '%d' % impossible_value)
+    if err is not None:
+        kdamonds.stop()
+        print('Writing dummy current_value failed: %s' % err)
+        exit(1)
+
+    # wait a couple of aggregation intervals so that the kernel has a chance
+    # to compute the first current_value measurement
+    time.sleep(0.5)
+
+    content, err = _damon_sysfs.read_file(
+            os.path.join(goal.sysfs_dir(), 'current_value'))
+    if err is not None:
+        kdamonds.stop()
+        print('Reading current_value before update failed: %s' % err)
+        exit(1)
+    if int(content) != impossible_value:
+        kdamonds.stop()
+        print('current_value changed before update (%s)' % content)
+        exit(1)
+
+    err = kdamonds.kdamonds[0].update_schemes_quota_goals()
+    if err is not None:
+        kdamonds.stop()
+        print('update_schemes_quota_goals failed: %s' % err)
+        exit(1)
+
+    # current_value must be updated and different from our dummy value
+    if goal.current_value is None or goal.current_value == impossible_value:
+        kdamonds.stop()
+        print('update_schemes_quota_goals failed to update current_value')
+        exit(1)
+
+    print('current_value after update_schemes_quota_goals: %d' %
+          goal.current_value)
+
+    kdamonds.stop()
+
+
+if __name__ == '__main__':
+    main()
-- 
2.43.0

