Received: from out-173.mta1.migadu.com (out-173.mta1.migadu.com [95.215.58.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C149635F60E
	for <linux-doc@vger.kernel.org>; Tue, 23 Jun 2026 01:22:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782177776; cv=none; b=BRjJtyU5cwEBYAweS8RNUnrt13vJL8gPtc4uGFFe+KqmqQjf4vFZKlT9n1wnwAXLb/cmrzGoYBo+6M/+W1z5GRXrxfhjKYxX6/gmIi1Hmz/Tv2iUxJYt9gHrnr8/lIN4/gQwzDwkFs83K90xK2Woci8NARt+ZZ5CzdQhVvQCj/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782177776; c=relaxed/simple;
	bh=v+OmKz/qwNb3cD++nL8Ju6+NRPVxqGL6FindB9q758Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qmm5s3B6K8YwvRQWYR2pCSff043tsmTbac/RnAj4LxuMOjP6XMLsgcwhhCxqTFLdHAQVAh+nr9z6hdYK83mw5C7jWKHi9dH5DhGhvci4dmtTzD98+vqX9UlIAny5yTJSDhVgmEcmoEQwB6c3DJi4St9xM+X47Q+F8R+hsh/2MMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=xHuwGa3D; arc=none smtp.client-ip=95.215.58.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="xHuwGa3D"
Message-ID: <5a14e276-e59e-458d-9c24-622321bef8d7@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1782177763;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IP1jrhz6V+SNpvaMxGkoV85OuYzi4/pwez8gDGp5Ys8=;
	b=xHuwGa3DN5gWsnfU4l0oGCJBdIzNbawDfroYFbMOH494WtqAhZfo2y++a0yLOdC3LaKdVd
	3cskoQ38Tg4ug6I/ZYEma+xobF2Htt1E9RA0KuwB2Mds6CXHBF0kcKC6DIkt7bqT5CEO4y
	EjotpM65Xc33MmKXaZU/yqHUJ0FPta8=
Date: Tue, 23 Jun 2026 09:22:30 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 2/2] cgroup/cpuset: Rebind/migrate mm only for threadgroup
 leader in cpuset_update_tasks_nodemask()
To: Waiman Long <longman@redhat.com>, Tejun Heo <tj@kernel.org>,
 Johannes Weiner <hannes@cmpxchg.org>, =?UTF-8?Q?Michal_Koutn=C3=BD?=
 <mkoutny@suse.com>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>
Cc: cgroups@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org
References: <20260622224509.1927419-1-longman@redhat.com>
 <20260622224509.1927419-2-longman@redhat.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Ridong Chen <ridong.chen@linux.dev>
In-Reply-To: <20260622224509.1927419-2-longman@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT



On 6/23/2026 6:45 AM, Waiman Long wrote:
> As reported by sashiko [1], cpuset_update_tasks_nodemask() will do
> mpol_rebind_mm() and possibly cpuset_migrate_mm() for all threads of
> a multithreaded process. Since commit 3df9ca0a2b8b ("cpuset: migrate
> memory only for threadgroup leaders"), cpuset_attach() had been updated
> to rebind and migrate memory only for threadgroup leaders to mark the
> group leader as the owner of the mm_struct.
> 
> To be consistent and avoid unnecessary performance overhead for heavily
> multithreaded processes, follow the cpuset_attach() example and perform
> memory rebind and migration only for threadgroup leaders.
> 
> Also add a paragraph in cgroup-v2.rst under cpuset.mems that the
> threadgroup leader is the memory owner of that threadgroup. Therefore
> the non-leading threads shouldn't be in other cgroups whose "cpuset.mems"
> doesn't fully overleap that of the group leader.
> 
> [1] https://sashiko.dev/#/patchset/20260621032816.1806773-1-longman%40redhat.com
> 
> Signed-off-by: Waiman Long <longman@redhat.com>
> ---
>   Documentation/admin-guide/cgroup-v2.rst | 7 +++++++
>   kernel/cgroup/cpuset.c                  | 4 ++++
>   2 files changed, 11 insertions(+)
> 
> diff --git a/Documentation/admin-guide/cgroup-v2.rst b/Documentation/admin-guide/cgroup-v2.rst
> index 993446ab66d0..341037c7ec9d 100644
> --- a/Documentation/admin-guide/cgroup-v2.rst
> +++ b/Documentation/admin-guide/cgroup-v2.rst
> @@ -2527,6 +2527,13 @@ Cpuset Interface Files
>   	a need to change "cpuset.mems" with active tasks, it shouldn't
>   	be done frequently.
>   
> +	For a multithreaded process, the threadgroup leader is
> +	considered the owner of the group's memory. Memory policy
> +	rebinding and migration will only happen with respect to the
> +	threadgroup leader. To avoid unexpected result, non-leading
> +	threads shouldn't be put into another cgroup whose "cpuset.mems"
> +	doesn't full overleap that of the threadgroup leader.
> +
>     cpuset.mems.effective
>   	A read-only multiple values file which exists on all
>   	cpuset-enabled cgroups.
> diff --git a/kernel/cgroup/cpuset.c b/kernel/cgroup/cpuset.c
> index bc0207fd6e57..27bc7a466468 100644
> --- a/kernel/cgroup/cpuset.c
> +++ b/kernel/cgroup/cpuset.c
> @@ -2659,6 +2659,10 @@ void cpuset_update_tasks_nodemask(struct cpuset *cs)
>   
>   		cpuset_change_task_nodemask(task, &newmems);
>   
> +		/* Rebind and migrate mm only for task group leader */
> +		if (task != task->group_leader)
> +			continue;
> +

Nit.

if (!thread_group_leader(task))
     continue;

>   		mm = get_task_mm(task);
>   		if (!mm)
>   			continue;

Reviewed-by: Ridong Chen <ridong.chen@linux.dev>

-- 
Best regards
Ridong

