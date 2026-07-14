Received: from out-189.mta0.migadu.com (out-189.mta0.migadu.com [91.218.175.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E97825B0BD
	for <linux-doc@vger.kernel.org>; Tue, 14 Jul 2026 07:42:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784014971; cv=none; b=HUSzkufKR72gzAGhgibxjcenjlTfc9benlcwY6v4cwlPWBLMwMWB9TL1PKNqWZV18K9ekbdwWATArOHt8CdX+tOeNXN1tiMzZA4QK4qdxQDxFYxK5t6bjoIpPbWNku8wR8uuLc4eMz1JrBmhz1PkAl/pZUqDVoXrpxdU2/NtZiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784014971; c=relaxed/simple;
	bh=ByL07VQCS85YVTgmxIcSn0oZa2l/wDIuK84xh4ma4KE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rWyZH5wvde2eGZM24RRuLqWOjEVdPX/UWlZQhlx9WAv4kwg4W2mP3xwC3FqRbTdHDMnMUvsU98MNNLlHEgjVQCb8gi/0aTjxQSJ1f5cyJ57rvDtdDFnbiouVB87zP/n62I0zVFaiS0NB8CQS0o3GDzRtbJgZowiPj+z9sUTc9Oc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org; spf=pass smtp.mailfrom=wyuan.org; dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b=UMla5DdA; arc=none smtp.client-ip=91.218.175.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b="UMla5DdA"
Date: Tue, 14 Jul 2026 15:42:31 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wyuan.org; s=key1;
	t=1784014967;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rRLegmZuABzjJn8ZoAzjDyeJsK8X2gXNCaNS7L5h3ms=;
	b=UMla5DdAZHfX/Yhv6Sr+ZthNfrpRO7vEPflZyvF0eDSsEPiZPPiUJ67zQQLLxAu9DJU/IE
	5dJh3w+cdiEv34A/gxPECN/eVleVKRirRCGFdEmjfj1bNjwq7CDHYxYuXc6oz/lEWLIopm
	zx1bWYaya8k0de3Bx0pRbCKKq51uLfVwikNgd0hisbBMcqScdtRbfS29Tk8vZbx+6zKZv+
	khMtCN02n1B3TwWcs4SJudFhGDVllhQNQpsl58fQOK8oiT02MVBDnge7l42jHEQIEHS0Kh
	A8m2yKmhQTf9I9zOf5shEwT6VtFCGTWjlb+ybkhBAKgJDFMwuH9AQDXgLXiANA==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Weijie Yuan <wy@wyuan.org>
To: =?utf-8?B?6JGJ5a645L2R?= <chenyou910331@gmail.com>
Cc: Dongliang Mu <dzm91@hust.edu.cn>, Alex Shi <seakeel@gmail.com>,
	Hu Haowen <2023002089@link.tyut.edu.cn>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Dongliang Mu <mudongliangabcd@gmail.com>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, Yuchen Tian <cat@malon.dev>,
	Alex Shi <alexs@kernel.org>, Yanteng Si <si.yanteng@linux.dev>
Subject: Re: [PATCH v2] docs: zh_TW: process: localize terminologies and
 improve fluency in 8.Conclusion
Message-ID: <alXoZ-n8hIhzHZi8@wyuan.org>
References: <21179a3c-60d6-40b0-a5b1-594e989ef508@hust.edu.cn>
 <alS8lLglyMqJEYZ4@wyuan.org>
 <CAKspUhJTGXzM=UeKTTZYX69NttBuCnAezz=ZOM9imPWLSP5g9A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAKspUhJTGXzM=UeKTTZYX69NttBuCnAezz=ZOM9imPWLSP5g9A@mail.gmail.com>
X-Migadu-Flow: FLOW_OUT

Sorry for replying late.

On Tue, Jul 14, 2026 at 03:47:58AM +0800, 葉宸佑 wrote:
> So, to keep everything in one place, my understanding of the plan:
> 
> - Chen-Yu: terminology series for process/ (14 files), folding in the
>   pending 8.Conclusion changes, glossary included; adopt the
>   "update to commit HASH" convention from now on
> - Chen-Yu: read Jon's advice for new-language efforts (Spanish thread)
> - later: a zh_TW how-to document
> - Weijie: investigate which documents may not need translation;
>   monitor the CN/TW lists during the trial period
> - Dongliang: review; patches routed through Alex's tree (pending
>   Alex's confirmation)

I have nothing to correct now. But clear to see you are the one who gets
the most tasks to do. Appreciate it! ;-)

Today I have sent the first "What's cooking in zh_CN", but once your
work showing up on the list, I will simultaneously record and update
information from both sides, simplified and traditional, during this
transitional period, until later decisions.

Best regards,
Weijie
