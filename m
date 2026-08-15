Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F24513EE1D4
	for <linux-doc@vger.kernel.org>; Sat, 15 Aug 2026 13:07:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786799265; cv=none; b=NSy9IicNK+egua6Pm8P0CTs2QPAV79WMoVgh1itSxQ5dcWkF9gOlYi3P4NCovlI71j8/DUuk0hsORS7vtkddq2s7tRDjzLpSkt0x/XSR/an5VqfxZxRp/DZP9s6UfoL8DK62hBB+4IcI85X3r8QUQijvRbzMQx5+igB6RKZZUzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786799265; c=relaxed/simple;
	bh=0jndbey5Pvjf3v9MX03JkuXQsBTNP/XZ6T3cuUpF9wc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SNrDrDsOukWZx15naJ58SxYm3qQyirpTjfZ8qDmYO7bJEFVcJt1+mwRNisZI1zUMJSsbBOO3460YtzmaV4U64x+TQ0fAiscEXD33qgL5S96l/Ibk1rz0Me/MFdOBAlXVjNMVczLX8sH9ynBdeTHXggJ3hi61m8wQ0I7hA1TuinA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V3Ei5dp4; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V3Ei5dp4"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4956242332dso19940805e9.2
        for <linux-doc@vger.kernel.org>; Sat, 15 Aug 2026 06:07:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786799262; x=1787404062; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2daFPoDS4/53WEkckbjnmN8AXIA4cD/WTxo7tO7xRQI=;
        b=V3Ei5dp4UCIdByixQtEwEXOY2t2tcdfLjXiWv36qTY8Gj0p2MEM+E50ookIpB+AJC0
         E5HevSVLjjHehj02hG6aKvHTx4tIXZytAJwI/SNeaZkFD60r+7YNQnXrhAR9rLN9XFgl
         OqKG0IxJQZURxWp3a9xplLXkiCZsABGPR0uTnJJWJ0YvxqxJJR3t2E3xjx/UGDrZC0l/
         RpSruO4E8n5O6e3HIrSTHiAU6sve/yOxEjH84FuMFMGqR3uS0ss12yIzIN2WigsNhTpr
         reU7HCld2o8EToQswS52Br4lZbjnH0SZq2BNtl3DorODbngo0nNjvfHRdx0uKqaYS2dC
         By1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786799262; x=1787404062;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2daFPoDS4/53WEkckbjnmN8AXIA4cD/WTxo7tO7xRQI=;
        b=LAiN+n3qB7Yth0nNJDF7Mt6Ohw0RVfvv9rykhEsPUmA+EXp+xgTnxJHDE7Fw1Dktlf
         kkRXEQiScyqOXluZGWEc3N82lHwo49TX6nfpgPSc9sI9QfMkZRLc/uqYEygfE7AYUbZA
         4huW23pl667kawUnkuFl2Rx1QtdCaTwu78G3nJrkNbH40joWui5sbFLFS3cp6yg7MMnr
         GfY9AXgCiAWE1C1ljFpbc7gtiw/z3n/BAAIWD0rKTRJP6outlb+VF1xqw0g/ztmRnRr7
         hzlRhlWrRcnK/xfche9/yiaN7Oohb7laGn1YcbV2W0lgmVf1zl+/Cp3a8ee4RCwhWHYg
         NrSQ==
X-Forwarded-Encrypted: i=1; AHgh+RoLmirQFCi9PilVJxWFZIAasoIxDV+fdq7Ku9hxTAPpnEOQn8g29QNi2164ZyGiVSFLtRmTWbiy9m8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzk9GSoTZJNuHUDr5SX/nMcZphSWLVtZ/FInMW4DWhKIiCq1U0v
	ZLhhh9bSwvpwTfRHVKuwKIP5SdHjRL8Zl/VKjoF4LxqI/z3ATfl1WjVU
X-Gm-Gg: AR+sD12ZjGeEsB/r1dtBrqQGMcFM4olmW8Tqnuo/ECLaOXp0xgLbJv6j6ktU1O7ZR/4
	7mSeo3p0cReAVNYeqrE3kLIrZ8eC0zdL1MZs6bpLgdSlA1NlhbKWiQi/6Hkcaqu5FueHBvCZ5Mg
	3shBla6MT22VxJv+hW6xt6JCCR2KxVanFWwyFqsxaDTKq99OtAvyUIOn7nNG0cgpdVunNmj71AA
	90wXIu+0NnG5UZWhTBjzmerSN2MUrXkVZwzBn5O+UxxCluaqSnBgPYcQht5J0EmbgqygD0jkln2
	Zkm9dDlzvJegeddg7u+OoSVQqE1CUNe9jqpQJiZGXXsfWPpXpjrrrQmGgMPdKwCRp+hKRZ+zyCO
	xLeH0eY+vrBhkWhCr6jD3wGJ7xcyqlLkr35bg6Rd9+p+NZUHjJ5JYiLgpj97cWIZIYVhe9GW7RO
	VveLDRekfp6JydrjwFhXzINKL2fj9XEsXwrCeXkUeV1030ZletnaqrVwFp3m8fgRIWkoMAapyaJ
	cSAvx5hb4yTrB5D1rt9sGOxifbKMnSqikvDxjvjQWbU08Hr4+b/dQE9KPrVfcpDo14KSh+fxuvO
	sSLepUShfueXl5oRSjUbATO6fpHZWU7IDDhfO6gypIs5zKbe9qDOgU3TZkwYfydGzg==
X-Received: by 2002:a05:600c:3b8f:b0:495:4491:b8c2 with SMTP id 5b1f17b1804b1-499906ce446mr55403245e9.3.1786799261853;
        Sat, 15 Aug 2026 06:07:41 -0700 (PDT)
Received: from unknown748F3CBA5068 (dynamic-2a02-3100-aecb-d601-fc34-eb31-14a1-3704.310.pool.telefonica.de. [2a02:3100:aecb:d601:fc34:eb31:14a1:3704])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49988b1d33asm146700145e9.10.2026.08.15.06.07.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Aug 2026 06:07:40 -0700 (PDT)
Date: Sat, 15 Aug 2026 15:07:38 +0200
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Marc Zyngier <maz@kernel.org>
Cc: Oliver Upton <oupton@kernel.org>, 
	Sascha Bischoff <sascha.bischoff@arm.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Jonathan Cameron <jic23@kernel.org>, Timothy Hayes <timothy.hayes@arm.com>, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Documentation: KVM: Fix the GICv5 KVM_IRQ_LINE PPI range
Message-ID: <aoBhU6XIarXxeQYB@gmail.com>
References: <20260815092537.31737-1-kmehltretter@gmail.com>
 <86wltrzm5n.wl-maz@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <86wltrzm5n.wl-maz@kernel.org>

On Sat, Aug 15, 2026 at 11:57:24AM +0100, Marc Zyngier wrote:
> > +	       in-kernel GICv5: PPI, irq_id between 0 and 63 (incl.), and
> 
> No. Please understand the difference between *implementation* and
> *architecture*.

Got it. That distinction could perhaps be clearer in api.rst, but 0-127
is intentional, not a missed doc update.

> > +      Userspace must query this attribute after initializing the VGIC with
> > +      KVM_DEV_ARM_VGIC_CTRL_INIT.
> > +
> 
> Must? Why? Userspace can perfectly live with ever querying this.

Hah, yes. I meant "if you query this, you must do so after init
to get anything other than zero"

Please consider this patch withdrawn.

Thanks,
Karl
