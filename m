Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93DB03A640F
	for <linux-doc@vger.kernel.org>; Thu, 26 Feb 2026 10:43:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772102612; cv=none; b=f0v4kz9yOccTifBhiwtFgKJxe39DbJ5uOrZJs/gCZ12JMoUpIOL2lulWHIjWSFPm5C7/6HSqREIgl9DMhpitftIUjMiV20qWKQCCcqm1G/G3YCHszcfb/qBJtf4wgNFH0UTvMp3OL1ba6le4cW4VRwWW52b31GluG65AL8sVMKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772102612; c=relaxed/simple;
	bh=RujNMISISbGmip+gsV3i8B5HSZDusgL8kyOq5K5N+GU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TGndsWisi7IUQH9/gS/4uNsDXpYEYFbKr1fwS9VPxOhmqruypcER/HiKCeG4xpIwuPSDrXUHauYvCXXrVY8ph+qxxlr4eiuNCOBVQKCm8Dia0Dy43Zf7izUWA2F19iVpALGcHdk1V5foLAN5fT9TSryTzxjfvQFJ1CdvmY1LGBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CBoQo9jy; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CBoQo9jy"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-43992e3f9b8so707830f8f.3
        for <linux-doc@vger.kernel.org>; Thu, 26 Feb 2026 02:43:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772102609; x=1772707409; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vYnij3WUKIrhr1paKuZQio94gFo5v03yqnu75blnTg4=;
        b=CBoQo9jyM2yTd9XTP3GjFZB0m9pMVVnC2KlMwc2WiZ7WiOUQpGdw7D+lYXneZRk5f0
         wxkMaw4uvOPqZqMYYYOCI1O6ho0Lzzki+UltNWUG86IdXkudyPunvO3pqAQloLHfaovc
         q5HpYO2LLE5fFSqLQqZZNlHAyFhzpF+JaDP87ntt/cmGLiYoPFhzYAPlE3ppb8T2qt9o
         DTDNBtRRk0cRb/d5DGG5ySIr+L5vYHVdZsGJvtlZepby9vw7hPrIi4u/nYQi6o9EvG+F
         4NA36HIucCRbzCPXhgOfULLFLOd/UykxGn9CkyF6MGX64m/7jU/S2vV2d9e4M7JZYMwZ
         UMSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772102609; x=1772707409;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vYnij3WUKIrhr1paKuZQio94gFo5v03yqnu75blnTg4=;
        b=lGTIbuV14FkcxyjaMn3DxLLFSFsC+1bpbB19zCFHhm5NwvmjYwe5lKh0IyWezDO+v9
         OorZLvVeKkIGVxINC19YfVG2pWOR3pDQVxP4pMC+epJH4d1rfbgC6Hg3FMcwVvkD+xTI
         gtg5b0kv6N7DK1bBzhJk7+nYsQxXvJHCEenk/GWcnnS/P0ID2pTtnlemqPD1cOILFodY
         P4RM3s3CHY8zBmXLvdIR40yaMxpTjXTGqRdKXYYPjoelTsyAzKpum/f5ceqNxN0T/ASC
         EBmf9/ZQq/dmp9u+Lxa+a8jdcdLCGtwZqutfZeYPZ7Zf5sUGvVXD6KNkPGmGtKm02oWi
         vDww==
X-Forwarded-Encrypted: i=1; AJvYcCVGTeo0UkFNgJlgiQ2n6KD+chcA242nj247bKw5gipRFcxHLaax/q+FJHWxovaZrSTfAdCutyZ45Vk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxs0vOEUDIyn/S24pzd7POVCvVJ9LUiG/LbGEjrN6IH222Y9yXv
	9/CXVRYRyyyQyAocmXhe444PUqs6jxxFpPn55yh3fv5EK+D9N3h7OWFf
X-Gm-Gg: ATEYQzzUbYRecnNRNqIss+Q9uyNgGUCvptpRqI/+wf5o0FvuABBPCzDN9Qmyeo+BUz9
	+QpD/GPVbN4cgZBADPAL2FV0PDdxf3ogP1H/Rlnqg2epJxJgOuHtGsZxs1YUqYsxU/W3uM9Foq5
	dSegzIffCbsmgmuW7HnGQScqEG6PqJSygyOUwNBSedDjPRGyi4UDmi/3umIZr+wbEPw5CxvTXMD
	xtne5sD6htx8NSxKVvXHV/EwRrqyWjBMPO0elqP5exQfoZIwejeRufNdnmxqDLVYq/KYyXYigxR
	fXBZ2KBvb0gxD2VRcNaLzhnIdli+bUza1rxYIrYSvmNyuet/ARXW3vhF2vIVJ6S5UVRJCGkr/Ut
	iEVz5pfUuLXxzAaG5xQijSPLFGW22CSSUWwnY9wxT6gcIEGrxqLnvK7kBZgJHc395PMrIr1DOOh
	eRg7wEvmpdMKIi8qXxTELvGnKN6FG09puRFahyJa2mDwBp4FRxKzUS9V8W/OaxjlfEmXnEqneA5
	bM+4JB+r3a5Yp1ynRNCnhw=
