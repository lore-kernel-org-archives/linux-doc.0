Received: from out-186.mta0.migadu.com (out-186.mta0.migadu.com [91.218.175.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33B1C1D95A3
	for <linux-doc@vger.kernel.org>; Sat, 11 Jul 2026 05:22:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.186
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783747339; cv=none; b=rHZ403tNdu4VsPcdcwQLiI3Co5eRAIEGMFRQ3TSNCc/P7DJLIcYYnc8ZvLkV5drfeGWXSjhdwWQqjW1fEWj9qkFKCV6uftcbMcBpyJM3+1ykkxPtdcO06x9iHYVIUAts13gJIS4ev9leWt4OzERV2H+7441xV2cElBAhEuNOPZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783747339; c=relaxed/simple;
	bh=dFV+LO1M82dB9RBXlBhEZhqKjpuIWQ8xseZQnYjtQAI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TjhG6deZYwXQeRx697BHwLmsfqMTrre7QkSZpud4Naqowx0XyMG4DVUHy1cMHdNpZuY6g9Rx5/dzijZTQWzP06oRrK+wlE+kU/McDexHnRfEG45sexRuP4GDT8BSnGhmehfMdHlqgZhaT+tp9Gv5ehiY3JoxT0EyAEKNvXenTTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org; spf=pass smtp.mailfrom=wyuan.org; dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b=jXPtMG30; arc=none smtp.client-ip=91.218.175.186
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b="jXPtMG30"
Date: Sat, 11 Jul 2026 13:21:59 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wyuan.org; s=key1;
	t=1783747334;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9RV1HW+vVW7pXGHkLyD0n62wdk/o+Nyex+xgSZJC4Zg=;
	b=jXPtMG302fMD6f7mxcuv3zvj5TO/G7k+ozU25TfHWd9cp9J561Zu8e7xbX4ZWM3N0D13+T
	hb/p0pQvBvNcoiGXBjvS9W6ZQtjZiv7jJvd4MK8S65tyYmMyFSphXu5lN5//Kn0TOHvvut
	I54SYhx2I8MW1wH3qnOayW6YV9CTttq9atiyXJoltKtFZsLx78Sr8iirVAEeUaIaepwIjk
	uRyz27ZNWw/FUbG6a+Y2sDv3GlgqM7p6F/Llf+ludL61hgylVhsT64KvMH3EkxAA/TPqz9
	yvzO8HOFV9qmdH7yu9CTxSsxoy8IXGNykzi8MEdx3X6BDXfTpJJHDkWdJD57KQ==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Weijie Yuan <wy@wyuan.org>
To: Dongliang Mu <dzm91@hust.edu.cn>
Cc: =?utf-8?B?6JGJ5a645L2R?= <chenyou910331@gmail.com>,
	Hu Haowen <2023002089@link.tyut.edu.cn>,
	Alex Shi <alexs@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Dongliang Mu <mudongliangabcd@gmail.com>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] docs: zh_TW: process: localize terminologies and
 improve fluency in 8.Conclusion
Message-ID: <alHS9-zQQQ9aJRRW@wyuan.org>
References: <20260603082531.263115-1-chenyou910331@gmail.com>
 <CAKspUh+2ndK1qMP58hPPmvwczruCikEuaO2tmyw=APCGrd9yaw@mail.gmail.com>
 <06fcda8b-b507-409e-9ded-299baa6ddd09@hust.edu.cn>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <06fcda8b-b507-409e-9ded-299baa6ddd09@hust.edu.cn>
X-Migadu-Flow: FLOW_OUT

On Fri, Jul 10, 2026 at 09:05:47PM +0800, Dongliang Mu wrote:
> 
> On 7/10/26 4:49 PM, 葉宸佑 wrote:
> > Gentle ping.
> > 
> > This v2 addressed the review comments from Alex and Dongliang.
> > Is there anything else I should improve, or is it queued somewhere
> > I might have missed?
> 
> It seems like Alex is not on the cc list. None can pick up this patch.
> 
> Add Alex into this thread.
> 
> Dongliang Mu

I suspect that some contributors would run the get_maintainers.pl script
or b4 prep --auto-to-cc, so they did not cc Alex, as they didn't know
the current situation. Because I noticed that for both two versions,
Chen-yu didn't cc Alex or Dongliang or Yanteng. Am I right, @Chen-yu? ;-)

Therefore, how about adding zh_CN team temporarily to zh_TW in
MAINTAINERS file? So that it won't confuse newcomers in the near future.

Thanks,
Weijie
