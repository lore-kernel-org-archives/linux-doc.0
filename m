Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=128.30.2.78
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795764454;
	b=X3hY5aAgoCEeakkDwMTi6uPk3RLILfAzoTh8ctPSdvjmU/6jTKCqkV3dG3/1KDJgzwkr
	 lKdeDnNwF+qu/tHUOl6rxLcDWZ8iww6AacOhekjgK9wJOwIu3IjvjQnCn9VxCbIXYOgmc
	 uQZaLHCsCTW5EL0UktXb54HTf21ZT3uy0W9jZj3YfNUoVOdGP8x3FGSmMa8UuBgjB0Ywa
	 BdS3N1Pr6AEz216VhuexNZWv3u32oLf0t0cg3pXMw6XUpVGPIsJYJ5IV31hCintBIAzZt
	 7EsdCiTRBkNMomdnttKRU/2Om6YHGn8WMjlPh6Qx9OWItMqeeG5vKLf9QmD3r6lo9hQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795764454;
	h=DMARC-Filter:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:To:
	 Cc:X-Mailer;
	bh=5n6Q5orq9xMm3YI71CaAvsUKFSlp7iWHwqrZiVKQjl0=;
	b=i/1EwpqkIc2vRMwgxqJBz/DjaOww4YtQ3eotfXnlOA6FfumT+Y9mzZqPtNhfyDfab23u
	 RpVhx0tmgMKJsiZs/NDVmEuWfxnoh4ThyfOK7VsAKLH609u0DYWcsOxyY05mb7TAr4Pjt
	 an+0XpwDU1HG3Crge2povsH3Epigv3OfCOjxOHrZWlvoRlzGN/scK20LPRQBh6+WVKRhC
	 uSP6yJ7nT9iUOruJdB6hPbBdFlLVIf5TnprOOI6I8BM/Ms6zgx3CEtspkULlMmJnV8wDL
	 TfrgXzxfYWJFcbyWuNWyUJ5zoebD74aPTQGBlHCmbPyjg7YFVZj0Qgp1FilPPFgzqJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=csail.mit.edu;
	spf=pass smtp.mailfrom=csail.mit.edu;
	dkim=pass header.d=outgoing.csail.mit.edu header.i=@outgoing.csail.mit.edu header.a=rsa-sha256 header.s=test20231205 header.b=K7QCCVtj;
	arc=none smtp.remote-ip=128.30.2.78
Received: from outgoing2021.csail.mit.edu (outgoing2021.csail.mit.edu [128.30.2.78])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DBC8606A31C;
	Fri, 27 Nov 2026 07:27:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1DBC8606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=csail.mit.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=csail.mit.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=outgoing.csail.mit.edu header.i=@outgoing.csail.mit.edu header.a=rsa-sha256 header.s=test20231205 header.b=K7QCCVtj
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=outgoing.csail.mit.edu; s=test20231205; h=Cc:To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=5n6Q5orq9xMm3YI71CaAvsUKFSlp7iWHwqrZiVKQjl0=; t=1795764453; x=1796628453; 
	b=K7QCCVtj4Xn+f2qnLKgkUYkfEKrOxbH+NGbTevwN1V2JH5Z9jO+GCC8MHPXA0+FOHhe8B6mdTNB
	z3K2gdTKweaMdxDWuFTDTobEfKbsnARkFarIhWOlzl7gp23xxncxsAMtn787x6vMjhUw5F/i2ueJG
	uYKRHjVLi/Gsjn1oN6PZ95VNHEwF2du8lkkTreRswNQd90hEVOr3LzsLKeh8j2iA9O/kM9uKDeF6O
	XKJutE/zzXdZnQHuHmJFoqVjAGe4BG1C3QZ4UheyddDasor3vUHFMsqs54gZrjXrGerqFZTLmIKGv
	sSp2PmnrqGsPzxB+eF6QikkKX7ZbWRU4o7HQ==;
Received: from [167.220.238.14] (helo=[127.0.1.1])
	by outgoing2021.csail.mit.edu with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <srivatsa@csail.mit.edu>)
	id 1xWqMg-006vml-Bf;
	Fri, 27 Nov 2026 02:27:26 -0500
From: "Srivatsa S. Bhat (Microsoft)" <srivatsa@csail.mit.edu>
Subject: [PATCH 0/4] cpu/hotplug: Update documentation and naming
 convention for hotplug callbacks
Date: Fri, 27 Nov 2026 12:56:57 +0530
Message-Id: <20261127-docs-cpuhp-v1-0-a34a2c9f66fa@csail.mit.edu>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMEwCWsC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDQyNz3ZT85GLd5ILSjALdxFSjFEMDwyTzNHNTJaCGgqLUtMwKsGHRsbW
 1AEddDohcAAAA
To: Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>, Thomas Gleixner <tglx@kernel.org>, 
 Peter Zijlstra <peterz@infradead.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 "Srivatsa S. Bhat" <srivatsa@csail.mit.edu>, 
 Prasanna Kumar T S M <ptsm@linux.microsoft.com>, 
 Saurabh Sengar <ssengar@linux.microsoft.com>
X-Mailer: b4 0.13.0

Hi,

This series makes the CPU hotplug documentation more consistent with the code
and a bit easier to follow. It fixes minor documentation issues and explains the
BP/AP terminology in terms of the control and target CPUs.

Patches 1 and 2 clean up the documentation and header comments, patch 3 explains
BP/AP, and patch 4 adds callback naming guidance.

Thank you very much!

---
Srivatsa S. Bhat (Microsoft) (4):
      Documentation: core-api/cpuhotplug: Fix a few minor inconsistencies
      cpu/hotplug: Trivial doc updates in cpuhotplug.h
      cpu/hotplug: Demystify the terms 'BP' and 'AP' in the code
      Documentation: core-api/cpuhotplug: Add naming convention for callbacks

 Documentation/core-api/cpu_hotplug.rst | 173 ++++++++++++++++++++-------------
 include/linux/cpuhotplug.h             |  74 +++++++-------
 2 files changed, 142 insertions(+), 105 deletions(-)
---
base-commit: 9437ee8b6cf607e883b36e44bd755968daaebd48
change-id: 20261127-docs-cpuhp-ae2d101b7f75

Regards,
Srivatsa

