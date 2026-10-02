Received: from mail-yx1-f50.google.com (mail-yx1-f50.google.com [74.125.224.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F6201DE8BF
	for <linux-doc@vger.kernel.org>; Fri,  2 Oct 2026 00:16:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790900214; cv=none; b=jEJ5f68LIA4LaOf7vUo+yN3G1Ch5YfLLDw02PUTA43fm81AALQDblA4vvN/cNX2OQ1GOVs1JeIWi6egTqtThFNXHiSj7GdmZeXRMziUxH255/Y/i9TY6AHQF4cb7QbETGzfpY7/eAnoOozXS91RY55zKjQJF/rLGVVPwXv/oAY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790900214; c=relaxed/simple;
	bh=q+6Q4y6H48Avufnw/sWDV+vkmXuakE9O0dv+vfnCP1Q=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=Peedr1jVh2OeUKk5q42QBnR3nBreuCgX/e/B1kzJAhZz6/Ul5axL3kSiwHTdQshGidG6iAcnTsoHaAVYgBc21EN/T04AiY+iyv7yYCKBONhWPlsSVW/JEdT5rMPfq5k4E3VKVPdrs/08+Xmj6NJZiQT5DdKsq+DjN3R7BXRixho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UxdjpzR2; arc=none smtp.client-ip=74.125.224.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UxdjpzR2"
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-66d1447e2b1so783902d50.0
        for <linux-doc@vger.kernel.org>; Thu, 01 Oct 2026 17:16:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790900212; x=1791505012; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=rOgGB5KCdvmsyYEL6jVLup/+Bx353wLBXoi6WGMPE+0=;
        b=UxdjpzR2UzzLpH4PrgCMKqbUj3yzCWVRe2n+6F3CacNyaA86Y/3bRKTVQ0p8btAvFT
         eBVXKiBZT5h0gH0jMpSlRgIbxIFGcEz0IK8VknxwHCxnJPhp2UvMmqg3EIvCYCzKaacL
         OrU1LkKzuuUykcG9q0tzOKYCbg+qJ7SMyHUlBI1/t8rYAJiC5kWiabS34tlwNYH+ol2F
         BVF7XuFslARhm9WWHw2zzb7c0SROzsDcmZ/xlPSpgpZYF1lJnBaDk6dDOimPkfJPJvYy
         efKcCpVIkg7HgvX4yf6ZkgcpPFwGLzuX9SbKknJDXDhvelJIwqJENKnp5CswY49c31wy
         RQqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790900212; x=1791505012;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rOgGB5KCdvmsyYEL6jVLup/+Bx353wLBXoi6WGMPE+0=;
        b=w+pLpOpxQemsvviTDS2BsUOjNXb06Nx6nZVjDCl9ZiumW7e+xPSO6Kw0ZAkSy4ui12
         73ttANQWLU2m/8XRZ8f7tHfenU7K7CJ5gWH8kJTB4OwJRU7eY1xU5KCIV6xwEWV/tsuP
         gYiQnoflQgGHSQJLy8GcSpa6Pflxjm/xPKzrMEhP6+4o81oEDb9oDM6bbhyuizPWlm1o
         skqVUfLQPdG2YMfA4W6P7mQw46hO4KFEhzQK4tExFTj2A6D5cnEVvsc1YDZu503140nk
         aYcp6G0GhNYqMqDlS67G1jMl/XP8PuJ7wOpzokp3xvQzT4SpXFzfp2LIRMkMgXoyM9KH
         NlYA==
X-Forwarded-Encrypted: i=1; AKwUvBzWykiie0dMGlqksHsmI5C4vpKjE8u56oPuprO5X64iVtqltucqeeUPEVM9JPb7j1/cuoa7NKSiM4s=@vger.kernel.org
X-Gm-Message-State: AFq9FYKV3bLnrzgtB3WnFf4VVvUGNCGuzJEFd2xgPr3z1gU3IHC863Jf
	/lE23DwyZl6a/4ZzMLdI6Mjo8iNKFbriu7Zj8jKI3X7nrWzU2mir9E3w
X-Gm-Gg: AYBFou0CeMH8IKtv4Owtpjdct7kAJO6MJvTZcvpdraze9Lw50YFOMzS6uoXlWJ1HDWZ
	cR4lP2GdEsqUoMu4R9ao1q6lzbD253MmYvKJEflgwTYzRgM6mq8wXMe0X3avnmngEKMxGW+fOOr
	wm5EPrGOvB8pCu0PeEqJCUzy9ApCFOJkPPsLsBkPL3yuiyJJdQfZdsVWCFe4JpYu4eg9xFISjqV
	9zSCxfySgWr/fXQYuHFaGVILzhe+/IA95/nWnmEHx4q3lP4y/L8WI7Y/Z2eFmBgjw7Xp2k4kz4Y
	n67TDw101Q4zvyT+Hr+TvA6dxLQzX7ui+9smQbVraEDcrm7s11A+O55/wyvOLRGwY1uZ1cJEeES
	NYWhcsoIFivmowgyxL3MkLuSuRpEk1VbTzpO0Agykn3bdS2pXR+cJTIQrnxFBVYgH3EiNAgbFtE
	5SUUVMs1QR9fzIC2gxm8OxJCHl3fcoA8YK2sT2C27dm1zTvOmFG6no55qhyXyfd8cXY+hmxXdsV
	9Et+lOGTm9qq7MxmUEf8RGkvAwXb4ye5/SBoUITFsIBHBJ4G+i+
X-Received: by 2002:a05:690e:24d1:b0:672:c99f:5f5a with SMTP id 956f58d0204a3-67691115553mr1514703d50.8.1790900212088;
        Thu, 01 Oct 2026 17:16:52 -0700 (PDT)
Received: from gmail.com (111.46.245.35.bc.googleusercontent.com. [35.245.46.111])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8ae33ee086bsm3230397b3.46.2026.10.01.17.16.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 17:16:51 -0700 (PDT)
Date: Thu, 01 Oct 2026 20:16:51 -0400
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
To: Daniel Zahka <daniel.zahka@gmail.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, 
 Shuah Khan <shuah@kernel.org>, 
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>, 
 Simon Horman <horms@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>, 
 Kuniyuki Iwashima <kuniyu@google.com>, 
 Willem de Bruijn <willemb@google.com>
Cc: netdev@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org
Message-ID: <willemdebruijn.kernel.678a05ecc978@gmail.com>
In-Reply-To: <20260930-psp-defeat-v2-1-f266e7447129@gmail.com>
References: <20260930-psp-defeat-v2-0-f266e7447129@gmail.com>
 <20260930-psp-defeat-v2-1-f266e7447129@gmail.com>
Subject: Re: [PATCH net-next v2 1/4] selftests: drv-net: psp: swap closed for
 connected sockets in assoc tests
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 7bit

Daniel Zahka wrote:
> Future work will only allow rx-assoc and tx-assoc to be performed when
> the sock is in TCP_ESTABLISHED state.
> 
> Several assoc_ tests, as well as dev_rotate_spi, test using the rx-assoc
> and tx-assoc uapi calls against sockets in TCP_CLOSE state.
> These tests don't involve sending or receiving data, nor involve looking
> up psp device by dst entry, so using a disposable disconnected socket
> was just a convenience. These can be replaced by a disposable loopback
> socket.
> 
> The loopback sockets are IPv4, where the sockets they replace were
> AF_INET6. This doesn't reduce coverage, since the assoc handlers accept
> any TCP socket and don't look at the address family.
> 
> Some users of rx-assoc and tx-assoc on closed sockets are left if they
> validate errors that are returned before the kernel will check the
> socket for TCP_ESTABLISHED.
> 
> Signed-off-by: Daniel Zahka <daniel.zahka@gmail.com>

Reviewed-by: Willem de Bruijn <willemb@google.com>
