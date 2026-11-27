Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795761532;
	b=IC3lLK9O6tze6nim4AETwo3HyMHPG4m5DyiFDwm9UwKJxSwzbYNamztTMZQzFFy8lSpQ
	 HalCyT+i9qc7BDsCm1GfmLwsZ54Pdhk2H8anldKQH5DqTZufXhsh6TCQL0xK/TC7ouPnf
	 kboUOhgWzihOxQmm58oSVhchSZ9jMVKGykD+dAv2XUVi6Ls6Zmh6H63Xgfa1pzylvVg3E
	 fWMX6iZIgYVKdRZdvjbEjFnpMoarSQot1AuDLw6V/P2sjWl9m0iovApadtiLMUjRR0sIX
	 srJ3N1nG7abYemPgQd2L2/TIMdR9piYSQgI4tIpvunENuf/OSttLyAg65l7nyeWYAag==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795761532;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=bbE02Lb11+jV9iJrHznKia7N+kqOq23MgF6haH8bFi8=;
	b=3ZdBv6TWG52wSTZpVLtC8qHUN9XJVfEwOaazXAAfob43msqFPHeSS1hNl/J1Z/3ziK+a
	 Drz11ozXmJ9yMkNbplLd0bQc5K5PWxcHqyoXnXD2pCfaYzb8APuk4OwezymqZUXyS5oTI
	 ACxD2oVUcWrvFKLcByMvLh9XGefGZWhUVrhXGzACUp/wAZ7YB+yfqCutfkLRBEULcRVMa
	 DSKMzD3i3w/UxYncguCHt58+onDF17eI7OMPHdfLfHWSDVKqGn9Nfleo6xU3rgt+y4dez
	 /DaJbF/YJ/SXFM8ntVhwKnLTBUunYDEngfEA1adwJOeb+VO/mHwkVNP03M6vwwtGJTw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XrSKkdCx;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0D64606A321;
	Fri, 27 Nov 2026 06:38:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XrSKkdCx
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795761532;
	b=m90cs66mVmRRabqV54KH3eVU12fOD+1R2YQSXCf3HGLGBXrrJUnKtwWnjFKZP4xxQxyQ
	 xFeEO/D8WqCekVIPe33zl8VFotkiv0rGQ5EZYbcfVy4yOprWaRQnq3O6kE452yHPYlNc8
	 D+/dAzyOuUxmIfoO9vNRzssuHnSpoPeiMC8pXS7h6zJuGWmMP2N9TRSHCcnYCN9kQPwsP
	 pF3/Rdzq6bEDo99e6dmIaciNlEKEeJFDzeDZQbmF80V8HjITUQi2v8zD2YEZp0zScg7ve
	 kWaqOhnLSaVTGO6UcLDzsszAZbkJeOAoCIApAJoujRFujpE+U4It49GTWCtZLtyazFw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795761532;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=bbE02Lb11+jV9iJrHznKia7N+kqOq23MgF6haH8bFi8=;
	b=GepSANQX7tnbKJ/5C9xJIKGUGFIhSxZngAoAy4e49V5T67/4PSq/vRR18p0InnoLUViZ
	 TP8Jp7z5FQmZsjj3FJQgIGFCLe3YSGWrb/2pRXQ6hvzooEKT901oMcumWIe5zpaq78tbe
	 hCGCzCvezJVGa+mYPESmeOPMB18TkJwt0ZUdPCaxWSyBXIXRC5HnMPqDwVdITrglDoOfD
	 J+/PRKB/HYl2bdIrQHFgT2jxAr0ASO44RWZ0Bc+sOK8IXheQR3a05G31k2a4+tCZvnnjP
	 S9cYFGbzQp8hbSA4FX/1ZoCwZ9Rzw6yL8LhNqJtkVAWuv5JvSAfCLeYvRH0bKo9pjXQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id AC7101F0089B;
	Fri, 27 Nov 2026 06:38:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795761532;
	bh=bbE02Lb11+jV9iJrHznKia7N+kqOq23MgF6haH8bFi8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=XrSKkdCxx6e3N8AZqxKnA1sJ2npdrrzGtoEf84l6jMYsRUTnXah3uPJkEXtkzPniW
	 GYWLl0khSitr2JneXO5ZcdAxMcDl7l/1IKpo7Jv3UiqRXQqE0PI5ub2QXoHIfM72ii
	 gjB6nY4vFa7X/s/AIRIpQX6RrxHBotxZruh9aBZQiG20NAGCvlglc9yibJ3txLmsgn
	 0fZtGZ2yEAXXin0KuUXAgjBil45+Y8Pf0wJVjEWLzfItWsmlBL7yTcD3Abdex+ioSJ
	 cRnQTUOrUvjob0RDpfQjHG7dIDqksIjm65dQUOrCo2RqkFmnY1+gWL+jvUEo1ExoOF
	 tyXur7A5CflNA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 3DFA64B5C4;
	Fri, 27 Nov 2026 06:38:46 +0000 (UTC)
From: Igor Velkov via B4 Relay <devnull+iav.iav.lv@kernel.org>
Date: Fri, 27 Nov 2026 08:38:40 +0200
Subject: [PATCH RFC 03/10] coresight: cpu-debug: Publish the per-CPU data
 under debug_lock
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
Message-Id: <20261127-b4-coresight-cpu-debug-lockup-v1-3-69d3ad1e0fc8@iav.lv>
References: <20261127-b4-coresight-cpu-debug-lockup-v1-0-69d3ad1e0fc8@iav.lv>
In-Reply-To: <20261127-b4-coresight-cpu-debug-lockup-v1-0-69d3ad1e0fc8@iav.lv>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>, 
 Leo Yan <leo.yan@arm.com>, Andrew Morton <akpm@linux-foundation.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>, 
 Douglas Anderson <dianders@chromium.org>, Petr Mladek <pmladek@suse.com>, 
 Feng Tang <feng.tang@linux.alibaba.com>, Igor Velkov <iav@iav.lv>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2858; i=iav@iav.lv;
 h=from:subject:message-id;
 bh=ng8YC8Y3Ljza6ut1ftgTmWxS1VWe0wO1eJKzTsPgIWo=;
 b=owGbwMvMwCVmNH1q96v4SmbG02pJDNmcqoUfV0//U6O2Knptqe6+aL2KyYbsR6PPbdj+qo+tT
 3aN341THaUsDGJcDLJiiiwTDmncylhy9a+/h/kDmDmsTCBDGLg4BWAiHp6MDEeb58n2rV1wt73t
 u77kJH+XxhmKdfPzJnp6sexPFd///CPDX/F7m8+smeohYak5STtOxVTeZP3j4KV7723o2Lqywml
 JOgsA
X-Developer-Key: i=iav@iav.lv; a=openpgp;
 fpr=90C228DA68A4D5FD4F4837E03297958BEA5F7903
X-Endpoint-Received: by B4 Relay for iav@iav.lv/default with auth_id=1060
X-Original-From: Igor Velkov <iav@iav.lv>
Reply-To: iav@iav.lv
Content-Transfer-Encoding: 7bit

From: Igor Velkov <iav@iav.lv>

The probe stores the per-CPU pointer before it has read the device ID
registers, so a device that it goes on to reject is visible to the
panic notifier and to the debugfs knob in between. The knob walks the
pointers under debug_lock, but the probe and the remove path change
them outside it: a write to the knob between the store and the
pm_runtime_put() of the probe leaves the device with one runtime PM
reference too many.

Store the pointer once the device is known to be usable, and change it
only under debug_lock, which the knob holds while it takes or drops the
runtime PM references of the published devices.

Fixes: 2227b7c74634 ("coresight: add support for CPU debug module")
Signed-off-by: Igor Velkov <iav@iav.lv>
---
 drivers/hwtracing/coresight/coresight-cpu-debug.c | 22 ++++++++--------------
 1 file changed, 8 insertions(+), 14 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-cpu-debug.c b/drivers/hwtracing/coresight/coresight-cpu-debug.c
index f9e6e344ed59..c55de98100a3 100644
--- a/drivers/hwtracing/coresight/coresight-cpu-debug.c
+++ b/drivers/hwtracing/coresight/coresight-cpu-debug.c
@@ -590,30 +590,31 @@ static int __debug_probe(struct device *dev, struct resource *res)
 	drvdata->base = base;
 
 	cpus_read_lock();
-	per_cpu(debug_drvdata, drvdata->cpu) = drvdata;
 	ret = smp_call_function_single(drvdata->cpu, debug_init_arch_data,
 				       drvdata, 1);
 	cpus_read_unlock();
 
 	if (ret) {
 		dev_err(dev, "CPU%d debug arch init failed\n", drvdata->cpu);
-		goto err;
+		return ret;
 	}
 
 	if (!drvdata->edpcsr_present) {
 		dev_err(dev, "CPU%d sample-based profiling isn't implemented\n",
 			drvdata->cpu);
-		ret = -ENXIO;
-		goto err;
+		return -ENXIO;
 	}
 
 	if (!debug_count++) {
 		ret = debug_func_init();
-		if (ret)
-			goto err_func_init;
+		if (ret) {
+			debug_count--;
+			return ret;
+		}
 	}
 
 	mutex_lock(&debug_lock);
+	per_cpu(debug_drvdata, drvdata->cpu) = drvdata;
 	/* Turn off debug power domain if debugging is disabled */
 	if (!debug_enable)
 		pm_runtime_put(dev);
@@ -621,12 +622,6 @@ static int __debug_probe(struct device *dev, struct resource *res)
 
 	dev_info(dev, "Coresight debug-CPU%d initialized\n", drvdata->cpu);
 	return 0;
-
-err_func_init:
-	debug_count--;
-err:
-	per_cpu(debug_drvdata, drvdata->cpu) = NULL;
-	return ret;
 }
 
 static int debug_probe(struct amba_device *adev, const struct amba_id *id)
@@ -638,9 +633,8 @@ static void __debug_remove(struct device *dev)
 {
 	struct debug_drvdata *drvdata = dev_get_drvdata(dev);
 
-	per_cpu(debug_drvdata, drvdata->cpu) = NULL;
-
 	mutex_lock(&debug_lock);
+	per_cpu(debug_drvdata, drvdata->cpu) = NULL;
 	/* Turn off debug power domain before rmmod the module */
 	if (debug_enable)
 		pm_runtime_put(dev);

-- 
2.43.0


