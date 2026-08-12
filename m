Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36F754B04B7;
	Wed, 12 Aug 2026 18:38:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786559895; cv=none; b=MXkaSRpIeHyVdifn7h7uG8QYS1u7rAb+ckYTMqlNZun6t5ix0eb8vJf8dIXY/E2u6wti7sJtDqkxQk72/MhjI7SfCxIzDeDw/srnVE7iR8PHAvw8A/0x4Ao+2tv7gGv73bckhri6Tgp0UyYgsoV1LmGjfvXQOT3Qro1PVTrV+s4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786559895; c=relaxed/simple;
	bh=xBbU19rIhfX02/7U6p/lmAyuheqdScfFB1orIC5MVNc=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References; b=W/b2c+W39XZFCsXRxfQLIehOMXHwQmCVsTpPrT2fK2CxWBEBBFnZmog4qxDmGI5FwFDpCWOhD3GJJ94Q8SjqP+5G/So/lqg7IKXVhlt76gKPVotJCunBzhf6ssjJCEXBhUG0LI0ecXksFoiYXMzhtqA1bB1WlCw3pnoAAv1FPQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ih5g+hZo; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ih5g+hZo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E71171F000E9;
	Wed, 12 Aug 2026 18:38:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786559894;
	bh=IW66561AETC6bfkzbfO3aC7gCkfbcayM0xa7d3dStJA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=Ih5g+hZoF8jwbR5zGafVPpKyuPZNs4lnliz89/ya3Nf3vSVK9xK8ddHAH+mDFnh0/
	 YM4p1hv6GUVD7Ra1uQfOFvjd21Oo9P/oxyyh5SJXjX5hAKDnkcuEOQTpf+AahbdlZ2
	 zfXaTdik5Ojac0CMD3u8S/UflLeIZlQO8s4yT2f5zigM9FDTNRRnsDa4T7f+/DN5+P
	 XZc3b78BasTRfTfVzdPIDmnHywbHqrcOc3eYa7Gcu47HWRWr0oYsv+s/shoNfKHFM7
	 ud3INya055AypHN2BtxUKS1wBZo1vtht+zWgaC8aG8f6fF0+/lKy8QwUXkV2x8zSF7
	 M0Y89a9fCqJcA==
Date: Wed, 12 Aug 2026 08:38:13 -1000
Message-ID: <7496accfcf61b49e8fe5675a3d941c48@kernel.org>
From: Tejun Heo <tj@kernel.org>
To: Tao Cui <cui.tao@linux.dev>
Cc: corbet@lwn.net, rdunlap@infradead.org, skhan@linuxfoundation.org,
	arighi@nvidia.com, yphbchou0911@gmail.com, jpiecuch@google.com,
	ihor.solodrai@linux.dev, suzhidao@xiaomi.com, luoliang@kylinos.cn,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	cuitao@kylinos.cn
Subject: Re: [PATCH 2/2] sched_ext: fix stale references in doc comments
In-Reply-To: <20260811073801.342165-3-cui.tao@linux.dev>
References: <20260811073801.342165-1-cui.tao@linux.dev>
	<20260811073801.342165-3-cui.tao@linux.dev>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>

Hello, Tao.

On Tue, Aug 11, 2026 at 03:38:01PM +0800, Tao Cui wrote:
> - * One user of this function is scx_bpf_dispatch() which can be called
> + * One user of this function is scx_bpf_dsq_insert() which can be called
>   * recursively as sub-sched dispatches nest. Always inline to reduce stack usage
>   * from the call frame.

This one isn't a leftover of the scx_bpf_dispatch() rename.
scx_bpf_dsq_insert() doesn't call scx_dispatch_sched() and can't nest.
The comment is a typo for scx_bpf_sub_dispatch(), which a parent's
ops.dispatch() calls to trigger dispatching on a child scheduler, so the
calls nest as sub-scheds do. Please use scx_bpf_sub_dispatch() instead.

> 	 * - sleeping (%SCX_DEQ_SLEEP)
> 	 * - being moved to another CPU
> 	 * - being temporarily taken off the queue for an attribute change
> -	 *   (%SCX_DEQ_SAVE)

SCX_DEQ_SAVE was never defined, but these dequeues are flagged with
%SCX_DEQ_SCHED_CHANGE which ops.quiescent() does receive. Please replace
the reference instead of dropping it.

> +	 * '_' and '.' chars. Exposed via
> +	 * /sys/kernel/sched_ext/root/ops while the BPF scheduler is enabled.

@name applies to sub-schedulers too and they show it the same way under
their own directories. Maybe something like "Exposed via the ops file in
the scheduler's sysfs directory, /sys/kernel/sched_ext/root/ops for the
root scheduler, while the BPF scheduler is enabled."

The first hunk no longer applies to sched_ext/for-7.3. Please base v2 on
that branch.

Thanks.

-- 
tejun
