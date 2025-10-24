Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8272824BBEC
	for <linux-doc@vger.kernel.org>; Fri, 24 Oct 2025 03:10:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761275458; cv=none; b=V+YjjNq1mXOwT0ecwUVDIHnv60l68eNXY2jtkpVH0cNxR/fKT7Nk+IJa9iLcetInZ11cXDQKK3hs5dPf9/UXBC1TIXycOAuOigdDhZAwJbNvCtW8e1GIqW/PwvoUl2hLSeojEOvyOSdgGE/wJZKmk4N6In3wBwLJNf3gHiM0+SU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761275458; c=relaxed/simple;
	bh=+hpHl9CTaTJrHkGNRc+qFqFnnTcwFNIFfglXCTIQstA=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=GJU84FO3SEwe0ouJHW8f2XDAyw3/ih2khiapzamHunbyppZAwDLuQhkM3mXq3DETPejhofX+A8IaVbyjDn0Gq+g1RbmJ3p8JMexLBMoaollfBH2LJSyuz/JYLa3ypS1obrGSIPBAx5GDTECVW7FfvU1KbD9AhSjKaCq0NR5M/mE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hQ4JDNLa; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hQ4JDNLa"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-b6329b6e3b0so2298859a12.1
        for <linux-doc@vger.kernel.org>; Thu, 23 Oct 2025 20:10:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761275457; x=1761880257; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LfACKoGL5d6f67A57riboWf6T6eBe4z1rHL4CeVYlqs=;
        b=hQ4JDNLam2IypJV84PgmNUk0eEMd9hhnl6XEloY76E6Rf5iH5BEvpN9Gq1ym4SA7NW
         2IzyPl05b0rGjKUiq8X21Ex1zBaQB0dILXMPnLwMb2DaL4vEJkO88MIaFo/exdI3ZnXd
         22lo15upBP/Kf1I54cQvmvKk9zQ3jaPSRMUdgyTxKoCWtQh2ypZ9anktlOfJl9UBUMjo
         yg9daFnTBmUcCN/w8e5mP+3aC6Zhk0gpya1uA3bIgjuMFmq/xOXdUAmFC7FcE5HkqzY9
         9kufl9PqvuCfXHmOK5nDpuj4d/oOLEKVRve66a8WRw0ixNJVFx5Y24ZzvTeNaz/1mpuA
         Pv8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761275457; x=1761880257;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LfACKoGL5d6f67A57riboWf6T6eBe4z1rHL4CeVYlqs=;
        b=H/u35iUUmJvlN0Pn7yRVEGLCLA40hEhmBK1wpPSxaF4fjq57+7FUV3J5PplGKkJ0IV
         7ijXqD9j5dg4xTpA1kkf09ykCl4GiLugveAqKENRTURPJnpXe4joT9D1TtacFF72PcAg
         mx31xSnNJJ2uVacvl1NIzCWV3FXZLU5KuYQcPbaWMfKmLXEom86C+2lwGmB0U805fzqG
         ZNHQ4DoLsIIAtZPHGZTdBSznFdRghZ+ftqFNVkV9wdVMX7bSDr9d5Lt+nNYXvlfugt34
         XqUd5MafCpbApofWkD8CKw3SpivxSZH8t6gRUPPfj+0oQAcGhl/FqY2dm54BJSqdwnbL
         Y5hw==
X-Forwarded-Encrypted: i=1; AJvYcCVUbx40RqM1hOMI160M7bEH59i2x1OSJnwZXQXJUaTSIOOTBlkrhAx1vK9pExoOiifBUqsr3TlFpiY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3vxwAYRYWog8mJmF7JKeWoNpU8cS+6r/RPl+u3yBo1X8Ee6lv
	9A2xuo0ZgU9QTvLd/pNqyrdaFNbD1M/JhcHOMnyzGn58xmZ5O4qwvtvf
X-Gm-Gg: ASbGncsQRz0X/SJJttu2yptbGjP5iWCRtc1penLMv7fvJ17ltIX46dVldFTMIVMv9FL
	BajjUDv1UcZ2psRQxt61RTfztJL5ym5bsWxwUtd4hdgQd7PrE9L/KXMnxIIZpcZogb+AhCYYpPq
	Iaa1Y7v1hV1G/B3P+5jc40mysh7T05dpYboReUv56ccwbaALS3/8SuuR8hmDQ2RV1S9mAXi19/t
	Ri9fXWv7GBr8hj280MtsamSSk9tMsCsQLAJ/C3xB7HiRU8tdZi6Tzj+9R4ni17IuH5lwCg60VTZ
	+kKvBYQLd15ZgExxhVZPp4U5UVLiKuConLXSpLO8vf4ENclDX4HQyaHVGReFtnqownWkaeGbIHJ
	rWjYmpvaI3Fd5j+55T7/xZy2zT0+ho1L9TGK7l2a2ffigcQ5QVCTeCwjKjFizI3+2aZWQlVaXQc
	0Ta3iyMGdYlBRKD/K1Hot/li/o09cyTb6v+UCn0xFgpv/A1w==
X-Google-Smtp-Source: AGHT+IFAFr6BWw+28G+Y/+rpNnKUm3jMh5eyliYqb4zVlqFPYgU/mQrru+nYz5MYTkfiQ8N/Q1uKSA==
X-Received: by 2002:a17:902:ea04:b0:27e:d66e:8729 with SMTP id d9443c01a7336-29489ce21f0mr17665165ad.0.1761275456687;
        Thu, 23 Oct 2025 20:10:56 -0700 (PDT)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2946e0f419csm39405915ad.89.2025.10.23.20.10.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Oct 2025 20:10:56 -0700 (PDT)
Message-ID: <532dcafa-08a8-4e18-b904-53e061734b69@gmail.com>
Date: Fri, 24 Oct 2025 12:10:54 +0900
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Akira Yokosawa <akiyks@gmail.com>
Subject: Re: [PATCH v2 00/10] Collect documentation-related tools under
 /tools/docs
To: Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Randy Dunlap <rdunlap@infradead.org>,
 Jani Nikula <jani.nikula@linux.intel.com>
References: <20251023161027.697135-1-corbet@lwn.net>
Content-Language: en-US
In-Reply-To: <20251023161027.697135-1-corbet@lwn.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Jon,

On Thu, 23 Oct 2025 10:10:08 -0600, Jonathan Corbet wrote:
> Our documentation-related tools are spread out over various directories;
> several are buried in the scripts/ dumping ground.  That makes them harder
> to discover and harder to maintain.
> 
> Recently, the idea of creating a dedicated directory for documentation tools
> came up; I decided to see what it would look like.  This series creates a
> new directory, tools/docs, and moves various utilities there, hopefully
> fixing up all of the relevant references in the process.
> 
> At the end, rather than move the old, Perl kernel-doc, I simply removed it.
> 
> The big elephant lurking in this small room is the home for Python modules;
> I left them under scripts/lib, but that is an even less appropriate place
> than it was before.  I would propose either tools/python or lib/python;
> thoughts on that matter welcome.
> 
> Changes in v2:
>   - Rebase on top of all of Mauro's changes (the most painful rebase I've
>     ever done, I think).

I tried to apply this series on top of current docs-next, and several earlier
merge points, but haven't succeeded so far, even with "git am -3" ...

Where am I supposed to apply this?

        Thanks, Akira

>   - Land everything in /tools/docs/ rather than /tools/doc/
> 
> v1: https://lore.kernel.org/lkml/20250813213218.198582-1-corbet@lwn.net/
[...]
