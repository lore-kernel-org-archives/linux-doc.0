Received: from out-186.mta1.migadu.com (out-186.mta1.migadu.com [95.215.58.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2032B2FDC4D
	for <linux-doc@vger.kernel.org>; Tue, 13 Jan 2026 03:50:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.186
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768276218; cv=none; b=XZ7YeOk1xtvgEhI5N5bcsLfyVQi9uqyLMQyxJeQXjFbsUwRoYVeYmW9wWeoDKXE3CKWnDBWEMPKqlfm1oN5xcOPWTAWpTgV3Q+7195B2wpcincPVpA3OMzOZh10t7mfLx73BcUyzHH5RG2s9Ku8QNp6Oo2/V478nRwfBNeYkfLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768276218; c=relaxed/simple;
	bh=9+1LGPDxQBoApq/NIEvhSmdX4RekmgRP/yFpwVzTCV0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jtiT9bOw74zBjXfxHRXs4D57ruaz4UarCWsvxkKCbHNg7sHH1n/NdlmsYtgnIkQBZPN7vxblts+1mr1JEqpI8ecJVG2W7iz8SsYuWrDJIfzkKYr+htenI6S2cA8+HLKg3ZanNmpG72+aAeIYyTRj98rorTFvyeErk2+NWZxOCq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=q5FZ9zlF; arc=none smtp.client-ip=95.215.58.186
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="q5FZ9zlF"
Date: Mon, 12 Jan 2026 22:50:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1768276214;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ccuHs/PhTi+GRhRHUsSlbq/s7PpYOv/9mfNFn5Q2piY=;
	b=q5FZ9zlFsFilp4zf38MD7SqYTzYkX2j700qDdNMnOHrr1s4gSqH2/e0E5mYLu4lLy/BtSt
	O4voqlRru1XGPp4e6URnHWezxx1pC62g6FDdQVcWggDr0iNdXMb6vSOAolg+2Lsokdne9e
	f7AQeQ63t6cHwIliWq/elIAPYACqgSA=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Kent Overstreet <kent.overstreet@linux.dev>
To: ranxiaokai627@163.com
Cc: Liam.Howlett@oracle.com, akpm@linux-foundation.org, corbet@lwn.net, 
	david@kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, lorenzo.stoakes@oracle.com, mhocko@suse.com, 
	ran.xiaokai@zte.com.cn, rppt@kernel.org, surenb@google.com, vbabka@suse.cz
Subject: Re: [PATCH] alloc_tag: remove sysctl prefix from mem_profiling boot
 parameter
Message-ID: <aWXAaiLXn2tXr8nU@moria.home.lan>
References: <aWMLQkvushKidjQQ@moria.home.lan>
 <20260113032735.161838-1-ranxiaokai627@163.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260113032735.161838-1-ranxiaokai627@163.com>
X-Migadu-Flow: FLOW_OUT

On Tue, Jan 13, 2026 at 03:27:35AM +0000, ranxiaokai627@163.com wrote:
> >On Fri, Jan 09, 2026 at 06:24:19AM +0000, ranxiaokai627@163.com wrote:
> >> From: Ran Xiaokai <ran.xiaokai@zte.com.cn>
> >> 
> >> Boot parameters prefixed with "sysctl." are processed separately
> >> during the final stage of system initialization via kernel_init()->
> >> do_sysctl_args(). Since mem_profiling support should be parsed
> >> in early boot stage, it is unsuitable for centralized handling
> >> in do_sysctl_args().
> >> Also, when CONFIG_MEM_ALLOC_PROFILING_DEBUG is enabled,
> >> the sysctl.vm.mem_profiling entry is not writable and will cause
> >> a warning. To prevent duplicate processing of sysctl.vm.mem_profiling,
> >> rename the boot parameter to "mem_profiling".
> >> 
> >> Signed-off-by: Ran Xiaokai <ran.xiaokai@zte.com.cn>
> >
> >How was this observed/detected?
> 
> Actually no kernel bug or funtional defect was observed through testing.
> Via code reading, i found after commit [1],
> boot parameters prefixed with sysctl is processed redundantly.

When bcachefs was in the kernel, I spent an inordinate amount of time in
code reviews trying to convince people that yes, they really do need to
be testing their code.

Strangely enough, I have never had this issue with project contributors
who did not come to the project by way of the kernel community... :)
