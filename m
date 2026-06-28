Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AF841EE7B7
	for <linux-doc@vger.kernel.org>; Sun, 28 Jun 2026 16:31:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782664307; cv=pass; b=AF+63cdoMoFt8+YrYgHsVPPpA5SYvA7B+1/98I+TYTFP3szqOOBfvBRbdejt5bA/VCX4ESCgx6BLh6ABr9SzxJkAoFQFT4k9CXo1HiBD56AhaUf9zb8Wzv2svTScWlSHZC0q0iU+61Ay17xoPP6HhzngrNr/S0+Pq4x7N6t9BH4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782664307; c=relaxed/simple;
	bh=5l1bZXAfKUSX0ItYfzxbNxOUmUVQ5YgkicP6K61SLbI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=H+tlbpDM+eXYzA+tUiKXmjRvdJkBIHOAALKG9LuzBO2lxnfGKUFqLVFjmhCAIKH6Cpmsn2Ji8+RMlQvlcE6E9VL0fBZyFB2xKHnbbmDYQiQL4q0suaIyl38X7py8XBOWxpXdFsQcGXB8pIUDW5YqybgLjyGPpz1iDigtuDCOYgQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Bd1f3474; arc=pass smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bd1f3474"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-69857dc1d5eso1011144a12.3
        for <linux-doc@vger.kernel.org>; Sun, 28 Jun 2026 09:31:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782664305; cv=none;
        d=google.com; s=arc-20260327;
        b=LoVek6L9kafg8nf7QvWtoxF+eTvaYKjyKOie3tnYvjKRssv+Quvr9bUNdnHDwxdp0g
         Necqf9weR8rPLkid37yf/xS98ekKptIkYjZx065/u2JO8jXbg/MvuvegXCY6lfnbcLYH
         VfaH3vlVKLxAFMRrLr2AZ82Lu7p30K7hneiltIpO1bkHjeJnGUjBY3nI4vFdiSMTEyOD
         /ZAnj+xEYYdBNCGngyIrO1zP/0jJgnrPkgEaC5EJA3PM5vfvlGqQma2qVQCoZUeFg5ip
         fs/zJum1W/4+hL3UUvq6H7CTlOokgksTq8x/DM8HQrzax4qbYwMFkQWHX90YAsMQKbvW
         IYFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NwIs/NzgKCDhYw7/WT2FuLFglQDbPL5SvJrcFuoFlVM=;
        fh=CvqySUSl6+c7Azj0SBgoK5DiQYsT6QrTcksXrOqZUoQ=;
        b=gMGOXgqF5istg5vdHunKSAXB9A6Uqrj7KumwO5kWP4IaNLRqaBDqq8ZCYadUn4rS/4
         cde46rr0J4t2Lz8/pn/Q7hn0t2bSaqFeFO4akklzvdBJWqF/5xVoMb8maytbEiqHxKRt
         l/ByT5SyXcRkFka0wE45vqmscJDJe5dVsgWrncbGoaaTLKZKUvDv7l1Sg5d/pFfgEf3T
         hNfaJFho/ou+09BayASo+9QI5aXcP+RhY3YIIwHnREvrO3P134PV8dMcl9FJpVhxK9I+
         015iuldHVtjLSuVroXhpmxwzYRKitU8Osdp6W50zNEDv14LFVF3I5Elq/dYoRA2opIT+
         qacg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782664305; x=1783269105; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NwIs/NzgKCDhYw7/WT2FuLFglQDbPL5SvJrcFuoFlVM=;
        b=Bd1f34740muALFdIz0yfIB/KxWR1AnpECIewflPt3T1dsz2t1bLid8NECOx0395x/D
         anFROMa8CLdpUb6n8t84M9iM4mfDZEQwTCICAg/BXfbtUhu0rLIzO7MDY+wpdqAunjRc
         g3zFzoCXBOfV/F5gj8tGIOkYSG8XD0+2e0ttxEi7GeHVea9V8Gi6ugtS+hX0NgOpWhd9
         ueVIdMq+ElqnLmoqbMxL+P3qqvuRon5zvO8PviEwOAg8hn7GUy5AoVolHlOkLCfDN4xM
         eIoBqmkNiHC/1c1Syy0Mx8Y8+WcK9l5vnUqwBsQBtxSSPfgWA2wPAvJ6Hbe/Q2meYg1g
         RFdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782664305; x=1783269105;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NwIs/NzgKCDhYw7/WT2FuLFglQDbPL5SvJrcFuoFlVM=;
        b=NbRcu4woDpsa5iQedEeEdvMtH6GV52EqvABIbi3rfLZ1AF/TQBfs87H5A9q6br8WJO
         gxiGVOav8aXGXlg3jpwUCxf03CiMTDEaBCo8kQl+dkcI0T8P9g3tgeClnxe1O2zNoNYj
         +UjDzhu6WKkqAblcN7uIyn9tgiQ9Luzq2wp+gy9nPsDd6ew8Ub+vWetA69aNgvWAMuLc
         1ozXtxT9EaZHY9/N7kNXg3+2gKpRgLif1qexukt1z4wHKVl1Cm1VuDiBbxcgxkqA7Uxu
         TmXLpEEoLLKS4m5iSstJeCsrxFMbCtDrUXLBLBPhrzPWDWBWgna3dTeT6pixvdtJICZn
         5c4A==
