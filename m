Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 231D62D0620
	for <linux-doc@vger.kernel.org>; Tue, 12 Aug 2025 20:52:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755031973; cv=none; b=RSc2f5DJG0YXXgn+No4RdmWmk/F1DlGZ7F+lynRRIDRDAxbHoC7Wwpqqir0Ai8USyAJ6w61VjQs+AWH+zBUPqTQT92emBB6XzRGJyOUv27ZJfCrGtMBNF+mAqWTLKLyXA0HLJU8I3+6pBDdtmqRG54+2Gb4BQmQfQbN2wWZuzn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755031973; c=relaxed/simple;
	bh=jSGnmTYL1hsbSTnKzcjU42qulnFdcN0oc+eOfUzqkm4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RNF7jv3zfbOfcmzfL/uIR5SDxqGX9EXPbzMDUTfa99DUq5yYf3i2s4y2wvqXc3FiHWmA69QQ17hJ0m4CPJrWRQgKXIFfwe4B08R6qmfIGBZyIymMW9JhHGIDXAuhdK80nB84q62KHR6Xc/iFaoAF675M9iyj6ur4s1QpdL0VUdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CcPCJ67T; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CcPCJ67T"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 805EAC4CEF0;
	Tue, 12 Aug 2025 20:52:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755031972;
	bh=jSGnmTYL1hsbSTnKzcjU42qulnFdcN0oc+eOfUzqkm4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CcPCJ67TU3yOHHBcb4fcGnGOl16lKeG7Ej9mgzwgxQAn/jek9aXnvCto12Q0Ax1cs
	 /AMd0i5yrOAoZMuaQtmnSz22zUUAuqHIAtAtyBroVsMdjCOvimbNT+2sOIldsfV8dI
	 iP8PdhqZuH3bQrryUCaOW4jAa9+CYl/yKfQpTwfBXrBy6Uj8Yh/T/wy2F7sIU6bYhf
	 0qprmBtyosvEftwxn56FN3bn+eg1mutp15481cpLkO13pxKXENWJEmVum37BqPAG9p
	 4FY7+3k/k1KEtdJxkvptRSDyzXu5Gh1wAte1UI48I4oNK4XQdfcC6t0d7E8qND5onW
	 rOVTceoiddqLQ==
Date: Tue, 12 Aug 2025 10:52:51 -1000
From: Tejun Heo <tj@kernel.org>
To: Soham Metha <sohammetha01@gmail.com>
Cc: linux-doc@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	skhan@linuxfoundation.org, Johannes Weiner <hannes@cmpxchg.org>,
	Michal =?iso-8859-1?Q?Koutn=FD?= <mkoutny@suse.com>,
	Jonathan Corbet <corbet@lwn.net>
Subject: Re: [PATCH v2 3/9] docs: cgroup: fixed spelling mistakes in
 documentation
Message-ID: <aJupoz5mJ9jjwASY@slm.duckdns.org>
References: <20250812201523.69221-1-sohammetha01@gmail.com>
 <20250812204952.73136-1-sohammetha01@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250812204952.73136-1-sohammetha01@gmail.com>

On Wed, Aug 13, 2025 at 02:19:46AM +0530, Soham Metha wrote:
> found/fixed the following typo
> 
> - Availablity -> Availability
> 
> in `Documentation/admin-guide/cgroup-v2.rst`
> 
> Signed-off-by: Soham Metha <sohammetha01@gmail.com>

Applied to cgroup/for-6.17-fixes.

Thanks.

-- 
tejun
