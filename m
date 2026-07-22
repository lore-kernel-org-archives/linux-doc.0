Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE9CE1DDC35
	for <linux-doc@vger.kernel.org>; Wed, 22 Jul 2026 08:09:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784707775; cv=none; b=nB3daq8EKaNT5DTdDKYjdB6rmVgnybKVe0UZ48RemVLNiUrXo5FQPUM6JpMiS+rsUYW6ROchDhz0rq6ZthhzvG+XOYHuc7oFFdL/71DULJE/X3dVo+pDwMgM6uT94XF7lHyKGwoSlx2vLiJOGZY3G/S+fFlO5RvW2XhUnxn/V6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784707775; c=relaxed/simple;
	bh=yu2Z977Y2S4w7pLWvx2O/Sd/fRiibvucr/nZF3MlpQ0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Rl9aemM4QP/Bq/9cwuv7XglGMF+o2GBJmxMxwM2U06Ifizx1UX0memejOPA48DAHSdmH+yPMNnsRlUOrj1wFiCevlTwTESoNN4J0MT5RNKUiUp5LVGAhGEqENgT8mwdqJRTACR8kk71V5Rjra2sCSFHxgS4I3vGAc31S0/LfH3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=X/LRbbLz; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=RHiDyVWA; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="X/LRbbLz";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="RHiDyVWA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784707772;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KY9sPu/C/THo3xiawdObT/bqV/O7V7jMNcoBv3ENB4Y=;
	b=X/LRbbLzKhCupEk3R12F9ii8jv1KfklXBWyUb1jQlNF45V6ed+xx/B/v1Vde7rLTgBkv1n
	V7Nm1nynNAs86mdy2pDrFejMYaw9JEWdIzj2XbBFeY7B8DtqhzGDNCtSSpMNbe9vRgauW3
	3HZTwc0/28qUPmAbRjgSVyDCAg3s5x4=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-387-IrSHWXCDM62zVp6Twd2ecQ-1; Wed, 22 Jul 2026 04:09:31 -0400
X-MC-Unique: IrSHWXCDM62zVp6Twd2ecQ-1
X-Mimecast-MFC-AGG-ID: IrSHWXCDM62zVp6Twd2ecQ_1784707770
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-49554715277so38687335e9.1
        for <linux-doc@vger.kernel.org>; Wed, 22 Jul 2026 01:09:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1784707770; x=1785312570; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KY9sPu/C/THo3xiawdObT/bqV/O7V7jMNcoBv3ENB4Y=;
        b=RHiDyVWAuN4fzzmprSU8Kqv3e6crSoQ3jO6mIlV9lpGs54Evmyd9DJiKsKk3vs1i09
         +uxOOYLnEydhLhk3dVuCMwfF2KwSaTOxoK1e+G1b9D/OBKQVY93rwjRaadurq2/QKeDR
         MgCCHwh+w85tBG54SniG9zQLw9e4orT1vmi5cPrpkoh69Omkqh6p3MWnrdPlwnOEXi7n
         DFli6fjnGddVpOSpCTLagbDz7OgA3Jz+AUj0ib7MrrbCmXhY0XR7kA8UvJUnCM2eI4Kf
         fxcVLIoXvSXsSg1JLDQ+rPebsnQMKhcO1faPyogvyRh6uhoomnw9KzRaypLIHf1NQz9f
         /eEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784707770; x=1785312570;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KY9sPu/C/THo3xiawdObT/bqV/O7V7jMNcoBv3ENB4Y=;
        b=H7XDoeFtmy4jnKiYNZx5d2+fi+NlyT09Ea96b14U237XIQUf3YIcBKpaa0jCZUcXud
         tA6ojEqGTKCeUVdk7RBY1zPwPa69moQRcscI2k3wm3+HCehuRX9M2MSUfAZ7+HbCi342
         5puJOMbtEmhXJLql6v4fKoBPfExUqS7i+yIWsoDgdk3eNQAFYYTRvI3W5bym0wEa6nEB
         dfd1bsn/HzyUTCspWBqu/YqOoVuAyxbG57og19Ecm5Je/N7WIRuoc8uO3TrGO+J2g3pr
         MvIa4VFLmaE/k/QjC7QWylTmjSaoDh1+cuot0C/Kr16WLY9RW0F5zJVHlMJUGLeHoNhs
         d5fQ==
X-Forwarded-Encrypted: i=1; AHgh+RrPghzn9N/5Tr3QCQ5g41HiHFPTw3wOioT1W9H7omPpeRccE9dE19brA67y8ljuE1x74oPNU1AEcAE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwfERXhxAOinCJy2GKLJ8Mf+kjGTvLrrNS8gVSb3H0pd3LnRv0k
	knNa4Ytxl/omoytaNiw+8tea6uRD9SEMbKZJc6mp8Ww6K0M7NQV25/giYUkfH2u540gP3x7QCJx
	Xn+ZNxIaZKLFAOtGgDThRfGCe6pPZr3Gzd9dmakToh5i5NTPgGCB7aOivmGBtgQ==
