Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=128.30.2.78
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795764458;
	b=KRA3WI9fKCHALAc/m8vgiJ9az6RRMlplzGaGGL5IwOzlmDi7DBRSFh7OvK7zDlhewUIZ
	 p9Shri1SwwvYxGaHnGYgyHFe6pRGD2miDX57EBevIJ3bomu1bzGeuFCWD5SJHI9ibDFZG
	 0552H6a5pg3FNOcyNedv1Xx2lqthRZL+XcaYGuxQYgvVjNsW+z6PT+xCI0peCarcUInTv
	 T1ZpcbPoRVraM/x0nXgnZ8VmLbv3BmWnMGIuXJNCwuT8Lm61pN9e/R0vN5Hpdt9kGFso0
	 wNZu6DSxZ5xn3HEisFXEad6PW0+HZnGGYiXS2zgyWg54XwpPFizqPZUhsXKjJ5XdNfg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795764458;
	h=DMARC-Filter:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer;
	bh=Bjt1D7FBQxrJYEJhpkb4XF0Ddt1vNcZhss+S+e4W0dU=;
	b=HOYdMloU/2oT3ar7Zde5F31y5po1W1XHrR5Tdi1SuLrXL6QDLlFrs7kZIaSPwrgPfyOv
	 mUKp/0BQFceNhKrocNnqUOAFjt6qgVdljuhiAdTemOv/mrytxDLKY79+zZ03SbCYOFmaN
	 mILbTFc2yLppQloOfKi2598bvLSJw9xX/N5F5MR+UtI96vIB+t1cJoKBzEFXRGb9/GOYd
	 Bey/BhsWpTVbdCtml4sISLtmaq6JOvpxuwpQpbAk5kojFBSA5IMjr40CCPPpg6TE8x9k6
	 pUHgamslrYIu7Uo6z6HGlluYYtbHvTNMfryUJ4mZ4nP+R+qYIZQLN6UOkhNYXoFGisA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=csail.mit.edu;
	spf=pass smtp.mailfrom=csail.mit.edu;
	dkim=pass header.d=outgoing.csail.mit.edu header.i=@outgoing.csail.mit.edu header.a=rsa-sha256 header.s=test20231205 header.b=RJaw2KMT;
	arc=none smtp.remote-ip=128.30.2.78
Received: from outgoing2021.csail.mit.edu (outgoing2021.csail.mit.edu [128.30.2.78])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CDF0606A680;
	Fri, 27 Nov 2026 07:27:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2CDF0606A680
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=csail.mit.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=csail.mit.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outgoing.csail.mit.edu header.i=@outgoing.csail.mit.edu header.a=rsa-sha256 header.s=test20231205 header.b=RJaw2KMT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=outgoing.csail.mit.edu; s=test20231205; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Bjt1D7FBQxrJYEJhpkb4XF0Ddt1vNcZhss+S+e4W0dU=; t=1795764457; x=1796628457; 
	b=RJaw2KMTgxkJFhhZTxTjdvvGq7P3o0cvI6Gz0Y+h/zC3ujTdSEbZBhckQU6kpYfMb/C6USxf3Dp
	zCqlsltH9xSPBBZBa+xOElp+TD6dxV7u6A0F6GNmc0lcnLYmzGln/r+PvhRP7VtJwmS52Q5q/jo3+
	3Z4XPBUQXybMYsJvjy9JpxASYY2kE7ZuAEvW8YVMirIWPiJBdbhFGWodwqSYrls7tha/A1+QbbWpZ
	XbJi938JbENKnbPYuvLfHz0l7CW2fTN0ees6JG/3cA+wd+Zvaf3PXdHZNAbiAf7AToEYHmr6re6yp
	zcmkFvnFb9xN1Wn1z/BZBT6LT/ZdsSy9Nbtg==;
Received: from [167.220.238.14] (helo=[127.0.1.1])
	by outgoing2021.csail.mit.edu with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <srivatsa@csail.mit.edu>)
	id 1xWqMr-006vml-2x;
	Fri, 27 Nov 2026 02:27:37 -0500
From: "Srivatsa S. Bhat (Microsoft)" <srivatsa@csail.mit.edu>
Date: Fri, 27 Nov 2026 12:57:00 +0530
Subject: [PATCH 3/4] cpu/hotplug: Demystify the terms 'BP' and 'AP' in the
 code
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
Message-Id: <20261127-docs-cpuhp-v1-3-a34a2c9f66fa@csail.mit.edu>
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

The terms 'BP' and 'AP' appear throughout the CPU hotplug code and
documentation, but there is no mention of what these acronyms expand
to and what do they actually represent in the context of the CPU
hotplug state machine.

Provide some background in the code and the docs to demystify these
terms.

Signed-off-by: Srivatsa S. Bhat (Microsoft) <srivatsa@csail.mit.edu>
---
 Documentation/core-api/cpu_hotplug.rst | 20 ++++++++++++++++++++
 include/linux/cpuhotplug.h             |  5 +++++
 2 files changed, 25 insertions(+)

diff --git a/Documentation/core-api/cpu_hotplug.rst b/Documentation/core-api/cpu_hotplug.rst
index 4e228fc00624..fe5385a8bd8e 100644
--- a/Documentation/core-api/cpu_hotplug.rst
+++ b/Documentation/core-api/cpu_hotplug.rst
@@ -143,6 +143,26 @@ at state ``CPUHP_OFFLINE``. This includes:
 The CPU hotplug API
 ===================
 
+CPU roles in CPU hotplug operations
+-----------------------------------
+
+Any CPU hotplug operation involves at least 2 CPUs performing different roles: a
+control CPU that drives the online or offline operation, and a target CPU which
+is actually onlined or offlined as a result.
+
+The CPU which takes the role of a control CPU for a given hotplug operation is
+referred to as BP (Boot Processor), and the target CPU is referred to as AP
+(Application Processor) in the code.
+
+The terms BP and AP make the most literal sense when we consider the very first
+CPU online in the system, where the Boot Processor is already up and running the
+kernel in uniprocessor mode, and onlines the first secondary CPU (i.e.,
+Application Processor). After this step, for any subsequent CPU online or
+offline operation, any CPU can take the role of the control CPU and any CPU can
+be the target. Hence, the terms BP and AP lose their literal meaning but they
+are used as a shorthand in the code for what they represent (i.e., the control
+and the hotplugged CPUs respectively).
+
 CPU hotplug state machine
 -------------------------
 
diff --git a/include/linux/cpuhotplug.h b/include/linux/cpuhotplug.h
index f51303255bf0..52c42db50ec2 100644
--- a/include/linux/cpuhotplug.h
+++ b/include/linux/cpuhotplug.h
@@ -5,6 +5,11 @@
 #include <linux/types.h>
 
 /*
+ * CPU hotplug state machine:
+ *
+ * BP = "Boot Processor" or control CPU for the hotplug operation.
+ * AP = "Application Processor" or "hotplugged" (target) CPU.
+ *
  * CPU-up			CPU-down
  *
  * BP		AP		BP		AP

-- 
2.43.0

