Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AFC13438A2;
	Wed,  8 Jul 2026 17:53:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783533227; cv=none; b=XLMz/+0lpaptlG5aoUcCr7JC/lix+3IUNCX3ztWpT0tr/1WF+5JnoMbiT0kdeuyYDmOHQLwgdECPEZvgYts2i794I8TJB/ofFq1U/FHOHo5zMcLu3zfiVsM4BqodeiPlwvfMJlZHWPtwm223Wgc4Qs1GwM+xyUCohl4O9PFxHvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783533227; c=relaxed/simple;
	bh=MHoc2fNJugW6JC+npY0QniZGDEhvVHqcjEDN4lAgNu4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q8Y51tVA8T2y3gSe+ypioOOokpTJdlW4d8zY8X2BkQqtDn0uWJXxXewnFuXLtl4bvpGVJ3u538Ab+Cz7+o456FsdJGRZBDn+DLZj0Yweai1k8lxKLO2svD09jyVmdaFSth3S0z23z0hHrI+J467NKY6fvz0NRMvMf+GKuQhgNgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ecq+3V6s; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ecq+3V6s"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D24CA1F000E9;
	Wed,  8 Jul 2026 17:53:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783533225;
	bh=w6HkMgq7xZQq45kxlr4HOb0fQTfhNxppKwm1QZtCWNw=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To;
	b=ecq+3V6sz5flHqJUxrDvgFC1GAqS/9Xj1xjTuTMrPPylU84+5dvQtmnlbTlPS7sK4
	 UeK4j+fKXqhaf8g91sPuj2DUbwvFEFL8ji+JnLwzAP+Eazlp5KxmiTfkrIsQgji9XV
	 gkMntSERz8h42paAWryiOjjFA+VEEOt7y+XEYGoMdpyOWnjkfi9hw7ZtUb01Aqvu7W
	 idez2UkqjWg/Aen1qPNFclkbC0bkKW60kGjzwp20rGxgzZ1gXPPcwKUhC5TdBMBvD1
	 +gAclfdUApu07P4vzxaWCJ9hyDJvoUHskFGsCXoXDnfJrAw8aM/jkaQX8ZLvfIiXuX
	 vP/PPIokclcnw==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 966C8CE074A; Wed,  8 Jul 2026 10:53:45 -0700 (PDT)
Date: Wed, 8 Jul 2026 10:53:45 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Manuel Ebner <manuelebner@mailbox.org>
Cc: Frederic Weisbecker <frederic@kernel.org>,
	Neeraj Upadhyay <neeraj.upadhyay@kernel.org>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	Josh Triplett <josh@joshtriplett.org>,
	Boqun Feng <boqun@kernel.org>, Uladzislau Rezki <urezki@gmail.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Zqiang <qiang.zhang@linux.dev>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	"open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH] Documentation: RCU: fix brackets
Message-ID: <9b727df8-2310-454e-8d52-a96c366b58ec@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <20260627092644.30809-2-manuelebner@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260627092644.30809-2-manuelebner@mailbox.org>

On Sat, Jun 27, 2026 at 11:26:45AM +0200, Manuel Ebner wrote:
> Remove needless brackets and add missing bracket.
> 
> Signed-off-by: Manuel Ebner <manuelebner@mailbox.org>

Good catches, queued, thank you!

							Thanx, Paul

> ---
>  .../Design/Expedited-Grace-Periods/Expedited-Grace-Periods.rst  | 2 +-
>  Documentation/RCU/Design/Memory-Ordering/TreeRCU-gp.svg         | 2 +-
>  Documentation/RCU/Design/Memory-Ordering/TreeRCU-qs.svg         | 2 +-
>  Documentation/RCU/Design/Requirements/Requirements.rst          | 2 +-
>  4 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/RCU/Design/Expedited-Grace-Periods/Expedited-Grace-Periods.rst b/Documentation/RCU/Design/Expedited-Grace-Periods/Expedited-Grace-Periods.rst
> index 414f8a2012d6..cf0f9cdca7e8 100644
> --- a/Documentation/RCU/Design/Expedited-Grace-Periods/Expedited-Grace-Periods.rst
> +++ b/Documentation/RCU/Design/Expedited-Grace-Periods/Expedited-Grace-Periods.rst
> @@ -410,7 +410,7 @@ workqueues (see Documentation/core-api/workqueue.rst).
>  
>  The requesting task still does counter snapshotting and funnel-lock
>  processing, but the task reaching the top of the funnel lock does a
> -``schedule_work()`` (from ``_synchronize_rcu_expedited()`` so that a
> +``schedule_work()`` (from ``_synchronize_rcu_expedited()``) so that a
>  workqueue kthread does the actual grace-period processing. Because
>  workqueue kthreads do not accept POSIX signals, grace-period-wait
>  processing need not allow for POSIX signals. In addition, this approach
> diff --git a/Documentation/RCU/Design/Memory-Ordering/TreeRCU-gp.svg b/Documentation/RCU/Design/Memory-Ordering/TreeRCU-gp.svg
> index d05bc7b27edb..95a66de40ca5 100644
> --- a/Documentation/RCU/Design/Memory-Ordering/TreeRCU-gp.svg
> +++ b/Documentation/RCU/Design/Memory-Ordering/TreeRCU-gp.svg
> @@ -3933,7 +3933,7 @@
>           font-style="normal"
>           y="-3914.085"
>           x="3745.7725"
> -         xml:space="preserve">rcu__report_qs_rdp())</text>
> +         xml:space="preserve">rcu__report_qs_rdp()</text>
>      </g>
>      <g
>         id="g4504-3"
> diff --git a/Documentation/RCU/Design/Memory-Ordering/TreeRCU-qs.svg b/Documentation/RCU/Design/Memory-Ordering/TreeRCU-qs.svg
> index 7d6c5f7e505c..882132680308 100644
> --- a/Documentation/RCU/Design/Memory-Ordering/TreeRCU-qs.svg
> +++ b/Documentation/RCU/Design/Memory-Ordering/TreeRCU-qs.svg
> @@ -815,7 +815,7 @@
>           font-style="normal"
>           y="-3914.085"
>           x="3745.7725"
> -         xml:space="preserve">rcu__report_qs_rdp())</text>
> +         xml:space="preserve">rcu__report_qs_rdp()</text>
>      </g>
>      <g
>         id="g4504-3"
> diff --git a/Documentation/RCU/Design/Requirements/Requirements.rst b/Documentation/RCU/Design/Requirements/Requirements.rst
> index 8a216e4a46a7..8101fe6229d5 100644
> --- a/Documentation/RCU/Design/Requirements/Requirements.rst
> +++ b/Documentation/RCU/Design/Requirements/Requirements.rst
> @@ -2785,7 +2785,7 @@ both srcu_read_lock() and srcu_read_unlock().  This need is handled by
>  a Tasks Trace RCU API implemented as thin wrappers around SRCU-fast,
>  which avoids the read-side memory barriers, at least for architectures
>  that apply noinstr to kernel entry/exit code (or that build with
> -``CONFIG_TASKS_TRACE_RCU_NO_MB=y``.
> +``CONFIG_TASKS_TRACE_RCU_NO_MB=y``).
>  
>  Now that the implementation is based on SRCU-fast, a call
>  to synchronize_rcu_tasks_trace() implies at least one call to
> -- 
> 2.54.0
> 
