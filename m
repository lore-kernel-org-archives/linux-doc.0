Received: from mail-lr2-f12.google.com (mail-lr2-f12.google.com [74.125.230.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E879E2DF156
	for <linux-doc@vger.kernel.org>; Fri,  2 Oct 2026 03:44:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790912680; cv=pass; b=Oq825NZMrNbSttioNP/13nCghB+0R2QgfxCvKWNjxJazLSrJWR5kgnfXQmuRhCE/DdK8xcrRJ7yf+pkuiIEx+dB777+GSd70XefTzjkG2kIYcXfGpxDEmYZdvegva1F+8m6mmTPG0k9njNOaHMWFlbWkhQD/Bz9ZBVo+vx2NpDg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790912680; c=relaxed/simple;
	bh=HReWgbpmu+EyMkLkA/hcPWjBoAE+oDWXlQs3CH3gA4w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qiWYxz9ZIHa13cwFca487u9C7oNAbf6YGhf9wLROCoEa31XPL/sIuFpeZw00GTD/+tWoqBcH2H3knP8GR/ZyhcaS/8n4cNRwLfGSyCSX8XryVzLoFxKRHleO4398cxqBSdywiy6WMcQI4UVpsWh51rEKQx4SlgdEVxGarsrn7lo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nz2KgTlQ; arc=pass smtp.client-ip=74.125.230.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nz2KgTlQ"
Received: by mail-lr2-f12.google.com with SMTP id 38308e7fff4ca-3a49e560a98so5189891fa.0
        for <linux-doc@vger.kernel.org>; Thu, 01 Oct 2026 20:44:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790912677; cv=none;
        d=google.com; s=arc-20260327;
        b=iLCOD9a/7woa35M/2ckPYJt9sh5FcP45tvkYDvVNsAD2sNiPfi/EmrZVQ8rUWjB9OO
         9LmRCUGxRVPlbRvAlea2DutE0SkN9ahIldveVmqbmX9Li/as7qR17+dCgpuI3NJqN8D/
         G3NckDmqdbMoUaVDi1ks5aEZi+9I0vus8qzYbiCgKf4EZgbPtYG2PJDjOntLvmMH5NxH
         owbTJMKeRoAL1H9a6ZppoB8rCIJkHnYeQXIe8Sazr3g/jw60D+U4xIsJDx7cdzbiL1JS
         3aL2tmcqGqNDGX2XYjm8hziyuSjkaWLFBbYhm2nE97M/QMT+TfxYL/t0cnASZ0gyVOA7
         XFSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=HReWgbpmu+EyMkLkA/hcPWjBoAE+oDWXlQs3CH3gA4w=;
        fh=ljwB6ZfPEWRtLsr1K1bHYGfwrS3/G/puPvTBZOheaaY=;
        b=pQjRDvIP4qi/zD9pjNvn3I1tddyC9Ca6vHuN1NS40M0uAVMlqrJqfOd/lANRioj5UT
         MzbJlsrUbgzKdUPjIrN/U6HIqJliSVwwk9meU9LNt9gG89gTlbYGsJPlws5hxWOTK7Q5
         WErUR2Tk7glwQtc07VLnzfMd6D7720D2iFnbfCirA9qRBkQz+NgA0bKLjdaMPRDKGvvY
         KZ9xw6gFwDMqPCCylWMsFgkbn1tsJNvz804NymmoKZ/gRRUCpkteNQMfrrzwfYuKhRBB
         UB/Lfa7jRjf0MU5xdq6GUsLPa1pGpf2GZoQwGX4mIhX1ggbnEwQmvivPwHkmr/ILzFHR
         trKw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790912677; x=1791517477; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HReWgbpmu+EyMkLkA/hcPWjBoAE+oDWXlQs3CH3gA4w=;
        b=nz2KgTlQQwOk0jEhd1N/BO1GDGS+g9qJaynBe1mXXsqOX8hXonAtGNmYaHPl12cUtz
         5yYU763JSB7MA/njhiKvAFC9J3ij3WDVvtmED4S/FVMi/DXoFxvJzoSYLeo8K/7+C5UB
         uvg8kOKTNsvxCwf+pUuFoKP7plANgrA5FUEaXsnR1j1IRIL34M7u6Gr5BymKY5MaNhgr
         qM+HV3DLhEDK7zweNdTABzcH7/SPyGemSzkRUCXCAhoKrek1yJE1C1CokT/VxFstr1vA
         Sn38G+6uWODXjzuYnhVoiUDRW+6FjeJWw67G+bnR9HZaa1JervKOVWDpcsr529ZocQcp
         q0Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790912677; x=1791517477;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=HReWgbpmu+EyMkLkA/hcPWjBoAE+oDWXlQs3CH3gA4w=;
        b=qpYPFs/9LTfpL+VudANLpRdpju1hHzo9FDM/1DSGYbW4MXHXOJWqoKsNXno+xSs2bF
         VhVBQJ+w9QdDsZlXsd0xhvq5L4uaFsJYl2FKaolS8/Nf9Af3xjVNC9VlIwlJd4zPrcVe
         6mdN0uvG/FEkaPoy3zMH6s2NeQHMvK7PQVSU0XTzTWw102bLN6vRDU1qmOw526P1uFSB
         Rm9J4M6lIFYODKAPKGY41O9Ti0I7VRJQbSp9UG14Z6vIWwvgAsJpt3enTWJviw5/zUE0
         3DjK8pxfJMyTiYMVjhYZK2M/tzNOpBtJZ7dhBbQJ/9tOZW7oHvnhGdb41XA7OOKwyu0r
         XsHw==
X-Forwarded-Encrypted: i=1; AKwUvBxFPMY2AXlpeDDbfcdUCOKHnVDB3AKZB2ui9A7CJ+ZjMc7YgSCaSeKyp8lrU0LDNdM1J1yl44rf4gU=@vger.kernel.org
X-Gm-Message-State: AFq9FYK5WlEmRgNN3eQ5Km/6mwLFtt0alT77bEyCOruclUyYkgKJg9yS
	ju1wfSbo/nkog4BdQsIjfnoWlUbhzWyr6lCdMweLULP4wqQRxO0KYYPT070jlvE6GNG4TMUlEUn
	fOvbG8JOQ1+MQy8oS94ZD0uvIxsQYEU4=
X-Gm-Gg: AYBFou0e7SpIv3dyjSdAZA9bQ2ZUHpv90ot10lVd78169d1naCDKpdee/2eWhu1x31s
	iYe9uffVt4Cr5cI5+ox27vjmDBQuOxPz5ICWq6ukcQv1UPQwFiQiScLZBSqCzKdCbt0Yh/qo+/d
	FsgF+pS62D+b/WzUKKWn/+6sLdkV9a0JFzCn0CUGWU2s0/y/eNZknUFSPplROM6yCVcHkWdn7So
	rR+e/Fa4Z2Xrsu8Nl/Kn+BXO+a2YjVZBaSeKcMdBpzwNEctt7LqUVOOpRF3vLCnjdQD2edupVjv
	aTdQXWARVAw6Gx/bxbPkn5+URoJdtfYsT8h6O6++oXOJVAySUwlSFJeEY6JAmZ/V5zmZjWRLDtq
	WQV21K4O4q9j8AmBLvY05iI0q03KG5JKEgSQG
X-Received: by 2002:a05:6512:4011:b0:5b8:ef9a:40ba with SMTP id
 2adb3069b0e04-5bb9bb1132dmr353216e87.4.1790912676690; Thu, 01 Oct 2026
 20:44:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260929131020.266120-1-chenyou910331@gmail.com>
 <20260929131020.266120-5-chenyou910331@gmail.com> <c719c6756f345c6c39db483654578ef09de1948f@intel.com>
 <CAKspUhKCpXGKb7zpz9MbtpixVMUWKXMJtK-z6CcrezGA6e+ETA@mail.gmail.com> <22fdd310dfb0946bbe58ed71308e58d936cbed53@intel.com>
In-Reply-To: <22fdd310dfb0946bbe58ed71308e58d936cbed53@intel.com>
From: =?UTF-8?B?6JGJ5a645L2R?= <chenyou910331@gmail.com>
Date: Fri, 2 Oct 2026 11:44:25 +0800
X-Gm-Features: AclHuK_Dh5pXV_8N5Am6Vpr68aVyRU0--ZbOln1WgpOW5_eCBnb1L7DMrifY0iE
Message-ID: <CAKspUhJRG1hh7OQQh3a9yx9pRbKFOOMmhghhvxpQ3UKRob6qgg@mail.gmail.com>
Subject: Re: [PATCH 4/4] docs/zh_TW: add missing :Original: fields
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: corbet@lwn.net, alexs@kernel.org, dzm91@hust.edu.cn, wy@wyuan.org, 
	si.yanteng@linux.dev, srcres258@furdevs.cn, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Vegard Nossum <vegard.nossum@oracle.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, Oct 01, 2026, Jani Nikula wrote:
> Oh, by the way, I do think the series as a whole is worthwhile cleanup,
> and having the :Original: fields is the current practice. Removing them
> should be a separate change.

That makes sense -- 4/4 only brings these four in line with current
practice, and whether the practice itself should change is a separate
question. So I take back what I said about dropping it.

Thanks,
Chen-Yu
