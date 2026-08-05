Received: from out-174.mta1.migadu.com (out-174.mta1.migadu.com [95.215.58.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF95734750F
	for <linux-doc@vger.kernel.org>; Wed,  5 Aug 2026 07:21:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785914504; cv=none; b=Zzyy+FYtGa9zC700/uo+QeJuoGA6Wn821+66dW0sXcbkef23XPeO/QtjopMetwr3mGJKzEp47PP+WoJTzEIl0YQyzgsYn7kDyzPy2FiKRWAk2ZeQx3y3J9JnQW7hSvbQs6ui5/PInBleRCu/qPLrdJxzOv9+qKbYcraxmxQn7TU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785914504; c=relaxed/simple;
	bh=0NNAGMJV76ybSF34LN8iBN3ptM/keYulBscM4m/kE2Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Azy7ASp/PW1DRLtsjm/Ulf+cfC/2G5LcZTMpBl05s+/tA3QMQQpDx0+Qgo7bipysjIQ7JgZ5Oiqiy7G7aHJ7gBJ4dknUUqr0BzjBROCpckGiP+Y9HKxows/k0RyJLTdPFm86h08ITfbwiwe0rHPPOyvsQ/ncfudLLkd4FArnKTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org; spf=pass smtp.mailfrom=wyuan.org; dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b=s45GTUoG; arc=none smtp.client-ip=95.215.58.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b="s45GTUoG"
Date: Wed, 5 Aug 2026 15:21:13 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wyuan.org; s=key1;
	t=1785914488;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4BEWpFSdTcNpbJHraz5fC/1fzZ1NsVj0wTLWrAEEev8=;
	b=s45GTUoG5+8hRbWqXS3EZJvqWoFX7k8yUfaZUk47FNMlbef0h/uTwRxW349axEcXeIMfIX
	eUnq8RkSftVDIkMldVpXCVqHAgXplL1TLu3X6QHe86NK6VdUq+YY/dexKc6CqPhEYVlbyZ
	kJgVKAGi/ITalsgPlCheyIgurjujW/L0SRzJn+hkOPJRwBjZK84u9SLBliSfaQWFtTQMaD
	RIpynk0VnutCDNgDkv117LAudKyz3213QPijvdwxl3u4nUoEvCXrBeZCsOWWSzwMxyrYx9
	SJ36SAMwNAoDFZOYV5PHYKf2lvK2eG2gfmNqpYqKMNw67DFHye62GrcAQ5QIJA==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Weijie Yuan <wy@wyuan.org>
To: Chen-Yu Yeh <chenyou910331@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
	Dongliang Mu <dzm91@hust.edu.cn>, Yanteng Si <si.yanteng@linux.dev>,
	Hu Haowen <2023002089@link.tyut.edu.cn>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] MAINTAINERS: update Traditional Chinese documentation
 maintainers
Message-ID: <anLkaTxwuklKyNq9@wyuan.org>
References: <20260804201012.110713-1-chenyou910331@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260804201012.110713-1-chenyou910331@gmail.com>
X-Migadu-Flow: FLOW_OUT

On Wed, Aug 05, 2026 at 04:10:12AM +0800, Chen-Yu Yeh wrote:
> The zh_TW translation has been unmaintained for about two years: the
> listed maintainer has been unreachable, and because no active
> maintainer was listed, get_maintainer.pl did not point contributors at
> anyone who could actually pick up a patch. My own zh_TW patch sat on
> the list for five weeks for exactly that reason.
> 
> Following the discussion in [1] and the plan in [2], list the people
> who have stepped up to carry zh_TW forward, with a shift in focus
> towards Taiwanese Mandarin terminology rather than a plain
> simplified-to-traditional conversion.
> 
> Move Hu Haowen to CREDITS and drop his personal repository links,
> which are no longer reachable. The current translation is built on his
> work, but MAINTAINERS is a list of who to contact, and the listed
> address has not answered zh_TW mail for about two years, which is what
> made zh_TW hard to contribute to in the first place.
> 
> zh_TW stays a separate entry and is maintained separately from zh_CN;
> the two may share a tree for pull requests, but the review and
> terminology work is independent.
> 
> [1] https://lore.kernel.org/linux-doc/<20260603082531.263115-1-chenyou910331@gmail.com>/
> [2] https://lore.kernel.org/linux-doc/<amcZ5SI3-Hzw4HkJ@wyuan.org>/

Sorry I forgot to mention this in v1, somehow I'm not sure whether we
have a strict trailer rule towards this one or not:

Do we need to change the "[1] [2]" into two "Link:" ?

I remember that some subsystems have strict rules for this. If
Jon thinks it's okay, then it's okay.

For the content of the patch:

Acked-by: Weijie Yuan <wy@wyuan.org>

> 
> Signed-off-by: Chen-Yu Yeh <chenyou910331@gmail.com>
> ---
> Changes in v2:
>  - Drop Hu Haowen's M: entry (Jonathan Corbet); a CREDITS patch will
>    follow separately.
>  - Move the division of responsibilities below --- as suggested by
>    Weijie: it will drift over time, and a commit message is the one
>    place it cannot be updated.
>  - Collected Weijie's Acked-by.
> 
> Current split of work, for the record rather than for the git history:
> 
>   Chen-Yu Yeh   - translation and zh_TW terminology decisions
>   Weijie Yuan   - miscellaneous matters, list monitoring, status reports
>   Dongliang Mu  - review
> 
> The address in the CREDITS entry is the one Hu Haowen asked to be
> listed under in [3].
> 
> [3] https://lore.kernel.org/linux-doc/20260220160201.41149-1-srcres258@furdevs.cn/
> 
>  CREDITS     | 4 ++++
>  MAINTAINERS | 6 +++---
>  2 files changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/CREDITS b/CREDITS
> index 91c51c14e993..3866480db6aa 100644
> --- a/CREDITS
> +++ b/CREDITS
> @@ -1817,6 +1817,10 @@ S: Am Strand 5
>  S: D-19063 Schwerin
>  S: Germany
>  
> +N: Haowen Hu
> +E: srcres258@furdevs.cn
> +D: Traditional Chinese (zh_TW) documentation translation and maintenance
> +
>  N: Jan Hubicka
>  E: hubicka@freesoft.cz
>  E: hubicka@suse.cz
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 2f9472c1a090..1f7e783023a4 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -27460,10 +27460,10 @@ F:	kernel/trace/trace_osnoise.c
>  F:	kernel/trace/trace_sched_wakeup.c
>  
>  TRADITIONAL CHINESE DOCUMENTATION
> -M:	Hu Haowen <2023002089@link.tyut.edu.cn>
> +M:	Chen-Yu Yeh <chenyou910331@gmail.com>
> +M:	Weijie Yuan <wy@wyuan.org>
> +M:	Dongliang Mu <dzm91@hust.edu.cn>
>  S:	Maintained
> -W:	https://github.com/srcres258/linux-doc
> -T:	git https://github.com/srcres258/linux-doc.git doc-zh-tw
>  F:	Documentation/translations/zh_TW/
>  
>  TRIGGER SOURCE
> -- 
> 2.43.0
> 