X-Forwarded-Encrypted: i=1; AHgh+RovNJkodAWGqAk8epCbnn6yTa2GAqDhIzaFyxghmMJ+vIIQldxMTdlfvoouka1K/C7r8dAiJOcbzqQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyXU2b1j3Ezw4RWdHj8SGm4OIqXMLhu/pcrrqgga/RAsy6RatAP
	58AoizQO82Ss/vAeyNDQRS5o7qWd0Vqi+oK4kCjygAr8apH8ufq6/tdSVrBs9FOrSU8x7MGC3lT
	VL/2SZq31clrjp03MdqI/WqGzgNmq1wU=
X-Gm-Gg: AfdE7ckPAcd12IHbFxFrZ+N1vb8y7tMzzWd91/ru6JEYKS6LKfCBUqj61XxD+G9g2kE
	MQX8DyrUCDeDXkwD+YI4JIG3MZ7/33dQXcy0TaTdxo1fsIm1tXJwHpPLl2HQ+MFuA4mT2COC1RS
	1rarvcTPAXo5q6UMwdfExoHC8UfIU5MLmDjZpDBqOzzV3StgiV5OLK/rZiUozW/sLDEQ+5I84Nh
	gE+RIWYizOy2VsX2Wsn4PKlp0P+12+ME9lzJIfX0qMihZqV/KG+C7pQvV7ZCMpzSefDfeiF
X-Received: by 2002:a17:907:3c8b:b0:c12:f84:85d4 with SMTP id
 a640c23a62f3a-c120f8487bamr640300966b.24.1782664304274; Sun, 28 Jun 2026
 09:31:44 -0700 (PDT)
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
 <CAFgddhLZ9SuOzG_6mW09j9aDkCp6TedpNkzJ6TUD+DnR3TDLKA@mail.gmail.com> <02060df3-b8c5-4a86-b3ab-3a28eea8a562@rowland.harvard.edu>
In-Reply-To: <02060df3-b8c5-4a86-b3ab-3a28eea8a562@rowland.harvard.edu>
From: Nikhil Solanke <nikhilsolanke5@gmail.com>
Date: Sun, 28 Jun 2026 22:01:32 +0530
X-Gm-Features: AVVi8CciSyj9HcmsKDyCiGg7VrCDEm8PTgxDVOrwRIGUvZ81AFhzla4U4iZ5FyQ
Message-ID: <CAFgddh+dEgtJf=3rL_48x5aQx7q3FH20CAw-50J32JOJCYdtMQ@mail.gmail.com>
Subject: Re: [PATCH v2] usbcore: Add quirk for 255-bytes initial config read
To: Alan Stern <stern@rowland.harvard.edu>
Cc: linux-usb@vger.kernel.org, gregkh@linuxfoundation.org, 
	linux-kernel@vger.kernel.org, michal.pecio@gmail.com, stable@vger.kernel.org, 
	corbet@lwn.net, skhan@linuxfoundation.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, 28 Jun 2026 at 19:25, Alan Stern <stern@rowland.harvard.edu> wrote:
>
> On Sun, Jun 28, 2026 at 11:53:09AM +0530, Nikhil Solanke wrote:
> > I need some help with the USB_QUIRK_DELAY_INIT part. I can't figure
> > out how to make it properly work with my patch because of the
> > following reasons:
> >
> > 1. I don't want to move it to the top because, from my pov, there must
> > have been some reason for placing that quirk where it is now. so i
> > don't want to mess with it.
> >
> > 2. Regarding my idea of adding a condition =E2=80=94 so that it doesn't=
 change
> > the behavior when the quirk isn't set =E2=80=94 if the full configurati=
on set
> > exceeds 255 bytes, we would have to issue a 2nd request. In this case
> > the existing behavior would be more justified.
> >
> > So, I'm a bit confused about how to implement this properly. Adding
> > yet another condition to fix the second case doesn't feel right to me.
> > It would look unnecessarily complicated. I would appreciate a bit of
> > help and advice.
>
> If the 255-byte quirk flag isn't set, do the delay before the second
> transfer just as it is now.
>
> If the 255-byte quirk flag is set, do the delay before the first
> transfer.  If a second transfer is needed, you can do a second delay
> before it or not -- I suspect it doesn't matter.  If you want to be
> safe, add the second delay.
>
> Alan Stern

Ok thanks! Just to make sure, because the change I will introduce
won't affect any existing behavior, these changes (relating to
DELAY_INIT quirk) won't belong in a new patch, right?

Thanks,
Nikhil Solanke
