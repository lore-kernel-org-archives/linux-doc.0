Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D1273115B8
	for <linux-doc@vger.kernel.org>; Thu, 18 Jun 2026 03:12:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781752362; cv=none; b=rELpWYpsIXU3tw7VO7FuQEqh9JhPYlwUF832SXU4VzbImVLaq6ikxu8cmorvMyjWxNaRW5tzpb3emRl50co3N2JbZjglhL4vEfnsnGa4ahp0rMLvN+vRuTJMkXSDnUNtQv+8+XCgiZva9NCalVzGosbYNf5TCq9R+oMesgifjz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781752362; c=relaxed/simple;
	bh=SZSfvX12VlEuwZl+6hAVKIfqxpPnB1VqKOp94X4ryo0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PABc0P9BIxRD+NelpEjC83XVkA1kAXl61gIxkWGE602ekYW4rEKm8FkG9xX5mnIb0X7Q7q8+dX5MgK329Hao7MzbM/iVmF+lWbGM/Me9ulCGmG9BF2UzuxUuWl4aFVhUoOy4LuLUQi41K+FRUnnI06RMZ6RSqp2/DQm3dju32ag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CZqe4DdH; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CZqe4DdH"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2c6ab886da6so2947765ad.0
        for <linux-doc@vger.kernel.org>; Wed, 17 Jun 2026 20:12:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781752361; x=1782357161; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v3I6IX1xUYJMTfIXEi0w2UhaS8cMsiIG3uPORXy/Kqg=;
        b=CZqe4DdHuvA83HXuWHxNF+zbSnA/5STgQ7D8CWrVBB6gmc4KskyUW59tKbRVl1V3vC
         iEnxeIbNe3Xk0TsPZiLIVbK3M1WDMzKTjnTvV9gA2Y5bT1L1ZRtvGxWDT2KP1sVCWjaO
         DN04QcsZ6c6SDbsjZakOm/AD3yccCOyNCXMMd6c1EsiqTocuIJ9wUGoy5B6H/OgIey5M
         G6vWB6sE3qPynStWyu7ckXbk8zpmAUQ7G1rwosSEp8tUxgEfCqd83FBTwaIBr2xpeNe7
         kXFDpdpf+DCO9kP2Wb9HfyfFet0xxaYu/Aj2ft5pOLvWHGzAaqcqE8i/AruzjUBA22wT
         CLWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781752361; x=1782357161;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=v3I6IX1xUYJMTfIXEi0w2UhaS8cMsiIG3uPORXy/Kqg=;
        b=Mu8HXY1ZwEiBVEQSbIx+9TNT/2wIQbU7QfyBgfSXOAjnU3pvtSyTxwes7Wosv304nK
         +1sWASLetqiP4q+gha3UQ3ivTYiMtL1b8Ex01+s8kN1KZZ0YwpZqbe0xRk2Q+Iq09Cjy
         c3kIP3TSlBowYPQklvZq6Yn3wk6A+Vwl5nTtzaS6jlDXnIFtWAPolvnxu8Q45ME4rdDJ
         p8GVV28Pv+pOcii7A2XeMXLNtLH+TTJCRCZwj3nlxttODgSo3hOcbCfLUQkvX7PcBXFR
         nNb9BPN1v13KMNgPdIYE3//0gZ0To9PWKPbho1Ec5ISwOXqofimNr9gfQG+BGRA8vEa8
         u0pw==
X-Forwarded-Encrypted: i=1; AFNElJ/cxHeuDy4/YZYfRqS862yfWWDrBX+mo/XrXBpgwlsXc4EV408MZ/6K421SOk7aVBgfJgVi0/i7UjU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwGmCtR/YpM7EnwOgw69hZDFO3T0haNaKYOy40DOkA4VZzVUnOx
	WR0wVQaMjPRSRb8EaY0qVHS/A4ymgidDdPdm7EzbpPRxU+DmEsdgbVLo
X-Gm-Gg: AfdE7cnOPZk3SsUoUrQldEAwN6IWZYpq9GwMp9bgZ2bOo3HomAIlBGfwyzjuc3d9/Hp
	Lxcw9M8mzj9DibkQl3LYHZEaXPVMcp6eLr4eA8kCWozDIGSe7BksbFBAFPuCcRXBXoYBe2+mdiR
	WD/PCl1Af6zt4Z4CklHKLEBPQ8E7jh6lTeb5ORTU5sX8pWrFdqcZrgRWNaByRK3pnyt89ooaez3
	NwHiUrOMx1gbBYQLZUUTVwhATcNRl6OTrJ5JEAM8bgsBzfEgeW00EhC+HS5JCFd0UWJQDMBiA69
	WlNCZfHQ2DT+MpjXDvD5vhcz2Q8ZZ2WztEjjP1DAoLF8rzxclboV8SOwICzn9bfP7we5mi6rjpl
	wwtWx50nil06LRBKsUw1TNvNSfvNggk+fSpibXQen/SpRbD8fhHwxyw8iR87BiUP6RRLQlYlqqp
	5/9jEx+VhyKnk=
X-Received: by 2002:a17:902:ea07:b0:2be:22cc:e227 with SMTP id d9443c01a7336-2c6bbf9dfa0mr65761055ad.4.1781752360871;
        Wed, 17 Jun 2026 20:12:40 -0700 (PDT)
Received: from [127.0.1.1] ([138.199.21.246])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c6a403b242sm60152975ad.31.2026.06.17.20.12.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 20:12:40 -0700 (PDT)
From: Jing Wu <realwujing@gmail.com>
Date: Thu, 18 Jun 2026 11:11:23 +0800
Subject: [PATCH v3 12/13] docs: cgroup-v2: Document kernel-noise isolation
 via isolated partitions
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260618-wujing-dhm-v3-12-28f1a4d83b68@gmail.com>
References: <20260618-wujing-dhm-v3-0-28f1a4d83b68@gmail.com>
In-Reply-To: <20260618-wujing-dhm-v3-0-28f1a4d83b68@gmail.com>
To: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
 Juri Lelli <juri.lelli@redhat.com>, 
 Vincent Guittot <vincent.guittot@linaro.org>, 
 Dietmar Eggemann <dietmar.eggemann@arm.com>, 
 Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, 
 Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>, 
 "Paul E. McKenney" <paulmck@kernel.org>, 
 Frederic Weisbecker <frederic@kernel.org>, 
 Neeraj Upadhyay <neeraj.upadhyay@kernel.org>, 
 Joel Fernandes <joelagnelf@nvidia.com>, 
 Josh Triplett <josh@joshtriplett.org>, Boqun Feng <boqun@kernel.org>, 
 Uladzislau Rezki <urezki@gmail.com>, 
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
 Lai Jiangshan <jiangshanlai@gmail.com>, Zqiang <qiang.zhang@linux.dev>, 
 Anna-Maria Behnsen <anna-maria@linutronix.de>, Tejun Heo <tj@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Shuah Khan <shuah@kernel.org>, Thomas Gleixner <tglx@kernel.org>
Cc: linux-kernel@vger.kernel.org, rcu@vger.kernel.org, 
 cgroups@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, Jing Wu <realwujing@gmail.com>, 
 Qiliang Yuan <yuanql9@chinatelecom.cn>
X-Mailer: b4 0.13.0

Document that cpuset.cpus.partition=isolated now drives runtime updates
of the housekeeping masks for kernel-noise types: nohz_full (tick
suppression), RCU NOCB offloading, and managed IRQ migration.  No
additional cgroupfs files are required; the partition update path
automatically triggers explicit housekeeping callbacks for all affected
subsystems.

Signed-off-by: Jing Wu <realwujing@gmail.com>
Signed-off-by: Qiliang Yuan <yuanql9@chinatelecom.cn>
---
 Documentation/admin-guide/cgroup-v2.rst | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/admin-guide/cgroup-v2.rst b/Documentation/admin-guide/cgroup-v2.rst
index 6efd0095ed995..7c3b048e75cb5 100644
--- a/Documentation/admin-guide/cgroup-v2.rst
+++ b/Documentation/admin-guide/cgroup-v2.rst
@@ -2721,6 +2721,14 @@ Cpuset Interface Files
 	kernel boot command line option.  If those CPUs are to be put
 	into a partition, they have to be used in an isolated partition.
 
+	When an isolated partition is created or destroyed, the kernel
+	automatically drives runtime updates of the housekeeping masks
+	for kernel-noise types (nohz_full, RCU NOCB, managed IRQ
+	interrupts).  This extends isolation beyond scheduler domains:
+	the tick is stopped on isolated CPUs, RCU callbacks are
+	offloaded to housekeeping cores, and managed interrupts are
+	migrated away.  No additional cgroupfs files are required.
+
 
 Device controller
 -----------------

-- 
2.43.0

