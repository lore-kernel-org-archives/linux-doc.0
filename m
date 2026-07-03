Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E4C7233939;
	Fri,  3 Jul 2026 15:46:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783093605; cv=none; b=uzYN/ZkUUMWPWee0xYMLAWQVV5NRsHu/OnctaXRHJDcPcGdyT5zoPc3AJY3BsVz8sCFqLY3GCztpTxjJzZs6Rw9lO9MxAhO3qPH4ez5Y3NW8unWXFHDO1K/vyzftzWxJdg0Ma/EB0jC9XzwolOXa2Gzzu7VRTRBVSzGsi0X8JqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783093605; c=relaxed/simple;
	bh=t2AV7XvvIaSrSiyF522MIYBAWjerm4xqXkStHEWoaSM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=NvI8hyrq8jXzSuXoNTDLNMirqASKQ87Da5ZeT7Rg2DHV1wCjP6yoJVBotnCGU7A5mqDn2g2Vg0h8CiVE/2IfJqqkUPiI8OHwf3/92NrjA0oAIf7rPSujIq1rKy2q9xs/BF/cUXOgFZDg2zy3bKiYnB6P5Ye74X5mAYTm7LUwQuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AoOES56d; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AoOES56d"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 401CA1F000E9;
	Fri,  3 Jul 2026 15:46:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783093604;
	bh=YhZWGxWhXrmGtv1Mo6NdNVEfe08treNo/Ic1lUDyxno=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=AoOES56d56RyiBtDDRA+nxLwWpZllHV4dN+hQtfk68odoUKs+HRSGxt/1B/8SzjO2
	 RPhHGo4rntq08QuY67qvqHnODFCBOvUS2vazky9CZEKVrLuqKhWecBKnFlJjkWBim5
	 /ek4M2ymARhw2+THJzp2vLxmEW8ru1DpgPqWx0iyF2WdGLESpjn6OB/At02rUfZxqK
	 unGDh+pDrSznROQ8tgkmSfoC6GKZp2ZlnSaTqzof0ZnkuYSRMaC/uBMtbg8OtkKsTJ
	 2QONK2MOUS6IDN5/0+qTP+Xz3Mg1cy3iMx+opdsMDsFwQ+GEZUtBL0tMAshFvM55TK
	 CUV1rjlk/10ow==
From: Thomas Gleixner <tglx@kernel.org>
To: Gregory Price <gourry@gourry.net>, linux-kernel@vger.kernel.org
Cc: linux-doc@vger.kernel.org, kernel-team@meta.com, corbet@lwn.net,
 skhan@linuxfoundation.org, peterz@infradead.org, luto@kernel.org,
 akpm@linux-foundation.org, feng.tang@linux.alibaba.com, pmladek@suse.com,
 mhiramat@kernel.org, marc.herbert@linux.intel.com,
 joel.granados@kernel.org, gourry@gourry.net, lirongqing@baidu.com,
 kees@kernel.org, nathan@kernel.org, linusw@kernel.org, arnd@arndb.de,
 deller@gmx.de, jpoimboe@kernel.org, ruanjinjie@huawei.com,
 lukas.bulwahn@redhat.com, ryan.roberts@arm.com, ojeda@kernel.org
Subject: Re: [PATCH 2/2] kernel/entry: add kernel.syscall_user_dispatch sysctl
In-Reply-To: <20260627205551.769684-2-gourry@gourry.net>
References: <20260627205551.769684-1-gourry@gourry.net>
 <20260627205551.769684-2-gourry@gourry.net>
Date: Fri, 03 Jul 2026 17:46:40 +0200
Message-ID: <877bncm5y7.ffs@fw13>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Sat, Jun 27 2026 at 16:55, Gregory Price wrote:

Same comment vs. subject prefix.

> Add a matching sysctl to go with CONFIG_SYSCALL_USER_DISPATCH.
>
> kernel.syscall_user_dispatch (default 1) controls whether userspace
> may arm SUD (both via prctl and ptrace).

What's SUD again? This is a changelog and not twatter.

> +	/* Arming can be denied at runtime via sysctl, disarming is allowed */
> +	if (mode != PR_SYS_DISPATCH_OFF && !syscall_user_dispatch_allowed)
> +		return -EPERM;

That might be similar to other sysctls, but if an application had it
enabled prior to the sysctl=off toggle, then that application will
suddenly fail in operation if it requires to move the dispatch window.

Thanks,

        tglx
