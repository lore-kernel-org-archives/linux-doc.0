Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE86023956E
	for <linux-doc@vger.kernel.org>; Thu, 20 Nov 2025 16:08:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763654921; cv=none; b=HHBqZKkLAuu3oluHX8Y0tYbRlZnThNDHDrm+J1RQKgRJCsbfC08YS7kdHQJhvJvRS6AiBdzj/ZXCmwB/2xc2i9T1EywrZcryGwYyRnvndZEgtHqfQ1Uosp5YeuePkMJWk6q2iXdB34mFl+PHL7DScTz2CPD1wEJo1KVstoiUIpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763654921; c=relaxed/simple;
	bh=2m+9hfrY7Le2UlKLojPW+YJcS2uhKG6NgLK/nGEeCTg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CyALLkA+qld4iNpJuTBN8CHalZPT7Ut6yVfbBCOLUTHR138rXIsGVAZ6lfuqwIomrT7efvEafJ8OwwQhMvRq2dRi8d2OIjlhukEJVwFFmGv8Sdygg+gjArizVQ5WeNloX6A/gnjAiR7fYPo3/KP2luiSHBqTOV+0LAskH4WiWlc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ENObNeOb; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ENObNeOb"
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-8b3016c311bso122989885a.1
        for <linux-doc@vger.kernel.org>; Thu, 20 Nov 2025 08:08:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763654919; x=1764259719; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=uOTf9S7xHymk9oIXZecJskRLDNVQtFSMZQm1V4Y013k=;
        b=ENObNeObgxuIVKSIENEpKvfPAWuuoLqRoRYKzlveABUHcoV4hoNZMuHqzHD2Faij/y
         rM2T76jO2tTN7nnz/xRKh9NqS0Bh2rQFplaTXRDKP6S/nYLmpDaPwgk+R7JugZGoNmFO
         hNR9XeLP8BD957OfULw1hr+K0IF0aMnSTKaD4Y+O8kQl8qSHuO7bCkEFoLKUKvWaeZbt
         d9o+s45z0VOYNK0AxxiNr/+t7dOwPP5UY8V3raAjlYPOvH2kaPJmOKn/lp5n6vA+uYdX
         q8DuK/oe2w/KuOqjfkVTdqmAwhu7kFNlJPbe/1lJOAs1t6E3yki6zF6iSt6NyhLCYceH
         BRNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763654919; x=1764259719;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uOTf9S7xHymk9oIXZecJskRLDNVQtFSMZQm1V4Y013k=;
        b=vsG7RHwwizm8VI6TM9AqSwnet9wHd3A3sB1Y/g+03JdTI+Gj17MCvrLGcAHczXn7GG
         mMBx5okKEo4LCmnbS8QSAAyAGYSP0TS2jm0jvDavE3iUUsFCSHBk8tqfjLnaX6TT0MDU
         eu4XZgobPlRuI501iIBHp9LQyS+6EGNR2LoiUtzdXXm7i8gU9xauu02tIqGIqso/Jb8A
         BB+cLEDApXYo67VHz107MFqixy62y0pDbkCqOhwrnuYfpIxeR2XGkjtNXKrwQjPHnhaN
         O1WRPVqHbxdG0tWEssBBYUfyt7HroedE9GoNJA+4ciwOu9hCrUuqV1qKUYA02CjxQqIU
         321w==
X-Forwarded-Encrypted: i=1; AJvYcCVZorYXYZ6HA7mIbUQUFVyjR1T4OQLjr607060AsfE/r92CTXVCwFkHRIEH2jwYhfE/tdCsdCBOQBU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyW/6am9pa3DRilsyi4b4mywZp6F38to6NZql3faqxKtupJLV/b
	yf25rUuJXWn74jBh+IzKTkcGOIvdiWSfDV/RbAsnmrDvidAMyjG098DfhTJHDUwgqJ9cVuR6XCI
	uisyxK5yZb20TAcSzXA8rhyvolM1n+86b/63c5fiWK2TgQ9HFq3mO
X-Gm-Gg: ASbGncswmPmkT8v8HzUqnU1rGYIpQ3nrOM7PXKlL8pBbbFjUWFuB9w7zFqqWilZ0KIv
	1xuwqlL2Xa3nRXm6ytO8NAxREBOCXMdOI8cfH+d3U6bPeCW9U2YAiVg3h0etzngnGoWIWJ35BHo
	ROwNL7K829Z3HlUnk+qpubiRFA7WL1/cs5JHw8wjoH9UCkQJy5IHh1ZnxIVDocT9wgM3dxrEJT3
	siWeve1iqNoE64YzikaSEKIYMVz+JZsXiHIm9Djv/JX+NDn4FVWjhHmaNGbtYXlVa0JiZ2V8FZM
	p/eoxCIQd48qO78+Ew2AaTkgDYVAz/0GniuQlak=
X-Google-Smtp-Source: AGHT+IFLx8E2F5La98nR7s8PPS6EeikU6vEKSuMTJWEatwPG683yA3+U62ygZBdk3b3M+a+Rn3jIeVdPgQ2Gb5q2WsU=
X-Received: by 2002:a05:620a:458f:b0:8ab:58d3:6030 with SMTP id
 af79cd13be357-8b327375be6mr523446785a.57.1763654918545; Thu, 20 Nov 2025
 08:08:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251118-james-cs-syncfreq-v5-0-82efd7b1a751@linaro.org> <20251118-james-cs-syncfreq-v5-6-82efd7b1a751@linaro.org>
In-Reply-To: <20251118-james-cs-syncfreq-v5-6-82efd7b1a751@linaro.org>
From: Mike Leach <mike.leach@linaro.org>
Date: Thu, 20 Nov 2025 16:08:27 +0000
X-Gm-Features: AWmQ_bl9M1ynp3JPBXPP442GDLu0IwJ5Tve9fK-Dv88s5Tw0-xLU4rwmVWxOX88
Message-ID: <CAJ9a7VjKrCJf6Ec6QTx1T91KSj-ihpswDqJaS0vhz0joqV6CNQ@mail.gmail.com>
Subject: Re: [PATCH v5 06/13] coresight: Interpret ETMv3 config with ATTR_CFG_GET_FLD()
To: James Clark <james.clark@linaro.org>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jonathan Corbet <corbet@lwn.net>, 
	Leo Yan <leo.yan@arm.com>, Randy Dunlap <rdunlap@infradead.org>, coresight@lists.linaro.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 18 Nov 2025 at 16:28, James Clark <james.clark@linaro.org> wrote:
>
> Currently we're programming attr->config directly into ETMCR after some
> validation. This obscures which fields are being used, and also makes it
> impossible to move fields around or use other configN fields in the
> future.
>
> Improve it by only reading the fields that are valid and then setting
> the appropriate ETMCR bits based on each one.
>
> The ETMCR_CTXID_SIZE part can be removed as it was never a valid option
> because it's not in ETM3X_SUPPORTED_OPTIONS.
>
> Reviewed-by: Leo Yan <leo.yan@arm.com>
> Signed-off-by: James Clark <james.clark@linaro.org>
> ---
>  drivers/hwtracing/coresight/coresight-etm3x-core.c | 24 ++++++++++++----------
>  1 file changed, 13 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/hwtracing/coresight/coresight-etm3x-core.c b/drivers/hwtracing/coresight/coresight-etm3x-core.c
> index a5e809589d3e..4511fc2f8d72 100644
> --- a/drivers/hwtracing/coresight/coresight-etm3x-core.c
> +++ b/drivers/hwtracing/coresight/coresight-etm3x-core.c
> @@ -28,6 +28,7 @@
>  #include <linux/uaccess.h>
>  #include <linux/clk.h>
>  #include <linux/perf_event.h>
> +#include <linux/perf/arm_pmu.h>
>  #include <asm/sections.h>
>
>  #include "coresight-etm.h"
> @@ -339,21 +340,22 @@ static int etm_parse_event_config(struct etm_drvdata *drvdata,
>         if (attr->config & ~ETM3X_SUPPORTED_OPTIONS)
>                 return -EINVAL;
>
> -       config->ctrl = attr->config;
> +       config->ctrl = 0;
>
> -       /* Don't trace contextID when runs in non-root PID namespace */
> -       if (!task_is_in_init_pid_ns(current))
> -               config->ctrl &= ~ETMCR_CTXID_SIZE;
> +       if (ATTR_CFG_GET_FLD(attr, cycacc))
> +               config->ctrl |= ETMCR_CYC_ACC;
> +
> +       if (ATTR_CFG_GET_FLD(attr, timestamp))
> +               config->ctrl |= ETMCR_TIMESTAMP_EN;
>
>         /*
> -        * Possible to have cores with PTM (supports ret stack) and ETM
> -        * (never has ret stack) on the same SoC. So if we have a request
> -        * for return stack that can't be honoured on this core then
> -        * clear the bit - trace will still continue normally
> +        * Possible to have cores with PTM (supports ret stack) and ETM (never
> +        * has ret stack) on the same SoC. So only enable when it can be honored
> +        * - trace will still continue normally otherwise.
>          */
> -       if ((config->ctrl & ETMCR_RETURN_STACK) &&
> -           !(drvdata->etmccer & ETMCCER_RETSTACK))
> -               config->ctrl &= ~ETMCR_RETURN_STACK;
> +       if (ATTR_CFG_GET_FLD(attr, retstack) &&
> +           (drvdata->etmccer & ETMCCER_RETSTACK))
> +               config->ctrl |= ETMCR_RETURN_STACK;
>
>         return 0;
>  }
>
> --
> 2.34.1
>

Reviewed-by: Mike Leach <mike.leach@linaro.org>
-- 
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK
