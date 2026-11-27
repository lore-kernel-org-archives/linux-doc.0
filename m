Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=128.30.2.78
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795764461;
	b=J+rFHFW0fkUuVaHgy7w8c6h9oWv5e+POpQ78uULawFpW7nL8XzQ8nNlvo1IvzxlqWD6V
	 7vSefQkAKL5cMef9UBlnd8OcXxhWLuc8LR2/Pj9/ub8EoZk7nisqbj11DLynomD25OQIn
	 0QM2ZGlUJ/E/K/3b0S3rO6zpNNcLsJETSBFzFIH8ltvBHaVxkk5ZKDmmM9Hc610/9yEDJ
	 GfuYYiLkGpvgOb28hXDtN7hbbySjFE/QmoGY83/4A9K4BYu1V/8GPOUgRh599/IrUxg7n
	 /kb+HMgBErpsG2y/2jHNQyIgZlKK/oZTdVBeo3XLNMorIbWmiYCJIACBlPCnzwLeKTA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795764461;
	h=DMARC-Filter:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer;
	bh=E+inXe2OtE6yR8hVT7xOLRg+hct+qdY2m2H2vksox8I=;
	b=4XqnrQHnLJLgZe5pMSWRd0khDqgmZ539gK1kUxc0+G4W9VtxSr8LubQrxbCjwXU1Rap4
	 GzkmLxCA+J0R6n/2NxCs08hltffuAsm0XpjCEkkGXW4UqpSQcsw5BQO99duN2vorfqgL5
	 qX4Kxd/u0VFhcV7G9U6nHfs9CkpuQ71qxxcn8SW8qVaROzxo5OqnbnHPN4LzFhVtnK5qZ
	 U3nvJ8usQU/hH+m2ER55hXf9B+zBe9nug/pPyorKGV+CuCEcmvQTq4/og/+8IsXOReZll
	 YkXt740KrSnr2jpxjcIN5FwR6Qaj/eVfDTIkLQ5vqfcGrgxye/lia6P6v+fh8yJkI6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=csail.mit.edu;
	spf=pass smtp.mailfrom=csail.mit.edu;
	dkim=pass header.d=outgoing.csail.mit.edu header.i=@outgoing.csail.mit.edu header.a=rsa-sha256 header.s=test20231205 header.b=jO0muvt0;
	arc=none smtp.remote-ip=128.30.2.78
Received: from outgoing2021.csail.mit.edu (outgoing2021.csail.mit.edu [128.30.2.78])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 861B3606A680;
	Fri, 27 Nov 2026 07:27:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 861B3606A680
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=csail.mit.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=csail.mit.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outgoing.csail.mit.edu header.i=@outgoing.csail.mit.edu header.a=rsa-sha256 header.s=test20231205 header.b=jO0muvt0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=outgoing.csail.mit.edu; s=test20231205; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=E+inXe2OtE6yR8hVT7xOLRg+hct+qdY2m2H2vksox8I=; t=1795764461; x=1796628461; 
	b=jO0muvt0FSXzgdhQ6AkGyHQ97L84Hw7IidnpqkJ++he9Tmts/ElX+VIiYMrHm3zb4/pz7Y6UAbw
	I3Ntp0Nd8ROSTGepxX7peY/wc85RQ1hw85gcPZ9zYdU1NzNZ01aceVh2FV85V8YaxpOUc7o8puEVi
	7YvKuWKNTfKS/zlG4JiAIHiSVDWvepU7nc1sZHp9daV0gYVR3FLMgj1gk3KK09RMZgrje+1pUT4NB
	EHQqGRGHt0ujmyqEMBXk3Fpv8zty8wBG98Arje2pRWqEALYzVGlmVUJXdyTzouT2+Y0Aleki6RYX1
	fBGDfH1C3rSi2o8Ywc/SxX4duOASwPzLMStg==;
Received: from [167.220.238.14] (helo=[127.0.1.1])
	by outgoing2021.csail.mit.edu with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <srivatsa@csail.mit.edu>)
	id 1xWqMu-006vml-FM;
	Fri, 27 Nov 2026 02:27:40 -0500
From: "Srivatsa S. Bhat (Microsoft)" <srivatsa@csail.mit.edu>
Date: Fri, 27 Nov 2026 12:57:01 +0530
Subject: [PATCH 4/4] Documentation: core-api/cpuhotplug: Add naming
 convention for callbacks
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
Message-Id: <20261127-docs-cpuhp-v1-4-a34a2c9f66fa@csail.mit.edu>
References: <20261127-docs-cpuhp-v1-0-a34a2c9f66fa@csail.mit.edu>
In-Reply-To: <20261127-docs-cpuhp-v1-0-a34a2c9f66fa@csail.mit.edu>
To: Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>, Thomas Gleixner <tglx@kernel.org>, 
 Peter Zijlstra <peterz@infradead.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 "Srivatsa S. Bhat" <srivatsa@csail.mit.edu>, 
 Prasanna Kumar T S M <ptsm@linux.microsoft.com>, 
 Saurabh Sengar <ssengar@linux.microsoft.com>
X-Mailer: b4 0.13.0

Add a naming convention for the startup and teardown callbacks
registered for CPU hotplug states. Follow the common pattern of
subsys_cpu_mode(), where subsys is the subsystem or driver that is
registering the callback, and mode reflects the state that the
callback is associated with (ex: prepare, starting/dying,
online/offline).

Signed-off-by: Srivatsa S. Bhat (Microsoft) <srivatsa@csail.mit.edu>
---
 Documentation/core-api/cpu_hotplug.rst | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/core-api/cpu_hotplug.rst b/Documentation/core-api/cpu_hotplug.rst
index fe5385a8bd8e..ea00859154be 100644
--- a/Documentation/core-api/cpu_hotplug.rst
+++ b/Documentation/core-api/cpu_hotplug.rst
@@ -444,6 +444,16 @@ The @teardown argument is a function pointer to the callback which should
 be invoked during a CPU offline operation. If the usage site does not
 require a teardown callback, set the pointer to NULL.
 
+The naming convention for the @startup and @teardown callback
+functions is "subsys_cpu_mode()". For example: vmstat_cpu_online(),
+trace_rb_cpu_prepare() etc. As with the @name argument outlined above,
+other descriptive function names can also be used instead, if they
+describe the nature of the action performed by that callback better in
+the context of that subsystem (ex: free_vm_stack_cache()). However, if
+you choose to embed the mode in the function's name (i.e., prepare,
+online/offline, starting/dying etc.) as recommended, make sure that it
+aligns with the state that the callback is actually associated with.
+
 The functions differ in the way how the installed callbacks are treated:
 
   * cpuhp_setup_state_nocalls(), cpuhp_setup_state_nocalls_cpuslocked()

-- 
2.43.0

