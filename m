Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793662685;
	b=CMESw3w4DqPU3wO6mPN5XHE9/aN7XNeLerlp8Q7lHnloWEPL7KQjSU2nP4KivPIV4GiB
	 scE9mBuiVxFVI9dV5eJT38fxY0hc288wuCC3OcLtXuiOOpg5l3CYlbYlwsx02BezDHZAt
	 sLz/CUad5cA6ha9+c5Z0zDVS4ZPtB+6yT8Icw3J4nQNXFtIzn/0Ekjv/UsVwsNFpnHwsN
	 fBg9l0q8Ucgzvc+2nFCof819TQAcCZckOHWRG34lSjJpK45nxiguRmPGIpHUbN1ShH+Gh
	 9DGv92iocacLk8nfGpzGI3jSVwAwKwz1vbJDquQG6a5x1Z6ywdYx5qmoI9O+b2dZcLg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793662685;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=ajTKbCVfUpvl1PRge5ZE4DWrvmI1TQg3QGvcmd035B4=;
	b=PC3bWG3fCa1jj+btKABg9JNY5bFbJi/UG5jxpCo58HZ1S0xveZN0ggwuiKaTbQPqE9pj
	 Z22+jvnaHGeJgkvj3Ez/6+H/EjEfZqqOf61vnhwm/PkRPGeetX+HIHVg50c33+GRRYeKG
	 8fqp+VU1NsMRsbmL3jGduC0D11ryzn2ly7ROwwAjX/u+Q5q2QkBbJSmafIsN8zt2WQicJ
	 3EvHxDpP/6UWLinSdGiFdPXVU4N3qCTfwrak6B2Oyj9Vi2XZzFmHJ+Nqa765l3qmQarwU
	 YSjyfeLaWGvkhBi35iCWiH9yUeAe14hue8bX0y3YIql+poPxYqiv0AAymp9NvZ1HJ7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eZcRAdFi;
	arc=none smtp.remote-ip=74.125.229.131
Received: from mail-dl2-f3.google.com (mail-dl2-f3.google.com [74.125.229.131])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 323B3606A326
	for <linux-doc@vger.kernel.org>; Mon,  2 Nov 2026 23:38:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 323B3606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eZcRAdFi
Received: by mail-dl2-f3.google.com with SMTP id a92af1059eb24-1afb6473195so704782c88.0
        for <linux-doc@vger.kernel.org>; Mon, 02 Nov 2026 15:38:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793662684; x=1794267484; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ajTKbCVfUpvl1PRge5ZE4DWrvmI1TQg3QGvcmd035B4=;
        b=eZcRAdFir/tOfKhPPQaXb6mUvOPizNEbwDyFtkl3vKeIKU9Co8R0LPR3N7E8YyU+0G
         2EdC+Hi7HYUfRQP/PCKsIm9h8tS8eEbpeWjCtKW5O49DuznCRmny/sHaglVMRcQjk1XW
         wZt8hlBXazvlT3+G+BQ3Bmz9IyCxfZiYOF/RVxubvZmHO0sNkpaX5eNVfAoQpCQUlI5l
         2QeIfN1za7Fyo1Y5LFedwCSm+BskmtaBZmZEv/AWmFxszO3hxsuhm+PC8SWdRra5+cJc
         WZBdVfPBmr8WSta2fMLe085t0LYYVIzsbbeoSfFqPtbxZ27fS5V/opLjzid1gkFKzQ8Y
         foCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793662684; x=1794267484;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ajTKbCVfUpvl1PRge5ZE4DWrvmI1TQg3QGvcmd035B4=;
        b=SxAob6IPXPfc9WrVxWeBKZJALKQUlKq5ZaaCOqoQM5MNhJEVjQgZ4MdXgoylLdUoAh
         d6j6GlODswySjFpBWVTzfTgQVjIXEmE/O2mP4H2E0PLDeEQ7X6QfW4iPzBMWFhsJt95n
         23Kwe6ZN87MkqUURhZ6aCZ5R+cYGC08trPbV/A8tffwE8irTIKi0ugGKQ6C9IitKvqkz
         gk+pWoMonGootCBGDyCMQObXDlH40ADxzcGAhbD9tuCH6iOuOLyz5sdOwM3lHFSZ7Taq
         D12AsULKrj6bJ/JDa2IQgio4mGWbeuWFwFYUqoGa9qsRENhTm9oMjS3ISTt+xgW723/p
         RQcg==
X-Forwarded-Encrypted: i=1; AKwUvBzUACqW1wh1wCSvowc2dLP38vwk6RJx1Bu0doAv5vcf9EaUtMUwr8MtygndmRh+K6Vvh6NuVmHcldI=@vger.kernel.org
X-Gm-Message-State: AFq9FYJd3VORBgSS1jV/28G1isHONDvvSsV7vodmCZhXrpNow4vyt2Aa
	0o+28MYMFPzfmRKR57BHzQUsZvyfr8H2MCpCkAMkpSnyCm0jibcH48mB
