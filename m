Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F5E63F4106;
	Thu,  9 Jul 2026 11:37:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783597076; cv=none; b=FYnZSgl50vCSMA2tPRCJiW+jol3MxoxVsqlZzAEEyN2Z7u9mZc8jObUxsOdDwMdAvB5MsaZAuDPlgYM2bkrsgru8PCh4cajhRHpl/QG7bkOpt5BEXHgo8mD2OLYwHYqV36knPi5L6IIBeDAuRH4qlOUYSYEKo9lI/JMdFfwd+MY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783597076; c=relaxed/simple;
	bh=gKoJt6/ETe0fH6d7Da8df8bHVJwEA8WWn2gMjCx/l6Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=m1RXlfFtj/M80pvwKvWIa1PDC664jKZ1LSpgqWTOibdyxoWH/sYTVvuDBI7zBz7QlVV2JhMyjtVhrN0wSKJUgWGow0ri9ZcoD33dOt95Wm+IRCR6eh03lIZTpgdTjRuPH8nr7oRjLvrhRiO6bcHuFuCMpy7ejFbNd+9zkH3W5DU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=AwPYWrTi; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="AwPYWrTi"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 990083570;
	Thu,  9 Jul 2026 04:37:41 -0700 (PDT)
Received: from [10.57.0.219] (unknown [10.57.0.219])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3FBD33FE53;
	Thu,  9 Jul 2026 04:37:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783597065; bh=gKoJt6/ETe0fH6d7Da8df8bHVJwEA8WWn2gMjCx/l6Q=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=AwPYWrTiIqGyl1Nn6U98iBlI968hpm+AJLFS37is5X1+zS3lOX1Hp0KDqjaRTHO34
	 zqrw9XNa2nERFJJ4odDK3wZG8uRJnIOTD6B9CG9LG8Ovl5LONXZ3NiJfNsfV68OAZ4
	 opUvGPi/or0rvhkIXcxeusSj9oKVAQpJj97ma4/A=
Message-ID: <a6339f25-41b5-4186-a9d1-d46b5b36c998@arm.com>
Date: Thu, 9 Jul 2026 12:37:45 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] sched/doc: Fix stale em_pd_energy() reference in
 sched-energy
To: luoliang@kylinos.cn
Cc: Shuah Khan <skhan@linuxfoundation.org>, Jonathan Corbet <corbet@lwn.net>,
 Alex Shi <alexs@kernel.org>, Yanteng Si <si.yanteng@linux.dev>,
 Dongliang Mu <dzm91@hust.edu.cn>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, "Rafael J. Wysocki" <rafael@kernel.org>
References: <20260707085335.2942128-1-luoliang@kylinos.cn>
Content-Language: en-US
From: Lukasz Luba <lukasz.luba@arm.com>
In-Reply-To: <20260707085335.2942128-1-luoliang@kylinos.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 7/7/26 09:53, luoliang@kylinos.cn wrote:
> From: Liang Luo <luoliang@kylinos.cn>
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
> Signed-off-by: Liang Luo <luoliang@kylinos.cn>
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


Good catch Liang. I've missed that doc bit back then, thank you.

Reviewed-by: Lukasz Luba <lukasz.luba@arm.com>

