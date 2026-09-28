Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com [209.85.221.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60C9D3FB07A
	for <linux-doc@vger.kernel.org>; Mon, 28 Sep 2026 17:41:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790617322; cv=none; b=AFnHpVfK9QG1QqxdDgHOyss2h4WJww8fysxnMUrYDrVOlN73p122SaX+0oYd1G76fg2fZheNmfizNIYvyzPgechLcepsMppcz4VbpSIdrq03V3+qJKXyIuzaHJj/sr1NT07QZCGIujOpR5xxHMkfYltYEY4hVIn+uODcVKwKCJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790617322; c=relaxed/simple;
	bh=ociixwuu60tID8XiJyfQ7GPM3G87cit0sEXbMZxlYyk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=AKxQMi3ny1RgWcLvfY5psX2PP9cFf1UEdmxUtwibt6Duk72Zh9iOY5pBAdjBNeih27irlU2DZiucnFurQyYQlXor6NO0Kb9eReHpvJxhTMGviH/qlAosWHrjpGT6hjfmRAOABm4E8vNn28DtBEmwvCRlN2Kjsu7GBg4KKdlThvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--smostafa.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=LxFgw8+P; arc=none smtp.client-ip=209.85.221.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--smostafa.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="LxFgw8+P"
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-4870142fd5cso1672730f8f.0
        for <linux-doc@vger.kernel.org>; Mon, 28 Sep 2026 10:41:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790617317; x=1791222117; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+/9CJBbG35x+y3Ddsn+TP4ZxkCLdkVf/5InNQKQpJMA=;
        b=LxFgw8+PGVwCl/rtilp2YgTd+lm5bphuVLYTvSzDjbybKVBAtR2fhEieRGMaPnS9oA
         LELLGGAbOO/ZDVLsbHPGHpSi8WVQnCVNBSbZX/PLAWSWmsdCHA1PShpCO8C4GMIZcb81
         YI5q0Ua17GwIlFJ1Kir4nZxIuL71augnOZ6lDu/y4OOJaJZ96Aoj01B8h/TCNCWgl5Kc
         4q+pMl4I64HGZKjkaZQhTkF8hle61VBtzAQ4XFO6tRkijwHKolgeZtVQm5WW3rwFZ6Jd
         +cRJUiC6YvxrJYeXje1dkjROKmwKFx2aNJPtYCAsLjmd5nxaBGAIKddh6i2QcgFDqnMH
         IcNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790617317; x=1791222117;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+/9CJBbG35x+y3Ddsn+TP4ZxkCLdkVf/5InNQKQpJMA=;
        b=P4xOPCfbG/eGyfpUg2kXiyp9LSIm5P2qgVsJl9Jy/8Z0QZAagafBNDcJt7M1uAYUog
         GYZZtcAqFgCQKppFZFqEj6l7wEynGtz4UIv4EkjMCIdvaDDnzz8AiqKSB93VSTMnTnq5
         i157nmXLub2IEOG9jcFPt0yv+5J/oNU0sOLHdrwVKUeiXfEWRKRSOhqxI0QoqI3Uzyg/
         tp6dH07eBp283HfeQrlC6/tmIePaFpvuvw7+NiHgDGmu8m46Wx0AMIAYqS429S73J3Pi
         dQgoq5meWMYXil9UzI5juWnGiSJMMTE5OFfLS4ytPp53wfQW0zhHqQCS1tmvoaVN27d6
         miHQ==
X-Gm-Message-State: AFq9FYILdo9DMgJUn0C4Crj/C6j1cBdbFnr0qOhlpVLNpAn0mkBWDWOr
	BVxjia51NUsHQzouSKVk+qco9nbEc4ZihKEA3q5jitHo1Xc6udtTth1C6GoyO0IFKbYGkWpnypZ
	7lYytBI51tdn1VRqlDEz0NNZroEdnx9hbXs3/3tvCn2v/DXp+xSreXL9rJnwc547Vx2E4TB9vaP
	1hEeMjeP1gkuVdpUYWZephq3G55S65f016HzdVtXQOM4YoYXkEyyU=
X-Received: from wrck15.prod.google.com ([2002:a5d:524f:0:b0:489:bd7b:5942])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:2010:b0:488:7803:c1ef with SMTP id ffacd0b85a97d-4887db496acmr19692502f8f.48.1790617316679;
 Mon, 28 Sep 2026 10:41:56 -0700 (PDT)
Date: Mon, 28 Sep 2026 17:41:15 +0000
In-Reply-To: <20260928174122.3380703-1-smostafa@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260928174122.3380703-1-smostafa@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20260928174122.3380703-9-smostafa@google.com>
Subject: [RFC PATCH 08/15] mm: kmemleak: Don't assume the kernel stack size
From: Mostafa Saleh <smostafa@google.com>
To: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org, 
	linux-hardening@vger.kernel.org, linux-rt-devel@lists.linux.dev
Cc: corbet@lwn.net, skhan@linuxfoundation.org, rdunlap@infradead.org, 
	catalin.marinas@arm.com, will@kernel.org, mark.rutland@arm.com, 
	akpm@linux-foundation.org, urezki@gmail.com, mingo@redhat.com, 
	peterz@infradead.org, juri.lelli@redhat.com, vincent.guittot@linaro.org, 
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com, 
	mgorman@suse.de, vschneid@redhat.com, kprateek.nayak@amd.com, kees@kernel.org, 
	david@kernel.org, ljs@kernel.org, liam@infradead.org, vbabka@kernel.org, 
	rppt@kernel.org, surenb@google.com, mhocko@suse.com, gustavoars@kernel.org, 
	bigeasy@linutronix.de, clrkwllms@kernel.org, 
	Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"

kmemleak_scan_task_stacks() assumes that the kernel stack size is
THREAD_SIZE.
The allocated kernel stack size may not be THREAD_SIZE anymore, rely
on the newly introduced helpers task_stack_{low, high}()

Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 mm/kmemleak.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/kmemleak.c b/mm/kmemleak.c
index 8fa409a4f9fb..72e2c628a20b 100644
--- a/mm/kmemleak.c
+++ b/mm/kmemleak.c
@@ -1749,7 +1749,7 @@ static void kmemleak_scan_task_stacks(void)
 			void *stack = try_get_task_stack(p);
 
 			if (stack) {
-				stop = scan_block(stack, stack + THREAD_SIZE, NULL);
+				stop = scan_block(task_stack_low(p), task_stack_high(p), NULL);
 				put_task_stack(p);
 			}
 			put_task_struct(p);
-- 
2.56.0.rc1.315.gc6ed9934b7-goog

