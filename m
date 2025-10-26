Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D3D8256C84
	for <linux-doc@vger.kernel.org>; Sun, 26 Oct 2025 08:50:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761468630; cv=none; b=NQWQWYs6ynR8FKka0+OJPRxN3EyoLfO5HzWrsza3kxGadujpMmBg5D+UmVlMOP17u9YWdNLFAM7xwtPnMfzE75je8jIVjpBTNvslKVWnFD/g40y/0h1j4Zul/EoM3xwt+m0cNubZdxIsx99Ll0Y2fUDsyip/cWqT2tteJeN5cdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761468630; c=relaxed/simple;
	bh=qUv97I7rJ7EfeUfzdIMw6A9QYkrO8FwT2r0vGFlDE0k=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=pahQS9KX3eJ9Fa3t6ObLtPMz0gtZb67b/TRUeBhNJ9Y1mAJZeQwKHdWa4Mdl2uZWNZuIzA0vh65ihhU4g86kl0pMf/Q8KESIK6PQSlVFzSDfrOcGzX1l2B749vY6TEhZDsiBJ+QkiIcqXO7mpMPCdnr5nOFyW496bkWcIgOniOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Mr4GcKvx; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Mr4GcKvx"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-b55517e74e3so3379510a12.2
        for <linux-doc@vger.kernel.org>; Sun, 26 Oct 2025 01:50:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761468628; x=1762073428; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=p4erMBwQ48N3S4QlFMJdE0eCyGlP05V530oLjHStsso=;
        b=Mr4GcKvx/LAtW1SssMM2PWEumNXy4snQNK6JCJ/s7U0old5m/wLeZPPW1WPbLsK2gp
         etP6tLgEBBVptpxrIhVPh82Zxy9YQySOWLLf6ybPoezzda3U/uNiS5FHVjAsd8kNPyh0
         2JK/By4Lhn2mm3+sGD9NQEJieMInCXif/F/QO3GmaIFFvSwItRb6xl+DA1JBqTlKoGwy
         OmMmOon3TlcGxsaqjVCoBWZNe+hutEoCEfv0jvTOQn3iyHQqzPm21rf3smocNxpdFHEw
         DN4S2fzQV75unZHQv4FV2uUoJvJy4MukvhhIddleb9p976y2tzrgIDwWEv3Wslbqf3V2
         MZgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761468628; x=1762073428;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=p4erMBwQ48N3S4QlFMJdE0eCyGlP05V530oLjHStsso=;
        b=LA92Ny3G5v3grT8MQQJYLavqYWdnpvV//M+JH3VCmjktFm0kUh+Tu95KLRKeVvc8uh
         pmbbuLi+RzGMtzNUKmF1rO3k8+qRqBIToMjmxcLPqy0kFq3J+wH3tMAzKRKoh1qS+pdz
         Ud9Pz0pGcIr/VCkmeN4IP91GjJz//BHQD+d7wt05C6tci1IeO/YV2Jod3FxIpbUvL2V/
         Yubf+QE2koqJ8h2AOZbNaAfx0cS85drz9sqKZwKq+ye3p3wD2aEnYO6FOklF7wQWhOgQ
         reQ8ZrXqQjzpLJenUaosC3UgdM7WRc/8NsJUf0fSZxictAmCSIAMn8nhAjAZTbD1xCP5
         0qPw==
X-Forwarded-Encrypted: i=1; AJvYcCVPRcCodXNwQFeYsFObcmXKM62Pzdfn0YT+gQ0tEZZAOEDCcua//XqYO2nPggHZM40XjgnucZwKfMg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzO1Ip3NXhMRmDtjuhNtRrMQti7W+qqnQN0akO1OpabQJtSznxO
	dYuMioV8BeFXG2jf8lLNEB1pQe3M+yNeevu4kurwkQoO/PIncyQyfVyt