X-Gm-Gg: AR+sD11MEygk1OZm7r5EQ2mUexB15c/UMpgulh04GTzeUyZa02y1qGmgiRSx9vNwldE
	YVjOTaFqr4vUCnzokT7h4xfrDvjoUf0kfX4iiyvtTLLbZvGqWYobUWpqfX5D52VkdmOsBu6LvuS
	Zw+GMFed9NYQ4X8CSZuTC4LpqWLOx71qK27mdnzEnBuXBBppd/bdikz1javCLOTHRkRySqIMh+r
	KIcvSSZ4hKikb7hoiMAlaGffaRiP1AnoklsE7RU/1yi690qdsI+ik9fL7UZ1H7+MAc/Nhf07liv
	ofqB54Z+VfwBsbfvKgPAXhSi/vG/bxwfbGcRsEm0VeSFIjDkU2RJV5cKal4ViBsYPbEEz5hdhzL
	J88H5lKuHNaB6MgaUITNvPg==
X-Received: by 2002:a05:600c:6298:b0:493:c182:6b08 with SMTP id 5b1f17b1804b1-4954a5125a0mr259977655e9.36.1784707769966;
        Wed, 22 Jul 2026 01:09:29 -0700 (PDT)
X-Received: by 2002:a05:600c:6298:b0:493:c182:6b08 with SMTP id 5b1f17b1804b1-4954a5125a0mr259976855e9.36.1784707769278;
        Wed, 22 Jul 2026 01:09:29 -0700 (PDT)
Received: from redhat.com (IGLD-80-230-37-66.inter.net.il. [80.230.37.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-495653bfabesm141254965e9.10.2026.07.22.01.09.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 01:09:28 -0700 (PDT)
Date: Wed, 22 Jul 2026 04:09:25 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Simon Schippers <simon.schippers@tu-dortmund.de>
Cc: Jakub Kicinski <kuba@kernel.org>,
	Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
	Jason Wang <jasowangio@gmail.com>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org, Simon Horman <horms@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Tim Gebauer <tim.gebauer@tu-dortmund.de>,
	Brett Sheffield <brett@librecast.net>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net v3] tun/tap & vhost-net: make qdisc backpressure
 opt-in via IFF_BACKPRESSURE
Message-ID: <20260722040722-mutt-send-email-mst@kernel.org>
References: <20260709095511.168235-1-simon.schippers@tu-dortmund.de>
 <20260714092506-mutt-send-email-mst@kernel.org>
 <5016ae84-7049-4a5f-91c9-ba0047b06ee3@tu-dortmund.de>
 <5089fc5e-2fb8-41fb-9aab-42b22cc2c201@tu-dortmund.de>
 <20260721105853-mutt-send-email-mst@kernel.org>
 <20260721100715.5b43412d@kernel.org>
 <20260722020611-mutt-send-email-mst@kernel.org>
 <8814700c-7549-4d12-b657-c990dfeec14f@tu-dortmund.de>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8814700c-7549-4d12-b657-c990dfeec14f@tu-dortmund.de>

On Wed, Jul 22, 2026 at 08:39:38AM +0200, Simon Schippers wrote:
> On 7/22/26 08:07, Michael S. Tsirkin wrote:
> > On Tue, Jul 21, 2026 at 10:07:15AM -0700, Jakub Kicinski wrote:
> >> On Tue, 21 Jul 2026 10:59:52 -0400 Michael S. Tsirkin wrote:
> >>>>> I prefer applying it, but you maintainers must decide that.
> >>>>
> >>>> Hi,
> >>>> just a gentle ping.
> >>>> Has there been any decision on this patch?
> >>>
> >>> Hi netdev maintainers. Given there's a perf regression otherwise,
> >>> we should either take this or revert the original and reapply
> >>> in next.
> >>
> >> Revert, please. We were AFK and are now working thru a backlog
> >> of 1k patches. The new IFF_* flag needs scrutiny we can't afford
> >> at present.
> > 
> > okay. Simon can you post it pls or should I? And once merged post
> > re-apply for next with the flag included?
> > 
> > Thanks!
> >
> 
> Would be great if you could do the revert.
> I don't want to mess it up. :P
> 
> For the re-apply:
> I can post a v13 to net-next soon with the flag included
> into the existing commits.
> Or would you rather take v12 plus this opt-in commit as-is?
> 
> Thanks!

jacub if the revert goes into next what is the process to
target a patch on top of it for net-next? Thanks!

