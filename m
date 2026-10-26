Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793047971;
	b=hsLIj+pz63WolGHboH2jiM8FtPw6P52k4jFva2UT2c83MJMhNcXAr3PvwDnZjv68hcjw
	 pNzj6KXoWT0OxCwxshgSuyWpJKHELE8uDqdMBtsGsDJbtA1nhnDuZLEzsXxaOuRqM7i+L
	 b6jEV+hGqUpPm77rVIaQ16TAxVj4tyW2BgTf+FDav9bsIPzEtFbA7b25tErtDA6vD7HRO
	 zvHbqDWX9mr13/Ooo7FTegNJ/Arifg5sEHMEzcWyGl08DhyBT/gvqG+MZREZHdlhX/4Rw
	 Og9clJfP5LKVCIRL2J/s1sIWW6cgFkzvTfjCjESxBSLR//iLEh8WpwOkohWWBSa0Otw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793047971;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=TL5pG22GEFxX7jVCth8wXjdCOvetcOFUrhXB+QJUk+4=;
	b=TV72b0KexWZaTHgDkrhzx2ztkwOaWa6lFsWsVKv43sZdjO68G1aWz733F6MzWIxP4vmN
	 zmP+YKmI3erNGrRHE4CfIvVzJhNPWM2/yG56x5hCpZUDnHrXMu3T2AF6LWOlcm/Pk/Bh9
	 uYzeFAgxs80DezACfKXXfvb7Ycxf5iNr40aFBUpc40/zsh2Q3vnGRmgnTjhvcQ/EnuhAt
	 h5KDAZmLq32j618mU7nRCmILez2na7QD9cKoXj3cveO1yrNIBvdE6rUwF058kFwrCNhru
	 Lu+okJhRx4ZnbvpvUtNO3x4YqhBebBCLwHXVOv+H/F/uNI9wnkxFRrc3PIwgQxZpaFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=HmRm3bbQ;
	arc=none smtp.remote-ip=74.125.82.41
Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 869C7606A31B
	for <linux-doc@vger.kernel.org>; Mon, 26 Oct 2026 20:52:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 869C7606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=HmRm3bbQ
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-1438d9363fbso327070c88.0
        for <linux-doc@vger.kernel.org>; Mon, 26 Oct 2026 13:52:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793047971; x=1793652771; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=TL5pG22GEFxX7jVCth8wXjdCOvetcOFUrhXB+QJUk+4=;
        b=HmRm3bbQCw7uJmUUDq9XvpxJmzrFb9khsUoP3B3DtYrvuYnlhaL+FnQ1NXSIS42B0A
         yq+7xApHFQJx4Q3Sw1mz5o9Zhg2lGYMgA4FM8s4eNCA0yTqq7a/HYhFu3VdBgHPBb5mr
         E5+wqF426jio/bV3zcZuXtxC+///3mfNPsBHCPJ7B9PBVLNcwvkpeX2Bm0l8pHH84HF9
         EuK+2yuASnbEa8ammKAUrTpUfmO01B1YeHmhMSppU5/7ALslLwXb3ghu3cu164Nuxd24
         62C+laRkssiHGD7ib9zGzar0Th3/9NAs56SxC7HcJtm2VPPV24kJMFzDpqBYaK9i/BYR
         LapQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793047971; x=1793652771;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TL5pG22GEFxX7jVCth8wXjdCOvetcOFUrhXB+QJUk+4=;
        b=G9I/hVtU0wMT3UJg4i3ZegkQT3Zvo0TVfr1GcXDHeyxqaAwEdblzbF1Gl42Xcd8ITT
         kjpml8fAJpUkkCYQ49NT1X/Y5NaiTW/bbo/CoJNwGNqEATnyy5RiFAlXp0UKxBp3z8MZ
         TUPM36yQBgoDnglu9+XcT/m4aQOZVgAOeleA25aWAWf7ngYHNcQBlFeIFSv4r4IkmoD0
         hJNzET5jIbk8Po1E+7OK0GDAONkYggl4UnjUXkSikeVNFnoTd/xBJybFneBif92yXTHd
         8NMZmdI0iRCtaQCuGcOH67gzqqBcvDKI1zleVubtLgq2kBWehtdtjojwEYDLkPipzOLr
         IxUA==
X-Forwarded-Encrypted: i=1; AKwUvBxO6YAHw5K5QuDKL5tcn89bJXPx1572S6pLPsyLiDL8ScSMaHjA/Ys6nSx3OLIss59j8fVIXvPJO/s=@vger.kernel.org
X-Gm-Message-State: AFq9FYLZFhxwl0l1X1BOmUa/F0V2GphmxAHjTAv7pmtk6cXX72fE4JLD
	ATBgozkYPBoAj4pNzCM7Yp4QjbCiZveJYChyXiCq5aSq8K7FNHz0MfsF
