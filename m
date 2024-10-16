Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EBCC20966C
	for <linux-doc@vger.kernel.org>; Wed, 16 Oct 2024 13:30:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729085410; cv=none; b=tXp/RgIcDeEUWgzsOIHW2IIE/kgyOWcumFVrshPpV9JAaWv58H4afTuTQbNE9x5coZBK/Iot0pxdWla/FCigogo4OydM8zP2giTaTjx/Dnvwe0zHsNfrH9DzLDu5r3suL3A9MIpncFl8u0BLnvKGwL6amiYmTDhrap75yv7AXDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729085410; c=relaxed/simple;
	bh=9e8h8YTSxbZlnoEsQInmYl/8+L7FVJO2gjIYT1N6uBc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H47YlIWQ6xM/HQBwuJkLPpG7TDfyTYEsn83xYErQDwuWJRy0ZSxojUzidsOyy+f/lHamD+S51kYG8mp8DuSkCLAcf2FZsl6emyy15kVmUIRXyYKc9eIsOKhfoOQ99+fDj/ONAR3W3Nkkt37d4b0moLbXYcBsAB7+5jsxeda/EBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WuNviwfz; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WuNviwfz"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a9a0474e70eso559649666b.0
        for <linux-doc@vger.kernel.org>; Wed, 16 Oct 2024 06:30:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729085407; x=1729690207; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Ao59t5O1QyBE9ZTbCp+/84/h0y2L5JOpOVIMa+Mgf5E=;
        b=WuNviwfz1gRPtagpdF0MhB/v/WjcSnStOrOGO7f9qanF0aymUHkeV6r0u30BidSe3q
         Kd1zvvkX7MzL4gFSeBMlNyPf8ginzRmKsc2UxdOttkKdZ8QahexVMaoWy3BybaBYkJUj
         1eey4j/Dtk0+BfXCb5qYD/F/96c2OQFJ9NnBNdV8he8q3yWyd6mstcJUW5uZkUEYYKhd
         l1NZyZDAzW7LmIc32it0sfs4yiwcjfJM9yzMPh4nDksmsVk48UC/BOvyRJpXECnoik9n
         LCodNQGAMP8KhZ0+IoGtcdbsmgvZQL8h/WEV+qpIuWeIzz0xZaAPpG7pUm1AEZpSG2ys
         VqyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729085407; x=1729690207;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ao59t5O1QyBE9ZTbCp+/84/h0y2L5JOpOVIMa+Mgf5E=;
        b=qOo/nIQUtmYUvoW5GE7MPtcKnQhbGjnOPv5NDaq30Sc0YuWInB2SU7XXYS/pCylQJA
         VfT57zRqPbptnrjuoeBMS/EIrEJCK2DWD9+4zEnt+FbV4lj5spFvD6CqPW6Q0hEwQYTB
         3Ee2PJX6IhaTdDHPPCHRPNlOxwd7KPWZaxOZ9xU0dyw/XZdhiu8TfeG3D51ghGPkkU45
         X9CD682S2khFAQylzG+YSpEbdlBvemXMsI5fqNJy0WzCpbaNQLL1d6meWMUfoomoH3ZM
         01Gdo9TySA6oPSKKbCr7lXT5bc/xowRzMBLbzISBjzv6fT2q6EIqfMu1vnHlV0uWDUQy
         zbsw==
X-Forwarded-Encrypted: i=1; AJvYcCX6/5k0NIcwkNG45aNvCMsoNLDX9UdpN7T0i680Z8TyJKeh0f8UR9ZYsMHadzrrgSoqkxuvcbzVyjw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxJVS2hfPQJ+JOrtLZ76HpTaDSFQowVxm4QP/AgSIDQRGY+tWqK
	/r4EECxVJXiM5VX+/rwUpYdDR2p46FwF5+dNxAr+UrZ1crPfq2m0nZPIlhSBv/M=
X-Google-Smtp-Source: AGHT+IGt35vgRrWbivk3146TES2YNJa8U2VU4Ujk8u7PillY1LptcboEXTfbwCeWiP4uTFVrASD/NA==
X-Received: by 2002:a17:907:9727:b0:a99:59c6:3265 with SMTP id a640c23a62f3a-a99e3b20c0bmr1419373166b.9.1729085406838;
        Wed, 16 Oct 2024 06:30:06 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9a298176a6sm187043066b.135.2024.10.16.06.30.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Oct 2024 06:30:06 -0700 (PDT)
Date: Wed, 16 Oct 2024 16:30:02 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Marco Elver <elver@google.com>
Cc: Dongliang Mu <mudongliangabcd@gmail.com>,
	Haoyang Liu <tttturtleruss@hust.edu.cn>,
	Alexander Potapenko <glider@google.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Jonathan Corbet <corbet@lwn.net>,
	hust-os-kernel-patches@googlegroups.com, kasan-dev@googlegroups.com,
	workflows@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs/dev-tools: fix a typo
Message-ID: <c19c79ea-a535-48da-8f13-ae0ff135bbbe@stanley.mountain>
References: <20241015140159.8082-1-tttturtleruss@hust.edu.cn>
 <CAD-N9QWdqPaZSh=Xi_CWcKyNmxCS0WOteAtRvwHLZf16fab3eQ@mail.gmail.com>
 <CANpmjNOg=+Y-E0ozJbOoxOzOcayYnZkC0JGtuz4AOQQNmjSUuQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANpmjNOg=+Y-E0ozJbOoxOzOcayYnZkC0JGtuz4AOQQNmjSUuQ@mail.gmail.com>

On Tue, Oct 15, 2024 at 04:32:27PM +0200, 'Marco Elver' via HUST OS Kernel Contribution wrote:
> On Tue, 15 Oct 2024 at 16:11, Dongliang Mu <mudongliangabcd@gmail.com> wrote:
> >
> > On Tue, Oct 15, 2024 at 10:09 PM Haoyang Liu <tttturtleruss@hust.edu.cn> wrote:
> > >
> > > fix a typo in dev-tools/kmsan.rst
> > >
> > > Signed-off-by: Haoyang Liu <tttturtleruss@hust.edu.cn>
> > > ---
> > >  Documentation/dev-tools/kmsan.rst | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/Documentation/dev-tools/kmsan.rst b/Documentation/dev-tools/kmsan.rst
> > > index 6a48d96c5c85..0dc668b183f6 100644
> > > --- a/Documentation/dev-tools/kmsan.rst
> > > +++ b/Documentation/dev-tools/kmsan.rst
> > > @@ -133,7 +133,7 @@ KMSAN shadow memory
> > >  -------------------
> > >
> > >  KMSAN associates a metadata byte (also called shadow byte) with every byte of
> > > -kernel memory. A bit in the shadow byte is set iff the corresponding bit of the
> > > +kernel memory. A bit in the shadow byte is set if the corresponding bit of the
> >
> > This is not a typo. iff is if and only if
> 
> +1
> 
> https://en.wikipedia.org/wiki/If_and_only_if
> 

Does "iff" really add anything over regular "if"?  I would have thought the
"only if" could be assumed in this case.  Or if it's really necessary then we
could spell it out.

regards,
dan carpenter

