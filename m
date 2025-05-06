Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5CF21DE2D6
	for <linux-doc@vger.kernel.org>; Tue,  6 May 2025 17:27:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746552469; cv=none; b=d8SKGFz1PzUFkmp+0DDcJZmLu68ox5E8/LmT5q9OgYx58HORsuk61pAPCLq0hFIo3D9cJ0GHIuaoCPJgm28vZUhLr36gmcMBouerY1zPtQdaynlggsvF8CTnvFux+MlBG5AXobqoGK5ET11hvdyw7Onv6kgvJY75RyKwlKS8xAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746552469; c=relaxed/simple;
	bh=VZvedTE73bYMhdMPuuSG6IzGG8tV020eWS/PwiWAOIU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KhMXahkI+zPCaHscjuP2CUUDXNCF48kiyFaz3Ax0jMkku81/JTBc8IlPpVMZcpvEEG8QnO5hnUPG0dDFqvFa5Jkm5ZfrpXWNYKMrjcdK/xzepFcNNiXpSfc6fcFRzadmJEJ1a5pdsEMi6BpYH1KQYpZOO8lBvUCGDQK57P4aQvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RQrOF3WE; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RQrOF3WE"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-22e16234307so1113425ad.0
        for <linux-doc@vger.kernel.org>; Tue, 06 May 2025 10:27:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746552466; x=1747157266; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QntcJ9JC7N6KnoCCkYdEnTnrHKLcwgcPOoyiEKb/q5Y=;
        b=RQrOF3WEkxj488AF++sb+gDfJIaeku9qfo2Rzd/iKMeDJXEows66TYFE5sOcUICCaP
         Zi/8X6BTnwh/TC0WksaMXkNhGXLiTN8Ug1KvOB5JL5Dszv2RihaT1dePuOes9HYXHDlT
         4JKkuTVGsAnPqQxNOweCPJfvja36yji8QpC81rf64EgoEJkwVVtP1/6o2Ba05OPdVqC1
         S8a4KRzfW//c0BXoQ+8yJk7WknwvTuCMfpUNUDIsW7TdV1jMU0NscWzXEDYBQbKOqDFo
         FqA5A9Z3+SF9EAi0NKg6SEY8iZXJBxu7PSL+WQ7vJybDuKm/g7Jg52on6YE/zpkLQPaI
         5njQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746552466; x=1747157266;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QntcJ9JC7N6KnoCCkYdEnTnrHKLcwgcPOoyiEKb/q5Y=;
        b=kXpXcrMPswz1XAy8jc9i8tbNgQZXvljYKMcfE0DmEIQZQEL+C6UT7ygJ9QFwk1Eu8u
         ETDNvg5fUrPwZRH1RL3u+/14UjE5KAxnIVu14OWaIJnJG5DVMw6nMnWARDzt8FO863jv
         YnNtGbPs3POQiEuXf7O5o2OgrRElUllfQ9KReJzMMbTS/JfD4oCtSf1PouLpgpbJ7wX2
         Z64YtDiwvQz1Wt76qzVBKiqM81v+9txydaJF7foeZlH005UcPsYsasaAaix9TPB3VXoF
         5L+eOhwItkkjsDIpEIhoAtCWAsbIsznTd71RxuQXCHUqnM/JyvRmzdWyfj/dXaSyUQkQ
         yBxg==
X-Forwarded-Encrypted: i=1; AJvYcCVpDNiGiks/cVgdmnp4+tFc/65e1R9E5qL6XdVMUNGarztfOZ548pLnYP8Bpov336Fk7UxyXxdVmq8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyeus9vpzpWy42dA4u7qDOFQrrLiJ5grZr8kZmSjU0WYwXoRZxd
	wfz0FJOjP2phSACxEPOFRwpKj8fMP5Ew85A/h4zNH6i9/xvSknGV3BWzvGoZEC4=
X-Gm-Gg: ASbGnctco2oYsIeDrks8EsOv7Kdq48ATOXH9SA4BGRbA0pha5VBBHDe19IvqKw1/dtg
	n05hKApF38POEs1XBIKTtQOZrXdpZjdBq1cOgHdzns8Pzdn47TEULR3BG1tL0tGNGHt2ZB/tpnO
	DIMN2kFD9U2vudUH8DcCuWa+OK7THsOCuAlm+/XaS4hFGaYUjj2TRTbHstxj/Ami5v7g2rBMXbB
	M2CVm4gAYATx9An2j8OCfC3Zd7tjJg46fnoxnJqyi3BCSxLwVJdMzgttjT7RlnL9y44+W1ASjTo
	zJyWBGB7Rk3pCkZtiNPPqyA1zhGkhvwTRr3H+rktZnOFoxVSv9RjVxE=
X-Google-Smtp-Source: AGHT+IGb8PrWjxNOFSHqY4dUSPx0THioDcdMr2Zu+IP4nb33zCe+XaNuoMpebGjNT9nY0LAwSXTtUg==
X-Received: by 2002:a17:903:283:b0:21f:5063:d3ca with SMTP id d9443c01a7336-22e5d9a1cfamr7061195ad.16.1746552466098;
        Tue, 06 May 2025 10:27:46 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:18ea:e7ed:8d1e:88a0])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e150ebfa4sm76661845ad.13.2025.05.06.10.27.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 10:27:45 -0700 (PDT)
Date: Tue, 6 May 2025 11:27:43 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: linux@treblig.org
Cc: arnaud.pouliquen@foss.st.com, andersson@kernel.org, corbet@lwn.net,
	linux-remoteproc@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/3] rpmsg offchannel deadcoding
Message-ID: <aBpGj35VsjvAjNmL@p14s>
References: <20250429234600.301083-1-linux@treblig.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250429234600.301083-1-linux@treblig.org>

On Wed, Apr 30, 2025 at 12:45:56AM +0100, linux@treblig.org wrote:
> From: "Dr. David Alan Gilbert" <linux@treblig.org>
> 
> Hi,
>   This removes a couple of unused functions in rpmsg,
> and (v2) after discussions with Arnaud, follows the thread
> and removes code that they would call.
> 
> (Build tested only)
> 
> Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
> 
> V3
>   Fixup comment on rpmsg_send_offchannel_raw(),
>   removing the reference to "_offchannel" - as per Mathieu's
>   review
> 
> Dr. David Alan Gilbert (3):
>   rpmsg: core:  Remove deadcode
>   rpmsg: virtio: Remove uncallable offchannel functions
>   rpmsg: Remove unused method pointers *send_offchannel
> 
>  Documentation/staging/rpmsg.rst  | 46 -----------------------
>  drivers/rpmsg/rpmsg_core.c       | 63 --------------------------------
>  drivers/rpmsg/rpmsg_internal.h   |  6 ---
>  drivers/rpmsg/virtio_rpmsg_bus.c | 24 +-----------
>  include/linux/rpmsg.h            | 22 -----------
>  5 files changed, 1 insertion(+), 160 deletions(-)

I have applied this patchet.

Thanks,
Mathieu

> 
> -- 
> 2.49.0
> 
