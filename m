Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75D9E560AA1
	for <linux-doc@vger.kernel.org>; Tue, 22 Sep 2026 15:56:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790092576; cv=none; b=lZGLN5k3qjeTu0illwukGuK1IVs9gAcS5qv+QJ+40qy9Gi0AofpD8P0y8PaNRD/56FApN8bCpzD0VEuyy/240QKdMJ0ed7eZUeAi6N9o01yOX9NQ75aVrbsEG4z0r3bMnQ5nKfANMDZmD0dxVkt9AjgZd5ze2uaIkS4jG2Da10k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790092576; c=relaxed/simple;
	bh=cJMB1C5NwgZ9t/F2vTcnLRABUGE483z9RikyK8kCd+M=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B/9xkxaSTVd5pckfnDH+6nxuAg4WMkgnSKgjgC6kBjaWpu5P44cQIZ6AhyIXDfFn9Ifv9f9V7rRdP3L/3VPOPgH1Rm6+0eSEMpzBdLB3/XG7sBk21btd8vaC0Tj33WKkwWGRpJx4rnRTPphfegdmvYyGUwsusJEbCoqLrJRrsek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qbShvM61; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qbShvM61"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e79a408deso25159535e9.2
        for <linux-doc@vger.kernel.org>; Tue, 22 Sep 2026 08:56:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790092572; x=1790697372; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2oj0aTA7VOJyZrVWcneUoZKYnaLkcgMjrZp/pYzU3RY=;
        b=qbShvM61cN8CPZifWFN5SJ+3FTVRuLGjpuSm0/2kL8b650xzaSMwfhsCVBL6MHrxS5
         NS3hznVK17OmaUgIv4yY+7hHuKuIkMpI1NjVczlSqTtsxiaky8Cz+IjWF92Q75rDuex1
         qir951Zo3h+29zze3mon1Ukei5drCIfFZFPZB6hG/ATGXtNGXkD6VDEeIGtfcmui7igK
         ZP6E95p/uTkgJG1s0DZVQ/8e7oINGyz/+OBjvsgBj295vSLEMlkgm4T86a7KPO0YktUC
         cbdZrIFjDTpSiNEDdsiPbKVXOXPzxuSjKs/Gv+xR69UpM1e/ZbIivbHdH/3nJsKv7Bsq
         EojQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790092572; x=1790697372;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2oj0aTA7VOJyZrVWcneUoZKYnaLkcgMjrZp/pYzU3RY=;
        b=aYyrCP4SXvCezq1CvEIZqAbOja9+BXqfmeQFHvqmZwIfwbuTYKDLzhAg4RETlZK2Rn
         MTvZk41p4PEHLvK74pvztDaXzNk5s888c4md3sJDmX8tW7twomva3IMF49c6z8bg++RA
         6hMj5waArEGJlxcMCZ02uSMB6z9/VBSP5sxrKYeiMl94B0txH4Ph21dX6z6XpFBgr2q2
         gwrxUKg/2FYVKeHreCcpaRvEXVHjafIJrIrXUjHfrEUKkuU2HMvndtGqNlqxDOhWWY56
         5Po3nwLT0MZXFWZArVf91tOFw/XGp5xeAxTOvL2EVHgo1yn0IKWqu57PYwf9qrTBbySe
         Cv2g==
X-Forwarded-Encrypted: i=1; AKwUvBzLyCyZLQGV+WgA68Dw6U+iqAidchLvVlLBhzvtusJFfqaKYKblVLtI1ZtKzfvGo+Cjbdj4PdGv+2o=@vger.kernel.org
X-Gm-Message-State: AFuF++kzX2Kw8pY04MqnmF9yPvHufSzqsytHs01JWwmDFEgTULMs2s3t
	goFDJI+bZqP6ZVIWySxkJ8oR1STrmrJMPIBc2tPbXlb51ITfFCw6u6HC
X-Gm-Gg: AYBFou1rBFi7vDIQOQcXfKULPHVTRwwANerHLWtjNt/k1FX/uDiSr/S5p5yyvafFBBU
	R1Y/1aNw7jUCsD0OartVGJuA6HMK1LFK3jp0ets75yBnRfel2bpoCG30+78dVwyU7oRsfB3brR/
	Kgs/95obrifTpeG0yL2le7zzTpVSFzoqnQ0K23ZJx2nkHDyuiGoD9kDi/TIclNERk9OaIU04ESq
	14D82aqpiYAaxKBMxr8tfTDtjQ5zZDTNNrWoGVI90EWzu85YyPkxyVnTE/lTBOBb0skIvuSh35x
	1IislEVIf+I4uEShsg6VtHZK6VFlaiWLgtm+2qjVmu5J2FXAXwaCgCnRuUlAeseNz89wprMiTFT
	NYO+7zWLQLxl1WEIDa7291/1Z5CA8/wxoOswZys6Cb0bFJ/RYvv0ZqOzmxRI2MV1g+XmTO7LF2J
	UAgGCdsw1f/SXvNBtLMA2T9i14doCCJ1YlKpbbj5aYD0DUHCWktP5cC/H7Nnr/nifZhJZF+oiNe
	uV4SvRNQ4MLj5HxBiADdLRl/GGAJ0pNOXnS630ypd/1H+ctRqYTA6LRTb/ebyhGozDHWhCwpnou
	lqgz3x4aLh9ETA==
X-Received: by 2002:a05:600c:3b05:b0:49c:fa21:e746 with SMTP id 5b1f17b1804b1-49fc57570c8mr186611695e9.28.1790092571470;
        Tue, 22 Sep 2026 08:56:11 -0700 (PDT)
Received: from HYB-2NH2WFe09VB.ad.analog.com (24.206.116.103.netskope-rdns.com. [24.206.116.103])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fde18a8a0sm325825e9.5.2026.09.22.08.56.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 08:56:08 -0700 (PDT)
From: Rodrigo Alencar <455.rodrigo.alencar@gmail.com>
X-Google-Original-From: Rodrigo Alencar <rodrigo.alencar@analog.com>
Date: Tue, 22 Sep 2026 16:56:03 +0100
To: linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, linux-hardening@vger.kernel.org
Cc: Lars-Peter Clausen <lars@metafoo.de>, 
	Michael Hennerich <Michael.Hennerich@analog.com>, Jonathan Cameron <jic23@kernel.org>, 
	David Lechner <dlechner@baylibre.com>, Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>
Subject: Re: [PATCH v10 04/17] iio: add IIO_FREQUENCY channel type
Message-ID: <xevuqaudwm4hpnhbful263yx6r45liuch6yc7xjk2i7wly3oxo@xe2htu27rkl7>
References: <20260729-ad9910-iio-driver-v10-0-aa1f6167729e@analog.com>
 <20260729-ad9910-iio-driver-v10-4-aa1f6167729e@analog.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260729-ad9910-iio-driver-v10-4-aa1f6167729e@analog.com>

esOn 29/07/26 09:25, Rodrigo Alencar via B4 Relay wrote:
> From: Rodrigo Alencar <rodrigo.alencar@analog.com>
> 
> Add IIO_FREQUENCY channel type to support Direct Digital Synthesizer (DDS)
> devices that handles frequency values written directly to its buffered
> interface.

...

> Signed-off-by: Rodrigo Alencar <rodrigo.alencar@analog.com>
> ---
>  drivers/iio/industrialio-core.c | 1 +
>  include/uapi/linux/iio/types.h  | 1 +
>  tools/iio/iio_event_monitor.c   | 2 ++
>  3 files changed, 4 insertions(+)
> 
> diff --git a/drivers/iio/industrialio-core.c b/drivers/iio/industrialio-core.c
> index bdf3d4c06331..a45277bc5d99 100644
> --- a/drivers/iio/industrialio-core.c
> +++ b/drivers/iio/industrialio-core.c
> @@ -99,6 +99,7 @@ static const char * const iio_chan_type_name_spec[] = {
>  	[IIO_ATTENTION] = "attention",
>  	[IIO_ALTCURRENT] = "altcurrent",
>  	[IIO_COVERAGE] = "coverage",
> +	[IIO_FREQUENCY] = "frequency",

Hi Jonathan,

Thanks for not giving up on this one! Taking a look at the testing branch,
I think this line was dropped during the rebase (addressing a conflict)

-- 
Kind regards,

Rodrigo Alencar
