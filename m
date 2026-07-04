Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88E8B20FA81
	for <linux-doc@vger.kernel.org>; Sat,  4 Jul 2026 16:18:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783181938; cv=none; b=JwYA7e5vDZq4+Luvvfs/m7vADz8RgtMKCzDFV/k6GdmRj/vvPsAnrCPS0jTG6bMj2R+eg4lcSaT8OOei6uzi5tHg8IBwhfwH0+5lM0js8UcbZrrXofkCt0IQV9Yr8KGlpK+/VLwEBrsYtgKS2t2BovNRQLSa+U9sHsauooXQ+fs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783181938; c=relaxed/simple;
	bh=0vdVZwX1pjzyNDRqIV+N7mx+yu4U0xEenr907aAJhxE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=E9gyVITHru53apact6E4FqaGRpX0MtHa8keYPYbpGPBrb5rcPbMZzXZ2a6+1Msu1E61IBmH2/lWa25mNPsOpN5zbtNo+Nm4YCraS84eNBKDps1fpp3mUXIKenW3u0j5I2lsssyWB/5Ot3arpazTu4B+TaB9aGRE141VnClnfyQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ddVMUWHV; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ddVMUWHV"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4921eed3fa2so11080795e9.0
        for <linux-doc@vger.kernel.org>; Sat, 04 Jul 2026 09:18:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783181936; x=1783786736; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=0vdVZwX1pjzyNDRqIV+N7mx+yu4U0xEenr907aAJhxE=;
        b=ddVMUWHVQozUpfto9RfSqTTa+ozz+Eg+trAVcQrnauPflewqbshId2U14RmAYlF05s
         kgOQg6WD62tpwpqZYIQsyBNGJCJtTuVXzBheANT9g77jIQuHrWa3GMQqDAQIlcpqKbeQ
         l2HmpUVCm1nWQox3zgIFc2x8+Av3SBBUqh9nMU2/9F6ng9/9MsJ3oh/efS2GCf/fIZFu
         0QiLOORRHw0g2ICJ/uixCUE9ATAV5u/kIpCPu2fgn/KNb9STQj3eW9WWDETLMhFK8iSB
         lDxyQq3f50yS4lMYRxR6ELhvlhBSyoquk3UME5jIiksb1oObqeuIuxfnG1mMBjAmdmQM
         4ZTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783181936; x=1783786736;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0vdVZwX1pjzyNDRqIV+N7mx+yu4U0xEenr907aAJhxE=;
        b=F9p+KmYfN7Ss0qHQNV5KDGDJuXttWgKKLQYdOPC4nqcG40nMM8UN6igYF04yPfYNIf
         shJ1peS5AUTu0yl6FWM3+yJyTOXaAr3sI3eH8GczLual7sLgO6ffg/l/R5hevQkQKvMF
         PoH7EfY64Xjbuj5BFaXPyHwDUlagY0LZ+iNpEeIjFGyvqcwJZRWODm/cHN4z9nqmXROq
         1XERdNmFjB+G3C3VWgXjqYgwDhrfPFbk/QJQsUEcMjek54gAOkIE3M8fdUUTCJFqsrnF
         moEnO03bd1wxQo7EThbm4bnHWV2foDDqaoy46Pu9O9HMKQNbtIInBxAQwcQOzIO8BNQK
         hkIw==
X-Forwarded-Encrypted: i=1; AFNElJ9lLM+V/xw3KwIZgGJP6Mrpu2ne2Gbxcx8kzgOLsX60KGhwSH0VXggMxkXKc9gnbeBpdyWj9OnEBac=@vger.kernel.org
X-Gm-Message-State: AOJu0YwA/FDoJlq+k3PsLmsHnrSR68DJhaoTqvmGkRq3sNogjM13M9me
	fzBzkPL9Mj85Cb9ZKlr0stPKkGzyukNCPNVypEeC5ZlUsYkJSqX9hoxX
X-Gm-Gg: AfdE7cm5L6Uq/40s2SLR8OcYGgxrP0FebgtK63tjSBKH1YqOpFZEC+GsI+M1NSRhwCu
	qkNWX4c3CeX6FVBfWs9/yNtonXnYlfWs52s1rx0LSLe45I3tjavcC4cFeJ2tkt0CR0RroZq8E97
	g55rW5R6gWPmcBgL1mxjtRSTn234k6vAh77T+9IlP0XpaHBOGchFHQkJp7QcjNZhCt9qVCaYElg
	tSzaxAwXADl48GRvY5PSqjr62MMoWQtmC4XYeVPOo2Av7kaDf3pPZbweIix7iZc9K6OAad1tk9o
	5MJGlTL+SVsa1Omi/g/5FkSIzFQfkiQDYeK4f4pJeKFo3E6u3IyBGVz1ycj1c2OKp6MR1gSp3Uf
	r3PhLPmVG8JeKMYZ3sDZ3uJM6m+P9jxI5cd9b6cSNo/rv6LRQ3F/ZITVK8DsaN2q0j8f6CLc2p0
	r6xO1NiEEkGJd5eFsj/LhagHJDcwkgcNxth1jYbR5T+7nBX+cKANKY6rhXk/7mJxN9YFcD1rZT7
	Gi+f/kcpV33iiCJ4A+sRg8=
X-Received: by 2002:a05:600c:154c:b0:493:b7a6:3dac with SMTP id 5b1f17b1804b1-493d1d33cfcmr37542735e9.33.1783181935580;
        Sat, 04 Jul 2026 09:18:55 -0700 (PDT)
Received: from ?IPV6:2001:8a0:e962:d100:c6ed:7d0d:2285:7b33? ([2001:8a0:e962:d100:c6ed:7d0d:2285:7b33])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493cce12c40sm229210135e9.13.2026.07.04.09.18.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 04 Jul 2026 09:18:54 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
Message-ID: <cbc65656-98fc-401c-8095-835d23884960@gmail.com>
Date: Sat, 4 Jul 2026 17:18:53 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] kconfig: Support conditional deps using "depends on X
 if Y"
To: Arnd Bergmann <arnd@arndb.de>, Graham Roff <grahamr@qti.qualcomm.com>,
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>
Cc: linux-kbuild@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Nicolas Pitre <nico@fluxnic.net>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Masahiro Yamada <masahiroy@kernel.org>
References: <20251215-kconfig_conditional_deps-v3-1-59519af0a5df@qti.qualcomm.com>
 <955bf67f-309d-45d4-ac0d-2f53577aa18e@gmail.com>
 <7e20408b-3a0d-46ff-ab6c-2b0d86f74adc@app.fastmail.com>
Content-Language: en-US
From: Julian Braha <julianbraha@gmail.com>
In-Reply-To: <7e20408b-3a0d-46ff-ab6c-2b0d86f74adc@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 7/4/26 16:33, Arnd Bergmann wrote:
> The difference is that a plain 'depends on BAR' does not
> allow FOO=m with BAR=n.

Of course, that makes perfect sense. Thank you, Arnd!

- Julian Braha
