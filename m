Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AEDD3A872A
	for <linux-doc@vger.kernel.org>; Sun, 28 Jun 2026 14:50:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782658248; cv=none; b=ivSqPvp2GD91469aalZmvscf+7oyhNIQC64pX6M3dVFjrdoxIWJ5pDewSc7+MPVdoPa9LqCQwCAPaIUeumPvop9XK6yOoA45vEFu/H04zIWYY7TByS/xW5YWbm0ekgCFTLblPUlX5JpogNkOUvcsqA+hmgPL4wUgwj06AprIUrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782658248; c=relaxed/simple;
	bh=4sy1Y4WR9ugVm1F65RWh7OvYWb4yYk3Tn9QjzRV+Rq0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cbVCOi2g2pBbZRP/VXCnH5grLgA1I0YP4hAL/DsmqfOJZLdm7AaCEw4NvRcpPXvUzK6Z/uRcq6tmMbhgJ/BX5yKbsoFjtWO7kG+ECzl+9Ek3JF4Sgip2bvZipI2WRGGaiyg3k+XAf74FzMs3hmiGHeuq3Y5+0uAWY8pvb75vfPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dXqjuEyi; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dXqjuEyi"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-493a287b8c1so4999905e9.0
        for <linux-doc@vger.kernel.org>; Sun, 28 Jun 2026 07:50:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782658246; x=1783263046; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DIbIf43pbwX/hQV/fKrmKMDT2zLMO167rrGvyP3bRww=;
        b=dXqjuEyidrp8mZ7tBLHJkteW8ltO3ZFVT6Z64dVPHZAewV+vI2mrFfevHD/nNjwJK7
         qzvOMwGg172+ZjbOWMJmObKTr5zj4ku3DecV0wl+4jXzqakEqB4HfAuiKv9hy3+a0dvl
         3Wjehu1VSLFFtkR5P3405ewO9UY67z/Qm8wfsIlS1w0QxdeO05z659n2b+A+MEvGhzvd
         rJy/wMxcZjUzZWADTbjaRfJ/tVTT/AiQ4vo7k12RnSaKDyBcRAkEdLzd6UJQ7wcMz4cD
         RJpKEu3KK17Tia8rkPLv2PpZ1D8HvpSZotAPk6ok5+fP2RziW1+/ektnkFK6ga5xE56C
         s5Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782658246; x=1783263046;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DIbIf43pbwX/hQV/fKrmKMDT2zLMO167rrGvyP3bRww=;
        b=QqquCb4D969NTch6PVGklkCJIceZVoZuUz/1ZeLnxEB4lWcWv80D0GfpXkxjaJOXfi
         4v5nHGp+JhGVGgDzWRphv0h4HxudO57qJ4zWwEGVDHPs3GWMsBDS+Nen6IT+tpcZR+gc
         BQmamWC/cayIJWCv8DGx2GyVncbxs0gYYqolJBkMik7lPBYrsEBa8ZHUcQFEnErRl1/I
         EhdVIEWB05SPh8d0CyWJoKKvBNi3PBYIr5Ej9Tp7Jp63rmh3I5QFn/3yXvZEC1QxmFci
         jwZCaX/Bg5Jrd48MQ7fyv2kinip25wlSeP/U/zfEbitp0lteVngT/4w678JxetfsOyLY
         K/fg==
X-Forwarded-Encrypted: i=1; AFNElJ8hMrYEMhCNDcwcnamQ4V2i/vfrdgKhiSVrryhz8WVJ9TrZlWsItEv8tfw1yCUFd01JyUqKbgamvws=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3ST3aLQoDj8HpVEpcRXsnvFQEootgCM1pvpQ0PTkdyXok4Fex
	hAyFdHmL1MkeZK53sbDfvKwUz0H+13b3CBc0DK5sNHejGiaBgFnDb+ZGmWumNw==
X-Gm-Gg: AfdE7cm07JQG3HBlA1WOaqokESvF6HeT/LwQ19o6fwPhCPFPLnynsfLJDbQ67aw4s3P
	j791Ako9ifHAXzY/zytjUYj8j0cT3VUDo7vLxBRczCyNFX1bpvGeJqJ4RCIfGvWwbOJh6x7vdo7
	fTBzH5qRX/c2CErnu89XW5pM6De3Mq9zJvZD12JRVc614gyY1rd81leK+nT2C/RmcmJLgaKSqtk
	zwyDR3XERcoGYYRDIUsQ9ewoqaq6w3Sq3u+V5uiddEzRwX71OLlnzrabXMeG/Ys1aEeasg0pTns
	2i2fYeWq11cPXC29Uo6ejounXfMTqsIj98oDV8W05lCZMkH9TK9O3mizdoXz31apu8EnFGuQg8l
	T/Yn2f+wqC2t5eGZgTiHope9jzTSEefRWIMoTwRLKqhBro4HauB8MfP74F7HTYj2QtGte7iPlMY
	WaI0azJH/SkKYm4ZtcGfuOSOCw
