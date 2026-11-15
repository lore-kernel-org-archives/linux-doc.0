Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.180
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794711057;
	b=KTK0nvZWWovcIlaxszU/aeR+EZZngfvtO0uylX4vbJ+WHcTwl07Q4IxeRtT1IDg6Hzqx
	 JoZw8tpuYYEUV87tM7osJyplSkHxphAholhQ00u6bAHWUunEHVs/mdxgSsGutgUp7rMq7
	 oPt783tZ1tx3IX/ZEL36ALeNjWYgUsSx7Tq01pyLqF6X31wTRK6JuiYScC85uorMv30e/
	 6z40oKRAd/INNAChSmFSSETv6lYUAWtmVIhzJVAS5JRN5d/roDxH+3MOmCnBUbT6eHtjj
	 pOQia8fewiFpc8vqeUgvCcSfVTqsSzvE4kykep6XEL6Tx9F31cWVzSCJ2Xgv/g1uVdg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794711057;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=b8DaGQKhtDEoI1MBNX5hHcCd5cxhj/+80fP7TfFs+sc=;
	b=ZB0CpDQlz+6IU5BljlC/yGmVNVxpWaLMdUUB0nOYNMKkSB6rLoMWIRkmSg2rfaoknPlc
	 q2+Oj/YFkGT6Xvj98TU9aG3KRbIEtGR+XLDXDd/0iYxD92gVTJPJtZv0NYKph8iSV/69L
	 U7CcBcj/PtbVmM5T4JzCnvah5cAYJsfduTDBDNVH36Zc+tzjjyeCyv4N/O4VMgl6QjFyX
	 z3ar0tYUeWFGKMZOkzE+NeO3jC1KC6LsyNFR3z+PIjS4vjPgfKLxQQOHOIoGH10rHQwiC
	 Vc4PPmCAcW3UwrG7MsMT1ySez63vq8QlvG0zgUfnTV5/DTqCMM8g+kahmgbdNIB0VEA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=C3YL84B5;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.180
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75192606A327
	for <linux-doc@vger.kernel.org>; Sun, 15 Nov 2026 02:50:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 75192606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=C3YL84B5
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-3adf9b1f5aeso35204781fa.0
        for <linux-doc@vger.kernel.org>; Sat, 14 Nov 2026 18:50:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794711056; cv=none;
        d=google.com; s=arc-20260327;
        b=LyUIcb0ny+6XwSEanKjUTlfaZWs8i90JLOPs9OkG1dFxAPfhcj6lw8BpkpooK59hVA
         yonPH9ByKLumvDqUdeZ+86/OmFm/rgw3qrI+Fg+PI/fIlHf7BibHVtGyW/2Xsh2BnSSC
         cQgHWmFTQ8B7m86Dae620EoBTM1s/dWBVXB6pk9YawPQK6NAkS+g0QLKOJo7wou/wFd0
         G2+nj4LcdCzU/Sy0TUzE4540OHQdeTnr3LH37QpQ5dePVXP+/g93xssEi0wfJEbhYpbi
         oP+0iAt7fBD59KTTPgHCgrnArvIesZMbu4fA3ZViaTHoI0cO/HMhRVIQP2YaEKD7/PW1
         YQIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=b8DaGQKhtDEoI1MBNX5hHcCd5cxhj/+80fP7TfFs+sc=;
        fh=ozJ9gCjlh+wYKUXpoOXl5CPJ2OukV/G8EokQoKlB3Gg=;
        b=ogV+MybXZT85em9ppBMXt8jsAk5jGiEkEeCuv25jG/nAoxU3mBPYAZUHGr8HiA9p03
         idKpgQjl9qOQKbeGoxmgKs2t5abGZI+zzibZ7peAw4WSoy8kp9/f4dkyU9plfRSb4uLE
         aPFu4hCEBCs21TEpsWGAcWePhQLFEV0MfBFPMxmLniqht525DIJHMOwikcTwwPsm+1Os
         lUwMd4mRPRL+6RTZF8ZrdxK2/hlRMDbuW0jR5lvbz2CyQK35ran4+UHfvNHVdSHsmcpq
         Q9pjxRktDxTf5g0qcUKl2jQ5sNDgmiBQDgx8D/PWbq6JE/wxXkSvkfu3C2wUwkQM6daj
         o7Qw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794711056; x=1795315856; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=b8DaGQKhtDEoI1MBNX5hHcCd5cxhj/+80fP7TfFs+sc=;
        b=C3YL84B5AdvG1vULn8iIHu0VOFFhm8wHMS7GIQReErW5xay/xayGeFR2v08rTSLBHg
         s0D5TfL77gY8I94LYeTsFZ992NL+FrL0HWYEWfoEgohVgSQWYiMOJI1Q0gXgjnELGusG
         yxGe1vxxfx5tEGjZ42nNjhQFu17xAWNFif3Zt759/IlE1SQWPCM5e2ohCHekYZ4bsB1V
         n3pG0iYYk3h1AJhj2x4Ieuyy4fcS5ftmtqComvfDS76iK4MnePo4uty6tbbuhU6daKVT
         rxRNMxf1URagtGlMtyv0/DBqu6w02chfXl3qI1cxbSPefPUuGOIIT8LkwnouANQ+pQk6
         B1LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794711056; x=1795315856;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=b8DaGQKhtDEoI1MBNX5hHcCd5cxhj/+80fP7TfFs+sc=;
        b=Ojj65NW8x8FiOqUn9A6z5TxOEVnAEcDi2De/k3k2YbMwPbxHiibYKSO/oEUb4vR+kx
         Uuh28rnnmY/S6PsFX1xgsRyAAw9YdGwMfeWqWbLWAGIKX2nDQgDvWSXkSgkd7qyYnDzt
         BwvdSMcux0/5B/0dOv5Fx83g3sepLkFIcAs5xxaGl+YRST7gK6Ek8UXl1mCMNbPgCdwp
         XZ6t6iD5esLZvnYj/msBzZzoWgu3F1CV3XlRdSPrSpJ8knWdyiuQkEqycn2XOPGAoYFg
         wPs9kx1WHxeZVLJ23lFOEbAX3sO7pPlyuq7tYZ63LhtSVtcXiIDdgq+DL0VH3VuQ5pQT
         nvQQ==
