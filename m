Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B77951DDA18
	for <linux-doc@vger.kernel.org>; Sat, 29 Nov 2025 15:01:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764428508; cv=none; b=thxuvSJeanGbu5k7FggzIjJsUBypYmI0f2tKYStaXVU+UidPG9lUPYZrIpPq1ebSrfSurIbU8yu5+35gHNqu4f2IfepiRBY6CBwUcoHbYPyZtcLdTBSTAWVcJnFnHu5Z4ExNxbLEkTt8WaYIbO5rkm3kRGZVZAYuW44ZPY5cmWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764428508; c=relaxed/simple;
	bh=S82F1K7S3wq+wEZwqZYNaKQ6Z90pqwCr0/1QZlEP1+0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RSWCJvJUWaKiOjPGs66wq7kyLHODW38TjYZ/L9meX2/hiR7x1unLV0X4x03YwIxWcFgj8mtwjSugDLuXAilB0vFDTDY189ZR0YI+EOYXB7vtQE49w01PHgtHZyIew11JxUuqJwW2eqPcIWjapfoJkETXGxwClTOYIBgJi3Rt98g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HHuzSgkN; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HHuzSgkN"
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-37b9728a353so1992711fa.0
        for <linux-doc@vger.kernel.org>; Sat, 29 Nov 2025 07:01:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764428505; x=1765033305; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=2DyIri4gHptV5hDHgdSaKb6KWPh3tki3cdXW1D5aCBI=;
        b=HHuzSgkNo8bCdB83l/XSrNqWuUvM2pvRHnQ1s6d1V/YSOOmrTXGZA5L6rYgiyZmYP4
         uWF7/dcj8afw9Fs15l8jzDbcy2zTq2HKY1GNlok4HRSM54eK5N7pxgXq1WYlPHBll3p9
         1GWTlrITo3tSJfVkDtJSMp/JKRNxpCVB9TognclaIKG1r1EsVL0hNWR73B4l1DWqAhUu
         vtU3zK1TT2yD3e2iIBoXlTkDHJeRNsK+kmAkEYKAAtxVvHrW4UZ0+nHpW81TLk6DcQoL
         C+RHImekTlrHfeR0P2X8lFgVJk7z0cmYrj1qHpoguoU+aSQa4j/mL6ykQ3XZpH3V2qLV
         mZrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764428505; x=1765033305;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2DyIri4gHptV5hDHgdSaKb6KWPh3tki3cdXW1D5aCBI=;
        b=P5F+bMu4phlqVN04Q0Uai46ZQM5uv6B0GtGB6ukwd/E5tTidg85XjSjZ/iw4Zt2I8H
         QJ/zWBMyAzfn+NZW0a4iPjf2dw8dAZbXj8SduUfVrUkNCl3fjwo/Y2ouqHruNpRHa7LF
         Gmd/j39MTv6ObUAXjbGsWM9w42CC3PMSODG/0KISHgoPfZWGn/QvtKlycgUzDyqt6/CF
         HHZv4Ltm48K6Pp6gOLu9w6ZQmulCfOgLrWDGz4zpoWGuz2Tc2z6tkDzqUIbixp73bz4t
         pLtcywY14own8EkvzUr7FWcY+SN5K5+OwhodHBspLIzRP9J2DFsuP1ZSPsVERD1TZ7iw
         OesQ==
X-Gm-Message-State: AOJu0YxmBgpGRa6oIk3CYB21g5dUaMztYbN+GzLr/UT2wE/IGwW/aksb
	QqqzGHHdc5IryYuzwIRMWFLrfWQIB07mSDZggJ0rVgVz2ZzIodiT34qu
