Received: from mail-oa2-f12.google.com (mail-oa2-f12.google.com [74.125.231.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6760649BD75
	for <linux-doc@vger.kernel.org>; Thu, 10 Sep 2026 13:46:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789048011; cv=none; b=iCtfDuHlonMcOYiBLqnWVz59L+gsyZJDmBOppCV4tjmKwhDIy8E5h5xh+lJK34M0syFAkjNScj9CLn7+ZqQcLM6OoG0QOiYUvMRw2mHHwatoOSant/a5rlyaC5ZbVxABwqIZZSifUYde8vNGzbUbLvkf0h1dcIi+ExVjfUYF8yU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789048011; c=relaxed/simple;
	bh=UXHuXOhFDKFisF/9OmmcTV6G79e9pR0bjsa1Y/uydpw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QzUWfLKoMiVzd+C6ADIqMYwZ8hfmY5yFwr4+ttGbLBRytaVJDOurP7KHzTuD5dyTFFpY24Eoe5MVPC+1iVvXOJ2F+ys26iQMo4aBgtBN0t6H4Q6KRHvWLCZ9Z4hUlxOQjtNyQmxEnY2vc1ZO55dDNvSLJ1AnGnURSK7SwNrTp40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iSDi2czV; arc=none smtp.client-ip=74.125.231.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iSDi2czV"
Received: by mail-oa2-f12.google.com with SMTP id 586e51a60fabf-466cc9ab667so1609170fac.0
        for <linux-doc@vger.kernel.org>; Thu, 10 Sep 2026 06:46:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789048008; x=1789652808; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5ugE+BUq8sDK0fNpwmpU6SEIFPEB70ZUCPnwQzu3hcY=;
        b=iSDi2czVrhGIJfpOLi0nmBaNgKP9pAmmMnWokn004OUVwM+Q7YpR/czFVjGO1ufWPV
         8ZekuZaZXBfAWhgBIOu3kJ4NojyD+H/XAdq4pRgtZlqLoEsFDuRkMZQzPhO/NwvjhlPN
         VVp0161wKj4VqvlJvEsbPKpW7cNpr/Gd7PW60bOzcl0Q/z5YDV+Hecqs8H5hG5GBVwes
         fI1ai45ja7HqOe8+pXL3RBvntZx49oLm9BS4JfCNUE6FA/Fum5mBLJNBXu1lRzxDH0H4
         BF+2WNB8ToN/ELp7TDZZttE0rxMjnKgRegy5VzfFIK2cW8OgXv9gzLgiP5cMASq3CjrA
         3JtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789048008; x=1789652808;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5ugE+BUq8sDK0fNpwmpU6SEIFPEB70ZUCPnwQzu3hcY=;
        b=GL9mRpDygWvbo5xnybyyDSSr97SjsHNygtzgRELtme70UWXs7dhlf9k6sr7xs9WE6C
         VupZ9mVG0ZFGw3FOXtN4wE5jgHki54+PcXKqBUvesI6oUb8frZ01orFPNx6OcXxV9QQB
         l3lyM8N6Tr/+tExYLsMHosMogng4GCuOrl+cMAOC1NV4jUrVbxa9xVDnkShL2PdGrhJF
         mD+DvgLNba884p+4oVhoLnN0OLgtGOoNw+UQjmLXZPU8vtkk2hx6/8wNMxIrstjj0m+F
         vl0TsOz3jBFK2/cEMLLIgH3OA55X6shA/izaaT2mGT/WDIhAvDlaAfOqTRrMGBtXSmS4
         rTWQ==
X-Forwarded-Encrypted: i=1; AKwUvByfjTfdZU0OfoloCAe9i3fL6dk3QThhGKYpM0OQd719tvXhbF7auFwU4RSO2gFa9YS6oA6NH5FRsoM=@vger.kernel.org
X-Gm-Message-State: AFuF++kVRJ9JhQVvvt1ZxWD3tj7HfweL/hp4fQ7vlSJ0DK5OrK0F9JGV
	1bMTfsNxQSBSWGmDL5UOh+g+ee3DiEb/HnOXREivg6Zav1Fgg405v7ct
X-Gm-Gg: AYBFou1s+OwxuXj3qVWoUPLiEa5zVdJJhXZbfc7dxxHD0LIpwqx82vIwLA31fjYrsql
	sbUEb2ySTaFLmBZ26SAIBP2Yo8nU8HsdFoqKt2uFIRlOaz5a5Ga3F0ImsoXl4ZedEJdr0I6tULM
	GgiJ2nqwMfRspcW2SFed5rUpWEjMAw+y0cB3AVHNQMgFZwaXI4RZpmkMz9O0ofNCTUoPvQ6pDBS
	tgf3LJleDU/mQtlXyEaRC+7ME5NLN8zePm7II3NIvpcrr7EJceK9+X8R0lrK2S4ty0iptT4suG5
	Vevm9d4cMb/OSzI9Q9WShiwyp+zW4EXku+vZusQBGGvADxMB1hzFfN3s7WLMJL/9JIUIwVgEoLX
	is8hObnHIABwleQcw4YYArSWND2wUn7f+6/9n4yZqVTeGBFMd87q4pcUQ01S/0o381ff3kLZX9Z
	PKgQqTdYObXYTVkvZfxGBQRBGbBjWNQ/cvcv9eQrcImIolqWqFdN8PMLahxJ7TmNC45Yj3CuxWm
	RjwO1vE50o8MEZRxNtc5q5PBRfNeKyYQ0o5gl6vCA4cI9ToxnQcki1q00M2+55mPl9IjlDCwUah
	xx/UeHsc+Mqkrd0UHuryL04IqL8VciiWc3QSBpRQCJEdQQXJT1OGiLrB6AyMuZg=
X-Received: by 2002:a05:6870:d408:b0:475:a153:2dce with SMTP id 586e51a60fabf-47c5239a143mr4735595fac.36.1789048007972;
        Thu, 10 Sep 2026 06:46:47 -0700 (PDT)
Received: from spider.bream-herring.ts.net ([103.252.203.158])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4760cec8679sm15256534fac.5.2026.09.10.06.46.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 06:46:47 -0700 (PDT)
From: Matthias Goergens <matthias.goergens@gmail.com>
To: Harry Yoo <harry@kernel.org>
Cc: Matthias Goergens <matthias.goergens@gmail.com>,
	paulmck@kernel.org,
	frederic@kernel.org,
	neeraj.upadhyay@kernel.org,
	joelagnelf@nvidia.com,
	josh@joshtriplett.org,
	boqun@kernel.org,
	urezki@gmail.com,
	rostedt@goodmis.org,
	mathieu.desnoyers@efficios.com,
	jiangshanlai@gmail.com,
	qiang.zhang@linux.dev,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	surenb@google.com,
	vbabka@kernel.org,
	rcu@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] rcu: drain kfree_rcu sheaves from the userspace barrier hook
Date: Thu, 10 Sep 2026 21:46:40 +0800
Message-ID: <20260910134640.2044424-1-matthias.goergens@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <aqKZXmlRGsmJPl3r@thinkstation>
References: <20260910101112.1648978-1-matthias.goergens@gmail.com> <20260910101112.1648978-2-matthias.goergens@gmail.com> <aqKZXmlRGsmJPl3r@thinkstation>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Thanks. I ran into this while testing bcachefs performance changes. The bcachefs ktest end checks write `do_rcu_barrier` before reading `/proc/allocinfo`, with the expectation that allocations still reported afterwards are leaks. Small objects released with `kfree_rcu()` remained visible after repeated writes to the hook and 20 seconds of waiting, so otherwise clean tests failed their leak check.

Strictly, that ktest is assuming a stronger contract than the hook currently documents: `do_rcu_barrier` promises an ordinary `rcu_barrier()`, not a complete drain of objects still held in `kfree_rcu()` batching. I nevertheless think the stronger behaviour is useful for this test-only quiescence hook, because it lets allocation-leak checks reliably separate deferred frees from genuine leaks.

I followed those allocations across repeated filesystem lifecycles. Their number eventually fell when an RCU sheaf filled, so I have no evidence that this path grows without bound or causes OOM. The problem I observed is limited to test isolation: the hook can leave deferred frees behind and make them look like leaks. With the proposed change, the same unmodified bcachefs workload passed the leak check.

After tracing that behaviour, I wrote the private-cache module in the cover letter to reproduce it without bcachefs. I can publish the original bcachefs workload and results if anyone is interested.

I also found that this exact follow-on was discussed when `kvfree_rcu_barrier()` was added in 2024: Paul proposed calling it from `rcu_barrier_throttled()` for clean userspace benchmark baselines, and Uladzislau agreed that adding it and documenting both operations was safest: https://lore.kernel.org/all/20240820155935.1167988-1-urezki@gmail.com/

You are right about the `Fixes:` tag. `kvfree_rcu()` batching predates `do_rcu_barrier`, and the existing interface does what it documents, so the later sheaf commit is not the right introduction point. I will omit the `Fixes:` tag in v2 and present this as a strengthening of the test interface.

-- 
Matthias
