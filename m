Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 926DC1E5B88
	for <linux-doc@vger.kernel.org>; Sun, 21 Jun 2026 02:25:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782008728; cv=none; b=TS2/EGpb8hC4GOA7SbW/OS1bFkC7AnJ/L4QfRoqA1i7mHPJD3L8rYS6oPhcwlf8z0qnr/S+Gm+jw8OS1S8U5zX3SceBGsmhNTn7qrJMXGeerZtDWWCXvxXaM4HgPeTBiuCgEkxQWX6YcrsnKQYJtmmjmIENvGK0bk944qF4n3vQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782008728; c=relaxed/simple;
	bh=qiDmpwHvSf0ESSsN4jjuEyK0qPyNBrD4EVAWjiINbno=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cRcARCsyHmb97ke3KJhK1JoRP8+EgcoV4BR6TFDNUYrbIE7XjFt6SMeH7DUBVlWJ59lgVrfpt0OJuoc/sQJbbkgFB5VWzjf1V7QA6VD3HL9P8zaiTBeVSD+UDrJfrAWZVil4ud8SUaoFPSIv4b857AyqT+8qSrlz7JAJVYvp2zk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TAcREkJ8; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TAcREkJ8"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-8423610ec93so3033034b3a.2
        for <linux-doc@vger.kernel.org>; Sat, 20 Jun 2026 19:25:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782008726; x=1782613526; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FdaA/SM11os14S0jUA16RVB04AGKXRXcDaaAOIoqvxs=;
        b=TAcREkJ8ZgvuVMICHbkhJTv59R3Jvu42JPxI9BBL2FMtR9TUJ5pmsY0YwkERi/cMlH
         Q1wLiQb4dMDszOxUj/PIvtsyV1z8F5tpdAJdBB5gJjg0ONYNtyhJB+GKw4Ji/AM65yUD
         JCOLGA4jiANQmyW9vtH6WhJVHysYpuPd8p+uHuDHg3GWKAvATzGZLbrcsYSijZhmK+15
         Ies1uzmyk/EXm5XYeABSx1hXpDmk/C5NrSmPic1j1jZbGxqxPgAPASNPbfE+RK8brVJf
         90dJz1uU4jQZkr4o7AbjFE8YA+wJIDCzhvvog8OyDW0S0XaoBCQX0MYhq+4kYIRCtRoX
         cvdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782008726; x=1782613526;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FdaA/SM11os14S0jUA16RVB04AGKXRXcDaaAOIoqvxs=;
        b=Q5V8w2EBVKFIxthKVY6I3lAM6gMZMWkX0cVaKJqPQ6begf8mKYc7DhXNh2nC3Lc4GJ
         xiqlKDKXVsppUv+H4HaVRG8EsH1l6UI2pG75bBZTITKNgxoeQCy0m0F3VhgmYUTnP4dc
         1OpgZ5Gm94T12oFPd1sC6TyCtkrzy0fsXiXw0BXdP7q3DNQAimJNkAB0WNQyEJHWtYvv
         FBeFW6Fl7SDyve6hRJ5MgQCgwIWjNl4madr4Qmimbyd1SYx4SJxNKrKEl8ysbWnNO+kO
         u7bXybDkgKwBXVYabSCCHkRuqlEyVr6sYLOyzVhOxyCtXne6s9zmFj8s9OhuFn4iKVY+
         R4dg==
X-Forwarded-Encrypted: i=1; AFNElJ/o2i9xj2Nej/B8dcaep3xE18+NrR7/GlRlz22IpRH52dD6eww73knD5fH+DTL2YAHs/oyk4ZK/l6c=@vger.kernel.org
X-Gm-Message-State: AOJu0YwGaieY4+qb4qK6u2/BwDh9iJme5fe1FgYzDf3rCUrvnctxZSJp
	oqoXIGs0tAlxiSZ2YiI9oSutAiim2iJdlZEQ9Ic01RKCOZbHtVBga3fb
X-Gm-Gg: AfdE7cnsxBtZ04q1dvvAzerpegLcPk6aZuzxB9NZa/XZgI6kE3kx1qmUKC4iIch1x7X
	A0FupZbfwlG1nw4QbReyXC2adogfZIVwLk7FVTsBoD3GkcN3kG6HtdU0O9l+mx8U3RDZuKlXNNE
	8AaZUsUsAeZFvu4IDzfVoiGiKIMx0ddyei+8+mwdZcwWFg8S3MegRcphykO0wKvMQHHxIb4LZbA
	GmfbFdJC7x/pmQ1w6au9DXo10zcpv+cYV99GcJDpehSVqy+VwGHL0HvAOAUnDCmr75492zTrqBs
	PJiK2KEXVdjoR6Z22ZjWw43PY1g3zN8atNDsb9fPZOrfwrcEdT9vzowwR4ALx5EDEuphbhRsz9Y
	dy5WaU/5IsAMYvYrwNdA3hVcDmUc6PlD5NwdP435bfpuzr7p/IuQN6FOdDlC9NVUqq6Oy6vRYsx
	TY7nwAJCFZsJkEpvu3wLJxqsm2MO5+Qk8QtSlGxRnrFXc=
X-Received: by 2002:a05:6a00:2d06:b0:83e:f75d:828d with SMTP id d2e1a72fcca58-845507c22camr9640905b3a.16.1782008725714;
        Sat, 20 Jun 2026 19:25:25 -0700 (PDT)
Received: from xiaodong.localdomain ([2409:8a1e:9342:7650:8919:8769:2de0:afea])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84564ed3bd8sm3262233b3a.56.2026.06.20.19.25.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Jun 2026 19:25:25 -0700 (PDT)
From: wangxiaodong <wangxiaodong827546786@gmail.com>
To: rafael@kernel.org,
	viresh.kumar@linaro.org
Cc: corbet@lwn.net,
	skhan@linuxfoundation.org,
	linux-pm@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	wangxiaodong <wangxiaodong827546786@gmail.com>
Subject: [PATCH] Documentation: admin-guide: pm: cpufreq: fix sampling_rate example command
Date: Sun, 21 Jun 2026 10:25:03 +0800
Message-ID: <20260621022515.10137-1-wangxiaodong827546786@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The example shell command for setting ondemand's sampling_rate wraps an
arithmetic expansion $((...)) in command-substitution backticks. The
arithmetic result is then executed as a command, which fails and writes
an empty value. Drop the surrounding backticks so the computed value is
passed to echo as intended.

Signed-off-by: wangxiaodong <wangxiaodong827546786@gmail.com>
---
 Documentation/admin-guide/pm/cpufreq.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/pm/cpufreq.rst b/Documentation/admin-guide/pm/cpufreq.rst
index 8831cface585..34baf20cc202 100644
--- a/Documentation/admin-guide/pm/cpufreq.rst
+++ b/Documentation/admin-guide/pm/cpufreq.rst
@@ -497,7 +497,7 @@ This governor exposes the following tunables:
 	represented by it to be 1.5 times as high as the transition latency
 	(the default)::
 
-	# echo `$(($(cat cpuinfo_transition_latency) * 3 / 2))` > ondemand/sampling_rate
+	# echo $(($(cat cpuinfo_transition_latency) * 3 / 2)) > ondemand/sampling_rate
 
 ``up_threshold``
 	If the estimated CPU load is above this value (in percent), the governor
-- 
2.43.0

