Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E53D1381E93;
	Thu,  2 Jul 2026 22:58:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783033110; cv=none; b=r7t63fvz2sWYRg64hS6Ep0Qtd9/wfbDsUlLD/x6OMNkqBG+ySIMa7uePrduhQqE14SamtcoczvMyDuj3W+Y2pagOvt57UHmIphiEzKyAqPuL+tnReTqtRUamYswQywvS4/l+NziopPSPF9It7gDN3ysOhyqEiTGH6qBYBVb+97A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783033110; c=relaxed/simple;
	bh=o1Bh4qMKOjgswOmW+xG+2i7GYqy72oG4Ttmitj6M3ec=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=OLsaFrkYVtIB9K3NOoyjZf6/1MDrjcaWo0K1ZokNYq6Rq7n6dPOiJ4IyqRt4A5Mw0BYfCAIk/WS6iPJkEeHe8JvuaRVZLHQK5C1eIrq6nQZR+m7EAhikSTcUVHHGQPTKX9+LsdciRRIsjiN9OQwF7jbBGEvvHS21bR0zddukat0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=J53RqRci; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="J53RqRci"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68AF21F000E9;
	Thu,  2 Jul 2026 22:58:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1783033108;
	bh=zYEkqdozOe/7stEmwJgP8h9MuDwD1w2BGKquiT2/0wI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=J53RqRciTuprIX6dqV9IfBUt5Q6S6eiwZ8UP7E1faSRM5HaOU4inPlYnnE2LltQhf
	 0LMKOBmTk0OO2MJI7qH2tRtwsexVAg7y4k2SnXJcE1aYVBUmdfGGUgia46z+GFwa+/
	 sLxY88crWq8zDwX4f3mQH3Wehhl2uldJPBxGShlA=
Date: Thu, 2 Jul 2026 15:58:28 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: <wang.yaxin@zte.com.cn>
Cc: <fan.yu9@zte.com.cn>, <yang.yang29@zte.com.cn>, <corbet@lwn.net>,
 <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>,
 <xu.xin16@zte.com.cn>
Subject: Re: [PATCH 1/3] delaytop: add delay max for delaytop
Message-Id: <20260702155828.3b641339840e94917c165bd6@linux-foundation.org>
In-Reply-To: <202607022058152607Y25X-YgssuvncpVNHljz@zte.com.cn>
References: <20260702205704180NZ3cu_QF04KfBIL6vjTHL@zte.com.cn>
	<202607022058152607Y25X-YgssuvncpVNHljz@zte.com.cn>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 2 Jul 2026 20:58:15 +0800 (CST) <wang.yaxin@zte.com.cn> wrote:

> From: Wang Yaxin <wang.yaxin@zte.com.cn>
> 
> Previously delaytop only showed average delays. Add delay_max fields to
> track the maximum delay value for each delay type (cpu, blkio, irq, swapin,
> freepages, thrashing, compact, wpcopy) per task.
> 
> This provides a global view of all tasks' delay spikes, which is essential
> for identifying processes that experienced brief but significant latency
> events that would be hidden by average-only metrics.
> 
> The -t/--type option displays only the specified delay type with avg/max
> values side by side, allowing focused analysis:
>   delaytop -t cpu    # Show only CPU delay with avg/max
>   delaytop -t wpcopy    # Show Copy-on-Write delay with avg/max
> 
> ...
> 
>  	total1 = *(unsigned long long *)((char *)t1 + cfg.sort_field->total_offset);

The code does this pointer operation in many places.  Is there a better
way?  Should all those `unsigned long long' fields in `struct
task_info' be in an array, something like that?


