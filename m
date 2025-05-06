Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEB7A27FD6F
	for <linux-doc@vger.kernel.org>; Tue,  6 May 2025 13:07:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746536878; cv=none; b=f7f2sf5hz2NSGQJRpTYUpweL8L0GnbJEarfwUH506SBGIOxnWpxS7m5v9cp4iXfCA4/qZwypw6XfBXkWmrju5N3bLB1vNpYS4x/8MZcvUVJzbC+CBT/RXncDref9kyzhf2K1F0qP2OuMCoiNtMSJ48r7rwQkEEaLnLplRruhU1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746536878; c=relaxed/simple;
	bh=zjOVZ2SAkzLcb5/R+m2hAemkAhv4VaevQ9mvxPhGapc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=dTyVkb841d9j952Z3eW+rh4eXwMhGsKzPvCPzbE2o7aBcbx4apJRjUxFygyUsp4M3WMFO5ZG6eYyiVvtzGVdWwwCMkhU68y98+sC8gvUjOkbeON/ru1KICxH9WNNstdLgFFx60I6NdJBtpaEqp7FlssCaxtgxWyNNLLa/9C8gyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=cxod9ex4; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="cxod9ex4"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 1D7B741080
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1746536876; bh=zjOVZ2SAkzLcb5/R+m2hAemkAhv4VaevQ9mvxPhGapc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=cxod9ex4OXENLYeVSdHgPu75SCZn00ne2I4EPRnf07TKIZ1mjJwGhzO5VliDnNxI2
	 XBMzXxyNxlZtmNRKKsZ00eNRoy4vJoYpdMolrat8Rt0s6aiLH1tJ5NOYP2t4L422eD
	 7ZkzkO1WnSQ5EuBXYlK4F7BTpJ5JAiZWYWX7fj2SrEmsEePPbl3NWro54PGBI80IXt
	 r7bCMqLCl/97mI2k8FiU28AkooFKVzo4P6XybaGQDFYCLqDKcLUzejPtmg1BRcOGrC
	 Y2ATfyGHEWFN5UVfxuxeYYRioqLVKlipUQb7rSw46G5LDlvQD4zup+X47G4VocieYP
	 SsvATNifeQaHA==
Received: from localhost (mdns.lwn.net [45.79.72.68])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 1D7B741080;
	Tue,  6 May 2025 13:07:54 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Akira Yokosawa <akiyks@gmail.com>, Mauro Carvalho Chehab
 <mchehab+huawei@kernel.org>
Cc: Linux Doc Mailing List <linux-doc@vger.kernel.org>, Andy Shevchenko
 <andriy.shevchenko@intel.com>, Akira Yokosawa <akiyks@gmail.com>
Subject: Re: [PATCH] docs: Makefile: Inherit PYTHONPYCACHEPREFIX setting as
 env variable
In-Reply-To: <0253ce98-960c-4498-8ace-a4354e3ebc26@gmail.com>
References: <0253ce98-960c-4498-8ace-a4354e3ebc26@gmail.com>
Date: Tue, 06 May 2025 07:07:51 -0600
Message-ID: <87msbpx4yg.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Akira Yokosawa <akiyks@gmail.com> writes:

> Commit 6c2f0b28d76e ("docs: Makefile: store __pycache__ at the output
> directory") assigns a new path to PYTHONPYCACHEPREFIX for building
> kernel documentation.
>
> However, it is not necessarily optimal for everyone.
>
> If you find PYTHONPYCACHEPREFIX is already set, it strongly suggests
> that the developer has selected the setting as best suited for one's own
> workflow.
>
> Use "?=" in the assignment to PYTHONPYCACHEPREFIX so that the path of
> $(abspath $(BUILDDIR)/__pycache__) works only as a safeguard.
>
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
> Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Applied, thanks.

jon
