Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.183
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793175166;
	b=QcBPHy68Io4ZR/Wodxz8s99uZINFU2nF3nMOienK9t34iudwgQZpzQc7+8vWTvPSLrlR
	 pvyLuOqRyGSwFSpU1jOiycGRWDYCVIHwa6lT993cT40BbST1WrPvnGlNjT8Nl7RHjPfJI
	 62FPk4/ZoPAtHTCpau0bkGtN0e4891u53OlWK6ov/t26wq6wP0kSopVoj4IsWwM9NciAs
	 dI9VmhS1MPM2qIs1ITrEXHPu+yWQ3JM1YylQDVpc8rLc94oWA7xLggL1Wsf5O+gqr1LEI
	 zlo87DVk6nRGspGIfVowQn6Q11xllvIERe+3AZ0NA/dsfwze2IcPV/0XNEUThZghKqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793175166;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=kz6U7/Rt337UHy9Vo8Jf64vb+wflzdQqSM8NpD3MjaQ=;
	b=m0V9nX8cLMNdTiZ7X1kTVeM7pgq9pxX4MLSI2g++OCXse/6yBfVQd+Jbr2Olba3ku0Ln
	 PIfpozIeR/wOFXhE+zcoZY+6QKpKDlKwUcj/b8jsZlfukPIVaxZ9sYtyLb1uGjBc8+rMg
	 3JLDy6e2y7Nyk42K5usP2jvCyyVdCK9gf2JdBmXJj7JLZUIMSFMMYbPXDlqW7JiSObxpL
	 OueEpVhS4FUq/6Qkps7urQQKMG60YNH9x4X5lzyPGcO2AOa7DZio6zNPsHiGlStiX1I/I
	 qG7f2T5q6u4stnrTmQBnToWSYkEP0zlAP4gfZT+MlnEpa3jnRRNHdICAmetGGnIZHeQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=wyuan.org;
	spf=pass smtp.mailfrom=wyuan.org;
	dkim=pass header.d=wyuan.org header.i=@wyuan.org header.a=rsa-sha256 header.s=key1 header.b=hhfg1Ia3;
	arc=none smtp.remote-ip=95.215.58.183
Received: from mta1.migadu.com (out-183.mta1.migadu.com [95.215.58.183])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA252606A31D
	for <linux-doc@vger.kernel.org>; Wed, 28 Oct 2026 08:12:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CA252606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=wyuan.org header.i=@wyuan.org header.a=rsa-sha256 header.s=key1 header.b=hhfg1Ia3
X-Envelope-To: linux-doc@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=kYJzVb+/y1jUWkWBlGr+eNCtQoMqqZ6PM/6ikyhtDWE=;
 c=simple/simple; d=wyuan.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793175163; v=1; x=1793779963;
 b=hhfg1Ia36SlJEdFDsDpFcZSHp77W4F0D7cPmAZceA++QiJKL/CjEFcYUyMHcRE4361U5GTEL
 xY6r58RRNtjTuCJyMCjpQ3Wpxhnuj7+cH3uoymq9fciw8sw0FK9tpZsySSEDOMSLYj0JfQ5gjDC
 8rKaD0oVqFtCZNSKn1l6Bw3IpPbut3vqkHy6oYZUrL9aP2YjPyg0n2jfDhJ0066K1kAiwFpp6vN
 b7QPKXz34mSKgWgXAmuOXWVM38xDlc1vb52N7SPphKoFOJ0ctlFDL8ZPkPlh5LLCy/smfv3Wpp3
 qPxmynItes+cEKzYmDRjnj7VWvk3liOU99LavaKg4OQKQ==
X-Envelope-To: linux-doc@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 7fa1a44eb70b14e0;
	Wed, 28 Oct 2026 08:12:43 +0000
X-Mizu-Trace-ID: 7fa1a44eb70b14e0
X-Migadu-Flow: FLOW_OUT
Date: Wed, 28 Oct 2026 16:12:34 +0800
From: Weijie Yuan <kernel@wyuan.org>
To: Dongliang Mu <dzm91@hust.edu.cn>
Cc: Alex Shi <alexs@kernel.org>, Yanteng Si <si.yanteng@linux.dev>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, Weijie Yuan <wy@wyuan.org>,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/9] docs/zh_CN: align translation paths and update
 guides
Message-ID: <auGucr4smrSp9g5l@wyuan.org>
References: <20261028034134.4144660-1-dzm91@hust.edu.cn>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261028034134.4144660-1-dzm91@hust.edu.cn>

On Wed, Oct 28, 2026 at 11:41:25AM +0800, Dongliang Mu wrote:
> Several Chinese translations are no longer at the same relative paths as
> their English originals, and some Original fields are stale. This series
> moves the translations to matching paths, adjusts their indexes, and
> removes stale Original fields. It also updates selected translations to
> newer English commits.
> 
> v1->v2:
> - Drop the unused top-level readme_zh label from the translated
>   admin-guide README.

Hmm, so why still keeping these labels here?

[2/9] .. _zh_applying_patches:
[4/9] .. _process_index_zh:
[5/9] .. _magicnumbers_zh:

Thanks.

> Dongliang Mu (9):
>   docs/zh_CN: update admin-guide/index.rst translation
>   docs/zh_CN: update admin-guide/README.rst translation
>   docs/zh_CN: add media administrator guide translations
>   docs/zh_CN: reorganize process debugging guides
>   docs/zh_CN: update magic-number to match upstream
>   docs/zh_CN: reorganize media driver API translations
>   docs/zh_CN: move GFS2 translations into filesystems/gfs2
>   docs/zh_CN: update networking/xfrm/xfrm_proc.rst translation
>   docs/zh_CN: remove stale Original fields from SCSI and IPE
>     translations
