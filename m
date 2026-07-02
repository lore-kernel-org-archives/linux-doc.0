Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D80C428DB54;
	Thu,  2 Jul 2026 23:01:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783033314; cv=none; b=n/KjppHAScU9oA4264DySYnXA1ddTALGySmJSoleJtYKkgLaBHdE+L6qeohcD88aUvgzFbzA+ghmaukrJYIMaSPfl+NpXbDwPpBa0Jng8RSW9zT+XD71oKtwMFXJfmnQglKVtkW2NBM0WKOd9Rzz1jr9jOJPEtRSVmlt4rDcDfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783033314; c=relaxed/simple;
	bh=vc7zLtHorRduHvMkQ0qDlCGVRUzu5bUilomtxkkGgf0=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=N6X9sKWXpULn1wc2lkYAfaCSmFRWZyAwbgJcu2VyuG1XZIaqmsjBUlq+uZCCK9AzDxheDCSDDXW7/TW/a6cHFw7gO4LPkQhIrWXGvywz1yCb/A5vHhv2bRhsP6wGO53RY03zGZG8qyYtZcgocN01VYeogWLPnydA/RzLgSeT/Y8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=URVLJy2Z; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="URVLJy2Z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CAA91F000E9;
	Thu,  2 Jul 2026 23:01:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1783033313;
	bh=ArRdQ3PAA6YKNFCjpWwE8Lbmu/1rYpWbZ9KDsz4OLK8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=URVLJy2ZI76hZRymwYnjed5vgOTYdtDdw4bVtHf3SVHJwsBApgw5BV85Q7vgWQoa5
	 X0WuUdXAPUOej3NLdRZS/E1VcSkJyltxgUZfQppgusd9FOL+Ckyip0fzdTt+jQ2upc
	 z37VCbjg8zICp22+xi0Uk2/kSfPsqJJdnIoVhFoQ=
Date: Thu, 2 Jul 2026 16:01:52 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: <wang.yaxin@zte.com.cn>
Cc: <fan.yu9@zte.com.cn>, <yang.yang29@zte.com.cn>, <corbet@lwn.net>,
 <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>,
 <xu.xin16@zte.com.cn>
Subject: Re: [PATCH 0/3 v3] delaytop: add delay max, timestamp and sorting
 for top latency analysis
Message-Id: <20260702160152.ab0a3dea97e06652cf4874ac@linux-foundation.org>
In-Reply-To: <20260702205704180NZ3cu_QF04KfBIL6vjTHL@zte.com.cn>
References: <20260702205704180NZ3cu_QF04KfBIL6vjTHL@zte.com.cn>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 2 Jul 2026 20:57:04 +0800 (CST) <wang.yaxin@zte.com.cn> wrote:

> Previously delaytop only showed average delays. This patch adds:
> 
> 1. delay_max fields to track the maximum delay value for each delay type
>    (cpu, blkio, irq, swapin, freepages, thrashing, compact, wpcopy)
>    per task.
> 
> 2. The -t/--type option displays only the specified delay type with avg/max
>    values side by side, allowing focused analysis:
>      delaytop -t cpu    # Show only CPU delay with avg/max
>      delaytop -t wpcopy # Show Copy-on-Write delay with avg/max
> 
> 3. Wall-clock timestamp when each maximum delay occurred, displayed in the
>    MAX_TIMESTAMP column when using -t/--type option. This enables:
>    - Identifying the time when a process experienced an abnormal delay max
>    - Correlating delay max across multiple processes at the same timestamp
>    - Cross-referencing with logs, traces, or other metrics at that time
> 
> 4. When using -t/--type option, tasks are sorted by maximum delay value in
>    descending order (largest delay first), enabling quick identification of
>    top N processes with highest delay spikes.

Seems useful, thanks - I'll queue this for testing.

AI review might have found a couple of things:

	https://sashiko.dev/#/patchset/20260702205704180NZ3cu_QF04KfBIL6vjTHL@zte.com.cn
