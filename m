Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5654F1EB9E8
	for <linux-doc@vger.kernel.org>; Tue,  1 Apr 2025 08:59:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743497985; cv=none; b=o+1CkNkjaZ0s9+aEqaQ4B2GYb4X4H4sdDzB6T3Auz4r+48BrN6a620pPDdmZu5GqP3iVpW+dViZ8oVr5c7uU/ssn+AR/61E1Ob0VYxyKfGgwM+yo517+c6iT2TafYbWYynm068znaYTV0opZ/4lffg02KFOxNB1WNU5FUw7dvTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743497985; c=relaxed/simple;
	bh=iA3vc6iBumO0wyuNH4D4SNx9H8X39pPVlKvlLxxeDqY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cofMTD3s3mjuHtbcbzHHznB0QJCh6U6WAK5CnbwnEYlPIdwHR9WdHgE3BLzPAA9WfsbFJOzKXe+Qm9Bn2ajHpDuaecinThufkjGnXSZQcvMtTeDhY9uEKNYcJsPgrIIT3JoC5F9/j1OIN6GwUp9fSfUlZtuATuQv6jTBmnXsO0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RdYg5tmv; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RdYg5tmv"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-224191d92e4so98105605ad.3
        for <linux-doc@vger.kernel.org>; Tue, 01 Apr 2025 01:59:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743497982; x=1744102782; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=DUtQE7nMd/6PSKoEtlC68hCAEgv6hCHzZZn6Ocd8nbQ=;
        b=RdYg5tmvEjiqm121IL/nr5xTsAa7TODaIHEnWSDofjTsVwB49Br7seF1Dq21pX/7Wz
         K5QnifMwPrCJ5zbt9gk+6sqkpTWi/+QA09Bs07vk1H6UMLVL2mQsyW6aNnsgHZpOuHhy
         7E7ByvnqJDTBpw1E8Sg0f71SRGTUbO9gFg8msmdg3yF9gliU7sJ+urFZttPKVFb9hMTv
         MV+amILgTfQ6z4rq2KcMkStei4C3km3hnTT9OnhPkcT4UsW1O5+CcRZyMA9H9OKolP2b
         snayhs/E369slo70k5DbOqgQm03ea0BTUA+LPeEdjtzCwrgzYONnY8Lclvinb1iT+oJc
         tNFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743497982; x=1744102782;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DUtQE7nMd/6PSKoEtlC68hCAEgv6hCHzZZn6Ocd8nbQ=;
        b=iYZpBYXNFO/RReyA/4yAn6sT2GkGYoMjKvt1IUna+jmaLOdg5IScjEjpagj4M1Kgg7
         ZX843KQPzNlrRY8wW6XS3xQ86odBN+0NycZZzplBUy847Ovv3QHUgFLphNUIfYIa+uIP
         f0YiguxWKAeGvCJ9KknVyXI8ojnMkynG4/GfSFbb8pm+pff3lmH7WwNdrAfCz6vtYPm2
         UbhAVOR9CaKcmtIdTyqxS51zz7hN8mPLHeBLE+Vtb+G7R23RX+B/ti58Ox/EKVtLyftt
         FAM9Md2wXXfrIid9tSzwZ8XVaIekDoFWcVVAXx+PmjVD/wJ1Pia2vZQqeqhNBZ8wIUn8
         Bizw==
X-Forwarded-Encrypted: i=1; AJvYcCXS5UilUe2hq5u+zl3n8XUEeOkbP0FVen39ISk4rU7R21Et+IDauCsu7i3xNcuRX9DthQtJ8kVzgFQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzH3KgxWKVGIINmFiABDhnTiJxf8Knwh3X9pBtMxCVbfMJj2G8X
	yKNVAH/1rchQPNrWVj7umul3EB5EcVQEmEBYkJvqdLIB1W6Wb3b/5ahKBr8aaIsxKBkzycAo5Kt
	ksCWuJ1ne7Z+fFkCaa8N7y5Xs2PYFQxp0pyc3xw==
