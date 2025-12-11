Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A376127B4E1
	for <linux-doc@vger.kernel.org>; Thu, 11 Dec 2025 23:42:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765496568; cv=none; b=jaAPhFwa8R8IctDXQxiiRiINCBRk8/BG7EMqh9dvsBkS+/2v63szc18Roty0WMgb0iz+ocvcJKk4g4naZjo62rKsnmydWt6Tn5NA2HEOAonLxoJJ0LWqlo7KNrMD9F5kDnvsYefxAdhLd97LXPo7Vywnjz+bwI5gsP1toG/uFOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765496568; c=relaxed/simple;
	bh=Ih9wCYsTB/Pc16jR/dvvroC+fpz/z+qOgLubxgOuVK4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cFbXigUh93Q6vcScS3JKfjwIGcbYUN33auzl2aXExf7rzHs17cmO3+JLS8q45LVbBWItRADax2pihEEu1jk8jMuplI4XPiBvLys2ufPqgeOvkKYEYYLW6nhi89EgM+vYPiqY/u+mnuit4TFhhP/Qs/2VQYJT8+Cs7m5jjelWXME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=OxVMJOh4; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=B70Ei6Fm; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="OxVMJOh4";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="B70Ei6Fm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1765496565;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9GKBhFvbcI606yEMZFba/2jQl9vAZ7vYvocubB3FnYQ=;
	b=OxVMJOh46Lsp8YlVLvO5xzcAP2gzu+s07BnjPTcS60WB/qp5tNzd4NQrmQP5Kbdk86JzCc
	j6teezsIC2VPg39mdKOGPXbCZny8SjOlbDyNJidJz7DpXyxQCX5luohwvP3/xUDeJZdF+K
	fXmOUCgGtq8trgSEJcMR1BS8fIAiJN8=
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-31-SNTIw-75M1-SI0fgPzzKMQ-1; Thu, 11 Dec 2025 18:42:44 -0500
X-MC-Unique: SNTIw-75M1-SI0fgPzzKMQ-1
X-Mimecast-MFC-AGG-ID: SNTIw-75M1-SI0fgPzzKMQ_1765496563
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-7c240728e2aso1143364b3a.3
        for <linux-doc@vger.kernel.org>; Thu, 11 Dec 2025 15:42:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1765496561; x=1766101361; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9GKBhFvbcI606yEMZFba/2jQl9vAZ7vYvocubB3FnYQ=;
        b=B70Ei6Fm7fH3mA+3s2L68atazaCdX2CmMVcIFUkYQxJBsS5W3tgsVkVH9aa5fJsJ2k
         Kn6XiTn5sUFYViaeDQSnZVTCwNeOZKj4jHTHyPSreO2NSnKDeoQbNyixvO7THwwAsjTS
         9kDa62yRJFa7fbpK0bmr7RtXTRvihOQftC+zR6p7Tbzvcd9k/ECX+Dee1Ym9eg+xslFQ
         FnURSVsJZNr6Utb1LudSDo/u/WKSKINgKLjsD0GuoL/2UnDf6R50Mj0uQm34AJ5OY6zM
         RgPHhDM6eEVY5na4+QUJOLYJWOKSXe9exilhTztycXo0slZ2kpKYtTwWeVHvYcsyPztd
         hYjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765496561; x=1766101361;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9GKBhFvbcI606yEMZFba/2jQl9vAZ7vYvocubB3FnYQ=;
        b=MaVHbCXlhl6xsT1tcd3V1NlOJeIHTb+0d3HvL2e4/gLQCVgz//jpZkUI2Bs+jhqLhs
         qcrJ3OrNzBu1adbOUVWP79rRsusQUq3SccSNoZulI4u5fFIVzo41oOxZdwhCTTGHO5zk
         G1+z5l8j5S2bAj7Gdz/GxKe6Fpun0pBlk3ZpyTX1tZb7shgFkqPuRUTTcjE7aEfDru4W
         qeAUMvWQ4dW6dnZqy77AFvRAfDr7TvJtEog6+UeWc1cOk33wTvHJHU4Zu36wjBvf7cP3
         7rngT47LXUsO3w/bykVL9hx2As2xtKKSoRyfKt+8JakVFVrjNboLdDTOM6jFg+CpTygd
         /1Fg==
X-Gm-Message-State: AOJu0Yztw6zlFecIjZViYXAJwGqPsKu70PvmhoiqfzUTV/bke57/VXiC
	JnCpTf418mYXpRlYaqlFuI+rTo3ckXJN1AOk+zIsz9YIpC6c7X+C6GBdbKP6sJHLTgm4SzU5UbT
	aPaNblImaDZ6lrDn7eKohfMFrYfi+5NQdiT5LJOLW3mvIUbEOlsDmkL9ydcOFBA==
X-Gm-Gg: AY/fxX406jG757VE1vCJInPsMJSWnMmjLaDM/OtuJTdXeiSk+KsYTSpmXzXHLYhAwK/
	R5+0tuOtpCnA1x3IIaBptjTtLMBSmcaE2Z6z9M5Su44Y74MGX8OUPSl7tFRcFmD1w0YjOjkNvLP
	VHi+5FRkjab/PJzexX1pIjRyhmucc/CMl8CLUlMnJct582NgTFO7jfhYLpo0rNXCJkOimPSxrbX
	z+4RPi8Dvla+xoxPhAbPiBqUoDU8yRHskjrWQa9L7h4BBX0NdMyQmI2ZrxltPdcwoOtyodjHelY
	wJi9AcPF2TQgyp/ADvPsq141yX1Js1y91HGoMEQzyLS4KMv74UDQpHuqr2to+Fim3Z9bqo7Zdu9
	vHFukzDscHzLaYoPxx5QfDnrvhYj9DJ0mB9IRwKQyenaiTI2n16gk8Q==
X-Received: by 2002:a05:701b:2506:b0:11d:fc72:e17f with SMTP id a92af1059eb24-11f34beb468mr201991c88.18.1765496560938;
        Thu, 11 Dec 2025 15:42:40 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFWbTPegde3SJDmD39k4dPTKiQGShCracrJjHPeU7HNhRaJrE3woOQLP4+L53eZ4gYKS4klhg==
X-Received: by 2002:a05:701b:2506:b0:11d:fc72:e17f with SMTP id a92af1059eb24-11f34beb468mr201967c88.18.1765496560381;
        Thu, 11 Dec 2025 15:42:40 -0800 (PST)
Received: from [192.168.101.129] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11f2e304766sm12034395c88.13.2025.12.11.15.42.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Dec 2025 15:42:39 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Date: Fri, 12 Dec 2025 08:41:42 +0900
Subject: [PATCH 3/3] clk: remove round_rate() clk ops
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251212-clk-remove-round-rate-v1-3-5c3d5f3edc78@redhat.com>
References: <20251212-clk-remove-round-rate-v1-0-5c3d5f3edc78@redhat.com>
In-Reply-To: <20251212-clk-remove-round-rate-v1-0-5c3d5f3edc78@redhat.com>
To: Jonathan Corbet <corbet@lwn.net>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=10244; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=Ih9wCYsTB/Pc16jR/dvvroC+fpz/z+qOgLubxgOuVK4=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDKtw26uX7v3+D+RF9pMVQ/rA/Pfqj17+my/mFzTzKZpy
 wQCH71521HKwiDGxSArpsiyJNeoICJ1le29O5osMHNYmUCGMHBxCsBEgj0ZGfb5Kvbr9G6vM12x
 p7p859THe38GS6Y/dmf5xyx4VHFx4V9GhltBGhFnb8znf72k9u/MzwGF/strO3l2+gcdcLnL8/e
 LAycA
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

The round_rate() clk ops is deprecated, and all in tree drivers have
been converted, so let's go ahead and remove any references to the
round_rate() clk ops.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 Documentation/driver-api/clk.rst |  9 +--------
 drivers/clk/clk.c                | 39 ++++++++++++++-------------------------
 include/linux/clk-provider.h     | 18 ++++++------------
 3 files changed, 21 insertions(+), 45 deletions(-)

diff --git a/Documentation/driver-api/clk.rst b/Documentation/driver-api/clk.rst
index 93bab5336dfda06069eea700d2830089bf3bce03..c6aca8186a7864f77c00feccd68d431303ab01b7 100644
--- a/Documentation/driver-api/clk.rst
+++ b/Documentation/driver-api/clk.rst
@@ -77,9 +77,6 @@ the operations defined in clk-provider.h::
 		void		(*disable_unused)(struct clk_hw *hw);
 		unsigned long	(*recalc_rate)(struct clk_hw *hw,
 						unsigned long parent_rate);
-		long		(*round_rate)(struct clk_hw *hw,
-						unsigned long rate,
-						unsigned long *parent_rate);
 		int		(*determine_rate)(struct clk_hw *hw,
 						  struct clk_rate_request *req);
 		int		(*set_parent)(struct clk_hw *hw, u8 index);
