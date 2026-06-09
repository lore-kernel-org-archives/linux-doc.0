Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0A453876B8
	for <linux-doc@vger.kernel.org>; Tue,  9 Jun 2026 10:19:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781000345; cv=none; b=XHIKrDbGm0GLCFxeZaxvmbLBsIYZObeWxSkAJ7dMVRVbJEqu5NPMxO4alhWGTC451dV01LmYk6TImpuHZieYJ4bkYNtx9XfWLztE1UIPkMWcm4EoulN5Y68KjLyc7F8v94mP/3y40jiHd78sgyVj82z0UeadVbcMnvBuCi3G8BE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781000345; c=relaxed/simple;
	bh=aTgcaHq96O96cNqr2TemkSTEHHUjgU/vx5s9EOQWy+A=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=YPHvXDwYmqTvLI2HfBmkE+BVeOAoQjPrN/3rdskeb9p0yzbjjaEzzjj+WTlBrSoQMRZ8sZolm9xQEYpKCrqR4znaVeuyHTcn8fmc1dNLRzevVptdqa8H+7WcdlmsPkbjJ9xg2Qog2GzNwEfIUu+Yt612DHxUEzV04yngCvLDX1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com; spf=pass smtp.mailfrom=9elements.com; dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b=JlveCJyQ; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=9elements.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b="JlveCJyQ"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-490c0c92cffso37521215e9.2
        for <linux-doc@vger.kernel.org>; Tue, 09 Jun 2026 03:19:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1781000342; x=1781605142; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kg//50A/gpUcIHuzGOz/tzazOMCNZ+P/7s0h3ZDZtUE=;
        b=JlveCJyQeT2XOP9y7mHyTVbTPrIosUmr0biBLrtHM7/HsELMMHXZw7tyuGTDjQqY+q
         A3RqtGgpYpGu/6wBqL+1D9nIgmzyY75IP2M5xLzXBHuO5ZZ8Bhppp0PIvIpQcJARGXUE
         MaOAUW7ediHD+xSPgk9r5Kd5IjD8kW/Fp21aKrItyrwlYkN40rHxq/odXAl+z+RMTgnw
         Jw3xlJIgnQC0m94bfWkzKUlBOY2fmtKyZvQRVkWakAsz7K2g1/99rrf4+FZtUJjaEHXr
         RrLgLfDytBaE2IrTzhumt5SIdDKsG3XcsaJKGLYC11tRQHoPT/w2kiRy/ifs9F6trqt3
         LVTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781000342; x=1781605142;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kg//50A/gpUcIHuzGOz/tzazOMCNZ+P/7s0h3ZDZtUE=;
        b=ZmictGSclKty9aTmi2IH+7fY3nGWTXvXQ9gcZ46lYGfjWAoHSlo7P+L8sRIV1frqTO
         ekQ1hQx3wczOS/Ya2ZYilikXsPkVTwCPJRDVLagS3F+ubSymVneat299sQg3YBbcAkSL
         6KV5d3/NQzpBNqG22LnYrVKlAETvr0WLhtqdtXba7Hk+L/YhE29lBwbuKDXzLqTT82IY
         70/LurzTMINHV41Lr6R7LPp7sTaPUAeL8dpqpPiFmkhh+qFSItBguWP/bglvt7x9p0O4
         6po91nto/30N19FIPL6nnAIybjGSrab9KJbhLaYccrV129Ia0ZlAnwfsjZpxOwN4c/uY
         VN0w==
X-Forwarded-Encrypted: i=1; AFNElJ8lWjUMd55D7amp7e5gBqtJWcfRhwHS+eL7RtxWXtI6QisoPyHmFmeA1z3csFq2c2KRNBGsxr9Ovv0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzwINmsSfRJ0XbnzWfBAClLPCDHFUUdrK/quD4x13VEUwXCJv8l
	0gDrzTRFB0SG60E40x+kpc7I1++G/rxin3qowUktQrkszYsHltohUPT99IJadkU/ag==
