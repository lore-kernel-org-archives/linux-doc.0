Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48A0F37BE8B
	for <linux-doc@vger.kernel.org>; Thu, 22 Jan 2026 18:30:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769106623; cv=pass; b=p3LohKAiAUf/vImFja5O/nQBdS6S4RkgwcmhFnEkPyGM0FTDFwj/tjBTd+m2GjuZZSJfPUpcTJ6/gaFi7hnwO6WHC954PxIncgsEb6D7clc8k1x96b+sMoW8Wyu/ZKLHSkD5NNbs8qdjw1n6h/JnygYe1p7Z1xvIkXOD366RS+Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769106623; c=relaxed/simple;
	bh=XqfjFZjqZ+qKfuAcLr5Lq6LxiUZh0aC9ms0gfa0kYpM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oP8S6ffATryEGPa7mMez4MH28YvTAhVpVlVp7tfmB5OvhuUzl/kcA2pHkIF9MZB398uqvn+eEQh71/2HWj9NiJmrr1DihkFWfWeFx1l1k5+NhJWmUspUjsGwvxCePrEadCd8sEYzP/C5Ne92mJsT+wlprxPIyqxR9kHtIb3Ukkg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=ZfKnMPOW; arc=pass smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="ZfKnMPOW"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-64b9dfc146fso2222326a12.0
        for <linux-doc@vger.kernel.org>; Thu, 22 Jan 2026 10:30:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769106605; cv=none;
        d=google.com; s=arc-20240605;
        b=WZgcmUQX90ZEuisoVN3pv86yK6bX9PK+U2VF+jnvtxsJ2WV0PqLn5KyfCdp927Sohz
         wwkQVvgAbmSMqpc9gaKqAamL1okt4QSn2SwwZI1rae6cNahRVSlMwH43gkHsIp/pB08X
         TSoFhLECm40NOCRvWbbpmMGnB7lo1r4bq3Cbhw0rZwkGVzzRx9ChHMh40MikOQgnF+w/
         xCOOOet6FXh2O0UZwb/AyJRnEp+YtiU/6GvXEZ+fKMPs9kraXCHZQUsiAvjtq19MT62V
         SGpSWDJXwv80UdvBUvbWu1q2EuRZ4pk4Rgypx8zyq10PbnNoPxA7QqEodTeGTySYuf3B
         Eg5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=XqfjFZjqZ+qKfuAcLr5Lq6LxiUZh0aC9ms0gfa0kYpM=;
        fh=wN4krBQeWzH+gel5wevbjdvb9i6AL56TP73kzFkv6Ck=;
        b=T2lDT7gq9dTfY5dJW/ALxjFGIJuGWXFKg5I5c2yehtfgKiImxdBRUOqaWV+0ic7dfo
         X7cy1TSTyFVBiVpXE6KCRnvH2o2VcHO3w61EclTytKm0dLbmM8hGs4U/yotvjI45TkPz
         uSaSrv3GDirG6FwU6D1/ld3ZS5fnAZKpe5V6WlOCpn+ZT29c0rU5qbkEe9rWnbueBMby
         /if33+CaVNdnqsK7HnEFuepZBNbIxSpOitWHhWg+Po+lMWObKtA5P65+AL/QT0Mj1Uss
         gj1pvImK5HUfG//sotNZusqTOmI1z7jBpVKvHgma15a8b4xMn4tmgwqNv+m4fcdO7xvC
         y+4Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1769106605; x=1769711405; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XqfjFZjqZ+qKfuAcLr5Lq6LxiUZh0aC9ms0gfa0kYpM=;
        b=ZfKnMPOWukORcMeAlevbvmV7dHD1khJHNqBAMuuZt7HZsdWlnIqbUaX/X2mXjgUIUb
         /HyaV5EZwSHEf6pGyiefYpxmrlzEOis7rXskm4ARPWmcWIjcqoDp6+rNSlFzo7ki6tkA
         y1T3DuD5Gog4PPI5XwP/9rC69SFpPgjZXWaoFgCR3ZixzPX8iZ2Ojxbf2D/TOZgzhEGF
         OXztUoTC+kZRKyM8fHmSoli0wg8EnS3AjLTfzBIwXteXO0S3DM30WO91WeSBQfhOwDO+
         BOFg7dtuBykPtrYzRrue+phXLvGcW5DkrfQHRDr7AK4TNR29KBBmX4HrSD+t4uNiPJ3N
         ehPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769106605; x=1769711405;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XqfjFZjqZ+qKfuAcLr5Lq6LxiUZh0aC9ms0gfa0kYpM=;
        b=BLzja1sAPhAsXivYVVd3GwkoPmPUbIIQEJwQ4X/7vgUbjnLcuVXv/VzjaO017Flz4g
         bNdr1TVSmYsroRc3OWKCzzmMXoAddFJAGFs74jNWmcNyAw46vxCgkFalxy+mqDNKCvwc
         VM/ln3/IxoLwqBc1HWq2qqXhO79XQgcG5jjeRhmL5Rhc/HnGfYeenEFrmui8OTIA69E3
         VVkEItUP1aGQ+kGkvlr+dK4qsIRnkcekpU5jp0SuLRFVbPEl8c3a4+zpcAirzMzbCriu
         kZS96ITTXxPuY4s9vzZidhOC0hFndBduC18wcuSDiWXy3MyOFBXrUYywwRn5CGvhlQts
         UMXg==
