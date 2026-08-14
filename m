Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 004B735B657;
	Fri, 14 Aug 2026 19:53:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786737208; cv=none; b=iqNulkQLGYogu+RvHJi9Vda2nQzzbMEXpC/+KN/KV9BnCWpbkXvuT+TKyabOhvpRcyEixGj5fgxQUiM3dNACtp38lsAgGOw3/UHQS493TLucmk8vXvfc2HgETwAFWkuG5uc4e9N+vRxWts+zVdvLMSN4Ydm4AuW7hiem7czLA2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786737208; c=relaxed/simple;
	bh=ANUEtHQVt0kSxwqqV2s9e41ffIJD6Ey7Xwr56vJGR9A=;
	h=Date:Message-ID:From:To:Cc:In-Reply-To:References:Subject; b=TY0KUQVn0PD0iTjnAQN4pjykFdVr3Tledvdj3ACaLc8DDm9w6IX1F4ZSls8ecVYlZzgc4eX2Zx43k4ghO95cctWoXgxzkM69QFyCsPq909Ytvsy4I00esuiu0mVgpYxxtkwJLwB6IVzWxfFlqZb4LsFpUQHR8q42khZz9DvW0j4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JQC4sY2V; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JQC4sY2V"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0F711F000E9;
	Fri, 14 Aug 2026 19:53:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786737206;
	bh=m3OsUZB9lUix+4qARlFFp5EG87YI25ElfNeOLjOF6oE=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject;
	b=JQC4sY2VOBymffmoXVo68njjeacn21+P6JwsIyb1SAo1wtguU2GT27rH5Qx8RYNww
	 sMRGzX6vz02+9EgMwV5k+6iRN+FmblN+L1yb3wgWLFc2yHXURLflV3/gSbKzdeb1x4
	 JWmtkEP2/BxIPIG3lUjtcCCsGBdMUMPcaSLJuZab7Bn/FY06+oNhd6bUgzcoFHaTJE
	 S8wlSY12qHhciuGbT0btBgzOuwagmMqf5MiwQzfLGCuFlvEUMLXcQAQ8JM/aCZjuaZ
	 ZUMdJYwLk3EEcb9JknqGqlizY8HqH/FUpGEGkWENnWGnNTcDERmQ23k4GRlkj4aDVU
	 k7zu8Y+nB1RqQ==
Date: Fri, 14 Aug 2026 09:53:26 -1000
Message-ID: <3be789318d8e33ce6dcd0670639bb68c@kernel.org>
From: Tejun Heo <tj@kernel.org>
To: Tao Cui <cui.tao@linux.dev>
Cc: Tao Cui <cuitao@kylinos.cn>,
	corbet@lwn.net,
	rdunlap@infradead.org,
	skhan@linuxfoundation.org,
	arighi@nvidia.com,
	yphbchou0911@gmail.com,
	jpiecuch@google.com,
	ihor.solodrai@linux.dev,
	suzhidao@xiaomi.com,
	luoliang@kylinos.cn,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
In-Reply-To: <20260813230123.2069719-1-cui.tao@linux.dev>
References: <20260813230123.2069719-1-cui.tao@linux.dev>
Subject: Re: [PATCH v2 0/2] sched_ext: minor doc and comment fixes
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>

On Fri, Aug 14, 2026 at 07:01:21AM +0800, Tao Cui wrote:
> Tao Cui (2):
>   Documentation: sched_ext: fix events sysfs path and show_state example
>   sched_ext: fix stale references in doc comments

Applied 1-2 to sched_ext/for-7.3.

Thanks.

--
tejun
