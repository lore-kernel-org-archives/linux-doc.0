Received: from out-170.mta0.migadu.com (out-170.mta0.migadu.com [91.218.175.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C497E23D2A1
	for <linux-doc@vger.kernel.org>; Sun, 12 Jul 2026 05:16:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783833393; cv=none; b=NEvHTVH6TiSgCBPnn/YiCqmivHWLffEPGah2epSlkj7JZCV0fz9MHPHova3zUvk9I1vqbyaIfQQXvmjQz8kQS+DWRz2gu2FAA2k4pwXxOkn9s8uPWiZtvDreRJDpVG4exZNCMdQiVIMVuG7VDPfbDhMbbyBPWLmebCj6OKL6nw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783833393; c=relaxed/simple;
	bh=I9zB1MXYtjXtcX0yfhhLuEHMxDfFPuG/xH9CenBrLBA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p1Lk7JUirHC/5UGyQm0zCGxs4eZ2Uy7GvH4UOEY9B/EK6XwCbvU0qkJHyj9SOmW80cZ9glcwDcRBaJsrTPoh6HukcuAo81VPjag0PUyL8IQOceOtE5pCqPjXv4+OVrrcFb6Wl1CbSfj8ap+zmdHcF24FuQ1+ozy5FXYz1qmyKyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org; spf=pass smtp.mailfrom=wyuan.org; dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b=woJcWOZK; arc=none smtp.client-ip=91.218.175.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b="woJcWOZK"
Date: Sun, 12 Jul 2026 13:15:59 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wyuan.org; s=key1;
	t=1783833378;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TT4s4zK5o3KhRlWbIf4iTrnz4W9alszmWfnQvpsGKvY=;
	b=woJcWOZK6eIcwA6aBswFvaKb73hQlBJembVh+MldF+e2DqNpEgZxu2If2fEqui+C6oKOfN
	ofof+4e3VI01y/9VT/puKBDTt8Km8wvn47Iu/WmPUa3lKibGrLJORJocBwpdE674G9+nq2
	+sCckRxxeJANCJoA6g/zgBA4E2H1X663knscQKvXeLIYwO2V+aT7/w2Mttwg/XXs6N3IHq
	sbUBldbNPcc892jyLPzZcZHgDc8erGr+6I3Gel+gRIjkC4xXpWp18VXmmwjAwKlWgLBYex
	W5ewwcchNLnZ9Dq6U1Srh78cMjsk1p/juIqxrIjAXAW/Yckw4WKgTGGe0b0a3w==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Weijie Yuan <wy@wyuan.org>
To: Jonathan Corbet <corbet@lwn.net>
Cc: =?utf-8?B?6JGJ5a645L2R?= <chenyou910331@gmail.com>,
	Dongliang Mu <dzm91@hust.edu.cn>,
	Hu Haowen <2023002089@link.tyut.edu.cn>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Dongliang Mu <mudongliangabcd@gmail.com>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, Yuchen Tian <cat@malon.dev>,
	Alex Shi <alexs@kernel.org>, Yanteng Si <si.yanteng@linux.dev>
Subject: Re: [PATCH v2] docs: zh_TW: process: localize terminologies and
 improve fluency in 8.Conclusion
Message-ID: <alMjD_dNWVgPKOlN@wyuan.org>
References: <20260603082531.263115-1-chenyou910331@gmail.com>
 <CAKspUh+2ndK1qMP58hPPmvwczruCikEuaO2tmyw=APCGrd9yaw@mail.gmail.com>
 <alDs8bnIK8bWApIr@wyuan.org>
 <57e42f43-44dd-4b22-8d81-c88e20016138@hust.edu.cn>
 <CAKspUhKh=cT_ks1hH9B4G8KppR=XT+THHsmNUFH_irX6xo1SZw@mail.gmail.com>
 <alJ7ocaqtpUkCGrd@wyuan.org>
 <87wlv1i985.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87wlv1i985.fsf@trenco.lwn.net>
X-Migadu-Flow: FLOW_OUT

On Sat, Jul 11, 2026 at 02:04:26PM -0600, Jonathan Corbet wrote:
> Weijie Yuan <wy@wyuan.org> writes:
> 
> > How exactly we define the position of Traditional Chinese or zh_TW?
> >
> >   1. Simple conversion between simplified and traditional Chinese
> >      characters
> >   2. Taiwanese localized traditional Chinese
> >
> > This issue needs to be confirmed by the senior maintenance personnel.
> > (I will review the archives to confirm. If there is already a clear
> > definition, please forgive me.)
> 
> "Senior maintenance personnel" in this case is the people who actually
> step up to maintain this translation.  There is no higher level of
> authority that needs to somehow sign off on it.

Yeah, so, due to the current special circumstances, I actually mean that
I want to seek the opinions of the Simplified Chinese team, and then
finally have you Ack.

> The existing translation is essentially abandoned; if somebody wants
> to carry it forward -- and stay with it -- with a shift in focus, I
> think that is just fine.

Yes, hope that the following discussion will lead to a consensus.

Thanks,
Weijie
