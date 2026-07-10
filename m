Received: from out-187.mta1.migadu.com (out-187.mta1.migadu.com [95.215.58.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27526426D18
	for <linux-doc@vger.kernel.org>; Fri, 10 Jul 2026 13:07:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783688854; cv=none; b=ZvneFxEylQxpna5NI6ahzbCqIBQ40a8cozjtTVQpED5SXdkEF9TX+lw6s7R/BoZYBLeVUo+ItRFh/7Ypbq9vcnWYXnvKgb4nKcrg6U3mPmKktleiO27xLRjzdb0E3da8ve5t8BZSVNA5uGm2e8UcQk1Yhs3H109eFEsOKb5xgW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783688854; c=relaxed/simple;
	bh=Dki2pgs2SGRs4ErwXIPB6sraNX8hrClQRzNo08Kgkxw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ObrkHEi7I5IqyxGV0Jb5jL/jTRFZ2Q/MGVlGcOoFLVAo/AvVxUyllsjp0CdLiTh9fR16P1A9fTljVCmmZHfRaT8oRqUovKH7VKdfcRwZ75F90DVN7c7QUG1YkeTqlVipzdV/5SZiG1zyxuCbq52eX0qsYkEsO1oyu07Qv4DJXjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org; spf=pass smtp.mailfrom=wyuan.org; dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b=rxvk1Y5y; arc=none smtp.client-ip=95.215.58.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b="rxvk1Y5y"
Date: Fri, 10 Jul 2026 21:07:03 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wyuan.org; s=key1;
	t=1783688849;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QaIm3h6sA1inwsG0cG3x8KZKT26vSm8ENaBxZlBZvVQ=;
	b=rxvk1Y5yvyK9fNT0v2BeC52L2ZCP90yn5/hVu56GfMYfZRpQwklcBDnD807AQpcOjqXH+j
	LObnBf6zseyNen6PO3Gzkp8LuZXVizMpqmpqjTVWlppv44JOPDpLYR6ByoZO4dUJara4u3
	L31fa/eVnHXoLlQkdGzVVGdWmwcwQC+acDUlWB+NrroOl+v77vPGZ4ns/qZeTARoN1/Uzo
	IsnzaT8J7Hqq20rQ8whuhFCy1eQ1t7DvKXXUsF90KME7zWRkjv8qb6iNHHRVJZLChd3MEi
	k5yfKG8TjJJiXwe+QyOGDINPd3DrIivBOvmCCq1VQI4EIsjA++pGwBNFeJv8Ig==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Weijie Yuan <wy@wyuan.org>
To: =?utf-8?B?6JGJ5a645L2R?= <chenyou910331@gmail.com>
Cc: Hu Haowen <2023002089@link.tyut.edu.cn>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Dongliang Mu <mudongliangabcd@gmail.com>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, Dongliang Mu <dzm91@hust.edu.cn>,
	Yuchen Tian <cat@malon.dev>, Alex Shi <alexs@kernel.org>,
	Yanteng Si <si.yanteng@linux.dev>
Subject: Re: [PATCH v2] docs: zh_TW: process: localize terminologies and
 improve fluency in 8.Conclusion
Message-ID: <alDudwVJecgdtD7x@wyuan.org>
References: <20260603082531.263115-1-chenyou910331@gmail.com>
 <CAKspUh+2ndK1qMP58hPPmvwczruCikEuaO2tmyw=APCGrd9yaw@mail.gmail.com>
 <alDs8bnIK8bWApIr@wyuan.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <alDs8bnIK8bWApIr@wyuan.org>
X-Migadu-Flow: FLOW_OUT

On Fri, Jul 10, 2026 at 09:00:54PM +0800, Weijie Yuan wrote:
> On Fri, Jul 10, 2026 at 04:49:30PM +0800, 葉宸佑 wrote:
> > Gentle ping.
> > 
> > This v2 addressed the review comments from Alex and Dongliang.
> > Is there anything else I should improve, or is it queued somewhere
> > I might have missed?
> 
> Hi Chenyou,

Sorry, I think you will prefer being called Chen-Yu instead :-)
