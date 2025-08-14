Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1DA9286436
	for <linux-doc@vger.kernel.org>; Thu, 14 Aug 2025 12:38:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755175108; cv=none; b=tKrItem5gwsKbnrtOkmicoFnHQB8txYUMmns/oM8FOs2nnvFCrqXDYtDGGdIsdmJq4qmAX5N7qoVFHVRrVtA8GYPMJF6u8j/x4iUigcYxXHqwEBHkSbSdo8OmDKsLhBf4H3SXzV7uQdHUmTKz01rqKbQBJ+1TouaFQQYjZaLZDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755175108; c=relaxed/simple;
	bh=p1B9+ooErqXDUtfYBKduvEAXjnYV8On2TECtaqCtlXo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Zi08j/DuuFC9iJrAL58COgYKkqBKv4y8jyh8pLssm5B6uTFQNPpjE64HhuEuIFL9JAixgom/9eMss2bSZ6bBDz09EW9+wD6TbDFZjeJhu4IqXSgR4I9R5ZDD6fTqXfM56JFTr+Ewl2BcGa89h3LwFIebHqNyUB9MpFE/t1KhWNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DKRZYtqC; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DKRZYtqC"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-323266b2368so652959a91.0
        for <linux-doc@vger.kernel.org>; Thu, 14 Aug 2025 05:38:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755175106; x=1755779906; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Y/SKouLfB4Dt96a+piQ7gJ9WekR4y2KBR6TTQHeQMIQ=;
        b=DKRZYtqCJo/Z3KCQEUhN6M1pHNEOgy3U+KUucsbx9BRkQ+DBUCt8VsmEDU5y8qYtVT
         YaJXDN7Nn12lKN5VUrsSSBChWrc4O4jpMrov0S8dNd4cimTWp+tbliJaGi+pLZpN4fHO
         QJgst7Vdwq8z+zd7a17o5syIyhLYax5C9edxT9S/iBQ4zedN0xk+c8I1v6/m5m0tFPsq
         ryhuK9VEhQMHdKgeY4pkALCC8Fkk1oHnqSrvshfKK2ZvoyYkM+K25o2cyIt2orD3vbr6
         Go+ezIqxcCYtRqM+KmQutzoUMlfpR1uhOUz/ARpxnQAMJBZKQFV6nnHtWeZn3E760Smf
         cR2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755175106; x=1755779906;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y/SKouLfB4Dt96a+piQ7gJ9WekR4y2KBR6TTQHeQMIQ=;
        b=vKzrhkpvUMSXyCBZ+veBrYZvq9ebgcjDiDQMWYM2m4KW/SpRLz+0f0AMfC3ocFHeA7
         n/vO+VAYxr+d8/0M/qO7rrF4RvMwXF+PPJchAfOukGaexCo6CixCiRFZsTx/CQKRoxNw
         SFiNW+XnJZgAOJUKkga8tNGst9MEWifCpasgkwBpGsAxAlQECHCw1jnNRbGJ5vut82Xg
         rpKY/Z/CYM1BOA/zpQlhp31HHhCLzxU0XUHJs13orReFm6woWGJn80bW4eJipJE9E+em
         2W16nOcvVVTzbx+8EjOs+97LSOF9znAbioaZmewdfM9NTOpvEJDJo0fKFBsvbPKBztSV
         MMeA==
X-Forwarded-Encrypted: i=1; AJvYcCXMs6kz+zsXYUQkNWZxlpXSZQITM58A6F5s/BSOcgESrDhKlYVo2M7K4kMR+O1FX4u9a3rApg1eTqs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9i00sVWyjvUvXo+yRiZwZiAhWG8G3KGxVxNZWPqVt4HQ37hQh
	U+XkHtIvCmc6T5yFrvizPuMO2UXUt8X1eFZRn9hrveGjl63EoW60yAgBIseqaIoYlQylYq1QBAh
	+juTYEI7IwVCV4ryq7n/JjU7Of0pft8l8ixC7/5rsfQ==
X-Gm-Gg: ASbGncsmdqFjl2XatJw2MFEsRSls77aTdCY1nFucPCByRotKbWyDRVdXvQ3ZQiaaoYi
	0NxrgKFyclNlAYQ1xn7fZWXvoKDFM0ZA0HEpXPrP6d3meCGUsTwUYOWJ01euMl1SbO0r2Z34P7v
	/i5XwlnpWFs0nrlCnZJdgjG2V0oNJ8H+Qmg2TWEvWcaXh+FREHn00FUP+jdtks/q18dG4VQXPpb
	1vTmhJX
X-Google-Smtp-Source: AGHT+IGSclopDnHf9B3zonnvXINSROJBoUEpQ4myknxB/jv0JOS4+2qsCtwFneFqnIPDyDUqajH3gvHZEPoUUbizmJs=
X-Received: by 2002:a17:90b:3e8e:b0:31e:c95a:cef8 with SMTP id
 98e67ed59e1d1-3232b7b7707mr2940353a91.32.1755175105752; Thu, 14 Aug 2025
 05:38:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250811-james-cs-syncfreq-v1-0-b001cd6e3404@linaro.org> <20250811-james-cs-syncfreq-v1-3-b001cd6e3404@linaro.org>
In-Reply-To: <20250811-james-cs-syncfreq-v1-3-b001cd6e3404@linaro.org>
From: Mike Leach <mike.leach@linaro.org>
Date: Thu, 14 Aug 2025 13:38:14 +0100
X-Gm-Features: Ac12FXzyxxKA_BOyrBNq7M0owGv4_wTgorvEm4dWj6LYiHxzxFQ-EPbV7AZ31P0
Message-ID: <CAJ9a7VhXAhDHkpyA6gHWPfr+HAEFLEPa01vx0n=b+82TrEMUTQ@mail.gmail.com>
Subject: Re: [PATCH 3/6] coresight: Repack struct etmv4_drvdata
To: James Clark <james.clark@linaro.org>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jonathan Corbet <corbet@lwn.net>, 
	Leo Yan <leo.yan@arm.com>, coresight@lists.linaro.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 11 Aug 2025 at 10:32, James Clark <james.clark@linaro.org> wrote:
>
> Fix holes and convert the long list of bools to single bits to save
> some space because there's one of these for each ETM.
>
> Signed-off-by: James Clark <james.clark@linaro.org>
> ---
>  drivers/hwtracing/coresight/coresight-etm4x.h | 39 ++++++++++++++-------------
>  1 file changed, 20 insertions(+), 19 deletions(-)
>
> diff --git a/drivers/hwtracing/coresight/coresight-etm4x.h b/drivers/hwtracing/coresight/coresight-etm4x.h
> index a355a1e9606d..1c67b263b01b 100644
> --- a/drivers/hwtracing/coresight/coresight-etm4x.h
> +++ b/drivers/hwtracing/coresight/coresight-etm4x.h
> @@ -1020,29 +1020,30 @@ struct etmv4_drvdata {
>         u8                              ns_ex_level;
>         u8                              q_support;
>         u8                              os_lock_model;
> -       bool                            sticky_enable;
> -       bool                            boot_enable;
> -       bool                            os_unlock;
> -       bool                            instrp0;
> -       bool                            q_filt;
> -       bool                            trcbb;
> -       bool                            trccond;
> -       bool                            retstack;
> -       bool                            trccci;
> -       bool                            trc_error;
> -       bool                            syncpr;
> -       bool                            stallctl;
> -       bool                            sysstall;
> -       bool                            nooverflow;
> -       bool                            atbtrig;
> -       bool                            lpoverride;
> +       bool                            sticky_enable : 1;
> +       bool                            boot_enable : 1;
> +       bool                            os_unlock : 1;
> +       bool                            instrp0 : 1;
> +       bool                            q_filt : 1;
> +       bool                            trcbb : 1;
> +       bool                            trccond : 1;
> +       bool                            retstack : 1;
> +       bool                            trccci : 1;
> +       bool                            trc_error : 1;
> +       bool                            syncpr : 1;
> +       bool                            stallctl : 1;
> +       bool                            sysstall : 1;
> +       bool                            nooverflow : 1;
> +       bool                            atbtrig : 1;
> +       bool                            lpoverride : 1;
> +       bool                            state_needs_restore : 1;
> +       bool                            skip_power_up : 1;
> +       bool                            paused : 1;
>         u64                             trfcr;
>         struct etmv4_config             config;
>         u64                             save_trfcr;
>         struct etmv4_save_state         *save_state;
> -       bool                            state_needs_restore;
> -       bool                            skip_power_up;
> -       bool                            paused;
> +
>         DECLARE_BITMAP(arch_features, ETM4_IMPDEF_FEATURE_MAX);
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
