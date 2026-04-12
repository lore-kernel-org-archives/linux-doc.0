Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC07D72618;
	Sun, 12 Apr 2026 19:11:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776021070; cv=none; b=iPQyHxvhwI82uY5G+IGp8edCeZvBtaGMIbjqqR3nQJeLdhLSkcGe3RmppnpFmr7qINQH250USV2ryri6vw2z2PlQ54aonFnTIBx39VwbIC+dbbUyH3uEcbs20RS65qqYS7oIXx+iQwyI53VBry5SYVxTWRC7wGhLoJkRDb9GifY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776021070; c=relaxed/simple;
	bh=+4a0Fz8BYDFZOunHwHJpOj2JPUz0WtvVrFS7Z/WTpLw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=sJco3zuHOarReQvAYrTpDVC/EaXSPpf7HRNTv5farRg3deieP0IFMW2cMWugwuwiPEmQP0f0LG6tmTTFQ1DZEFmdDLm41fxr8RBBcjfIs9yGwk1DyOtKiqZNeaI1rEElBbQbjsr8TjvmGX80wp2ayl8xdK4IfZTLuqMfetr3NY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=faCL9vdB; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="faCL9vdB"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 32061410A1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1776021062; bh=4gfNsuuiRyvhYGF/CLP15c5u2ZySo9CYBw0qbBR6FUY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=faCL9vdB2H+wZfNi1tGkxEydIPihBr7nqnxlcBAApFH7egQ3ib5edCzaxFb/WJXcx
	 jPyBuVAIy8XBJaF1TNPWaDNcbdWTBe27RXALohO/VzmLAQhO1wa76PW7icTTto9gi0
	 rXR0uDRtNJjqn6Wsqe/8zrIC/lD+a4Xf7ROhfUMV/ik7eUDQPNyKY2Z/vmglgBjAzs
	 b5QEnQjGELQWzJ72FZhy6wdPgV+Tlnyk4Y8S7xmS+89KU0Wse+a/mpNcplbidcSFNk
	 QzXX6NFr90H4TMrjDQ7f+7Zldt5ls/MlA8i2U3+9Ew6zl2ZYOfwhoLbwt2ICCwW6JU
	 oGaGM24XRKgBw==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 32061410A1;
	Sun, 12 Apr 2026 19:11:02 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Frederic Weisbecker <frederic@kernel.org>, LKML
 <linux-kernel@vger.kernel.org>
Cc: Frederic Weisbecker <frederic@kernel.org>, Anna-Maria Behnsen
 <anna-maria@linutronix.de>, Gabriele Monaco <gmonaco@redhat.com>, Ingo
 Molnar <mingo@kernel.org>, Marcelo Tosatti <mtosatti@redhat.com>, Marco
 Crivellari <marco.crivellari@suse.com>, Michal Hocko <mhocko@kernel.org>,
 "Paul E . McKenney" <paulmck@kernel.org>, Peter Zijlstra
 <peterz@infradead.org>, Phil Auld <pauld@redhat.com>, Steven Rostedt
 <rostedt@goodmis.org>, Thomas Gleixner <tglx@linutronix.de>, Valentin
 Schneider <vschneid@redhat.com>, Vlastimil Babka <vbabka@suse.cz>, Waiman
 Long <longman@redhat.com>, linux-doc@vger.kernel.org, Sebastian Andrzej
 Siewior <bigeasy@linutronix.de>, Bagas Sanjaya <bagasdotme@gmail.com>
Subject: Re: [PATCH v3] doc: Add CPU Isolation documentation
In-Reply-To: <20260402094749.18879-1-frederic@kernel.org>
References: <20260402094749.18879-1-frederic@kernel.org>
Date: Sun, 12 Apr 2026 13:11:01 -0600
Message-ID: <87o6joyoxm.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Frederic Weisbecker <frederic@kernel.org> writes:

> nohz_full was introduced in v3.10 in 2013, which means this
> documentation is overdue for 13 years.

I've seen worse :)

> Fortunately Paul wrote a part of the needed documentation a while ago,
> especially concerning nohz_full in Documentation/timers/no_hz.rst and
> also about per-CPU kthreads in
> Documentation/admin-guide/kernel-per-CPU-kthreads.rst
>
> Introduce a new page that gives an overview of CPU isolation in general.
>
> Acked-by: Waiman Long <longman@redhat.com>
> Reviewed-by: Valentin Schneider <vschneid@redhat.com>
> Reviewed-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
> ---
> v3: Apply suggestions from Randy, Steven, Valentin, Waiman and also Sashiko!
>
>  Documentation/admin-guide/cpu-isolation.rst | 357 ++++++++++++++++++++
>  Documentation/admin-guide/index.rst         |   1 +
>  2 files changed, 358 insertions(+)
>  create mode 100644 Documentation/admin-guide/cpu-isolation.rst

Applied, thanks.

jon
