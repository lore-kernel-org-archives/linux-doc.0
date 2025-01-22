Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AE6D214203
	for <linux-doc@vger.kernel.org>; Wed, 22 Jan 2025 16:02:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737561777; cv=none; b=hWUxcb8+9diWdnCzT687MsVtTYxzQLfBldagHPR/WR+VqTnpFUTTFPYs13fwK9QMMBiEreQonSPPlQiBwlus2a7XylgSUXkyJFN15SkqH6ldQHK1VIAqF+bHsVsrkFNS5Ykeoc3cZOY8MZDv2tz7lHtuxEEnOLPU2DmixpxIDzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737561777; c=relaxed/simple;
	bh=PHb2RUHb3MDFea31LbRyjifxWOohtnQRi3JYbd+k3ck=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Lecq+axOYJWOm9WoW6P771x6Kp4bD1tcs/0/qILAWb09idL41tt8UY+Vj7Eq9kNjfeAtKElQGNGLs313zGR1cS2GEJtuVb5pJMuH5moRh2fzjOrDiNfGKPwCN/r6rqFRQvzr3FO2dvzWzgrCkIuWv6vhnCM6/U3H6tWhzsqORn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=hoEeyYDf; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="hoEeyYDf"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-aa68b513abcso1310403266b.0
        for <linux-doc@vger.kernel.org>; Wed, 22 Jan 2025 08:02:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1737561774; x=1738166574; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7XVfZ8qP7TGq4ATVEDhajEHjzB2Q2ePHa/dX3A8HMvg=;
        b=hoEeyYDftu5Ot1eEEpIWkCp7w2k9fZA2WA0qlhJ6quxtTXoMljXeE+jTu9DGiayjbj
         yYq0Aetd0F8qkIkMYFhJW7c9acBFpCTE6ShworFm3z/f7KQjd16jbZspdXwXII8QooHp
         Xthp4KkN6P+YzBSrFQdeyFg7V3e4rpcsvYSVE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737561774; x=1738166574;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7XVfZ8qP7TGq4ATVEDhajEHjzB2Q2ePHa/dX3A8HMvg=;
        b=kKCNnrIjqh6Zn6qpzxcTaEQYrI3rCvg77JgBGhBqX3zKcX6Xq0tcfksiLiquBykT+F
         yoJLfZY/PZl2sw04GMH9U7mKAzIIBvL/8DKLBjtJsTnZfhfV4dl38o0T8PPqPYNdVQj2
         VzvZWwMmJgiBkeWsgbIFeMAzP2MvzN0Rv23IgvtaQVcb2LRZG67F9S5NsQBHAJuaf4Cj
         MMa5gKk389bbGncgRFGIwvhoSNGjsAErpjNxDj/hTQnat/QnARnDDAPXDxm2u9QBtki7
         K0ystdCRo1rv/ywA1QSh0+Rwpq9j+xRsH0qn/I+RnKkAv1SSLFU7HE9mdLBbIB/Fd/cP
         kmLA==
X-Forwarded-Encrypted: i=1; AJvYcCXxqFOFkoP8+Zc0Y2eRR1U1lhzAHEmefRxw6nQTEEUPY6b+nvbV7MYilc4EqIpyQ5EBIymuN4kILZ8=@vger.kernel.org
X-Gm-Message-State: AOJu0YybsGre0YicZbEuvPNQyQGTDuJIWNFPsNbHxqK/DEINL9MJUZmO
	Yj9pmj1aZe8WmMDHfliyGrHKSz32FBwtUX5OS5FnfdIQRj8CeT7i8Z/sG6XWCW/T3+32SPTdD/x
	Q1EA=
X-Gm-Gg: ASbGnctqUTvfe81RG0jSYTpyJIc8qT4bXiJ17Y3m9T+nY0nKBNx2OwCZJvC53cIRGnN
	dvSrKZvA0HlOGKe+A4J2Z1q3qUaDlLsZs2y3MxdpMvPK/bnagawabH+Uv5I4DTMCsGh6osky0Kl
	022Kvl1JXccn4MHKbUxH+MmCzHpJvsRzgulT/B79NDTwfDUUbusddq3o0AxNrXfAA3eIoPol0io
	WcsZBIJhKIe+rBiKc0oxEhS/nrDVGwy7FWyAzYc1HNnxQBJknK30iOBLkcr18780FXQxaHv0hWb
	7XKpFAWcahHu5JhcBE16XYP6yJMq5YxAAiaKlaI1Q1g=
X-Google-Smtp-Source: AGHT+IFVKhxw4LV3WxeclM/iLAMsYrPJSE91pjmimdfWBDoU66A1F0vTAnZe95+WSJXa1m6DUsSz0w==
X-Received: by 2002:a17:906:7d83:b0:ab3:a2f9:d8ca with SMTP id a640c23a62f3a-ab3a2f9ee8cmr1365386366b.43.1737561774069;
        Wed, 22 Jan 2025 08:02:54 -0800 (PST)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com. [209.85.218.47])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab658f9cd4asm101151666b.69.2025.01.22.08.02.52
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jan 2025 08:02:53 -0800 (PST)
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-aaf0f1adef8so1326108766b.3
        for <linux-doc@vger.kernel.org>; Wed, 22 Jan 2025 08:02:52 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXJQkN7gSxTLDOy0EnB/wEnZ5FnMb4wCwFzDBF3rTDexhPtQeHfPOAzgHxJiNiNUCgyI74tym+/5LY=@vger.kernel.org
X-Received: by 2002:a17:907:d1b:b0:aa6:6fa5:65b3 with SMTP id
 a640c23a62f3a-ab38b3c495bmr1954517366b.47.1737561772556; Wed, 22 Jan 2025
 08:02:52 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <87a5bltgf7.fsf@trenco.lwn.net> <CAHk-=whEWhHYkj96zyxoBY81J_afP3tAq==F8+zjRix7hwgvQg@mail.gmail.com>
 <87cygfdk7s.fsf@trenco.lwn.net>
In-Reply-To: <87cygfdk7s.fsf@trenco.lwn.net>
From: Linus Torvalds <torvalds@linuxfoundation.org>
Date: Wed, 22 Jan 2025 08:02:35 -0800
X-Gmail-Original-Message-ID: <CAHk-=wjku9Su_1A0dWYVNkGaLnRgNaf7dijLeL3k1GVbQzCaeQ@mail.gmail.com>
X-Gm-Features: AbW1kvaSOtAMFl9O38NDiQrjd3TTMNOQoVefmMRme0T3w6C3BiRv3cPKHaPeYEE
Message-ID: <CAHk-=wjku9Su_1A0dWYVNkGaLnRgNaf7dijLeL3k1GVbQzCaeQ@mail.gmail.com>
Subject: Re: [GIT PULL] Documentation for 6.14
To: Jonathan Corbet <corbet@lwn.net>
Cc: linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 22 Jan 2025 at 05:58, Jonathan Corbet <corbet@lwn.net> wrote:
>
> I took it because it seemed that consistency in the documentation was
> better than conflicting advice.  If the policy is really "exactly 12
> characters", though, we should probably make it read that way
> instead...?

Well, I don't think it needs to be some hard "exactly 12". At some
point in the future, you *will* get collisions (Konstantin already
created a tree for that exact thing) and git will automatically give
you 13 or more characters.

But I also don't want to encourage people for no good reason to go
overboard, and we end up with extra line noise, and commit ID's that
don't line up nicely etc. The whole "12 characters isn't enough" isn't
actually the real and present problem we have (and there was a whole
long discussion about the things that _are_ problems).

                Linus
