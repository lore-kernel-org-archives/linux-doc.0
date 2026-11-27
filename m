Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=128.30.2.78
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795764455;
	b=wlwU93IPlslzaTUfgZv25m+JvgtAMqUY5s06giqurfA32OfEMo5Geb70AFuIMc0+aKFQ
	 dxocoscFOn+JoQs7RNECobXMQehsGA0DFGT0KkEdjss6KbvIrczp6AgBMGcAKFe1ScqOZ
	 LQp3RdbHF3H9oNGreRmNR9rFcYKg5oxo8+B7SM4WEfzotAGbuzqthZYyuW77nRpmRg6zM
	 y37lNEVHvGxHeEiL/Zqctdd5wTMMG5aLciGzx3QnaTZ1950ZbmsxPmTYB6m0OBigR0jqn
	 KWAYC+Vgg8Fnh7x0xgXCfdk6ovZIK2mXbQqmXAz08MLYSTgvLphQY06lTUpFfsrN79Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795764455;
	h=DMARC-Filter:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer;
	bh=P8LohURrlDlpTHjXi+zJOE6fLDBszHbYben+qL7P8zA=;
	b=fSwpqTATQ5ZjTrTTaJDYt+rgJtpC+iiwgqu6Fx0TZpKV0btPPWr2F/fwzJB4F68X/usC
	 lIMY2stZeMke+dqRdCHN8nwmQY2tlW9BrkKoAL8SmdPdHf1uWQQSnN26WgcJ7RY4fk+kv
	 o5ZSqYc9Gxsm/3x4satkWw736lYwoteXWdlEoFNfTDc+x/3HG/Dw19sQ8DvXcQzh9nGJT
	 EJn2GMrl/OJxAG/mVzVvibfxIdxBnPAZBRGNLzIBeDH5xn+BS5SD+olP6vTLQgnBV/fgY
	 M9nZbBm6P9ykvFXS5G1xhdgmfbWcchn5DJmABud+UvLf5XwGHM1EAa/5rsV3LbyE2hg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=csail.mit.edu;
	spf=pass smtp.mailfrom=csail.mit.edu;
	dkim=pass header.d=outgoing.csail.mit.edu header.i=@outgoing.csail.mit.edu header.a=rsa-sha256 header.s=test20231205 header.b=MdXfzvvc;
	arc=none smtp.remote-ip=128.30.2.78
Received: from outgoing2021.csail.mit.edu (outgoing2021.csail.mit.edu [128.30.2.78])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98AB4606A321;
	Fri, 27 Nov 2026 07:27:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 98AB4606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=csail.mit.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=csail.mit.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outgoing.csail.mit.edu header.i=@outgoing.csail.mit.edu header.a=rsa-sha256 header.s=test20231205 header.b=MdXfzvvc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=outgoing.csail.mit.edu; s=test20231205; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=P8LohURrlDlpTHjXi+zJOE6fLDBszHbYben+qL7P8zA=; t=1795764454; x=1796628454; 
	b=MdXfzvvcPoXmukuuGJ0V4FfMGrJzHipoMXWjeeOMrGbmiCLiZa6DrCMCfdADC0NjSnVZe4Fs9Jo
	dsib8+5nV0G3qGYOIyPtYFiLt+DRaTuIPE4pJ5a7iYAyffsg7BxOOXF3TK7+pqKAlceW4IJUgtJjA
	L2h6aOWFQkdn/2TiC1t2l+afC2z5qi7VMMOmg/ExpQqSSVBsnmIzmbd+wbPohNhS+JJ0H+53V8hyA
	9Y/OISW3p582+G6GvYEUwMkhI84msFdoxs0M/4OTAMC7Yscjt78ttbyidZkWCv8ffoH72FzAZWqC7
	IlWKr7TghtOJxaL0rFtdvHszLwZnDl5h6noA==;
Received: from [167.220.238.14] (helo=[127.0.1.1])
	by outgoing2021.csail.mit.edu with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <srivatsa@csail.mit.edu>)
	id 1xWqMn-006vml-Mm;
	Fri, 27 Nov 2026 02:27:34 -0500
From: "Srivatsa S. Bhat (Microsoft)" <srivatsa@csail.mit.edu>
Date: Fri, 27 Nov 2026 12:56:59 +0530
Subject: [PATCH 2/4] cpu/hotplug: Trivial doc updates in cpuhotplug.h
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
Message-Id: <20261127-docs-cpuhp-v1-2-a34a2c9f66fa@csail.mit.edu>
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

Make a few readability improvements and fix trivial inconsistencies in
the comments in include/linux/cpuhotplug.h

Signed-off-by: Srivatsa S. Bhat (Microsoft) <srivatsa@csail.mit.edu>
---
 include/linux/cpuhotplug.h | 69 +++++++++++++++++++++++-----------------------
 1 file changed, 34 insertions(+), 35 deletions(-)

