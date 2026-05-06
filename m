Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46C5B481AA7
	for <linux-doc@vger.kernel.org>; Wed,  6 May 2026 14:51:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778079116; cv=none; b=iCX24rfpRlcNzeEOsUTIqNZesmAANO41DvnP4GCyV4McOPykJeSQNLTeFB60Oc20XQt8YzyyLxiG2xm2W+Ht9wa9e7gctmKp10yejztcOiQto1bRv5VlbFV06+H4qgwhceu1SJ06owdjh6Twsu4Aek1uCa3wZ32wIheZ9WyB/tg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778079116; c=relaxed/simple;
	bh=2TB7Jypyp5licsObZy5PK8j7KJDLPRWEgm50vcjLiwQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YKoLkXVXCLS2FbbZC0ownH4zwfX5zEQJYPGcK+sNd0wjCUfE6L3n7JQd+ibw37nrzk3QA1eso3KGAcg+qtuxiGHFzVA/164me2inbMilK2o5SGpVYVveML0RUuwlD8g/DkiAPTVw6mj2L+W34/IuV7Ga+B9GI6AdIbh4VSgYbM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LQalFFwU; arc=none smtp.client-ip=74.125.82.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LQalFFwU"
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-12c19d23b19so9731108c88.0
        for <linux-doc@vger.kernel.org>; Wed, 06 May 2026 07:51:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778079110; x=1778683910; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=dZrJsMWkV7MFT1waoAtWnsYSX2SEoFvqCgpIXtIXV+M=;
        b=LQalFFwUtyI02pUvuej0jE5o6sSdVM325b7JqP089SevDC1v5L+36nmOYIvMia+sxx
         z37xmd2srsikhCrTcqtydYsepofIxgBNwCkPzeVGh//kzHzFRhVcMOOeR+rPI5TZWs7G
         omj94DNDxLd3JfDt9cY3/2vG5DrN0pqH53GoVwpDfGYfDbvVJvQiIYV56yXbPG366knh
         neJNTInIiTIFjILdGyZnnpXw83iyUxmZq/03nHHaDj3XfHe6YS0oGZU2vN/FDXyvnCvI
         EjeEULS9SztEkIos2OF3MbnXCB2X4Ve3BGif3SXrgUAn14vEchiPtPF8zjF7yUCT7ynw
         FROw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778079110; x=1778683910;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dZrJsMWkV7MFT1waoAtWnsYSX2SEoFvqCgpIXtIXV+M=;
        b=X/XRrZtbg0UwfnOrdLJYLYbKpZ6/FBf4lUDXhbD1GD27NMZCKOLRzWb2rYAhsPmvqK
         GnkiwtDjQRJvYN81QB9Kf+ILy2rDlWuaiWK5SBX5HxkpJ2JiQte6rgo9qwuCUQ4FYHcz
         hkJ7wkeDXfYcv6OBefFBOz0Nr4mJocmmTjWfygIhDB6QfmY+aNVSd+YboEGJpprcrp/K
         1k0M5T1pTZb6hAoAT7x1w1xyrh9rZMByTqtX5+sWC43e7XL3A/kcTJCMo5aSi9oFTyc5
         cx4L9h+9ErVMxWlBZqITvdAzGsvq8L49y0fLl6b3Kwokmv8rj/iBJpcPXkEZkbwYrR92
         D3Iw==
X-Forwarded-Encrypted: i=1; AFNElJ9Y832uKpHxnudRKVuqIXy0mN3bKeEWv/WstcsT/UN1KsOiuWpfU39UU1ePJv5k1ZNPptAb9HKdnj4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzO28z1ETCNXPk4ZINliZI39zPn7l4MSmqQOODWeZX4QwBc9eqN
	DfIW04vYIZS4p/8/cspMB9siNYdWh0K81Gv6Y/tfoxXQL6UPIGKHJhFO
X-Gm-Gg: AeBDiessLAfT+wU2gYXHQVb+yFRYI3gbNiD/HNQkliOECN58Raz6n9fWqYZg+Hbdmt3
	SgC45ZLDLIbGOCbdpiCBvCi+vAcPIlx3Va3+Um1nh2R04lGf9Q+eV3Go+ocZm3jlRmfWbAxhbBZ
	vmy+aYZJdg7zOujuv9wNuT/zp0XFIfWbElmn988j+a+rI3686SOVY4grmXZetgVaKCtPXPO+Oqc
	y13mxHB0jlyCT63AuKWX3x3USMPDksaHDx5zPna/DJm8GfAxGee24AjNorbSqmFdEpRojiMvGRY
	XFguaKF6b/Qi0pAn7RhwfUNFp0f/VKL9EnLru7k6h0vM9y6Z66i6PWIgARlVpm708xpbKiDUVTf
	dKEoV4rrd+/bXblvrlrzWKczMCJyNfzJ1+Kbahu5TK8+7wPAxxTD/WX4Ep8mRGjPaCcwJtT7vu/
	aOVs7EM9JAZKd/DS8HoNp/b++apFFmWlw5p1rK3EFK/sNo5gl5a3Vm/6wXg6bzzZIxS6r/lyt6V
	2utFqL1bJeFE0KTvtUG/g==
X-Received: by 2002:a05:7022:2511:b0:130:6904:8c17 with SMTP id a92af1059eb24-1319cc2a479mr2020510c88.18.1778079108812;
        Wed, 06 May 2026 07:51:48 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13202db1914sm4022451c88.11.2026.05.06.07.51.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 May 2026 07:51:48 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <0c1edaa7-ad96-438a-9a0a-00c922069d83@roeck-us.net>
Date: Wed, 6 May 2026 07:51:47 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/8] watchdog: sc520: Drop AMD Elan SC520 support
To: Sean Young <sean@mess.org>, linux-kernel@vger.kernel.org,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-watchdog@vger.kernel.org, linux-doc@vger.kernel.org
References: <cover.1778071745.git.sean@mess.org>
 <59c97749c14a4ad1039bb9cc920cf32babb9d6f7.1778071745.git.sean@mess.org>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <59c97749c14a4ad1039bb9cc920cf32babb9d6f7.1778071745.git.sean@mess.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/6/26 07:42, Sean Young wrote:
> Since commit 8b793a92d862 ("x86/cpu: Remove M486/M486SX/ELAN support"),
> this board is no longer supported. Remove the watchdog too.
> 
> Signed-off-by: Sean Young <sean@mess.org>

I already submitted the same patch yesterday and applied it to my
watchdog-next branch.

Guenter