X-Received: by 2002:a05:600c:c4aa:b0:492:3445:ecf8 with SMTP id 5b1f17b1804b1-4926685fe2dmr206794015e9.3.1782658245742;
        Sun, 28 Jun 2026 07:50:45 -0700 (PDT)
Received: from foxbook (bgu190.neoplus.adsl.tpnet.pl. [83.28.84.190])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4926c00a34esm136115845e9.0.2026.06.28.07.50.43
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Sun, 28 Jun 2026 07:50:45 -0700 (PDT)
Date: Sun, 28 Jun 2026 16:50:40 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Nikhil Solanke <nikhilsolanke5@gmail.com>, linux-usb@vger.kernel.org,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, corbet@lwn.net, skhan@linuxfoundation.org,
 linux-doc@vger.kernel.org
Subject: Re: [PATCH v2] usbcore: Add quirk for 255-bytes initial config read
Message-ID: <20260628165040.76fd608d.michal.pecio@gmail.com>
In-Reply-To: <02060df3-b8c5-4a86-b3ab-3a28eea8a562@rowland.harvard.edu>
References: <20260623161035.5792-1-nikhilsolanke5@gmail.com>
	<567e8866-4308-4e5f-819c-fe778dbf74f8@rowland.harvard.edu>
	<CAFgddhJk0EYG71fnKdio=RHC-cH+JmL-EZ7-oVD-LdHoa2TBSA@mail.gmail.com>
	<5159fd69-dddf-4073-a8e7-95fa77de0b7f@rowland.harvard.edu>
	<CAFgddhJ2HeJ=oTBX_axMJcgJq7GXH9abe+LH+x9NGekGO4BMyw@mail.gmail.com>
	<eb0dfd45-91c5-49ba-a297-b183dbc52c8c@rowland.harvard.edu>
	<CAFgddhLZ9SuOzG_6mW09j9aDkCp6TedpNkzJ6TUD+DnR3TDLKA@mail.gmail.com>
	<02060df3-b8c5-4a86-b3ab-3a28eea8a562@rowland.harvard.edu>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sun, 28 Jun 2026 09:55:07 -0400, Alan Stern wrote:
> On Sun, Jun 28, 2026 at 11:53:09AM +0530, Nikhil Solanke wrote:
> > I need some help with the USB_QUIRK_DELAY_INIT part. I can't figure
> > out how to make it properly work with my patch because of the
> > following reasons:
> >=20
> > 1. I don't want to move it to the top because, from my pov, there
> > must have been some reason for placing that quirk where it is now.
> > so i don't want to mess with it.

git blame is your friend:

    The DELAY_INIT quirk only reduces the frequency of enumeration
    failures with the Logitech HD Pro C920 and C930e webcams, but does
    not quite eliminate them. We have found that adding a delay of 100ms
    between the first and second Get Configuration request makes the
    device enumerate perfectly reliable even after several weeks of
    extensive testing. The reasons for that are anyone's guess,

> >=20
> > 2. Regarding my idea of adding a condition =E2=80=94 so that it doesn't
> > change the behavior when the quirk isn't set =E2=80=94 if the full
> > configuration set exceeds 255 bytes, we would have to issue a 2nd
> > request. In this case the existing behavior would be more justified.
> >=20
> > So, I'm a bit confused about how to implement this properly. Adding
> > yet another condition to fix the second case doesn't feel right to
> > me. It would look unnecessarily complicated. I would appreciate a
> > bit of help and advice. =20
>=20
> If the 255-byte quirk flag isn't set, do the delay before the second=20
> transfer just as it is now.
>=20
> If the 255-byte quirk flag is set, do the delay before the first=20
> transfer.  If a second transfer is needed, you can do a second delay=20
> before it or not -- I suspect it doesn't matter.  If you want to be=20
> safe, add the second delay.

How about "keep unrelated changes out of a stable patch", i.e. always
do the delay (if any) after the first request, regardless of size?

Regards,
Michal