X-Received: by 2002:a05:6000:25c3:b0:439:704a:9838 with SMTP id ffacd0b85a97d-439942a422fmr6869715f8f.19.1772102608659;
        Thu, 26 Feb 2026 02:43:28 -0800 (PST)
Received: from gandalf.schnuecks.de (p200300c14f1996009e6b00fffe39b8a7.dip0.t-ipconnect.de. [2003:c1:4f19:9600:9e6b:ff:fe39:b8a7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970bf9ff5sm42355609f8f.4.2026.02.26.02.43.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 02:43:27 -0800 (PST)
Received: by gandalf.schnuecks.de (Postfix, from userid 500)
	id 840D52FE34AD; Thu, 26 Feb 2026 11:43:27 +0100 (CET)
Date: Thu, 26 Feb 2026 11:43:27 +0100
From: Simon Baatz <gmbnomis@gmail.com>
To: Matthieu Baerts <matttbe@kernel.org>
Cc: Eric Dumazet <edumazet@google.com>,
	Neal Cardwell <ncardwell@google.com>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	David Ahern <dsahern@kernel.org>,
	Stefano Brivio <sbrivio@redhat.com>, Jon Maloy <jmaloy@redhat.com>,
	Jason Xing <kerneljasonxing@gmail.com>, mfreemon@cloudflare.com,
	Shuah Khan <shuah@kernel.org>,
	Christian Ebner <c.ebner@proxmox.com>, netdev@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH RFC net-next v2 0/5] tcp: RFC 7323-compliant window
 retraction handling
Message-ID: <aaAjz647AueLYvjl@gandalf.schnuecks.de>
References: <20260226-tcp_rfc7323_retract_wnd_rfc-v2-0-aa3f8f9cc639@gmail.com>
 <dffe019f-93be-4fa8-aa29-743450f6c05f@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dffe019f-93be-4fa8-aa29-743450f6c05f@kernel.org>

Hi Matt,

On Thu, Feb 26, 2026 at 09:12:07AM +0100, Matthieu Baerts wrote:
> Hi Simon,
> 
> On 26/02/2026 01:49, Simon Baatz via B4 Relay wrote:
> > this series implements the receiver-side requirements for TCP window
> > retraction as specified in RFC 7323 and adds packetdrill tests to
> > cover the new behavior.
> 
> Thank you for looking at that.

Thank you for chiming in; I know that my comments are somewhat
provocative. :)

> > It addresses a regression with somewhat complex causes; see my message
> > "Re: [regression] [PATCH net-next 7/8] tcp: stronger sk_rcvbuf checks"
> > (https://lkml.kernel.org/netdev/aXaHEk_eRJyhYfyM@gandalf.schnuecks.de/).
> > 
> > Please see the first patch for background and implementation details.
> > 
> > This is an RFC because a few open questions remain:
> 
> (...)
> 
> > - MPTCP seems to modify tp->rcv_wnd of subflows. And the modifications
> >   look odd:
> > 
> >   1. It is updated in the RX path. Since we never advertised that
> >      value, we shouldn't need to update rcv_mwnd_seq.
> 
> FYI, with MPTCP the received windows are shared between subflows. This
> might be surprising, but maintaining per-subflow receive windows could
> end up stalling some subflows while others would not use up their
> window. For more details, please check this section of the RFC:
> 
>   https://datatracker.ietf.org/doc/html/rfc8684#sec_rwin

RFC 8646 has several pointers to RFC 5961 and in section 3.3.5 it
says:

                                                 ... Each of these
   segments will be mapped onto subflows, as long as subflow sequence
   numbers are in the allowed windows for those subflows.  Note that

So, I assume that on sub-flow level we are still supposed to do
the standard TCP sequence acceptability checks with respect to
the advertised window for the subflow.

If so, my concern is that raising rcv_wnd in the RX path means that
we may accept sequence numbers that we never advertised in that
particular subflow.

> 
> >   2. In the TX path, there is:
> >   
> >      tp->rcv_wnd = min_t(u64, win, U32_MAX);
> > 
> >      To me, that looks very wrong and that code might need to be fixed
> >      first.
> The capping is explained because the MPTCP-level ack seq is on 64-bit,
> while the TCP level receive window is on 32-bit.

The issues I see here are:

1. When calculating the usable receive window in TCP, we use 32-bit
   signed arithmetic.
2. The max. window size with window scaling is around 1GB
3. As said, rcv_wnd is used for acceptability checks.  In standard
   TCP we ensure that rcv_wnd is aligned to the window scaling
   factor.

So, I had assumed to see the "reverse" of the current TX raise window
logic in MPTCP: First, calculate the advertised window to put into
the outgoing packet and then update rcv_wnd accordingly.
 
> I hope this helps better understanding these modifications, and
> hopefully not introducing regressions on the MPTCP side :)

Yes, thank you. Regarding regressions, I couldn't agree more.


- Simon
 
-- 
Simon Baatz <gmbnomis@gmail.com>
