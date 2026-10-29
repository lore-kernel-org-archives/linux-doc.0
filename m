Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793306015;
	b=2roJ3Nr+8TRJM1zrUdEmlaTtbALJTN6USOAsb8IlnuPv1u9E3tludQVseKdjUAS1lXvy
	 eQecWNtVkpLFPk3RRyEfwE6Qh4xlZtEJPXsoNrwkRP0GRCTqEgjK4rkGaDSMo2t2U+14P
	 Q1RHuZOvYe7X+7zVX12d3EbsfnvEMHtriVyVxVncdLGezxeu1iqzFn2z5UopSiJNlQteh
	 /d9Zo1aSo1AcN7rlY9w47TloxHJCXBEigyNq6nl3D0wfWRNtd13kidzur2hacknee1bdD
	 EfD8/BVWT+UhzA7gHG9sO8RHhAWUVuXGmENTo1B1TebyjjC0KZMniMfZieG9H08cUMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793306015;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=1FwGxH5RamrY2sgTjs3EG6aOjMo9Ydi6StxHkJqw4Uo=;
	b=eb1Q1fCz+eyz0z8W9Ooor1ra8iqIc8CFnkjsqY+duSaRIpDFygtenjxmAapCiORAe3jj
	 GqPfg4C53pyoTSLpQb0IvfW4M7hZ8PW/CE2pGPnbAl1/iX7gizMc7nWyTVpnNA4/Ez0NL
	 nIO+2KFUiXXzkPnCzdTG+QNFO8YxYRmTABX3XpojSi/a9pb97rxnw1F5E7jrN0dwYPNtz
	 0gvt++KPCVqtdTmf5Q6V6QohbJrR8F5tZXRf15Bps9+4CeBqGN90PVSbRIRgHbR22vNTR
	 PXp/Ua2+cINgjTKHskRomlTRrJWHK6+b5uoLZsLKhAhUMtKgSiwTPUOV2mHgKLNal6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=amutable.com;
	spf=pass smtp.mailfrom=amutable.com;
	arc=none smtp.remote-ip=209.85.161.52
Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 792F0606A33B
	for <linux-doc@vger.kernel.org>; Thu, 29 Oct 2026 20:33:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 792F0606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amutable.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amutable.com
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-703be215729so1405248eaf.1
        for <linux-doc@vger.kernel.org>; Thu, 29 Oct 2026 13:33:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amutable-com.20260707.gappssmtp.com; s=20260707; t=1793306008; x=1793910808; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1FwGxH5RamrY2sgTjs3EG6aOjMo9Ydi6StxHkJqw4Uo=;
        b=jzUC4j+m5k1GWzE4M+MP1+7CZ24I8OTXJlA+L47TEmbE8YmDlulAMxTxxOUwWkdRHH
         ZA7UWCWY4UP0IpGp1AHTAIZ3biCBCS3Tm/hc1d7JYAYzBEUgymxOLRamDSR52NWY6yTV
         Nj/CqyTphrQl74nCEr4jlN0A5maoCINl7zvMB7W8X8TZfTkAJvS2G8HM3Jp5HF69ixuK
         k8K6KaBp15/F8ksjNkcHk9DTAxy2LvSV5923Kd0H2P6TbZ8q5agmTrdcmkY94F1z8Riv
         XkPjRnV7/c156Gl2EZ27Xh6M+m8MNab0eP3uNFZbUkpddrNb2ItyVbJgXuN7mAV+JTBo
         PHqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793306008; x=1793910808;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1FwGxH5RamrY2sgTjs3EG6aOjMo9Ydi6StxHkJqw4Uo=;
        b=1YjzcD8iy27ECL2LxjW6ql74/3xf3BktVmVtXiwzw4jW5CBzEeFBRb4b4VanT5LgsA
         2NK2lex7iyMvyQ8mLDwu9XVmGOuYoJD9llmntSKSNEeDxGv/h3QmSz3bd2vjI/ULyh06
         uN9/wKyiRUUJzPcZWkdAxPNTbzPWy4GT2CPeJM2JKDALK/EH1sidHiTizxJ3VWotPkXa
         cetGlmuBgWjh+oPBWUAIbuGfrJWfZxvt4CY1s9Z8p9YVkgrpqFn5QHp7c4apvtsz/W9w
         xLRftZlGkRFFhFI8TAHL6oGIxXka79V+648wXXusL96LrRMiikymUABBvVVMkvd1MiWd
         Botw==
X-Forwarded-Encrypted: i=1; AKwUvBwQhSGYS/QugGHeaeNjHqftcejQL7CxZWBsSMEk5wUmg2rqswSz5VFhNjffVQVzFMDeKEAUo/SEEf8=@vger.kernel.org
X-Gm-Message-State: AFq9FYJmB+Xjmm3QJi3RwFjgv37xM2t8ICvZx8ZQWITYrUITSwl8aL7s
	r3wsYq4Rt2J27uOyU10NOwlL8+lMeMYH7Ob4ql0x6dG8aB20WPF63i6nTsyOCCjNJIOX
