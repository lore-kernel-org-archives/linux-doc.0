Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B462539659F
	for <linux-doc@vger.kernel.org>; Wed,  4 Mar 2026 10:29:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772620152; cv=none; b=B7Oi6b8xQfHydBbujnmJLRAFl6yk/eoX0hrE0mTnC2vazLiH3/UtfZgfLxaBBNBK4XaCVIW247/IhFV7ZTEYbU3908oEfEPndQA0z0cHJEsgtoi0RY/BbWQcwuWXGdXY95XuVLcfcegQk+43g1AD3o2eg4sx1HwZOt0FodDF22Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772620152; c=relaxed/simple;
	bh=qDvE2HJEzyMcQRpPVVWxoIOiiyNAJs6RPSw659rPKdw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rDX/PMUvXeIDm7D5GiWsqTWOPLWqEFNKYPHGftYT4nbRkpDjlAXMtURbKx+xH7NB4Lg2egoWfzs+Sx13Cq3Uc2Sm60XJ99azClS2AmZF44qjqvFbWjtWCRzBpZOOmHa9F+RTxZINNl7ytdXBOhgwnKmAuIhCbNXbUGZBUJXuITw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jBsfQ57s; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jBsfQ57s"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-439b9b190easo2010157f8f.2
        for <linux-doc@vger.kernel.org>; Wed, 04 Mar 2026 02:29:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772620149; x=1773224949; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WX8r5kTeexA5hjBkPMWcoH7tf0SLIu7YLl43ZFEMlvc=;
        b=jBsfQ57sTT95WvdIbCJk18/rfDFZ661QW/Jn1PM0kwJfTp2sh6A54ECuHCoKOXPd4s
         ktnQoWDMMqOBmS0TO4plMbSS8qUUYNCQ0Uqq7WioE4b6QWtkNAS719MK6l0bbZKDRq/E
         dU/BYzWAS0Q2t0srv0H6jS2SAeKF9ho0Q8HbSjoTJ5gpGRSUzLHeVFtxt3OwGWMxaJzW
         L4DLxO3VeWETaiz9gTB1be/CCUq94QFXSrNkC7YWYYMPA8yFSOsAFOo0h6dBPwIusk3l
         Gw/+bGqNMXhzp6tAkJHrqFW1qrOLUGyG8VMsk6sCa5rwMexnTY6jZLvter46QgTxUQb7
         dihg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772620149; x=1773224949;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WX8r5kTeexA5hjBkPMWcoH7tf0SLIu7YLl43ZFEMlvc=;
        b=gMsrqAQzS8+tWDXEW3QQNyf3BbDUjb5cz4175OLcKhkx5EbNKv3JogizsNTOdbP39B
         BPnCdvptzbxpm1TzZc/KLAbogfgWf/LbdAOPux5boo1XgArFOjXog2UloTIARaC2oeCO
         UJwYnUGAOWWWRvIQTQbyxtjt8YZV+LYhcuk7+gJyWenJ78ZgNywYsWhu8cqoL2UVmwN0
         pTC9PtH0BJfblMIa+qVnX5pRmJADjIVrgV1d+NpI+KcmiuNzPwfEZ3UACCBHlvuFIVM/
         G7jxuzBGqszJBe7jgiBvcnU4jT9hBEV9pWLFsfl4yUVYcPnvicap7u9EX9kA9zirLAig
         uoGQ==
X-Forwarded-Encrypted: i=1; AJvYcCWZKHqvRBnPkBg9KW9cAL9Ko8g2WYMZ4/FptSF0kkqTEBLvfPeW2RKPNixHQRIx8oQRigkpKV8amXs=@vger.kernel.org
X-Gm-Message-State: AOJu0YwmdzToDMw5zI2+g8hjaTLeq/EvVTTXBdXzzhUAPInBRKD8GQtP
	3zInh/BnLKwJLOI0VoZNaEKl7v3f8Ap4engT9/TaXBv07OaZZ1WMvtbn
X-Gm-Gg: ATEYQzzIqiRLOvTgBt6lxb4odrRx4h6c9L/tMw5OZ2faXbY/i3mWwK6A872FTtdi8T8
	7wTfxSaTnym6nwZjozAUew0kxCT81bHu2D2o1OY0ov4i+LdaWah5xMsDJcTTUwm3VQVLHx2c5N4
	KKZsxqVCXPTFROagKhchU0yupQ0nK7a3SP3pjD0JcuSz16eR2/+dlh+X8SCzDLAT6maNMOHQUhv
	Vg7ROjU8CvfQ1bmdwV57vgJ0pBhtTF8IUvjajtQ5QYwVbjaUo1xLVpX3Zm5VPl2QZhaYiVGaymU
	9OSzUhbxwL0sO7F8Ji42f1AdOEsYBA544akCI6pw5elQaNu/2PupDDMXzCc1GSiuPejrj+YApNz
	S1J9pJRq1SgXRjJ7os56/g8U2MrNuE7UnrQkyU0uPsXNcD1f3EDHlPplVOYtUN/A+sFwWv9nKuf
	BgMDvYP42alUfcT6oVqzAHbhCiBP7aoXqu79XsKT+s+Dhn/DA7IbfEo3scgqDxtvDBXA==
X-Received: by 2002:a05:6000:3113:b0:439:b6f1:cd8d with SMTP id ffacd0b85a97d-439c7fd406amr2833014f8f.28.1772620149042;
        Wed, 04 Mar 2026 02:29:09 -0800 (PST)
Received: from laptom.homenet.telecomitalia.it ([193.205.82.17])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439c6129017sm5824734f8f.31.2026.03.04.02.29.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 02:29:08 -0800 (PST)
From: Tommaso Cucinotta <tommaso.cucinotta@gmail.com>
X-Google-Original-From: Tommaso Cucinotta <tommaso.cucinotta@santannapisa.it>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Tommaso Cucinotta <tommaso.cucinotta@santannapisa.it>,
	linux-api@vger.kernel.org,
	Juri Lelli <juri.lelli@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Shashank Balaji <shashank.mahadasyam@sony.com>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] sched/deadline: document new sched_getattr() feature for retrieving current parameters for DEADLINE tasks
Date: Wed,  4 Mar 2026 11:28:16 +0100
Message-ID: <20260304102843.1373905-2-tommaso.cucinotta@santannapisa.it>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260304102843.1373905-1-tommaso.cucinotta@santannapisa.it>
References: <20260303104215.1324243-1-tommaso.cucinotta@santannapisa.it>
 <20260304102843.1373905-1-tommaso.cucinotta@santannapisa.it>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document in Documentation/sched/sched-deadline.rst the new capability of
sched_getattr() to retrieve, for DEADLINE tasks, the runtime left and absolute
deadline (setting the flags syscall parameter to 1), in addition to the static
parameters (obtained with flags=0).

Signed-off-by: Tommaso Cucinotta <tommaso.cucinotta@santannapisa.it>
Acked-by: Juri Lelli <juri.lelli@redhat.com>
---
 Documentation/scheduler/sched-deadline.rst | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

diff --git a/Documentation/scheduler/sched-deadline.rst b/Documentation/scheduler/sched-deadline.rst
index ec543a12..76fdf435 100644
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
+ flags to the SCHED_GETATTR_FLAG_DL_DYNAMIC=1 value. This updates the
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