@@ -220,9 +217,7 @@ optional or must be evaluated on a case-by-case basis.
    +----------------+------+-------------+---------------+-------------+------+
    |.recalc_rate    |      | y           |               |             |      |
    +----------------+------+-------------+---------------+-------------+------+
-   |.round_rate     |      | y [1]_      |               |             |      |
-   +----------------+------+-------------+---------------+-------------+------+
-   |.determine_rate |      | y [1]_      |               |             |      |
+   |.determine_rate |      | y           |               |             |      |
    +----------------+------+-------------+---------------+-------------+------+
    |.set_rate       |      | y           |               |             |      |
    +----------------+------+-------------+---------------+-------------+------+
@@ -238,8 +233,6 @@ optional or must be evaluated on a case-by-case basis.
    |.init           |      |             |               |             |      |
    +----------------+------+-------------+---------------+-------------+------+
 
-.. [1] either one of round_rate or determine_rate is required.
-
 Finally, register your clock at run-time with a hardware-specific
 registration function.  This function simply populates struct clk_foo's
 data and then passes the common struct clk parameters to the framework
diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 85d2f2481acf360f0618a4a382fb51250e9c2fc4..cab715bbe6474451776c95da7e37b24a228a233f 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -1560,8 +1560,6 @@ late_initcall_sync(clk_disable_unused);
 static int clk_core_determine_round_nolock(struct clk_core *core,
 					   struct clk_rate_request *req)
 {
-	long rate;
-
 	lockdep_assert_held(&prepare_lock);
 
 	if (!core)
@@ -1591,13 +1589,6 @@ static int clk_core_determine_round_nolock(struct clk_core *core,
 		req->rate = core->rate;
 	} else if (core->ops->determine_rate) {
 		return core->ops->determine_rate(core->hw, req);
-	} else if (core->ops->round_rate) {
-		rate = core->ops->round_rate(core->hw, req->rate,
-					     &req->best_parent_rate);
-		if (rate < 0)
-			return rate;
-
-		req->rate = rate;
 	} else {
 		return -EINVAL;
 	}
@@ -1682,7 +1673,7 @@ EXPORT_SYMBOL_GPL(clk_hw_forward_rate_request);
 
 static bool clk_core_can_round(struct clk_core * const core)
 {
-	return core->ops->determine_rate || core->ops->round_rate;
+	return core->ops->determine_rate;
 }
 
 static int clk_core_round_rate_nolock(struct clk_core *core,
@@ -1750,11 +1741,11 @@ EXPORT_SYMBOL_GPL(__clk_determine_rate);
  * use.
  *
  * Context: prepare_lock must be held.
- *          For clk providers to call from within clk_ops such as .round_rate,
+ *          For clk providers to call from within clk_ops such as
  *          .determine_rate.
  *
- * Return: returns rounded rate of hw clk if clk supports round_rate operation
- *         else returns the parent rate.
+ * Return: returns rounded rate of hw clk if clk supports determine_rate
+ *         operation; else returns the parent rate.
  */
 unsigned long clk_hw_round_rate(struct clk_hw *hw, unsigned long rate)
 {
@@ -2569,12 +2560,13 @@ static int clk_core_set_rate_nolock(struct clk_core *core,
  *
  * Setting the CLK_SET_RATE_PARENT flag allows the rate change operation to
  * propagate up to clk's parent; whether or not this happens depends on the
- * outcome of clk's .round_rate implementation.  If *parent_rate is unchanged
- * after calling .round_rate then upstream parent propagation is ignored.  If
- * *parent_rate comes back with a new rate for clk's parent then we propagate
- * up to clk's parent and set its rate.  Upward propagation will continue
- * until either a clk does not support the CLK_SET_RATE_PARENT flag or
- * .round_rate stops requesting changes to clk's parent_rate.
+ * outcome of clk's .determine_rate implementation. If req->best_parent_rate
+ * is unchanged after calling .determine_rate then upstream parent propagation
+ * is ignored.  If req->best_parent_rate comes back with a new rate for clk's
+ * parent then we propagate up to clk's parent and set its rate. Upward
+ * propagation will continue until either a clk does not support the
+ * CLK_SET_RATE_PARENT flag or .determine_rate stops requesting changes to
+ * clk's parent_rate.
  *
  * Rate changes are accomplished via tree traversal that also recalculates the
  * rates for the clocks and fires off POST_RATE_CHANGE notifiers.
@@ -2703,8 +2695,6 @@ static int clk_set_rate_range_nolock(struct clk *clk,
 	 * FIXME:
 	 * There is a catch. It may fail for the usual reason (clock
 	 * broken, clock protected, etc) but also because:
-	 * - round_rate() was not favorable and fell on the wrong
-	 *   side of the boundary
 	 * - the determine_rate() callback does not really check for
 	 *   this corner case when determining the rate
 	 */
@@ -3915,10 +3905,9 @@ static int __clk_core_init(struct clk_core *core)
 	}
 
 	/* check that clk_ops are sane.  See Documentation/driver-api/clk.rst */
-	if (core->ops->set_rate &&
-	    !((core->ops->round_rate || core->ops->determine_rate) &&
-	      core->ops->recalc_rate)) {
-		pr_err("%s: %s must implement .round_rate or .determine_rate in addition to .recalc_rate\n",
+	if (core->ops->set_rate && !core->ops->determine_rate &&
+	      core->ops->recalc_rate) {
+		pr_err("%s: %s must implement .determine_rate in addition to .recalc_rate\n",
 		       __func__, core->name);
 		ret = -EINVAL;
 		goto out;
diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
index 630705a47129453c241f1b1755f2c2f2a7ed8f77..1cda2c78dffaff037f0f16b0f11106b63b3a746f 100644
--- a/include/linux/clk-provider.h
+++ b/include/linux/clk-provider.h
@@ -136,10 +136,6 @@ struct clk_duty {
  *		0. Returns the calculated rate. Optional, but recommended - if
  *		this op is not set then clock rate will be initialized to 0.
  *
- * @round_rate:	Given a target rate as input, returns the closest rate actually
- *		supported by the clock. The parent rate is an input/output
- *		parameter.
- *
  * @determine_rate: Given a target rate as input, returns the closest rate
  *		actually supported by the clock, and optionally the parent clock
  *		that should be used to provide the clock rate.
@@ -163,13 +159,13 @@ struct clk_duty {
  *
  * @set_rate:	Change the rate of this clock. The requested rate is specified
  *		by the second argument, which should typically be the return
- *		of .round_rate call.  The third argument gives the parent rate
- *		which is likely helpful for most .set_rate implementation.
+ *		of .determine_rate call.  The third argument gives the parent
+ *		rate which is likely helpful for most .set_rate implementation.
  *		Returns 0 on success, -EERROR otherwise.
  *
  * @set_rate_and_parent: Change the rate and the parent of this clock. The
  *		requested rate is specified by the second argument, which
- *		should typically be the return of .round_rate call.  The
+ *		should typically be the return of clk_round_rate() call.  The
  *		third argument gives the parent rate which is likely helpful
  *		for most .set_rate_and_parent implementation. The fourth
  *		argument gives the parent index. This callback is optional (and
@@ -244,8 +240,6 @@ struct clk_ops {
 	void		(*restore_context)(struct clk_hw *hw);
 	unsigned long	(*recalc_rate)(struct clk_hw *hw,
 					unsigned long parent_rate);
-	long		(*round_rate)(struct clk_hw *hw, unsigned long rate,
-					unsigned long *parent_rate);
 	int		(*determine_rate)(struct clk_hw *hw,
 					  struct clk_rate_request *req);
 	int		(*set_parent)(struct clk_hw *hw, u8 index);
@@ -679,7 +673,7 @@ struct clk_div_table {
  * @lock:	register lock
  *
  * Clock with an adjustable divider affecting its output frequency.  Implements
- * .recalc_rate, .set_rate and .round_rate
+ * .recalc_rate, .set_rate and .determine_rate
  *
  * @flags:
  * CLK_DIVIDER_ONE_BASED - by default the divisor is the value read from the
@@ -1126,7 +1120,7 @@ void of_fixed_factor_clk_setup(struct device_node *node);
  *
  * Clock with a fixed multiplier and divider. The output frequency is the
  * parent clock rate divided by div and multiplied by mult.
- * Implements .recalc_rate, .set_rate, .round_rate and .recalc_accuracy
+ * Implements .recalc_rate, .set_rate, .determine_rate and .recalc_accuracy
  *
  * Flags:
  * * CLK_FIXED_FACTOR_FIXED_ACCURACY - Use the value in @acc instead of the
@@ -1254,7 +1248,7 @@ void clk_hw_unregister_fractional_divider(struct clk_hw *hw);
  * @lock:	register lock
  *
  * Clock with an adjustable multiplier affecting its output frequency.
- * Implements .recalc_rate, .set_rate and .round_rate
+ * Implements .recalc_rate, .set_rate and .determine_rate
  *
  * @flags:
  * CLK_MULTIPLIER_ZERO_BYPASS - By default, the multiplier is the value read

-- 
2.52.0

