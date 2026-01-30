Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBAAD335090;
	Fri, 30 Jan 2026 17:42:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769794959; cv=none; b=nCrp4dPhNghbd3CU6/kERBGfrEIqKUGN5Mj7SXoxT+fW8gqFXhwQ091FzPxWVzUImBXipesJzjAm6JpnHqjUxM1A4mWBeWVe7yjukAxlvM4fAu3pQhk0Vpxdz+SwGfdsdJLy5AF5Jbh6n80cH7NAh45GuH9nyochS9kiIooPKXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769794959; c=relaxed/simple;
	bh=33CSKcawZBCnIPP+EaHAiuOkVTRWbzLkZ0rTTWQPnyw=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=pXFXRwtnl77RrbVxc58vTQYTh7ilF5ZOYqVq2cic30OPyUyhvGRuECVUNj6TNe+mJlYPLuenjp+IJxQoUtwsxHNt292rErRUwiSq7hmD+PvpKL+4UxhbBmPGi807h9s8gIydi+wFRgyUfDXzEGOupufPYAD47CU4fvXks0YK2QI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=Fkrhr35K; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="Fkrhr35K"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CF28C4CEF7;
	Fri, 30 Jan 2026 17:42:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1769794958;
	bh=33CSKcawZBCnIPP+EaHAiuOkVTRWbzLkZ0rTTWQPnyw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Fkrhr35KAUSisdC86CCcISMY3CFguduSD7TH0Ni2jIkAP7LEOyZlKGIpl2bjP4L9C
	 cD0X8hvn2yKNbMg9i1UrimB75vrHuk3bW5h/kgdmonrV1nDeGGtSuGE7AOFL7x51LM
	 IqZ/cv+ispaQgjdDuEuvLIiK9qNyVUPxdFo2wdHI=
Date: Fri, 30 Jan 2026 09:42:37 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Li Chen <me@linux.beauty>
Cc: Jonathan Corbet <corbet@lwn.net>, "Borislav Petkov (AMD)"
 <bp@alien8.de>, Randy Dunlap <rdunlap@infradead.org>, Ingo Molnar
 <mingo@kernel.org>, Pawan Gupta <pawan.kumar.gupta@linux.intel.com>, Feng
 Tang <feng.tang@linux.alibaba.com>, Kees Cook <kees@kernel.org>, Li
 RongQing <lirongqing@baidu.com>, Arnd Bergmann <arnd@arndb.de>, Frank van
 der Linden <fvdl@google.com>, Askar Safin <safinaskar@gmail.com>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Pratyush Yadav
 <ptyadav@amazon.de>, Pasha Tatashin <pasha.tatashin@soleen.com>, Mike
 Rapoport (Microsoft) <rppt@kernel.org>
Subject: Re: [PATCH] Documentation: document liveupdate cmdline parameter
Message-Id: <20260130094237.6f86e3c5c45e2d3443bcce8f@linux-foundation.org>
In-Reply-To: <20260130112036.359806-1-me@linux.beauty>
References: <20260130112036.359806-1-me@linux.beauty>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 30 Jan 2026 19:20:33 +0800 Li Chen <me@linux.beauty> wrote:

> liveupdate is used to enable Live Update Orchestrator (LUO) early during
> boot. Add it to kernel-parameters.txt so users can discover and use it.
> 

Thanks,

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

but let's cc the developers:

LIVE UPDATE
M:	Pasha Tatashin <pasha.tatashin@soleen.com>
M:	Mike Rapoport <rppt@kernel.org>
R:	Pratyush Yadav <pratyush@kernel.org>

