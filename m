Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C1BB39657A;
	Tue, 24 Mar 2026 16:40:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774370409; cv=none; b=ZVFPvK1C4zifv0Z6m0YrPqbs7wX5W7MKQuDwxyQiENbdAY+aYXYhcOg8id7EbO66h2l0I0y6yZ4kKEZExBdfO6Ttxiz9N3iRvE2ecZy9eOvSdfn0OqMfg2mQX7IAGOf8Ww+5N7GDM7KW517olyU7ziqPF631vEy8MsTKC+PONaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774370409; c=relaxed/simple;
	bh=99gehL4vZmQYLD6+jppoyfInb2uXyI1DxdGEyn1Y9nM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V1JEkndYqvQzKe8JzcqdD81uaD4K73cDvY3KvOw39kyRMTwcCefE6t/PryF+FOz8rBS9xelmiA9Nghe9NwxJtQCfRvOsRE7SOW5MtOENdw+ax+/pYJoNmNQmKLIbNpZui4NOqB65ZocTvoJ53yRqttLVG/RMJL21LuGQg1qQbpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=tIoeS4Fb; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=6L/gkgiK; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="tIoeS4Fb";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="6L/gkgiK"
Date: Tue, 24 Mar 2026 17:40:05 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1774370406;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=QGH35niTNRfI+yV37IiNtOnioza2chDrC8M7H8wc3Xw=;
	b=tIoeS4FbvmKyploS/o0kxOO2Afvp9iwvler52VpNvq1hQyeBPWHiibbtnxQall4ALz7E3F
	U3WtX2sA9VaLVTJCk2CCUcoJbNP+TLAgfQCr9vJr+NaSn6Xf+kT6KPn8KWwlWKWoLmR50r
	jeaUkuAHOfJFoEcrUvsn9iuzw/Je+YPvmIuGpEd085Ko3fU9q0EA+YG0IGXjb1nSQY2cWW
	WSFbAC9j/gDV4BShKAklXABue4+EQaUbkyM5O/1ha8bVNf1KIgrHxb17lfAY0ut6Gk08nj
	EAYhSyOG0xrvQMYixBQFRNaNqXvVQRGd3NX20HC0WnlkmEKKPyypprgCZ8a3Ag==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1774370406;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=QGH35niTNRfI+yV37IiNtOnioza2chDrC8M7H8wc3Xw=;
	b=6L/gkgiKv1yEyK8tJ69NpBE4BQSzFsLb2PyxYPLaYwBZq10m6T7C1SWEU1JHqRkWQ2EMhK
	GUhP2z1s5gliB1DA==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Waiman Long <longman@redhat.com>
Cc: Frederic Weisbecker <frederic@kernel.org>,
	LKML <linux-kernel@vger.kernel.org>,
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
	Vlastimil Babka <vbabka@suse.cz>, linux-doc@vger.kernel.org
Subject: Re: [PATCH] doc: Add CPU Isolation documentation
Message-ID: <20260324164005.eBNX2ppQ@linutronix.de>
References: <20250809094247.8384-1-frederic@kernel.org>
 <20260324153823.VKwebBuG@linutronix.de>
 <579827ac-a933-45ec-b396-01656c30c9e4@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <579827ac-a933-45ec-b396-01656c30c9e4@redhat.com>

On 2026-03-24 12:00:17 [-0400], Waiman Long wrote:
> > while looking at this again, shouldn't you also do
> > 	echo 7 > cpuset.cpus.exclusive
> > 
> > to ensure the CPU isn't used somewhere else?
> 
> For backport compatibility, the use of cpuset.cpus.exclusive is optional for
> creating a local partition underneath the cgroup root. The example should
> still work without setting cpuset.cpus.exclusive.

I would have to double check but I think only after the
cpuset.cpus.exclusive the CPU vanished from the cpumask of my current
task.

> Cheers,
> Longman

Sebastian
