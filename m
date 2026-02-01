Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59A7E3EBF07;
	Sun,  1 Feb 2026 04:49:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769921374; cv=none; b=RubmaAat88hEMjKyMB9V4oR5RSv5ojR8Jb5t7Y2yQSvwExMiBhqLeF/AThPyAQ6PW+ZkppDFy0xLNOAiXv6wf8XpgRC1G0v6rGakLDDFvagByc2zXRY9HZ/zqdV+r7YCXbcI3XnYANyM7e556Cmo/qK/+6UI72oaPw8lrhlPXwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769921374; c=relaxed/simple;
	bh=ZV8xghjxy5o0qmY5y/IbvW/AF/Yusv/D5oKHq3zd9ts=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pryq9++lVP8IHmV8/cf7YlgTjyRoEjX2+ILl2G2StRhzJ2gJnW/1rIqGfdiKtAr4JE+86eXeW4JOjq30ugm19y0eWYx931mViELSwQs9V9x0PUaok2YfsqKZSW1K00K2EVQ7ssJvKKscU3NjRMCqR5xFfhA5uSoYz23E6F5gmyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S0p4PP3h; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S0p4PP3h"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1046C4CEF7;
	Sun,  1 Feb 2026 04:49:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769921373;
	bh=ZV8xghjxy5o0qmY5y/IbvW/AF/Yusv/D5oKHq3zd9ts=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=S0p4PP3hqCj/Dou4oaU3/1ws5Uq3hwU462DchPk19fc8cRyea1e9fABe0qAm7KoVs
	 e6lsPtPqWuXB0/CVv75gECNi4XVEN2Ma2W8ftPllQZFE5YTkmkDVvpZGuDtBmaZWja
	 3PJZ5axlrjol1sOq5CkGRRzSs2ij6KLV1oA4/QEqm7S8obhy8aqjmdjHar7LYU74rW
	 uAeSETEpdK9LQFK8H3TFlBF1pr5UY8JgmflANYutfHhCQyMvku0KTU1fs/bSIncKeI
	 aCma/pu+zanlQKG3y5cTEQm5XgZPBUO5bu1WFOqj5DxBiwTl9sSzNgJjfA10/MFDpH
	 OG+SWsLCa8F8A==
Date: Sun, 1 Feb 2026 05:49:27 +0100
From: Mike Rapoport <rppt@kernel.org>
To: Li Chen <me@linux.beauty>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Andrew Morton <akpm@linux-foundation.org>,
	"Borislav Petkov (AMD)" <bp@alien8.de>,
	Randy Dunlap <rdunlap@infradead.org>,
	Ingo Molnar <mingo@kernel.org>,
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>,
	Feng Tang <feng.tang@linux.alibaba.com>,
	Kees Cook <kees@kernel.org>, Li RongQing <lirongqing@baidu.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Frank van der Linden <fvdl@google.com>,
	Askar Safin <safinaskar@gmail.com>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Documentation: document liveupdate cmdline parameter
Message-ID: <aX3bsTGatkgnX2bD@kernel.org>
References: <20260130112036.359806-1-me@linux.beauty>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260130112036.359806-1-me@linux.beauty>

On Fri, Jan 30, 2026 at 07:20:33PM +0800, Li Chen wrote:
> liveupdate is used to enable Live Update Orchestrator (LUO) early during
> boot. Add it to kernel-parameters.txt so users can discover and use it.
> 
> Signed-off-by: Li Chen <me@linux.beauty>

Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

> ---
>  Documentation/admin-guide/kernel-parameters.txt | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
> index 3097e4266d76..56a39f6e01e3 100644
> --- a/Documentation/admin-guide/kernel-parameters.txt
> +++ b/Documentation/admin-guide/kernel-parameters.txt
> @@ -3442,6 +3442,11 @@ Kernel parameters
>  			If there are multiple matching configurations changing
>  			the same attribute, the last one is used.
>  
> +	liveupdate=	[KNL,EARLY]
> +			Format: <bool>
> +			Enable Live Update Orchestrator (LUO).
> +			Default: off.
> +
>  	lockd.nlm_grace_period=P  [NFS] Assign grace period.
>  			Format: <integer>
>  
> -- 
> 2.52.0
> 

-- 
Sincerely yours,
Mike.
