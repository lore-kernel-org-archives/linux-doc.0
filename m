Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A94AB3148C9;
	Thu,  9 Apr 2026 14:32:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775745159; cv=none; b=MpQSx4ZULoX5yUWfLQkiJsSaGd3LicG+xevFqLTiLl4eLzX/bhulvtmwltTbzXrs/jpwxbmHSCFxoJ01+ZLMdJO+2sG3Zux80p9wP9QbRVg87mBcLRhWszIPVaIK34E2winBsxNoGjA4AfeM9Q6J0fExaoaMubwG68mGUq5kuGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775745159; c=relaxed/simple;
	bh=koeppL6179ADT52EXKbsDimvYiR3MPzCB8z2yzpg5Dw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=ZOllG502xHoAnztlThjBuUaEetzIdWIgJU74ihUAG6XyTTUpWHb07JcAC+AoJB8dwY0CTVqJakWbGUKbsnq+iKNEWl7lHVLyi4eOVMP6LZkZiIIeXiyjRSjtZsY8XRNJQpzW4MdsTYKInHtfV9l2hkE1JVm2AFwrgNtXbUJClk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=QzmIw7BI; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="QzmIw7BI"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 00CC740B2D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1775745155; bh=koeppL6179ADT52EXKbsDimvYiR3MPzCB8z2yzpg5Dw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=QzmIw7BIhrOD4ArQ4C4z9OsXZMHz6Yr/ev01NDDnc8QRaz9yvFITCMehOm1WF4u5Y
	 1loP2B2Aod59CBiN5TD/jS+6oa5WNMuWkQJKM2Jyp+1IltWR2QYKk2O71prlfdPCn3
	 q6AfJ3CU35lEaW/qmSGrlQu//7lLQtkYTLw1wwrEtJ/IKfaQSrnbxcK6AT7jY/cCao
	 2FuIYN3PiD2KHJv5OxQH9ObFsos6RigNR1P5uUcuUfeHeCoT5ikxZt7zrzv8/yih+3
	 ih51eHXxCk1MgWPRBye+mU0gAvAxo42g/IuvYxRT6Budk0SxL09R08C+GhA4oEGc26
	 iGbjvNXMqComw==
Received: from localhost (c-71-229-227-126.hsd1.co.comcast.net [71.229.227.126])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 00CC740B2D;
	Thu,  9 Apr 2026 14:32:34 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Aaron Tomlin <atomlin@atomlin.com>, Christoph Hellwig <hch@lst.de>,
 Frederic Weisbecker <frederic@kernel.org>, Jens Axboe <axboe@fb.com>, Ming
 Lei <ming.lei@redhat.com>, Thomas Gleixner <tglx@kernel.org>, Valentin
 Schneider <vschneid@redhat.com>, Waiman Long <longman@redhat.com>, Peter
 Zijlstra <peterz@infradead.org>, John Ogness <john.ogness@linutronix.de>
Subject: Re: [RFC PATCH] Documentation: Add managed interrupts
In-Reply-To: <20260401110232.ET5RxZfl@linutronix.de>
References: <20260401110232.ET5RxZfl@linutronix.de>
Date: Thu, 09 Apr 2026 08:32:34 -0600
Message-ID: <87wlygb3wd.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Sebastian Andrzej Siewior <bigeasy@linutronix.de> writes:

> I stumbled upon "isolcpus=managed_irq" which is the last piece which
> can only be handled by isolcpus= and has no runtime knob. I knew roughly
> what managed interrupts should do but I lacked some details how it is
> used and what the managed_irq sub parameter means in practise.
>
> This documents what we have as of today and how it works. I added some
> examples how the parameter affects the configuration. Did I miss
> something?

There's been a lot of silence on this one... should I pick this one up,
or are there other plans for it...?

Thanks,

jon
