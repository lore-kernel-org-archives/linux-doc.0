Received: from mail-il1-f181.google.com (mail-il1-f181.google.com [209.85.166.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BE86848D
	for <linux-doc@vger.kernel.org>; Fri, 31 May 2024 14:20:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717165238; cv=none; b=Pn+4dYdTGdssGHHra2zhs4z/jtkkdRLmiYZ7unDlVBobVCrZvCAdo6Y0DEhTR4ei58k5A0FWtyf32abv9OLMlrClbxGQSzLoNkQk5Tq9hFPECWtaSMHFdn8xVTnpiJzPm4oZ5vgqcWRQB8Jm7AxoAvgFwMtdcf9sZrSMURCGCHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717165238; c=relaxed/simple;
	bh=KzEblG+UBmVvZj8GKGJDWzqcl+vAZI6CULfRGM9IZeY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YpOMmiO1/lXtDajHqCAphIRXvlt7U5NQQymV5ZZRDuhsqK0sQgZBH70j0x32MKcOIXCOd253LmfAWr1xS1w2zS2YU4cmuoDMxXT4HupZQ0tiFEjZOMLPBWd/J2vTa2h6ZdVBW+gFrikxlQz6BEWIH/bZcAfoafg/9sC5Jc/kYJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=H63gkFt8; arc=none smtp.client-ip=209.85.166.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="H63gkFt8"
Received: by mail-il1-f181.google.com with SMTP id e9e14a558f8ab-3748ec0cae2so376595ab.3
        for <linux-doc@vger.kernel.org>; Fri, 31 May 2024 07:20:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1717165235; x=1717770035; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7+VibLQtwZz7JsVuJcW09ZTb85DGOzOVeX9MBCZ9kfg=;
        b=H63gkFt8JHAvBkMhlTHY45axXqAVd8Ks+ApKoaCSM1sUK7fd2IAOmMrgxQHVZ97V6N
         0TSJBhBGJg7dvCwd4g5i3FLwMlELgjsqWI2Fbuitb2rp0r2YUmFkNCjY+/j0ZIc64QH3
         0eyYqQRLqRCjOMbVtoh4VdcAnSwTm7KyIafxE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717165235; x=1717770035;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7+VibLQtwZz7JsVuJcW09ZTb85DGOzOVeX9MBCZ9kfg=;
        b=STZFUSuntbeoLx86dbSysVOorlb9OtvuQbqOPphMxHSFlZIaKn8eo0muz/y1XnPR3W
         IncrS4OoXvH5hzoPCwIXuiSGFKsqgupOTjFTn5ErKukW7vQlMVowlsAKlDndy3htc3yn
         UiU1cuGgoFmO1CC9tSYOrEnO+tasRdjZMChJj29pr/aCeDsFAKJavqqyDRk9+BFUGSLE
         dsO7++4iZyKNQiqusctS278ly3D9raf+gIeNIGln/DcGsrCisYlqOSVxWKpnlZPKHbWL
         KDiqBztt+nTb6DDrWyjL9sTALRPtM2ce62tdAm+vqpWM83+ebQle6f4rviNcgkvUZjxz
         QTpQ==
X-Forwarded-Encrypted: i=1; AJvYcCWZbTvr7huWSgPf8bsPGHp6dNuwb0SyJSRwHV3sVcI38o0sfTKa+gi2BRL9YMkzbwObFK6z3BGBxEw/ol05W+wQXXx8d1xuhwgX
X-Gm-Message-State: AOJu0Yze56PslzUYBwr1BcDA4yrN4MzxJnh3++iIG/0F+6tMZRVdyimB
	vKOsnl5g5b4G6odpIuBhan6Pi38RHqOqn+yZwykq8zGFloZpSfiz0Qdew4Zwfq4=
X-Google-Smtp-Source: AGHT+IFucIP1XY+8lNyDc497JR3Cn/S9ZLDLxEWsA4aPUq5KWN7j+jKcMbBK72UCzEokx4RbxnQdFA==
X-Received: by 2002:a5e:8b09:0:b0:7e1:8829:51f6 with SMTP id ca18e2360f4ac-7eafff1f512mr226430539f.1.1717165235070;
        Fri, 31 May 2024 07:20:35 -0700 (PDT)
Received: from [192.168.1.128] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4b4881d64a1sm500136173.43.2024.05.31.07.20.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 May 2024 07:20:34 -0700 (PDT)
Message-ID: <16b1bcb5-00c6-4b59-a880-188bed32d175@linuxfoundation.org>
Date: Fri, 31 May 2024 08:20:32 -0600
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Documentation/accel/qaic: Fix typo 'phsyical'
To: Danish Prakash <contact@danishpraka.sh>
Cc: Jeffrey Hugo <quic_jhugo@quicinc.com>,
 Carl Vanderlip <quic_carlv@quicinc.com>,
 Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>,
 Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 "open list:QUALCOMM CLOUD AI (QAIC) DRIVER" <linux-arm-msm@vger.kernel.org>,
 "open list:QUALCOMM CLOUD AI (QAIC) DRIVER"
 <dri-devel@lists.freedesktop.org>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20240531060929.5281-1-contact@danishpraka.sh>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20240531060929.5281-1-contact@danishpraka.sh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/31/24 00:09, Danish Prakash wrote:
> (as part of LFX Linux Mentorship program)
> 

Please add proper commit log for this change.

> Signed-off-by: Danish Prakash <contact@danishpraka.sh>

> ---
>   Documentation/accel/qaic/qaic.rst | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/accel/qaic/qaic.rst b/Documentation/accel/qaic/qaic.rst
> index efb7771273bb..628bf2f7a416 100644
> --- a/Documentation/accel/qaic/qaic.rst
> +++ b/Documentation/accel/qaic/qaic.rst
> @@ -93,7 +93,7 @@ commands (does not impact QAIC).
>   uAPI
>   ====
>   
> -QAIC creates an accel device per phsyical PCIe device. This accel device exists
> +QAIC creates an accel device per physical PCIe device. This accel device exists
>   for as long as the PCIe device is known to Linux.
>   
>   The PCIe device may not be in the state to accept requests from userspace at

thanks,
-- Shuah
