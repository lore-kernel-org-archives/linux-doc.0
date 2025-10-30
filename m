Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFE50284890
	for <linux-doc@vger.kernel.org>; Thu, 30 Oct 2025 09:55:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761818109; cv=none; b=X0vNeycH00Z63wSnQyM3Go3G2jDTAXEY2t+rwVF+eMjYV2qOTT8Fq6VAbp8pARsxBGmtzAh41Yh6oI8VcfR7K6vSG+z9D2RBl/3D+mmxftYszEyqUo4HQRXsYLJITtWVgebsffnnklwcD4HsEDNna3qI3lnDPyRW+Vm+Qb5fKVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761818109; c=relaxed/simple;
	bh=dO2gleCtkDNFYMQWgAd26536ncu+x9rFH4ZWMQTmoaw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Xf+hA9EvZW4Cn4PtMmgE0qmkJe7DMKvV6Bnnu+r07tbLjixp1aYlLmshy1lpvx8I4aide7conuL09M8OljGtR9IsRe3BS8iF24emZMnfeuC7f6yoS0gALwAb1IX0P6CYrtYbjzGOXrzSNPnyG8oMjFuHDKTBbSn6QKgcSPBq1IY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e6EDUU1X; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e6EDUU1X"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-340324d333dso907007a91.2
        for <linux-doc@vger.kernel.org>; Thu, 30 Oct 2025 02:55:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761818107; x=1762422907; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=97HULdiVAnBDJxy3scjatyOB852RWBXQiWTCZuX+rtw=;
        b=e6EDUU1XsjAMjk5ik9U4ewA27JzTlU/0w6HRgqvejiLT0ThQKGd6dgF7soy6jGeN32
         dX899Y5SXEQUyPx9KnmCWzJ9X92HYRdmBk8BQAABtkLNYclth5OfrwoMp43mCt3wPKxH
         pSR1TLa2/u3qR8g6EZXdMXXkFPWO/ttMiIxdclUKY/uxWVeS+oyBpFdJI5qmdFoo+uI/
         wC2HK9TTAMbp3S6oCJ7nZt3CFq2M4M7PHEpJW5JS37b6opeH+HHKNvukpETzQ18jjmig
         yd0MObktUBNKvA6y3WkCc8VuW5YxjyEqjmS0fq81zrJUjrmizpyWiTl9rZRO/aG9Zmx+
         Qrmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761818107; x=1762422907;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=97HULdiVAnBDJxy3scjatyOB852RWBXQiWTCZuX+rtw=;
        b=H7s4r4afuknl+Bk8QGlsjenuXI0nXoize1ZpkSlqG/L3ba4m25eu7DS6k+JdRwU5a6
         iCB0cd7pkToWb2sM1ZKmFvkBOr0NYjlvP6kYXAeI67sKUm4YtTX9s5NxoZE0HIxy2+JM
         lJ+ffoOsciqfLVgM1zh6OSP+UOsqAlTzQRu9EnANPcyR9voyizC48vDKHC87sHs+Iz4p
         TWNirjM3Hlgd/VVLr+ywkCP1sXW1wi5pF1Zw3p8LYjKiKKFbJfdnzl0YYD4AUFHpkYtr
         hCdqJPrkuuhadnQw8FKZL1EILNLPbrvryCr22S2xvebRG5dbr3ZCo66cxBL6Jp6AcRpg
         ePGA==
X-Forwarded-Encrypted: i=1; AJvYcCUeYHGdtRAvSm8b5KwbIXEbnLSGWT9OqycgJmJrgC4MHnmAWU85CFVR8/q2Ob9mHOzaQLRyVXexFG4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyXgi3E6fFZbSU7aOrynN30KqN4t++bxw5OlaDvItf9QUNE6flj
	ilbHxYVdzq2A8qDeCgrryYiwBhkOwA4Ll8Y30mNL4Mu2cKVxYY3LsraC
X-Gm-Gg: ASbGncv6CuiEeiE4V7B4fYaLii5/CFnOn3CWusBlysJAx7a3iVrQK8P+hLN80ZiYBBo
	6SvPLU+8PGThENNgGJxvvn84GQIN4JzEX4olA9UPMWP+7LFKldlpuNjXvCc5KVJulpRCJ2wqv+c
	WbVnzmRlg0CB1DMig2mLCW41zn0doC1mvJ/+RyHGpX27MrhlAZsQVeP+3N4IwST841SxsyUOT0Z
	mG/mfj8VJ9k93BYY02KmeiP56ue1DPTft+J4mMGSqGaina4caBMCg4mFp47CglWTg1U4MMrFNhL
	FV07rEKQpgL8DtK7KCDVYqKKAj0GTP1dCEBc6dBHS64qcVbXd7CT//8JEh2BlWkZWL4dML/3DZW
	WjelMZcpNX4y+/T+xTz9e0kEbUlGle5JrK9C9TY2uw4g8IMl4vriv13wrzpB0gg+bXdzfmuYY8U
	Fjgud81sqcssrwFTKPHQLtCT372rhh8h+LbI3w0v1JRqEPLg==
X-Google-Smtp-Source: AGHT+IGaCmob1qGePGI9vNywWlyq4tKwBVrEa6Iiap+mdQYQDlV2/wo7q+qKlnSQTTvUsALUdQ9cFg==
X-Received: by 2002:a17:90b:540e:b0:340:299e:e00 with SMTP id 98e67ed59e1d1-3403a265683mr7238744a91.11.1761818106785;
        Thu, 30 Oct 2025 02:55:06 -0700 (PDT)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3402a5540absm4575368a91.5.2025.10.30.02.55.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Oct 2025 02:55:06 -0700 (PDT)
Message-ID: <d1ade088-30d3-4ee3-8df6-ba240adf2ec4@gmail.com>
Date: Thu, 30 Oct 2025 18:55:04 +0900
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tools/docs/sphinx-build-wrapper: Emit $SPHINXOPTS later
 in args list
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
References: <eaf4bfd8-fb80-45d0-b3ec-4047692ebbed@gmail.com>
 <91aef821-6355-4135-b179-69b845a827f6@gmail.com>
 <87v7jxr9hd.fsf@trenco.lwn.net>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <87v7jxr9hd.fsf@trenco.lwn.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

[-CC: Mauro and Randy]

Hi,

On Wed, 29 Oct 2025 09:52:30 -0600, Jonathan Corbet wrote:
> Akira Yokosawa <akiyks@gmail.com> writes:
[...]

>> Jon, could you consider applying this fix and making it be tested
>> directly at https://www.kernel.org/doc/html/next/ ?
>>
>> The custom "next-2025mmdd" tag there would be helpful for us to catch
>> regressions in linux-next docs builds.
> 
> It doesn't seem like there should be any regressions ... I've applied
> it, thanks.

Today's build at https://www.kernel.org/doc/html/next/ still has
"6.18.0-rc3" as the version tag.  Other new changes in docs-next are
reflected there.

Konstantin, I'm not sure but have you dropped the

    SPHINXOPTS="-D version=${TAGVER} -q"

flag from the command line of next docs build?

If that's the case, can you restore it?

Thanks, Akira
