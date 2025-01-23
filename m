Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5569814BF87
	for <linux-doc@vger.kernel.org>; Thu, 23 Jan 2025 17:48:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737654484; cv=none; b=XpX8hXNEdQ+rNySglVgSFyOT2IT8xXyLo9pYQhm1MPUZKxPtS1BzvNOy2h1CQ/gAgdyrDsi7otSUo6LRep2IIs/JshlWj8mWb3Vn6eizY0mWBRM/J34+rLP/AvrDQyj679C4ZlKTimkxT8TZs88qJelHTJb5t2xxh0Q5xivCbW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737654484; c=relaxed/simple;
	bh=RHF4i/l5LW4d4IbdACORunoa5g+HM7CGS5YYODqMgbI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=rSX0Ycco+CCJ6lqxThi3YOUsCbxw7oLjY4Q6XIZDt1iKDMb78yosjLyBzcqYz1fg4gv1tladzm98X2VPBJ+dVPpUe+Mc7dciuD0rVcRMT19mcrMm8V+aXInhUEA9P4T2UM2/AGJkRwbJslhFu+fZZZqzL/BT1x06rejwXRdGZ/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=M0X2Ccyz; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="M0X2Ccyz"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-21bb2c2a74dso2694725ad.0
        for <linux-doc@vger.kernel.org>; Thu, 23 Jan 2025 09:48:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1737654482; x=1738259282; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qe8IrzoFwADLguy0v3lFQpR+NU5Cc1g2+yi9jBnzrJw=;
        b=M0X2CcyzF1Kztoiip/puw6BPHJJdcrIOIrCWxvPKMIINBBDOzt5SQgq72tkO/KhrVT
         qZZF1nE+tRHkJhLdt3+0tJOwguCUGKdFuryehWi88HHS8KHhXrIP50LV4t4BU7lzk0os
         CikbDxrnTB1QvJd6eyTHuTYa7eKBoSy06doQn8Doa1KyYCtRHiecuKAXMjrZgNZk0SLg
         ROLL+cQ7svtIbJcG7OCB6HwMrRTzNiwRy0+0f5HSvo4qZ9psIBpd99jHFYEufMv1LBqX
         6corcfXvgB8eGu+nU+TlhIC++j2yNAHVYlojBPWmP+fpmK8mbl/OIhTYhYCkgvI37dNh
         eNpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737654482; x=1738259282;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qe8IrzoFwADLguy0v3lFQpR+NU5Cc1g2+yi9jBnzrJw=;
        b=jp/C04r+t61VNzsc7y41NSLHFl4yOD/LxhTI7Spn0f2BR4VF8S4H6xcz16R4eMxWEJ
         +adkDAtKIrp8hx7fhdV3iDtkeaXMkwSnqNTOJaxxz8Q4D/PLyUsvrc99OEzvq2V/jVN+
         KsZWiWHGTPnK4mPuIzU8Rdt36TmZw3Dw1+sKq6DvJz+zijWkiHFvmsXLqkvYu6Ksbqv7
         aarOG+fE5oQOHRTnhigHjxXG66AXYpNOruwkDWxRdpw/h8vz4KiId5lpMiP+yFF99SqS
         9fDDid81q3bC5EJlPY41CadX0zYRRLY0lSnm0jWb8L5vornPXbjKnqj4ZKTEttDKi8RQ
         Bfsw==
X-Forwarded-Encrypted: i=1; AJvYcCXMkqZQ/MH3ucRkB5QOaApw+rqCuhJtcatlMblLpOTY7ElS+ceBqZ6xI8wEQPnhhxDvFO8E8tULG60=@vger.kernel.org
X-Gm-Message-State: AOJu0YyVHjsCU2GjhitdtLi4a/eoV1z23BNkOBMgHR8vTwOiEF2mTbiy
	/e6x4wyHOx8wm8n+3sm7rD2+ScPC1t0nRunFtLiXq0LcFkKkExwWmPC1WgIgD3o=
X-Gm-Gg: ASbGncs2xJpqWUiDbazpyjR3JyWkeNX/77mFTRG7ruEh9AcBJVvADMOjaQPYuD09vtW
	70Q5nycYkLuzY2wy87TKuHkjVmERY6eg/T1piex1v0t+0/R7zb49n9EBmOXfVvbYIL2pC9Og2Bx
	a0weSFUp1xHEHmAZ0rMvWViINXyG/bhz1I9oowHmpTnpcgNC1MaEpNWdmQ26xlXrr96cDGSmeJO
	/s7g8NbvkjSj+4OekZX5S39qg5nnKbUPsH5YyA3bvYrXFVWF9pd0HYOOH2MFQFy7nEQI/IqJSfM
	rQuxTYDXxbyAcXzWPTb81qBe91BVCR2uTrZWh235hqc=
X-Google-Smtp-Source: AGHT+IEFoHNDWziiLPhLiLTskGb/T298gEKfOKRb5IKlpAL3Otku0Mv1eBtYO91eTmkPq17kmZdnvQ==
X-Received: by 2002:a17:903:1108:b0:20b:9b07:777a with SMTP id d9443c01a7336-21d79b26072mr53418795ad.10.1737654482391;
        Thu, 23 Jan 2025 09:48:02 -0800 (PST)
Received: from C02DV8HUMD6R.bytedance.net ([139.177.225.251])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21da4141c4esm1620765ad.110.2025.01.23.09.47.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jan 2025 09:48:01 -0800 (PST)
From: Abel Wu <wuyun.abel@bytedance.com>
To: Tejun Heo <tj@kernel.org>,
	Johannes Weiner <hannes@cmpxchg.org>,
	=?UTF-8?q?Michal=20Koutn=C3=BD?= <mkoutny@suse.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	Bitao Hu <yaoma@linux.alibaba.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Andrew Morton <akpm@linux-foundation.org>,
	Yury Norov <yury.norov@gmail.com>,
	Abel Wu <wuyun.abel@bytedance.com>,
	Chen Ridong <chenridong@huawei.com>
Cc: cgroups@vger.kernel.org (open list:CONTROL GROUP (CGROUP)),
	linux-doc@vger.kernel.org (open list:DOCUMENTATION),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 0/3] Fix and cleanup and extend cpu.stat
Date: Fri, 24 Jan 2025 01:47:00 +0800
Message-Id: <20250123174713.25570-1-wuyun.abel@bytedance.com>
X-Mailer: git-send-email 2.37.3
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Patch 1: fixes an issue that forceidle time can be inconsistant with
other cputimes.

Patch 2: cleans up the #ifdef mess in cpu.stat.

Patch 3: extend run_delay accounting to cgroup to show how severely
a cgroup is stalled.

Abel Wu (3):
  cgroup/rstat: Fix forceidle time in cpu.stat
  cgroup/rstat: Cleanup cpu.stat once for all
  cgroup/rstat: Add run_delay accounting for cgroups

 Documentation/admin-guide/cgroup-v2.rst |  1 +
 include/linux/cgroup-defs.h             |  3 +
 include/linux/kernel_stat.h             | 14 +++++
 kernel/cgroup/rstat.c                   | 74 +++++++++++++++----------
 kernel/sched/cputime.c                  | 12 ++++
 kernel/sched/stats.h                    |  2 +
 6 files changed, 78 insertions(+), 28 deletions(-)

-- 
2.37.3

