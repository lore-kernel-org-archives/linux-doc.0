Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794229831;
	b=byqRApQrXOmOOSG0qn/uuWXxccQaELWI5VsbIU7/lOyXtfS+hjRzaLvUTOSTECd0BS73
	 /SWrukiuxFnNH5Z1MiK2r8UaM5A388wBsasUun19YfHmPujpSW+96a+EiISyXkVNsdHDm
	 Wu4I/5wRW4y5KM3qIzBv8zKDggxeLJrwv84U0Kf4Q9OQ/hOGXeVBQy8+x3vA/fVGJ2h64
	 rQLYZTOqHPoGftxPjKBPSotM7bsJfYrxFYDLJBC1bKvOAns8WBTfFrbsFZSXPfOF4iHg7
	 L1kXFsd6LsVZipzVxOVB/jvI7nfAW2KAVm1IyRceRKyyhpAq+SygLQPFPwzx/uMzD0Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794229831;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=WRU/Av5eldI6iBEWFvzMDPRqRo/XhSbuYOl5jHiIpcE=;
	b=QNkiGKM5tJkBvuSawzfd9W1cRZc7gsvHpCxEYvPJ2m4URqh+YLV/qK/FjETg8ygflR0z
	 A4AMO37c3AGiKBoMFNyj/pj7sDZYgIyJVFlXwvbXOWonIpKPeKyR/yRoSaVDj2SLhBoIH
	 yMqPwNQRVhfbQXc4/TkXFFEbhNbw1+zBfg6eDzU/UMeYqO4YCaLpiLENdH87E39wLex2i
	 XjYTF5An7Udt/5I5UI+vNSLgca9g0v1fjrDAM/bSBfcyFQ5nXQpz19qe/yaxRfKdmVuoC
	 04c9UmHqz/WwWq8CcLMMaCsY4xV0PWh0sYJEcuH15sgw2dCE1vxtbQLaCgJiPEMEwOQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OWlB7agj;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.41
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74E82606A331
	for <linux-doc@vger.kernel.org>; Mon,  9 Nov 2026 13:10:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 74E82606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OWlB7agj
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5c00c727a21so27262e87.1
        for <linux-doc@vger.kernel.org>; Mon, 09 Nov 2026 05:10:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794229829; cv=none;
        d=google.com; s=arc-20260327;
        b=L51ThaDnJpOU0sQu51+TI7+NxSvmYZoaY3KbCBENPqlJ8OyP+PnznXXw//mOuOtu7S
         CQsoxkrrV+XNA+uMZbyMN90VofFKgXBOlolih+upXDCeTxclkKqlwB/k9hln0wVvXFiP
         yFc9Fi2Lz+3wQt0UAxLCmJH5jN9Heksh0aFF1e1Di2HSpKtG6VPxIQZ6VL1wA1qVtAzA
         7Bo+5gXHBLSlPVj3x2zKfdtx5XudiYu+i94oOcu1yY/Vx5mvFwn1MzGlalP3TCaQ6Xjw
         NrTodwTd2Wp5ROdifVpz7dNbFwxELNJaRt6LHQc6zXyT01dCIq6f/20fB+A9rS6jAnJ2
         yLmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=WRU/Av5eldI6iBEWFvzMDPRqRo/XhSbuYOl5jHiIpcE=;
        fh=DSrMatGgjJgtZN/xUvfYdYGT4HVBo8PV8oyLWgGQ5Wg=;
        b=fe3v85GXuGU51JsYJlQpY82L1VqtHh6YogWYTkcKdz60NPjg/tZE0HjZZj6HwtUG/V
         L4uMfRwa2Zh2CAYYRXkP2CLBLNsa480h2ByEB0UmodZYiFlbmioT1iz1EddrEIvLNJYg
         0jJbw5deNEQLWrf4WUMc5VhGYFC9RgdKqy459Ggm3Tj7Wm6dr8XIuJPMnpMcTsB9yBD6
         DrReJr6K6z2Il9XEz8xFE37qnw+qSdlmMzlbJslir3xS9GhYP/xfg8iQ3wJige1BBMzS
         c1pKvlbdb4hv9ayL6XX8ajRHvsA6uDO5O8av7BvvYv+RXyi2MakGDTRVhIIB1rp2XMEW
         wZYg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794229829; x=1794834629; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WRU/Av5eldI6iBEWFvzMDPRqRo/XhSbuYOl5jHiIpcE=;
        b=OWlB7agjWLGk2gaforKWuj81KLHu1B39NUBWnL644JkcXDk1P2lDIwZjzEtgbRoWol
         kqNKHR+rrkkuRnBgfzHr9kpFWjUNAfLV4PADbSPrctLUpg1w55dCXhSq2iqO3mvtzrAm
         KOxAdt/DZP+2NfnJpkFNhswvVSz8LQRpY9Hu73dY6h+32y+iAkXYS3a9ej+GdK5flPc6
         iNyOI3WvGShV6bpO1SMEAassRwC023rBjoxN3+S16Sg3xlsQJ2hogUv2vxb4yVC4CxrU
         xrgx8SgADUnkY1i6tXaYEqL59YvDMoI7n5omgHoqkjHVs+gLDx8pz1jA6cGLiZmCO3ac
         pKOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794229829; x=1794834629;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=WRU/Av5eldI6iBEWFvzMDPRqRo/XhSbuYOl5jHiIpcE=;
        b=jqMwTvBustfiqdDcXH8TQeUu/EVpNhRwX64ycAEdyfyLzN2N7BmAvhh050yFgaGFVx
         G0nbOOEVcCrTJe0zfgh8pLWbepJVG2F3dFbEf7X0qQQdGW9/EhmS5e4Kxg1B6OaMfrC5
         /TEzsmGhKF/EAobHOiTNv0Gm90UTQb1Nr8uIQyElZnSR8/i/cBGOLJbI60TTQZGIpyTr
         R+Qgx46uV1VWlEeiYF3hzwD3FOdYYCFg5BUQpr1FvqyJ/PG5qitRFJdCPXRXBvxUUpEh
         QPsitr/O11J5M5SbyBbMukSsXXJ/1vgzUu1kihST004eQRXDyy31WbxMPXNvgnA/zH03
         +9NA==
X-Forwarded-Encrypted: i=1; AL+hErGTnjEb2YnvcBf7TVxTBIHdlvMoVveVS7I8ofNYJE65r3vwKWlSBPdPhDggFSKX/jenryqnMNYrV3A=@vger.kernel.org
X-Gm-Message-State: APuU4Z9mjIWx2L4SjHf5qTX85ZnpqPNQhnLvGqp0pxn4mk6sY7B7NYWt
	/PTvKxxO4pixzhdtmbTx2uy02oRfzWO9DrvLZB1aOPCc7dHm3JRYdoRtqtZPMpQzRE1a9qPuRbR
	XTAjmi1km9qUzolfHg389M/hNkyDY+hM=
X-Gm-Gg: AYBFou0GwZDjTOMp1zLZVNCn/cL1b6dkK4IqwQ1EvDWoYVQoNtP3KG2ktxztFqtO97F
	oGqSVrCkBu2Z3zN5jR9xjEEaLkwMgBEpeOkJD8u+UH74bRvyaYzdp+8xEQoc4zX+hkhjcH08+Ub
	i9tv2pIrJcvxeDGvlZlzrZ8pii0vzs4z1pSVxM6rrTbVzdIhlsiPZSdbHQX6Fs3bPp66hdoYnao
	tHUzXAIQdZkwfm/q9ogWHBsRU8wqrKg+53TMIvyMqmHbISqXeO3iI5bLIVk1Ee0FR++iGw4Sqp/
	t06CHvoTuy4t6ct8Y4ZimZQfVn4SV3U1BBPVfayE9G3xeJMaSrOGBPQd4v8WJVrH72wiFJO0gAH
	T++JJ16w20w9aGswId3oUfpk62a0eerTniyItDk22BFV6EhxJrr3Iy3mKgSyiFoEgEGXp8kR2de
	n84oMOWGc7VIeKDMO3e261zRRpl+xOI8e67ySdoP3Ojh5JoFEtfQ==
X-Received: by 2002:a05:6512:651a:b0:5bf:ce1f:cd22 with SMTP id
 2adb3069b0e04-5c14bf1a47bmr1514981e87.0.1794229829330; Mon, 09 Nov 2026
 05:10:29 -0800 (PST)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261106113545.708896-1-chenyou910331@gmail.com> <3bbce43f-476c-4a21-8da3-2be98a696e9c@hust.edu.cn>
In-Reply-To: <3bbce43f-476c-4a21-8da3-2be98a696e9c@hust.edu.cn>
From: =?UTF-8?B?6JGJ5a645L2R?= <chenyou910331@gmail.com>
Date: Mon, 9 Nov 2026 21:10:16 +0800
X-Gm-Features: AclHuK_03ccXXizffE4OAP75MLBYHctz6Ol7u1jIuG3fnh6PAcKhACPLB5mkQ6I
Message-ID: <CAKspUhJVs7A7GrhXEw8EoAmPCvv8+pu+EWXzCMaYRTru4NA=4w@mail.gmail.com>
Subject: Re: [PATCH 00/13] docs/zh_TW: process: add translations of 13 documents
To: Dongliang Mu <dzm91@hust.edu.cn>
Cc: Alex Shi <alexs@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Weijie Yuan <wy@wyuan.org>, 
	Yanteng Si <si.yanteng@linux.dev>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> This patchset looks good to me except the newly-introduced top-level
> labels, which have no references.
>
> tw_researcher_guidelines
> tw_applying_patches
> tw_pgpguide
> tw_changes
> tw_deprecated
> tw_kernel_docs
> tw_maintainers

Thanks for the review.  Nothing in zh_TW refers to these labels yet, so
I'll drop them in v2.  Once the translations start linking to each other
instead of to the English documents, I'll add back the ones that are
actually used.
