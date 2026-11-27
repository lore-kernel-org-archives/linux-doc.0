Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795761548;
	b=Sv/0eljJKzvBQPSQutzkqFsNLnOaBcxx39fpNSah+9xMsqD4MNyYriEW99vmsMPs9pCW
	 288U35ptU3pnkW5iUfyrmHo42VvjPmjDxeM5OlXdgI9ulEbV6/7BzVQz1fanHjmcZ9ND1
	 B9t7VPbo1BgkNczlvjkZDpYP2Js5ag6rUEL4Ob8I2zA46DNbdxp5On+l04pAT3eDpR4M0
	 kyaq1Rrj/vX5zLv1AliQyYuhsE/oKaA+I5GHlokFeBkC8f5tNa03ULKpR0VnHRrzrOCjT
	 gtoD2k0bhfBfiQC09CXYGtp4FpR3wITc/BpenjU9GCC9Fi1GN9V3UILCHGC35QzEClQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795761548;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=Ey0k0S1/JKzuAfyBJyhq5DEFGO4CvOGL3Jn4vzIFLG4=;
	b=V+247k4jwaB9cDxSjQIjkGUA4JWojK98JivB/leXX4aWbhzuI32B55YREIPnp2gp5oD8
	 w+DJUy+e0QwS0+SCjKsr9sUXf6l8XXmyniefK+sozGc0w65hM+fTt90sD2E3k0sqAuwD0
	 +C2P+WXZQdZKW9/20/D1A0/Agmf/9u1w+nScFCzRvLzlMWmmTxQzGrvHMVnR2jKoqhx2m
	 Hv0TuKpdD9j3VpvTW2JQWqIkoHdI8eXGdBNj5qhhjfMe632+xvK08bZZo2qkQSgy/5zjp
	 CbVgZrAMFIecAn3K3aLzD2DT8S1QjfF8k6tvbq1Sn2TkjaU59dqLWnGBKIU5xjj9/Hg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Dg6Dd4h1;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56617606A334;
	Fri, 27 Nov 2026 06:39:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Dg6Dd4h1
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795761547;
	b=S5ilqtgBvPkEa1o7yYpBCDVO5CVlLBQ/3OZvLsI6JOKvTx8JG6kC4qLPl1xPtxwKTn4k
	 gupKopHXCikS9nUVuVu3svVxfo0f29zTZBDieaQmh2ikxfNptdDyz/jX1cPArX2Z5/v5y
	 +3Uh/uUtdOntSDQDGrREj9cf0daC8QJRcK3RVr3ZX3TIzue5cd/8gza0a4leUJLm7EBPG
	 HACY3hySEAnwQ07WlRTqFUWDGAhXMwYR9t0jjlCvGQlyOCMD3by5SyGmvUQSjt63VyiSa
	 iGi9tpCoMn5yNMjxWhdNbDWu+c+wIEVxKXUtLNqKd4yv6HlqoppJDi++GsTYhcUyfYg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795761547;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=Ey0k0S1/JKzuAfyBJyhq5DEFGO4CvOGL3Jn4vzIFLG4=;
	b=ypm7GmgyCGp4Of6UHuAJpXZCKm8HMcciJ/4erGgTrnwfDU/2gK/VzwEPIAvSiFwuBb7b
	 34T2E+fc5HaOTzKliE3aTOAIUh0uE8Go4BhLUQUF3ARknqD4xjbivxgYQZndPGEESUaui
	 w5JVc+dDG88pJaueZbB77ng0bZfob2jPjQzKQhvHm9Q1q3CVuarStdBY0N4qu+OL99mHZ
	 195ncoMYc/9mXxXONpRaQoAUBZGcPEaoW7sO4666TT2XyqXbHhrmdR++n5ROHnsF1taX2
	 /pbWpHcOCGsMSXuGHF929TYVUXwxNGcXS22TJBXQBuZYgVJ1UUj0DIJCEAHz8duZDzg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 12BB31F0089F;
	Fri, 27 Nov 2026 06:38:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795761547;
	bh=Ey0k0S1/JKzuAfyBJyhq5DEFGO4CvOGL3Jn4vzIFLG4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=Dg6Dd4h156juEu9ws0t5cBM9+1OZ3u//c+67d7uTaOvgZL2RMXL4ZZ8MJrBvQ0mpy
	 4KYWNHoAE6NjafxoJv9R0RKUufiP3vcrhU6eOYmenPXreivO6xCv6HmV4u9Ugr18Tl
	 cFBc5g2qIz/96dh/cO8R7ANUzcdCt6os1z5vY4y55MZetjTJktgOhFTR6uaNGEwe0W
	 tocE/sEQlhuaHcVqL90r1d1apjT0Zl+dt1e1rFKxVO8Z+JBRTBqLvZYybMuVsxM/SX
	 2Kxx4pEb8DMgfd3AsJUNdcXh7NHj0cMwmgmRlk9Df4P7s5fNQNH3wSxwYDm9njKdDc
	 3gCnXlROUDeIQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id A49A74B5D0;
	Fri, 27 Nov 2026 06:38:46 +0000 (UTC)
