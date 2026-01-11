Received: from out-181.mta1.migadu.com (out-181.mta1.migadu.com [95.215.58.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A396750097C
	for <linux-doc@vger.kernel.org>; Sun, 11 Jan 2026 02:34:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768098851; cv=none; b=HJXBaAtRZU9/xK/NZPan+8Rz/dQC5TTOqptzlCTDU0nHps1gyHbwzMoJMNg6qLTo4dwekSwLS16NilXUJGYf/yh+v1GTkVTCn6efndbin+A0AxHrw5nLRC6IHuqkAjfWPREM0TLY9fW9BBn6hvdSQaVzbcIPVgTKECHp4A/5FiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768098851; c=relaxed/simple;
	bh=1tAaQXrIYqNpj2r3re8ZeoXJAV6vsTbX638Bdh1ZBZs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TEdUw/6rf93QfBNkEL5GLT+IZB9QoAsWlqHubfVRv7F0iY2Vb0E3zz2aJRsPzIm3ttSsrV5f4zFBYgL2QtQRQx/pyAN6lmwW6SisJ1iXWK2EcV8v1yj2/1wXb7XEZyGqNNyoOvf6yXcv2Z5O/8Pvy9BeIcxOJ2kr4tgl+4Z4690=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=LeS/cM1u; arc=none smtp.client-ip=95.215.58.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="LeS/cM1u"
Date: Sat, 10 Jan 2026 21:33:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1768098847;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/cq7IxD3DIIiFhsSmoe0bARTECHzyaMLAvMPQNM/M/A=;
	b=LeS/cM1ugGnb/f5grZFTfWuOJNPjVbdRFcUPGaJoXQLwKCq5DRHYdbj0rVXizu1q+oMOny
	T4P1LJHup7Des3tQiG7UQORjN/zkmkZCra2ZWzG6O8jTRw7zPonueYqFLKVwhRPmYS3F+f
	UceqMSYahPgoeXUNsiyl1ZmcsWGviMs=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Kent Overstreet <kent.overstreet@linux.dev>
To: ranxiaokai627@163.com
Cc: surenb@google.com, vbabka@suse.cz, akpm@linux-foundation.org, 
	david@kernel.org, lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com, 
	rppt@kernel.org, mhocko@suse.com, corbet@lwn.net, linux-mm@kvack.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, ran.xiaokai@zte.com.cn
Subject: Re: [PATCH] alloc_tag: remove sysctl prefix from mem_profiling boot
 parameter
Message-ID: <aWMLQkvushKidjQQ@moria.home.lan>
References: <20260109062419.157284-1-ranxiaokai627@163.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260109062419.157284-1-ranxiaokai627@163.com>
X-Migadu-Flow: FLOW_OUT

On Fri, Jan 09, 2026 at 06:24:19AM +0000, ranxiaokai627@163.com wrote:
> From: Ran Xiaokai <ran.xiaokai@zte.com.cn>
> 
> Boot parameters prefixed with "sysctl." are processed separately
> during the final stage of system initialization via kernel_init()->
> do_sysctl_args(). Since mem_profiling support should be parsed
> in early boot stage, it is unsuitable for centralized handling
> in do_sysctl_args().
> Also, when CONFIG_MEM_ALLOC_PROFILING_DEBUG is enabled,
> the sysctl.vm.mem_profiling entry is not writable and will cause
> a warning. To prevent duplicate processing of sysctl.vm.mem_profiling,
> rename the boot parameter to "mem_profiling".
> 
> Signed-off-by: Ran Xiaokai <ran.xiaokai@zte.com.cn>

How was this observed/detected?

My reading of early_param() would seem to indicate that
setup_early_mem_profiling() is getting called at the appropriate time -
and then additionally a second time by do_sysctl_args(), which then
becomes a noop.

So the only bug would seem to be that the sysctl is not writeable in
debug mode? There's an easier fix for that one...
