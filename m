Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4784538C412;
	Wed, 12 Aug 2026 18:38:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786559886; cv=none; b=ZfPjVTRKShW1W/Aoduxegoe50vQUbSaqf+jYBHkntfJ+qsUNCoKh2SYW606SsxMdyaT+LEZBEPQ5dlw5Ot7U+m4HX9osMqZr0lwCzglB8Rn7pJiCmwW5vNJfz8o8lRH26dZBFZzLWpwJXamhpd1erxJlYt4Q/PA4qunPiW8LNNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786559886; c=relaxed/simple;
	bh=bH75y8ORNHjWT8XGZef5t5nax/VdgOcLmzO2EMWc+R8=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References; b=pk9WmPqqrWVbwqEpCKpRb0MeJtTSzZiunFgdNEcReOVCYYt4QtJRsal8QRdv2V5XL5IU7ZhEcK1ItBANOuyUiBiWX9cAEAk+m+6jirMQOQTJyKVlN3lnW712YA16wSVXb8lVSjWkWZ2kdMjxiSKnk1xsTpDBCg8t4yq9wkVVGWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LwRSrftV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LwRSrftV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A33BE1F000E9;
	Wed, 12 Aug 2026 18:38:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786559884;
	bh=T5Nf/MQZzOv9KpbEhLTg4x9IQc9PfaRZcRM6REH1rnc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=LwRSrftV/lzvZxtJl1tZytN6nXtziedCWU1Oja9t/wFV9FXK2AWnC1SFyRZtBIj0W
	 aUHZwyjyh8FT/r2qVQ1xrId6FjpavZyffwPsL1EHAUYjNwxiTBJsutbhT4mQizUC5m
	 jum+JMxMQzQkKAUOXjiw3R1r11q1qpSJai/crTh8KhgJK8HtlJS9cLPJV+f9xbM3Ay
	 HqozNYMZKt/d6X7tmm3GPWS0vmo6ZFo/QyuaIOwEmP5Np59S4y8/jjyd7XDgYNwmLy
	 ei6jOM9JgApbzU3MBka4sO+VEHeRYqKzB55kh5qRYfjgj6+N1/JOiBmR/LVrxOXZdQ
	 twXCiS92+UIoA==
Date: Wed, 12 Aug 2026 08:38:03 -1000
Message-ID: <90ea8b2cb41fc31ee78f7ee6e5f4a526@kernel.org>
From: Tejun Heo <tj@kernel.org>
To: Tao Cui <cui.tao@linux.dev>
Cc: corbet@lwn.net, rdunlap@infradead.org, skhan@linuxfoundation.org,
	arighi@nvidia.com, yphbchou0911@gmail.com, jpiecuch@google.com,
	ihor.solodrai@linux.dev, suzhidao@xiaomi.com, luoliang@kylinos.cn,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	cuitao@kylinos.cn
Subject: Re: [PATCH 1/2] Documentation: sched_ext: fix events sysfs path
 and show_state example
In-Reply-To: <20260811073801.342165-2-cui.tao@linux.dev>
References: <20260811073801.342165-1-cui.tao@linux.dev>
	<20260811073801.342165-2-cui.tao@linux.dev>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>

Hello, Tao.

On Tue, Aug 11, 2026 at 03:38:00PM +0800, Tao Cui wrote:
...
> @@ -153,6 +153,7 @@ detailed information:
>      switching_all : 1
>      switched_all  : 1
>      enable_state  : enabled (2)
> +    aborting      : 0
>      bypass_depth  : 0
>      nr_rejected   : 0
>      enable_seq    : 1

scx_root->aborting is a bool and drgn prints Python bools, so the actual
output here is "aborting      : False". Other than that, looks good.

Thanks.

-- 
tejun
