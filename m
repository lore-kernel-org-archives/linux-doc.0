Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE51339D6D4
	for <linux-doc@vger.kernel.org>; Tue,  3 Mar 2026 10:43:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772534586; cv=none; b=jG7NRho6fR4kIeXh/Hl58JCexNEIZV+Py5n2vPhCKA6uy6w2W3ccRUqfgLIBBG1voSVHp+MFknpBV797Y3+bBRh2hGMN0wY9HBJqdygAAzayUyBlivS9arwpJ6M0yz99irfO10Gn5Gw07yYWrjXJUCabs+lVnd7oqPbXiNEaoz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772534586; c=relaxed/simple;
	bh=9KICIc5I6I8duML0IPQQ8kLOZtf/iu5nN1pCrozWAtw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VvssVL26YKUymDPc6eqpxorfvlYUk3yjYb1K4mJYvzjjl3BnB/e+xgLUfG8Sx57mc2kspJadg6xvwdCKjnf0ECpcacjbKXgn2tWbXH5M96GXKRVRLB8M0jgVF9W8+n0dW847je6WLc8mPVzY/DrJJSlgmBZ4BocssNeRiEqtPFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gMkju6jn; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gMkju6jn"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-439a89b6fd0so2599251f8f.2
        for <linux-doc@vger.kernel.org>; Tue, 03 Mar 2026 02:43:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772534581; x=1773139381; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4rYJKiRZStgtdNIAFVyZbjIj2ylSq5foITnYd7+iw20=;
        b=gMkju6jn5rp8EsuP1kV1wylE6WvRTVOAs/R8HIGAlpkvJ+zGfeKuGPgFdqo+bOFyEH
         hgF4OxFLggvn4kikBz19wuuXh7JsfPt/9neWClEVzKCI3IxQ3t9/qnfGzyCr7HkafbIz
         D/Bm/SrJU3dbW5269+0Rm4wGfMC2ddkiIGJoeMiDC0nOJvVV5jvbad0jJVU+oT1Tqw4i
         TUjl820QmAaxgwnKZG3NZMAlB/PLT/ukBa8PINyKYVSaJ+HEZ9qIzDe8pqB21Y0MSXfk
         ua+EiRksHafUPtTu6WNLEDSbOoj2gteryc/CQuJyHmJ5OcBbqQwEe4m/IYgiq8ukQE89
         DWhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772534581; x=1773139381;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4rYJKiRZStgtdNIAFVyZbjIj2ylSq5foITnYd7+iw20=;
        b=LcRghZXK19erKuAY+fXoWa7DiZn95U88axUr2lt0KnmNLU5qGEIqj1QPA3JnfZ8c/f
         KrTVGK17mGw6Jt/d6kYLE4nYM547TSSdByoW8uXeUxZWGnDrPNk4ZAAc4kjcWc0RwAy6
         2D7Jr5g7uxrPRBDQ0iySn2B8q8Dcw/N7tqBgDHktO56m3s4VWHL1OG16kBopKetESHIq
         Hrz9dovPk2LEZksq90shBc/ZO+7QKR+5QbkYnMgZoQQGoQCtnf2QCNdEYfvpz5sopK5a
         gBAfdlf6LjolYyYuBJmo2C6n0OaSavPmhKkOUjefvPPqsCQyEzPdR9cZiY9S9EH30lt0
         WRBw==
X-Forwarded-Encrypted: i=1; AJvYcCV158cf9cg5vDYP6uHYl10B4chXN33MOagvU7ASMpN38ZRGhS4/Ld2i88Jo4fiBSLqgp7j+NstE1c8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzjSZLj7Bj2QZYuA4s5hixG/74ssut2BXh5ubJGWDvjkNWSTcPr
	mbd2u4i4WvyS+zYHVFe3SX6u/dCDHDt9GwMjrYGzqH/JrsHzGVi3ZfnK
