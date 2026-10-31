Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793445050;
	b=SGey916IopYeFqsvuE8XbsvO0135BWJU8HiUqLnPO2IhM0m2y864FHTgYCfrlCxC5mAk
	 3UedB+kZ9fKdZKwoW9aop9fkFTDe1b0oigz2xG5WI9lAQTDIAFRa5CH2GTxJR5/4OM8C6
	 7URXvtgC9vkyXMJ8I1GmhLDzTfekV1mFgQi2C2W6jg+5anJWkdBuyTD28Ce/0yMISRwk3
	 Z6T+ya9rFm9kbUoEe7zfa3yDobbrrpZfr5aT7akSurB8YpysxRK/DiE5Q8sMKzNdP0fqJ
	 g7gfa1/PzAq8Ien87LYxy7W/qs3aC6lJOhiO1jmBlsyS/weFk5Pey2BVZeLGeP1x3Rg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793445050;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=8/DEyBWZeNjbIYVLMYEXjqZxeouD7j/CxCTXFjXVFWE=;
	b=iLc3DxqAZX3v4lmABltnvB9n7WLeUsOhZzxbmONcv0mz0FctzNgmbwt8zJzTxoqGBJ6V
	 ExWHl7mDqqhTKOdFeRyYOIQY05NMk72hz4gxpQtpwCZ7PN/G1l6UvzMhvB548xQ2iuOCP
	 T2C7tubuoEZlXcQfNMeRjs51S1WfEt2yzWy529gA58MIjSBPiUCTyfPaX10EiEpGhBI8B
	 +cEgnw2c77aVfv8rH7bCtEZlhUB5ofrRD4GMFUH+9VoLx4dj11DW73m4qxgR9Js3a7SGB
	 g2FvQuwVCgbm5rrfmyIumbTFfcKGQR/8DOpavy4V0fssQNf2LA7gF/+z+M2X1m0BtWA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nlvriD47;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72AA8606A31A
	for <linux-doc@vger.kernel.org>; Sat, 31 Oct 2026 11:10:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 72AA8606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nlvriD47
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a7992e2f7dso16390285e9.3
        for <linux-doc@vger.kernel.org>; Sat, 31 Oct 2026 04:10:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793445049; x=1794049849; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8/DEyBWZeNjbIYVLMYEXjqZxeouD7j/CxCTXFjXVFWE=;
        b=nlvriD47siSUj/pHhAZKx+QLV5KHM/oCUhB2Z72IcmRKuDh3jiEue41W2bEqqDFxx/
         epSfCs0ji+w96+RHDverYdlufb2BeD51SHb8d3aVAf+bP+sHMqHpLrleLcr8XhEat+Nm
         VvdLIP08AZAu/HYXHTlVeHrk2AaqHs9omZ+vtzdVJZTnqNPbFwfOqYWohu0mLNHzx5kJ
         UjaZlR+pqvdN6OFKp6OtIFKhTA/nOquQtmw59tEofdPcG/4gvVN33faezMupVGz9Vq6b
         7noxXbyB6tLXWzdp8rBQ+Uvzirz/0qTMpQojvrDhungxg0breARLZraCM2bJ7BqfbDNO
         f57Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793445049; x=1794049849;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8/DEyBWZeNjbIYVLMYEXjqZxeouD7j/CxCTXFjXVFWE=;
        b=dZ/YJOgj2ugb4X6/QERITKrc+JsOlXCqdRmQIWK9+HLntY5ij8RGtoMud2EKZs/4tc
         46Rolw0A1L2s+Ug9cexQlwFmYa8V0h1SNNKRq7OYhv0Nh6TduAMqhwpvFGXhn8Cc11Bh
         YmMlXQqnhEh2ho9oF8beXaPebAFG+G2xa2L5nqoT8pUEN68ETMoACwyDHiNVqmOUy20d
         J4WE4AqNotakYacS0DMgXsMBP/ATIOEUVJHUCGwuD5RD33N6oQx/p9/s3K32P2bt577c
         WOdYzhs2pf/K/7be4lxXoNWNp9q1oKU8uWRfIbdi0FwM6LGML26E+Fdfd32enpX7mH6N
         4nXA==
X-Forwarded-Encrypted: i=1; AKwUvBzVwVXUaSgpoqtbWnNlsJKAQZyhwJJlByGmOeiMZlEQEfrJrcunhQG1lTPNlHzl13ROZ6Yh9j/qDeU=@vger.kernel.org
X-Gm-Message-State: AFq9FYKY6c1Z7saoEa/cFPadgHoIoRaeobeLbvs6vT1XVv6ykGnHjGrQ
	DU2m07bgiw5TEINIe0XEjTVLXrqcFDJVLFwZj/sqATNAJkFjcCxf9KKT
