Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCA1F239E75
	for <linux-doc@vger.kernel.org>; Sat, 22 Nov 2025 17:28:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763832524; cv=none; b=Jm39t5KMfT0NgT/6Fs3W87GufUsYnI8RMvT9Omi62EDJd2iWKc7OPArcKHbnadIYvTK92GBwgtwvGrxtyY7hbPU201hNxhGuJx0UgvnY7KVQ3XvVPAV13y2CabAenBuc4RHehZ+3DKcIIVCdtKpgUdnABqtOrdtU99Y1+7yONXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763832524; c=relaxed/simple;
	bh=5MlvMXZYTtR3C+2ukJ2tJbzkGsByRH9qIzQcgZ1uih4=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ZIOgCOZZYZEgpZBWIbvs2pXvCcfheqVaDBu8VjPJ9hu+YXWHTstEiSgObjncNQFLPRhqIW7Z6POpxG5VIMGeH4T1E+VjwASLTLwA9nYBqxXNRPFI73RpOEBkr/DhD9izTJ+e9CM6yoG/lM0p0A/2eRoAL1V0jOqOh0C9YMG5FYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J5AfyTpI; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J5AfyTpI"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-7bb710d1d1dso4601404b3a.1
        for <linux-doc@vger.kernel.org>; Sat, 22 Nov 2025 09:28:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763832521; x=1764437321; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=5MlvMXZYTtR3C+2ukJ2tJbzkGsByRH9qIzQcgZ1uih4=;
        b=J5AfyTpIqgeULMSs7LwLYb5BdhMx26AhFuqy7086YFy7JJdnMoVBVo1YhJys8YF4kA
         WMOGLJ/rDg4ApWJPCNe++jE/8Hnaa0edMyvX++niezWL253ofUzE15a5W4RTzpRZStrh
         0KHZ3oBDHnwm/NAtDoB7nmfDaEQFvaJV0w4xDIISWgSm1kgLs4QeQJLJ2QyDuKIn1FLd
         wtLn1gFB2PBW3OI47nC2i7rtQRix0S85i8+UUtzooMWqVulLh8fDb7BZ/YOSu95TSk0b
         ZjC3CjrqGGJzPvw1srhDqh6PXeyvYxS0+bdDcrTfbt/N8rOjz49D1ArAYuipNKISkLCC
         TEYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763832521; x=1764437321;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5MlvMXZYTtR3C+2ukJ2tJbzkGsByRH9qIzQcgZ1uih4=;
        b=bZrjw+gRqI5zoC/kD11JbNg+hlvSeO/3/0Qgx6ay1eIXUEgtskcoiiYrF3R/r/iIfS
         fagXCNCTZKpu670cPISKWQ2IljOf8vrgtGJCwQRN20Xb2cYAsHUeINIm6i6CUqZr/bnK
         ieP12cmu3JdEQYr8Hn0RIoF3yp5+Hx6ELcnwNKnH/OIY1Gudl35eyLvEGGrKke2Yy6aM
         aR3n63rnjQJeKA9rdCGBhLt21zhK69+n6mgLVwlF4AHAeDky2TkhMfDOrOVV0K7UC9Ms
         q5I6I3r8SAi1vu9sBPnsTKjoYlEFFqQ+38mBunmjxYlQT5Ys9Tcybn6RL7U3esfvyy1n
         Q+0g==
X-Forwarded-Encrypted: i=1; AJvYcCUwomK/bHGB5KGiReULb2mxP/xYugq6XHgGHCbAIJ6o8KOuD4OR4vStCl+a9qejIZxK5BdU32iImJ8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6W9u1eCOE0HvBLrgrsVNp6qpWdVMuOAfTuiLea9bMDIgfcPqf
	QNeHU1i5hAyP1sHIedyuwfqB9Uk8K6DPenauNTFiL7RVlH7A/1vyHUw/HSnpTQ==
