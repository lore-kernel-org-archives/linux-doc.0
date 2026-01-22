Received: from mail-dy1-f194.google.com (mail-dy1-f194.google.com [74.125.82.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA30C2BE632
	for <linux-doc@vger.kernel.org>; Thu, 22 Jan 2026 04:07:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769054835; cv=none; b=CfaNnu8oGJnD+elsEq10q+Zr7su4tTTL+XYxxOfRRrvJz397EKmYhbxDnI3WgmRULq31tsNgg3vB6iNFchYK8EIzYDw5rm2i+vERCfP8IiEXI7ImPmtPjmbylhVHmXkiSWTihqjzw7tmf82fHa5xyO7Cst5iaqZbme3C1gLG6/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769054835; c=relaxed/simple;
	bh=pYKf1JAAXvqM1KiJ39QNevMy+s2lzOXg1IsZoMG4W3s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Nag/oEQ039lT21ch9EQad6a4cBnBCVNBUWbg1xtAOM+TVa1ft/up+UmA2QyhZ9JgqYrZKDWXhmlf0qXb2lvKG1XiQNoGAs3Jx2yhT1Jf3BSTZ0f6bkee5jGJ6bC/4WvIDb4HqZK+IWkzqTyFs+xsGNBZFdwpax/SPakaGE31bQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nIJdpQ1H; arc=none smtp.client-ip=74.125.82.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nIJdpQ1H"
Received: by mail-dy1-f194.google.com with SMTP id 5a478bee46e88-2b71320f501so1044946eec.1
        for <linux-doc@vger.kernel.org>; Wed, 21 Jan 2026 20:07:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769054833; x=1769659633; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xWpthCYRiRQKWxKiKOdwOg0cgTv3VLuSBcM5vN1ez5c=;
        b=nIJdpQ1HF5vVCJ/YALlYlinRUiJBT/d+3Ojtex3XwZyGc1S5kV3cZPZs085FKiIa0r
         JwVWCrn5xu9b+vBrsTrwm0UTdEGtqj5P2xoV4X/PkEjS+/oH1bMGPfqbygJFud+4y2MN
         ye4jGeSbTRW7U/RcTBdik5jOzL0hTGbcz38HiTVcmCdzYohGnGU9pFV2qRsovMkQsgl0
         KCE46IQpEdCe9bzN91tTVFUuj5q5kqbXA0cHMIKgeup33xOSYVcKwIe+qWJEq2ejHBIN
         jM8V3SGgTA1CdG+pV9ymNc0DcYE00txsmc0hCB4VF/lTiuyo1nTUstdhgN57g8nOGJqY
         qwjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769054833; x=1769659633;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xWpthCYRiRQKWxKiKOdwOg0cgTv3VLuSBcM5vN1ez5c=;
        b=IRG3OHBdqOolxBNV+Xy/HcCUa4tR8AWbyPivhOEi/y3usAzcByzgVsijomlhEemVQW
         3I+amjGqnWAfWBCVaLOClIFuchg1xA80xiAR3aukkLFU7tPdQS/Z67jTI36KS1w5M4xZ
         xuzbbrEIXz86fC7r8vSYHPQvbOeTjOdI2J7nD7j2kAs2tVvDHOuzcQoycXdbpDHsKBeL
         5/iBf6uSQruKxestmR7mma7tyvi1RxYx5euEDTolDb70ewMmNZ2N9qAb+lhP43NGada+
         9IKQup010gRiuxO7GY3ZdjkgaJTwsEs1nNAxl/uXJ9Ri/JtjfyY4a1cp7D3WDAOenSi2
         6j5Q==
X-Forwarded-Encrypted: i=1; AJvYcCUifWIZhujLYB8fyEUzEHKMlYPVAXNgUWBKeungmqmeGhZOHQ60jp2ngp6lvr2SKqUvaYDPyDbcZD8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6kNs7pst1/1Pp6dQZY/SUczubw0EewMb4jObIBA1NYMu8kY8o
	FMqUPyfVGFE5OnMzeNV2LHGiwKaaWvwDykjMoasVLlMIVq1vuUSGDUo=
X-Gm-Gg: AZuq6aLF5XyAhMceI7kgXayRe/BqkNjaBrDxgeNn3JWtTOrKonYo64XGa+1fVqKjyyF
	m2dm9tYdBCdh9YUShW56eMnI/YXDHcmtJy2u122NEbb1osdrw4w+qWgdE85xrcxLioib1D//7VB
	UVA8rNrcXHXcnrQn9wtP80Y3rqSzESMVqpzw65C5VWrYm6L0iJZo24ebwPd1kH090k2QicEUd87
	zW+bfBplHhQ1Y4NFM814M6UA5TaJ2WeczQ5kU0tty4YDcRk+ahwO2FKDTlMvl8dzuxEsiEXbQsb
	39+qevE3YQvf+my677DEI1Z9fLetMRKhC649xo+ul2Fr3vbLzsrzjNSAF0Kj/zQXJqI8riUg6d9
	xSLuCZ94BlKmfhZqfCKBs/40cFNXDEZHpaPFPv97g+OdlQD7SN4oIZlYf0RFM51I77UBTcSOE5Z
	ozmqwwCG/R95VIjKubro+JwX6+ihDVWOkVcTZ8wBO+iNCd9jdax8LH+dOEmzISECtfcKU+cytRK
	XRhGg==
X-Received: by 2002:a05:7300:a583:b0:2b7:1744:725e with SMTP id 5a478bee46e88-2b7174476e8mr1771856eec.0.1769054832652;
        Wed, 21 Jan 2026 20:07:12 -0800 (PST)
Received: from localhost (c-76-102-12-149.hsd1.ca.comcast.net. [76.102.12.149])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b6b34c0f7fsm24054451eec.3.2026.01.21.20.07.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jan 2026 20:07:12 -0800 (PST)
Date: Wed, 21 Jan 2026 20:07:11 -0800
From: Stanislav Fomichev <stfomichev@gmail.com>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Bobby Eshleman <bobbyeshleman@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
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
Message-ID: <aXGib0OcNdHTLyZN@mini-arch>
References: <20260115-scratch-bobbyeshleman-devmem-tcp-token-upstream-v10-0-686d0af71978@meta.com>
 <20260115-scratch-bobbyeshleman-devmem-tcp-token-upstream-v10-4-686d0af71978@meta.com>
 <20260120163650.5a962648@kernel.org>
 <aXBnqYQdomzH9bT/@devvm11784.nha0.facebook.com>
 <20260121173512.748e2155@kernel.org>
 <aXGNhEKOhkTHbJvw@devvm11784.nha0.facebook.com>
 <20260121185021.446b00e8@kernel.org>
 <CAKB00G2xNvfiV6J3RzKDs=GHMGZ7L16+VKUYLGjpZdOrLnSYKA@mail.gmail.com>
 <20260121194615.33dc0812@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260121194615.33dc0812@kernel.org>

On 01/21, Jakub Kicinski wrote:
> On Wed, 21 Jan 2026 19:25:27 -0800 Bobby Eshleman wrote:
> > > > That is correct, neither is true. If the two sockets share a binding the
> > > > kernel doesn't care which socket received the token or which one
> > > > returned it. No token <> socket association. There is no
> > > > queued-but-not-read race either. If any tokens are not returned, as long
> > > > as all of the binding references are eventually released and all sockets
> > > > that used the binding are closed, then all references will be accounted
> > > > for and everything cleaned up.  
> > >
> > > Naming is hard, but I wonder whether the whole feature wouldn't be
> > > better referred to as something to do with global token accounting
> > > / management? AUTORELEASE makes sense but seems like focusing on one
> > > particular side effect.  
> > 
> > Good point. The only real use case for autorelease=on is for backwards
> > compatibility... so I thought maybe DEVMEM_A_DMABUF_COMPAT_TOKEN
> > or DEVMEM_A_DMABUF_COMPAT_DONTNEED would be clearer?
> 
> Hm. Maybe let's return to naming once we have consensus on the uAPI.
> 
> Does everyone think that pushing this via TCP socket opts still makes
> sense, even tho in practice the TCP socket is just how we find the
> binding?

I'm not a fan of the existing cmsg scheme, but we already have userspace
using it, so getting more performance out of it seems like an easy win?
