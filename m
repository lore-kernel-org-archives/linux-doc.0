Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4A7D28488F
	for <linux-doc@vger.kernel.org>; Wed, 29 Oct 2025 20:35:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761770128; cv=none; b=jpK7SO8+qgF+Z27GA3w9iBD/oRwma5+WmC4qZHOjnRA0o3vrhqk6iG/r4dSlc4M4GfwfTP7M+ebUnrKOLTFyi+cys7A6aRfpJZEaoKrFftMlRC6sJDPCtDqO/0hMLiultapnJMNnk8hfais++jLWyiI6UYKg9rFkAZ2PRRN6iy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761770128; c=relaxed/simple;
	bh=wsMNZX+2GZRGbbk6YsF3frBWG4zz+dND7kWKgOXmqkQ=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=fmp1whyORMFVayQ0bwzjNWTDVLGAfi8z8S7F1Gb9OcFkk/MHqpiitbW6WB9yfvG238fRbKlCwKZHDtXoovt4I7kNWx94sD7WjgIYE5aDAWYQq1sR9L3PX6XQr7A6I2Id17sAporEodoO9ZAlblyHKfjTi9sBN03snmnQwlXpD30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MkDQyBi0; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MkDQyBi0"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-475dbb524e4so1640865e9.2
        for <linux-doc@vger.kernel.org>; Wed, 29 Oct 2025 13:35:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761770125; x=1762374925; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5bMBjt+VM1Vp3nKTpZq9XQvYVyPrL/jZ53DiT5wADSM=;
        b=MkDQyBi0dOHkokY+ysd/6VMyeRJ/fWT4YeKP8EBla+1Dl15n1vAbt8mPCzC6UEH0bl
         8WSOhknPtSUrQHOesPrq9HawFU2b2MA68mz+tzlT/Sv8Z1L6sYMzpQUjNtL4ihdEb5jD
         8u6RMTLx1bDrB2Q/o9hE0orPHG6CjMlLUhzJLRUztFWDcFNYnvwTYzYlBkmj/u0fW3UT
         Ba6x5M0orshbnnILPQDWr7kqyQJnXIXpthS0MlA2aJAEjNpxP1b28Z9O5dt892TcGxae
         fXneJFfJl957YyrtKV6guyyTxcgHTh6aZP68zgdTtKRyOI2VYSdwmHVQJwCL5D6DL/Wk
         TsxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761770125; x=1762374925;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=5bMBjt+VM1Vp3nKTpZq9XQvYVyPrL/jZ53DiT5wADSM=;
        b=jybUrFKtg76NvLIXDwzSpFemi/RGwZypRToVGgfsk7SkGpqwmTSJngkjZWuFBXUdYa
         8xGPmRPToQB+H5ux7Mf/xMyHY8z+bveV9tSVkwtCBRhrKYoUlzutfoa8p8r9mJEaaqEV
         EKGhduIaZkaDyEPLb+IJDYJQetZlDKaTNYTZwdlOV27VASos/AhnF1+iavapei8aiWlC
         4sJruh3oN916oH1Gr5dUNfmQ89XOBztII1QExdmQwY3XRBTex0rXDbzGIOcPu9eCo6sZ
         i28s1F+JHEcNRfTPNSK+ysf7MCoFrtebi8bl7hR0sNQE4+dJcQvXWKW1mel1njo8inDC
         R9Kg==
X-Forwarded-Encrypted: i=1; AJvYcCX5BxNvGRG/WT5v3Xi4ZBYhzUewhVNp+4CC1rY33VVCis1U2+jmBHbs+BZxrthKZC9UsrE4BtcK2TE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzjpZ4B/2vXm4NIVPf9O/wjqddxX4j8ruyLa8hrzAG/Ey1FfYok
	ecRDgyFnTCtFFLaiEpqFoHxQ2nplhB6L0xi0GZMYeW+lmU2jvijPwwQSndNyU6b+bCQ=
X-Gm-Gg: ASbGncv2UR5CmJIo7tmp8ZfBXvZM/g49WmJn2s9JJnQrRDfA0iCOj0lJZSESQpHTbMx
	2rqKFIRhj6MnWpvIhgY9g++BbLzLP9RNGP2jZohXMiCSBHzZJJ/vbrXmGErciRrtu47l3JNsE0D
	WNF3WyZ7nQgZMpvgX+3+vZe+EPCXVA6iH6+TLbENrHX1Vs9zhRzAGwd/uHyGTfbOuWhd76AwVer
	hzRtD+Zkxdf2mmBeG3/roEEtdSXSO+Ge/8v9o5yrWoTAfxYPVRxVLzU03NcpVUCMEsmGdrcYZHX
	yO7ovUtYU9pnogWDb0loTn519s4DNLTqyWflcSb/bfShkjVk3gsXuvtugi5XG/XgKWlZ7ftGzsC
	XJja/jm2LRERsDpBgNvGnZjU8ipZQr77SQ/jCiTP1U108gUd0bxDNsJs+Ev7t/prhs5lTk8ai9n
	w77pUcGSvyHe8eSYgWCJOQnsLA96KDiNFWCX/2pNc9YzLxaTDpJg==