X-Forwarded-Encrypted: i=1; AJvYcCXBlKRHyhCjgl6HmRCQzhQ82jfP/aYZGHuNR0vRjybjlJN9gepY/0WestJtHXGJ9wzPGtH5RQD9kzY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwwOzMzfRiRDwWriQpy38fIXYFdMyiUvlKL6SFlysUoIg3jYNJE
	YTsYNNNlj7IgNic0A0SlVE1zpwoMGWcIrN1d7W+pW1Ikg0xeiCmNPjBEg8dEY93NZF3UbOH3weq
	0MkhmYQ8dAay3EXIAupdg+3KX2ir8B1Fay9WQIoWp6w==
X-Gm-Gg: AZuq6aJV1TmUaopslmj89oCbH54WxmiybJf/kuXdY49uG8lwoObijPWHOfbTU5ue4Dl
	yF23E09BdZ64m5MGZaiSwtw10er7BMn5ToqeM/BPThvcj0a6xnnS/O6dLo59KtqaEU8uqlFcHsB
	fN0z2EPb8Kl5lLRvDw0EBYyamI+PANn4nYn3gAF5NuxSobKcOq3Pjvcf7r/+WKTPcowZRDAs/Yv
	/JWeNlRQfHyFu3hSrluGSl4h6f6SecPdRPXdQkd4q5gJcTes4dp06M/f2A1YFuNqwWjGCEX2i+H
	+QH22w8i9PtOqNXgW0h7yUbhCA==
X-Received: by 2002:a05:6402:13d4:b0:653:e391:6f2f with SMTP id
 4fb4d7f45d1cf-6584b1a37e9mr194745a12.9.1769106604981; Thu, 22 Jan 2026
 10:30:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260105165839.285270-1-rppt@kernel.org> <20260105165839.285270-5-rppt@kernel.org>
In-Reply-To: <20260105165839.285270-5-rppt@kernel.org>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Thu, 22 Jan 2026 13:29:27 -0500
X-Gm-Features: AZwV_QgE9tT77JRQYCr53kQCb10BhXhbXggqjEIyG_WPw09DmKeAZcOWTin2V6Y
Message-ID: <CA+CK2bCB+n5hK9SpMewWURU75a8sY3BJz=MEu_Zy1KwU4Kr5Tg@mail.gmail.com>
Subject: Re: [PATCH 4/6] kho: Introduce KHO FDT ABI header
To: Mike Rapoport <rppt@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Alexander Graf <graf@amazon.com>, 
	Jason Miu <jasonmiu@google.com>, Jonathan Corbet <corbet@lwn.net>, 
	Pratyush Yadav <pratyush@kernel.org>, kexec@lists.infradead.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 5, 2026 at 11:58=E2=80=AFAM Mike Rapoport <rppt@kernel.org> wro=
te:
>
> From: Jason Miu <jasonmiu@google.com>
>
> Introduce the `include/linux/kho/abi/kexec_handover.h` header file,
> which defines the stable ABI for the KHO mechanism. This header specifies
> how preserved data is passed between kernels using an FDT.
>
> The ABI contract includes the FDT structure, node properties, and the
> "kho-v1" compatible string. By centralizing these definitions, this
> header serves as the foundational agreement for inter-kernel
> communication of preserved states, ensuring forward compatibility and
> preventing misinterpretation of data across kexec transitions.
>
> Since the ABI definitions are now centralized in the header files, the
> YAML files that previously described the FDT interfaces are
> redundant. These redundant files have therefore been removed.
>
> Signed-off-by: Jason Miu <jasonmiu@google.com>
> Co-developed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

Reviewed-by: Pasha Tatashin <pasha.tatashin@soleen.com>