X-Gm-Gg: AYBFou2NDVSPX0kuzYZ1s2gs9Z1qNS6N3uegl6oYxaK4lzr8vOFJro3fG+rEdzm/x9k
	T7zKRypZmXZC4Osf4DBDKkiA6wMZJVwCSsQvaSxZOD7JpWDTx//otpZHXgSwqhqbGeWujdAL8vB
	T0ViuCubOVROGtKPYq6neZdjAq3AVkWO43Eewb46vwY2vw1o8DuUVtrS0KHTjSS7H4Kxt9FiQZz
	uzEjWlaezXxguJwOnW1lJRMpsTA0k0pIUJqpYTMRId6xyy01CJM3FJH3rww1n8q/yzRRL4nDq8R
	g1/k4PCGB/eB8fAmGBh1nAaAqMrBYdzc6oLdc2ob1/ftGXUApBA7sYLjYocpMTNNJWaGTIU2t/q
	0P/8aictwAc/94CxiCeE/f+K4sSWd1yH5z6fck0RJcxChzfLFUrpUo6zeUAi+uu/X6nhNKG1Khy
	WTnShpLrRXQBDQ9D1xLy+P6WXDlA08R4tz8JvCCkeOHL9bPp61hosV2AtUdEZG2rmfbJgev4vui
	etV2aMaJ5V4Zj70HNl679yijHWusFFYlCw2pP8upU2f2evBPQ0y7Y2zo8uJLlRdWswnpH4TU8EK
	7k66fClaLQkOXmNkJzzh1M53
X-Received: by 2002:a05:6820:240b:b0:6dd:25a3:94dd with SMTP id 006d021491bc7-714f29beb56mr224819eaf.41.1793306008134;
        Thu, 29 Oct 2026 13:33:28 -0700 (PDT)
Received: from toolbx ([2600:6c8e:af00:4c:73ea:df46:8ccd:ac9f])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-714f2ce7c9csm260964eaf.5.2026.10.29.13.33.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 13:33:27 -0700 (PDT)
Date: Thu, 29 Oct 2026 15:33:25 -0500
From: Andrew Halaney <andrew@amutable.com>
To: manuelh@nvidia.com
Cc: Fan Wu <wufan@kernel.org>, David Howells <dhowells@redhat.com>, 
	Jarkko Sakkinen <jarkko@kernel.org>, Christian Brauner <brauner@kernel.org>, 
	Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>, 
	"Serge E. Hallyn" <serge@hallyn.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Luca Boccassi <luca.boccassi@gmail.com>, James Bottomley <James.Bottomley@hansenpartnership.com>, 
	linux-security-module@vger.kernel.org, keyrings@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kexec@lists.infradead.org
Subject: Re: [PATCH v2 1/3] ipe: add the .ipe policy keyring
Message-ID: <auOn9CzT_gku-5cH@toolbx>
References: <20261029-b4-ipe-keyring-rfc-v2-0-77727b205844@nvidia.com>
 <20261029-b4-ipe-keyring-rfc-v2-1-77727b205844@nvidia.com>
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
In-Reply-To: <20261029-b4-ipe-keyring-rfc-v2-1-77727b205844@nvidia.com>

On Thu, Oct 29, 2026 at 12:30:38AM +0000, Manuel Huber via B4 Relay wrote:
> From: Manuel Huber <manuelh@nvidia.com>
> 
> Add a dedicated .ipe keyring for IPE policy signature verification.
> With this, userspace can provision its own keys into the keyring,
> then restrict it and activate it for IPE policy signature verification.
> 
> Gate creation of the keyring behind a new by-default disabled
> CONFIG_SECURITY_IPE_KEYRING Kconfig option. When created, the keyring
> is empty and writable. The keyring is used as a fallback after the
> existing policy trust sources only when it is created, non-empty, and
> restricted with restrict_link_reject.
> 
> This enables scenarios in which a trusted userspace component generates
> an IPE policy, and creates an ephemeral policy-signing key pair,
> provisions its public certificate, and restricts the IPE keyring during
> the early lifetime of a system. The trusted component can then sign the
> IPE policy, destroy the private key, and load and activate the policy.
> During that phase, the system is considered in a trusted state whereas
> the system transitions into a possibly untrusted state afterwards,
> running arbitrary user-provided applications. In such a scenario, the
> trusted userspace component could reside on a dm-verity protected
> rootfs disk, and applications would reside on additional dm-verity
> protected disks. The latter disks would be dynamically attached and
> their dm-verity root hashes and/or signatures not known a priori to
> launching the system.

Not trying to muddy the water here, but I stared / thought about this
a while and wonder if I'm missing something below...

With this Kconfig approach, aren't we now saying "if you want to use IPE,
and you want to ever use this feature, you need to make sure you seal that
keyring or else someone can replace the IPE policy!"? That seems rather
easy to foobar, and means to me at most kernels (i.e. distros) won't have
this enabled which limits how easy this is to use. I know Fan wanted this
behind some Kconfig to make it controlled by build time, but does it make
sense to keep the command line option as well to really make this opt-in
for users who have it enabled at build time? Otherwise you really are gonna
have to craft a special kernel in my mind.

Likewise, but more nitpicky, I'm not sure the restrict_link_reject
requirement buys much over the chain restriction. restrict_link_reject
stops new keys being added, but pkcs7_validate_trust() walks certs
embedded in the signature, so whoever holds the private key of any cert
in .ipe can sign a new leaf, embed it, and have a policy accepted anyway
I believe. Under both restrictions that basically means "holders of an
enrolled private key and whoever they delegate to". If the concern is a
restriction like key_or_keyring:<id> pointing at a writable keyring,
that seems like a provisioner bug rather than a reason to rule out the
chain restriction. Am I missing another reason for the stricter check?
I do realize this is rather pedantic in argument and doesn't have a place
in the use case described, but I'm wondering if a future use case will
want such a thing.

Thanks,
Andrew

