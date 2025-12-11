Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73CEF2BDC23
	for <linux-doc@vger.kernel.org>; Thu, 11 Dec 2025 23:42:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765496560; cv=none; b=pwJOdiNCXy1EdvgjUx30/b3bLrsBSyCI9wVKjBMkrVxhxifFA4djtaY19SV6Rw2VbQNa4qSTOFurdAUK7YP2d5EEjcCrnu9ANe2hArkwKrNIn3iLugzfDA5ZEZwljZAO96FZO4/DBlkqBHGgbg3nsK7W3wLnXz4RtK3haE8fS9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765496560; c=relaxed/simple;
	bh=sglNQh1IEMOuPCNbE6JT2hakrSDVg7baBSDkcYQohgY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=e9OKn//YTMAW+jQx1bWLhvz7EoD9iT++PaETFwFgXUvStPOFNRpk5AMd6DiUW8ZGiAAg4NLcb7qxO7pxQGoXKELl/3GyBZdXFNOK9rvx3fK4RiaWFT5fUWt+fDz5sW9Rj19j+UgFduyDi8zPjv509ma3GPIAxmoJXWg5LDaPj3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=J/qiu/cU; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=mlWoYlvW; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="J/qiu/cU";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="mlWoYlvW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1765496557;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LJQf3y7sT3rIO68RkbG9xjzhHjwbGfQC0BxQ2iZ2WjQ=;
	b=J/qiu/cUmlJbQyc1svWwIe5ngY1QE44JHSYahDVSKoB2EByyzhKsmn/jI2+14w+MNWXFmL
	sbD+6F1/+Vuq+bTG7WMg/RLT/WfZ1ypJunSz7s9d6EKajvfJkA0lHMxR4gOz2niNdtR2F1
	vau2LDFIJux8EjXjqp6VR27uPnPk5fc=
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-316-8OEEX3czNMOM2Jw3xghEnQ-1; Thu, 11 Dec 2025 18:42:36 -0500
X-MC-Unique: 8OEEX3czNMOM2Jw3xghEnQ-1
X-Mimecast-MFC-AGG-ID: 8OEEX3czNMOM2Jw3xghEnQ_1765496555
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-29f177f4d02so7459385ad.2
        for <linux-doc@vger.kernel.org>; Thu, 11 Dec 2025 15:42:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1765496555; x=1766101355; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LJQf3y7sT3rIO68RkbG9xjzhHjwbGfQC0BxQ2iZ2WjQ=;
        b=mlWoYlvWcHj7Vhyjm+ACtUffK5/8KCuRjP3fCsF8bH4UkEWtSPaqLlab0/4wLMETws
         F1Vbuf25bVR2v6w4Pc/eJlgrx0tM2DsdtEL0TQ+SklJEQ9KZTAcbLmLUjfQZ68qF7SWg
         XvDd0+EZprPp3c2cXVk5e/AYiZKaJ1JtvF2C6S1SAGlSNnOuIcQjMhOxl1i95GquJFoU
         axpdPP8D9ltr+EJnbDXyQ0l2U8C/WPRhwJ6aQIOcRmOW58FL5i2L0oAG3Xai7Iqnahwx
         hG7jX9X9Mw01hUcBNSxzZCxxtO/ltVyq1mtyotODNM6kkBkuqHhyNQRM3e/7w0IlAXn3
         t+Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765496555; x=1766101355;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LJQf3y7sT3rIO68RkbG9xjzhHjwbGfQC0BxQ2iZ2WjQ=;
        b=NhrEzPVim+eO7yX4536VCGxHphHG6muZViV6FUosrk16BL69WvB44vM92YJrRK8w6/
         VZ2brZUOSHJa9cDIxvT9gGKZe5M8l/JSmsDjmD3IBGxb9OcKaX33kkR35VoUyrzD4t6S
         XVZrkM5httPc2Zx+af1BYAt5Y9ze7MOF6dPTuk9xciPXDnvOAixvu10nrDdN2y4Oza1c
         mol0nhLClRUscGLuUua5ZNcdtxRHiaTK+M6brTQMQebS8xiNUAepaMPTwX5Faywd27VM
         NzROwZGIbjynjR2to6osjirhScbBWycgIiX/+DDLuAsWRBY1OcsNPxsldr9asXiTCtpQ
         zaXQ==
X-Gm-Message-State: AOJu0YypZJzi5F/skjsi+hBAga1quzjoJgY8RSIicTS7c7Zxw4VmF5nJ
	TOAUBFywoGtAi7zaigOe+ZgOV9zAtMEOIP8RuXlGy97ESvlT0dfv9UFoXHXgqZsG1dqc8lT6OOY
	M2o83sHfIarApmdzSNFM8gXiv70ZIqLJvjKBP12MftduC2Z1NkSx3+2l2Qoeynw==
X-Gm-Gg: AY/fxX5WhpX/zi1ZQk+ZyBgpzWNxClc4Ro5OhI5PPmekGIAwGYjEwiz5hUxFkyBTaae
	1KGSX/s3z9RbQpttYd1jwmTXklJgvQI0KKWepxC1jJGZQE2Sv6w1PJf/0jE1b9QskeMQDUIL/S8
	fD339LtO9zNd9vjOL0QXTsrE+0NbD46tlUBBZpAfwIcF6y6hSCzhP6wbhgm0ceF/z5Vc2tfCY1a
	hntuQ2Vw09ZUqzz9RAXN6zbnreIOYqDATnxxU6gkmBrgbU22fhDT3d+gW5cc4mCeFJAFDlxCaHw
	r0oXARqGjnh3FWFRoZ6nv3NdIjveETv86ZrI+7gP91lIGkIaIfW7yFg90S5l65aAmXTqDW18Hmi
	J4fQzQUGp8kkhBwckQ5b0jiIrX4561QZy+2Ue4o4sWab16ZRpvNUYYg==