X-Gm-Gg: AYBFou0w2OOm5BVdY+GxTDFXLXm/d0swRPwGum8d7y4/7vemgqCOKCtJvLsq/xXFL/j
	XwAAGjVwT60eL+1tIRGSq+cXJ6HY7ajpF6X2U1Hqt+ZtTwnA/bHrV7B1b6Y1BsCNSGyFrQvJdVR
	5+s3wESk6tFLngXd+VW3M+M471ftbjOp3CF5OJp3bi91lWcNHsknhfCjDO9iQCijc6iDMrL8bil
	L+73NO2GB/B2H7HUy4rKkFHsxozVshcToV0eTM6Kx2uif106P0pgdhxRv3ViTz//j0LgXOxIjR5
	kpLP5u44Znq/DrfZrdte2t/7SRczNbi47rw476CDw4brJQsXjW+OzAEBwgiIfN8M1MN4hoMdJbz
	+bX/IDCkbSCjGGH9Yyn92uyByZ17YdK934gGuh1U2tJRbYEP1j6XQuuuHO5xqUKQ+7sWKuse9yA
	olEkd8jRVEok4Su0pt/qB4W1hY+5O5kVeV3RsMs/ACc0lR5f0Kmp0oNVazFEBv3gaiRSYmDX+JG
	SsFyP9c9pfovfoLxzulhQ7J9bzT2AMd+g4CYwephQtuWjRodHxUSHg4NLlzpENlXZcUo8bhjVGE
	BP+3nYjtrELKGCKqyjcO0SspCP6f8njzi1jojrEMobNhGWZI5+/4GqhZHThAZm+h962M/+0ApqJ
	lkn+aq5S1UuTAs2kwzK5JB4JpGzlsodq1FCjG7bdrR9ZW5HsEIp5ur5jx2Xd4StQPcJVgNbmOy1
	QbQpAkZb3SavoC+stmfe/qVeYjFLPU
X-Received: by 2002:a05:600c:198c:b0:4a2:5ca:767f with SMTP id 5b1f17b1804b1-4ac151a9a36mr117500995e9.4.1793445048512;
        Sat, 31 Oct 2026 04:10:48 -0700 (PDT)
Received: from unknown748F3CBA5068 (dynamic-2a02-3100-a81d-e001-9c9b-db33-f166-0fda.310.pool.telefonica.de. [2a02:3100:a81d:e001:9c9b:db33:f166:fda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abf67aa704sm117315545e9.8.2026.10.31.04.10.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 04:10:47 -0700 (PDT)
Date: Sat, 31 Oct 2026 12:10:45 +0100
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Steven Rostedt <rostedt@goodmis.org>, 
	Thomas Gleixner <tglx@kernel.org>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Ingo Molnar <mingo@redhat.com>, 
	Andy Lutomirski <luto@kernel.org>, Frederic Weisbecker <frederic@kernel.org>, 
	"Paul E. McKenney" <paulmck@kernel.org>, Boqun Feng <boqun@kernel.org>, Waiman Long <longman@redhat.com>, 
	Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, 
	Dietmar Eggemann <dietmar.eggemann@arm.com>, Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>, K Prateek Nayak <kprateek.nayak@amd.com>, 
	Hongyan Xia <hongyan.xia@transsion.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, linux-arm-kernel@lists.infradead.org, 
	linux-trace-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev, linux-doc@vger.kernel.org, 
	llvm@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v2 03/13] sched: Split preempt-count bookkeeping from
 raw updates
Message-ID: <auXLfz6mFh_uOvRr@gmail.com>
References: <20261028033127.82193-1-kmehltretter@gmail.com>
 <20261028033127.82193-4-kmehltretter@gmail.com>
 <20261029093219.GH1779021@noisy.programming.kicks-ass.net>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261029093219.GH1779021@noisy.programming.kicks-ass.net>

On Thu, Oct 29, 2026 at 10:32:19AM +0100, Peter Zijlstra wrote:
> Urgh, so much crazy.
> 
> So WARNs in noinstr code are 'fine'. That is, they should not happen, if
> they do, bad things have happened and we need the warning out ASAP, if
> it takes the machine down, too bad. See the
> instrumentation_{begin,end}() markers in x86 asm/bug.h.
> 
> But yes, the tracing needs to go. But moving that around should not be
> this ugly and also, that will give you the opportunity to fix
> preempt_{en,dis}able_notrace(), since they currently also skip the bound
> checks.

Yes, that's a good direction.

I checked the call chain and DEBUG_LOCKS_WARN_ON() is already fine in
noinstr. arm64 just needs __always_inline on preempt_count() and
should_resched() so Clang doesn't outline them.

I will work on that.

Thanks,
Karl
