Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com [209.85.208.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46B763B8BA3
	for <linux-doc@vger.kernel.org>; Wed, 25 Feb 2026 13:42:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772026946; cv=none; b=PJHjGywXnBuAosjgxi6j6tew0SV/U7HycBQhDtNEVafXSynnqPUX9wfYhnlE3avd3RXlQz4KZJtbkrreB8rLlGp0bw2Cf8G95pqEyMJSpzGBwUf0zwAVvOf5hdtc1WKPfuZKzhJuTcop8dCz0dPt7Whpbml99OOxrJjfgOmnHYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772026946; c=relaxed/simple;
	bh=tYdjEGnz1EsZUC8A6iACOKdkEfqIBfxVguRN3pG2Qcs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=q+HzHEy89BLqAZHu+HcHhuMDpzwIu3QdNi3XOUPEKcIskYLhS7niw/YoGr1nYJI1UlWoBiNNjWr8JWAt2VECOEer5ap0KlqpZ7SnlqIph0vRlhJ4brhYa7BXxcdO/hNbTkTkX/lQMHJIHG3VLyri9ccoE9BWKyI4j1XQHOSxi2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yNVLptyJ; arc=none smtp.client-ip=209.85.208.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yNVLptyJ"
Received: by mail-ed1-f68.google.com with SMTP id 4fb4d7f45d1cf-65c187dfc82so8573577a12.2
        for <linux-doc@vger.kernel.org>; Wed, 25 Feb 2026 05:42:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772026943; x=1772631743; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZJfmcZ4qFbylZDu+uvn8Ui6nkXp001OEAlMyyRd9wXQ=;
        b=yNVLptyJpnb+yglreV+1vepyRiHjRXHdVbXezDmDD4QVNS5l3jXBM/oud+j4mntewM
         aDNGyvHc6LL83ULDaGiwNIfKWo9nwLIhx5u2jwuAFqIk3Q1ANYBbHtOIUix8WLMLnVkL
         Wa/AZ2wwxaM2RQa6hjbnxtP/j3DehXyQOqjumZI8txDrYiK6BM3IFSZyU2jrTu904QYo
         K0NeUwPnHQ9PzE2dDmL/JjzgQo4bQqSt5UIdODce0JawdFsyOHqZmcSd0MqNAwmW49Vt
         O1Ot3FpEFvz9Dy7D5vOm56aVXERfg32M4QbY5FABNr2lx0tCUPPM9hN+I6ysfNigHc5O
         Tq2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772026943; x=1772631743;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZJfmcZ4qFbylZDu+uvn8Ui6nkXp001OEAlMyyRd9wXQ=;
        b=TH9CAnTdBfPGTNiJJCdwD179PhK4Q96Iw3n7vWq8Lf9LeEb2fMRN//pnLjqKs5tcaU
         5ORxcy9ktZN/dCzRfQSRzBYX6DeLJ9woBql0N7jslQpiHpwt4xF3OrXrMMuqoXJt+Iqh
         034Fmg/eOtkJvH74mIgwMmHg/fe7pyAzugdaAJa+ZGwKRw+1NE9b1QuKwJ+mE3YSa/rV
         dEfxp8zPvvtI/y/YSPEMtQz80N6SnXmyVr4qA3NwFWTbWVAYKwtLTOh/cEXCSanMaxyx
         iA8UXigymuQH76hOG2QUBFxrAJtk135phbBIol7lrSercjKEl12yL5RCOH7GEBtCVnFY
         9S3g==
X-Forwarded-Encrypted: i=1; AJvYcCVPa7HYJyDy73SofU6Z8GO1wFqdf64vccovzg9E1y8I3Kx7bNsYGHnM/VxpjV57tN+DvRqyJG7lQSg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzxzfOTvmwhLF6wdr0a3SQEmmTj6HmqwGvMBTCjsCiz/oo7Kcxc
	YrZYOUyrkf8mozfNQoI+rgBTQOpKbrdVrIopDL9YnNNlz8HV9uAVTmqpX1mApngzrVM=
X-Gm-Gg: ATEYQzyNIEgL2qXVT6Q6SNFjMuDsi36oCi5nhYfiyvNSTIIFLcnZ5czgU8lIo+XuI6u
	VGWHD55jn6QyxsMIUnNjPx19EIAWrByLh6Mm1hyMHKTE2phEJAK3LcuhYV0e4HVTCB1hT0Y29Dy
	v56KVVksHKHN/6N+qcbj59feBffqDFcqKznCoi/GwXy7nOYpy9uvT5X8ZVstonmvtGQ6hB0kPzv
	4qLjvrNaA/8o8D0mBcMeWynSc/qHyGzlgcRiX2QktCw6yuCEIrIMwkdHBZ+BabRLlcbv14+CMZF
	Tn1+wu42xap5OENcGHc2b8yXleFfT3+rRZBBkTL5zH0oIrST8iI0Y8HIxC1cfhnbUky46aVbiBU
	huGiyZArrb2bl5ZE3SeuL1rQHDs0yQVdJSQBEcqM3tm3kz6vKuFP4X3qhFnqjENr2hg8OULEN7y
	x5Gv33uFn1mZETichqo8l/VBXe00DaawtoHbeL+iqbMDtMyHGZfNIX1z+9GLPRUA3l
X-Received: by 2002:a05:6402:51cc:b0:658:b76f:da7c with SMTP id 4fb4d7f45d1cf-65ea4ed5a89mr10428013a12.13.1772026942535;
        Wed, 25 Feb 2026 05:42:22 -0800 (PST)
Received: from [192.168.0.40] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65eaba13806sm4384331a12.19.2026.02.25.05.42.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Feb 2026 05:42:22 -0800 (PST)
Message-ID: <172a9083-8cd6-428f-bd3d-d831e610b37b@linaro.org>
Date: Wed, 25 Feb 2026 13:42:19 +0000
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 00/18] accel/qda: Introduce Qualcomm DSP Accelerator
 driver
To: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
 Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 iommu@lists.linux.dev, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org,
 Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Bharath Kumar <quic_bkumar@quicinc.com>,
 Chenna Kesava Raju <quic_chennak@quicinc.com>
References: <vU2QyEVqOu-D3eGp7BZFICUeauxL32bwWzeidOAijoeVaJTk8KcRVsaQQD4MdFQEcaQTZ5RkzRsz9-Lhl1qsqg==@protonmail.internalid>
 <20260224-qda-firstpost-v1-0-fe46a9c1a046@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20260224-qda-firstpost-v1-0-fe46a9c1a046@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 23/02/2026 19:08, Ekansh Gupta wrote:
> User-space staging branch
> ============
> https://github.com/qualcomm/fastrpc/tree/accel/staging

What would be really nice to see would be mesa integration allowing 
convergence of the xDSP/xPU accelerator space around something like a 
standard.

See: 
https://blog.tomeuvizoso.net/2025/07/rockchip-npu-update-6-we-are-in-mainline.html

---
bod
