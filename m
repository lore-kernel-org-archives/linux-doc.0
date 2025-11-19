Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1395634B19A
	for <linux-doc@vger.kernel.org>; Wed, 19 Nov 2025 11:45:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763552726; cv=none; b=fWrKkdn0GaGhM58PaBPO5AqQGIRd34mxm112Bz9Btokwc7Uo1sZ8hrEOpsqAnTDuw5XtctH0TIiHTQ4Co+MmYj98r5cIcFhIUc9ZsTTa7rYbCjrKJGqkkb0SFkLin/jBn5ueVvrvL23WFBLhzld8w/K2fQh4ksdQeV/VfGHtNiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763552726; c=relaxed/simple;
	bh=PXGL/FP4czkj/o4KAhEKJky9m5cabIk6iFNP/EV2YRk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XX7MYRMxSqzhcVkPD6BjY+/QhLhudFSCC00pWoTEtBlv9hc01BXuh36Yt5gvCHB1UoKSJ5XZKL7RtEPIIsYDzKtHKxfSnGj0ok6VTuEMf00FNd+K/RvkLU2uLzC/mBi/Aly3DgSZDD6EDaCzvOxl9CTCm3i0lfhnnR8XnQyLBjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=h8rwk1fU; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="h8rwk1fU"
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-8b2a4b6876fso837583885a.3
        for <linux-doc@vger.kernel.org>; Wed, 19 Nov 2025 03:45:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763552724; x=1764157524; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Ed4Dydxg4iY705zW5b/jYW5HOtHMKCF/y5HtYetJu1Q=;
        b=h8rwk1fUbzgudWNyxr9UpduQgn9kkScOzebOa+tdIWmLJKCSl8ZjFtPVvG0VP5rxHw
         Q03snd8WbvwdGoiQ/uBkWc0DrzGhrPzgmku6WHcpsz3QS/iZRGesaK2xpBHSBBql4eXs
         Fhlfjr+3nc+GDEFrTKspOS1ei/f7rQbTCD7qcQqMYDSWgnRHHRAVOX0RY7v65i8s5pk6
         5nhVOtMDTixQR/alNpezjIfOSyPuLNVKTLfpPokQsz3AJI9Cfamm3Nds7L9gtVQALTvT
         HNnnEAdblMdQSUNRh0/v7viHXwJoqkXlgY6ZDkw2VodoWGNyscfIR06qAg8hq6xRJqpb
         fn/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763552724; x=1764157524;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ed4Dydxg4iY705zW5b/jYW5HOtHMKCF/y5HtYetJu1Q=;
        b=LHwyFDqi3IW87KZTJuf2Al2KY9Kktx8ZaCmQcfsS7uBvmz1xXca41Ps6C2xBd9Pga5
         3W9LXk+geeZLH5oHILa4TcHWGAx+0DlCS7quwg8kpEgIuTtsON+hG8I7texHmNIuk4Wu
         11/UAy4PIq72FEBGyBtkqm4Dt+qb/bbmMu2UCq52vMHBNVqgj6nXsWvzw0weg83xNAry
         gDUA5Gy0r1urV/yx17iSqjcnzbwDnT4PKIA2/9IJomF9vSE7+qXYj+Exb6I768FM/G3s
         Kc99xS1JgNk5sY7tFE0M9aYxGjV7G7b0cM+Ui/zu1eeiCT8xjNiVnCE0119Rkqwb3IWW
         57eA==
X-Forwarded-Encrypted: i=1; AJvYcCWnP4Mf9ECv2G2dgQVsNCPCzuX2Bi5E8dUuJlQnmI6xAoq1U86koAC/tIP0cp4aXBVXFHuY3KO8yqA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzLTXAnV2B0y+N7wHPSvwrEgPBp+aXROYGF5HaTelk/3abOauuL
	bvDqF5+weJQCNJIdF8+pDlafbc5iDL4MMnZJ60kUqoKXsW6i7QujlnB4lIRFjsdz5203TDEQ6ZN
	Go0vvil+cM4fn2xqZa/quG3cYwml9lvcqwd2cBmLqrQ==
X-Gm-Gg: ASbGncv1uNP+0TMVPfy1y9z+I2z+HOKoz5Kp+kt9RhzLNevXT6sr1d5vu6HtZY5Hp/S
	Ztjze2MSWiu6ts+OB2AHIiyGbYOedDTxaM5hDt092Jl0xOavh/w1ITrFMrjKaK08KvDM2gO445a
	BTgrH625JydOZsf09Z3A9p3AGBlMjmYbVvxg4AOEPwgu2U01jmmkaumr8Cx8FxxTRyQ836Tx5Os
	3lRleukj9J1C7nX/CWJoVVLSxZQohjkmJ2U5YLOVzfEg57HHuzbFf2OptbqDDifnw/DK7PkJrj8
	z+JSlOyUbay+BZhZ+xnNVzbfeAOYNEUqAtOnxDo14nhp5m8B/w==
X-Google-Smtp-Source: AGHT+IEDXViXTZ73FVo6/KsQ3F595W6URZvEq6U8EMaBp6NQP2CAzPlJ77FmXdspCIEOO9KZ/cgPukGFikDQSyW8kSc=
X-Received: by 2002:a05:622a:7e49:b0:4ee:5fc:43d8 with SMTP id
 d75a77b69052e-4ee05fc4b20mr149384621cf.21.1763552723829; Wed, 19 Nov 2025
 03:45:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251118-james-cs-syncfreq-v5-0-82efd7b1a751@linaro.org>
 <20251118-james-cs-syncfreq-v5-8-82efd7b1a751@linaro.org> <CAJ9a7VgQH4yc8490CQSv1S6k+=Uc6dEjyEpgRp1EwUQdwdxOHQ@mail.gmail.com>
 <416cf32d-d647-46dd-bcef-acc019490561@linaro.org>
In-Reply-To: <416cf32d-d647-46dd-bcef-acc019490561@linaro.org>
From: Mike Leach <mike.leach@linaro.org>
Date: Wed, 19 Nov 2025 11:45:12 +0000
X-Gm-Features: AWmQ_bnzSRG4iB6fbtTwoZEOZ8nJyrsroAOJ3GpmuRTr0m-QQvY3mph-2fZSpwo
Message-ID: <CAJ9a7Vg9HsMsTP-zroTgaaKWTPkSXE1u5WMORuqMLKSDDz2HSw@mail.gmail.com>
Subject: Re: [PATCH v5 08/13] coresight: Interpret perf config with ATTR_CFG_GET_FLD()
To: James Clark <james.clark@linaro.org>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jonathan Corbet <corbet@lwn.net>, 
	Leo Yan <leo.yan@arm.com>, Randy Dunlap <rdunlap@infradead.org>, coresight@lists.linaro.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi James

On Wed, 19 Nov 2025 at 11:26, James Clark <james.clark@linaro.org> wrote:
>
>
>
> On 19/11/2025 9:32 am, Mike Leach wrote:
> > Hi James
> >
> > On Tue, 18 Nov 2025 at 16:28, James Clark <james.clark@linaro.org> wrote:
> >>
> >> The "config:" string construction in format_attr_contextid_show() can be
> >> removed because it either showed the existing context1 or context2
> >> formats which have already been generated, so can be called themselves.
> >>
> >> The other conversions are straightforward replacements.
> >>
> >> Signed-off-by: James Clark <james.clark@linaro.org>
> >> ---
> >>   drivers/hwtracing/coresight/coresight-etm-perf.c | 26 +++++++++++++++---------
> >>   1 file changed, 16 insertions(+), 10 deletions(-)
> >>
> >> diff --git a/drivers/hwtracing/coresight/coresight-etm-perf.c b/drivers/hwtracing/coresight/coresight-etm-perf.c
> >> index 28f1bfc4579f..1b9ae832a576 100644
> >> --- a/drivers/hwtracing/coresight/coresight-etm-perf.c
> >> +++ b/drivers/hwtracing/coresight/coresight-etm-perf.c
> >> @@ -80,12 +80,19 @@ static ssize_t format_attr_contextid_show(struct device *dev,
> >>                                            struct device_attribute *attr,
> >>                                            char *page)
> >>   {
> >> -       int pid_fmt = ETM_OPT_CTXTID;
> >> +       /*
> >> +        * is_kernel_in_hyp_mode() isn't defined in arm32 so avoid calling it
> >> +        * even though is_visible() prevents this function from being called.
> >> +        */
> >> +#if IS_ENABLED(CONFIG_ARM64)
> >> +       if (is_kernel_in_hyp_mode())
> >> +               return contextid2_show(dev, attr, page);
> >>
> >> -#if IS_ENABLED(CONFIG_CORESIGHT_SOURCE_ETM4X)
> >> -       pid_fmt = is_kernel_in_hyp_mode() ? ETM_OPT_CTXTID2 : ETM_OPT_CTXTID;
> >> +       return contextid1_show(dev, attr, page);
> >> +#else
> >> +       WARN_ONCE(1, "ETM contextid not supported on arm32\n");
> >> +       return 0;
> >
> > Context ID is supported in aarch32 - and traced in etmv3 / ptm and etmv4.
> >
> > Mike
> >
>
> Not in Perf mode unless I'm missing something:
>
> #define ETM3X_SUPPORTED_OPTIONS (ETMCR_CYC_ACC | \
>                                  ETMCR_TIMESTAMP_EN | \
>                                  ETMCR_RETURN_STACK)
>
> Only these options are currently accepted. I suppose the comment is
> describing what the current behavior is, whether that is what we want is
> another thing.
>
> But if we do start supporting context ID in ETMv3 we can update that
> comment.
>

Unlikely - but the comment seems to conflate core architecture and etm
architecture.
A core with aarch32 can be traced in etm4 - i.e etm4 supports A64, A32
and T32 instruction sets.
If this set gets another version it might be worth saying "not
ETMv3/PTM" rather than not A32.

Mike


> >>   #endif
> >> -       return sprintf(page, "config:%d\n", pid_fmt);
> >>   }
> >>
> >>   static struct device_attribute format_attr_contextid =
> >> @@ -337,7 +344,7 @@ static bool sinks_compatible(struct coresight_device *a,
> >>   static void *etm_setup_aux(struct perf_event *event, void **pages,
> >>                             int nr_pages, bool overwrite)
> >>   {
> >> -       u32 id, cfg_hash;
> >> +       u32 sink_hash, cfg_hash;
> >>          int cpu = event->cpu;
> >>          cpumask_t *mask;
> >>          struct coresight_device *sink = NULL;
> >> @@ -350,13 +357,12 @@ static void *etm_setup_aux(struct perf_event *event, void **pages,
> >>          INIT_WORK(&event_data->work, free_event_data);
> >>
> >>          /* First get the selected sink from user space. */
> >> -       if (event->attr.config2 & GENMASK_ULL(31, 0)) {
> >> -               id = (u32)event->attr.config2;
> >> -               sink = user_sink = coresight_get_sink_by_id(id);
> >> -       }
> >> +       sink_hash = ATTR_CFG_GET_FLD(&event->attr, sinkid);
> >> +       if (sink_hash)
> >> +               sink = user_sink = coresight_get_sink_by_id(sink_hash);
> >>
> >>          /* check if user wants a coresight configuration selected */
> >> -       cfg_hash = (u32)((event->attr.config2 & GENMASK_ULL(63, 32)) >> 32);
> >> +       cfg_hash = ATTR_CFG_GET_FLD(&event->attr, configid);
> >>          if (cfg_hash) {
> >>                  if (cscfg_activate_config(cfg_hash))
> >>                          goto err;
> >>
> >> --
> >> 2.34.1
> >>
> >
> >
>


-- 
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK
