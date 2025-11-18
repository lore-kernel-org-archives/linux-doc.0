Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 153B2368288
	for <linux-doc@vger.kernel.org>; Tue, 18 Nov 2025 15:59:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763481591; cv=none; b=ZYn95nlgCutFwQwPWxUXKgrdII9qKfEGjxbxbYDg73cVPY0h9Bd37lSpW6x2QzUk/ygl+fU4fmhBIHoHojJnybfjbvGO6Ng8o098xJAeQkbewTM1R8XvHEWJM287pZM2xdd5YZf70Y8oCIMzfUrswqnwFGzmgA4ZITA7unXd2H4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763481591; c=relaxed/simple;
	bh=QCkD8d2HX5temq0Rl9bOMIilfrQLk0hv8G6GhqRjUe4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FNoZqP37avzldqIc/LEeuLWzFzcgQ85BfqUsK3ZbWG7s9QQP8z3vY/V2vU7KAGHSOz8LZJnzjY7zIawvpDYlJRKLnG+OsI68kRXEvaAI2pbyBR2FHWVQrD///7JrIwbDkXbiW3B5qpoKmxxx9UTAJyFypJYciuDi+6QnrYAZANk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Ix0y3WMJ; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ix0y3WMJ"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-297f35be2ffso79120055ad.2
        for <linux-doc@vger.kernel.org>; Tue, 18 Nov 2025 07:59:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763481588; x=1764086388; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KoAq4ZOnT/rp2A2Dqykoq7B/YkJy4g18nEwG9bbgTCo=;
        b=Ix0y3WMJOKYQTn9tpp4v/vwfmNUfSa2sKhoHB1sYI6xsYKSILuG8uMm0dzBQSk8Q6W
         drpD+m/JOcaoEsQyIXTdrvRP6Jz0T3ao/U7vrSWXmnesYhT9mNONtIZdC+H31cH69HpK
         NCodV0Mj09fWTpwa2itqGgRriePl/iENi7mZxEqkX81dx2xJNZa77azPKYhNl/D46BK8
         h3J4UePfBpzQolv1ttpZyLbTyLvXlqUIScgK4/sy/djfTePea22Gun1hhMUm4pblAak6
         WX0H5h3JH6aos2LugXo/ISIDJEKnzvyhkP+qPb47yWlXqQKRCuwztPPcJPJ662sezUND
         YjYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763481588; x=1764086388;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KoAq4ZOnT/rp2A2Dqykoq7B/YkJy4g18nEwG9bbgTCo=;
        b=haIzFqrlk0KbbjPBWOpw8iYS+2EExpdbP7GDm+AEmwI2hV0/24Ye8mVJZVViVNYcjd
         SO1vV+wNeF9YZz45xy4gA+I0RJlfeH+sEa9ZZXA6g1KYSXU/zX5Ra+I+8S0MSwXwaois
         bppRKL4xp6h/LjHJO9uLOgvBc4d1O/xk5C8/puAK+Pu/Vtf97K1VOhvxJ3nZOy+Q/5+8
         hlcPWZf+kY7nM08s6q12SCtrG6uss9/t1lKxvsKKJ6Pa4xSObULJm3561XjO0DastkSt
         vDKGmk/renAHMe20LsBW3DtbOATbUYIaIfQmew8SVx4Q6pVGRF3fTp7Zyp5z9NGadXna
         O/uA==
X-Forwarded-Encrypted: i=1; AJvYcCUNBGSo/H5sD6hHBFJ7InL79EkDflxw5o9clkXZamrhSHwMs9wfXbxuHuzWYT5+XwEifz+f2ctUlZY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwgHATxYkNzieQPEQ7tbwRgVJRclFiG7PLZI5UqaKMSg9gZat2E
	UQkt+jaYvgr1RLfPXyakj9LmtoXS7Tm7RgsIAhEUS8FnLPCtr3sa3Chlmyb7TKNpyTI=