X-Gm-Gg: AYBFou0ubv+OzK/xAsT3CDyyieAumelVV0q/2kRXbXihe2l4D09o6hpgnFFdwzMhnli
	X1nD8fSx6gIQmsC4fG1LMAsWVbv+IIEHocNly5mqSWBNrqyNdzCxPUcOAboeWLYAIpPzr2iq1zi
	kBHy7eMFh6CZoazqsS0PoRTFF0WGVVxuJVIZ/HQvWwRHQA/RgtZsb0I5j0HZlQGMQ6C7sKA8/cM
	WoQAkC/xVuID2PAWuSm7LtTbW2f8np9VATLe1wsYZ67mqt7YbbkCQtxfUB8W23aNn30OtWSSG+q
	ii270xH8jxhrphO/yNs94bLRljwBLiFlHnsPqWrGMlaPZibvknlt0dFCF1aavMdhbbALRlcnudY
	574QOCI7wfqnLgmsQbvMXBTpR898nWSOhvHoC1v8+pvNPeMvfc2iNv/FPtK96LdrtUQd5RCisTK
	xRcikUyVpwdywJZvBtxmNEFt6M6p0CJumSPWmsrm5GZRI30wbQ1t/sdBetCa7sgpNjzqMT9jL2p
	odGre+KdLHta6sZI8IIyVRZMJlBxvoN7Qy9zcY4AHk3iAg/pXZJyo7sdFwIfcqJW6fV8mo=
X-Received: by 2002:a05:7023:a8a:b0:14e:37c7:2b20 with SMTP id a92af1059eb24-1a3c5e708c3mr1093253c88.20.1793047970390;
        Mon, 26 Oct 2026 13:52:50 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-198a020df20sm32014337c88.6.2026.10.26.13.52.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 13:52:49 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 26 Oct 2026 13:52:49 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Zac Lanzon <lanzonza@gmail.com>
Cc: linux-hwmon@vger.kernel.org, Aleksa Savic <savicaleksa83@gmail.com>,
	Edward Blair <edward.blair@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v2 1/2] hwmon: (asus_rog_ryujin) Fix pump control source
 on the Ryujin III
Message-ID: <c5dd4280-da25-4fd5-b9c2-2d0e6277bb16@roeck-us.net>
References: <cover.1790512964.git.lanzonza@gmail.com>
 <7ca8fe6cd6b4125813613bd4187ff6cdda72e4b6.1790512964.git.lanzonza@gmail.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7ca8fe6cd6b4125813613bd4187ff6cdda72e4b6.1790512964.git.lanzonza@gmail.com>

On Mon, Sep 28, 2026 at 07:41:05AM -0400, Zac Lanzon wrote:
> The RYUJIN III pump has a 4-pin cable for a motherboard fan header in
> addition to USB. Byte 2 of the set cooler duty command selects the pump
> control source: 0 hands the pump to its internal controller, which
> follows the PWM of the header its 4-pin cable is plugged into, and 1
> makes it follow the pump duty in byte 3. Byte 3 of the cooler duty
> report returns the current source.
> 
> The driver fills byte 2 with duty_channel, which is 1 for the RYUJIN
> III, and a pwm2 write re-sends the reported pump duty with the new fan
> duty. So writing only the internal fan duty takes the pump away from
> its internal controller.
> 
> Measured on a RYUJIN III 360 (firmware AURJ2-S750-0108) with the pump
> cable on AIO_PUMP and the header PWM set through nct6775, after loading
> the driver with the pump on its internal controller (pump rpm):
> 
>                                    header 50%   header 80%   source
>   no write yet                        2160         3090         0
>   pwm2 = 40%, before this patch       1740         1740         1
>   pwm2 = 40%, with this patch         2130         3090         0
> 
> Send the reported source with pwm2 writes. The fan duty applies with
> either source (40%: 1545 to 1590 rpm, 30%: 870 rpm). A pwm2 write sent
> right after a pwm1 write that took the pump over, before the report
> could show the change, left the pump on USB and applied its fan duty
> (2 of 2 trials, and 7 of 7 with raw commands up to 0.9 s after).
> 
> pwm1 writes keep selecting source 1. The cooler reports the pump duty of
> the last write, whichever source it selected, and 40% after power-on.
> Byte 9 of the status report follows the duty the pump runs at. Measured
> from power-on (PSU switched off) once per driver, with the header at
> 100%:
> 
>                                   before this patch   with this patch
>                                   source duty  rpm    source duty  rpm
>   no write yet                       0    100  3570      0    100  3570
>   pwm2 = 40%                         1    100  3570      0    100  3570
>   pwm1 = 40%, the reported duty      1    100  3570      1     40  1710
>   pwm1 = 60%                         1     60  2430
>   pwm1 = 40%                         1     40  1725
> 
> So a pwm1 write of the reported duty did not reach the pump, while
> other duties applied in one write, also when taking the pump from its
> internal controller (60%: 2460 rpm). When a pwm1 write requests the
> reported duty, write a duty 1% away first (below at 100%), then the
> requested one. Sent back to back, the two writes left the pump at the
> requested duty in all 19 trials, 9 with raw commands and 10 through
> this driver.
> 
> Tested on the RYUJIN III 360 only. The EXTREME, EVA and WHITE EDITION
> use the same rog_ryujin_iii_info and send the same command, and Edward
> Blair's analysis of the WHITE EDITION firmware shows the same pump
> control source. The RYUJIN II, whose duty_channel is 0, is unchanged.
> 
> Fixes: cd258aca0dc4 ("hwmon: (asus_rog_ryujin) Add ROG Ryujin III support")
> Closes: https://github.com/aleksamagicka/asus_rog_ryujin-hwmon/issues/12
> Suggested-by: Edward Blair <edward.blair@gmail.com>
> Cc: stable@vger.kernel.org
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Zac Lanzon <lanzonza@gmail.com>

Applied.

Thanks,
Guenter
