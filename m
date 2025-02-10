Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D5BC23DEBD
	for <linux-doc@vger.kernel.org>; Mon, 10 Feb 2025 15:39:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739201942; cv=none; b=P6dOd5dxkDeEP9SjmZWivQiqXx2YsrZquVEdjxa7+YoQVCWzq3GR5I9FeXwCNgIE6wHzhac0m+4K1a7k9UoGBIOQe6Jv1to78WLmyw++c27PdkW7sJGKRB7oHo1VykRV6Gtp4gPJKxUXMfy4VTwYt/olAH1F9idE6lMbGh8sd5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739201942; c=relaxed/simple;
	bh=+ZO1rTDnY2L4DK8ir1ncT8Jdms8oqofICMxDveJrpVs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Bueg7Z6lyXhgQuCMZR73C2Qul6yz+NgpMv3/ZtYHGmuUA/uVTcHtplw3WWvFmUoGSviIoHqErOOjUBM0jZOUBPXemP6GqhfxB/tzfHZv4NdSZNhm24GF9BN6R1n9ksNnULtwPsmRABeDDDz+V5TlE8cqreZKUTZQ7bSLzHvAkhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=BXGkIxo0; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="BXGkIxo0"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-ab7c501bbecso167433266b.2
        for <linux-doc@vger.kernel.org>; Mon, 10 Feb 2025 07:39:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1739201939; x=1739806739; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gn5jBDSuUTKZUT+LyUeeWJnri0H/pvMZv3ujQ1+ZSQ4=;
        b=BXGkIxo0rM3GbUtB/sfmckxDanCPt/+HRgRw/7z2B0/ehnKdJXeK0RPiU5evZAxYMl
         HRHugo3f3hcKkO8PFT6r8hYwwdLmo8RRbeJUvXEiKb6f9UiUhTbH93IWl4C2J8wHCABW
         7g8UbDnluvkRMjH/QTtadqTB6WTxq1mWTjgEXX3yX0Lo7szddUMRdLktLIbdNlTnqqG1
         GXdVdFZBVx2HiuWKizuE3ZwhitUtexGZh4Lcwnmy6vho9megLQqwjUGiBXcsZi4qajZe
         5xzpPv5U5Zfjsu63PuvTvkeWMmhYkXq8F92gWgs2d6BWnELXVXDVF9dnjwAEA/ATmVwo
         r5AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739201939; x=1739806739;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gn5jBDSuUTKZUT+LyUeeWJnri0H/pvMZv3ujQ1+ZSQ4=;
        b=F7HZRNAh29Mfyp1NiMWbHTEzvBVEipqBWrZ8yeARFAbZBgTGNzFFItY98UdF38586h
         6PDzht65y+ZUdqgHQgpMQB/3+EuH/8zVWa3sK8alA4+8PXqhVDpwCV4n9KxXAZtdXx8O
         AQ8SZbT/WdXrJYggJvGXIjujqu1lRNmYF8Mrb6S9hBg0hsmFPa3cieQ/3wjRKhg4aZmK
         l3Xe0tVc3O87OmjkbUIrKt5B0djnqjx2bLqkrV/vH1Iwq38Fk085qLB92eOvE93BptEb
         Wvw587FRCs4jXrLzOE5VcxxmPBsgfSL2cim9DsGy1uA1+NN+YCxm/lowR+Gj7qEhcf85
         oYjw==
X-Forwarded-Encrypted: i=1; AJvYcCVfhyd5ZF5ymS4XRqQbrclGgZefW6oZ9TKMN9Ca4Pm68+3COq8c+oddn+3w07ajt6WKd3m+hliPPUs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxcPPECGLCNm5dKReim8gBv2VUvIaejcbhM3nDdHbAqPtxgd9Yy
	Z2J7DsQQnaOX/e+M4l15+1CjUItHRAleIwRvYTgXyX5iK/bEELuZSLDBZwu1eyQ=
X-Gm-Gg: ASbGncuP/mhrN535Gn46oZqLtPIIZ2rfvsnVF4kZY1I4CMMYgNd1MqQOq6gUS8ZkgBN
	f+NZoEcbWRsRZX62/Ga8UBi0wz4PHqijiqa6MMjbcztoPd5Nq1UVEOrB1a92IH4k+8P8QDMnW8M
	pG9I99PP+DGijHMA5ouSSqzkYJSl9plsSAse+e6F8nLMszZVN71jKG29pQhkSo3dw8vd5QwYrOT
	2g7jIGpTCqQgLoR7v1Y+344shgLEEhLwszGz8vuH/zxAMpKQeb4LryO0VbReI2gPplRgR7AitW7
	lk33rc9Cd6a6xH06Tw==
X-Google-Smtp-Source: AGHT+IEkhOZI/bjOnubCCDmribYUDcUAGpriYeg1lXWJzTqKc4+MCipChQCFc1nZQcDkz7yfY286uQ==
X-Received: by 2002:a17:907:9627:b0:ab7:5c95:3a82 with SMTP id a640c23a62f3a-ab789a6b63bmr1317004266b.1.1739201938875;
        Mon, 10 Feb 2025 07:38:58 -0800 (PST)
Received: from blackdock.suse.cz ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab7bb9cc86fsm294087066b.140.2025.02.10.07.38.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 07:38:58 -0800 (PST)
Date: Mon, 10 Feb 2025 16:38:56 +0100
From: Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>
To: Abel Wu <wuyun.abel@bytedance.com>
Cc: Tejun Heo <tj@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>, 
	Jonathan Corbet <corbet@lwn.net>, Ingo Molnar <mingo@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>, 
	Vincent Guittot <vincent.guittot@linaro.org>, Dietmar Eggemann <dietmar.eggemann@arm.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Yury Norov <yury.norov@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Bitao Hu <yaoma@linux.alibaba.com>, Chen Ridong <chenridong@huawei.com>, 
	"open list:CONTROL GROUP (CGROUP)" <cgroups@vger.kernel.org>, "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, 
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 3/3] cgroup/rstat: Add run_delay accounting for cgroups
Message-ID: <qt3qdbvmrqtbceeogo32bw2b7v5otc3q6gfh7vgsk4vrydcgix@33hepjadeyjb>
References: <20250125052521.19487-1-wuyun.abel@bytedance.com>
 <20250125052521.19487-4-wuyun.abel@bytedance.com>
 <3wqaz6jb74i2cdtvkv4isvhapiiqukyicuol76s66xwixlaz3c@qr6bva3wbxkx>
 <9515c474-366d-4692-91a7-a4c1a5fc18db@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9515c474-366d-4692-91a7-a4c1a5fc18db@bytedance.com>

Hello Abel (sorry for my delay).

On Wed, Jan 29, 2025 at 12:48:09PM +0800, Abel Wu <wuyun.abel@bytedance.com> wrote:
> PSI tracks stall times for each cpu, and
> 
> 	tSOME[cpu] = time(nr_delayed_tasks[cpu] != 0)
> 
> which turns nr_delayed_tasks[cpu] into boolean value, hence loses
> insight into how severely this task group is stalled on this cpu.

Thanks for example. So the lost information is kind of a group load.
What meaning it has when there is no group throttling?

Honestly, I can't reason neither about PSI.some nor Σ run_delay wrt
feedback for resource control. What it is slightly bugging me is
introduction of another stats field before first one was explored :-)

But if there's information loss with PSI -- could cpu.pressure:some be
removed in favor of Σ run_delay? (The former could be calculated from
latter if you're right :-p)

(I didn't like the before/after shuffling with enum cpu_usage_stat
NR_STATS but I saw v4 where you tackled that.)

Michal


More context form previous message, the difference is between a) and c),
or better equal lanes:

a')
   t1 |----|
   t2 |xx--|
   t3 |----|

c)
   t1 |----|
   t2 |xx--|
   t3 |xx--|

      <-Δt->

run_delay can be calculated indepently of cpu.pressure:some
because there is still difference between a') and c) in terms of total
cpu usage.

	Δrun_delay = nr * Δt - Δusage

The challenge is with nr (assuming they're all runnable during Δt), that
would need to be sampled from /sys/kernel/debug/sched/debug. But then
you can get whatever load for individual cfs_rqs from there. Hm, does it
even make sense to add up run_delays from different CPUs?