X-Received: by 2002:a05:701b:2908:b0:119:e569:f27d with SMTP id a92af1059eb24-11f34c1ba55mr141783c88.38.1765496555001;
        Thu, 11 Dec 2025 15:42:35 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEfb+9VPFudEYOvvh4a4bAbcoWvrbRK4+EeDnsw7jslcN+LTmASF1ou6fb8Ojfy9YSNGfElDQ==
X-Received: by 2002:a05:701b:2908:b0:119:e569:f27d with SMTP id a92af1059eb24-11f34c1ba55mr141768c88.38.1765496554506;
        Thu, 11 Dec 2025 15:42:34 -0800 (PST)
Received: from [192.168.101.129] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11f2e304766sm12034395c88.13.2025.12.11.15.42.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Dec 2025 15:42:33 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Date: Fri, 12 Dec 2025 08:41:41 +0900
Subject: [PATCH 2/3] clk: composite: convert from round_rate() to
 determine_rate()
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251212-clk-remove-round-rate-v1-2-5c3d5f3edc78@redhat.com>
References: <20251212-clk-remove-round-rate-v1-0-5c3d5f3edc78@redhat.com>
In-Reply-To: <20251212-clk-remove-round-rate-v1-0-5c3d5f3edc78@redhat.com>
To: Jonathan Corbet <corbet@lwn.net>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2935; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=sglNQh1IEMOuPCNbE6JT2hakrSDVg7baBSDkcYQohgY=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDKtw27u5PuwR8dCe+XOf8e/3T90nVF2xtQj8o7GLiwZP
 45eVajf3lHKwiDGxSArpsiyJNeoICJ1le29O5osMHNYmUCGMHBxCsBEitsY/pmbfjvPe/DN8uvh
 25Zu2/27UlpoQXHPFsFfr8JMbY98iClj+F/y8tmyVw8Dn2zZoNB3Wpi756L+r/cmilEK6c98ZG3
 /57MDAA==
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

The round_rate() clk ops is deprecated and going away, so migrate
this driver from round_rate() to determine_rate().

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/clk/clk-composite.c | 38 +++++---------------------------------
 1 file changed, 5 insertions(+), 33 deletions(-)

diff --git a/drivers/clk/clk-composite.c b/drivers/clk/clk-composite.c
index 66759fe28fad67f98b6c723ce70849490a022e26..0d96d46712b7258cf23d7b3768a5e75690e2c9d9 100644
--- a/drivers/clk/clk-composite.c
+++ b/drivers/clk/clk-composite.c
@@ -47,22 +47,10 @@ static int clk_composite_determine_rate_for_parent(struct clk_hw *rate_hw,
 						   struct clk_hw *parent_hw,
 						   const struct clk_ops *rate_ops)
 {
-	long rate;
-
 	req->best_parent_hw = parent_hw;
 	req->best_parent_rate = clk_hw_get_rate(parent_hw);
 
-	if (rate_ops->determine_rate)
-		return rate_ops->determine_rate(rate_hw, req);
-
-	rate = rate_ops->round_rate(rate_hw, req->rate,
-				    &req->best_parent_rate);
-	if (rate < 0)
-		return rate;
-
-	req->rate = rate;
-
-	return 0;
+	return rate_ops->determine_rate(rate_hw, req);
 }
 
 static int clk_composite_determine_rate(struct clk_hw *hw,
@@ -79,8 +67,7 @@ static int clk_composite_determine_rate(struct clk_hw *hw,
 	unsigned long best_rate = 0;
 	int i, ret;
 
-	if (rate_hw && rate_ops &&
-	    (rate_ops->determine_rate || rate_ops->round_rate) &&
+	if (rate_hw && rate_ops && rate_ops->determine_rate &&
 	    mux_hw && mux_ops && mux_ops->set_parent) {
 		req->best_parent_hw = NULL;
 
@@ -150,18 +137,6 @@ static int clk_composite_determine_rate(struct clk_hw *hw,
 	}
 }
 
-static long clk_composite_round_rate(struct clk_hw *hw, unsigned long rate,
-				  unsigned long *prate)
-{
-	struct clk_composite *composite = to_clk_composite(hw);
-	const struct clk_ops *rate_ops = composite->rate_ops;
-	struct clk_hw *rate_hw = composite->rate_hw;
-
-	__clk_hw_set_clk(rate_hw, hw);
-
-	return rate_ops->round_rate(rate_hw, rate, prate);
-}
-
 static int clk_composite_set_rate(struct clk_hw *hw, unsigned long rate,
 			       unsigned long parent_rate)
 {
@@ -288,17 +263,14 @@ static struct clk_hw *__clk_hw_register_composite(struct device *dev,
 		if (rate_ops->determine_rate)
 			clk_composite_ops->determine_rate =
 				clk_composite_determine_rate;
-		else if (rate_ops->round_rate)
-			clk_composite_ops->round_rate =
-				clk_composite_round_rate;
 
-		/* .set_rate requires either .round_rate or .determine_rate */
+		/* .set_rate requires .determine_rate */
 		if (rate_ops->set_rate) {
-			if (rate_ops->determine_rate || rate_ops->round_rate)
+			if (rate_ops->determine_rate)
 				clk_composite_ops->set_rate =
 						clk_composite_set_rate;
 			else
-				WARN(1, "%s: missing round_rate op is required\n",
+				WARN(1, "%s: missing determine_rate op is required\n",
 						__func__);
 		}
 

-- 
2.52.0

