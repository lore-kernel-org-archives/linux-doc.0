Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9B902DFA54
	for <linux-doc@vger.kernel.org>; Sat, 17 Jan 2026 22:53:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768690400; cv=none; b=bBnYDog3fmTgO/b8ixKDOJ8N1JglmsN5xBA3oJ4u5aWoQzrh2GT8DzYpgFGP8TIu6G2Gl8d1mFm0n7B3u92i50ePgUleDqhycsyOezpUFZ4bcNe9bt5WySQVcIcmCAbteJRELSqsrH5siKXSdIqgyNRGmPj4RPKaCfbj4qQIZxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768690400; c=relaxed/simple;
	bh=CJSgdG/D6nYPHFgmcOAogDm6KbFG0BweiflZ/4k9hh8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=a04KrPBEzNc16/oobk955ZyK2xB+Bj1zCHlbjjQfH/Q8BNObpkIj7x9H6auJ4Imi1tWIQfLkYyVW2a4OdTjuok9zEjT7PCNwQtBttd0leWquObqMBlM3egy8Jf0wquhjfW3aQtPClABLtT4SKoLFw3OWoQE0wWM+h6kBGHC8WqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mVIaKul0; arc=none smtp.client-ip=74.125.82.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mVIaKul0"
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-1233c155a42so4122637c88.1
        for <linux-doc@vger.kernel.org>; Sat, 17 Jan 2026 14:53:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768690398; x=1769295198; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=xeNKKteLIvdw015Fg27kqE5Sg8gePF55IDKi4RbdlDc=;
        b=mVIaKul0dll4laXLNlZ+QUAx03NzOkU02pO80fd2rn73MrAO3mKuPVd05uDn2TTRfd
         TdxUFNch0TDQaMOFC3y/inGTUD1qCd6o60J3iq8LHEl8UgYh3T6rDK0yM0w8BeO36qNC
         9/q7wj9KfAoVlRdMPauKVOqjalswqN5l21h71t2AxKFAH55jia6zhduuiRlsSdijOrl6
         hRNS5fgbr/QDnsKk2w2epCJApZU84xPqE6RQTVJLpDS8AQEoyd9MqgENvtpa99K/tp7W
         +zTqqPpOAGOkrCM+laofJWuFiP/ebRdekygPBKTnuor/tt7meLa+VjxCcKSRIklejrHu
         09Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768690398; x=1769295198;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xeNKKteLIvdw015Fg27kqE5Sg8gePF55IDKi4RbdlDc=;
        b=dOKHEqyog48MM0/2xDpa2hI8rMS74n6p6oWy+KuIulN+PROdSPM3IRxwiuhEiZgB2F
         K0I2hdPA7GB8mpbacAuQ5eTnrLzsWzCquM1ltO6j5Jnpu7glQ9aNQk208AuP/G/VIIDD
         GXjY4zHYO9sZc5VDt8wAP6hGkxw50NG8H8UnCSmztePhznWGhJJsTzFbzeGHchKKPqzd
         4vYSsBLim19bnnlM4taLLx+P3iglSTuWsoQFDIhZWJQcEnW3ExiCBL7OKtIv1yOg/4rU
         84K0A12o6FnIG9wesDnt5kq5p9IGCftVjhj+Wf/HurWxPljd5SJE181B/rGyQYuiVjiN
         FX5Q==
X-Forwarded-Encrypted: i=1; AJvYcCWNy2xaNFkLocKwx8/OU7NKPTLxbkdpq/pOTZGZoUSkYa17N1LXFGW9tF/ltHlAG/1DTk851NqBR9w=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzd3FA2nlzbXeSGbbxMR+ADuZPori5bw2frOJnYJ4/Iikk+Hfzq
	Grhdytfqa97a1vkry8MMOwbFvmmUBHfS764He9NLCpGW3qqkpdvcKzke
X-Gm-Gg: AY/fxX7EBoT7wPKFhWOxhNeLurFfOMcja5qmNihh+dC71AevdMgppYrtNV/irZHuLUl
	etGF9Zxulj2k2CgHXIxi5ck6UnqYC+ub7Q+2qcDimuBWcKhGoEOIYMIV0OOmwkCNCGKeVsmRkAd
	SiSVRtbJKe4H5abNFGqihwqwPv4XnXBPlYP0AqJuOKqgYbDV2g7iTeXj5SwVRnsJJp4NEls+R4S
	SVId4oAGJBjmwLd14wi5doJ1AKOxY0d7SPFooRxJelUxuo147+2EWQAdNMpEzOlxRW/7EyMCPYG
	h3PEYou+BmnByDPPIjpyy19fJdzNBEL3D+asJZbVgPEHbf4BXnTHTzAtRlnPLGC6fpjqq1TA4qA
	NLzenYnQlhZnfb99ZVv0rVC3jck91tkVjoqtyxIlFL5Wr2Kf4ib/HvPTEoUn3V1mpEJ7xso5LTp
	qJ33uconYuvf/2d8p5CucgFI04HhUiQ7s8ZbJR0/kB2cLeV89cnrYSVDCcHupU
X-Received: by 2002:a05:7022:2387:b0:119:e56b:989b with SMTP id a92af1059eb24-1244a6d0467mr5290584c88.2.1768690397680;
        Sat, 17 Jan 2026 14:53:17 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1244ac57fd0sm8481741c88.3.2026.01.17.14.53.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 17 Jan 2026 14:53:17 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <672fe8bb-79f9-4366-a661-c957d3b79f37@roeck-us.net>
Date: Sat, 17 Jan 2026 14:53:15 -0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/5] hwmon: it87: describe per-chip temperature
 resources
To: Benoit Masson <yahoo@perenite.com>
Cc: Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
 linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 linux-doc@vger.kernel.org
References: <20260114221210.98071-1-yahoo@perenite.com>
 <20260114221210.98071-2-yahoo@perenite.com>
 <0a4bfdac-3f3f-4dd7-87ca-a4edb58d2bdb@roeck-us.net>
 <CAGHj7OJ75Sxn9AVguC8uFJwd8rdAvSREKFreWW3_-E+4MaHycQ@mail.gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <CAGHj7OJ75Sxn9AVguC8uFJwd8rdAvSREKFreWW3_-E+4MaHycQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 1/17/26 14:11, Benoit Masson wrote:
> On Sat, Jan 17, 2026 at 3:39 PM Guenter Roeck <linux@roeck-us.net> wrote:
>> Series applied.
> Guenter, my appologies but after changing some BIOS parameters of the
> IT8613E it seems the patch has something wrong and creates a null
> pointer exception. Can you please remove patch for now until I test
> all BIOS/changes before re-submiting. I'm sorry for the miss here and
> your work pushing for this but prefer to prevent the patch for getting
> deeping in the submission chain.
> 
>> Thanks,
>> Guenter
> Tahnks and sorry again for missing this.
> 
NP, thanks for letting me know. I'll drop the series.

Guenter

