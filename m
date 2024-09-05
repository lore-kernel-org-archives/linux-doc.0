Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B40FF17BA7
	for <linux-doc@vger.kernel.org>; Thu,  5 Sep 2024 18:01:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725559298; cv=none; b=TeWZ+VyUF93pevH3peA1sj4nEBzf/GGR2F3DLjBxFysSHoA1jWmE+ZbAy0RvGotLn8QvxdT7y2LNMqjVd7dQngHzz/nMRkdLv9j+qZUr52krUaOMJo3f6sg9DkJ9XIJpAq+IeFpBKEn9pGGi2CYqC/+7LkmJvcI0Vn3seAllUYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725559298; c=relaxed/simple;
	bh=rvM0MhY+xOe40+Kg8PCKqbBg69znHtYI2aMhw7gGaNg=;
	h=From:To:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=I3CsksSDszt8v+a518q97v/2YiFGyC5Xq2E+GrCWTbiBLnze/ZnYz7uHlXN8Dr3ahkRY7l+k+WRccQH/SS30PdV7kJTrBzF/Hn/K3NIKgjyGSt8hZQTBBEUdn9om9pjioLQNjP85jOoYMvxt614JWQWWbvMAMGUczpMc3viBXu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=P1vLL26H; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="P1vLL26H"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net D969C42B25
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1725559290; bh=mzDgRy6sMu/bmzfTZ2iB9fsPqaEbHMQ4R6Zu0hORbJw=;
	h=From:To:Subject:In-Reply-To:References:Date:From;
	b=P1vLL26H6aSaI+0xlYL5I9JjyKenv3AtJxKiYNuRWEV2VPdg7/1J5cYnJaEOCSMLF
	 f5L3dwDxD6b0Ly/kx5xfEjDZpIbf+95QG6gEFf61JUp2K/4ZwDUZ/nYd4Th13HsQDc
	 /q2GpRblMSanfzMdPQmTrNk4d5DTz7xS+TMdbX0mIQ5s3b9CDtZxsNW0h6RYIcj3w7
	 9omRpnN0T/1wDrcgjmVYYTpapMymjl/j+7C2Yw8kk5GlM6KU7q40hsh0KOrwyCuBEL
	 dGHIvT2EGdkwZLVxw8sA8w0LDh8otnoM/l7NUJZI9QFA3jouZKeQdfOPuDaRovHuck
	 qoksYEZzladiw==
Received: from localhost (unknown [IPv6:2601:280:5e00:625::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id D969C42B25;
	Thu,  5 Sep 2024 18:01:29 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Jani Nikula <jani.nikula@linux.intel.com>, "Bernhard M. Wiedemann"
 <bwiedemann@suse.de>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-doc@vger.kernel.org
Subject: Re: [PATCH] docs: Build kernel docs deterministically
In-Reply-To: <87y146p7tp.fsf@intel.com>
References: <20240905113531.65375-1-bernhard+linux-doc@lsmod.de>
 <878qw6qpbu.fsf@intel.com> <18f6aafd-3a96-42fc-9a65-b1b03ab8ae2a@suse.de>
 <87y146p7tp.fsf@intel.com>
Date: Thu, 05 Sep 2024 12:01:29 -0600
Message-ID: <87ed5yj7ye.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Jani Nikula <jani.nikula@linux.intel.com> writes:

>> However my patch for sphinx -j1 did give good test results, too.
>> Maybe in your case that would result in 8 sphinx calls with 1 thread 
>> each, which would be more appropriate for your machine.
>
> The right thing to do is to have one sphinx-build process and pass -j<N>
> to that.

[I wouldn't have minded being CC'd on this conversation...]

I, too, have never seen the behavior Jani reports.

I, too, would like to get rid of as much of the makefile hackery as
possible, but it all did end up there for a reason.

The business around parallelism was intended to make sphinx play well
with other targets being built in the same make invocation.  If you do a
"make -j8 this that theother htmldocs" and there are five processes
working on this, that, and theother, then sphinx should not create more
than three.  See 51e46c7a4007 for more.

In Jani's case, it sounds like the job-slot reservation isn't working
right somehow?

jon