X-Gm-Gg: ASbGncs2BZAfStVT/LKdGk6Zq4QwKIGh2MM/Qa69rwgyHBiRuptCb2cXZdYAmQ/LRbU
	CQHE+lvPhXDDCMTqhfvieGptLsdmDURRubv8YY4sfM4iyZkqjdysGbqfEF8U8Gp+MJP1Q0R/7nJ
	/7eSdBazqzL1A7R6dbERKTHxVtml8=
X-Google-Smtp-Source: AGHT+IGzin6V0f0YGKy7Udk3aewjUGbBv6XmcP/DU6qB3LkeQJ2R2Z1zAebpSyapanvD2hTwAq7WiNaUzpcJ1/QKOno=
X-Received: by 2002:a05:6a00:853:b0:736:9fa2:bcbb with SMTP id
 d2e1a72fcca58-73980436cbamr19044549b3a.24.1743497982506; Tue, 01 Apr 2025
 01:59:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250311170451.611389-1-leo.yan@arm.com> <20250311170451.611389-2-leo.yan@arm.com>
In-Reply-To: <20250311170451.611389-2-leo.yan@arm.com>
From: Mike Leach <mike.leach@linaro.org>
Date: Tue, 1 Apr 2025 09:59:31 +0100
X-Gm-Features: AQ5f1JpICOn046XWir454LuVhWbevJeRSx1F27tfX6sfrfiP5_Zt2Y4Br9MlhyM
Message-ID: <CAJ9a7Vi7kkjqfTWkY1-KP-HZUNG-25sPCZqDf2_n5i_OagEDGw@mail.gmail.com>
Subject: Re: [PATCH v3 1/6] coresight: etm4x: Extract the trace unit controlling
To: Leo Yan <leo.yan@arm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, James Clark <james.clark@linaro.org>, 
	Jonathan Corbet <corbet@lwn.net>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 11 Mar 2025 at 17:05, Leo Yan <leo.yan@arm.com> wrote:
>
> The trace unit is controlled in the ETM hardware enabling and disabling.
> The sequential changes for support AUX pause and resume will reuse the
> same operations.
>
> Extract the operations in the etm4_{enable|disable}_trace_unit()
> functions.  A minor improvement in etm4_enable_trace_unit() is for
> returning the timeout error to callers.
>
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>  .../coresight/coresight-etm4x-core.c          | 103 +++++++++++-------
>  1 file changed, 62 insertions(+), 41 deletions(-)
>
> diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> index e5972f16abff..53cb0569dbbf 100644
> --- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
> +++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> @@ -431,6 +431,44 @@ static int etm4x_wait_status(struct csdev_access *csa, int pos, int val)
>         return coresight_timeout(csa, TRCSTATR, pos, val);
>  }
>
> +static int etm4_enable_trace_unit(struct etmv4_drvdata *drvdata)
> +{
> +       struct coresight_device *csdev = drvdata->csdev;
> +       struct device *etm_dev = &csdev->dev;
> +       struct csdev_access *csa = &csdev->access;
> +
> +       /*
> +        * ETE mandates that the TRCRSR is written to before
> +        * enabling it.
> +        */
> +       if (etm4x_is_ete(drvdata))
> +               etm4x_relaxed_write32(csa, TRCRSR_TA, TRCRSR);
> +
> +       etm4x_allow_trace(drvdata);
> +       /* Enable the trace unit */
> +       etm4x_relaxed_write32(csa, 1, TRCPRGCTLR);
> +
> +       /* Synchronize the register updates for sysreg access */
> +       if (!csa->io_mem)
> +               isb();
> +
> +       /* wait for TRCSTATR.IDLE to go back down to '0' */
> +       if (etm4x_wait_status(csa, TRCSTATR_IDLE_BIT, 0)) {
> +               dev_err(etm_dev,
> +                       "timeout while waiting for Idle Trace Status\n");
> +               return -ETIME;
> +       }
> +
> +       /*
> +        * As recommended by section 4.3.7 ("Synchronization when using the
> +        * memory-mapped interface") of ARM IHI 0064D
> +        */
> +       dsb(sy);
> +       isb();
> +
> +       return 0;
> +}
> +
>  static int etm4_enable_hw(struct etmv4_drvdata *drvdata)
>  {
>         int i, rc;
> @@ -539,33 +577,7 @@ static int etm4_enable_hw(struct etmv4_drvdata *drvdata)
>                 etm4x_relaxed_write32(csa, trcpdcr | TRCPDCR_PU, TRCPDCR);
>         }
>
> -       /*
> -        * ETE mandates that the TRCRSR is written to before
> -        * enabling it.
> -        */
> -       if (etm4x_is_ete(drvdata))
> -               etm4x_relaxed_write32(csa, TRCRSR_TA, TRCRSR);
> -
> -       etm4x_allow_trace(drvdata);
> -       /* Enable the trace unit */
> -       etm4x_relaxed_write32(csa, 1, TRCPRGCTLR);
> -
> -       /* Synchronize the register updates for sysreg access */
> -       if (!csa->io_mem)
> -               isb();
> -
> -       /* wait for TRCSTATR.IDLE to go back down to '0' */
> -       if (etm4x_wait_status(csa, TRCSTATR_IDLE_BIT, 0))
> -               dev_err(etm_dev,
> -                       "timeout while waiting for Idle Trace Status\n");
> -
> -       /*
> -        * As recommended by section 4.3.7 ("Synchronization when using the
> -        * memory-mapped interface") of ARM IHI 0064D
> -        */
> -       dsb(sy);
> -       isb();
> -
> +       rc = etm4_enable_trace_unit(drvdata);
>  done:
>         etm4_cs_lock(drvdata, csa);
>
> @@ -884,25 +896,12 @@ static int etm4_enable(struct coresight_device *csdev, struct perf_event *event,
>         return ret;
>  }
>
> -static void etm4_disable_hw(void *info)
> +static void etm4_disable_trace_unit(struct etmv4_drvdata *drvdata)
>  {
>         u32 control;
> -       struct etmv4_drvdata *drvdata = info;
> -       struct etmv4_config *config = &drvdata->config;
>         struct coresight_device *csdev = drvdata->csdev;
>         struct device *etm_dev = &csdev->dev;
>         struct csdev_access *csa = &csdev->access;
> -       int i;
> -
> -       etm4_cs_unlock(drvdata, csa);
> -       etm4_disable_arch_specific(drvdata);
> -
> -       if (!drvdata->skip_power_up) {
> -               /* power can be removed from the trace unit now */
> -               control = etm4x_relaxed_read32(csa, TRCPDCR);
> -               control &= ~TRCPDCR_PU;
> -               etm4x_relaxed_write32(csa, control, TRCPDCR);
> -       }
>
>         control = etm4x_relaxed_read32(csa, TRCPRGCTLR);
>
> @@ -943,6 +942,28 @@ static void etm4_disable_hw(void *info)
>          * of ARM IHI 0064H.b.
>          */
>         isb();
> +}
> +
> +static void etm4_disable_hw(void *info)
> +{
> +       u32 control;
> +       struct etmv4_drvdata *drvdata = info;
> +       struct etmv4_config *config = &drvdata->config;
> +       struct coresight_device *csdev = drvdata->csdev;
> +       struct csdev_access *csa = &csdev->access;
> +       int i;
> +
> +       etm4_cs_unlock(drvdata, csa);
> +       etm4_disable_arch_specific(drvdata);
> +
> +       if (!drvdata->skip_power_up) {
> +               /* power can be removed from the trace unit now */
> +               control = etm4x_relaxed_read32(csa, TRCPDCR);
> +               control &= ~TRCPDCR_PU;
> +               etm4x_relaxed_write32(csa, control, TRCPDCR);
> +       }
> +
> +       etm4_disable_trace_unit(drvdata);
>
>         /* read the status of the single shot comparators */
>         for (i = 0; i < drvdata->nr_ss_cmp; i++) {
> --
> 2.34.1
>

Reviewed-by: Mike Leach <mike;leach@linaro.org>
-- 
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK
