Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A308C3233E8;
	Mon, 27 Apr 2026 15:07:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777302465; cv=none; b=gQOFUDK7JBpwKrry8ZCjwZwk/WLrrhB4gz0AjBb+m1dDSQsYtzTany7s1CRHvn58kn8qZSDa9OQJxq6bC8AytybiKNNfyxgd7ajSxnpIwwerP+Awurk6sKnISKTpYNoJnqbw82ilMYNNbrxET+0NehmCBkvf9JlMrvm1bkq82vA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777302465; c=relaxed/simple;
	bh=AQBxmjsjMhhbyqKfFr7H9MV/bPUCpy2HbZrxuKFDX0s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=du9OmfhXIhmtcM/6ekKZ/I8o1lfOE8bsHqxolsx+BdYlfHwLpYcFGdLwvY8WVI6Gzq0h0OBhCZ+5oYQ446fuC5iqWlMCNSS2upju0JEYW0FowDm0YQ90vNpZ2L2G8kF0Xz4Do+piozEtzGF3Yq+DHJ0VFx7klXVL2MZlW28qY5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=L97hAbzA; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=3gs6wQg2; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="L97hAbzA";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="3gs6wQg2"
Date: Mon, 27 Apr 2026 17:07:39 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1777302461;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=TuSwYV0esKE1jACuhMi6TAI9cIJLaL1At8AYSskrutY=;
	b=L97hAbzA1IN7PymXEVNLpmW1MGj3uNH/0w0+F2nMCtikamwDRrYBX0zM6pM7xWrTn/bxfr
	wItHlJRvDX/VVS1OpOacL9M4uZltbe3Dm6ntHQUiUAVEgZXk5nOO7GJ4Ks8AEnNPjn73nB
	dQ4opEED4/KEpk/2tvXQvzvJlzpE8ZEdLXY6rUXzQwE/AsHf4ZA5AHVT1szPN1o9ruAIvG
	hHJ/jjXDtLNsSSy55agn82LmZcTAYKX/UWty7Q3Mak+1yax8hQjuYuK9Hm0Tk9FnvJi8wE
	U25/+ziq8W2QBY8rFbgJtDnRKHHuKGy4qxfwEwLG2Hv+CcK2v4sdU8EoioNzkw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1777302461;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=TuSwYV0esKE1jACuhMi6TAI9cIJLaL1At8AYSskrutY=;
	b=3gs6wQg2/UubVXyK0CTCxJGM33Mil8AWZUQYd1aEq8GrfWR+g2OUeqTig3j5RT9MkZXs/v
	bFuSyOcCJTaMpHBg==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Frederic Weisbecker <frederic@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>,
	Gabriele Monaco <gmonaco@redhat.com>,
	Ingo Molnar <mingo@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Michal Hocko <mhocko@kernel.org>,
	"Paul E . McKenney" <paulmck@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>, Phil Auld <pauld@redhat.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Valentin Schneider <vschneid@redhat.com>,
	Vlastimil Babka <vbabka@suse.cz>, Waiman Long <longman@redhat.com>,
	linux-doc@vger.kernel.org, Bagas Sanjaya <bagasdotme@gmail.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	John Ogness <john.ogness@linutronix.de>
Subject: [PATCH] Documentation/kernel-parameters: Remove "Deprecated" from
 isolcpus=
Message-ID: <20260427150739.bwVmmkj2@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

The isolcpus= option has been marked as deprecated in 2017. Back then it
was desired for the domain sub option to be configured dynamically at
runtime instead using this boot command line which provides a static
configuration. In the meantime this option was extended by other sub
options which don't have runtime counterpart or it does not make sense
to provide one.

The deprecated part always referred to the default `domain' sub option
but it was not obvious. Also the reasoning behind the deprecation is
sort of dubious: There is nothing wrong with a static configuration if
there is no desired to reconfigure. This is useful on systems which
have one purpose and the CPU partition configuration is not changed for
the entire lifetime.

Remove the "Deprecated" note. Remove the part of the description which
suggest to use cpuset.sched_load_balance and instead point to the
documentation file which explains how to use cpusets to configure this
at runtime.

Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
 Documentation/admin-guide/kernel-parameters.txt | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 4d0f545fb3ec5..367931fe8da56 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -2755,7 +2755,6 @@ Kernel parameters
 			Format: <RDP>,<reset>,<pci_scan>,<verbosity>
 
 	isolcpus=	[KNL,SMP,ISOL] Isolate a given set of CPUs from disturbance.
-			[Deprecated - use cpusets instead]
 			Format: [flag-list,]<cpu-list>
 
 			Specify one or more CPUs to isolate from disturbances
@@ -2780,11 +2779,10 @@ Kernel parameters
 			  Isolate from the general SMP balancing and scheduling
 			  algorithms. Note that performing domain isolation this way
 			  is irreversible: it's not possible to bring back a CPU to
-			  the domains once isolated through isolcpus. It's strongly
-			  advised to use cpusets instead to disable scheduler load
-			  balancing through the "cpuset.sched_load_balance" file.
-			  It offers a much more flexible interface where CPUs can
-			  move in and out of an isolated set anytime.
+			  the domains once isolated through this boot time
+			  configuration. Use cpusets for a dynamic configuration
+			  which can be altered at runtime. For details see
+			  Documentation/admin-guide/cpu-isolation.rst.
 
 			  You can move a process onto or off an "isolated" CPU via
 			  the CPU affinity syscalls or cpuset.
-- 
2.53.0