X-Gm-Gg: ASbGncuOj+beCMyjPqp8TGHQCsLiVHzwO0fA8vIkM4Ty4L5ebKptSTGl4BZr2+FjeRc
	2muI75kmRDfItd7HGHUdJ5/LUGURbx6ZGItfZA0BoaxWMf3qGMnBIEf4FFbddSbFcnrrvluvhHK
	kYm0jSoN19nGfcSl1yMlxZHR+KN+TdkxLAVUUi+5ySqammRxbRzvYL7MUYtEyDpWgOfGepiCgF7
	j8PKvbkbkFjA28S3xdptCUltrr1RSjlbGtR+tU6AiqqphFeLSkz0GLLQmqO9I0dH3Uquw+zrfWX
	2gbsWNwbgS0gDiFt/I/3gNiQmgUoyU4UCLQEB1/zftFt8HI5tL30pwUIxepPQh53/av5r0Z4a09
	MvgOpS5yLR9MfnTJ9zXdj9w7p7ngx/rB1018h4VU4zN4tkHxB916CdGuoxkE9dhTWyRLX/q1y5p
	n4iom8voetN7JXf1NiOcQeVIxM
X-Google-Smtp-Source: AGHT+IEahplMq1XGZhU6h+/qGLbY8HO4nkNbHfdqTlJ5mF/D+bvz3FgFZjG7PWcQsGuNCS0ImKNuZQ==
X-Received: by 2002:a17:902:d551:b0:295:9db1:ff3b with SMTP id d9443c01a7336-2986a6bbdf2mr208106695ad.6.1763481588326;
        Tue, 18 Nov 2025 07:59:48 -0800 (PST)
Received: from p14s ([2604:3d09:148c:c800:5650:f012:168c:76e0])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c2c0577sm178835205ad.78.2025.11.18.07.59.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Nov 2025 07:59:47 -0800 (PST)
Date: Tue, 18 Nov 2025 08:59:45 -0700
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Daniel Baluta <daniel.baluta@nxp.com>
Cc: corbet@lwn.net, andersson@kernel.org, dan.j.williams@intel.com,
	cedric.xing@intel.com, pasha.tatashin@soleen.com,
	kevin.tian@intel.com, skhawaja@google.com, yesanishhere@gmail.com,
	taimoorzaeem@gmail.com, linux@treblig.org,
	arnaud.pouliquen@foss.st.com, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
	rdunlap@infradead.org, daniel.baluta@gmail.com, imx@lists.linux.dev
Subject: Re: [PATCH 0/2] Documentation: Move rpmsg.rst and remoteproc.rst out
 of staging
Message-ID: <aRyX8etm-Mcn_94F@p14s>
References: <20251114065746.901649-1-daniel.baluta@nxp.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251114065746.901649-1-daniel.baluta@nxp.com>

On Fri, Nov 14, 2025 at 08:57:43AM +0200, Daniel Baluta wrote:
> Try to find a better place for rpmsg.rst and remoteproc.rst files.
> Having them in staging suggest that rpmsg / remoteproc are not mature
> enough which is not true.
> 
> Daniel Baluta (2):
>   Documentation: Move rpmsg.rst and remoteproc.rst out of staging
>   Documentation: Fix filenames for remoteproc/rpmsg
> 
>  Documentation/driver-api/index.rst                   | 2 ++
>  Documentation/{staging => driver-api}/remoteproc.rst | 2 +-
>  Documentation/{staging => driver-api}/rpmsg.rst      | 4 ++--
>  Documentation/staging/index.rst                      | 2 --
>  MAINTAINERS                                          | 4 ++--
>  5 files changed, 7 insertions(+), 7 deletions(-)
>  rename Documentation/{staging => driver-api}/remoteproc.rst (99%)
>  rename Documentation/{staging => driver-api}/rpmsg.rst (99%)

Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>

> 
> -- 
> 2.45.2
> 
