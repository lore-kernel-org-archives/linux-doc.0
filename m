Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DADC644E038
	for <linux-doc@vger.kernel.org>; Mon, 29 Jun 2026 17:01:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782752504; cv=none; b=S2ImTkvviy1/bIg2coWS9IlG8pKu8GJ0DjucXLx/bj8Ha5pdTAfDmNba99X+9iui9azezgJN7k1XA16VzbMXjHEHDiyVS+13Qb7TAEZHnLZwJ2VSjNPLW8VEE/DiolGCIWwilo0XnMSNTxG2tNv19vkBRk5zvxNCpWY9pIpbozw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782752504; c=relaxed/simple;
	bh=0ZbNq3krgb6G8hdaDapKsW5xowxyl35n00VG63vlvsE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H2PZ/BvyLMjMpzOUhtnTuSBqW/QQgl+SnWc6yOx3oD9Ndy5iez6aGnMaOV1SBNpf5eBWQXdtk86Bneum5QQO+wLtMP8KZe2znbv35zN4AxkOJVSSO8DL+twQO0rIah8vM5xiNX4Cqq8673oPf7PvGFS/rUzj8YT/c7eLSUfjpNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=YsFHHwbp; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="YsFHHwbp"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-51a14efe25fso39292831cf.1
        for <linux-doc@vger.kernel.org>; Mon, 29 Jun 2026 10:01:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1782752502; x=1783357302; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YeHN7utODULOILBow3SQ4SKTKi+vOT1iFpqN2h/hBuo=;
        b=YsFHHwbpRsX5WjoNxm3vYRCqhksFNPQnB0Jc2ywinYZG01tXjjJH3fkHn/Div+1sMs
         ZhqEsZ3KP5/hCtwmCB0sggQycScKKihHnrWvN4HLpcOJuNZTlKnq+N2iGObngd0tVmR2
         sNCaSLYR9ResDcJSB9fXvvlTivQR+tJU0vmOPohlYuGpV8zozEEJARYh8Cc8bA0gcbt/
         mPAqGodfzl0Ws6ujYVGVqZHCS1Omy0pqmvxo2PmF2iMoXoZYTgsg4O1eIA98ZRCZYVFz
         SIZNs95vuTXa4A2PxaBZ2HnF6UIEM5kPpV4hO2xHaCIgQsKcJicrKhkSKSda3VKHsaRQ
         GEKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782752502; x=1783357302;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YeHN7utODULOILBow3SQ4SKTKi+vOT1iFpqN2h/hBuo=;
        b=Jj4boDGY6MzJfntB/9p1SWWE+HHXOwJ4/JcSpvngiSUENv5qmt9zwh1TXTRpTRe/Wd
         9ANQC2PG5s5Qg9Okfr/nae9QG2njQAWOkX9rbzeaHpkfD4G91Z9GnrMSufVb0U7MI82c
         PZu9atsr/0TLLhm/Wt8R7fEN1dizt1Wurzg9UjEpNNdNDGjwJhoOh2IkBDHy9M6XYMtB
         bIXK9Kc4+v3yrYOfzVSBR8CHAuHhvidN9q74ZaTURUMunFkhbuDS9PS1d8UYquKSAbp2
         BKsFT/QpQXHD/waoLSFoWH1MovJUyR1lXUDjP2D68H9lFjLyeHRQHt3pTCmzT3zIWFBX
         ++zw==
X-Forwarded-Encrypted: i=1; AFNElJ+wDR/7KNGlYRsGu3yCLYuBe4xnkfKrZPgPSNuSCd53TbFcWoYPVTGWDydVE83J5xgnX1GGKlEXuxc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzge103Q2DqDP7d+cZEyZtJcLIfccv2CakNCZdhNFXr72l5rjOZ
	h9g4kbtMQbkj+kYML5332wYvBuHntKTlTwGpSyzUXT97kpJwzJxxy9RP2Ha4YFm2Hg==
X-Gm-Gg: AfdE7ck450BHmW3sYK6C1eUQOUHUyiYbK195QwxOy5xxBhZTqJVkdlZ4MU0mal06oo2
	Qrd4l1znbJKP6Y3ZpzZ7sDk8x8UL+isHR/YNp+MnuLqCFFuQeIFRs16p27TRFaZTeSeXSaNTnR5
	rXQvetchj7Y+xnbb5Vd2uc2s0TypYUxIKutCAExE7fm8vrM8gQm8cY8v/TLUa9lWaI2ow9VJOwi
	IH8W5Kq938EkxoOLx1/VQo4OLb/TKWmQWcQ71pXJ4jDZQw3Rp+qXBerxTXPU4NNvjKKTitAVVlH
	QLOTgJ+MrifHu4G0EQQAsVJU4011jRI6R1DDvVrB+t14443OkeJoUJXDX29U8BknBG9uAt+eTC+
	KQJsBRxc8Nq3PgUum72me000dkSGIa47/+BWntlbJPD0ZrvQItYqHMIkP3U9FkkVKh2sB37S5BO
	bYlpQ8zNk48+nJVPyIoGBFXB4sLZj05rSR42PsMxJ79q5/QmF4+Z4BMIJk
X-Received: by 2002:a05:622a:551b:b0:517:8446:3afc with SMTP id d75a77b69052e-51c1074e85cmr2361671cf.14.1782752501737;
        Mon, 29 Jun 2026 10:01:41 -0700 (PDT)
Received: from rowland.harvard.edu ([2607:fb60:1011:2006:2008:aeb7:73d7:d8ff])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51c1080d4f4sm881251cf.4.2026.06.29.10.01.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 10:01:41 -0700 (PDT)
Date: Mon, 29 Jun 2026 13:01:38 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Nikhil Solanke <nikhilsolanke5@gmail.com>
Cc: Michal Pecio <michal.pecio@gmail.com>, linux-usb@vger.kernel.org,
	gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org, corbet@lwn.net, skhan@linuxfoundation.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v2] usbcore: Add quirk for 255-bytes initial config read
Message-ID: <e7d49127-0215-4b29-9a2a-e1dc0d889b70@rowland.harvard.edu>
References: <20260623161035.5792-1-nikhilsolanke5@gmail.com>
 <20260628231634.6752f74d.michal.pecio@gmail.com>
 <CAFgddh+AUNH9Ji-Qd=BKEDZWJrzPMWN20-g-htQDPSdSehZStQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFgddh+AUNH9Ji-Qd=BKEDZWJrzPMWN20-g-htQDPSdSehZStQ@mail.gmail.com>

On Mon, Jun 29, 2026 at 11:00:44AM +0530, Nikhil Solanke wrote:
> On that note, I discovered that usb_get_descriptor just blindly trusts
> the caller with the allocation of buf, it never checks if buf is null
> or not. There is only a check for the size. and then there is a
> memset(buf, 0, size). This results in a segfault if buf is NULL and
> size > 0. Perhaps it's time for a new patch to fix this?

There's nothing wrong with trusting the caller to do the right thing.  
Besides, if a segfault does occur then it will be pretty obvious that 
the caller needs to be fixed.

What would you do if buf is NULL?  Return an error code?  That won't 
help anyone locate the bug.  Put an error message in the log?  Segfaults 
are much more visible.

Not to mention that nobody has complained about this code failing, so it 
seems unlikely that buf ever is NULL.

Alan Stern