X-Gm-Gg: ASbGncvnzPp4lezRWdm+IZKmXomprRlkEjTKZ/POyjwCc1/0jAJxzZbgMZtuO0udEK4
	7bWMR0lu7BhM4OM9uQnEFzi6VrEH2sXtYIs9oolt6eHIVXKaOsnMeUgouamkR5m96iaeVgRArYk
	2iinKwvBXN40GSL/PNtvd7L8JdAsBxgXauaCN96y+OF5qYAntq5a0ecYhqxEwCP7TZhy93o/9+z
	n5m2/ghyeC5N1JvYadOInnqeD0zuOJCqzXkFg2f5o8oUBI+IaxjBj+Ih8LDowGSrL0Z76qvTK9t
	w8AD/9mxbjNZoWE9kCc38yBPSOv2zFqbHMvdtEKX8ZgGD0s8CfzcgeLOr2cbIMbb/F3ltS3jcLI
	V7hAIyHgzYcWFYoPdOoD/+ExPIP495R/wIWpuF3Adl5DiWmU9Cjil5oVJyeKNNxnLVcYSXrXh/6
	FexweSQKwVaU6UWIdAeVoimfEKWcDzvsFyuD4bNf3wzcMIK91KZikJJ9cosw==
X-Google-Smtp-Source: AGHT+IHProxUTYxUr7Eg0WsWEkqduy6WY8mRtpWbTz5oJpvvl87zL4seGtqYrXC96lkU4A+SdYOPVQ==
X-Received: by 2002:a05:6a20:1586:b0:35f:2293:877f with SMTP id adf61e73a8af0-3614edd980emr7983683637.33.1763832520673;
        Sat, 22 Nov 2025 09:28:40 -0800 (PST)
Received: from ?IPv6:2401:4900:8fcd:4575:1ad3:3d1a:3314:cdd0? ([2401:4900:8fcd:4575:1ad3:3d1a:3314:cdd0])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7c3f0243b19sm9534469b3a.37.2025.11.22.09.28.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Nov 2025 09:28:40 -0800 (PST)
Message-ID: <96d8ddb6c04651224fc66bca825ba99292fc8f87.camel@gmail.com>
Subject: Re: [PATCH RESEND v4] checkpatch: add uninitialized pointer with
 __free attribute check
From: ally heev <allyheev@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Dwaipayan Ray	
 <dwaipayanray1@gmail.com>, Lukas Bulwahn <lukas.bulwahn@gmail.com>, Joe
 Perches	 <joe@perches.com>, Jonathan Corbet <corbet@lwn.net>, Andy
 Whitcroft	 <apw@canonical.com>
Cc: workflows@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Dan Carpenter <dan.carpenter@linaro.org>,
 David Hunter <david.hunter.linux@gmail.com>, Shuah Khan
 <skhan@linuxfoundation.org>, Viresh Kumar	 <vireshk@kernel.org>, Nishanth
 Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>,  linux-pm
 <linux-pm@vger.kernel.org>, dan.j.williams@intel.com, Geert Uytterhoeven	
 <geert@linux-m68k.org>
Date: Sat, 22 Nov 2025 22:58:32 +0530
In-Reply-To: <f8b93a66-c755-497d-a425-c7b4baff5165@kernel.org>
References: 
	<20251117-aheev-checkpatch-uninitialized-free-v4-1-fbee16ffeab9@gmail.com>
	 <f8b93a66-c755-497d-a425-c7b4baff5165@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Sat, 2025-11-22 at 14:01 +0100, Krzysztof Kozlowski wrote:
[...]
> I saw the other discussion and Linus re-iterated old approach/syntax
> preference, thus I think this should also include it, since it is de
> facto a coding style:
>=20
> "Pointers with __free attribute should be declared in the place of use
> and initialized (see include/linux/cleanup.h)......"
>=20
> Best regards,
> Krzysztof

Yes. I am planning to do it in v5 along with coding style doc update
