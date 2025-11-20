Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DE2B333436
	for <linux-doc@vger.kernel.org>; Thu, 20 Nov 2025 14:49:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763650152; cv=none; b=VtrixAa/r1fAE9sfYCEMrlQD17ldSGxxNPKX9s1kPFi5V0rNQw3p+/pEq82/MZ4C5CVIS6kv9naBspGngriXhSrk2Xs3+8HUZzX8o5PbOA/gyPcRcHhExt3gizV92PxfRpPLHLqOmZX7ljh5vGWp6hMSWnLixTJ5sMmRG+OqcWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763650152; c=relaxed/simple;
	bh=1xC/h/NzwlKlaIh9etUvWs7a7+yz6dKV+1btlaqWjpA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FkTfIzL+/ABrCCCJ15/RVlv4WTJvNCyicWnKtirDK/3TECPNRu2UroAMkhUJYtlAdqYHNaToPUJhmMnOpysLkAko67dHNqzD+u2Ir9/06TKNsbyHMqVXcFim/YYnrcvk4vtjiGB5HtME0QXDCuy2K1Fc/wez0ofFpNuFB+bQ0PI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MHylOhRc; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MHylOhRc"
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-8b144ec3aa8so84565885a.2
        for <linux-doc@vger.kernel.org>; Thu, 20 Nov 2025 06:49:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763650149; x=1764254949; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=aY/Nfwg53Oq8ymsLpOJ6a1fY6HTW8kUvDIjfnbLWXVg=;
        b=MHylOhRcxd393a62odTbDDbXt4+jr4cInGpms+GM2NS6/h4nKefk60sgSK0VHOckMb
         E/umRSloG7k50MZYpzoofs/yQmRqU6Da3lVCR2xNBg7NwhOaYhm3QtOfZCeBEcFvYm9d
         lHU5gZ5pY1pgjDBywO2u76Q1+HExQ+22QsMlIhBStL1ZRtLNslsgCUWMtc9EKjGLBga/
         p2p2IHaf+pBgLp+jUg5QuyMRnEC1wI34it98yko9YDoT3F3SgISsSgDz696Jqa4rGnaA
         A2xHovjtL0im+ZyDjhZ2ozFOcSCh/lzaCT4E50qtdLyMe5/FkDOvIPBFYoIFPTYr9Xh8
         FB+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763650149; x=1764254949;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aY/Nfwg53Oq8ymsLpOJ6a1fY6HTW8kUvDIjfnbLWXVg=;
        b=Ds9TWwnsz/IjVRHapgQiiBm5JANX4WoQS7HBMUCr3l0cZ9RpqVfpoOoOzAJPKBhodV
         o6EwebR/IMgPmBbb25/ubHWMIssvmju3GWREWLDtIOVzzmwcYckQ8hBEbehpKy0OXU5u
         6yW2c7+BmoevVDZ97c0X09zmrLhpRO4dUgoI1RYAAbZdet5BkD602AlkDvlxHaZB/A10
         mpviDrNr88iUpO9vCUwXf9SrUH4SVh8xwixeLC4x4SxpZ1IUsXcYEmH2BmGXRqrB3cRt
         Doq20KFqu3aBr03rZPcZqcfhz6VSb7F3DKTPRpjrs8n9ncTutZx1LNxA1GUmfQ49d79M
         sGeA==
X-Forwarded-Encrypted: i=1; AJvYcCWWhfNqvx4bs4s+IUO6wnx1qxtbdYoxpydyZKWfd+4K7nkzMyKkEiWz/RW59PGSwpCIWN5fyzKPutc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzndH1soxK/0nPCGwwXhKSgcwpVXbFl83XpTCKG0UQr1Ns8LOrO
	WR74vyxbSWOXyScErebyVjtlAyVo3Nb6NZiuS2RGazpBmNmFIaX/Lbw0mGg2AQqYxkSBB1tM6VW
	FMdmu3j0GUQAH/zA5FpPU+8G14woMIZCuzfDMJyypdg==
X-Gm-Gg: ASbGncuzu/9Vp0bDM3R2fvinKWg0fADYTmis2dDAUT4vq5icQk4GBDqHE7ctdQM5HTe
	C75J/2GKCL14J7YzajsTzEptenh0oC2YFkZb3p65T61WjUOfGMen6JKCYZ4NTGGL7FKr2xSL9ev
	6LioYA6E4BWFZePU+1EfvPFoy7tI9yNe2hfTFGdOJznVopTOs2oGXCv9tsTUaOMjNW3VNvwUyQU
	0qi0vzSsUAQ3mmCyjXddQZcc/en4PAQkYXimYMbp4Iab3lmEZpWwjt2/PLYkf1VT+Jls7gpgvHG
	8SmvkhqxziTOKVCShE7S1O8+ZUOS
X-Google-Smtp-Source: AGHT+IFST+o3UHCJgrh01U8g/Epnj72ciDSACETTwqxanvV4FIOHqlhYm62HhwbYYcFoHS9z7vl+Fkuls0kROCBoL2c=
X-Received: by 2002:a05:620a:191f:b0:892:7dd2:9f14 with SMTP id
 af79cd13be357-8b32f315b9dmr220687085a.25.1763650149109; Thu, 20 Nov 2025
 06:49:09 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251118-james-cs-syncfreq-v5-0-82efd7b1a751@linaro.org> <20251118-james-cs-syncfreq-v5-7-82efd7b1a751@linaro.org>
In-Reply-To: <20251118-james-cs-syncfreq-v5-7-82efd7b1a751@linaro.org>
From: Mike Leach <mike.leach@linaro.org>
Date: Thu, 20 Nov 2025 14:48:58 +0000
X-Gm-Features: AWmQ_bmFP76OyAR6GFA2lLA0bgjVAk5MbAONEPZAKM7SNce0dpJzZvuvLdO-5Qw
Message-ID: <CAJ9a7VjafO3NmEXH283wNzGpws3dweiUSW_vPjTA3TVb4ezL1g@mail.gmail.com>
Subject: Re: [PATCH v5 07/13] coresight: Don't reject unrecognized ETMv3
 format attributes
To: James Clark <james.clark@linaro.org>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jonathan Corbet <corbet@lwn.net>, 
	Leo Yan <leo.yan@arm.com>, Randy Dunlap <rdunlap@infradead.org>, coresight@lists.linaro.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 18 Nov 2025 at 16:28, James Clark <james.clark@linaro.org> wrote:
>
> config isn't the only field, there are also config1, config2, etc.
> Rejecting unrecognized attributes is therefore inconsistent as it wasn't
> done for all fields. It was only necessary when we were directly
> programming attr->config into ETMCR and didn't hide the unsupported
> fields, but now it's not needed so remove it.
>
> Reviewed-by: Leo Yan <leo.yan@arm.com>
> Signed-off-by: James Clark <james.clark@linaro.org>
> ---
>  drivers/hwtracing/coresight/coresight-etm3x-core.c | 7 -------
>  1 file changed, 7 deletions(-)
>
> diff --git a/drivers/hwtracing/coresight/coresight-etm3x-core.c b/drivers/hwtracing/coresight/coresight-etm3x-core.c
> index 4511fc2f8d72..584d653eda81 100644
> --- a/drivers/hwtracing/coresight/coresight-etm3x-core.c
> +++ b/drivers/hwtracing/coresight/coresight-etm3x-core.c
> @@ -333,13 +333,6 @@ static int etm_parse_event_config(struct etm_drvdata *drvdata,
>         if (config->mode)
>                 etm_config_trace_mode(config);
>
> -       /*
> -        * At this time only cycle accurate, return stack  and timestamp
> -        * options are available.
> -        */
> -       if (attr->config & ~ETM3X_SUPPORTED_OPTIONS)
> -               return -EINVAL;
> -
>         config->ctrl = 0;
>
>         if (ATTR_CFG_GET_FLD(attr, cycacc))
>
> --
> 2.34.1
>

Reviewed-by: Mike Leach <mike.leach@linaro.org>
-- 
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK
