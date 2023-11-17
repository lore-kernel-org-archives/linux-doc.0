Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="CB0YfMGP"
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5715890;
	Fri, 17 Nov 2023 08:07:26 -0800 (PST)
Received: from localhost (unknown [75.104.68.237])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 17CC72F3;
	Fri, 17 Nov 2023 16:07:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 17CC72F3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1700237246; bh=BC2tbfdaRf5Lo95YlMn9cKPQvKOIugOE7GjfLAsoqJs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=CB0YfMGPVJjDcFVp29ZBq/m2IjMmQyZkh5MLhbuefp8kQEz/vjVvOQiDcjShuIuh1
	 EX1MN9P5ij+fI4pEveQ673LPZkD59HXOBlvlT3K39LFGkulZTVnBsMzC8rPUQBy28E
	 7YkwuOiL/78eutKo1uYT8hn7mnXafomEUT+lCh73nxB3JmzA10lQUtJ3M4EVUv66wA
	 MJeRz071X1PoPr40zTecL4jq8ra8kAUm7/x8I7MbHFFRU4cUbjXetXQJ8K1CCLbM//
	 29dUrXQ39HETSgLDPxaKd6Ag4ePeuWF3LCokQKrg9jiv8NtC47eWEnJRs0TXcS3gXm
	 o0RBZVZJ6/XFA==
From: Jonathan Corbet <corbet@lwn.net>
To: Yuanhsi Chung <freshliver.cys@gmail.com>, rostedt@goodmis.org
Cc: mingo@redhat.com, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Yuanhsi Chung <freshliver.cys@gmail.com>
Subject: Re: [PATCH] Documentation: Fix filename typo in ftrace doc
In-Reply-To: <20231104103329.215139-1-freshliver.cys@gmail.com>
References: <20231104103329.215139-1-freshliver.cys@gmail.com>
Date: Fri, 17 Nov 2023 09:07:14 -0700
Message-ID: <871qcoxt1p.fsf@meer.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Yuanhsi Chung <freshliver.cys@gmail.com> writes:

> The filename for setting the cpumask should be `tracing_cpumask`,
> instead of `tracing_cpu_mask`.
>
> Signed-off-by: Yuanhsi Chung <freshliver.cys@gmail.com>
> ---
>  Documentation/trace/ftrace.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/trace/ftrace.rst b/Documentation/trace/ftrace.rst
> index b37dc19e4d40..b93f11c430a9 100644
> --- a/Documentation/trace/ftrace.rst
> +++ b/Documentation/trace/ftrace.rst
> @@ -2524,7 +2524,7 @@ want, depending on your needs.
>  
>  - The cpu number on which the function executed is default
>    enabled.  It is sometimes better to only trace one cpu (see
> -  tracing_cpu_mask file) or you might sometimes see unordered
> +  tracing_cpumask file) or you might sometimes see unordered
>    function calls while cpu tracing switch.

Applied, thanks.

jon
