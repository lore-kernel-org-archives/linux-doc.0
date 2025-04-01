Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E94C1E8331
	for <linux-doc@vger.kernel.org>; Tue,  1 Apr 2025 10:02:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743501724; cv=none; b=JrkIwkQ4tmLFxWavuExMEJbMozbkLAE44/pGCdoScTn3JhzqF3eT3p4tZ8OUGaE4t9v9FDR65HS01JzUnMYCUWJMLbMDzqyCYowjZah4poSZjSMDKkpKR2SMUoPYbG59SrDSWTtGPuJZMvKTUa2GlUUrC5zflAQZ8OE3b0NTQyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743501724; c=relaxed/simple;
	bh=uYBajC+qlLcOjYg/yPgPNCAySkmNxl6At4OkNFko640=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ltIjAmRJdiWVRoQN8SGqPXwrVF5HflUsYIwphRdlSEp8RTcn9VT+LI18KoI1phs1+AP+aFzOCaKlug80K0012Y3w1szfB1h0rOFHds+2J0sS4q0eiqmfFwEUWTdKXhWDrNJ4r7zxK8OYg8xAtFFM96jq8XNtRiVHOy8IRSNWKqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DFIXgANC; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DFIXgANC"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2240b4de12bso81375775ad.2
        for <linux-doc@vger.kernel.org>; Tue, 01 Apr 2025 03:02:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743501721; x=1744106521; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=wyjemxHYQVfV2RAp28JZowO/OFLohCsOjkUOahPABvs=;
        b=DFIXgANCByvmXJTM1Wsq0wKHCmT6KdRLSydKrc1cDoyf6gw3GgDfk9YHXgd/u6HI1A
         KeTeoRAFvKMFFqhG0ZHBDE0xdXLlpLrs/jH3cFe9YUnpSRPQYmyk5gH8jxoB1Fr5BIcQ
         bw5UR0eeHcHyFdfSb9K7FM/1mVA+QREC5j0D/R9XcA5yG3FxfhHl4SaHrrGCGg9Y+XOS
         mQ4ypb5mwVGX+uCMlWqgLafUFDiGW/DvS1HHLeDXSn/9zTKAVkR2ML6lwblW1fThwK5Z
         dGr2/r1RrTXzz6DeujIhuv7+PnaC5dCjv9QqXlZ/kcfRvidmx3lq/4AvBcmmAhYho+Ii
         XRmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743501721; x=1744106521;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wyjemxHYQVfV2RAp28JZowO/OFLohCsOjkUOahPABvs=;
        b=gXYLxzdLiq2c37CYmmHWor+KFEXOMgHK17XcpXgxF4XIZ+TGxDYRlG4jr+l5V/hTl1
         CxOzTeNK7fMeEH77tQOOL61eiRmVqADJWxaOG8L99iPkDeTTtl9pTBEampndELT/gas1
         7REBhzU4QD1Ecdccjfwjnnxdauo9iPgemjTHnzYpJpEmWB8qMrRKyP1qajpnvzSUNLDB
         WWcp3UfI5I1zPxOS+IUIrW84iRFMaBe0p5FE7RiE2AMMqxy0pOoSUEMBOri6yoQ+HnDr
         lUAnJbB3s2BJQlEIl0qbwzoZ2hejWe85uA2CxcztXeZNmMhV/n+/EDqx5HlrkjKZNC3w
         A5qw==
X-Forwarded-Encrypted: i=1; AJvYcCW4h7lBjMTCxLGvVUnfkdfTQGuKPFmyGJXsZYNd1G8TWx4QIqclWIdP0WV6M33uLQ2Yly66yDCttk8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwAnxPoOmXJAt55N2Iu5M6sdJfMb2OteofdXaudcEfG8/Gl8eEW
	60LXnmIsHPXccJ2GMH9KU15bO/hBaeeV4EHEXFnzR4gA5hv8C5L9x+DFhKd9UeeAUxpeZUW3vqA
	W5lDF/xD5x7lP7Hg5/Q9m5zI+AO59Yds0SzJS6KzaIocu+k/b
X-Gm-Gg: ASbGncsUOA7BdsGdyqtyQYlVjZuujAxWk+KCsLJoMb6pnAfvH3G/0UTIKrPjorQThel
	hwAEinTTpIxiQE72Il/sTU6iF2TY8jzE9pL0Tf9uI2USlW+Z/IBrDYvzxFPnl46gulmsRHuMif4
	rSq1HR8V4tjCao2B7QE0C/ji8u98k=
X-Google-Smtp-Source: AGHT+IH4yoC0IXNJC0YNilNe/ARbknkDvKtfRQS06TMmC8WC5ANOsA0AGY+eH2ffVNsMurol4yN7DGOyBc3sRAf0eSo=
X-Received: by 2002:aa7:88d2:0:b0:736:3be3:3d76 with SMTP id
 d2e1a72fcca58-7398041dafdmr16611300b3a.17.1743501720739; Tue, 01 Apr 2025
 03:02:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250311170451.611389-1-leo.yan@arm.com> <20250311170451.611389-3-leo.yan@arm.com>
