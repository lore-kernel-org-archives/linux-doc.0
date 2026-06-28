Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ABDF31A065
	for <linux-doc@vger.kernel.org>; Sun, 28 Jun 2026 19:21:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782674472; cv=none; b=rYob75BkO0QnXcArTuhe/6B4o/a8rDx3Sn/gHNrK09jva1G9S0zfvzHBCKlp9hjmTm0HppyMRPBHU8QnK/dFziyk0uhrPWtbAAm/dyLanKK/rYVP/EQYGmAUk91JVlyjVNQzUcBt6ay1hwSERyazIfvnU2g+rZBEVGc6iMtrXdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782674472; c=relaxed/simple;
	bh=WemZFKGQNzUQjFtR/GuiIm0PbNiG5Vr7xD+zliPgDkc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VvT4kfiv63z+xo1KxuOOCBaXL3LUuw2CizDEeqGmPi8WiXCIRi5P9jREO25ef4aKrUuyYRtQnJsNGpATVo9H/QG2ocKxsMBK+gSGGKeS5gnvVCwkC77a4RaOAExu96fLG4y52ct/x4mkCvOgcs2erbbYioJ7i0HgkeCab5MPgek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=bl/SerZj; arc=none smtp.client-ip=209.85.219.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="bl/SerZj"
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-8f0079614b2so4152916d6.1
        for <linux-doc@vger.kernel.org>; Sun, 28 Jun 2026 12:21:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1782674470; x=1783279270; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=B3nWEDPzWp1hYdBxyiC5oBoK1fd906Y6w7ZmA+S9t/o=;
        b=bl/SerZjZL2mGEx7l3As7519OYBCc9mR0rUwOvn+Y6DRdZNqL8Qmp+NsmdwaJe0zKW
         10EQpUpu2cFyVMm4JuK+MicZwyK128CTyhJbX6amuFBPL5qFgaHEXVuj+CeR/i8GA1tM
         a76Bsar39cL6RwQ8Z6CPSN8bKNEGyqRGquQlo1iSIpoHCWhzn7YL17dm6hw22jOT0GRC
         sZ0g4oC9rjHk0PAUS43hYqxeudYV2kToyIqniJU1CgIG+sbt2bmjf3bvaut2BG1TNOJh
         3qgKow6jsYnnlDAifyUWrmunOEz2CAuo9hE5JFFP6ZCc11VYtAALdKLOLv8rYSfZv6Lg
         AA3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782674470; x=1783279270;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=B3nWEDPzWp1hYdBxyiC5oBoK1fd906Y6w7ZmA+S9t/o=;
        b=Rmj3EqtHWsI1+k6LIdB98qHGY2eVHafHYikwxpjG9eGIs36GcSkAvangKLGVZiG4qp
         TlJMWTeMyZY+3LmYT+kqw3T6xtB/crQkfVa4O1PTHJnllL+/rHXAh9mu6PwHfspAOFz5
         s0VO1+p3FWocaaxLYoWFb+J1wL2atkSWKMwzbIIx8vM9GYmaudBF5nOoybulPwqdMtVq
         kuAefZDmEZYZ33rhf4x91z5KPD2oupLdHff9s6ZbU51TyDdSBtdCCscw0s5pDIPoEoBk
         XohgtjaDfLbFzxZzDPdhQHy7QQbXeBk3NhHMxt9j3KlQKPWKPbRJQThqIl27EmfhC/yF
         xlRA==
X-Forwarded-Encrypted: i=1; AHgh+Rq9cAZd0yqZTRMT/TG+u9/ZDw9YYrWi1ucqeDBkUuwNLYvaBnaezjZUN0SFbR3lLr6e8HE6SsUtbPc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwG4Rl65ZdzWDlT2H820FP0xTrpCTvktA+GuTyG4pdCnhxxP+xv
	f9jnPZ5CnV+SLFbiEmS2T8exHwfXR5d94PbUR63PcfMGbmFE2kjh3n9L65L/8FgWew==
X-Gm-Gg: AfdE7ckRqaK0kLqE2MGbqMfI7PosailmM2T3CiiF95bUEYl+loMdTeJBw7teOLuyG4v
	B7zmeTiJIlHwjaU28YwknhvHFJJ9OasA6xJZjVuMZfYz+da6HC+Jx8o2mOMRTNFYFDpS0T44You
	vKshXm57FFn3YDaPm+k/4KsqUyiTiUbPcu3Zjl+jmgbEPF9z5f/TyVD+scFLxiDZRDXtlENuvq/
	2ubJz2rktDwa1OnSHZibxj670n+GpyDAZoNIY+OwB/QWttu7xY5mSSjAU5BhdVAHA8LIvAI6d1v
	8fh5E6fRHtCm6Tq3gWR4ra3fqOifEoP2pPNkdz6ihXEGqq0A5Y3Xv9Ix2ELau2evynr4gn0PWgv
	5TJ1Czg1iH+bcg42kJOrccUbWK2s1eYvLYQJBAQRpgHTbT/4A/xrl+BBrKuOW6HvzrxTaBV3Hs+
	lYbSGBdSgXPkhs6RZmrZNGFpmcKOzpbMNqhvPhYHWpwDo=
X-Received: by 2002:a05:6214:2aac:b0:8e1:8ade:2e9c with SMTP id 6a1803df08f44-8e6d6d608ecmr245875396d6.37.1782674470545;
        Sun, 28 Jun 2026 12:21:10 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210:d62f:1911:f952:16ba])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8f019d47704sm8164636d6.30.2026.06.28.12.21.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 12:21:10 -0700 (PDT)
Date: Sun, 28 Jun 2026 15:21:07 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Nikhil Solanke <nikhilsolanke5@gmail.com>
Cc: linux-usb@vger.kernel.org, gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org, michal.pecio@gmail.com,
	stable@vger.kernel.org, corbet@lwn.net, skhan@linuxfoundation.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v2] usbcore: Add quirk for 255-bytes initial config read
Message-ID: <40d36aa1-4926-4c0a-9511-7e7aa445c65d@rowland.harvard.edu>
References: <20260623161035.5792-1-nikhilsolanke5@gmail.com>
 <567e8866-4308-4e5f-819c-fe778dbf74f8@rowland.harvard.edu>
 <CAFgddhJk0EYG71fnKdio=RHC-cH+JmL-EZ7-oVD-LdHoa2TBSA@mail.gmail.com>
 <5159fd69-dddf-4073-a8e7-95fa77de0b7f@rowland.harvard.edu>
 <CAFgddhJ2HeJ=oTBX_axMJcgJq7GXH9abe+LH+x9NGekGO4BMyw@mail.gmail.com>
 <eb0dfd45-91c5-49ba-a297-b183dbc52c8c@rowland.harvard.edu>
 <CAFgddhLZ9SuOzG_6mW09j9aDkCp6TedpNkzJ6TUD+DnR3TDLKA@mail.gmail.com>
 <02060df3-b8c5-4a86-b3ab-3a28eea8a562@rowland.harvard.edu>
 <CAFgddh+dEgtJf=3rL_48x5aQx7q3FH20CAw-50J32JOJCYdtMQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAFgddh+dEgtJf=3rL_48x5aQx7q3FH20CAw-50J32JOJCYdtMQ@mail.gmail.com>

On Sun, Jun 28, 2026 at 10:01:32PM +0530, Nikhil Solanke wrote:
> On Sun, 28 Jun 2026 at 19:25, Alan Stern <stern@rowland.harvard.edu> wrote:
> >
> > On Sun, Jun 28, 2026 at 11:53:09AM +0530, Nikhil Solanke wrote:
> > > I need some help with the USB_QUIRK_DELAY_INIT part. I can't figure
> > > out how to make it properly work with my patch because of the
> > > following reasons:
> > >
> > > 1. I don't want to move it to the top because, from my pov, there must
> > > have been some reason for placing that quirk where it is now. so i
> > > don't want to mess with it.
> > >
> > > 2. Regarding my idea of adding a condition — so that it doesn't change
> > > the behavior when the quirk isn't set — if the full configuration set
> > > exceeds 255 bytes, we would have to issue a 2nd request. In this case
> > > the existing behavior would be more justified.
> > >
> > > So, I'm a bit confused about how to implement this properly. Adding
> > > yet another condition to fix the second case doesn't feel right to me.
> > > It would look unnecessarily complicated. I would appreciate a bit of
> > > help and advice.
> >
> > If the 255-byte quirk flag isn't set, do the delay before the second
> > transfer just as it is now.
> >
> > If the 255-byte quirk flag is set, do the delay before the first
> > transfer.  If a second transfer is needed, you can do a second delay
> > before it or not -- I suspect it doesn't matter.  If you want to be
> > safe, add the second delay.
> >
> > Alan Stern
> 
> Ok thanks! Just to make sure, because the change I will introduce
> won't affect any existing behavior, these changes (relating to
> DELAY_INIT quirk) won't belong in a new patch, right?

Maybe the best thing to do at this point is to assume that both quirk 
flags will never be set for the same device.  Under that assumption 
there's no need to change the delay code in any way.  Just add a comment 
mentioning this assumption to avoid confusing people in the future.

Alan Stern
