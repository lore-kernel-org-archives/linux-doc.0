Received: from out-180.mta1.migadu.com (out-180.mta1.migadu.com [95.215.58.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AC2F411A0F
	for <linux-doc@vger.kernel.org>; Wed, 29 Jul 2026 16:09:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785341348; cv=none; b=n+pO9owCHsi6FrdJ6H5YR6wm3qx7nyk5xpVDSqpJWGnBl7Fk4nx8nAsXTTHzSHduV32SCjTcHCgp8VMUAQUQCtNXOhCflQOt3zRkqUw1G4ivJNGe6EDp5OToHsiJlKs9BKaAnNDbF4yGg7IA/qvIBQUBMNVrryq7NokRSeFCrfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785341348; c=relaxed/simple;
	bh=OJNpt+XFKz2F/s/xnxUXEHTelo8cISHJOL9dL4VTY2k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V2nol7ebBVHq8OGD7NQJQP8iZqoB6CurcMc2r2IjP7gtk/8vg/7ifzIalWSGvb4QTPVjghDmy69256vMFtc1m8t3S+muTwmDiBLiD0V4bR4BS6LE+/X97f9bn/t8hWky1Z1NK72+OsOfD713PCApRogho5bGqqEf337WBAtsZbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org; spf=pass smtp.mailfrom=wyuan.org; dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b=izHltBI8; arc=none smtp.client-ip=95.215.58.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b="izHltBI8"
Date: Thu, 30 Jul 2026 00:08:35 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wyuan.org; s=key1;
	t=1785341339;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gHJ/CYE5s4aW0Crg/l1eVr6mAI0ZFCoWVcYGZfSY1so=;
	b=izHltBI8K6ouHf2CzQI2GwdzhqHZHMf1LapwNgAfMOFAfGMwZexRZF+P+FF3zG5WU+qC7M
	YKdRcBVThDsbyYH0SomvVi7GVmmfknwySF/NR9hMEAr0CnWK/rpAGO8If3n6y8Zbij2SI0
	IoTsXeGfBeV4awYikFh8ruXXZDOj5sDzU0obEjUpo7VyD0G/yGWXKP3dMbreVLoOvP67gF
	A+bysSDI4IkZTMD0vktJH08EebWZuTaT3Mac4/B/bg1sPElgBrpuBfjnmq5zGeo2eYhhIz
	I+EDgOXw7x/T8J1sx8MVrw4mWSGCLSUT3dHBzccY5PE7fa6ZoZFHCT3uliL43w==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Weijie Yuan <wy@wyuan.org>
To: Chen-Yu Yeh <chenyou910331@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
	Dongliang Mu <dzm91@hust.edu.cn>, Yanteng Si <si.yanteng@linux.dev>,
	Hu Haowen <2023002089@link.tyut.edu.cn>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 01/16] docs/zh_TW: process: localize terminology in
 7.AdvancedTopics.rst
Message-ID: <amolg7NpObNT8Gnb@wyuan.org>
References: <20260728091038.171033-1-chenyou910331@gmail.com>
 <20260728091038.171033-2-chenyou910331@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260728091038.171033-2-chenyou910331@gmail.com>
X-Migadu-Flow: FLOW_OUT

On Tue, Jul 28, 2026 at 05:10:23PM +0800, Chen-Yu Yeh wrote:
> Localize mainland terms to Taiwanese Mandarin (內核→核心, 軟件→軟體,
> 高級→進階, 項目→專案, 用戶→使用者, ...) and sync with the English
> original (Github → GitHub).
> 
> update to commit 5ce70894f6ca ("Doc: correct spelling and wording
> mistakes")

Reviewed-by: Weijie Yuan <wy@wyuan.org>

> Signed-off-by: Chen-Yu Yeh <chenyou910331@gmail.com>
> ---
>  .../zh_TW/process/7.AdvancedTopics.rst        | 110 +++++++++---------
>  1 file changed, 56 insertions(+), 54 deletions(-)

A small gripe: what is the best practice for reviewing a new revision of
a patch series after it has been rerolled?

For this series, I found the output of b4 diff rather difficult to read,
so I had to split out the individual patches and inspect them using git
mailinfo and interdiff. That, however, means losing the built-in
highlighting provided by b4 diff.

In this case, I would say a range-diff/interdiff for each patch seems to
be a good solution in general, while obviously that's not that
convenient for the patch sender.

Perhaps there is no best solution to this problem; Git may simply not be
expected to handle Chinese text particularly well.

I would appreciate it if some one more experienced could give me some
tips. But this series is however quite special. Usually we won't meet a
large series which contains many diffs in it like this.

Then I suppose we'll just have to ride out these growing pains. ;-)