X-Gm-Gg: AYBFou1uKodpMnvyXZrcBdcLZwSWslfQHx+gDkCIHsdkE7qlNKsD+ivgQBcVJb3QLfA
	FZBG7fJFJof0Z7MsLfEJQ6nyvGlkfXcPgjjQWvXG9sCwCBeGCNWYFtk9XUKIIxMHDFWzdwrwOWZ
	DreIQunLzGEp2w4JQ7aLZEu0xyUDGnauaoHTrOIji1SJSGusV3kYkVdJCkTME31nFz3MA0sQ8ZI
	nXe+/c2yrfSmhxDlJQ1uDOpAuoADegrKJqoO+IgC6+K7TGZdc5eT7ZpkvVSCCzuO9NW/JwOe9kj
	aHYefh+CXImJUabu6/81ba10uRuQVeQXkrTDp/Q0QCLzHhxeQWUitXP7swlQFKZoKlpghhx5RP5
	E1KV16wFk3ImxjenASOuV1B/61hfTMDmNUMGHP476mxOiPyL4t+t8kjp8B4JyeD+K+RvZ3mYcCc
	suWY9Rh6C6K9Jc4AyUAQn4E4LwH0SG4jMCrMb/eUh/W3oy4PKhsFCWY3bXVLIn4n3hfJ1wcsc30
	FWODkQ9U5jMXUo9plJdlLyoDzx3KqlKZ5A6x9ovQpyGaWL0Kf5rHUg18xJHanust/uEVvo6ZfCr
	itmI+ffZ6K4xHlb3RxokMw==
X-Received: by 2002:a05:7022:68a4:b0:147:8a40:cdf3 with SMTP id a92af1059eb24-1ac5d1d155amr22814754c88.24.1793662684121;
        Mon, 02 Nov 2026 15:38:04 -0800 (PST)
Received: from localhost ([2a03:2880:9ff:60::])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac1a136537sm36897502c88.18.2026.11.02.15.38.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 15:38:03 -0800 (PST)
Date: Mon, 2 Nov 2026 15:23:26 -0800
From: Stanislav Fomichev <sdf.kernel@gmail.com>
To: Mina Almasry <almasrymina@google.com>
Cc: netdev@vger.kernel.org, davem@davemloft.net, edumazet@google.com, 
	kuba@kernel.org, pabeni@redhat.com, andrew+netdev@lunn.ch, edumazet@kernel.org, 
	horms@kernel.org, corbet@lwn.net, skhan@linuxfoundation.org, rdunlap@infradead.org, 
	michael.chan@broadcom.com, pavan.chebbi@broadcom.com, sdf@fomichev.me, 
	bobbyeshleman@meta.com, asml.silence@gmail.com, daniel@iogearbox.net, 
	razor@blackwall.org, leitao@debian.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net-next 2/7] net: devmem: charge the frag length to TX
 skb truesize
Message-ID: <aukaiHZJcYsRCpr0@devvm16445.scu0.facebook.com>
References: <20261102191438.1059771-1-sdf@fomichev.me>
 <20261102191438.1059771-3-sdf@fomichev.me>
 <CAHS8izPefhGytGNeDWZzgZOi=gLeigZ63nFnkq1ERXXGwrNkeg@mail.gmail.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHS8izPefhGytGNeDWZzgZOi=gLeigZ63nFnkq1ERXXGwrNkeg@mail.gmail.com>

On 11/02, Mina Almasry wrote:
> On Mon, Nov 2, 2026 at 11:14 AM Stanislav Fomichev <sdf.kernel@gmail.com> wrote:
> >
> > truesize isn't well defined for devmem TX frags: they point into a
> > dmabuf which stays mapped for the lifetime of the binding, and freeing
> > the skb releases no memory. The charge only feeds sk_sndbuf and TSQ,
> > which limit queued bytes.
> >
> > Charge the frag length instead of PAGE_SIZE:
> > - TCP uncharges in bytes (tcp_trim_head(), tcp_fragment(),
> >   tso_fragment()), so the charge must not be smaller than the frag.
> >   PAGE_SIZE only guarantees that while net_iovs are PAGE_SIZE.
> > - Frags shorter than a page now count their length, not a page.
> >
> 
> I don't know about this patch. The justification reads a bit like.
> "net-iov charging is weird and broken anyway, so we can do whatever we
> want. Charge size instead of PAGE_SIZE for no reason."
> 
> I agree that charging for net-iov is extremely weird. Neither of
> today's net-iov types actually allocates any memory. Of course when I
> was developing the original infra, I took every shortcut I could and
> just charged net-iov as regular memory, but that doesn't mean we can
> do whatever we want.
> 
> I think either:
> 
> 1. say net-iovs are not really occupied memory, so do a global cleanup
> that charges 0 for all net-iovs (optionally making it conditional on
> the net-iov type, so in the future someone can easily add a net-iov
> that actually can be charged)", or
> 2. change the net-iov size to be actually size instead of PAGE_SIZE,
> and keep the current 'we charge net-iovs even though they're not
> really memory', and then this patch makes sense.

SG, let me try to explain it better in the commit msg. I don't think
we can charge 0 because the uncharge path is non-zero. It currently
works ok because skb frag uncharges the small error that can accumulate.
