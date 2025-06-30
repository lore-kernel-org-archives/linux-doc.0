Received: from mail-il1-f180.google.com (mail-il1-f180.google.com [209.85.166.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28B5B8460
	for <linux-doc@vger.kernel.org>; Mon, 30 Jun 2025 15:35:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751297736; cv=none; b=ZyN6TOq4Mh2OgY0IlvcPTswP86NV1HsWJCCOU1UFArmgrc2F0XWJsa4Uj+DYQmJ4nAzzmZk2e+zRYbcOYeokb70rtIp87JV9Nuqpf/5oLCgK/sM/Z61vytb5d3Ka3qMSZ9bz0X3y+cpaqcpSSS+GBOeymQi/cOZlI0Z+ALau+is=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751297736; c=relaxed/simple;
	bh=WzUsL62s99aMQbncJlzVXJNCLYFnik+CIGI7EJNTcOU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QN2ilYVXix3xW8QZ+vONj9d7AOeNCPIaoxOelw+IcvLYFgtAgQ9jt9DAb1FflmoTZy9UIhQyfV4qXotGw6zpLeR2FFInTttVX3KbEp2CJ2xtYo3nHNmZZpnEZZBBidnqgHOxURLVGKJYsLhG+RE54SB0/o3nWnq6ouddivStWxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ByZZzgEO; arc=none smtp.client-ip=209.85.166.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ByZZzgEO"
Received: by mail-il1-f180.google.com with SMTP id e9e14a558f8ab-3ddc99e0b77so488625ab.0
        for <linux-doc@vger.kernel.org>; Mon, 30 Jun 2025 08:35:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1751297733; x=1751902533; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VbO9psxgk55oppNmRGWDGVoNc1FLKxrpCgi5quujmE0=;
        b=ByZZzgEOrsnKfKVfx0kLc6+wQRCMi30ELjB5ZTTNVkJ+gY7CSb9cYvkof+UsdCR96w
         ULMiQSG1+HV/Zv72bzEmiXP9e/lFQ/q9fpqD2OdZaZgafwKkn6fLLELouDwGCf8OjAGN
         FbxxmF/WpKY22R0gceT9HfVP8WUTM9DndZ5OAtzDExAAtY0b4We7Jl+DDSVyYsdiatyz
         z51RYlMMsCznCrJ+EdsCcnqcbNJBTN6WX0Mr+2+Os0bloILRu9wy4GxlZw6I/UOW5K4D
         x7nEtlFloWPa3fl2SfpVrChHgT2FdyDXEe7rjKeBi2Vxp2jtt5MB1kWBjCGMmh9bFuxZ
         /M+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751297733; x=1751902533;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VbO9psxgk55oppNmRGWDGVoNc1FLKxrpCgi5quujmE0=;
        b=ezFDjdaxNs6I9I7hkbe6MlwIB81jh1+RHhtaToyTuxHvS5JgPh4/y7gIiYavaC67KK
         yDuQ8LJzQDmLqtPtmwQdAjWnyfQHYScW3bx2lBFs26RKikIRyjjPL7MWBe7xG0w1emmz
         9K4pm/n3aXIeSotHqh+wvkQj8Ya1KehAfhTlnRclN7ghm17UexFCzggQqpR9S8Kicz+Z
         PKqxWMUmaUXNzA5e2UlhjY80TuQewmYMttzOmgLNK9MZMyshINnJ/RLsRiVgnfVTjQV4
         3FpIVXPMQHyrN9u8ZO8GYYFGxuJYSTOCG2yJ4fudbPDjkXOLAf6NmTBOOvvkCBTmjKNG
         MP0A==
X-Forwarded-Encrypted: i=1; AJvYcCUpmnQ7ZaNHQ7rn1OMZl0t9GdnS0yimZnIEUxZRQMN7/wA7LqE2qEVUlUxd22npoS7ntZd2XCdvPGE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyMY1Gl2DqtQpseIWNTpbG0ISo1sKRYKBy5LU4+CLMlVvA3Mmd/
	mBisP1fIjNonDet6gULvm2j1ZLDyjrlX1E6Q31zUNNLU+lQY1rhvZAaeBf2CZ99BlXWT9VxHN3B
	3XH9hdDfeC2zbeBypMk5dD+iApliP0f9TuGfYD8NC
X-Gm-Gg: ASbGnctJE/QwZHxhjQRYJVOoggLgybwEyUbftpbbIUa0b+ZNb+iXArxrkgQV63xNf/k
	+H+ZzMPy9/D++2sCFvXZUStBSIuPUts4ncSI+CP4V2kSkYoFqPk9gkLa855/ruzW/6V6t9UAMDQ
	n8fBU94VG5+OsOTR0pPDvob8v0mYzKdfdNnlKeWkqGt622+UYBvE0e8Od4OELU17lx28acDJRvy
	vHYQrMWzA==
X-Google-Smtp-Source: AGHT+IHOX7kF7dn11PIYsXqc5Lvgd9CFgVl0JgQOIRErwaVxAn3VrCW+V5ML7ah9kVF847kUzTGbYaJQz6lAmBOdyCw=
X-Received: by 2002:a05:6e02:1a6c:b0:3dd:d664:7e0d with SMTP id
 e9e14a558f8ab-3df56d1d4famr6330985ab.25.1751297732904; Mon, 30 Jun 2025
 08:35:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250605-james-perf-feat_spe_eft-v3-0-71b0c9f98093@linaro.org> <20250605-james-perf-feat_spe_eft-v3-6-71b0c9f98093@linaro.org>
In-Reply-To: <20250605-james-perf-feat_spe_eft-v3-6-71b0c9f98093@linaro.org>
From: Ian Rogers <irogers@google.com>
Date: Mon, 30 Jun 2025 08:35:20 -0700
X-Gm-Features: Ac12FXyUBSBjSl_fXOEDXQ0KnLnvxPP2kraYhFsM6cPyGu_cMbUCD4cbUl7FD2s
Message-ID: <CAP-5=fVZjqapNHhZ_Gro39JmJ-57nEun-SQhM_rd=MkQbx3GLA@mail.gmail.com>
Subject: Re: [PATCH v3 06/10] perf: Add perf_event_attr::config4
To: James Clark <james.clark@linaro.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, leo.yan@arm.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linux-doc@vger.kernel.org, 
	kvmarm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 5, 2025 at 3:50=E2=80=AFAM James Clark <james.clark@linaro.org>=
 wrote:
>
> Arm FEAT_SPE_FDS adds the ability to filter on the data source of a
> packet using another 64-bits of event filtering control. As the existing
> perf_event_attr::configN fields are all used up for SPE PMU, an
> additional field is needed. Add a new 'config4' field.
>
> Reviewed-by: Leo Yan <leo.yan@arm.com>
> Tested-by: Leo Yan <leo.yan@arm.com>
> Signed-off-by: James Clark <james.clark@linaro.org>

Reviewed-by: Ian Rogers <irogers@google.com>

Thanks,
Ian

> ---
>  include/uapi/linux/perf_event.h | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/include/uapi/linux/perf_event.h b/include/uapi/linux/perf_ev=
ent.h
> index 78a362b80027..0d0ed85ad8cb 100644
> --- a/include/uapi/linux/perf_event.h
> +++ b/include/uapi/linux/perf_event.h
> @@ -382,6 +382,7 @@ enum perf_event_read_format {
>  #define PERF_ATTR_SIZE_VER6                    120     /* Add: aux_sampl=
e_size */
>  #define PERF_ATTR_SIZE_VER7                    128     /* Add: sig_data =
*/
>  #define PERF_ATTR_SIZE_VER8                    136     /* Add: config3 *=
/
> +#define PERF_ATTR_SIZE_VER9                    144     /* add: config4 *=
/
>
>  /*
>   * 'struct perf_event_attr' contains various attributes that define
> @@ -543,6 +544,7 @@ struct perf_event_attr {
>         __u64   sig_data;
>
>         __u64   config3; /* extension of config2 */
> +       __u64   config4; /* extension of config3 */
>  };
>
>  /*
>
> --
> 2.34.1
>
