Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC9661DB12E
	for <linux-doc@vger.kernel.org>; Fri, 24 Jan 2025 10:00:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737712846; cv=none; b=qjrPxcXeAoIn6H3OPHQomIOs/5PrTSIp0cx6Sy2NRZTEjCmikbh+vuNBmr6Dm6wve5wiDAqCOYoH80R4aesO3xt/8iU97iRiEpAGNgrkSs0zFHwdC7lgor9H6yQ+++6zMeFGnetDAAnPBWxua30QaggNTmAB1dI0/K5nciaTn7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737712846; c=relaxed/simple;
	bh=sFprJVFwJ2E7g7E3sEaLKEWRDzMN6Z2rx69KzoKoQTw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bRQXskt/sA5M6IhMv1QcAB7/GiA+coBFjHwQs7rz2MvLn7skUtKEi+AjPtDe8oVdy+OC4eRw78wTxtx+2yXxBx5OO7NSoDCUTRVrS5gue3n/fdLNimRSTHNrcz5STkU8Vul9+0yTdGkMSsXvuWjG5j9UdVfP/aJRAY5ZkvIrltQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=Gasn0qMA; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="Gasn0qMA"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-218c8ac69faso4103345ad.3
        for <linux-doc@vger.kernel.org>; Fri, 24 Jan 2025 02:00:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1737712844; x=1738317644; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BmTxH03KXDQTDv/Uw7GBBM8E4pylSL3aSkfPVMzEuWQ=;
        b=Gasn0qMAqg7q9uMweLS6GNtSQWNHJSGBATclZoe5eiW7YafUqZHthM8V7O9VUXzkvl
         d6UZ49bq9cCT5MDx2qJHevfRNKLHTJIfRqPfol2QyfmXwTCZNdGfLpPhVUQNqOkJImjx
         aNXX+JR1iEzXOVcbRjrURLu5AY6S05qQbSt4E9jzZ2itJSeuE7W/sTRIIsJJ3yxeNQmk
         WYno/ey6UtlZbOJ03UMcaTvjKtDByEoUDuSs8IqALvvNOj7xNYcTQx0M1viaIPc8trGg
         WWMXeUrm8avKKTMN84ieCnDATmWQb3zZsPyHSaZbYkWMeBTWyyLlKvliCe3BJk2c1Ox/
         aczQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737712844; x=1738317644;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BmTxH03KXDQTDv/Uw7GBBM8E4pylSL3aSkfPVMzEuWQ=;
        b=d1JEAZwhLLFtRQe51GrHTpqoqgBPma/pKDPxT+W6Wn2j1zQ1tC0PUk7kG4/bCcD7Fb
         QgckvaNYfoJp91VPfYyJsgH+zeseh+rCmdv6MCH4xdEMTw1XlO/NGgtGRCAKLbDWHqfq
         NPC/AORR2A9D6cjjSaeONenufXCt2Qe3nysX77OAIpu8ZqM6N/hbT+UyVQb71OugHSZB
         G7F0Ng0+UnxqFH+9O9U6tguyDeQX75H7ameqA9pcwPJ5iH4WvvIYgFZ1UuIIpf1nSeGK
         jH0ZpCE0EGXZwFq7WoByvl6xTVKRBEUV5Rhmutdl+qpOu5XARJXMO6AKwg0NuV+Te85P
         GgUg==
X-Forwarded-Encrypted: i=1; AJvYcCW1x1wj3xpPSRPGbgAOewOD4VmzIZGHY4KCgx3eFotEm5uz9D6Apt30Ng7XMuTbDQzkGRsKMsa4zYg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwykcJ18uaFH4h8XLv56A7IUXUAsULiCFV6Qx7yuHdJ4husPkzj
	tAFMPQsdhcUFG7AbDaUBcJO3RllciFh3246gwHuDyNj5hK9HLI1nRuMx4T52997F+Wmrbn7IsrE
	s
X-Gm-Gg: ASbGncuiIGqHfCglsUtwQzV8czGxVuIJ6p3xFLbsDI9Zdj4hsmkdp/0tEaScWchoVzV
	GSFsE9dMTDNVXN1ujQtdS1PqsC+c7dj91OFNTpXchTlR3/Yq/8d97CBXl0i1ypNeQUsxYpRPfs0
	hsJrlrfAV82xw8GRGzPR0si8x9MiL9Pd5MSbpayV8oDupgZBk6LV7bcoo6xmqU18U5qex/Sm0MM
	ugNxGPyZHPILXnQhCYtkgYt5DEdhsyTzXcsFf1U0ySSLv+h22UQoyXt/bNk0xVjpvuf+2HMt/9Z
	43mouf0ul+YU2JDz7qTEgew5/VNRMQ==
X-Google-Smtp-Source: AGHT+IElO9gB3UAtHo+GuhS7uM8VXUkiIauC0sqTubx0f3SOShH1kUjljV5ZgDcKKMWCosxHHkPDQQ==
X-Received: by 2002:a05:6a00:21c7:b0:71e:4bda:71ec with SMTP id d2e1a72fcca58-72dafb9b2c7mr14455055b3a.4.1737712843813;
        Fri, 24 Jan 2025 02:00:43 -0800 (PST)
Received: from [10.254.144.106] ([139.177.225.251])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72f8a77c969sm1428288b3a.150.2025.01.24.02.00.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Jan 2025 02:00:43 -0800 (PST)
Message-ID: <764096dd-4d2c-4934-9c07-500a476bb140@bytedance.com>
Date: Fri, 24 Jan 2025 18:00:34 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] cgroup/rstat: Cleanup cpu.stat once for all
Content-Language: en-US
To: =?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>
Cc: Tejun Heo <tj@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>,
 Jonathan Corbet <corbet@lwn.net>, Ingo Molnar <mingo@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>,
 Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>, Bitao Hu
 <yaoma@linux.alibaba.com>, Thomas Gleixner <tglx@linutronix.de>,
 Yury Norov <yury.norov@gmail.com>, Chen Ridong <chenridong@huawei.com>,
 "open list:CONTROL GROUP (CGROUP)" <cgroups@vger.kernel.org>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20250123174713.25570-1-wuyun.abel@bytedance.com>
 <20250123174713.25570-3-wuyun.abel@bytedance.com>
 <2fenjyawa46abfrpcebluaoi6dd4z5v2y7pp7jyuu2oblmfmhk@reaaehe6pkzn>
From: Abel Wu <wuyun.abel@bytedance.com>
In-Reply-To: <2fenjyawa46abfrpcebluaoi6dd4z5v2y7pp7jyuu2oblmfmhk@reaaehe6pkzn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 1/24/25 5:22 PM, Michal Koutný Wrote:
> On Fri, Jan 24, 2025 at 01:47:02AM +0800, Abel Wu <wuyun.abel@bytedance.com> wrote:
>> -static void cgroup_force_idle_show(struct seq_file *seq, struct cgroup_base_stat *bstat)
>> +static void __append_bstat(struct seq_file *seq, struct cgroup_base_stat *bstat,
>> +			   struct bstat_entry *entry)
> 
> Not sure if starting with double underscore is needed when the helper is
> `static`. Also something like s/append/show/ -> cgroup_bstat_entry_show.

Yeah, "cgroup_bstat_entry_show" looks better! Will fix.

Thanks,
	Abel

