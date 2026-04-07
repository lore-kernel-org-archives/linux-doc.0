Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 974128634C;
	Tue,  7 Apr 2026 18:18:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775585934; cv=none; b=P4FaFSJ4L1e6ap6NMrz5zXVIEEeH7RXZLU+8A0xD+u+X1h7JPdBEs7tU4XBWnORRz+6IklkYhWeX0rfUZp16q74PT4ERNSTqG8Zud9l/K9b6pfDLoXK6lwt3PcQC1TvohRM7zkEWxn/4/ZXTyQmsamxLMyZWsn3F5I6MYcBiRVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775585934; c=relaxed/simple;
	bh=RneS6AL4I2effN7ofGLYVXy+t5u6MUx5zctqwBszUcQ=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References; b=sYUi4KGPcnCzSuD8UQEaysKbN0dNmgkfML8nsG82ymHbYs+mdTiJsh0C8GOIU7TW/NffB3aP9ZBjA06HPmbgRutcwfK2EFRiqi8bZ4XmWyU9n5bLNCb2Y9jeANSeye5YYydnhaJmw6dVSgog2t1xHnlNFifcocrTSMEP8ZsMX90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iwU7kA5z; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iwU7kA5z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FE00C116C6;
	Tue,  7 Apr 2026 18:18:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775585934;
	bh=RneS6AL4I2effN7ofGLYVXy+t5u6MUx5zctqwBszUcQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=iwU7kA5z0vNDmXj0HPLqhOKFuLvnlaA4yaNgej4TlTK4xwZBklXx7cMUFxN0MIO+E
	 4NrZTdplybr+yvl9Ji6GDkt69COo5obiyJIiu1qd8Pd5LBwt70/lR/isfRP9J3y401
	 103jclLdK4929GelbRGy+7z66gJGSseVtQrFdFSFxapV52TxPWSUd5DkkovqDVqTlK
	 qkGk9KnvIoI/SOKZ502X5tsWwkKhijmIYH4DtbDVX9YtU4qSbuyanI94iKTtO9c/9/
	 jJEhb6vZam9E6OTa8eneeGE8XqEy/jMh1w/j4a+QDycifsvyDZyk6iDHmjjLvZXq3p
	 REGQVXT5w4BWw==
Date: Tue, 07 Apr 2026 08:18:53 -1000
Message-ID: <685fc3f85ac74e3ed8514fe8a8fc8ee3@kernel.org>
From: Tejun Heo <tj@kernel.org>
To: fangqiurong@kylinos.cn
Cc: linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, corbet@lwn.net
Subject: Re: [PATCH] sched_ext: Documentation: Fix scx_bpf_move_to_local kfunc name
In-Reply-To: <20260407093405.2573184-1-fangqiurong@kylinos.cn>
References: <20260407093405.2573184-1-fangqiurong@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>

Hello,

On Tue, Apr  7, 2026 at 05:34:05PM +0800, fangqiurong@kylinos.cn wrote:
> The correct kfunc name is scx_bpf_dsq_move_to_local(), not
> scx_bpf_move_to_local(). Fix the two references in the
> Scheduling Cycle section.

Applied to sched_ext/for-7.1. The patch had the author From: line
set to fangqiurong@kylinos.com while the envelope and Signed-off-by
were @kylinos.cn -- I aligned the recorded author with the
Signed-off-by (.cn). Please let me know if that's wrong.

Thanks.

--
tejun