In-Reply-To: <20250311170451.611389-3-leo.yan@arm.com>
From: Mike Leach <mike.leach@linaro.org>
Date: Tue, 1 Apr 2025 11:01:49 +0100
X-Gm-Features: AQ5f1Jp1RW5fkG8Kbz_MFd1dM6zqYns3yVh04MaQfoZg_wzQM8iHEY3uu07DATc
Message-ID: <CAJ9a7VjcWHiRQmWW3sWTf8iBWMr5K3zCCJ6RF=i6bU+qO154qA@mail.gmail.com>
Subject: Re: [PATCH v3 2/6] coresight: Introduce pause and resume APIs for source
To: Leo Yan <leo.yan@arm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, James Clark <james.clark@linaro.org>, 
	Jonathan Corbet <corbet@lwn.net>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 11 Mar 2025 at 17:05, Leo Yan <leo.yan@arm.com> wrote:
>
> Introduce APIs for pausing and resuming trace source and export as GPL
> symbols.
>
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>  drivers/hwtracing/coresight/coresight-core.c | 22 ++++++++++++++++++++
>  drivers/hwtracing/coresight/coresight-priv.h |  2 ++
>  include/linux/coresight.h                    |  4 ++++
>  3 files changed, 28 insertions(+)
>
> diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
> index fb43ef6a3b1f..d4c3000608f2 100644
> --- a/drivers/hwtracing/coresight/coresight-core.c
> +++ b/drivers/hwtracing/coresight/coresight-core.c
> @@ -367,6 +367,28 @@ void coresight_disable_source(struct coresight_device *csdev, void *data)
>  }
>  EXPORT_SYMBOL_GPL(coresight_disable_source);
>
> +void coresight_pause_source(struct coresight_device *csdev)
> +{
> +       if (!coresight_is_percpu_source(csdev))
> +               return;
> +
> +       if (source_ops(csdev)->pause_perf)
> +               source_ops(csdev)->pause_perf(csdev);
> +}
> +EXPORT_SYMBOL_GPL(coresight_pause_source);
> +
> +int coresight_resume_source(struct coresight_device *csdev)
> +{
> +       if (!coresight_is_percpu_source(csdev))
> +               return -EOPNOTSUPP;
> +
> +       if (!source_ops(csdev)->resume_perf)
> +               return -EOPNOTSUPP;
> +
> +       return source_ops(csdev)->resume_perf(csdev);
> +}
> +EXPORT_SYMBOL_GPL(coresight_resume_source);
> +
>  /*
>   * coresight_disable_path_from : Disable components in the given path beyond
>   * @nd in the list. If @nd is NULL, all the components, except the SOURCE are
> diff --git a/drivers/hwtracing/coresight/coresight-priv.h b/drivers/hwtracing/coresight/coresight-priv.h
> index 82644aff8d2b..2d9baa9d8228 100644
> --- a/drivers/hwtracing/coresight/coresight-priv.h
> +++ b/drivers/hwtracing/coresight/coresight-priv.h
> @@ -249,5 +249,7 @@ void coresight_add_helper(struct coresight_device *csdev,
>  void coresight_set_percpu_sink(int cpu, struct coresight_device *csdev);
>  struct coresight_device *coresight_get_percpu_sink(int cpu);
>  void coresight_disable_source(struct coresight_device *csdev, void *data);
> +void coresight_pause_source(struct coresight_device *csdev);
> +int coresight_resume_source(struct coresight_device *csdev);
>
>  #endif
> diff --git a/include/linux/coresight.h b/include/linux/coresight.h
> index d79a242b271d..c95c72e07e02 100644
> --- a/include/linux/coresight.h
> +++ b/include/linux/coresight.h
> @@ -398,6 +398,8 @@ struct coresight_ops_link {
>   *             is associated to.
>   * @enable:    enables tracing for a source.
>   * @disable:   disables tracing for a source.
> + * @resume_perf: resumes tracing for a source in perf session.
> + * @pause_perf:        pauses tracing for a source in perf session.
>   */
>  struct coresight_ops_source {
>         int (*cpu_id)(struct coresight_device *csdev);
> @@ -405,6 +407,8 @@ struct coresight_ops_source {
>                       enum cs_mode mode, struct coresight_path *path);
>         void (*disable)(struct coresight_device *csdev,
>                         struct perf_event *event);
> +       int (*resume_perf)(struct coresight_device *csdev);
> +       void (*pause_perf)(struct coresight_device *csdev);
>  };
>
>  /**
> --
> 2.34.1
>

Reviewed-by: Mike Leach <mike.leach@linaro.org>
-- 
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK
