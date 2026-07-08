Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7C083AB46F
	for <linux-doc@vger.kernel.org>; Wed,  8 Jul 2026 01:08:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783472899; cv=none; b=QHnyIxZqlXk41OEB2tLXtQUkWs67g3Kvml+lOJfx0vmnlWpCBMeXgHc84MHRZvyC5lxGBx7D+GSk7LHlb3sC8xLXS0+2Jvt3T9pHgXJusivHw2ZXyZ8tiLO+TUwldKJqrUl1dmuCau8KbhRNn5YwjdbZtWSy2CBkwprwUhQcmWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783472899; c=relaxed/simple;
	bh=HHSTrAAV6VhLJ8/+eLocLEiha0Nzqz3h8PgCzVvtwLE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NY/nbg1Ho++uP7jOOBCHmP8/kPJ6AI4GwbvBiFa6rRQnMxFOA48C1Q+4liFwBhbmo5FOnHBidtCRIJPSPPVOXtVCEQ5ijjuufQQxR40KwQLufnMkH2szfHb6RBHkIAyghWOBJuNVpVWvgqfjkcpak91saTJhth6yQbmOjM1exl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NhUmI3dE; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NhUmI3dE"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-381c51fde6bso161597a91.2
        for <linux-doc@vger.kernel.org>; Tue, 07 Jul 2026 18:08:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783472897; x=1784077697; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=t0K3zUAUUIcohgWNlh4z4WVCeVlkyYgQv8ni2kcRyow=;
        b=NhUmI3dERDLbAlHurtXEm8oYS0gihFzHujhhtKlMczcyH6/WPWXQNslUbCwJ/BZnN1
         Y7bqmBUJWriBTAfMFgLb3Gk48yBakYA+jEsBpDj7UvU8Usu4iMiSBPgFN7ohrCTFokDk
         jzot5dk4y4B2Rs3z+o/o4IlPIsgXoupCupgIEU3+vKLlM/fIG0E2mxaFgCeFJFpOdo0G
         AFtyvb0B3Gys1QNbw5lj2ybg1B/XDyTu1sZZVJvI1PT/PkYL+fPRKG8sHfNGh+z0G0iu
         IOZMTMKeDenD4L/eWKtMjpZCe3PZWfBPKSRoh2meQ2n2/n14sqzeTd43mRCgOyh2iDCR
         q4SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783472897; x=1784077697;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t0K3zUAUUIcohgWNlh4z4WVCeVlkyYgQv8ni2kcRyow=;
        b=hwpLFAI7UbNDZ1f6qmM3uH/AZU5ZoDFk14J+9onOcFX9A+SaJ2N7ZonK94goUYTIMv
         XEXEGFKeZXJ0PJ2ya4Kj7BCWymf4iZsQ8X9Pb5odDqE8Md/k40BpRhOnbJBnXVmEfxER
         P/JNVAjTBGNkA1jyLgOrHv5MzDROqV9A2wqzuTGFGiPeUV38PHCU98VZ51yW1tUEYW1/
         xdpf3mCdNT4nskhVzmsFsQCrBlNed+XuUkMOH4gtPXAJ5tj+JBUNADds3G9fbUsYuYp/
         cYdsC85gwKwE/dY6Nkjt4HznX6oujAV66EvvMq4EtLynfJT9Ho8xfQ5DY5y5cGbGKQuH
         x5Zw==
X-Forwarded-Encrypted: i=1; AHgh+RpF0VOFRr9sv5q+L+tyRqTOwa/whti3a5/GLQYJyc/hassnWQEbToMH+A+aqNIgooVuoxtdLrq+4X8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxu+jLEDN6Fd83KPF9i6O2bWmZnsc7lAyMsK3tW9XLYQ4PWSqTM
	uslzk7hXUMZ0xslp5bPEIQNZa4cGCtHCayAWoHe2glT9Syptxq6NJcf7IhAvkcE6
X-Gm-Gg: AfdE7cmovI2xkKFMZUCXI5notg4TJdzPqdShBK1v6O1rl4tRyUSlNaZSAVXLixnmCYk
	1UMWlx6bGBT/UO5FVu5KcvxLCI61tAV6IqAQJVp2YULGBEJCReXOgRydvt/T+71r6VWYx/7gLAu
	1bQ+BrD4isv93N6MKtD7xJYPzJzJk08ZN/omRatNw7pmfpLnlWZN2tN0py5x/4ZcTRR4Z8x7M8Y
	A/KfHElTxFBHy5SyMJrHAPs9hmJcue6IGqx6IdVWc8n4yH1ogjpsHtXYJ+nVr/2Aq+FDwn8o51J
	TXG2DscjK16nsm87aV8aOnfkRrTQGtiCxkjjjUR+tRBG+fqLWyNG50znxTv301FDfLFhfCf32kH
	cFnsRv7m1J1P6DWnZElaZxmVej0At2sJBmOHImExrYxIe5u8F4GexT3sQ1GLXhgU/bMDfUqPFbY
	sC1+lgb3cCowFiZCJQ7MOtxGLJY/k47vqGUfEogmcOt/t/KvQzs6g+hw==