X-Gm-Gg: ASbGncsBpNStXLn5ydI4IHWCLM5zc8OSA2lR5UDP9ny/EtrksmBdncTtwgwggyBqeO1
	X/Q0ciILBCrCl+tIfN2b44QIB7Kw43PoiUIVdDUfXrOkHHkQ28y5wESxpOmQ8RBCWfinz5NvqIf
	1/jJFFftm2BYlSE298Wd1xUfeteatw5C5GvLzk6ZZ7GZVHTo0AIKOdiY8xR2yO6MLDX5g7LWO4s
	hsd8F1uydzj3BJEXOCRTEN6Q4PhLbqTr42M54EDhYNz6feHnA7EwBOAvy2QwKDmV7NwWruxRhk5
	UitxU6cSWy51d77SHJHS+5eZYbBseSfZD7ZEt+Gs9WJqfebKR7kgHJW5Vx8vD2AfgKSy+riBYKF
	4M46vySREuNVisw3sKV/0gVz3gf/0mT9I2O0ckCRMT7KWvVR/APLDOoOcwx0pliYr/3wIEZMG3F
	1lf8DnEAx+EX5+sLU=
X-Google-Smtp-Source: AGHT+IF/m6/+800gB7/6liHmYwj+jJvYjxHcXB/tEA5NbSYwquOHX9mUISDWYTYNNgTYOtc6bmcQGg==
X-Received: by 2002:a17:902:f689:b0:294:92be:64d4 with SMTP id d9443c01a7336-29492be682cmr90289775ad.18.1761468628250;
        Sun, 26 Oct 2025 01:50:28 -0700 (PDT)
Received: from [192.168.0.69] ([159.196.5.243])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498d27541sm44678205ad.61.2025.10.26.01.50.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Oct 2025 01:50:27 -0700 (PDT)
Message-ID: <d52862c17afab501453c3fbb5167f78d24b1f807.camel@gmail.com>
Subject: Re: [PATCH net-next v8 1/2] net/tls: support setting the maximum
 payload size
From: Wilfred Mallawa <wilfred.opensource@gmail.com>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Sabrina Dubroca <sd@queasysnail.net>, netdev@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, "David S . Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
 Jonathan Corbet <corbet@lwn.net>,  Simon Horman <horms@kernel.org>, John
 Fastabend <john.fastabend@gmail.com>, Shuah Khan <shuah@kernel.org>
Date: Sun, 26 Oct 2025 18:50:19 +1000
In-Reply-To: <20251024163336.5fba5cd1@kernel.org>
References: <20251022001937.20155-1-wilfred.opensource@gmail.com>
		<20251023184404.4dd617f0@kernel.org>
		<cd557c5b11b04da060f07d3849dc46e7b3625ed1.camel@gmail.com>
	 <20251024163336.5fba5cd1@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-2.fc42) 
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Fri, 2025-10-24 at 16:33 -0700, Jakub Kicinski wrote:
> On Fri, 24 Oct 2025 12:11:11 +1000 Wilfred Mallawa wrote:
> > In the previous record_size_limit approach for TLS 1.3, we need to
> > account for the ContentType byte. Which complicates
> > get/setsockopt()
> > and tls_get_info(), where in setsockopt() for TLS 1.3 we need to
> > subtract 1 to the user provided value and in getsockopt() we need
> > add 1
> > to keep the symmetry between the two (similarly in tls_get_info()).
> > The
> > underlying assumption was that userspace passes up directly what
> > the
> > endpoint specified as the record_size_limit.
> >=20
> > With this approach we don't need to worry about it and we can pass
> > the
> > responsibility to user-space as documented, which I think makes the
> > kernel code simpler.
>=20
> But we haven't managed to avoid that completely:
>=20
> +	if (value < TLS_MIN_RECORD_SIZE_LIM - (tls_13 ? 1 : 0) ||
>=20
> I understand the motivation, the kernel code is indeed simpler.
>=20
> Last night I read the RFC and then this patch, and it took me like
> 10min to get all of it straight in my head. Maybe I was tried but
> I feel like the user space developers will judge us harshly for=20
> the current uAPI.

I am open to reverting this to `record_size_limit` in that case. I
think the only trade off is just a bit more complexity in the kernel
side for the additional checks. Does that sound good to you
Jakub/Sabrina?

Regards,
Wilfred
