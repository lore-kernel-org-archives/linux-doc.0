Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793639828;
	b=eds58Tj0UgNRWSGuJRHmwNVmuB/m1gGqaCHI1h8CItsh8oT2OFfbfVvr9tfkcLu26M36
	 Qfr0h/7DhxF77z865c8X3Co0NFpr9mF9uqSnJKK8vu2m62fHTkXrFOENceAZXPBnRWuvH
	 aZZ40jLIUZaYgxzE2y8DdRicdOUD1PK/lM1LWK2p3sLUbAOS4ovj6vO7vUEnGAOU3khG9
	 6eknsfXtglE5Vv9jRCIRLBrFduhNM64CIYiHsDIORr1bjKs3IfoARBoBGBAUHKnsNyCki
	 OdHrwTzp4NzEklKo72/MeeDIc2N6Kkvq1nSAxbVOSD7pRjeHy9aA/c89Cau58U9rVVQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793639828;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=SFahV0/vxBo8Msro1Eu75lAzfkd06yG1u2ac/bBpjVI=;
	b=Tuu4GKTsR4DpEeOJzywmaL+zMXAH1fPQEIKqAo76i5jjS/0V7XSanR3wIzDJeuycP2Ri
	 l8yh/QzSKBs9kG30OqDi49eLZdAbx3+wynrTn3yYY9wQQRXNk90ugh//1XS6Mm346iopC
	 6WRHVAXLO5m3abIFmKoWZv3uWSBWzNYMtIolDzXD4tOh84WQCnUd4zxRuWJutmCzXEtfA
	 HU7aquUhU4o6DlUgxXMAykkBajBwFCF5ru4hEJzjyHN9/z4RkxFDYzT/tqAPFqWf3BwTB
	 S8/JvQLUdDt84tlElaYtBBloAjKl2QaBoVV39Ni4ouiYxWmYpOV4mHAzv/tBWwgjbBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=e02g4fCQ;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D44B606B0E1
	for <linux-doc@vger.kernel.org>; Mon,  2 Nov 2026 17:17:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0D44B606B0E1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=e02g4fCQ
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a5087a5348so26565665e9.0
        for <linux-doc@vger.kernel.org>; Mon, 02 Nov 2026 09:17:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793639826; x=1794244626; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SFahV0/vxBo8Msro1Eu75lAzfkd06yG1u2ac/bBpjVI=;
        b=e02g4fCQxkQkLe3YLNorchFbvDGrVQ0zAYrBcmD+d25JC5l7qEzj/rJ0D8uONqKNxM
         QJSm69L+fzTv2M/y9fziOIOboQE22ZPtQRBsCF1qKffVgCSJHI/4BlluDN1l5IKq6zKc
         PNXRebCD6dFkDgbrYg6T6J2CVJyAyvnyBQm080Xvx4AjdUb70jOZGRdDlOkNgWwE9q7q
         v4V00nND/8oh8IV8qrTQMrCqUt1qvBB0oKX8X46dlNNVIz+9SYOSqg8ZB3mv/EAEM+e1
         uhW73RVZEFVYLZh96+R+yN3RgKbI8p8W8QXXq3uXaMVKaa8u0l0XNP3mBKkdWhT7RnRV
         lrTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793639826; x=1794244626;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SFahV0/vxBo8Msro1Eu75lAzfkd06yG1u2ac/bBpjVI=;
        b=x++sgo1Yzt9aEz0il+92AFSA9bhVViHrmsHbezqDJaxGxeOTMUzfvgj7rNX/KgaUde
         k/2UPYY9tzJT1VOql+10l0W6sBMPNeZvco7Z0sRELdiM+Pq6KbkXqW4L6z4/BGnPl5ZI
         gWQHW+nT9NwBChyrRy721tgADbgS9vfSOY7Bg1K0O6RHVUwRd92p8bCwWAAzmvChJhHg
         JKx9snyyc7/fCt223Hq9uhKQ1ycnwTlOBx88Pvb1OeIw/s4hg3OgfOw/LqD7TTjhBqCX
         TeLicBBmt0dHO3oYYsFUabfp58Ek8/Bh7Q53URuz53GKqD0NmnKtp7KEdTGmopITAZXH
         mgLg==
X-Forwarded-Encrypted: i=1; AKwUvBz2WDPbIXhKzQ40ez9zL2Ydpv8DHHVL02QRdqyn7Ep3iKioHqVW/vLbn56BHaPBXtuUdHXiycd434k=@vger.kernel.org
X-Gm-Message-State: AFq9FYJr7bs50M8Dgz1unOQZYXiY6KELsHH1sM6ySi0ui+KbvT1MBpaI
	hHodIe2MoMMJhYoVHFOXRXlhKVYiCXYWlLOBX38VhI6Gx7Sii9cQnSUp