X-Forwarded-Encrypted: i=1; AL+hErEUpoD0kNT9hQLBq9TLLf5eNUbyfpFp2X24kOjRjaWfpV0GdvfLbjes0OoWlso4oF34CpkrK62rAts=@vger.kernel.org
X-Gm-Message-State: APuU4Z+sLaEYbL5pYWylKliBd2IVSzivsWtYMpiHi6xOUG+X3h28BibM
	wh9ymRiWVYfWDxvtwpbNbabtDMDkKe27qDw//j9YMBVSKPJLijeiMsxirI9lPQyJzp6JDrZmr2q
	GJHYQsd7obeC7XYQGkGlw9uD6zS7q++g=
X-Gm-Gg: AYBFou2DWcnQcvBOlk9pXEh4fn9ksHxLF5VYlIuuLkJVQmgSb4x/G8KHh6tedtIx7o1
	jQG2wo9N2B/PXqZpRfNGoDv5kgFQjYOg1R6nH8W4L6Wf87M8llMGasfJe57Dap8lH5MdgJs2gya
	mmPML7IwKnDrcEiAMZY+Sr5Nm988JSzJ47vesoYGlUJrhbsbdQUDdAIoFhEev3vxfqRx/MlxTtg
	8zwLori7dxCNxNUIPwtjGIoXs4SOcS8lS4uH/EF8wsH+gOB5SGSsSHvbXlhfFwO8L9tlagosChL
	h0/IncjLpGT3HLvF+LgY+re/g3YOET/BsAoqaGXtLjTAcX8y0Q7fN0cn7tNgjHzkiHQAYheIHBv
	3EKHpbS8Ex9C6P3UFYwzVLkTlm5iCM42iHCtXUdVV+UaYhXfiGtAs+XG0Fm2wLt3JpVVQbAkNVo
	axlbJiTp8qbYvwke2XjICT6k9l0Q677xwjcR02BHn46A==