X-Gm-Gg: Acq92OHjU1hkd+0OsJMWTPSDq7PyAqohYkin3ffk+n/YT9WXY3Jlj/UgeCoudmXJ9Mg
	QzfN1vqYNmTx5ErAN3zt6iuTz/YxDG9CHOblbeZ55vPeFkhCLeawH1DJ8MFf86f7tLDLPZKiqqo
	Cifn9J2p/j/J4Xi4+o33CIjumf9U605yeQIs1fP+GfHpT7SUUrg/aJEHsjq9VBAxgq6iRlOOEfI
	klO/f5zdEktYQHwCnLCiOHrtW1xHyWAGbx3g3i3j9BSS6beqSrD3YN9x3GsQuFcew7QmJbC+6R8
	udGl+d2Hmn2AWKB0QV20Gyz8+XSlQGyktdg2ZbdW7XFigR1CNsCN4Ij7jnP7gJJmENy6HUx2zAc
	K+EehwuJlNZDQsV3Sx0Vf5leiJmicHRr/GFKvd/DkD2ZLkWDcgHz0e6dvmMPM1eeLROjbf9RTKm
	802KsBwQvXqsPkz7EncIvUAF+JJF+EjVB4SS6x7JU=
X-Received: by 2002:a05:600c:8b68:b0:490:bad7:3634 with SMTP id 5b1f17b1804b1-490c25e1104mr335337855e9.19.1781000342117;
        Tue, 09 Jun 2026 03:19:02 -0700 (PDT)
Received: from localhost ([188.111.3.154])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc3a87dasm455345945e9.7.2026.06.09.03.19.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jun 2026 03:19:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 09 Jun 2026 12:19:00 +0200
Message-Id: <DJ4FXHE7ZXQ8.1SGVBE57KSLDI@9elements.com>
Cc: "Jonathan Corbet" <corbet@lwn.net>, "Shuah Khan"
 <skhan@linuxfoundation.org>, "Luis Chamberlain" <mcgrof@kernel.org>, "Petr
 Pavlu" <petr.pavlu@suse.com>, "Daniel Gomez" <da.gomez@kernel.org>, "Aaron
 Tomlin" <atomlin@atomlin.com>, <linux-doc@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-modules@vger.kernel.org>
Subject: Re: [PATCH 2/2] module: restrict autoload to CAP_SYS_ADMIN if
 CONFIG_MODULE_RESTRICT_AUTOLOAD
From: "Michal Gorlas" <michal.gorlas@9elements.com>
To: "Sami Tolvanen" <samitolvanen@google.com>
X-Mailer: aerc 0.21.0
References: <20260515-autoload_restrict-v1-0-40b7c03ddd04@9elements.com>
 <20260515-autoload_restrict-v1-2-40b7c03ddd04@9elements.com>
 <20260605183002.GB2939956@google.com>
In-Reply-To: <20260605183002.GB2939956@google.com>

On Fri Jun 5, 2026 at 8:30 PM CEST, Sami Tolvanen wrote:
> On Fri, May 15, 2026 at 07:20:20PM +0200, Michal Gorlas wrote:
>> Restrict module auto-loading to CAP_SYS_ADMIN if
>> CONFIG_MODULE_RESTRICT_AUTOLOAD is enabled, cmdline parameter
>> modrestrict=3Dtrue, or kernel.modrestrict=3D1 is set with sysctl.
>>=20
>> Signed-off-by: Michal Gorlas <michal.gorlas@9elements.com>
>> ---
>>  kernel/module/internal.h |  1 +
>>  kernel/module/kmod.c     |  5 +++++
>>  kernel/module/main.c     | 11 +++++++++++
>>  3 files changed, 17 insertions(+)
>>=20
>> diff --git a/kernel/module/internal.h b/kernel/module/internal.h
>> index 061161cc79d9..496d8703f0c6 100644
>> --- a/kernel/module/internal.h
>> +++ b/kernel/module/internal.h
>> @@ -46,6 +46,7 @@ struct kernel_symbol {
>> =20
>>  extern struct mutex module_mutex;
>>  extern struct list_head modules;
>> +extern bool module_autoload_restrict;
>> =20
>>  extern const struct module_attribute *const modinfo_attrs[];
>>  extern const size_t modinfo_attrs_count;
>> diff --git a/kernel/module/kmod.c b/kernel/module/kmod.c
>> index a25dccdf7aa7..58b28c23f571 100644
>> --- a/kernel/module/kmod.c
>> +++ b/kernel/module/kmod.c
>> @@ -156,6 +156,11 @@ int __request_module(bool wait, const char *fmt, ..=
.)
>>  	if (ret)
>>  		return ret;
>> =20
>> +	if (module_autoload_restrict && !capable(CAP_SYS_ADMIN)) {
>> +		pr_alert("denied attempt to auto-load module %s\n", module_name);
>
> Is pr_alert appropriate here or can this be a warning? Also, use the _rat=
elimited
> variant like the pre-existing warning in this function.

pr_alert was here in the grsec version (thus I assumed it makes sense
here), but agree, pr_warn_ratelimited makes more sense.=20

Best,
Michal