X-Gm-Gg: AYBFou2NFcAQL5SSMsNdsvfZ5hUUvIvjY2CgP3SSNwvkybeEcGdZlOhC9OiZ7/12drB
	DW8c1ON52muhsmo2YZsQIwvpQP8BuZ8N0M/G+2MJVvAfMc1FGqL7Z8CUmOdfvvqupUTrA4PqWc0
	zES8KpXIINFcgRCl/wR213lrHB/Av5iRB7sFWeaGl3Q8WFd1xoGUBFVKZ0fO77zuHky78LtpTCs
	ivXpwotLyVeNuWVQIVvoorCW59WvI5EOunZ9jQfrM3oywg2ktKTgil/ZDWWhiB06Xw73NhHwFyu
	fAELkO9tiNXSoBx1wT9N0GeEOhmAqOks1oZ3SvrhbHF5UMB5Hm6naPhvK2StGhjBaKh31id8UHz
	kmZeIS50xT/zbhbzzoleoP85/XJK9sXmQkh5RrGSsYXykBDb9U1kzc3jtDC3LaKd3Vh7FWL+2Aa
	3D3Kn9O3N76efin2YjbOX4FtHjlG1p7r8ApJj5SEZ1zk+a+ZeA3bjKM1YbHNIawpOEfQbG6EpAk
	VnF91CLdbe22qdHnLHp5JfnTud+ubGb2mQtZkzvZFvCZ2UYy6hwjmsURWGpYHFhePhk7zEzf5iY
	q7m1F5cqxKHrfdqjikQqalYYN4dYpj2/J1c+1cDC9sHMhxlqlwIc9v8j9cTYOfue
X-Received: by 2002:a05:600c:a49:b0:49f:e701:51c8 with SMTP id 5b1f17b1804b1-4ac17ffb2ffmr250686375e9.9.1793639826380;
        Mon, 02 Nov 2026 09:17:06 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2a9fafe08sm1311345e9.3.2026.11.02.09.17.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 09:17:06 -0800 (PST)
Date: Mon, 2 Nov 2026 17:17:04 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Jonathan Corbet <corbet@lwn.net>, "Rafael J. Wysocki (Intel)"
 <rafael@kernel.org>, Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
 Joe Perches <joe@perches.com>, Shuah Khan <skhan@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org,
 users@kernel.org, Federico Vaga <federico.vaga@vaga.pv.it>, Akira Yokosawa
 <akiyks@gmail.com>, Carlos Bilbao <carlos.bilbao@kernel.org>, Avadhut Naik
 <avadhut.naik@amd.com>, Alex Shi <alexs@kernel.org>, Yanteng Si
 <si.yanteng@linux.dev>, Dongliang Mu <dzm91@hust.edu.cn>, Chen-Yu Yeh
 <chenyou910331@gmail.com>, Weijie Yuan <wy@wyuan.org>,
 workflows@vger.kernel.org, linux-doc@vger.kernel.org, Petr Pavlu
 <petr.pavlu@suse.com>
Subject: Re: [PATCH v2 0/2] get_maintainer: stop sending every patch to LKML
Message-ID: <20261102171704.2911cf20@pumpkin>
In-Reply-To: <CAMuHMdXe1xxk2ZFJ=yr=7z1DUs3oRNfzHw1Ls1hftcGnmoNwrA@mail.gmail.com>
References: <20261020-get-maintainer-the-rest-fallback-v2-0-162aea473488@linuxfoundation.org>
	<20261102093206.50b6c9ad@pumpkin>
	<20261102-smiling-binturong-of-gaiety-f64c1f@meerkat>
	<CAJZ5v0iOJ1r1OvYhV_KJSnHOJL+oVUrbOXizLk0kbGNiep7a6w@mail.gmail.com>
	<87a4nrfgjm.fsf@trenco.lwn.net>
	<20261102150535.6c5689f6@pumpkin>
	<CAMuHMdXe1xxk2ZFJ=yr=7z1DUs3oRNfzHw1Ls1hftcGnmoNwrA@mail.gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 2 Nov 2026 17:24:51 +0100
Geert Uytterhoeven <geert@linux-m68k.org> wrote:

> On Mon, 2 Nov 2026 at 16:49, David Laight <david.laight.linux@gmail.com> wrote:
> > On Mon, 02 Nov 2026 07:34:37 -0700
> > Jonathan Corbet <corbet@lwn.net> wrote:  
> > > "Rafael J. Wysocki (Intel)" <rafael@kernel.org> writes:  
> > > > So it occurred to me that it might be actually better to stop sending
> > > > messages directly to LKML subscribers and only make it available for
> > > > download somewhere and as a Lore archive.
> > > >
> > > > Is there really anyone depending on receiving all of the LKML traffic every day?  
> > >
> > > * raises hand
> > >
> > > Some of us crazy people really do depend on it, yes.  
> >
> > I certainly scan it.
> > It is also useful to have an archived local copy that can be searched.  
> 
> Indeed. Sorry to say that, but Gmail web interface search is still
> much more effective than lore web interface search.

You can't possibly look at lkml on any kind of web mail.
Although I have setup an smtp server in the last (20 years ago) I'm back
to the older scheme of doing hourly fetchmail pull from elsewhere.
(and lkml isn't fetched from this gmail address...)
I'm currently using claws as an mua, works moderately well apart from a small
memory leak and its insistence on putting each email in its own file.
But I can (and have) searched for things 'I know are there somewhere' using grep.

David

> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 

