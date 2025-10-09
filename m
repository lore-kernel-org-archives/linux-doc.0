Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07F0A220F3E
	for <linux-doc@vger.kernel.org>; Thu,  9 Oct 2025 16:03:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760025827; cv=none; b=DnodQTuYvg2pWs7p2sVRaro18rS2vasD3+/5rC0zgp+0aGLNUgsNeVI2/JB+B+hPDzdi6n/XS4upQp4Qisyr7OvR8X2r/ro/27SFTWyBXxF6iPMRQuJbiY25kFrE6o2pPJ6Mh9e2XL3jVz9L4yONkd+Sf3gfKpU73ZWAEMhSbHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760025827; c=relaxed/simple;
	bh=KkSS1IRbrwHyMwaaOVUv7HIIqDxX8kS2Iel+y5l0otI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mcRokndnM6+0gWFNuTlW0652NotoEEx98AGMzUVfM/gINmZrC5IiqGT8+jIh1ZLz17riC46tzdg7iKYi1m6+ixehxpqljWj1kppzYL1VSxDVAA8T1ntncVqXbFsVtFFEEcucq6d1N3qBYZfWutEZkkvPJnRzOglxr3Wzs7n9V44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AhXYk7R6; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AhXYk7R6"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-33082c95fd0so1512450a91.1
        for <linux-doc@vger.kernel.org>; Thu, 09 Oct 2025 09:03:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760025825; x=1760630625; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Zj8LfnqLwL+Gx5l1gM/bvFwx6FdJuno6EYMDHRGmO08=;
        b=AhXYk7R61buf7ixmKpwehEZBQEIv4ZuG5kfSJbakBB0Bk7r0fOldNYPAKQ2sNfLI2V
         cFV+vrDeBN7efR4V2bCDGHH1CAgDYyKcrWltt3Oft3pOBD+nooj64E6DvjwlaVG69M8P
         DB1LhKMRS/PiUBGz0Xt8TY0yN1WTcpT/EEvYYJD82oS6JuV/9G2RvNScM5DKV2VJpujj
         2ruumDSP3bk0L3jZZBKcrKlzIz/YYzlhs5wM86VPMj0l2k22KGe/vHNFEN0HE0sNXr/Q
         DSc5a34g68W2zznTVF+ahy4usT5RieI+jHRTFplVkcAObk3ZvKPiLkqwmbfejyQeJQDZ
         a5qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760025825; x=1760630625;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Zj8LfnqLwL+Gx5l1gM/bvFwx6FdJuno6EYMDHRGmO08=;
        b=oGhiidxTjLt3UiOlDTCH3yYi9WJ+RHLtst8m5HS1eTjyndZJ83UDkEF3B8M6T4nCq1
         lOV1QkL3ATWm1TFnj59qBN1Vp3K7t+ENFvO6WI+4v2Wg8WEMXmgQOOPJXyF/nZAoG4q1
         yeBMqmcmVy7c6jjR9oAVH9UMsfqPoBWIdKu2vBGxBxKFKbouOqw9N/eSxV72BzGHihE6
         5DI9PgYROs6WDPmfvl3yMn+vZq3kENgZ24UQ5JE4mSZ0EmoXDbbE7RgVBc6f2k/PZeDF
         A7ejVfEtccFn5FpInMBHgWhc5AMBwqLXxUxECsZJhJ/y569qLGjgZJ8ywJ4Ie7UjM2nv
         PanQ==
X-Forwarded-Encrypted: i=1; AJvYcCVxus3bojCEm8pN2+6fnD25weaIBr/ojTe7H5PFvOZkfwlEVrQu5TwDyzqQuBxIRnE1PFDxG6auCX0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxsPaMzSmM4GS7U4HUjLtuH3AdgT+Nz7T8mCFXtoOSS9VrSNLeM
	qLKq801yQZJ0PfBEuviqftQ01ZFJNygmfoG0cjCFQi2CrbQtJiGANb61hoIhdsU/5SwpXKFO3gR
	PXQbNU/v6zoLRrcB54xHKvJKAy69AB0xXz95mT3AWog==
X-Gm-Gg: ASbGnctnTYBBbG1P/0zQZw9MUGyTWQSJFArjzH7T5m3TBdea0um06wJL2vD9np+e4ih
	p0PWUxCNmxZX8LfoGofPk4zQOnilRh8uDcrh+MpNqu1ZG0sltZ+W3H38/MUiJFBeZvBDdWsTQ4W
	0Xknv9AP+pp1r8TuHUIX1yOox59eve1WDMCjmh2DJr8VS/n0MX4e8/d0BzPUQevbJZmiHRuDN87
	kzN2bbKoX9LrDjbbk3XvUoW4O/W58rtlL12
X-Google-Smtp-Source: AGHT+IFWZP1sOUCVxhD5rut22TgyJiSvAxe/PqeY6yT6cbXfcUKECeTUVY2YIzCllx+tjT2TLCT77aX1c7tYXB/6Wdw=
X-Received: by 2002:a17:90b:1b50:b0:332:250e:eec8 with SMTP id
 98e67ed59e1d1-33b51168e20mr11597847a91.15.1760025825128; Thu, 09 Oct 2025
 09:03:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251002-james-cs-syncfreq-v3-0-fe5df2bf91d1@linaro.org> <20251002-james-cs-syncfreq-v3-5-fe5df2bf91d1@linaro.org>
In-Reply-To: <20251002-james-cs-syncfreq-v3-5-fe5df2bf91d1@linaro.org>
From: Mike Leach <mike.leach@linaro.org>
Date: Thu, 9 Oct 2025 17:03:34 +0100
X-Gm-Features: AS18NWBRPxicWlO6Xkw2qzlt4rKgSo68ZX2bh5k8tmBbwfyeBqn1yur95FngjNs
Message-ID: <CAJ9a7VhZwXdGQDDqQ=o3D=yVOjZ5xdqHKvXRdM-Auu6pum6JuQ@mail.gmail.com>
Subject: Re: [PATCH v3 5/5] coresight: docs: Document etm4x ts_interval
To: James Clark <james.clark@linaro.org>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jonathan Corbet <corbet@lwn.net>, 
	Leo Yan <leo.yan@arm.com>, coresight@lists.linaro.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 2 Oct 2025 at 11:10, James Clark <james.clark@linaro.org> wrote:
>
> Document how the new field is used, maximum value and the interaction
> with SYNC timestamps.
>
> Signed-off-by: James Clark <james.clark@linaro.org>
> ---
>  Documentation/trace/coresight/coresight.rst | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>
> diff --git a/Documentation/trace/coresight/coresight.rst b/Documentation/trace/coresight/coresight.rst
> index 806699871b80..0cd83119b83f 100644
> --- a/Documentation/trace/coresight/coresight.rst
> +++ b/Documentation/trace/coresight/coresight.rst
> @@ -619,6 +619,20 @@ They are also listed in the folder /sys/bus/event_source/devices/cs_etm/format/
>       - Cycle count threshold value. If nothing is provided here or the provided value is 0, then the
>         default value i.e 0x100 will be used. If provided value is less than minimum cycles threshold
>         value, as indicated via TRCIDR3.CCITMIN, then the minimum value will be used instead.
> +   * - ts_level
> +     - Controls frequency of timestamps. The reload value of the
> +       timestamp counter is 2 raised to the power of this value. If the value is
> +       0 then the reload value is 1, if the value is 10 then the reload value is
> +       1024. Maximum allowed value is 15, and setting the maximum disables
> +       generation of timestamps via the counter, freeing the counter resources.
> +       Timestamps will be generated after 2 ^ ts_level cycles.
> +
> +       Separately to this value, timestamps will also be emitted when a SYNC
> +       packet is generated, although this is only for every 4096 bytes of trace.
> +       Therefore it's not possible to generate timestamps less frequently than
> +       that and ts_level timestamps are always in addition to SYNC timestamps.
> +       Timestamps must be enabled for this to have effect.
> +
>
>  How to use the STM module
>  -------------------------
>
> --
> 2.34.1
>

Reviewed-by: Mike Leach <mike.leach@linaro.org>

-- 
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK
