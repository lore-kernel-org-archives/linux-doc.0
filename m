Received: from mail-dl2-f43.google.com (mail-dl2-f43.google.com [74.125.229.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 726DD36D9F5
	for <linux-doc@vger.kernel.org>; Wed, 30 Sep 2026 02:51:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790736676; cv=none; b=huaOPIhkS/djg1kch51wv95WzW/GkLa+loJvSWMssmJ0062tjrSwF55t23I3e08y3YESXTpgYye3Dxbu42oeXoq7yPBSht3EsViRfPgMlBM3HFA3NB73aR11ounjedCLg4tlKS6gU6j9Iqoq+YAsbK8iYeBLrICQLFyzKh1kcKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790736676; c=relaxed/simple;
	bh=vTZx4gCnhDGfJob7Ma4mwhOsNP6hIrB19vRqS8gxLXg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PPndYyKbH8ZYR+talkazDo0XVYoJ+3K2iKd+ghsqa+XdOv8jzVsAFVjkj+JsYfawZs6orf/EDqadI415CU+tkY5aziow8WcsCKsn4zL5jVYd8CKY4kbEwAOdFuadamGapmm758AMXncnZ8E4p6o/bpk55d7cIOWPwtmcs6zzY60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=j7PzxGVN; arc=none smtp.client-ip=74.125.229.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="j7PzxGVN"
Received: by mail-dl2-f43.google.com with SMTP id a92af1059eb24-1438f55921fso1413062c88.1
        for <linux-doc@vger.kernel.org>; Tue, 29 Sep 2026 19:51:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1790736673; x=1791341473; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=99ovinxsFoVp0y9um2d4xLdsMEAJmWbWSBDRVa+kv8A=;
        b=j7PzxGVNQ2hGYptcVF58X92d8bA56YpegnUeZSfiF3i/0yzxpv2/GtbCBb44n1WXs/
         oNqpFRTTkiAJl8MLkxCG0WTbGglCHI5vB5iMM+zfH34K25msXb1e1nBkgIN/+MJeCWDe
         EomvacT3lmGLSK6l0avken6ZoSyq8ruHVcKeI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790736673; x=1791341473;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=99ovinxsFoVp0y9um2d4xLdsMEAJmWbWSBDRVa+kv8A=;
        b=qIU+Wtbv1dHLe5henXwO9rA/Wh2DEBhBZlBDVFcinLBpeYMnIGQhutfv0hq/G2u9vY
         w+Q0nBkhMVz4b4lqGxAtKTv3u7DRAoo7DQ1n6eZQ/vky43XwxiCnt3pBt+dLG8ksXvtm
         E94TH33JXLrAV+zdgcZ5i0u13vb78/iUURhpHKxn2vsPU/SPGDeObhNh8NtzUtQKOUZc
         1sEFtECqIu6AtAo8rkCh5asu+EAhjmKFFMg7MmAAE+Q6xjQvymTVRqHYgxcyo34nncSb
         6mPPXltHq/BscPWbz1IUJyIBSB16qcFuKGAa6ogmQBBetUjVTqftt22NLEzzaYFFKXx5
         5F6g==
X-Forwarded-Encrypted: i=1; AKwUvBxHAuffXJD67f33/db2WDcCBO7M7gxvZFSrtVk4KBrO4c1zm8bwrewDYUPwX2M+x2G8MlR7kx06BhQ=@vger.kernel.org
X-Gm-Message-State: AFuF++ngXDL7XJeHLhla5PkoNQzIK3Ztvk2wX/96bap0SHveXRSNf5Oi
	RtK4QfedA1z7PfCubmXLWErUY6kNAWm9zcxA6N54lxkLBea2NR/VlX3968DN3P03Xw==
X-Gm-Gg: AYBFou0xuRG9Iddbro8uFgAx43Me8C88q/kKx/O4xgNWy5ZVNXdSvMdaTI8Jrw7WLTX
	d8aKqyPhrUzDRP8UcIKOq4A6vqcglIOmkA6YtnpwEeZsVFF8sHRgtleG8U79vd4YgbipvKnsoH3
	fg8ywT0cLRpuRsNAugLfQ4oA1d36SBGGVeL7UXT3tOqYUf0wA8RqaJRXdu+L25Jq6hYPzK+SnIt
	wWCH3n0f0aRjCxjrrFmRSTDfhfevjuy7yDeQ5x7RyKmGpEGDDPSK0GED1/vdHjbjpKX4ivbVK61
	XE3HqQe+IT8MaOCGG4cB91gD+BohW6fBYajVL49p8HqZTqZC2NoZdJ0ZmYXYePLFKEb7Q7UVSlJ
	U97RLt+7wCgY9lBKYoVNpAcf4yt9ll0x9KqCJiJFF4jlKcS1vQ73Zn26BBEw7w3F/qgd8JqaCML
	WOVCEfA6nDOWVflOrj4SMhfP5/1XBPNduXAagjz2gjKzs/LDUBxvOWWguF6umw/F8LtS88Z7INH
	ammb+qAKCNZEcBU2Qu04kic2Ti8Kn3knGyu
X-Received: by 2002:a05:701b:2813:b0:143:8829:5fb9 with SMTP id a92af1059eb24-14c9ed38c49mr1173391c88.16.1790736673424;
        Tue, 29 Sep 2026 19:51:13 -0700 (PDT)
Received: from localhost ([2a00:79e0:2e7c:8:5f5a:aa9:d06d:b4a7])
        by smtp.gmail.com with UTF8SMTPSA id a92af1059eb24-14d083fe728sm229335c88.6.2026.09.29.19.51.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Sep 2026 19:51:12 -0700 (PDT)
From: Brian Norris <briannorris@chromium.org>
To: "Rafael J . Wysocki" <rafael@kernel.org>
Cc: Pavel Machek <pavel@kernel.org>,
	Doug Anderson <dianders@chromium.org>,
	Ulf Hansson <ulfh@kernel.org>,
	linux-doc@vger.kernel.org,
	linux-pm@vger.kernel.org,
	Len Brown <lenb@kernel.org>,
	linux-kernel@vger.kernel.org,
	Brian Norris <briannorris@chromium.org>
Subject: [PATCH v3 5/8] PM: runtime: Clarify ->runtime_idle() callback return value handling
Date: Tue, 29 Sep 2026 19:49:53 -0700
Message-ID: <20260929194956.v3.5.If6e26acac7770c65446dd0b81f891948abb38973@changeid>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
In-Reply-To: <20260930025044.104824-1-briannorris@chromium.org>
References: <20260930025044.104824-1-briannorris@chromium.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This doc says "Negative error return codes are ignored by the PM core"
for ->runtime_idle(). This is misleading: any non-zero return value
(including negative error codes such as -EBUSY or -EAGAIN) tells the PM
core to abort automatic suspension of the device, which is commonly used
by subsystems to prevent immediate runtime suspend.

Clarify that unlike ->runtime_suspend() and ->runtime_resume(), the PM core
does not treat negative return values from ->runtime_idle() as a fatal
device error, and that any non-zero value stops the PM core from
suspending the device.

Signed-off-by: Brian Norris <briannorris@chromium.org>
---

(no changes since v1)

 Documentation/power/runtime_pm.rst | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/Documentation/power/runtime_pm.rst b/Documentation/power/runtime_pm.rst
index 8e93766bdf99..6fe20ad8d3d9 100644
--- a/Documentation/power/runtime_pm.rst
+++ b/Documentation/power/runtime_pm.rst
@@ -158,9 +158,14 @@ suspending the device are satisfied) and to queue up a suspend request for the
 device in that case.  If there is no idle callback, or if the callback returns
 0, then the PM core will attempt to carry out a runtime suspend of the device,
 also respecting devices configured for autosuspend.  In essence this means a
-call to pm_runtime_autosuspend(). To prevent this (for example, if the callback
-routine has started a delayed suspend), the routine must return a non-zero
-value.  Negative error return codes are ignored by the PM core.
+call to pm_runtime_autosuspend().
+
+To prevent this suspension (for example, if the callback routine has scheduled
+a delayed suspend or determined the device cannot be idle), the routine must
+return a non-zero value (typically -EBUSY or -EAGAIN).  Unlike
+->runtime_suspend() and ->runtime_resume(), the PM core does not treat negative
+return codes from ->runtime_idle() as a fatal device error; any non-zero value
+simply stops the PM core from suspending the device.
 
 The helper functions provided by the PM core, described in `Section 4`_,
 guarantee that the following constraints are met with respect to runtime PM
-- 
2.56.0.rc1.315.gc6ed9934b7-goog

