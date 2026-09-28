Received: from mail-ed2-f33.google.com (mail-ed2-f33.google.com [74.125.228.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AA054F402F
	for <linux-doc@vger.kernel.org>; Mon, 28 Sep 2026 16:46:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.97
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790613986; cv=none; b=sZZb99POVrsqqNlegFt+rvg6PlnC3i5hc0FXhayeqY6kDfXllPsnkAniqHhNgIhdeGiwW5f4qxGTZ4LRHbn1AvihReIFqIz6DGsUZawRgGpw2ob8CocgCLmoIYBWVPBAwNMDR7dqkSYgHiVGuYr78I7p1TEBjX6Jds7R+Hg7MGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790613986; c=relaxed/simple;
	bh=sHeFtEdLj2VdrjXwbKpBHKXExOqIlOqU56efVgnwlto=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=agJqxYp+KUCuaUqaCANIQAXAuxfBbIHdOcPTtLf39debHk5i32++OH5vUC8LypOSq2Fa63pXBfD2C6l9gc94gmAM/71vq2umr6kcC5zCO26zxsNeeIokFp4hER6a6nV+e7ud8KyCyX/bInZ+DJoLhz5pMnRu9ANvY5lS0z7qZ+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fjQ5zZ4K; arc=none smtp.client-ip=74.125.228.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fjQ5zZ4K"
Received: by mail-ed2-f33.google.com with SMTP id 4fb4d7f45d1cf-6ab0d9260baso2598356a12.0
        for <linux-doc@vger.kernel.org>; Mon, 28 Sep 2026 09:46:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790613981; x=1791218781; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0WJjtMKfomHRJ13Kl4mfSx1TJ/imJHPJguTX6sa7AjA=;
        b=fjQ5zZ4Kg32X1HnKS1Cc1tDZg5GohrBBc3FCWde0BuFjaZneSr7j0ABrTls0NaWdiU
         mYr5mgow8k7TmHMatisnTV4u0TBt/Nllz+oOxN5ANk24nrMRMS0dXAkRaUIjdIZO0xvp
         nc4etXtL3PBbTkCWqLlnobXIs26f4xsZwpWyNVSfzmCsotUCDaKWq5AWljYnugpCADIn
         3fALiD0T2T5096HrULJa3kXUlOeQaBGZ2SlR0uZ+F8NoxGPXlYQ68bmSXgenz7Ryjp70
         xiidFpZAWHjWRM8hW2JVYzoTjATRiKQcBIwngJ2RmVbLrtIiyv7IM4/awWBMJ8gXc+70
         QH7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790613981; x=1791218781;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0WJjtMKfomHRJ13Kl4mfSx1TJ/imJHPJguTX6sa7AjA=;
        b=hsqzCV5vRaiBySPExz6V+rWweKEYs8ujTzemGOhVgjfNoWD8oWmKMJx3etY6/GNEYK
         zXw8/mMZdxukvpqqvf4JrWIYK0Qy5N646kytXjtxvHm3jPGmOmHRMicuKqPEo3TMuuJq
         Dlyq2ZblT0PqgTAJ9B9YxD0tck8n+X0mTXTpI9Ff4tqIvqmToo3xn6m4LgITYOJ8wfAD
         gD/JVS3Zy0Cmu2hiqzYmYuyxxDHKPhIYQcPtsrQHZKRt7UcSQnesZbZSJ7V/DGIp6Nl9
         icvsIkGVT8LCQpoOf7y3hyRF6WQum+NVUeDh6YyDKC6C/y51hj7SxkOE95IX5lg47cCN
         XGWA==
X-Forwarded-Encrypted: i=1; AKwUvBwqoQ6N2JisSj25wiitgO1Kc81HgGg4Y9uV44xVQmmp1jPFzyIdD60RSoWuh0EYR9pN74/iy5+FNGs=@vger.kernel.org
X-Gm-Message-State: AFq9FYKEvsuEyXEgrNO4t2QhRvaxe0qMa10yb+sQvnBBZdfOtEMHyE/3
	a98lYeBBJj7uIXKrzaHLJ5NnR7pKQCS1x1DvK0Yy3fXVfZpo7T79FIy2
X-Gm-Gg: AYBFou1QSKwkM3bvJgWOlpQ5qhbAus1zKyb5JiZZoqiN/LUkpXc8gs0f8xom9Wq9kpR
	X9qpxM6KapCm0eS8+fHMDVM4CsLt72ovGxxoeZvuSJUORN1btva4uwxGOz7NuieIGLKHGkwqQsB
	Rb0GYbUC66OYhaeWaW3B5niCISJIPQUMrIuXMCTsAY4kna2AbPwc3e8MAUe6B7Lr8iysg6OP8Oy
	F/2fuXPGK9KroJa6vP7p5SgsbrWN28Vw7pmwUHXhuADGhelnnoHZKfa+YO68mUlQ0P9KXY9Wn5L
	mOuOXr13Qo4fA+uap0GNIIamjvJMGLIptb1IlTMKPcx8yRVVVy0gKnBMm7RebfxzlSYL5DWC1Fa
	lwH8k0CfxmkvfDyVTuzfdEKFjEBuXOb5HCsca6j5rSGA1VtAkayb/ZUHl3mgtQLlnhzNNgDxA9v
	+RlvtxWhQXbQz4fjanW4g86kiHYp9mcFoROg0tIDxvatJokyJwowyyaqV3qnYrUaOQUkqXvYPZj
	II25eCRvPQXzSJfmpgpe/AE9ktlND3SH513jeZAF+yVz8/uObW4Uar8Fr3yq+BqOipzomyJqQC5
	YIsmF4r2ChJr5kDaHyT7duNL+ZvqWeekf/E6hTePN344D8bQBqFK
X-Received: by 2002:a05:6402:11d0:b0:6a9:aff5:c6e0 with SMTP id 4fb4d7f45d1cf-6aac8f07897mr10901544a12.17.1790613980945;
        Mon, 28 Sep 2026 09:46:20 -0700 (PDT)
Received: from [192.168.0.46] ([63.135.75.98])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aae5dc0cddsm4422209a12.14.2026.09.28.09.46.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Sep 2026 09:46:20 -0700 (PDT)
Message-ID: <1f77d943-cc99-48d2-b6c7-a791a64d98f1@gmail.com>
Date: Mon, 28 Sep 2026 17:46:20 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] ALSA: usb-audio: Demote the severity of sticky
 GET_CUR
To: Takashi Iwai <tiwai@suse.de>
Cc: adventureFAN@gmx.de, corbet@lwn.net, i@rong.moe,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-sound@vger.kernel.org, perex@perex.cz, rdunlap@infradead.org,
 skhan@linuxfoundation.org, tiwai@suse.com
References: <87h5klw6kp.wl-tiwai@suse.de>
 <191af638-f19f-423c-8306-d96ea2b3dcad@gmail.com>
 <87a4p14bzd.wl-tiwai@suse.de>
Content-Language: en-US
From: Faaris Ansari <faaris.ansari@gmail.com>
In-Reply-To: <87a4p14bzd.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

I just tested the latest 7.3.0-rc5 which also exhibited this issue.

However, after reporting this regression separately I found it wasn't 
related to this issue, and instead to 87a6f2fa6e6c ("ALSA: usb-audio: 
Propagate write errors
in generic mixer put callbacks").

I reported this separately here:

https://lore.kernel.org/regressions/CANBVYRCL=8QdLxGg4S6qrahrFtwJxhv-aSGpW7-1S=+iOe4ZGA@mail.gmail.com/T/#mfc03d59d61c4c46165dedde6dc23e26aff5f697d


Apologies for the noise on this issue,

Faaris

On 28/09/2026 16:44, Takashi Iwai wrote:
> On Fri, 25 Sep 2026 20:33:17 +0200,
> Faaris Ansari wrote:
>> Hi there,
>>
>> I am continuing to have a bug across the latest 7.2 kernels, as well
>> as 6.18 and 6.12 LTS branches concerning hardware volume control on my
>> Audient EVO4, that I think is related to this issue - would appreciate
>> some guidance if not.
> Could you verify the behavior on the latest 7.3-rc?
> Once after confirming that the issue is addressed, we may consider
> backporting to the older kernels.
>
>
> thanks,
>
> Takashi
