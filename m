Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82F8D883F;
	Sun, 11 Jan 2026 02:12:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768097572; cv=none; b=jRFR4rO7ijWkFr2L+3LFd0GySKPHxm2YpBgECmPZgLFvEcCjLayax9OcwxnbUhnA/K4MLrbz3M6kGd+i++bxg7d/YdtVPkbret1pHPA5/0m7x/UD2qMN0WF/C/Dhf96ffa0TH9JqaWuEiNTPyqvPLPCR9LClNl/7GgONoWRZXms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768097572; c=relaxed/simple;
	bh=lKv7dTKmsmPzbUbXlyvG4jikBT3XnIDEBzDSFJ5GSOw=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=sM873mK7yWfc+LEjQ7V3gqLiL0/igrq05Nlx8xdjn/xyLvpLDorSWiWiAixGht9ki/bI7gC9KjHz4NqWoq9U0qo3xR+DKzaZdCYqKDLojFDfv5SFeZnm0PO8cAN/WKWhBTYxGZbWSMR8Ez8c9DmyfCj18tFcHxsRqw3oTHSAkmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=0KUqpSQx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="0KUqpSQx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99609C116C6;
	Sun, 11 Jan 2026 02:12:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1768097572;
	bh=lKv7dTKmsmPzbUbXlyvG4jikBT3XnIDEBzDSFJ5GSOw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=0KUqpSQxHtzpnLJPWAGB+So7Bw/iZVr7fy5J0ZRU0Cyo1jdy+nEC3toM6g64FvHk4
	 VDgF3d7447QzWOBU3g5WmLRsZmGXB8TvEYlEjYuekV/uq8TpCdnEzQ7GOqNhLStwCN
	 wEnUb52wC8HgIZgDz0V/JA5SkIkptBkWXfOMTHns=
Date: Sat, 10 Jan 2026 18:12:50 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: ranxiaokai627@163.com
Cc: surenb@google.com, vbabka@suse.cz, kent.overstreet@linux.dev,
 david@kernel.org, lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com,
 rppt@kernel.org, mhocko@suse.com, corbet@lwn.net, linux-mm@kvack.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 ran.xiaokai@zte.com.cn
Subject: Re: [PATCH] alloc_tag: remove sysctl prefix from mem_profiling boot
 parameter
Message-Id: <20260110181250.429195a2afa08ed61b5bbb4f@linux-foundation.org>
In-Reply-To: <20260109062419.157284-1-ranxiaokai627@163.com>
References: <20260109062419.157284-1-ranxiaokai627@163.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri,  9 Jan 2026 06:24:19 +0000 ranxiaokai627@163.com wrote:

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

Isn't this a backwardly-incompatible change?  What happens to existing
steups which are using sysctl.vm.mem_profiling=?