X-Google-Smtp-Source: AGHT+IF6uIhMMwm7yKC3UlQSKCBgpIpqEhODgFU8Ll4WjBwNbuDD7B8WtcIHm/9PH6IkoIdOjhDvSg==
X-Received: by 2002:a05:600c:190f:b0:477:1bb6:17de with SMTP id 5b1f17b1804b1-4771e1e1154mr37420475e9.30.1761770124813;
        Wed, 29 Oct 2025 13:35:24 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:cad:2140:3447:eb7a:cb9f:5e0? ([2a01:e0a:cad:2140:3447:eb7a:cb9f:5e0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477289adc18sm2128255e9.6.2025.10.29.13.35.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Oct 2025 13:35:24 -0700 (PDT)
Message-ID: <ecb7d7de-d674-49d2-b373-39041b363167@linaro.org>
Date: Wed, 29 Oct 2025 21:35:23 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 1/4] drm/panel/lpm102a188a: Switch to
 mipi_dsi_generic_write_seq_multi()
To: rtapadia730@gmail.com, maarten.lankhorst@linux.intel.com
Cc: mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, jessica.zhang@oss.qualcomm.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, corbet@lwn.net
References: <20250921183720.237761-2-rtapadia730@gmail.com>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <20250921183720.237761-2-rtapadia730@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/21/25 20:37, rtapadia730@gmail.com wrote:
> From: Rajeev Tapadia <rtapadia730@gmail.com>
> 
> Replace deprecated mipi_dsi_generic_write_seq() calls with
> mipi_dsi_generic_write_seq_multi(). This avoids hidden early returns
> and matches the direction of other panel drivers.
> 
> No functional change intended.
> 
> Signed-off-by: Rajeev Tapadia <rtapadia730@gmail.com>
> ---
> 
> Question for reviewers:
> In this patch, I switched to using mipi_dsi_generic_write_seq_multi().
> Currently, if both link1 and link2 return errors, only one error is
> reported via accum_err. How should this ideally be handled? Should we
> report the first error, the last, or combine them somehow?

No it's fine, the first error is catched and reported.

The good way to do this is via this macro:

#define mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, cmd, seq...)	\
		do {								\
			dsi_ctx.dsi = dsi0;					\
			mipi_dsi_dcs_write_seq_multi(&dsi_ctx, cmd, seq);	\
			dsi_ctx.dsi = dsi1;					\
			mipi_dsi_dcs_write_seq_multi(&dsi_ctx, cmd, seq);	\
		} while (0)

with a single context. The mipi_dsi_dcs_write_seq_multi will print the
error from the proper DSI and the context will have the appropriate error.

Neil

> 
>   drivers/gpu/drm/panel/panel-jdi-lpm102a188a.c | 15 +++++++++++----
>   1 file changed, 11 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-jdi-lpm102a188a.c b/drivers/gpu/drm/panel/panel-jdi-lpm102a188a.c
> index 5f897e143758..982cb61849a0 100644
> --- a/drivers/gpu/drm/panel/panel-jdi-lpm102a188a.c
> +++ b/drivers/gpu/drm/panel/panel-jdi-lpm102a188a.c
> @@ -162,27 +162,34 @@ static int jdi_setup_symmetrical_split(struct mipi_dsi_device *left,
>   static int jdi_write_dcdc_registers(struct jdi_panel *jdi)
>   {
>   	/* Clear the manufacturer command access protection */
> -	mipi_dsi_generic_write_seq(jdi->link1, MCS_CMD_ACS_PROT,
> +	struct mipi_dsi_multi_context dsi_ctx1 = {.dsi = jdi->link1};
> +	struct mipi_dsi_multi_context dsi_ctx2 = {.dsi = jdi->link2};
> +
> +	mipi_dsi_generic_write_seq_multi(&dsi_ctx1, MCS_CMD_ACS_PROT,
>   				   MCS_CMD_ACS_PROT_OFF);
> -	mipi_dsi_generic_write_seq(jdi->link2, MCS_CMD_ACS_PROT,
> +	mipi_dsi_generic_write_seq_multi(&dsi_ctx2, MCS_CMD_ACS_PROT,
>   				   MCS_CMD_ACS_PROT_OFF);
>   	/*
>   	 * Change the VGH/VGL divide rations to move the noise generated by the
>   	 * TCONN. This should hopefully avoid interaction with the backlight
>   	 * controller.
>   	 */
> -	mipi_dsi_generic_write_seq(jdi->link1, MCS_PWR_CTRL_FUNC,
> +	mipi_dsi_generic_write_seq_multi(&dsi_ctx1, MCS_PWR_CTRL_FUNC,
>   				   MCS_PWR_CTRL_PARAM1_VGH_330_DIV |
>   				   MCS_PWR_CTRL_PARAM1_DEFAULT,
>   				   MCS_PWR_CTRL_PARAM2_VGL_410_DIV |
>   				   MCS_PWR_CTRL_PARAM2_DEFAULT);
>   
> -	mipi_dsi_generic_write_seq(jdi->link2, MCS_PWR_CTRL_FUNC,
> +	mipi_dsi_generic_write_seq_multi(&dsi_ctx2, MCS_PWR_CTRL_FUNC,
>   				   MCS_PWR_CTRL_PARAM1_VGH_330_DIV |
>   				   MCS_PWR_CTRL_PARAM1_DEFAULT,
>   				   MCS_PWR_CTRL_PARAM2_VGL_410_DIV |
>   				   MCS_PWR_CTRL_PARAM2_DEFAULT);
>   
> +	if (dsi_ctx1.accum_err < 0)
> +		return dsi_ctx1.accum_err;
> +	if (dsi_ctx2.accum_err < 0)
> +		return dsi_ctx2.accum_err;
>   	return 0;
>   }
>   

