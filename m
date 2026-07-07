Received: from out-184.mta0.migadu.com (out-184.mta0.migadu.com [91.218.175.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B11634750A
	for <linux-doc@vger.kernel.org>; Tue,  7 Jul 2026 19:23:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783452216; cv=none; b=sgYN4i87o8mfK06fUt9XZU+tVU8q3JdjvDphG4HAhkBCsU8t7Qy+Te18T+C1DrFFbzv0P+mbGFMf0tzEKpiDqRvEirYaoiyIgpaKyXmTMV0UlYJjf9C5wsOlu2auVGEfGHvjRctt/a+H80XOUw3GHb1uHYvyoTXSZiZH03WXxkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783452216; c=relaxed/simple;
	bh=tvfVPTg3uQ934U2ZkmrytHVd+DvK7QHUy9b9fovHGdk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XoGOTtKkqFLP4RYtZDTLSjJ1a1nTuGA4SWaTTbubFhFHNtooQfJjiLajUZmRQgGaXE9Fb9kdnqC3c8h9n86xze1ClrwNOLon1zF2G5LxvITTeVTGWJ9B98e5PCwsJubVoj/CUAdr5MeE4cj4wyYfFvAJ73fDiiA0jVxq1v6B2lQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org; spf=pass smtp.mailfrom=wyuan.org; dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b=XJoVcuMp; arc=none smtp.client-ip=91.218.175.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b="XJoVcuMp"
Date: Wed, 8 Jul 2026 03:23:07 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wyuan.org; s=key1;
	t=1783452203;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=EDsrPUGKqfjTB8RTfXsXzAwlfJG2kDd7rFmDKhomJL8=;
	b=XJoVcuMpwjebIgsUK/nMkAg6Hxt3WUQvGUe7+/MiRivBbMOZD3Y2dg+xF3tnH+yoO22LUX
	z+90dQ0U2CVpWpuKcr6b6OZqXz7ttLpNgMS+UvUqmN05avRM5YGb+UEaxml1uj+XCSe2sJ
	tFCmUd0uC9YJUb3AfZtKJIqsl3g9vajS35LsdSJqIYoU0uL/bfBICjPKvTgYBGbNmtgHM2
	1SeiVxz0H8owZCu0jNTS8DW/086gHKCacYsX4fQ9eY7aURaXm3V0YaLlZ6MAYBF/OrZxuo
	hpt3YkB9VV/TqTEoZLqSVg3L522KOHTH2yPqI1pwxvcf5eqDB+B9higWbDzE/A==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Weijie Yuan <wy@wyuan.org>
To: Jiandong Qiu <qiujiandong1998@gmail.com>
Cc: Alexs Shi <alexs@kernel.org>, Yanteng Si <si.yanteng@linux.dev>,
	Dongliang Mu <dzm91@hust.edu.cn>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] docs/zh_CN: update translations for
 process/changes.rst and sphinx.rst
Message-ID: <ak1SG5mw7y2UZrvR@wyuan.org>
References: <20260621131215.1303439-1-qiujiandong1998@gmail.com>
 <akn4oYmihmNHFOY7@wyuan.org>
 <akpxuLXKrbN7qB9o@archlinux>
 <akp9kzW3bG_pYLW8@wyuan.org>
 <akuoP6z-GMfbKucI@archlinux>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <akuoP6z-GMfbKucI@archlinux>
X-Migadu-Flow: FLOW_OUT

Hi Jiandong,

Sorry for the late reply.

Thank you for delving deeply into this issue! Appreciate it! And I agree
with your analysis on this. So I would like to adjust my font setup
later to give it a try.

Your fontconfig setup is useful for an individual reader, and it is a
good workaround for someone who wants lore or a local editor to display
such tables nicely. However, I don't think the document source should
depend too much on each reader having such a setup, and that's what I
might not express myself clearly about in my previous mail.

My concern is mainly about the readability of the plain .rst source in
common environments, such as lore (as well as git.kernel.org web
interface), email clients, and text editors. In those places, many
readers may not have a carefully configured 2:1 CJK/ASCII monospace
font. So, as far as reasonable, I think it is better for the table
boundaries to remain readable in common cases, instead of asking every
individual reader to tune their local font configuration.

I suggest:

 * For the first table, keeping "optional" in English seems like a
   simple solution. That row appears to be the only place where the CJK
   text causes visible misalignment, and "optional" is not a difficult
   word for kernel developers.

 * For the other two tables, I agree that there may not be a perfect
   solution that satisfies every environment. I mainly wanted to raise
   the plain-source readability concern and ask what maintainers prefer.

Overall, I think we should try to keep table boundaries readable in
common plain-text environments (i.e. without additional settings) where
reasonably possible, but I do not think this issue should block the
patch. (Ah, sorry, till now I do not even read the patches themselves
yet ;-0

Best regards,
Weijie