X-Received: by 2002:a17:90b:2ccd:b0:37f:c22a:c188 with SMTP id 98e67ed59e1d1-3894014cafcmr275585a91.4.1783472897145;
        Tue, 07 Jul 2026 18:08:17 -0700 (PDT)
Received: from ?IPV6:240e:38b:e68:3a01:5516:6588:891a:b868? ([240e:38b:e68:3a01:5516:6588:891a:b868])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38903295585sm213699a91.2.2026.07.07.18.08.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jul 2026 18:08:16 -0700 (PDT)
Message-ID: <e4a47268-33d6-4d64-9401-e13e2b13b375@gmail.com>
Date: Wed, 8 Jul 2026 09:08:09 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] sched/doc: Fix stale em_pd_energy() reference in
 sched-energy
To: luoliang@kylinos.cn, Jonathan Corbet <corbet@lwn.net>
Cc: Shuah Khan <skhan@linuxfoundation.org>, Alex Shi <alexs@kernel.org>,
 Yanteng Si <si.yanteng@linux.dev>, Dongliang Mu <dzm91@hust.edu.cn>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260707085335.2942128-1-luoliang@kylinos.cn>
From: Alex Shi <seakeel@gmail.com>
Content-Language: en-US
In-Reply-To: <20260707085335.2942128-1-luoliang@kylinos.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 2026/7/7 16:53, luoliang@kylinos.cn wrote:
> From: Liang Luo<luoliang@kylinos.cn>
> 
> The scheduler energy-aware placement documentation refers to the
> em_pd_energy() API, which was renamed to em_cpu_energy() in commit
> f0b5694791ce ("PM / EM: change name of em_pd_energy to em_cpu_energy").
> Update the reference to the current name.
> 
> em_cpu_energy() is the EM helper that compute_energy() in
> kernel/sched/fair.c calls to estimate a performance domain's energy
> consumption (defined in include/linux/energy_model.h).
> 
> Sync the zh_CN translation, which carries the same stale name.
> 
> Signed-off-by: Liang Luo<luoliang@kylinos.cn>

Reviewed-by: Alex Shi <alexs@kernel.org>

> ---
>   Documentation/scheduler/sched-energy.rst                    | 2 +-
>   Documentation/translations/zh_CN/scheduler/sched-energy.rst | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/scheduler/sched-energy.rst b/Documentation/scheduler/sched-energy.rst
> index 4e47aaf103eb..83bac0da4869 100644
> --- a/Documentation/scheduler/sched-energy.rst
> +++ b/Documentation/scheduler/sched-energy.rst
> @@ -141,7 +141,7 @@ in its previous activation.
>   find_energy_efficient_cpu() uses compute_energy() to estimate what will be the
>   energy consumed by the system if the waking task was migrated. compute_energy()
>   looks at the current utilization landscape of the CPUs and adjusts it to
> -'simulate' the task migration. The EM framework provides the em_pd_energy() API
> +'simulate' the task migration. The EM framework provides the em_cpu_energy() API
>   which computes the expected energy consumption of each performance domain for
>   the given utilization landscape.
>   
> diff --git a/Documentation/translations/zh_CN/scheduler/sched-energy.rst b/Documentation/translations/zh_CN/scheduler/sched-energy.rst
> index fdbf6cfeea93..03dedc69839a 100644
> --- a/Documentation/translations/zh_CN/scheduler/sched-energy.rst
> +++ b/Documentation/translations/zh_CN/scheduler/sched-energy.rst
> @@ -119,7 +119,7 @@ EAS覆盖了CFS的任务唤醒平衡代码。在唤醒平衡时，它使用平
>   
>   如果唤醒的任务被迁移，find_energy_efficient_cpu()使用compute_energy()来估算
>   系统将消耗多少能量。compute_energy()检查各CPU当前的利用率情况，并尝试调整来
> -“模拟”任务迁移。EM框架提供了API em_pd_energy()计算每个性能域在给定的利用率条件
> +“模拟”任务迁移。EM框架提供了API em_cpu_energy()计算每个性能域在给定的利用率条件
>   下的预期能量消耗。
>   
>   下面详细介绍一个优化能量消耗的任务放置决策的例子。
> -- 2.43.0
> 

