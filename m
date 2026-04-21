Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29E6B3783C4
	for <linux-doc@vger.kernel.org>; Tue, 21 Apr 2026 21:34:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776807289; cv=pass; b=GU6am7DL0RDs5rVWuCHetof5mTJedwmOEQxG7othOuBu53AQD38KwQUNxE96meIKTjUL7cGcU8ALVEqd92/PYWjMkRNGfIVpizUo2j9PabUnyWr+4hsp2peck5hnLVfPE09l0pHn2rGB9LTREwLscOjtPw0dm0bSNpfo+nsc974=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776807289; c=relaxed/simple;
	bh=CNb+tRlhSa+ap/C1lp5GwDLIrgQst2MxGRx4ejuGA7A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZPfHiUhRwCJqZGGZLPyiroMfvpPpELzGjkLYGdcCSinbvI7fHify7TCUKcmC6Y05Zl3+NPPZk68xGYloZsuKZYflp98sJTtwZ9LiDpR4kLmHquS2IHTVelsaH+2jbaDHWZkHwamZVLCfTLne8tY7dTl7t+V5n2cuYu4W9A4ePJ4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com; spf=pass smtp.mailfrom=0x0f.com; dkim=pass (1024-bit key) header.d=0x0f.com header.i=@0x0f.com header.b=YKya8M+p; arc=pass smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0x0f.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=0x0f.com header.i=@0x0f.com header.b="YKya8M+p"
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-79db5e18ac6so59145247b3.1
        for <linux-doc@vger.kernel.org>; Tue, 21 Apr 2026 14:34:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776807287; cv=none;
        d=google.com; s=arc-20240605;
        b=c/r/1IEPdcFeAY2WHF8el5TPhDprEF62QwfZFbPgPhcK2DAuvPxTjB1ckpBWHRanJs
         tJ5mkaIF+orFu1pMUueZzBOzbAPl5wMHUcOYx6+3irjsh8RIBMi3uWI2pWlAAq6CRJRH
         3dnN+k1f3KqBeWhUEAws9d7UTYwKAPhT8aiP18v/nnH5kuR9EWbXY4NzsAV9QmyiWZq3
         UHFh1rs/t2dv23+MxMPPKx3drgDluu8hhXxrLeSg7FM4+XBVaC0NK6wmY3MYv8e7LCHS
         YeeIx00UI9+F4mezqCLSeNUl3j393qKvNUeZcUCygsD6bukSJnj5+W6g+P8K9htilw0J
         jhGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=CNb+tRlhSa+ap/C1lp5GwDLIrgQst2MxGRx4ejuGA7A=;
        fh=UhTWvm1YQ3gxKD0WyCIbw0AgUsE1WzIgGrGWQwa8lmc=;
        b=ZYYwXi9C0LQ124bt2FMEDkXFwGAuT8QvGK3Gk1an86sMhoM1oIrXWvy+swm4JMr0q9
         BzSFklEdWu4Ft8P3n+OKJEmPOvxEWy0isXDpZluddamUL+6CmuqklhiD4aFAzN1++yCv
         z4j3RWqA7Or/ZofN+PbLiv7SKDNGTB8gs7LHJ5sDxsbZd5SD2Y5ALY1wvab4J+jVwJVa
         P2yKzJOtNJ47VBHpZ8r0Ea9+XTsXKRbQG3wzZaZ5WmvoH5SnJusyYm2f6gYpQhTquizI
         mEsoRQ8MGRGFK/L+SffjdiyVZs0j0RxUfNCHcl9sgUoONOgZ4rk912ktBJExCg7N/cNv
         XwQQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google; t=1776807287; x=1777412087; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=CNb+tRlhSa+ap/C1lp5GwDLIrgQst2MxGRx4ejuGA7A=;
        b=YKya8M+peYB/WJOw1qzf2tMUWwFNqm2PymkGgmMUH3+lHHqngS4LEzy47rXhrmeEaY
         h04iMDDKCyN5v9BZxcZqdNHr7V1CsaHWzPy0nZVL0x6ZfUGeOaG1/7taAsZ62zDhKUfY
         csZeFLXULU3NmhXNRUYzeGRmNgDySL7QqkCSQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776807287; x=1777412087;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CNb+tRlhSa+ap/C1lp5GwDLIrgQst2MxGRx4ejuGA7A=;
        b=IunRfr4h4NXlK/auW2e90N+lgrmDUMobBYMvPgZeykhGKRtVFOPTBF02KJSgSr8bDR
         qF2OxXeLnOmxIxkSeqta2wouAXzf2StiI1d8V6ROK8ApGgjjqZn/tnnIwokK7qM0iy24
         0ufCvCjWON7SMXyN/N4Dii9l0+T6u/R8mQh21hp1Uwd6Xv08GmNEHp4qQ/pA4KNfFQWn
         iY8qjKTeooPvEXrX+jPi/k3Zzz55gPmudnUUSI2gsZFqsannwmJ1neQGyMPFqrZN40hy
         5L4j/iSTPJMRidZQHhg9WwlRipOBIAPcffVDRI8/XmXKqyXf+XMp6I9AgPHDsOcAwXun
         /xbA==
X-Forwarded-Encrypted: i=1; AFNElJ//Q20dcz+bmKnC5w3VAhkt0IaunQwP+8LCa//VApkdvWWGvAqOs6oZepmvuZvY41lyeiRKeDqLwvg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxUIT3r/AeozDUZ6GDcHcEwHv3NFp3hcZalQuz++EkSWuGcwt17
	wjvxFQERHCr1QSBes+gTlgt0pvO79xBlRHkNEn3ZJOGedljw2dnkV4jld8gyE24EUBBWoimSVeE
	gTP8Y6Htd3UfOyNDL5RBczm63+kj7+53Akhn01w2hPw==
X-Gm-Gg: AeBDieuf63ixydP8/hDaqXA06fp8pQyHJos6kV0qi66LYcHD1YrPeSVfTAuxEApQuh9
	hyOeR0aq9gvrXb5okPOTNjUkbrjPVcLTuZXac+oth5j9dD8386Cd+9bWKidzwMQCrx3az8dEYWq
	PjhGcEs29+/6HZJVZg8jfqzPpDF9YvpT2LOeGO9zMmiaIsp4uEYIvHozdl9suikV3N1//hYiBRp
	xrVBWF4tp09BjaGkLHn3uPFVO87X1RikDS6R3aLIxO9VvdW6DGnDV3EYi24NTIsjdQyKZGmrvPa
	GSIT+fRzarS4N1zZ5WM4g+gyHpx6kmUd+9wqNXRUzaljh1JltUg=
X-Received: by 2002:a05:690c:3181:b0:7b4:ad41:482d with SMTP id
 00721157ae682-7b9ed276d75mr150110487b3.3.1776807286998; Tue, 21 Apr 2026
 14:34:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260421-v7-0-0-net-next-driver-removal-v1-v1-0-69517c689d1f@lunn.ch>
 <20260421-v7-0-0-net-next-driver-removal-v1-v1-12-69517c689d1f@lunn.ch>
In-Reply-To: <20260421-v7-0-0-net-next-driver-removal-v1-v1-12-69517c689d1f@lunn.ch>
From: Daniel Palmer <daniel@0x0f.com>
Date: Wed, 22 Apr 2026 06:34:32 +0900
X-Gm-Features: AQROBzCe49AfCvVC9cn8YlKac5QLSyex0DDcogmQpbxNAaVurwjo7KrBmDLXCYw
Message-ID: <CAFr9PXk9GMmPWeaURvgQySwAHtFDxRH7B43u9mG1P_v-oJmzNA@mail.gmail.com>
Subject: Re: [PATCH net 12/18] drivers: net: cirrus: mac89x0: Remove this driver
To: Andrew Lunn <andrew@lunn.ch>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, linux-kernel@vger.kernel.org, 
	netdev@vger.kernel.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Andrew,

On Wed, 22 Apr 2026 at 05:01, Andrew Lunn <andrew@lunn.ch> wrote:
>
> The mac89x0 was written by Russell Nelson in 1996. It is an MAC
> device, so unlikely to be used with modern kernels.
>
> Signed-off-by: Andrew Lunn <andrew@lunn.ch>

I think I might be using this with a mac and I'm running mainline.
FWIW the m68k mac stuff still works perfectly fine with modern kernels
and there are people using it.