diff --git a/include/linux/cpuhotplug.h b/include/linux/cpuhotplug.h
index 1b6dba159bb2..f51303255bf0 100644
--- a/include/linux/cpuhotplug.h
+++ b/include/linux/cpuhotplug.h
@@ -15,7 +15,7 @@
  * BRINGUP_CPU->AP_OFFLINE	BRINGUP_CPU  <- AP_IDLE_DEAD (idle thread/play_dead)
  *		  |				AP_OFFLINE
  *		  v (IRQ-off)	  ,---------------^
- *		AP_ONLNE	  | (stop_machine)
+ *		AP_ONLINE	  | (stop_machine)
  *		  |		TEARDOWN_CPU <-	AP_ONLINE_IDLE
  *		  |				  ^
  *		  v				  |
@@ -23,9 +23,9 @@
  */
 
 /*
- * CPU hotplug states. The state machine invokes the installed state
+ * CPU hotplug states. The state machine invokes the installed state's
  * startup callbacks sequentially from CPUHP_OFFLINE + 1 to CPUHP_ONLINE
- * during a CPU online operation. During a CPU offline operation the
+ * during a CPU online operation. During a CPU offline operation, the
  * installed teardown callbacks are invoked in the reverse order from
  * CPUHP_ONLINE - 1 down to CPUHP_OFFLINE.
  *
@@ -250,9 +250,9 @@ int __cpuhp_setup_state_cpuslocked(enum cpuhp_state state, const char *name,
 				   int (*teardown)(unsigned int cpu),
 				   bool multi_instance);
 /**
- * cpuhp_setup_state - Setup hotplug state callbacks with calling the @startup
+ * cpuhp_setup_state - Setup hotplug state callbacks and invoke the @startup
  *                     callback
- * @state:	The state for which the calls are installed
+ * @state:	The state for which the callbacks are installed
  * @name:	Name of the callback (will be used in debug output)
  * @startup:	startup callback function or NULL if not required
  * @teardown:	teardown callback function or NULL if not required
@@ -269,10 +269,10 @@ static inline int cpuhp_setup_state(enum cpuhp_state state,
 }
 
 /**
- * cpuhp_setup_state_cpuslocked - Setup hotplug state callbacks with calling
+ * cpuhp_setup_state_cpuslocked - Setup hotplug state callbacks and invoke the
  *				  @startup callback from a cpus_read_lock()
  *				  held region
- * @state:	The state for which the calls are installed
+ * @state:	The state for which the callbacks are installed
  * @name:	Name of the callback (will be used in debug output)
  * @startup:	startup callback function or NULL if not required
  * @teardown:	teardown callback function or NULL if not required
@@ -290,10 +290,10 @@ static inline int cpuhp_setup_state_cpuslocked(enum cpuhp_state state,
 }
 
 /**
- * cpuhp_setup_state_nocalls - Setup hotplug state callbacks without calling the
+ * cpuhp_setup_state_nocalls - Setup hotplug state callbacks without invoking the
  *			       @startup callback
- * @state:	The state for which the calls are installed
- * @name:	Name of the callback.
+ * @state:	The state for which the callbacks are installed
+ * @name:	Name of the callback (will be used in debug output)
  * @startup:	startup callback function or NULL if not required
  * @teardown:	teardown callback function or NULL if not required
  *
@@ -313,9 +313,8 @@ static inline int cpuhp_setup_state_nocalls(enum cpuhp_state state,
  * cpuhp_setup_state_nocalls_cpuslocked - Setup hotplug state callbacks without
  *					  invoking the @startup callback from
  *					  a cpus_read_lock() held region
- *			       callbacks
- * @state:	The state for which the calls are installed
- * @name:	Name of the callback.
+ * @state:	The state for which the callbacks are installed
+ * @name:	Name of the callback (will be used in debug output)
  * @startup:	startup callback function or NULL if not required
  * @teardown:	teardown callback function or NULL if not required
  *
@@ -332,15 +331,15 @@ static inline int cpuhp_setup_state_nocalls_cpuslocked(enum cpuhp_state state,
 }
 
 /**
- * cpuhp_setup_state_multi - Add callbacks for multi state
- * @state:	The state for which the calls are installed
- * @name:	Name of the callback.
+ * cpuhp_setup_state_multi - Add callbacks for multi-instance state
+ * @state:	The state for which the callbacks are installed
+ * @name:	Name of the callback (will be used in debug output)
  * @startup:	startup callback function or NULL if not required
  * @teardown:	teardown callback function or NULL if not required
  *
  * Sets the internal multi_instance flag and prepares a state to work as a multi
  * instance callback. No callbacks are invoked at this point. The callbacks are
- * invoked once an instance for this state are registered via
+ * invoked once an instance for this state is registered via
  * cpuhp_state_add_instance() or cpuhp_state_add_instance_nocalls()
  */
 static inline int cpuhp_setup_state_multi(enum cpuhp_state state,
@@ -361,10 +360,10 @@ int __cpuhp_state_add_instance_cpuslocked(enum cpuhp_state state,
 					  struct hlist_node *node, bool invoke);
 
 /**
- * cpuhp_state_add_instance - Add an instance for a state and invoke startup
- *                            callback.
+ * cpuhp_state_add_instance - Add an instance for a state and invoke its
+ *                            startup callback.
  * @state:	The state for which the instance is installed
- * @node:	The node for this individual state.
+ * @node:	The node for this individual instance.
  *
  * Installs the instance for the @state and invokes the registered startup
  * callback on the online cpus which have already reached the @state. The
@@ -379,12 +378,12 @@ static inline int cpuhp_state_add_instance(enum cpuhp_state state,
 
 /**
  * cpuhp_state_add_instance_nocalls - Add an instance for a state without
- *                                    invoking the startup callback.
+ *                                    invoking its startup callback.
  * @state:	The state for which the instance is installed
- * @node:	The node for this individual state.
+ * @node:	The node for this individual instance.
  *
  * Installs the instance for the @state. The @state must have been earlier
- * marked as multi-instance by cpuhp_setup_state_multi. NOP if SMP=n or
+ * marked as multi-instance by cpuhp_setup_state_multi(). NOP if SMP=n or
  * HOTPLUG_CPU=n.
  */
 static inline int cpuhp_state_add_instance_nocalls(enum cpuhp_state state,
@@ -395,11 +394,11 @@ static inline int cpuhp_state_add_instance_nocalls(enum cpuhp_state state,
 
 /**
  * cpuhp_state_add_instance_nocalls_cpuslocked - Add an instance for a state
- *						 without invoking the startup
+ *						 without invoking its startup
  *						 callback from a cpus_read_lock()
  *						 held region.
  * @state:	The state for which the instance is installed
- * @node:	The node for this individual state.
+ * @node:	The node for this individual instance.
  *
  * Same as cpuhp_state_add_instance_nocalls() except that it must be
  * invoked from within a cpus_read_lock() held region.
@@ -416,7 +415,7 @@ void __cpuhp_remove_state_cpuslocked(enum cpuhp_state state, bool invoke);
 
 /**
  * cpuhp_remove_state - Remove hotplug state callbacks and invoke the teardown
- * @state:	The state for which the calls are removed
+ * @state:	The state for which the callbacks are removed
  *
  * Removes the callback functions and invokes the teardown callback on
  * the online cpus which have already reached the @state.
@@ -429,7 +428,7 @@ static inline void cpuhp_remove_state(enum cpuhp_state state)
 /**
  * cpuhp_remove_state_nocalls - Remove hotplug state callbacks without invoking
  *				the teardown callback
- * @state:	The state for which the calls are removed
+ * @state:	The state for which the callbacks are removed
  */
 static inline void cpuhp_remove_state_nocalls(enum cpuhp_state state)
 {
@@ -439,7 +438,7 @@ static inline void cpuhp_remove_state_nocalls(enum cpuhp_state state)
 /**
  * cpuhp_remove_state_nocalls_cpuslocked - Remove hotplug state callbacks without invoking
  *					   teardown from a cpus_read_lock() held region.
- * @state:	The state for which the calls are removed
+ * @state:	The state for which the callbacks are removed
  *
  * Same as cpuhp_remove_state nocalls() except that it must be invoked
  * from within a cpus_read_lock() held region.
@@ -450,12 +449,12 @@ static inline void cpuhp_remove_state_nocalls_cpuslocked(enum cpuhp_state state)
 }
 
 /**
- * cpuhp_remove_multi_state - Remove hotplug multi state callback
- * @state:	The state for which the calls are removed
+ * cpuhp_remove_multi_state - Remove hotplug multi-instance state callback
+ * @state:	The state for which the callbacks are removed
  *
- * Removes the callback functions from a multi state. This is the reverse of
- * cpuhp_setup_state_multi(). All instances should have been removed before
- * invoking this function.
+ * Removes the callback functions from a multi-instance state. This is
+ * the reverse of cpuhp_setup_state_multi(). All instances should have
+ * been removed before invoking this function.
  */
 static inline void cpuhp_remove_multi_state(enum cpuhp_state state)
 {
@@ -469,7 +468,7 @@ int __cpuhp_state_remove_instance(enum cpuhp_state state,
  * cpuhp_state_remove_instance - Remove hotplug instance from state and invoke
  *                               the teardown callback
  * @state:	The state from which the instance is removed
- * @node:	The node for this individual state.
+ * @node:	The node for this individual instance.
  *
  * Removes the instance and invokes the teardown callback on the online cpus
  * which have already reached @state.
@@ -484,7 +483,7 @@ static inline int cpuhp_state_remove_instance(enum cpuhp_state state,
  * cpuhp_state_remove_instance_nocalls - Remove hotplug instance from state
  *					 without invoking the teardown callback
  * @state:	The state from which the instance is removed
- * @node:	The node for this individual state.
+ * @node:	The node for this individual instance.
  *
  * Removes the instance without invoking the teardown callback.
  */

-- 
2.43.0