From: Igor Velkov via B4 Relay <devnull+iav.iav.lv@kernel.org>
Date: Fri, 27 Nov 2026 08:38:43 +0200
Subject: [PATCH RFC 06/10] coresight: cpu-debug: Factor out
 debug_read_pcsr()
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
Message-Id: <20261127-b4-coresight-cpu-debug-lockup-v1-6-69d3ad1e0fc8@iav.lv>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2394; i=iav@iav.lv;
 h=from:subject:message-id;
 bh=B/rYUrk8vm3PL2FWwqb3V6PtGtt/Zu19DxNEfiWFah8=;
 b=owGbwMvMwCVmNH1q96v4SmbG02pJDNmcqkVrJ4Ycf5Oj86ShcQ3bDYO+bw8ecWvqC7JMu/Xd9
 OZPgXOVHaUsDGJcDLJiiiwTDmncylhy9a+/h/kDmDmsTCBDGLg4BWAiHusYGea66U0yWqCyNXdN
 6365Z4ZXDsYzsSxQMWIQn/JscefjBfaMDAcu+x+P3q8keN+NgY3/9SFj6bU72Od5+M39ImFruNK
 /jB0A
X-Developer-Key: i=iav@iav.lv; a=openpgp;
 fpr=90C228DA68A4D5FD4F4837E03297958BEA5F7903
X-Endpoint-Received: by B4 Relay for iav@iav.lv/default with auth_id=1060
X-Original-From: Igor Velkov <iav@iav.lv>
Reply-To: iav@iav.lv
Content-Transfer-Encoding: 7bit

From: Igor Velkov <iav@iav.lv>

Move the reads of EDPCSR and of the registers it latches out of
debug_read_regs(), so that they can be reused without the EDPRCR power
request.

No functional change.

Signed-off-by: Igor Velkov <iav@iav.lv>
---
 drivers/hwtracing/coresight/coresight-cpu-debug.c | 46 ++++++++++++-----------
 1 file changed, 24 insertions(+), 22 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-cpu-debug.c b/drivers/hwtracing/coresight/coresight-cpu-debug.c
index 64b5abe33aa8..63bc4cb8df52 100644
--- a/drivers/hwtracing/coresight/coresight-cpu-debug.c
+++ b/drivers/hwtracing/coresight/coresight-cpu-debug.c
@@ -199,27 +199,8 @@ static void debug_force_cpu_powered_up(struct debug_drvdata *drvdata)
 		goto try_again;
 }
 
-static void debug_read_regs(struct debug_drvdata *drvdata)
+static void debug_read_pcsr(struct debug_drvdata *drvdata)
 {
-	u32 save_edprcr;
-
-	CS_UNLOCK(drvdata->base);
-
-	/* Unlock os lock */
-	debug_os_unlock(drvdata);
-
-	/* Save EDPRCR register */
-	save_edprcr = readl_relaxed(drvdata->base + EDPRCR);
-
-	/*
-	 * Ensure CPU power domain is enabled to let registers
-	 * are accessiable.
-	 */
-	debug_force_cpu_powered_up(drvdata);
-
-	if (!debug_access_permitted(drvdata))
-		goto out;
-
 	drvdata->edpcsr = readl_relaxed(drvdata->base + EDPCSR);
 
 	/*
@@ -230,7 +211,7 @@ static void debug_read_regs(struct debug_drvdata *drvdata)
 	 * UNKNOWN state. So directly bail out for this case.
 	 */
 	if (drvdata->edpcsr == EDPCSR_PROHIBITED)
-		goto out;
+		return;
 
 	/*
 	 * A read of the EDPCSR normally has the side-effect of
@@ -245,8 +226,29 @@ static void debug_read_regs(struct debug_drvdata *drvdata)
 
 	if (drvdata->edvidsr_present)
 		drvdata->edvidsr = readl_relaxed(drvdata->base + EDVIDSR);
+}
+
+static void debug_read_regs(struct debug_drvdata *drvdata)
+{
+	u32 save_edprcr;
+
+	CS_UNLOCK(drvdata->base);
+
+	/* Unlock os lock */
+	debug_os_unlock(drvdata);
+
+	/* Save EDPRCR register */
+	save_edprcr = readl_relaxed(drvdata->base + EDPRCR);
+
+	/*
+	 * Ensure CPU power domain is enabled to let registers
+	 * are accessiable.
+	 */
+	debug_force_cpu_powered_up(drvdata);
+
+	if (debug_access_permitted(drvdata))
+		debug_read_pcsr(drvdata);
 
-out:
 	/* Restore EDPRCR register */
 	writel_relaxed(save_edprcr, drvdata->base + EDPRCR);
 

-- 
2.43.0


