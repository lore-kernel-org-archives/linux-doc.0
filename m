Received: from out-170.mta1.migadu.com (out-170.mta1.migadu.com [95.215.58.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EA0447012A
	for <linux-doc@vger.kernel.org>; Fri,  7 Aug 2026 13:16:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786108585; cv=none; b=rKBgij0YavSDOAjmcbcVnF/6oeZ3ICQcIC2Xtrskh5tjm3A7rNubUTzVtXx3LlOX6L9BYfEL5R+wSt3eiGFpbxsPNkylEaOhzcl0rGlmdwx93KSDppcTD2VBsByEJ0T6Wwz2DTrE/ntygkCiVcOW+T9GQs50fv8jBIlzJBBj5SY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786108585; c=relaxed/simple;
	bh=IqIZde7C0uPzqWPpCx8feV3vXyFXaIZinJPZpy5KID0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f8GUiI/ks2QElglis3wWaLd9a/qsUlUp8FHrZ4MwR3y59g42y80Bnx2q2ishfMtiFwqxd226CBzYXtJU1ZTp855rzYhjsNSzzJ48g81Agw+rxkJl3URqGiXB5roSzv3gcQH8EET9+WL8F3UrVVmW2+zwzmIV71iZwQxayvQXsVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org; spf=pass smtp.mailfrom=wyuan.org; dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b=CfHjl21d; arc=none smtp.client-ip=95.215.58.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b="CfHjl21d"
Date: Fri, 7 Aug 2026 21:15:58 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wyuan.org; s=key1;
	t=1786108569;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WN9S/8uBmu7tHWqsIH8Qpm/JVNEQxDh13r0YudsUqEs=;
	b=CfHjl21dz/p2y5YuC6jFwz1JYY+MmpQCiDtc8IQxuQ3U1tdd4u8+lIVYc53U9Jmb/ogdVG
	dawKpFpRhdy+IkLu7JwTPFjuyy0sb6V6i/9E1WXIVMIg8OU++z+alMzrtxV6awA4daueH6
	FYwCxg48VCMjOg1e48hbyQo1xe2UB/VffqhtGQui2Mfv6I5ng2GjEdAjef5PjJ/fADjPX1
	LG2J1lXnIE96ZIqy1kxDNlItvs0GJ4H2HBkvBATat4DHrnxYAeNEzamteA8lXh5Hz/X4QG
	RnCc6noif4DXd7CORiHq+vfQOsDPNZmrf/Hq7qGImc/BdScV7wrpJlKNas5g9A==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Weijie Yuan <wy@wyuan.org>
To: Chen-Yu Yeh <chenyou910331@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
	Dongliang Mu <dzm91@hust.edu.cn>, Yanteng Si <si.yanteng@linux.dev>,
	Hu Haowen <2023002089@link.tyut.edu.cn>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 10/16] docs/zh_TW: process: localize terminology in
 2.Process.rst
Message-ID: <anXajpIyhBrJybcH@wyuan.org>
References: <20260806181949.65648-1-chenyou910331@gmail.com>
 <20260806181949.65648-11-chenyou910331@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260806181949.65648-11-chenyou910331@gmail.com>
X-Migadu-Flow: FLOW_OUT

On Fri, Aug 07, 2026 at 02:19:43AM +0800, Chen-Yu Yeh wrote:
> Localize mainland terms to Taiwanese Mandarin (內核→核心, 社區→社群,
> 郵箱→信箱, ...) and sync with the English original: rolling-release
> wording with the 9.x example and Wikipedia link, 9.x-rc1 examples,
> stable team now Greg Kroah-Hartman and Sasha Levin, LTS list moved to
> kernel.org, linux-next maintained by Mark Brown, and mailing lists
> hosted at subspace.kernel.org.
> 
> update to commit 46298375477b ("linux-next: update maintainer info.")
> 
> Assisted-by: Claude:claude-opus-5

Reviewed-by: Weijie Yuan <wy@wyuan.org>

> Signed-off-by: Chen-Yu Yeh <chenyou910331@gmail.com>
> ---
>  .../translations/zh_TW/process/2.Process.rst  | 325 +++++++++---------
>  1 file changed, 158 insertions(+), 167 deletions(-)
