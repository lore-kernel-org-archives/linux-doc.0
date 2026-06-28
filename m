Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26D5F25B0B0
	for <linux-doc@vger.kernel.org>; Sun, 28 Jun 2026 16:39:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782664742; cv=pass; b=qlXsqa2HqWNwQC+IpPlcxr4eMFae2UnKzezUsftclX9l2zwfUXdaiMcbTiBz6G1RfahbC3B7NbemSk6TYzDo3j+nk/VPuECtpLJN5lZ0GFl7wE/VutjpxUcURywiyuC1jjtK6jskkECTHgs4mzw2p4z/eR2kmpQXvS6A0mGYD4I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782664742; c=relaxed/simple;
	bh=oF8AWW5pjpmqFrKuyPZxBk5waRwfJr5BbduDrbPfG8o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OwKC2uqXmrhXV14J2ohCSXBjHMhUjd8BnQUngPfrwXAbSoWPWaasTGQoCAi0Mahi2m+OygMuemLEaXLWGe5MFNtDDHBFyjYa0rUOaT60rbJqFSttZ2MCbYs1cE+p7dmjy6x23uFSeX4C9WJOb4P6hpUwJtHFaMsRiMg9theXPbM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bKur+EGk; arc=pass smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bKur+EGk"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c125c082ee2so36991566b.0
        for <linux-doc@vger.kernel.org>; Sun, 28 Jun 2026 09:39:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782664740; cv=none;
        d=google.com; s=arc-20260327;
        b=XB5TpeCzPlN/4eYF8ILnBeMAlu1rFW7Lndj+ODezv85pgZuuuuBxuNiM8iyW1XfSb2
         jZT+V0X2vx3/bO5/p3q9X9kPmPfD23kX1Ymll2Q0174uWGgC2WNsQoiSiR1diruvJBQA
         uwRVafrRHM3xNWsLd5nXrGLNRqPDj3E4uXkGs9FQaVI8bxYWHuxlrLBfZjESi41yuGtn
         BlGj2WkwSuScy5pwj6tHe/BcvdPsFf1GjA1BbJjNTwhYJc6PtsY0zzMz/sykYPkjtMgs
         cF5T1Q75x9e8uh4tvJMV3NaSsUqhcsDwyVccCVeBo58bBtSYkO99tazVr14E8G2yDsW3
         Ul/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=oF8AWW5pjpmqFrKuyPZxBk5waRwfJr5BbduDrbPfG8o=;
        fh=0UUrvKsN2sqSOBRH/yWw4Pn/8/7na2RnEIMqV5f77SQ=;
        b=Wj9K14VAGnfnsPldVkOqJ45/WNHKprji1zWdPkvN2q9hlEjp9NJZtKgtow12TsbHX3
         SC+yCzKqGF3o5bP7eAoNhabhkDc+mAeZQclUaND6wthKUfnfCLKmjSVK0x18proJnp3R
         0kpwG8dszmJtT9P/Lb3QpC6mqPcqMLRNZ07z08QBt8SBl19GQZeMQ8ZlXPsKQEc3R+Rn
         u3HrZUIiGH//ATysk8kHm7gJW2Fl0P+yiYH/0rzty5z5UYKyvlfsWWZgnWIBOtfuWHSq
         +SDgIyZtqSGDbnYwyrEmehiICBCNgfa88k4MJp/kxYR8ftBs4mZ7z+F//5YRTaEXZwtV
         M1YQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782664740; x=1783269540; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=oF8AWW5pjpmqFrKuyPZxBk5waRwfJr5BbduDrbPfG8o=;
        b=bKur+EGkofcnljX3bv3FP201GzxrkWvwtLw184et3muuSdKWEJYOwb/GW7ZoOw2q7q
         tCLYYPzZzruIbaz5+492nXo+JiBLwlMGs9jMVsJ7pN0v9K+iiai18TrN9XOeCiMgrFE2
         vq/bWtGLPf6gnD8Hi0Zd8TzMaAV71DDxOS5Rdom88wyd9E5VHyi19+aBhoIADgZMpCQ8
         /WhnOyOo3cnlIifBpaY6igj+jl/kuv956ZQUGEVmHhI71r7HGihzzmlHbZYo5TrBBZE4
         AKvC6I7ju1l+r1f5p6Mm+qzbBP1x1Sd4LxYcAE0dHZEIBBe/u++QwYYQ5rfjPMMSSEnr
         N2Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782664740; x=1783269540;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oF8AWW5pjpmqFrKuyPZxBk5waRwfJr5BbduDrbPfG8o=;
        b=lchbUELAB9EKjuhoQWYhbh6FUtOrsT1NC5eY3RMzq2bb9lw/1a/1iA/ij35NVbqdgn
         O0YV+25/K0//GZryN2273p4F93bVa1sEIRX4/2aV+9dx0gX8tRaCdpBQ82YLzfPH/KAM
         DHazxqJdvPdtDCr8bwKO+3nN85LAiku89lX6pjAXN0xt/e0erWC01GdmWiUEEmf0TngD
         IfQ5gyHaaWYE+JhZ1vPP5vyDukDl1uEkpd7MtfTIo7XoxOln+HCHEaJQ6Kb7PhssU00q
         jUGKt4CLIVpaYihDhP83rkNZrMoFL8EC0OsFWXoT8obdRpzTD/j6tTXgUt4Yl/KBUgTo
         WhAg==
X-Forwarded-Encrypted: i=1; AHgh+RpNsImP4zs8Ix9zljZ/qreN2HeVkv6iXNE9MYfDf4+nMzw0LhWLdc2AkE8QJI4NS5/fhhGnOcxtE7o=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyt4AnI/Ke9CFi+80R/H7pc7qaryVqM+Q2CaW+/JKTy7aN2A3sH
	oPP182BLAAuZpZMkQiHiJ4skuUlJ/DhhZbIhShCZLXf+w3h3VjEdQbSnlv3OM7O09ktwSgs5tvL
	gJQedjJNKrb1YIBTXVe5/u9KYlb7Ka+E=
X-Gm-Gg: AfdE7cnW+AbyuvBjJOdw08nDlWFPO1hRlSXOjpjyafh/Ty2obRjJASqswE7lbNWbqhF
	W3OcNN87xkWmFyEuMntV2qInJpmxCSO7q7N9LnJxm5BClK84A4mB6lhLIVqYuA2K14/ujSTRWzC
	xCkIDf1P/L77Pt1phJRYD248DaLFgH/PAuyK3S2yrGSM0SSFe7/kTwTJ0xDA7ee1mqwQ9Xc7oRz
	2jrQyaCkoSSP1V4j5D5MFMcjbxlvUMwWbS9nfzuq1s5XJiAWLMuOQfStCpQo0oBrJLnv3VNHR4o
	nGy6Kao=
X-Received: by 2002:a17:906:c156:b0:c12:3c96:838 with SMTP id
 a640c23a62f3a-c123c961142mr249845666b.4.1782664739321; Sun, 28 Jun 2026
 09:38:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260623161035.5792-1-nikhilsolanke5@gmail.com>
 <567e8866-4308-4e5f-819c-fe778dbf74f8@rowland.harvard.edu>
 <CAFgddhJk0EYG71fnKdio=RHC-cH+JmL-EZ7-oVD-LdHoa2TBSA@mail.gmail.com>
 <5159fd69-dddf-4073-a8e7-95fa77de0b7f@rowland.harvard.edu>
 <CAFgddhJ2HeJ=oTBX_axMJcgJq7GXH9abe+LH+x9NGekGO4BMyw@mail.gmail.com>
 <eb0dfd45-91c5-49ba-a297-b183dbc52c8c@rowland.harvard.edu>
 <CAFgddhLZ9SuOzG_6mW09j9aDkCp6TedpNkzJ6TUD+DnR3TDLKA@mail.gmail.com>
 <02060df3-b8c5-4a86-b3ab-3a28eea8a562@rowland.harvard.edu> <20260628165040.76fd608d.michal.pecio@gmail.com>
In-Reply-To: <20260628165040.76fd608d.michal.pecio@gmail.com>
From: Nikhil Solanke <nikhilsolanke5@gmail.com>
Date: Sun, 28 Jun 2026 22:08:48 +0530
X-Gm-Features: AVVi8CdB5AnO0mtdmg2yxL9ayYJoS_AHThaWgN_hBet0KNFvHXEcgc-7Urzbs-k
Message-ID: <CAFgddhJehWf5P_=J5pJM9h7MYXxb_qkfNusHW1aJ98wKXh3ZWg@mail.gmail.com>
Subject: Re: [PATCH v2] usbcore: Add quirk for 255-bytes initial config read
To: Michal Pecio <michal.pecio@gmail.com>
Cc: Alan Stern <stern@rowland.harvard.edu>, linux-usb@vger.kernel.org, 
	gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org, corbet@lwn.net, skhan@linuxfoundation.org, 
	linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sun, 28 Jun 2026 at 20:20, Michal Pecio <michal.pecio@gmail.com> wrote:
>
> On Sun, 28 Jun 2026 09:55:07 -0400, Alan Stern wrote:
> > On Sun, Jun 28, 2026 at 11:53:09AM +0530, Nikhil Solanke wrote:
> > > I need some help with the USB_QUIRK_DELAY_INIT part. I can't figure
> > > out how to make it properly work with my patch because of the
> > > following reasons:
> > >
> > > 1. I don't want to move it to the top because, from my pov, there
> > > must have been some reason for placing that quirk where it is now.
> > > so i don't want to mess with it.
>
> git blame is your friend:

I'll keep in mind to use git blame in future. I haven't worked
extensively in a large, collaborative codebase, so using git blame
didn't occur to me in this case. Sorry about that!

Thanks,
Nikhil Solanke
