Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2C593C197D;
	Fri, 20 Mar 2026 15:10:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774019442; cv=none; b=uVoEFOMmAOEFw8o3gbV4ccXP73nl2T26cdIr01REZkzD/BCl7BT8B3enszH98ZEvU6idLdcP09rQ0FgZPYz4YF30YaKP1oazbXisgnVX+wubEzxmz5AUE5615wQQYOfj5OApPKee1z7W+6rV5Z8+fOo9zV6mzhw9GDlKoQQqf/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774019442; c=relaxed/simple;
	bh=njJWv7fz4vXHfHKJnmQikydvMzaXur1DqYPxOXLvlLM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WR9CUOIH4MNGGuGSLW9Ikd9CuS5dqbBNAL3PM+NJHJ0E++Gfrk+Ds+u9LBdMTGtSEdkk+xucwubiK0Yw3HcMhCkkYisdCUptGklovSMv2xRPNyJDi5hEvdol9t92tJGatlUoUcFkK9Nux7YtGMohe0yc/TRSmz5fl+K+oNyFbvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=18ungp06; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=TORfhQ+f; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="18ungp06";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="TORfhQ+f"
Date: Fri, 20 Mar 2026 16:10:36 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1774019438;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HWBVSEpos7FQ8DFkU1FmzKeQFzCmk02Cl03mGiGtqr8=;
	b=18ungp06fGdgLZ59gT+0rQ88DAmo+w4QLZ8+AEJcWXCzkozviq6VinTWtihjYID84LYUfI
	tznNGl0GMB7he1rS06kIgpoQ+XosUsh+yDNPfGX1FoBEWZkVUGOO7Av/yHlaCdS1O8fgiq
	Byj2tWIVOH7p6ulnjiNZdQhCiXWuRpkWQ7Xho5VE3dk41lFJ6nVsVmfioBgtkU21fDhLyO
	zsQ8vyGTmrJLjMVlUMmHjT3mlVudWh7hbJ/z7jMlSfmZ4wcV6BJRkqSYIz+UT5mfacRqg/
	pODLC0xPtevXKFhBF7+MGLtgMfuMIpphcQJST8oncIVuvJdYPn/ASQ7atMomww==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1774019438;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HWBVSEpos7FQ8DFkU1FmzKeQFzCmk02Cl03mGiGtqr8=;
	b=TORfhQ+f0H09xwzzZRl00iTQnPuJckk2uSHkC/VRQtuRAaVFttjupI76nukCEWiALTRg+N
	oi7/EtDZiDxSd4Cg==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Frederic Weisbecker <frederic@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>,
	Anna-Maria Behnsen <anna-maria@linutronix.de>,
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
	linux-doc@vger.kernel.org, John Ogness <john.ogness@linutronix.de>
Subject: Re: [PATCH] doc: Add CPU Isolation documentation
Message-ID: <20260320151036.v_Sn93P-@linutronix.de>
References: <20250809094247.8384-1-frederic@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250809094247.8384-1-frederic@kernel.org>

On 2025-08-09 11:42:47 [+0200], Frederic Weisbecker wrote:
> --- /dev/null
> +++ b/Documentation/admin-guide/cpu-isolation.rst
> @@ -0,0 +1,338 @@
You could start with

=2E. SPDX-License-Identifier: GPL-2.0

at the top.

> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +CPU Isolation
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=E2=80=A6
> +Interface
> +~~~~~~~~~
> +
> +- :ref:`Documentation/admin-guide/cgroup-v2.rst <Cpuset v2 "isolated"
> +  partitions>`

I've been told by Jonathan once to just use the .rst file without
anything around it and the HTML render will make the link on its own.

=E2=80=A6

> +Tradeoffs
> +~~~~~~~~~
> +
> +In terms of cost, this is the most invasive isolation feature. It is
> +assumed to be used when the workload spends most of its time in
> +userspace and doesn't rely on the kernel except for preparatory
> +work because:
> +
> +- RCU is slower due to the locked, offloaded and threaded callbacks
> +  processing (the same that would be obtained with "rcu_nocb=3D" boot
> +  parameter).

You mean the callback invocation is delayed? It shouldn't affect grace
period handling and so on.

=E2=80=A6

> +Checklist
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +You have set up each of the above isolation features but you still
> +observe jitters that trash your workload? Make sure to check a few
> +elements before proceeding.
> +
> +Some of these checklist items are similar to those of real time
> +workloads:
> +
> +- Use mlock() to prevent your pages from being swapped away. Page
> +  faults are usually not compatible with jitter sensitive workloads.
> +
> +- Avoid SMT to prevent your hardware thread from being "preempted"
> +  by another one.
> +
> +- CPU frequency changes may induce subtle sorts of jitter in a
> +  workload. Cpufreq should be used and tuned with caution.
> +
> +- Deep C-states may result in latency issues upon wake-up. If this
> +  happens to be a problem, C-states can be limited via kernel boot
> +  parameters such as processor.max_cstate or intel_idle.max_cstate.
> +

I intended to make a similar list similar to this for the real time part
but it somehow faded away. There is now the idea to identify kernel
options which are not so optimal which include CPU frequency for
instance. The requirements here are should be the same.

Sebastian
