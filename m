Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E1D2390983;
	Tue, 24 Mar 2026 15:38:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774366709; cv=none; b=Hg5rUFbDo2cQjIyxiQkCaK2NoPOLdgVC+GQmq2KfuYkcJnooTNomJd68l2/N+feLWfq+tdbOuCHxbznoid4h39NU5XHhSuRXztK/CSADnOXyE16sH4O1rQ8VP7bCh8Cg1pGvwsYVJ4a2/tOwWddqMrlJBeWDZzhnjHtjW3T6x2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774366709; c=relaxed/simple;
	bh=hATF4iUrtY21p5H9Ygk6vqvHdTkoGhY2Q/kVGcPxCI8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XV243MYad2mMGyv7wr1v18BmqvLp6mmMxw7vlUVJegms2psnB8HYibs3jYpZiazykKyz8+0UteOnPQHNbPNyrq81Xl9s5efZ0QWuIWWYPE9i6Ipgh3UW+6xLaTvNCQARCezAHMa3r/Fa/QT6sqentiyjDXpoSdF+MU8qHz2hfWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=16J67yDL; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=HB1X4GTq; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="16J67yDL";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="HB1X4GTq"
Date: Tue, 24 Mar 2026 16:38:23 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1774366705;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=g97BQutIAgWFM119CNXFachoucn5aV/edZs0Aa1N96s=;
	b=16J67yDLXdd54wjjvy+QwV5ZE0k3mQU3h9Ao4GnlNBJJxUghbGgNlx17TezMBzcQ17Vzcg
	9PU/rvd/yZd4pEfyzD1C9CwG3q6nPr9YQGjnFMAPDy0gHQNtBEeNu/JhFgMH+JmMBahz7d
	U6sPtVvUAv7FJ9uxdzX1kIp2SlWfv17ItILTp9SGM2HaRlxjd26PYzv/GaRB5oimUU4SPD
	JjMO8n81m7EbIHbvBelrtokaGUXV91vxZcRTgxprkstA3D+PMysCFKp6Cow0MegfSyRu2m
	xM32LxFx+nivGjT4L8683KD1vbn5P0wF95fARLk8yGEOq2+dUY6BLRO4QO7zQw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1774366705;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=g97BQutIAgWFM119CNXFachoucn5aV/edZs0Aa1N96s=;
	b=HB1X4GTqVjz9c9vBuEcSK8/USbyaxuKeOAxjcjiL272Qe+qw7OfI2bUJlGyTyXGQyAoMbn
	wYK/ACaREOeZibDg==
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
	linux-doc@vger.kernel.org
Subject: Re: [PATCH] doc: Add CPU Isolation documentation
Message-ID: <20260324153823.VKwebBuG@linutronix.de>
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
=E2=80=A6
> --- /dev/null
> +++ b/Documentation/admin-guide/cpu-isolation.rst
> @@ -0,0 +1,338 @@
=E2=80=A6
> +CPUSET configuration (cgroup v2)
> +--------------------------------
> +
> +Assuming cgroup v2 is mounted to /sys/fs/cgroup, the following script
> +isolates CPU 7 from scheduler domains.
> +
> +  cd /sys/fs/cgroup
> +  # Activate the cpuset subsystem
> +  echo +cpuset > cgroup.subtree_control
> +  # Create partition to be isolated
> +  mkdir test
> +  cd test
> +  echo +cpuset > cgroup.subtree_control
> +  # Isolate CPU 7
> +  echo 7 > cpuset.cpus
> +  echo "isolated" > cpuset.cpus.partition

while looking at this again, shouldn't you also do
	echo 7 > cpuset.cpus.exclusive

to ensure the CPU isn't used somewhere else?

Sebastian
