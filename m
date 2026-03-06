Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CC641607A4;
	Fri,  6 Mar 2026 16:35:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772814939; cv=none; b=Ds4HZzF/6zEE2vyyCmeXXb68mWYbRMiV+sb+4hbqXK9vFpt04Il8r+pFzBGIE3oa2PMqcMOoZkIeEhDTEz2GWt6LIy6bGAodfhhlaaLTQp2l1K9WI+JcJU0VRrIUE0dKd3Hr/wikz7p+Qc1b2BAR6h5LSVYohZ2vk55m+A8yfpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772814939; c=relaxed/simple;
	bh=JT+RFfTayO5DShJukirFxUaq0lwtYyL+1kZfRbdneeA=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References; b=e/gdCLCDAXoaNYIvMbgUFdXFWnJ9iXs8YktS6w8gRTygBlI/+0dmzJ9Nk8KhvQAomqHskAxSLxeFvaRhZOTTpUxKnLYHC+kaodWEG//OmnT0WOtzRnxwuet62YqDW0/cFyI24aFbKL4ZNqG7EtvAOizwaNOXy6RaeKmDecLhBmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kAdE78ju; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kAdE78ju"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63429C2BC9E;
	Fri,  6 Mar 2026 16:35:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772814939;
	bh=JT+RFfTayO5DShJukirFxUaq0lwtYyL+1kZfRbdneeA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=kAdE78juzs/FkK3OM6WneL0WJKUF0XEb4cZR3yp2qbO82lZXI5tH4DyX8/2cLTXvv
	 3E4VczoXDtOiSwIvQN918Evq3f2zNK/6rzlXEyxl7bOXv4MLqt+EHRyCSGoPUsx1xN
	 9yDGg52KNgHGYrg2V04iyhBGd4awRFCkWLbs3YHdJKtHKcw1Jp+63mRYEkSLB/gfSi
	 ieh/vqzGQtaxAqpnSykNsRsFVTxmRVYWG2pOBneZSFIa5iRtNLkNaU7gVKNrv6nCp9
	 rBV4RtMMs8XatOo1eptHip5+kWsuQ6wU3KAT91ZALbS883MjUsHIrzYSzANMpWHWLT
	 7lQ5nJU+oZ5dA==
Date: Fri, 06 Mar 2026 06:35:38 -1000
Message-ID: <c33dd1803efa86bd4e8e03c8a59deffc@kernel.org>
From: Tejun Heo <tj@kernel.org>
To: Christian Loehle <christian.loehle@arm.com>
Cc: corbet@lwn.net, linux-kernel@vger.kernel.org,
 arighi@nvidia.com, linux-doc@vger.kernel.org
Subject: Re: [PATCH] sched_ext: Documentation: Mention scheduling class
 precedence
In-Reply-To: <20260306103051.1038604-1-christian.loehle@arm.com>
References: <20260306103051.1038604-1-christian.loehle@arm.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>

Applied to sched_ext/for-7.0-fixes.

Thanks.

--
tejun