X-Gm-Gg: ASbGncuqoGtaNpuDHERzVNFLVnCz1wVmOKhidfQ38I6TAZVhxw+Xv8b3BQ5GaXePxtn
	i3S60H/txFBKt5/TnTUcfe56zTTpiwUFwoDJPZw7UsoS8w624LhAx0Dp3c02Df/6n/xk5rFHost
	eNjqDCG+H/VbxUv/4GI6HVJnJpH51WDXSr21WffOi2Lbhp193WJoTQzE17+kSmPCdVRqiJWhPfV
	eePVYRqvB6XK9osJ+B1MrarmCUyzEgC1KSxLBow7Lw2vNHVd4qAUbJFvVQA0at2l9FbmBD8CKgZ
	2tcuCvYWFOTaXcU63GDhv1WGwJqvfqFne+nsZdqXCjOCdWOWp++wT82IP83GX+CaeAng7elE6yL
	SvFWR5p4iOfG6JaRsZ0sbnAVDnTsuDwPrHC2yhVjIdD7Xe1smLp5rkP5vb5XpdvSxvsOmRJjtVy
	d16OHUfbPho2Xx3a+Mio97Z7t4gCLD+7zvDTqh1pC56qfv
X-Google-Smtp-Source: AGHT+IEYMiFXC3v2TmshLvb59zyfSm9LpspO+/OfzyuqNLM4yBmG5ZGE/1yqj4SZxSsPzD0yHRxSmg==
X-Received: by 2002:a05:651c:2148:b0:369:55f3:57f with SMTP id 38308e7fff4ca-37cd92cd20amr61236061fa.35.1764428504526;
        Sat, 29 Nov 2025 07:01:44 -0800 (PST)
Received: from [192.168.1.149] (nat-0-0.nsk.sibset.net. [5.44.169.188])
        by smtp.googlemail.com with ESMTPSA id 38308e7fff4ca-37d2369067bsm17074441fa.9.2025.11.29.07.01.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 29 Nov 2025 07:01:44 -0800 (PST)
Sender: Maxim Nikulin <m.a.nikulin@gmail.com>
Message-ID: <c5bb2474-b66d-47e5-b392-b12c4db979df@gmail.com>
Date: Sat, 29 Nov 2025 22:01:41 +0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs: admin: devices: /dev/sr<N> for SCSI CD-ROM
To: Bagas Sanjaya <bagasdotme@gmail.com>, Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>, linux-scsi@vger.kernel.org
References: <a221275c-53af-459d-97ed-05a0766adb04@gmail.com>
 <aSqPHMSgtHN7ty8-@archie.me>
Content-Language: en-US, ru-RU
From: Max Nikulin <manikulin@gmail.com>
In-Reply-To: <aSqPHMSgtHN7ty8-@archie.me>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 29/11/2025 13:13, Bagas Sanjaya wrote:
> On Sat, Nov 29, 2025 at 12:12:32AM +0700, Max Nikulin wrote:
>> +Usage of ``/dev/scd?`` as alternate SCSI CD-ROM names for ``sr?`` devices
>> +ended around year 2011.
> 
> What about "Support for /dev/scd? as alternative names for /dev/sr? has been
> removed in 2011"?

If others support your suggestion then I do not mind. Feel free to 
commit preferred variant ignoring my patch.

I would be more verbose however by adding that it was removed namely 
from udev:

Creation of ``/dev/scd?`` alternative names for ``sr?`` CD-ROM and other 
optical drives (using SCSI commands) was removed in ``udev-174`` 
(released in 2011).

Perhaps I am biased by my confusion. Noticed that wodim tries to access 
currently absent /dev/scd0 for kernels >= X.6, I tried git blame game in 
kernel repository to find kernel version when scd<N> were renamed to 
sr<N>. It took some time for me to realize that it is impossible to 
determine scd vs. sr from kernel version. That is why I would consider 
adding explicit mention of udev. Otherwise for me it sounds like that 
scd? names were removed from kernel. I am not a native English speaker, 
so I do not insist on my variant.

How long I should wait for comments before submitting another revision 
of the patch? I hope, pending changes are not an obstacle for those who 
are tempting to review the whole devices.rst file.