X-Gm-Gg: ATEYQzzzyfTv8HF7K3gL0rj/Iw8EfmJAw35Wot/ANAppLkhQJeHYYaB7Gy5PSBNavTY
	wDOXO5O7M76hAH3biiplkKHmHG/LyoTrX6REkK3RmMSk/HA2lwkYEDU6kWgLXC22QQXfOranXqx
	3H4wGpZS1sX4YJyyGFLR3A5c85G0SMh6R0G2F98RBKgDLNy0ApMsu8wdbWvonCvPiO0FOihkY8X
	NGqUGDT07ld7cgTWjhLLjnO+R/qKxZHtRXQfcSL7YEhqW+9pEJfJP0PEdCjUMhHnBF/kPMlHwfW
	gxxRvOr+Usi7HnRGdOfS+HtWbo9hQuAPlK5XDrf3giIG77WmeKjGPok9CiM83eEKTHC0i9gSk/x
	SZ3XrfMrwotX4Z79QsigmgA1oO0jEypEb99zpL5qzInUviZYJJVbScXuPU8Cu9jB4eCuFEzB+U4
	wT6LAIJQZgYvWbo6EXxA/Q0Tq3ode8MBTE0so7xy6p3v488HzKGe+4ptSRvO0M2/r0Zyzbw4HQF
	CooZvc2aPyl6bXZUuhYeYpWopDJKfrMHv/+
X-Received: by 2002:a05:600c:b90:b0:483:456a:514b with SMTP id 5b1f17b1804b1-483c9bb1fbfmr279336355e9.12.1772534580446;
        Tue, 03 Mar 2026 02:43:00 -0800 (PST)
Received: from laptom.homenet.telecomitalia.it (host-87-6-205-41.retail.telecomitalia.it. [87.6.205.41])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4851266e10asm14242405e9.4.2026.03.03.02.42.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 02:42:59 -0800 (PST)
From: Tommaso Cucinotta <tommaso.cucinotta@gmail.com>
X-Google-Original-From: Tommaso Cucinotta <tommaso.cucinotta@santannapisa.it>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Tommaso Cucinotta <tommaso.cucinotta@santannapisa.it>,
	Juri Lelli <juri.lelli@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Shashank Balaji <shashank.mahadasyam@sony.com>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] sched/deadline: document new sched_getattr() feature for retrieving current parameters for DEADLINE tasks
Date: Tue,  3 Mar 2026 11:41:55 +0100
Message-ID: <20260303104215.1324243-1-tommaso.cucinotta@santannapisa.it>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document in Documentation/sched/sched-deadline.rst the new capability of sched_getattr() to retrieve, for DEADLINE tasks, the runtime left and absolute deadline (setting the flags syscall parameter to 1), in addition to the static parameters (obtained with flags=0).

Signed-off-by: Tommaso Cucinotta <tommaso.cucinotta@santannapisa.it>
Acked-by: Juri Lelli <juri.lelli@redhat.com>
---
 Documentation/scheduler/sched-deadline.rst | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

diff --git a/Documentation/scheduler/sched-deadline.rst b/Documentation/scheduler/sched-deadline.rst
index ec543a12..03970cc8 100644
--- a/Documentation/scheduler/sched-deadline.rst
+++ b/Documentation/scheduler/sched-deadline.rst
@@ -628,10 +628,21 @@ Deadline Task Scheduling
   * the new scheduling related syscalls that manipulate it, i.e.,
     sched_setattr() and sched_getattr() are implemented.
 
- For debugging purposes, the leftover runtime and absolute deadline of a
- SCHED_DEADLINE task can be retrieved through /proc/<pid>/sched (entries
- dl.runtime and dl.deadline, both values in ns). A programmatic way to
- retrieve these values from production code is under discussion.
+ The leftover runtime and absolute deadline of a SCHED_DEADLINE task can be
+ read using the sched_getattr() syscall, setting the last syscall parameter
+ `flags' to the SCHED_GETATTR_FLAG_DL_DYNAMIC=1 value. This updates the
+ runtime left, converts the absolute deadline in CLOCK_MONOTONIC reference,
+ then returns these parameters to user-space. The absolute deadline is
+ returned as the number of nanoseconds since the CLOCK_MONOTONIC time
+ reference (boot instant), as a u64 in the sched_deadline field of sched_attr,
+ which can represent nearly 585 years since boot time (calling sched_getattr()
+ with flags=0 causes retrieval of the static parameters instead).
+
+ For debugging purposes, these parameters can also be retrieved through
+ /proc/<pid>/sched (entries dl.runtime and dl.deadline, both values in ns),
+ but: this is highly inefficient; the returned runtime left is not updated as
+ done by sched_getattr(); the deadline is provided in kernel rq_clock time
+ reference, that is not directly usable from user-space.
 
 
 4.3 Default behavior

base-commit: f74d204baf9febf96237af6c1d7eff57fba7de36
-- 
2.45.2

