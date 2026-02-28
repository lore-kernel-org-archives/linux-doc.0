Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 999742D97B9
	for <linux-doc@vger.kernel.org>; Sat, 28 Feb 2026 16:27:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772296060; cv=none; b=S/iP3AL91D33ae4clddjyGaFIGNrScuaphwGqJAmdQDCRc5tNCdGLagAmpveglq1ReSAQmX8/iWCjL2d30nPxbsYBEE2Fyz9zBZO/rl9/KfxjrcyxiewifzIkOwPbnu9V11SmUNDIn4+vabKjTGKnoqZPYwQ8aORqihjtgc5z90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772296060; c=relaxed/simple;
	bh=i3/rg94Wfo6LrOwSARkMAUOZfbV/3KB0aCm2MchfZZc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AhBgtktmm8mZjMJvDYipUwA2SyS7h8bnrvfi6DfDupAtquH8RIwSOwhdTUUtlCoawSFXAPdV4qa/KP/VU3le+txpyTb6Z8GpF2zZ/tYxdg1k0O0ejhKORvrfTiVroGESa4PIbb44vigSQHeoo+8bjNCkDfkI9DIeQ6OcWmXk+Ek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=UAf5ztuM; arc=none smtp.client-ip=209.85.161.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="UAf5ztuM"
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-66f747175d8so1617294eaf.0
        for <linux-doc@vger.kernel.org>; Sat, 28 Feb 2026 08:27:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1772296056; x=1772900856; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CP86Ut47LCtiOHeXtYEDxgLTZp2P6pBREzSVZZ3bzCw=;
        b=UAf5ztuMGiaK03VMRKM/7oay37SOZg+3gjmRDZlO5RlgdSyqz6y6oRJPqqf4sMnjSs
         eMFB/RPwq3U0nD67jkjE/e48yORdl/798WHTW/a+HDF031sK+OZ3plOPMXMasIUE32WI
         HamnS8Pf5rIlvRxLLXufesOltaej0yTChMGuNtYraqX/lZOD18QinQFaHtQzzLcp7oHv
         A+9I3pBCeGpmtdBnFcY2yYibFNC6VneQJ7/QLYBbw+qP/qNHuHnzKyNVMcrhYUxPs2Oc
         r9KYzxab/IQG2yeq1R2tOptcd9wt7PDooMz1Iy+eF0140+ZJc2pU1jFvrHvdGQqDIrjl
         ysuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772296056; x=1772900856;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CP86Ut47LCtiOHeXtYEDxgLTZp2P6pBREzSVZZ3bzCw=;
        b=M9ypf5FtBJsdsqLuar238XBhF9pHrFDcJ0K8epB1hggi8PNFFTBC2DY+IBwkwdRxtH
         MAXRA4DbIIT/FtmGgxvqi9B48ZrG5ZGFIqKxLHD38DeGKse8PkBp310t9gT4PIU9Jnh2
         R2EAwHXxGM6bcOoTIBRFWk2OFTSK/K0v1zGzkEo6FgBHuNZU+/+L3hmbdxHWeiiFJlUF
         x2fmY45iTRkA+mdgYOuwohL9XCIYc+Z/qcBVRAKVmzfuj0SW5yWWnWLrGnIQ9epi/ouI
         a5mRZOczw/jZ6L+UVdQuGva8GY3E4DbuV8r5cQwkdTNel2/g605yF9Wzw2jrf/bAOh/p
         KnHQ==
X-Forwarded-Encrypted: i=1; AJvYcCXnidfYlxxcSNNVj90Q8Cd8G0DpZlhaSTOVdeeKZam4QwJ+8030Xcwp3GFq4q2jrarql3tpQdCO4aU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwEj3qP6S9d80MCqb0o5C5MoGgiR8rlVfeO1/n2Ljc/5q8OReDX
	nC8VwfinTaFxAtF7FHMWUOf6xnvvUHBq9nJP+cbymWw8ECVn4L6g2WUFx1mPy2gdqTs=
X-Gm-Gg: ATEYQzxLpVb+ykWd8mTePf/Ngm/VEcupVQxu6cpRrTQoBzvkuxmmxXKrfweZpy3KzPM
	Jt448uLVe8qLmPrbawkD57apgBcHFxIRTkPZ7F6CnSkbmRtapOIi3jwsxKpuEQ/zu3/q7gITf9C
	NeeTGWYU4sEIihttkjd9S25cSRwq/j0+BKbjUx+hRMBk9osKiqI+sksy/oIvnDYpu25sOKjds1S
	qTeqrYqZQT/Hn4Aoxx1rBCMc/wmsOJPgHu4m9wQQuj43p48up+NgM704rmGuHV8zehobIpzlZ+s
	LteyuvJK9yegDtA+kK2Xqlpa+feOoN5BmViDNILYLJDFdRK0CmSqLww4oPeFjVGKeR2Cvfqxard
	4CRRESmONblW0TiFW45+97MRwAzunIFTwhtCFH7abtyQdipg5CP/TBDCas4Ca51mnJTaECrsoVE
	WzPjlEIJFddRdH3NIT9lrjq3STlxePP33kf7cyQf0RW5IPUCbul+0hBx5O7JSmyGtqYMXRocjTs
	w==
X-Received: by 2002:a05:6820:1b10:b0:679:efce:99a9 with SMTP id 006d021491bc7-679fadb8724mr5462181eaf.11.1772296056439;
        Sat, 28 Feb 2026 08:27:36 -0800 (PST)
Received: from ?IPV6:2600:8803:e7e4:500:1031:c44e:9f1f:17c1? ([2600:8803:e7e4:500:1031:c44e:9f1f:17c1])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-679f2bec8a1sm6258781eaf.6.2026.02.28.08.27.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 28 Feb 2026 08:27:36 -0800 (PST)
Message-ID: <f697a233-2fde-49e8-8c85-dbcf2599eaa9@baylibre.com>
Date: Sat, 28 Feb 2026 10:27:35 -0600
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 0/5] iio: accel: adxl345: Implement event scaling and
 ABI compliance
To: Taha Ed-Dafili <0rayn.dev@gmail.com>, linux-iio@vger.kernel.org,
 jic23@kernel.org
Cc: rdunlap@infradead.org, skhan@linuxfoundation.org, nuno.sa@analog.com,
 andy@kernel.org, corbet@lwn.net, lars@metafoo.de,
 Michael.Hennerich@analog.com, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260226151108.22383-1-0rayn.dev@gmail.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20260226151108.22383-1-0rayn.dev@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2/26/26 9:11 AM, Taha Ed-Dafili wrote:
> This series addresses ADXL345 driver non-compliance with the IIO ABI.
> 
Reviewed-by: David Lechner <dlechner@baylibre.com>

