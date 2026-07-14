Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE6C32DCF61;
	Tue, 14 Jul 2026 02:48:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783997331; cv=none; b=aMGRmuwxYj8oFRZEIDK78X80GuqA7LUaUf30AewzWHjgq6Tfq63E4zmLBYeHB1lwemSif1rb16vbMvPHrehaBmFnfW+wgmBlWYB32Mr+1s184BbvBBDGdSt1Uqpd5GbZqHfF8Xnzni/tTWp4hwXeWawP9iyUhEyoKLWWieZjWJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783997331; c=relaxed/simple;
	bh=WUDKfAlDhMtIVQhiKiih6f06/UR7NrERui5Fi1lWLmQ=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=pVZvSdWsj7kIRirBXH6vBOnrQCaLJurmizgJavZ9YUpPSzGVVhIjcypZl9KuoGADDNr6OSoEBOHzi+gqRek5uzs1dVyTJq36ttoq5WxgZ8sv1UDrGCPdHb0zKRQ8PwWajBb3Br086tq1117hAVDxrIItNGWVOOMNXQFaR9RW7es=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=BnblRKG1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="BnblRKG1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FE711F000E9;
	Tue, 14 Jul 2026 02:48:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1783997330;
	bh=U84Jya8tir3NCQgSRajxy/Vk3F+kF6jMrYjr35gxkWY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=BnblRKG1+ZZBosDU6AIz8KIcPxK8K3WqbEgQXAcBOjFGDoNALaFOHThU1QSZIxFxq
	 veKp+8se3Dv0jBawcBta9RGbooolvp4I850Vskh/GQnWt5+9KJTW7Udzc+xl4Fdsy6
	 9kbgSIjSSmixJ7lXTQjgHq9u8GsCR4Kga2oafSgY=
Date: Mon, 13 Jul 2026 19:48:49 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: <wang.yaxin@zte.com.cn>
Cc: <fan.yu9@zte.com.cn>, <yang.yang29@zte.com.cn>, <corbet@lwn.net>,
 <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>,
 <xu.xin16@zte.com.cn>
Subject: Re: [PATCH 0/3] tools/accounting: refactor delay fields and share
 format_timespec()
Message-Id: <20260713194849.efb65f8099fa06e3e099637e@linux-foundation.org>
In-Reply-To: <20260711173112482SCQEM08VED2PT1pxUYOXk@zte.com.cn>
References: <20260711173112482SCQEM08VED2PT1pxUYOXk@zte.com.cn>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 11 Jul 2026 17:31:12 +0800 (CST) <wang.yaxin@zte.com.cn> wrote:

> - Convert per-field delay members in struct task_info to an array indexed
>   by enum delay_type, eliminating offsetof() pointer arithmetic.
> 
> - Factor out a common format_timespec() implementation shared by getdelays
>   and delaytop, using strftime for cleaner timestamp formatting.
> 
> - Replace the complex sizeof/ULL/shift Y2038 guard with a direct narrowing
>   truncation check ((long long)time_sec != ts->tv_sec).

Sounds great.

AI review might have found a couple of things.  Please check it out?
	https://sashiko.dev/#/patchset/20260711173112482SCQEM08VED2PT1pxUYOXk@zte.com.cn

