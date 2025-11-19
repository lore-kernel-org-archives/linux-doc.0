Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A77C6288C3D
	for <linux-doc@vger.kernel.org>; Wed, 19 Nov 2025 09:33:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763544784; cv=none; b=tv+I5EUtJpyYn1NEs/o2dt1QMTVXpa4yXNn6ZlpLAWMWI4FV0pUS5biKQNFzjWr3x5+N9AStmyTs9tWnBmkx8wq2esh4AZ8oD1JSpfTlPsYul8GsIcDwrpLsxEYb2rZvNH3S1VTB7p8qICUZiIgOyqUSYdweMlVJtzpGbUYl3co=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763544784; c=relaxed/simple;
	bh=CAZD4uf9D9aVlRjhPI5Q+cUgTdy7YeI2V8XMq0FAnjM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bNHXAPh8KsPoTYvpfLA97pQVPVEuYN95rSk73Es3LlRVlnoMkaBjuNbmUn8aGbGj/M8Wa3RDRwgy71oHAmmFRVeLNt+7pL++/ZZjw5VOgt+JcdoX55z2vA27edFu36su2ArzLO85JeT2rCpJd2SDcslTCTGrF3jSIq3DUxMNCIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FNQ0vH2w; arc=none smtp.client-ip=209.85.222.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FNQ0vH2w"
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-8b23b6d9f11so628312685a.3
        for <linux-doc@vger.kernel.org>; Wed, 19 Nov 2025 01:33:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763544781; x=1764149581; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=DiKyAko1CiKmjIm1YZo69KyzTEMTjrDMipirUCdeTOs=;
        b=FNQ0vH2wR7GHmhB3MofgC0Gem9q6ewPsoD8gz1pkZv3YR7dAekW/RxlWvw2Dd8TWXn
         cnY44kayhuxVqRsmpUL0tUgQreQWvNkuZZj315g0hvd68t0WIC5qDwuVXCJxFRaHZa9W
         6fzb1TrvafZ9FSPrq2Kd04fPkRnZ1kPfagJgemUNwAMgzZzCTtglgqMnMJOKTUCxkadG
         yrm9DrHzDvgFXU/5uDNeri8gg+HmEelO/XQMOegwts/juuOKS3bywwuXzD36ahkSNSh/
         KtP4356oN/r35r2GtUs6UDSXrZKX6Dey2qAhgmgZsOe+RLm8xW+kSYdE5kXq1uDgpawb
         hSnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763544781; x=1764149581;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DiKyAko1CiKmjIm1YZo69KyzTEMTjrDMipirUCdeTOs=;
        b=n0SQFbwzFGV6UYIUrs5EEahysumehQclpcyn7EGdDUD+h3fmQlp3gh+mZgn80iNHpI
         gkOJYD8eYTfZYq0o+g7jWON0gslczYWZ+jTVtn47BAYIRHqENB8S46M8tqBgAfwO80hE
         yiuwjfUhNg9gl9NkfkMF3FxSK/68RrlFpA7hr39roF2DieaMea8tKC5L8Z3FjQdzSG1q
         EtwEmDTYswPxB+5KREtucj/dludlnEWoPskTWO0CAm7K6BH0yXnNZgQ4AgoR0fKCGwbR
         azPFQs0mS75UEjc8vRPv8SD8OtVca/EESYisNgyMxWUGLFAkfT81nUld2bTvnkk8+8MS
         e4Vg==
X-Forwarded-Encrypted: i=1; AJvYcCXiMV2Bof5ZFkOtJoGI4GT7pr0MUdbZ36NxFbC/Yp9xIk3ANaSJMpYHlF58+m+br/ROdSKTxOyELYk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwTgokSy9nbt7Zo+iToWjzpgcMAddPqe877wfXb5Cr+fEHB7Sw4
	a04uE0q7x5XOPtsIucuEP4RroZdO3ZYbHT+i1FX02v6U8/tv8nuv4XEo2sNuxioiZ6QO4ro8UPs
	B+7RDXHPiWxJbQM1/U8c8N+3uy6oRopqeeMqIt4ibUw==
X-Gm-Gg: ASbGncsMgdykbVIOprZcWxe58G2P2i/PlEo3yDzKWRG6rpF6uFAobgga+PJyP2hiR74
	kql8vAxQfefXFeM/QYSAWuexzZQn4Sw0c+Ie7FQV2xk2eFNPzvqdWUDNRnBi42pEALgACPU+8lr
	uZxSrrJ8SU38bLAMA4xZ0Gx3ckCVMyviMHCTbOeF03divJ0b+PS/BdPh+oqBa4fG5TqdSFs2bUO
	lQUT6PFHOYT0ETY/FR47yOn+GtU8+85XRr0wS8+0cyDnQRuXQdbSw4IrUWWryZdEpRMt4pF5ysb
	3ypZ23KxoC57lTzQ3wh2MCZaifSUF8JcUv+sligjdPhq0jY3fA==
X-Google-Smtp-Source: AGHT+IHXtmQob1b7Rs4cNBuYrALG5hGMqWQXnzmK+aNypH2iP2VuDHlxsl2YjI4dIm1Td/krkHWR6B7QIhb7w94VNog=
X-Received: by 2002:a05:620a:7103:b0:8b2:e704:5626 with SMTP id
 af79cd13be357-8b31701c1c9mr296607785a.38.1763544781519; Wed, 19 Nov 2025
 01:33:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251118-james-cs-syncfreq-v5-0-82efd7b1a751@linaro.org> <20251118-james-cs-syncfreq-v5-8-82efd7b1a751@linaro.org>
In-Reply-To: <20251118-james-cs-syncfreq-v5-8-82efd7b1a751@linaro.org>
From: Mike Leach <mike.leach@linaro.org>
Date: Wed, 19 Nov 2025 09:32:50 +0000
X-Gm-Features: AWmQ_blt4kfPQ_sXTgGskmfmHkLnOJSOj0nXDD6BuZsfj4XK6KdoYdmlWkDkB4M
Message-ID: <CAJ9a7VgQH4yc8490CQSv1S6k+=Uc6dEjyEpgRp1EwUQdwdxOHQ@mail.gmail.com>
Subject: Re: [PATCH v5 08/13] coresight: Interpret perf config with ATTR_CFG_GET_FLD()
To: James Clark <james.clark@linaro.org>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jonathan Corbet <corbet@lwn.net>, 
	Leo Yan <leo.yan@arm.com>, Randy Dunlap <rdunlap@infradead.org>, coresight@lists.linaro.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi James

On Tue, 18 Nov 2025 at 16:28, James Clark <james.clark@linaro.org> wrote:
>
> The "config:" string construction in format_attr_contextid_show() can be
> removed because it either showed the existing context1 or context2
> formats which have already been generated, so can be called themselves.
>
> The other conversions are straightforward replacements.
>
> Signed-off-by: James Clark <james.clark@linaro.org>
> ---
>  drivers/hwtracing/coresight/coresight-etm-perf.c | 26 +++++++++++++++---------
>  1 file changed, 16 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/hwtracing/coresight/coresight-etm-perf.c b/drivers/hwtracing/coresight/coresight-etm-perf.c
> index 28f1bfc4579f..1b9ae832a576 100644
> --- a/drivers/hwtracing/coresight/coresight-etm-perf.c
> +++ b/drivers/hwtracing/coresight/coresight-etm-perf.c
> @@ -80,12 +80,19 @@ static ssize_t format_attr_contextid_show(struct device *dev,
>                                           struct device_attribute *attr,
>                                           char *page)
>  {
> -       int pid_fmt = ETM_OPT_CTXTID;
> +       /*
> +        * is_kernel_in_hyp_mode() isn't defined in arm32 so avoid calling it
> +        * even though is_visible() prevents this function from being called.
> +        */
> +#if IS_ENABLED(CONFIG_ARM64)
> +       if (is_kernel_in_hyp_mode())
> +               return contextid2_show(dev, attr, page);
>
> -#if IS_ENABLED(CONFIG_CORESIGHT_SOURCE_ETM4X)
> -       pid_fmt = is_kernel_in_hyp_mode() ? ETM_OPT_CTXTID2 : ETM_OPT_CTXTID;
> +       return contextid1_show(dev, attr, page);
> +#else
> +       WARN_ONCE(1, "ETM contextid not supported on arm32\n");
> +       return 0;

Context ID is supported in aarch32 - and traced in etmv3 / ptm and etmv4.

Mike

>  #endif
> -       return sprintf(page, "config:%d\n", pid_fmt);
>  }
>
>  static struct device_attribute format_attr_contextid =
> @@ -337,7 +344,7 @@ static bool sinks_compatible(struct coresight_device *a,
>  static void *etm_setup_aux(struct perf_event *event, void **pages,
>                            int nr_pages, bool overwrite)
>  {
> -       u32 id, cfg_hash;
> +       u32 sink_hash, cfg_hash;
>         int cpu = event->cpu;
>         cpumask_t *mask;
>         struct coresight_device *sink = NULL;
> @@ -350,13 +357,12 @@ static void *etm_setup_aux(struct perf_event *event, void **pages,
>         INIT_WORK(&event_data->work, free_event_data);
>
>         /* First get the selected sink from user space. */
> -       if (event->attr.config2 & GENMASK_ULL(31, 0)) {
> -               id = (u32)event->attr.config2;
> -               sink = user_sink = coresight_get_sink_by_id(id);
> -       }
> +       sink_hash = ATTR_CFG_GET_FLD(&event->attr, sinkid);
> +       if (sink_hash)
> +               sink = user_sink = coresight_get_sink_by_id(sink_hash);
>
>         /* check if user wants a coresight configuration selected */
> -       cfg_hash = (u32)((event->attr.config2 & GENMASK_ULL(63, 32)) >> 32);
> +       cfg_hash = ATTR_CFG_GET_FLD(&event->attr, configid);
>         if (cfg_hash) {
>                 if (cscfg_activate_config(cfg_hash))
>                         goto err;
>
> --
> 2.34.1
>


-- 
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK
