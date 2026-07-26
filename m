Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26FB072630
	for <linux-doc@vger.kernel.org>; Sun, 26 Jul 2026 09:35:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785058532; cv=none; b=E5HYJ0U9PO4qNYRAAu34eZ9f+s3hsk820dQ7qVe8VP53hnO8aPVonlwOx/Rq7FbwSKY2f2pws48yUzj4hJi/VHTnDzILcy60FYuYZMhXpVrHJQk01om6zhZlTNnOQa/Q++eoTHmUzys2RxRL9PP6izWnCkobhOfj103HJMJMIIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785058532; c=relaxed/simple;
	bh=osIqxSzpREQwwNqdzsfh6wX0WhaBOt9J5AsCB1RJCLg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ut6ANmNi/bEv3nrNiIHI7WdHY3dufEIYYoiDL2lSiBi7vhQMTU0F5ddpEuzar7lKXFDCHWJH4vfkOXBqtoeGRjjkF+PIx27Mcx8YKCzVtB57raSrBkd0JZ5qlw8cGfINDIwNklg4XwNsOeqsLIsTObYEqKbeVeoe1xcCAjt+xek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MTO52XiW; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MTO52XiW"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2cace91f112so18978605ad.0
        for <linux-doc@vger.kernel.org>; Sun, 26 Jul 2026 02:35:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785058530; x=1785663330; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=HtVn6jxNpWGeM9YwmMZBp5FlSQkCkfFC6evtPT9+u7M=;
        b=MTO52XiWRKJjREz1ReB+vRk4xhl8dHHhsIbido0ovREgVlvgMlnvibigR6TpjsME0a
         XEBKz9NXip8jgC6CaezpqYbBAtE7U5/0F5OnAJanIBc4fcPHKp1InfU9QplOaVRDfJGR
         dTGAUGZ8aK193pGap5x4/8paBetXav8ziEiiSyfs3m1xIEsVNw0EDBs1mLj4Utl8gHii
         jrY4dAxHEnox1n7WMYnk7EKXzbOaK53UW01EOyUTzeFtq2312bhL/uPlBjJQTYjJEX0g
         iDrsDrXPJV1CihgfR1diZQ6zTK4uXa8WNfsr2k5GkmYU/llHhX7vmcQXMMTi8Z9LdIk3
         dneA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785058530; x=1785663330;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=HtVn6jxNpWGeM9YwmMZBp5FlSQkCkfFC6evtPT9+u7M=;
        b=F7gR/iSn867JPh23+B+MqIFc+O3X/TmwP3ILA760F5Or7XYhNUlreuJUzP1ZX+dgeo
         rRY7lmoQ2gtM4Hg4a8LEGJ7y5kt8rfeMhUdbnHFlYREnV+JO//9ip3IrGBFLnyeoFsW6
         yWHq2jYbCE9hGxHAR1oHQnfIJYz1yOgb5JKnqMPOklq8ffD5QkfG0TiXngDGmpMWBZ75
         gfBsMGYKEV6WGvi0VwdLHmdhDdzHYrCp1Fv7z/MXg9XYYsySyBaD1XCUrtZ59tCra70H
         CQSZ5dafmQn7qVGOklcvn3ZBNLcJKlFXvJGXwFmKyZvoh09oA4qkb05cA8kebRpY3DPv
         7ZAg==
X-Forwarded-Encrypted: i=1; AHgh+RqRXJn8hsKJ3W1UbJJLd4UAYsktwNXX3V1cefqVZzbNLYjZ4JLbgJIgmJHu/Px+H/gJ46i+Nt0/nMw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzAr5gS/4RzprEh3eHI839se7IT5c05KqzomTCw83TI9mZ0sO5P
	lmS4PAB8DvZs1KEg0qZFXmIgGlpHyyurOZuafiDmy24zIAceVcpDhfJM
X-Gm-Gg: AR+sD13p9yccqQeljOwxXlb+FOuYTUvyaMo+rK70NcdQpSt0gcb91sLcFBW2df4W4KW
	cqJRBCFe4b8uJwcEk2UwQTbA1Q5ddCUghO+0r3nCqRTItVJXNw8HmPmr31vYC9V6nFv1cBTbiwd
	gaPw0AtyR0UmDBX1tbBw5m56cxpspOGra9T+IB9sdvpmuhglicr9P25VyaILroRTN4INmcg/WAL
	PueanJzHoU4dCe/9c73tm8xPPrCVi2D4hjw7ZbaC+068fHxBlspiwElzgz81x/08paJuPrE1KF5
	xJGSftpWxCIP6S13RMFf4+tvPECxWl6vl7Lv2bW3Li2twTCg4gaRJpt+a9Ho2Ja4zxfU/Ktpjpi
	5ueYKTKKPROlSK0S5GX7o0oQjtHuF/k5Zdbv1vDcjR+4zch7bOKlmgMrMWL4QR/1RjAhWt0wrTT
	uaYZX1
X-Received: by 2002:a17:903:2f90:b0:2c9:d539:61e7 with SMTP id d9443c01a7336-2cfde7be3f8mr40088325ad.19.1785058530413;
        Sun, 26 Jul 2026 02:35:30 -0700 (PDT)
Received: from localhost ([118.34.230.2])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfde7bbdf6sm18028935ad.52.2026.07.26.02.35.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2026 02:35:30 -0700 (PDT)
Date: Sun, 26 Jul 2026 15:05:28 +0530
From: shaikh kamaluddin <shaikhkamal2012@gmail.com>
To: OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs: filesystems: vfat: fix 'whic' spelling
Message-ID: <amXU4Kkcj7tjh8Jl@acer-nitro-anv15-41>
References: <20260726064948.20557-1-shaikhkamal2012@gmail.com>
 <87qzkqgnj5.fsf@mail.parknet.co.jp>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87qzkqgnj5.fsf@mail.parknet.co.jp>

On Sun, Jul 26, 2026 at 05:31:26PM +0900, OGAWA Hirofumi wrote:
> "shaikh.kamal" <shaikhkamal2012@gmail.com> writes:
> 
> > Fix spelling error reported by codespell: whic -> which.
> > No functional change.
> 
> Acked-by: OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>
> 
> > Signed-off-by: shaikh.kamal <shaikhkamal2012@gmail.com>
> > ---
> >  Documentation/filesystems/vfat.rst | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/Documentation/filesystems/vfat.rst b/Documentation/filesystems/vfat.rst
> > index b289c4449cd0..f408699ce50f 100644
> > --- a/Documentation/filesystems/vfat.rst
> > +++ b/Documentation/filesystems/vfat.rst
> > @@ -361,7 +361,7 @@ the following:
> >  
> >                  <proceeding files...>
> >                  <slot #3, id = 0x43, characters = "h is long">
> > -                <slot #2, id = 0x02, characters = "xtension whic">
> > +                <slot #2, id = 0x02, characters = "xtension which">
> >                  <slot #1, id = 0x01, characters = "My Big File.E">
> >                  <directory entry, name = "MYBIGFIL.EXT">
> 
> -- 
> OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>

Hi,

Please drop this patch — I got it wrong. The "whic" here is
intentional: each LFN slot holds 13 characters, and the word
"which" is deliberately split across slot #2 ("xtension whic")
and slot #3 ("h is long"). The concatenated name is
"My Big File.Extension which is long".

My change makes slot #2 fourteen characters and would render the
example incorrect. Sorry for the noise, and thanks for the ack —
but it shouldn't be applied.

Thanks,
Kamal
