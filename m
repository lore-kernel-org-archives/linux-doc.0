Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BED43321D2
	for <linux-doc@vger.kernel.org>; Thu, 20 Nov 2025 11:21:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763637719; cv=none; b=Z2Bv9gvxfIJoQzDAWbQivzuujhEl+bnxn3qZlv7XB6u6hrUXWMXn4M4cS8VY+RYcC3uYaao0aebQIhLo/KrFJrlEo7Uj9TZEe2A3ZRl/qx84d5CXGJ3+iGBzBVBeFpph8AyZdwQ68YLGTBU0h3GMQ8tcP0ly/1xB1PMwxKfR6z0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763637719; c=relaxed/simple;
	bh=Rs8ooFBPSKfUK1DL1yCmnFN6s/17Fbdt7pLBpWD/pdw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dhqNqwXh8bXb3H6tNsUxD41q0U2+AGfCCgWQ6lHb43DG+6XrjEudBcCjkZV0wj5ZR5Dwv5ggsXPKl6zKrkrx/zz8uGrArKiaEoYP7XxzilcjKXBA5wg4NWFcjs2fvHPAJqYlNUzBEZbLmrHVbx0YzG9r+FeGzSn5YwmV7kmv7w0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=r8jZgG0i; arc=none smtp.client-ip=209.85.222.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="r8jZgG0i"
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-8b2148ca40eso102881585a.1
        for <linux-doc@vger.kernel.org>; Thu, 20 Nov 2025 03:21:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763637716; x=1764242516; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=L5zCUgwcpkF8m5tNoKt/Ujm9UTWHftPsvcaYAaXWT8Y=;
        b=r8jZgG0ifk+mfHTOw3pXt1I8YJk2hJERJ1BxPCgiv75tVjuT2fsw/aEbniShCH6/Ia
         CiWKDZAbJAjywINWwyH8c24GD9wAeDMLqGpwid/o7NhaUIoXJyGBGs71mai8RlO2Tabt
         LTpwiUNTFrOFFceqScbbKzuppA79mN+pWPp/YqK6L4cpBYJrM/G6qoWS+arB5hnAMrTq
         ZGDLDYuWEvIU+g5WeJotk8OzlAAWXLla8yE1SR/0FFSKybz3ieKgtNb4S34ouGhri2OO
         9PQHIw1Oqd8q3rd8TAj1YzMeeNDYW/+CU1ULBS1OBgH7Y+9zYvFSHhg9+iHOHEnBi4Iw
         EWHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763637716; x=1764242516;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L5zCUgwcpkF8m5tNoKt/Ujm9UTWHftPsvcaYAaXWT8Y=;
        b=VwH/QNaLlqoNFJwYgKeVsBJHgXF6yskPEUPOeRxm9K7nDQCgYpj9PJ5Lbv9YihWZeY
         StPUEya7QPgQNzwhgKWqJ5Ep7OhH21ifvSzXWNdYEnmcfSxiJaO9w0ZdYeHEvK/RFhAR
         1HG7CINlXJqsrkRnTvMpa/6CIALQVYjcqazEtRHc47V67+hmmCL5xkP11peJNRoK8ywz
         PYWNHaeI9Lz1R5NuWSj8X4r/C7nloEZsEQblP+u4wtu/lp29yiViS3u9KP0ExaUEO4W6
         tzvTsLLsRljfWUWkAZ5E59Q/VNLFTnKP9AHNqqLcdctIXkCa20M44ANvEy2TgazG7L/e
         NoOA==
X-Forwarded-Encrypted: i=1; AJvYcCWeSRsaJC3W4dhQFNcpPN8etGHagnYOcq7WJfzq1BsP/hRr2FtNu/DGasdbWieHDaeqRkEJ6FYukjc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyiL8cW9HXHtD1SDbgvhO5CbEXZcbk4nn82djkEU8O2EKRQro8b
	pqre1Juys9slt063NNFZpjgeC0c5IGqaoAoPRcJuDVvhEiwgGE7q7Zkdw/ieKwinUsAKN1GVr4H
	niiASRqtUYvoSvJxAbKykNrC+v+M5wsj/Yvw7+CMPBg==
X-Gm-Gg: ASbGnctVP8MG7+GGJBe/284Q4CDoD19VBCKAeAFmKo6WL8S5qDRln8fEWSf5140r49F
	pvqTGqSkAWW6Al3iiwvs2mrNTDoB3rv4L8a72cdusa+B2HB5NFvNEP9UhE6+flg3wslPlZsaYol
	y3NWn3Oze2pk5nkGNl8opBhRo4m258OEeLVbLyRUwCa7AHh6YYtynXkMTEGNCKmFYdcKStM1KcD
	F8HfIG2Z0e5WW/tBYaBq9xpIEjFtD4QyYxXcsSJvv78jStjM2EkL7Ma/cjxacXgI5tjY9x4X4BJ
	c3Df0q6nX2sHbZWzY61r5X3X5VM/
X-Google-Smtp-Source: AGHT+IGftcFl62uPxiax/r1jkICBY3vztlPBz2EC42A67rYaYPPn8/nxfx4/Awa4o6J8ZUqzkrMvM++FycjBXss7I9M=
X-Received: by 2002:a05:620a:4609:b0:8b2:edc8:13d0 with SMTP id
 af79cd13be357-8b32731450emr356855285a.17.1763637716515; Thu, 20 Nov 2025
 03:21:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251118-james-cs-syncfreq-v5-0-82efd7b1a751@linaro.org> <20251118-james-cs-syncfreq-v5-4-82efd7b1a751@linaro.org>
In-Reply-To: <20251118-james-cs-syncfreq-v5-4-82efd7b1a751@linaro.org>
From: Mike Leach <mike.leach@linaro.org>
Date: Thu, 20 Nov 2025 11:21:45 +0000
X-Gm-Features: AWmQ_bkw8zvxNh6zB9690NSu381x529LRFBqHXFmLzzPZrP2-ZI1f3iaJvkZBHs
Message-ID: <CAJ9a7Vgj2P=PM2iFwSfL=GiDWtReCFn+QHUHXpkAg9y2vkocqw@mail.gmail.com>
Subject: Re: [PATCH v5 04/13] coresight: Hide unused ETMv3 format attributes
To: James Clark <james.clark@linaro.org>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jonathan Corbet <corbet@lwn.net>, 
	Leo Yan <leo.yan@arm.com>, Randy Dunlap <rdunlap@infradead.org>, coresight@lists.linaro.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 18 Nov 2025 at 16:28, James Clark <james.clark@linaro.org> wrote:
>
> ETMv3 only has a few attributes, and setting unused ones results in an
> error, so hide them to begin with.
>
> Signed-off-by: James Clark <james.clark@linaro.org>
> ---
>  drivers/hwtracing/coresight/coresight-etm-perf.c | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
>
> diff --git a/drivers/hwtracing/coresight/coresight-etm-perf.c b/drivers/hwtracing/coresight/coresight-etm-perf.c
> index 17afa0f4cdee..faebd7822a77 100644
> --- a/drivers/hwtracing/coresight/coresight-etm-perf.c
> +++ b/drivers/hwtracing/coresight/coresight-etm-perf.c
> @@ -106,8 +106,30 @@ static struct attribute *etm_config_formats_attr[] = {
>         NULL,
>  };
>
> +static umode_t etm_format_attr_is_visible(struct kobject *kobj,
> +                                         struct attribute *attr, int unused)
> +{
> +       /* ETM4 has all attributes */
> +       if (IS_ENABLED(CONFIG_CORESIGHT_SOURCE_ETM4X))
> +               return attr->mode;
> +
> +       /*
> +        * ETM3 only uses these attributes for programming itself (see
> +        * ETM3X_SUPPORTED_OPTIONS). Sink ID is also supported for selecting a
> +        * sink, but not used for configuring the ETM.
> +        */
> +       if (attr == &format_attr_cycacc.attr ||
> +           attr == &format_attr_timestamp.attr ||
> +           attr == &format_attr_retstack.attr ||
> +           attr == &format_attr_sinkid.attr)
> +               return attr->mode;
> +
> +       return 0;
> +}
> +
>  static const struct attribute_group etm_pmu_format_group = {
>         .name   = "format",
> +       .is_visible = etm_format_attr_is_visible,
>         .attrs  = etm_config_formats_attr,
>  };
>
>
> --
> 2.34.1
>
Reviewed-by: Mike Leach <mike.leach@linaro.org>


--
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK
