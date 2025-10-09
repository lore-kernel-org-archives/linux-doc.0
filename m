Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 851222D876A
	for <linux-doc@vger.kernel.org>; Thu,  9 Oct 2025 14:43:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760020995; cv=none; b=FByIbyx5JA1uU5xXI/ypDA5mEr0bqzmxZ0FnxHP+tX9RU/fI7Awxi89e/trT5n46YdK+vk+5m64K0RzZ1f170PQ+3xX61PcGZ6EYSu5FZz0sebmmulRSGBVA9hkuQ7z/L1T05lVZHfaczlkFR+fUPxC/0duopPAmD/V7BOYfzcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760020995; c=relaxed/simple;
	bh=xuePTw23nhDK1u3ZeQlWw0pTVGGtZTfAt7eVSo3gjbs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jIHNxCzSjifwTCBIvf4GNP8MMGLkf1iTk+/ksf2ZIajo4VVS4pC5RhO/yHQTbnUIQw2YQ3YgphyJp/lI/kK6IykyHXMjqqCGoivWNiB+ILa1i1Mhx4NnMoeDRL9YiE9MDWGysxN1WUwbRb/Y5CHGQtIp6Y0iASWt1qhHuXxfSOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=F+kt14Bi; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="F+kt14Bi"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-781206cce18so1186659b3a.0
        for <linux-doc@vger.kernel.org>; Thu, 09 Oct 2025 07:43:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760020993; x=1760625793; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=aBuYWmN845KzXqm8EouS+GqPS0z0pBmk0fzQy4dI/Ds=;
        b=F+kt14BixztRxbBP9iG12pj4sHR+SbjUho4lWQANp7OpnhJwbXkdC08S8LboxzfyAM
         EMmCmPCUM/WZEcQ92MIt3Ar+pAKQmtD+Def3dYTn8avFR6kfJ8UekiFNVSnyZzbX2V97
         DieQczSlf8CZawu9AOg9blNu64VWO1coSstRWaytHegh/mPBRASkGQr6d3PeASb0dktg
         8g80aUidy3QXIEAQgK/n6rvqj/t192kWljG23CN3eOI521qI8OeUVHAsua+/k38JC75S
         oZ2YATJ9mXzFfHTbS73ZyelqvYmW5fwPE1he2Ncwhk+XsvwqZXJMd6nKF9BEAehIBYiE
         oeJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760020993; x=1760625793;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aBuYWmN845KzXqm8EouS+GqPS0z0pBmk0fzQy4dI/Ds=;
        b=pZU3CCqsPsHNFHxQDztn34NGR6ft04oCICy8zXGH7mzdUoE/KJDQsb0JkXYV2PMI3o
         BcI1ZAjWZuhkPIOwOCJN5R5hkh6uxbcr3HDLcCmXU99yMD0FGzkcTmPN/j34VKSAWUuv
         ZEyedYHujmtn9x9cUqZimHxGH8jZR+yyXyYVr6tBoGAwNPrpyUafB0wIHbH9jcJbe0jG
         tm+7MC5J8h4n/Kexr1k6iiKhAA3/K/bSo4/9JAsfk0OQ28GJ1jlhL3YEFOM+q2Jr+0eU
         K0puiucMmbMKExTDCUduuaRum8oD+suYakcQd2+VR2LoBqtLLoY1xlu3hmwFu142Q26h
         czAA==
X-Forwarded-Encrypted: i=1; AJvYcCWtRZEAtLiIdpfJeB+kMXsRRUTvJ6xo3Zc9RRChUeByNWhLxytMUQIpm1vnylqals+7VGa6wMMwKyI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxg4AIcNearIRYwQp+R+srBEeehw5gTHhEtYXZHHkaVRXmiKCpS
	DDHJE/FGKJ+QgPvEtOYUwU6gKKs3+wD85CVhjdjYnEGkWG0tHnZgF2yBdsrGNyj/dpkqfk3XZ5V
	oXpDSRlVqwFRx8hX45KLd03qXPgV6w+ZmjUyGlorQfQ==
X-Gm-Gg: ASbGnctuIpgUqj56Ic2qSR0WA2vVvDvQDWS0FDRUePE4TQ92DamRPeoEQUptvAb6Yfk
	YH/BMORfpMpn6h/hec6WMzZFJJIXwQHu0Tl/rRwUf5hidAf+fve8u0w8v9ThoKm9VNjlFt6MSEW
	5Yl+Yk3eknEfnLyLL/6+8H7CFgY1FBre55EcY6K5kAUtordKOPaS8EVQz5JmeblEZ1CsdAllphm
	C/r2k7TaRLi9eHb7GAgF5vFWXwTrlJOegCy
X-Google-Smtp-Source: AGHT+IEunQlJX63RRYRtSnbcqvA/nThaxmg3LM/Wg/qUN5XoyVXwmlx1x6HIDkeVcb27jelR7RW1NG5t3y+7VCGwa9A=
X-Received: by 2002:a05:6a21:33a8:b0:327:957:f915 with SMTP id
 adf61e73a8af0-32da8fcd0a3mr9718293637.24.1760020992691; Thu, 09 Oct 2025
 07:43:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251002-james-cs-syncfreq-v3-0-fe5df2bf91d1@linaro.org> <20251002-james-cs-syncfreq-v3-1-fe5df2bf91d1@linaro.org>
In-Reply-To: <20251002-james-cs-syncfreq-v3-1-fe5df2bf91d1@linaro.org>
From: Mike Leach <mike.leach@linaro.org>
Date: Thu, 9 Oct 2025 15:43:00 +0100
X-Gm-Features: AS18NWCyJUsxXav1BCEdra0zmZObN1mWhTpmYCiev-5sNXSTBfqKeCdcvl0rmhM
Message-ID: <CAJ9a7Vjw_4ZwEBriS5836YdnxMH47e9b_6LOUWEaTxX3RkNtXQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/5] coresight: Change syncfreq to be a u8
To: James Clark <james.clark@linaro.org>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jonathan Corbet <corbet@lwn.net>, 
	Leo Yan <leo.yan@arm.com>, coresight@lists.linaro.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 2 Oct 2025 at 11:09, James Clark <james.clark@linaro.org> wrote:
>
> TRCSYNCPR.PERIOD is the only functional part of TRCSYNCPR and it only
> has 5 valid bits so it can be stored in a u8.
>
> Signed-off-by: James Clark <james.clark@linaro.org>
> ---
>  drivers/hwtracing/coresight/coresight-etm4x.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/hwtracing/coresight/coresight-etm4x.h b/drivers/hwtracing/coresight/coresight-etm4x.h
> index 13ec9ecef46f..eda3a6d2e8e2 100644
> --- a/drivers/hwtracing/coresight/coresight-etm4x.h
> +++ b/drivers/hwtracing/coresight/coresight-etm4x.h
> @@ -825,7 +825,6 @@ struct etmv4_config {
>         u32                             eventctrl1;
>         u32                             stall_ctrl;
>         u32                             ts_ctrl;
> -       u32                             syncfreq;
>         u32                             ccctlr;
>         u32                             bb_ctrl;
>         u32                             vinst_ctrl;
> @@ -833,6 +832,7 @@ struct etmv4_config {
>         u32                             vissctlr;
>         u32                             vipcssctlr;
>         u8                              seq_idx;
> +       u8                              syncfreq;
>         u32                             seq_ctrl[ETM_MAX_SEQ_STATES];
>         u32                             seq_rst;
>         u32                             seq_state;
>
> --
> 2.34.1
>

Reviewed-by: Mike Leach <mike.leach@linaro.org>

-- 
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK
