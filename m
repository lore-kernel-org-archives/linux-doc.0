Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEF8C358360
	for <linux-doc@vger.kernel.org>; Fri, 22 May 2026 09:10:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779441051; cv=none; b=iZYCYWVx5sRkU+QlH3gUURCZxRBJcmfxeDtEKpzjY8JHKlrkXqfpfOPNhkf7mMdpys+XcHZoFvnH1y1YUgBmE2pMLNWBBQJ1QLPwR1EBjaeewC0OoGAFGX1nWf6if2H68jYA6cdI38yZkjRgpRoD+ywJje72DZk+2kACoSEFlGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779441051; c=relaxed/simple;
	bh=gQd0/PSDd5xChvfuHuigysCKmbERS12h0RRL2X7HT3Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DwqTbQA9qCAPnBnT1sak6a9f3DOz/IS84hyQzRi4xg1frfwqb5oleZS+GEu1fgrv4dA9BauROEZjf7N852sRyYD+GP87kBlOQBtWohHVmwvSM1ZH/L09lK4Gp42UhWrrkGvkA1fi8L49Vu4ncvgskrLBUJVwaGHIynIOH3gVimc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=slOrbL68; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="slOrbL68"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-48fde648a71so49395205e9.0
        for <linux-doc@vger.kernel.org>; Fri, 22 May 2026 02:10:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779441048; x=1780045848; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gQd0/PSDd5xChvfuHuigysCKmbERS12h0RRL2X7HT3Q=;
        b=slOrbL68cMVPNXL2JycZ35HJMaS2qe9AzTI7zNoXjByjfBfQTxLJlLYcQeDyw6IdjY
         uhSzPYVZ1sr/Ugs1dcGwIE8O/Nx5jlbE/QdzMwlhPKJMZ8b44HcanqhLKGJFfq4W0TeA
         BU6upIKVRR4cCEULKpQzCJ8oVSDdA62iUdsu18+sLxhUcSY9/0Wltn4Uf/9q3INZ3pFL
         0+zelHn3sVkYkelw6RzkmPeLrZkemvxxFJoc7/Skqxav0a+xyayjgo6QfLbA4kZkKatC
         sxMR1bxWKiet/gZTTroO83CKb5L3QOac0hCmcyEFbDf3zngmkRTavVQGylww2osCSyfl
         8org==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779441048; x=1780045848;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gQd0/PSDd5xChvfuHuigysCKmbERS12h0RRL2X7HT3Q=;
        b=HM8qv2P+WYV2NDGWWyoWEvOO1eFnGmyrtHL2pgCqCaVIGdbwFq5bzQpeSCTfCTMh1H
         A6HHQPn1yZKln3Y+uAXtGjn4CwaktvYt2bu7aDL/9tOeVy4BbhBaa/9UampQGoVfUo4/
         8ojYQXWX0nL1qKICetYI3c15/co28rp5WLcRNIIdWdjBYpiqaCeglwzgGuFyMMPDF0h6
         NhVqWemN8Wph6H4oZmnaBytC0CrOSf7XvuT1oY/SSfvYtw5qo9I7kanpJYrH8Az6E7Ys
         +vQIZCG1sSLQDSrcZo25k/P/nXEWM2aEHIMms8/bvjeX3Xly4UmUHFp2zvRetQ65Qs/r
         4Wvg==
X-Forwarded-Encrypted: i=1; AFNElJ8si6O1tvEO0CX23iEjKDIRfC+vhCmCUwFHcU2sLFlQxPBSaVAncB2RLNBdqNyuiyLFg4TPOPwlzS8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7VmaSjZlX2fcLDj/cWF+adg/1b4YsLHKaP0BsT4Q1+jYamgGP
	zl/H/J4wSdUXKE2RZ++AAXF3rsnOZyHh0xJWQ6lwYBYke1n61bqV7/JD7viQjNq4QNA=
X-Gm-Gg: Acq92OGi0CQZRjxxIrIri+Nv4w25y7prm+dHjce6qM43Hi4nKsWIeOcUHLY/vKwyIz8
	aWRMHQOOc3t52A25jSNdSmyNLFa0WOv52fJOodzlQRJ8VQOH72pj5jXUeUtROohYQNE/MkOChQ6
	1Vbb+FW6D5WZEYNHzauJAGrUlYzI8lDaqRl+jHKgaU7GiV7ZpTjjKl22FJO53/7UpEPIBuggKge
	yS+3eWbvpQ5jlDgKaDS32Jll4hY97A1RieYCuZHEi9+v66sVE+ralkcLbW1OeeMs2dvgU6H3xUe
	n/vo/cQfLvH14kIyAsWhtjqrYpe+Q1ZIhKg4rlYUETJA3pxRsL6itSjIpQFUDwn05LO1I6kMPVG
	9BEDr4oXIiyJau7/W7lSF0zPmYzg+UT53I5Axjryp10giKL65iDFO4r3URiuYZSoDcGB2z5M4fJ
	y3rPytkRTKjnyJceWE4058hHKKo47HBiI=
X-Received: by 2002:a05:600c:c4a4:b0:485:3c2e:60d5 with SMTP id 5b1f17b1804b1-4904225fbdamr31048875e9.2.1779441048168;
        Fri, 22 May 2026 02:10:48 -0700 (PDT)
Received: from [10.11.12.110] ([82.76.215.73])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4904527f7f7sm50431205e9.7.2026.05.22.02.10.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2026 02:10:47 -0700 (PDT)
Message-ID: <9432f07f-3724-4257-b6ab-84721e619f78@linaro.org>
Date: Fri, 22 May 2026 12:10:45 +0300
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 04/28] mtd: spi-nor: swp: Improve locking user
 experience
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>,
 Takahiro Kuwano <takahiro.kuwano@infineon.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>
Cc: Sean Anderson <sean.anderson@linux.dev>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Steam Lin <STLin2@winbond.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, stable@kernel.org
References: <20260507-winbond-v6-18-rc1-spi-nor-swp-v5-0-93453e1a9597@bootlin.com>
 <20260507-winbond-v6-18-rc1-spi-nor-swp-v5-4-93453e1a9597@bootlin.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20260507-winbond-v6-18-rc1-spi-nor-swp-v5-4-93453e1a9597@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 5/7/26 7:46 PM, Miquel Raynal wrote:
> Fixes: 3dd8012a8eeb ("mtd: spi-nor: add TB (Top/Bottom) protect support")
> Cc: stable@kernel.org
Fixes shall be the first patches in the set.
