Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D83A322DA4
	for <linux-doc@vger.kernel.org>; Mon, 18 Aug 2025 15:52:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755532323; cv=none; b=GkXtfvlLNxL22D1OiWUeou/fOKTPiskp87gPf0k15FeaU51siLKgaAI9P9p2uSvpUJakH6dPdk1NRMlfJcqUVVxBuorpawrw44srFhTG2XaqTv3/63K+MXOo99AFdBXxLs2ftW19ieBoSz+xhCYfgl66hzWFgiwOxyDavJK/0t0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755532323; c=relaxed/simple;
	bh=78CPDCFp5nzoxHHBT0nHL9r7Uu+5xAhmDWdsc9UL2k0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OeAXHuHWwYYjMw66kpcDZaRFVIwTXSPNKj94TqA/x02WBNet7reLa9wpFEa7C5A7VYydVQUbhNIrZLAR8tFycKh9QjWr/nsDY9PoJoas4LPSP09tHALyZOB537dZNQFwhN0quSn7rQZ5I5o3qaZknadoK752myW4u1PqKcktj0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=l2aitdjZ; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="l2aitdjZ"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-242d1e947feso383575ad.0
        for <linux-doc@vger.kernel.org>; Mon, 18 Aug 2025 08:52:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1755532321; x=1756137121; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jhFVRc1NfpOXTxJauWn9T+QK0y3Sx+B3L8yuuFsdMS8=;
        b=l2aitdjZTmfVGfN3CJ6oVjUrXnG9bwjQJbQTINeKBQL+slq96EXgJj0C9LVI9lWldh
         wgTBUvLYELlsAOoUpWHsKmNZfqP7PFEOua3QGP2cD3HbpNRD6Oopza0kKIMdnzy7BpuD
         IQ5kSgVy4+7Icc0Sfme57vP1BFJb6sti1xG319IIgkfyp5w9j8U61Ii2cKcWFPw+PHqr
         K5nN6v6avAZRAgVcCo08UkQagqc7Il4offgobk/WPTJbCfdntAMGMeeNcXsc4KyOMIS6
         fAAta10ipcJDsSjcoDgVJKI0GkMTE+nLCpf6FUA8Uj/Xs/sYA/1uC2V78AqX4hLNpB+4
         hpTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755532321; x=1756137121;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jhFVRc1NfpOXTxJauWn9T+QK0y3Sx+B3L8yuuFsdMS8=;
        b=DK9TmQaCifN62gfbrL32dfg6Y+SyhaTRRbM/mIIbyQL0EgcuIqNxzYTh8GRPL/Wrqw
         /0Y8IaTVD6rHheydq7jrpnfrDkMSHc47H3KKU5sh5epi3DRHC+meH0hVRVCrgFAYKemK
         3RPCa11aytLdtg7OK3qFxKZ/mgX1QkYNV6ddKnR/2E7VTHJ6+fqqG9OmepTf/fn0dcXC
         Gs2A0JZkdcLSVe6T9Gxyd2FAZD9WiFBzlY6fhCf+a7EH2ZotkgOWHBNVoSl7eEXhLPx5
         vp+q9pYE9iVO1b4ZH/26cAH7hgKGUVul/StPojIW4riu0sL2gMoi16lpAI76OSWOt+jH
         cNJA==
X-Forwarded-Encrypted: i=1; AJvYcCUOxhK4jI2lczxSDsdkiaHcjpC/94gqqOdb36hoVbhheFL8PSm+s2odVfBd//TtPYQ+B0gJrA3iSos=@vger.kernel.org
X-Gm-Message-State: AOJu0YxWpFI7k8tU30p7FnWgkqjni/jtc52n6ZDSHcLXUW9gT5sVIvNm
	OQcztZwoXjarrkjdSWhjxOLuvhK4+mgrPdLQXoG9u2rPPj44T3HL7Oxlo8GOlBWTDSwcmODk0I8
	6pccCRt1bQ4EC3MV5s0JyRo5Ew9CRsz9yi5awfHCu
X-Gm-Gg: ASbGnctpJNFbpyZgmhZZEgiZmvFOzN10qBE5IkR/3/7y+/+lrYS67q8OC1EeUfhndTK
	VoB3wc37ALw/kVz0uzeeLHYwfLOQCMaw/nXgcQLxSJkFeHzS60NNxri+yAnC7ZDpKaxz4CNJk53
	U50/OGk1VFiLODqYzuEo/7q5CZAEZfqtW6ppxzm72sQBhSdYylNNITlGBE0ATOEJTzOE4JEOmky
	O8aAQ2wUlMPPA6xtFcgkShaqkBgK13n325xGHELs2+gFe4=
X-Google-Smtp-Source: AGHT+IFBH6QXJvRW18+gfLm+VEHNtKAKh4EWppvXhfmrKKXkPioVQ+b0Kd0ODwqL4Zd3to4i9UzRN7iKxM94h8uE8ug=
X-Received: by 2002:a17:902:e54e:b0:231:ddc9:7b82 with SMTP id
 d9443c01a7336-2447a77afebmr6549035ad.13.1755532321031; Mon, 18 Aug 2025
 08:52:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250814-james-perf-feat_spe_eft-v7-0-6a743f7fa259@linaro.org> <20250814-james-perf-feat_spe_eft-v7-8-6a743f7fa259@linaro.org>
In-Reply-To: <20250814-james-perf-feat_spe_eft-v7-8-6a743f7fa259@linaro.org>
From: Ian Rogers <irogers@google.com>
Date: Mon, 18 Aug 2025 08:51:50 -0700
X-Gm-Features: Ac12FXyV1x2afpy-E2EhDR_cSfBMqeVdgvNI2wMfxjm0rwNa4JtVzwidrn9_Mpg
Message-ID: <CAP-5=fXBot2K0MR9t7o6J7-FihNXzKcotdF6p3bfL7DwqR9jfg@mail.gmail.com>
Subject: Re: [PATCH v7 08/12] perf: Add perf_event_attr::config4
To: James Clark <james.clark@linaro.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, Leo Yan <leo.yan@arm.com>, 
	Anshuman Khandual <anshuman.khandual@arm.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	linux-doc@vger.kernel.org, kvmarm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 14, 2025 at 2:26=E2=80=AFAM James Clark <james.clark@linaro.org=
> wrote:
>
> Arm FEAT_SPE_FDS adds the ability to filter on the data source of a
> packet using another 64-bits of event filtering control. As the existing
> perf_event_attr::configN fields are all used up for SPE PMU, an
> additional field is needed. Add a new 'config4' field.

Somewhat off-topic, imo it would be nice if we could land:
https://lore.kernel.org/lkml/20250603181634.1362626-1-ctshao@google.com/
and show all the config values via fdinfo to better allow tools to
diagnose when PMUs are busy, etc. The patch there tries to be minimal
and just reveal config (even with being minimal the patch is stalled).

Thanks,
Ian

> Reviewed-by: Leo Yan <leo.yan@arm.com>
> Tested-by: Leo Yan <leo.yan@arm.com>
> Reviewed-by: Ian Rogers <irogers@google.com>
> Signed-off-by: James Clark <james.clark@linaro.org>
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
