Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CDD22F43;
	Thu,  9 Jan 2025 20:22:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736454180; cv=none; b=K+DeGd2wsrAb1mcTmANVpofvN6C6yo4WmzYeXJj6X9Wv1s18WLx3MOJjl51U2OOmmYvVTElOopjEVCnhksZhmVi61jhMo/89q6kFHnXYrKA0f9maupLmDx9hhbk7BQp8tssYQ8quc2lY4UAc1fZP14GyYxyhwrE5zfv9O/q/Xdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736454180; c=relaxed/simple;
	bh=WT/y5nxH9jWoKU83FdxRDe68LzrJ1jLjIIqkScQtYfc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LQRT7I4w06sSGs65I1lzIssnqfYMd1rnqqd5w3zmYM4CXzTDLyJkl48q1oO7FoSK5mMLO28dpX1/sCA+PtZfnRL5XMNiS/RWo6/AKNICmEpXdAl9/qMWuEQCQz0OswZyIuFIR06hDQ0Q0pNEFVX6FKylZc9zKrjWE4xnvTBvexs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ICib0IwE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ICib0IwE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 709E4C4CED2;
	Thu,  9 Jan 2025 20:22:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736454179;
	bh=WT/y5nxH9jWoKU83FdxRDe68LzrJ1jLjIIqkScQtYfc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ICib0IwEinDYbAPjugVaqZ8Bh/HPRP/0Oh8EpC/DP0CQ4CxIFCCM1K+4+bEfv80Ea
	 WiVgMUr1QRtsnCFF+93Y6LWZMIQCBHNd7fh4dKREaPiWKcMMO2UFtSw0TyCUSIJ/6E
	 1HIz6Q2ScYUdZPfZOpKm7GsjVAx8juboYZPYGDOkBrQYV57vt7Eo5ai6GzOoi0U2uB
	 Xym1nxNJM46V7PYF6BcpuuwGGLjVxHdv05gykEib+qavLT8yaAbAuQ7rtLj1fZWKIf
	 JDBHCix/qJE/Wb3FymUWo4+cmYSy/YRP+uQwYNmu7KbONGchrAOSOkPpkFCJGxWxsl
	 9gHCffP8r317A==
Date: Thu, 9 Jan 2025 10:22:58 -1000
From: Tejun Heo <tj@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Jianhui Zhou <jianhuizz@qq.com>, akpm@linux-foundation.org,
	paulmck@kernel.org, jonaszhou@zhaoxin.com, thuth@redhat.com,
	rostedt@goodmis.org, david@redhat.com, victor@mojatatu.com,
	andrii@kernel.org, xiongwei.song@windriver.com,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Documentation: Remove the outdated prompt under
 cgroup_disable option in kernel-parameters.txt
Message-ID: <Z4AwIsBkAG05cfBi@slm.duckdns.org>
References: <tencent_50D7C8F43461B5F8CF055C15970A1A36C305@qq.com>
 <87zfjzkc1c.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87zfjzkc1c.fsf@trenco.lwn.net>

Hello,

On Thu, Jan 09, 2025 at 12:44:15PM -0700, Jonathan Corbet wrote:
> It would have been good to include the cgroup maintainer here; adding
> Tejun.
> 
> Looking at the code, it's far from clear to me that the other cgroups
> pay attention to this parameter.  Can somebody convince me that this
> change is correct?

I don't think the patch is correct. The extra comment does still hold.

Thanks.

-- 
tejun