X-Received: by 2002:a2e:9a14:0:b0:3aa:f4c5:8920 with SMTP id
 38308e7fff4ca-3ae2b5244eemr16617881fa.12.1794711055318; Sat, 14 Nov 2026
 18:50:55 -0800 (PST)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261114-marvel-env-v1-0-890328e4b7e5@gmail.com>
 <20261114-marvel-env-v1-5-890328e4b7e5@gmail.com> <e8ffe364-5c98-4987-b6bd-c263122aeae8@roeck-us.net>
In-Reply-To: <e8ffe364-5c98-4987-b6bd-c263122aeae8@roeck-us.net>
From: Matt Turner <mattst88@gmail.com>
Date: Sat, 14 Nov 2026 21:50:43 -0500
X-Gm-Features: AclHuK-sqqPXlIQFX4lO3FN1NrvQTjfvTZhocvr9YoyjI16C5qy2nZEmwXZkKgs
Message-ID: <CAEdQ38GEckm8oU9pmg_t-_EC85brP4ghWAE4tYBNEvF+gcqMKA@mail.gmail.com>
Subject: Re: [PATCH 5/7] hwmon: Add driver for Marvel AlphaServer
 environmental sensors
To: Guenter Roeck <linux@roeck-us.net>
Cc: Richard Henderson <richard.henderson@linaro.org>, Magnus Lindholm <linmag7@gmail.com>, 
	linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 14, 2026 at 6:00=E2=80=AFPM Guenter Roeck <linux@roeck-us.net> =
wrote:
>> +``temp[1-*]_max_alarm``     Sensor is in the warning or fault state
>
> "fault": Sensor is broken.
> "max_alarm": Temperature is too high.
>
> That is distincly different. A faulty sensor should not be reported
> as "temperature too high".

My wording was the problem here, sorry. "Fault" was my name for what
the firmware calls the Failure state, and it does not mean the sensor is
broken. The AlphaServer Management Utility user guide [1] (section 3.16)
says the firmware keeps a warning limit and a failure limit for each
fan, voltage and temperature sensor, and puts the sensor in the Warning
or Failure state when a reading meets or exceeds the matching limit.
The status byte in the console's packet only says OK, Warning, Failure,
Unknown or Not present (Table B-1 of the same guide), so a broken
sensor cannot be told apart from a bad reading at all.

For temperatures, v2 reports Warning as temp_max_alarm and Failure as
temp_max_alarm plus temp_crit_alarm, with temp_max and temp_crit being
the warning and failure limits. Nothing is reported as a fault.

>> +``fan[1-*]_min_alarm``      Fan is in the warning or fault state
>
> This is wrong since there is also a separate fault attribute,
> and "fault" means defective, not "speed too low".

A fan in the Failure state has slowed to its failure limit, and the
firmware treats it as a failed fan (a drawer is powered off for having
too few running fans). v2 reports Warning as fan_min_alarm and Failure
as fan_min_alarm plus fan_fault. If you would rather keep fan_fault for
something else, I can report Failure as fan_min_alarm only, but then
nothing in sysfs separates a slow fan from a stopped one.

>> +``in[0-*]_alarm``           Sensor is in the warning or fault state
>
> Which one is it ? Is it distinct ? A "fault" means
> that the hardware is broken/defective. An alarm means that
> the voltage is too high or too low. A faulty channel
> should not be reported as alarm but as fault.

It is always the voltage being out of range: Warning is the reading
outside the warning limits (5% from nominal), Failure outside the
failure limits (10%). Both are reported as in_alarm in v2. The limits
are not in the console's packet, so they are not exported.

>> +``power[1-*]_alarm``        Power supply is in the warning or fault sta=
te
>
> "power" is supposed to report the system power, not
> a "power supply warning or fault state". If there is
> nothing else, this should be identical to the matching
> inX_alarm and/or inX_fault attribute.

There is nothing else: the firmware reports a supply only as OK or
Failure, with no reading. Failure means the supply itself has failed
(lost AC, power not OK, supply fail, over temperature or fan), so v2
reports each supply as an in channel with only in_fault and in_label.

I'll send v2 tomorrow.

Thanks a bunch for the review!
Matt

[1] https://ftp.zx.net.nz/pub/archive/ftp.digital.com/pub/DEC/Alpha/firmwar=
e/interim/ams/releases/Version_5_2_0/ams-user-guide.pdf
