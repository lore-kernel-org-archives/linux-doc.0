Received: from mail-yx1-f65.google.com (mail-yx1-f65.google.com [74.125.224.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65E5C41C316
	for <linux-doc@vger.kernel.org>; Wed, 21 Jan 2026 05:44:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768974257; cv=none; b=ujpfHcQWJOco33CXcojFraA+qxnwFCM1WBQJBqFMxMtvGmHMzCteVWiSYcBKx/Zj8XghFWYNqrZ+n28OVdCV0kPGnJG0UMp4fl5Bq0opgY1i7LwH3kSdlTsrzyV62w7erlY7+IWt3+Vvd7kLQ7ez2gK5zIogC+YS+RtcA07Rjjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768974257; c=relaxed/simple;
	bh=cCuhNoXS4wqZqsj/4ZE7U7PQyth2hfbCAfjifFmdGbI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bAPGm4ULI4a0zwPRtY+VfiqzFSresAL0ECbAniXhqRCta/W8sG1s9MQwFPqLHsYdFQub1JB0GyLcMt9u1m6YlT99Zjw5tqpqriy9+JB/iIHWCGerk/C+WBKIN6U5PRlJj9LgJy/r0d8xEVvhwrDCLFC8+ZqkAeYdiutioHPkMMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PYKYkTXV; arc=none smtp.client-ip=74.125.224.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PYKYkTXV"
Received: by mail-yx1-f65.google.com with SMTP id 956f58d0204a3-644715aad1aso745842d50.0
        for <linux-doc@vger.kernel.org>; Tue, 20 Jan 2026 21:44:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768974251; x=1769579051; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MoupjKqNDGOAMGhI8qwEY3FdnLYKFkn3HlTzVq0GQs4=;
        b=PYKYkTXVVq1VPftFvETtr5mYeEShg+MMb1rf49mjquldDupu+J0rYNp5AG4YUt/wnC
         iWTvlbLzNVvicwf/bUvzkFOEpdz8CCymPflmTgxZ6kgQfwNfgIPe9X/hPGzHc3CvPaw4
         cAe2yJ2QKNSuWpyXAs+4SjHIZHpDtDzenYvCoNIODYtw+vS1vYOdqIGfwBhYL3VOT2vq
         qUTVyUL1jzEtC0SGwAXu0tMOV9z1h2q/rVHDBYO4YHeJWrEmVUsMoE/C4BHTmWndQTDz
         pwCtBEsAUmG6rORLtaG+tYFuhJ2GsjUOC81nt7n3NWXP12zx63Pw3pGLF8Ccsf3VW/fV
         YWEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768974251; x=1769579051;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MoupjKqNDGOAMGhI8qwEY3FdnLYKFkn3HlTzVq0GQs4=;
        b=vCanzDHca0pgH3U9ah5hiDExYtxRGQfh4OTfJbYPjHc4lH84azGaMJS4V9SsRxeFyr
         IxcmAOxxWCDnscjpKQXwdES4/uem1O0ufers8yWVHrtuitLwWCM+rm2HGV5XESdDTO/0
         zo65NcOQG54qLWJpaVQ9HRkKR00duZfj4xdP909Vo6bpN+lV9dyf82G9xomPfdfJtNTK
         nYJrQTMZUnAuGvmjBbPVkjnP6hQaut6fy/94yH2PXuHBZJIzwYwXwLUPmwJxLGlKgHSB
         rA/w1YnBRa6npFgNdlf5VpYegTKPks/cIHU5AOhZVyu+f/7MuwFxxaCQbepo+kq6YZMs
         7Ukg==
X-Forwarded-Encrypted: i=1; AJvYcCWLE39L5bmyPemE/oSt9eVefQe+ltD42E3MmZs6BddEExO5tCs8zoPugmIthSaPHfXgVScUxFbzRKI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6/P1xl7wGcVNyEQJ51kkQI8d06mvThK1ET6rRecmPHFNx9Dib
	+oIk3WlokvlrzN0Uq2dbJALZwShfWPBVx3IxzTtNsqm/KDalrhGU/Clf
X-Gm-Gg: AZuq6aKIgyzqGFLple1UZYcdQLwv/LoYxeUd0zrdLoJlz2o3ShLQmURL73wse4PDkfC
	VAMeb006d5LzZewjwA1GBjO5m0qT4l6mZ1HtOA7JYR3OkMW5H58lu7FYe6W+7nyICFkH5zF/krP
	Nkmt5AX2Yz2sbXstI/Ku0jO3PyKivpYOGV78/sU0LJmAowrVUgE8g6aqC9virTAW0Q/XM+I8+jd
	G8A9mRDfvL4ucQ17u1Z2U/INMoBa4T3Z1j+lSg+5Ar0epEtNSkmS2pXtBOVPlONzVzMhlwF/3np
	p2og34SlKa7Vm3WQtnc1zUjSEiLZz1nrX8QE7GDfLhqExDojPZMgPLgaC6c6s1nWrCtLqHV/WYa
	OigWW7ZpPpkMMXL4JCdN8gqrYRQcBhVaoKC2vqHgBS0BizfsqzjCxJFmcSHq3YXyElRCePIW/gc
	JaicgTpRuYsMmBioyyiUK+zcbwxRoVGaT2YKE=
X-Received: by 2002:a05:690e:1907:b0:645:5297:3e5d with SMTP id 956f58d0204a3-6490a6a0761mr15697554d50.46.1768974251183;
        Tue, 20 Jan 2026 21:44:11 -0800 (PST)
Received: from devvm11784.nha0.facebook.com ([2a03:2880:25ff:5d::])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-6493dcbcce6sm1687077d50.24.2026.01.20.21.44.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 21:44:10 -0800 (PST)
Date: Tue, 20 Jan 2026 21:44:09 -0800
From: Bobby Eshleman <bobbyeshleman@gmail.com>
To: Jakub Kicinski <kuba@kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	Willem de Bruijn <willemb@google.com>,
	Neal Cardwell <ncardwell@google.com>,
	David Ahern <dsahern@kernel.org>,
	Mina Almasry <almasrymina@google.com>,
	Arnd Bergmann <arnd@arndb.de>, Jonathan Corbet <corbet@lwn.net>,
	Andrew Lunn <andrew+netdev@lunn.ch>, Shuah Khan <shuah@kernel.org>,
	Donald Hunter <donald.hunter@gmail.com>,
	Stanislav Fomichev <sdf@fomichev.me>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
	asml.silence@gmail.com, matttbe@kernel.org, skhawaja@google.com,
	Bobby Eshleman <bobbyeshleman@meta.com>
Subject: Re: [PATCH net-next v10 4/5] net: devmem: document
 NETDEV_A_DMABUF_AUTORELEASE netlink attribute
Message-ID: <aXBnqYQdomzH9bT/@devvm11784.nha0.facebook.com>
References: <20260115-scratch-bobbyeshleman-devmem-tcp-token-upstream-v10-0-686d0af71978@meta.com>
 <20260115-scratch-bobbyeshleman-devmem-tcp-token-upstream-v10-4-686d0af71978@meta.com>
 <20260120163650.5a962648@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260120163650.5a962648@kernel.org>

On Tue, Jan 20, 2026 at 04:36:50PM -0800, Jakub Kicinski wrote:
> On Thu, 15 Jan 2026 21:02:15 -0800 Bobby Eshleman wrote:
> > +- Once a system-wide autorelease mode is selected (via the first binding),
> > +  all subsequent bindings must use the same mode. Attempts to create bindings
> > +  with a different mode will be rejected with -EBUSY.
> 
> Why?
> 

Originally I was using EINVAL, but when writing the tests I noticed this
might be a confusing case for users to interpret EINVAL (i.e., some
binding possibly made by someone else is in a different mode). I thought
EBUSY could capture the semantic "the system is locked up in a different
mode, try again when it isn't".

I'm not married to it though. Happy to go back to EINVAL or another
errno.

> > +- Applications using manual release mode (autorelease=0) must ensure all tokens
> > +  are returned via SO_DEVMEM_DONTNEED before socket close to avoid resource
> > +  leaks during the lifetime of the dmabuf binding. Tokens not released before
> > +  close() will only be freed when all RX queues are unbound AND all sockets
> > +  that called recvmsg() are closed.
> 
> Could you add a short example on how? by calling shutdown()?

Show an example of the three steps: returning the tokens, unbinding, and closing the
sockets (TCP/NL)?

Best,
Bobby
