Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793647885;
	b=ShW4Vj8kX6eDZNsi4qTY9HOaavBLRscvCPM+QiRUFS9JfEugkSuJ3vdn7gPk+65bLrJb
	 sRseuQ4P3AZgmDLx2IOj7ya10DgpiB4Pk4N+8dP72mDWqSgmIcKRe5V2P/8jHtvGuKoRZ
	 jbsJAdEhyqTUuoqrlY9C183mT5VRwFfWydAcIVq1MwfkJ4kqy2zOSG3jFk+1yp9xox0A7
	 yFMDqTu9XKX4WoMdEzOoii/BTScbJxyrAhGDQ/c7S+fAvcPIgqQT6f1zb+Sdd0/Ke8Vq2
	 IokuoEmsZ8jWPJpZ7YwF8NJ+Zbpy+laPmhYTurywpCRQvWcx7sSVcb97wboPjpXVjTg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793647885;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=OHQyuYjFQW3W/4xcSdN8/cZTkkVuQVsRMgUqWbu+rsk=;
	b=FZaLW/h+6xQAcINKgpLRICqK7IhUgBNH3dWXSFkgf5YGEptns9n7+tk1dYuK7Kg/xVZL
	 JPCZ015bN/rSxfpvQj+2IuzxjIdEgoYuBAKkExQYq3tlx8Dabkmn39acvC2IGUU/A6yES
	 CH1Sg4XwWCns0fnBMp+UCuQkBP/lrpOfOiwc8gv6lFKVN+qehCKjDyjOdIFFWqprWgjkl
	 ernFE3IGxRHG5rIbhkmmm+R6sbqY4FjjiVG6oFJNwWQsZ1QEvbkKGbiUnngDbZ/aJpFDU
	 ySerYjwTj73eM+R6SUphF13zglrvJY9E0V5AsR4h2/PlHU0FXVagH+HOw17/vxJYAEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=l73LkrQv;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28F5A606A32E
	for <linux-doc@vger.kernel.org>; Mon,  2 Nov 2026 19:31:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 28F5A606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=l73LkrQv
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a4d7ae1ae9so32901175e9.1
        for <linux-doc@vger.kernel.org>; Mon, 02 Nov 2026 11:31:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793647883; x=1794252683; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OHQyuYjFQW3W/4xcSdN8/cZTkkVuQVsRMgUqWbu+rsk=;
        b=l73LkrQvuZciKzRpKr1DfT+CyrRl3sJ4ez5tHIOziCKKoB/NIWjlFJVqceOemEeFiP
         9SZFYkIhtEQg6AQWUQiCd4HhIzPr6VFPJ+5Vbr01oA7qHVtw0gzlRhch5jJkngznqgv8
         Innt0EQ5E4l41nWAGtL3GUUDl0QU0hdckMOYKnucV/07iQswTt6jNpTLvLjxUQxSXrbh
         zYXtDsW1Q2yBmCnUClnpBVLX9t4yeOpGJzwi2YkOZPxnRlK+4t/ju8kpdbOKLVbooiul
         yi8Ys8kz8IYBi/UvG7xllQbO+R2I006wPSIzT6PGGxF8IEz4JS8+g+mktXlAP4+K8h3v
         ldFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793647883; x=1794252683;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OHQyuYjFQW3W/4xcSdN8/cZTkkVuQVsRMgUqWbu+rsk=;
        b=KVrfGab3Kdv0etgld2ZwtFWjtPf+8yxwvSAEUyT+OFa683DYqK4ZaxIu8Z8KoRMzih
         4iml3+oUi4FJ0ZaowdCs/solEqEa7GBGVKelyB8g1zqAoEiMIY6lLvO6gOoMXEslnr5z
         nmAysANOlv278jc23mHgDI5MIkWV/xdpptEcrjcvjFEt3p+0hQbcweOyX5aLMIpM3YZc
         3Fpp2cXdN3BfNVZeT/L5FH8dDltEYTtqlF1EwJHnjMaSR2+K4d+74JQaCXR1rlgywBMH
         nfASvZZRASGvT9dzEudCIH37U/baa580ynrgVuOubYjQzshTMTrJVfJggo85/sBaKq9N
         Hmlw==
X-Forwarded-Encrypted: i=1; AKwUvBzOin710SFlh66aIHYZzGpyDhLHtsX796PX1EYbfSaEer880/vMPWAR8/PoW7Bf2JGohjeeTKGeZ4o=@vger.kernel.org
X-Gm-Message-State: AFq9FYKlbwk9RjxhHbyHlTyBaSuDVb340RXHY7wJgy8gB+QzcGszMahv
	fNS37H8pyUNgApeOYbpGZvBEF65wy5a8Wx7EVfHI1T2PGHTV8SdlkBPG
X-Gm-Gg: AYBFou2iMaIftxmgH6vRao13Q3ExKlwpXNmLc0d6hSsKX21UP/YsnZUgomRAm3MwuZ7
	qcwZM3vD3lg8c9TTnmoBBcOUEnSh7q/w/k+RYUDx6LYO43nS2iCdpCAt+gBdVNlSH8xjIK3gVcK
	QOdDf/WTKQejysLUK10EYwCKeAgylN0i/xCiOMNs7SweZFHnbwcSNkB1XAJFtlDSHv6/R5jQLPE
	BJaSXrLdeHOlcJO/8B0iC55ZL+XEiqkPL3oindTskVM7LdpZwLo1suRKc9kisG60u3eYZJDZv2P
	Mo/ABQP4MbI0/DgsBgT88uAGfggnkrwsksvHLDwNU4WhNerXz7TrJ4f+cQYHb/opH+wOsOXArf1
	Fd3uqP6WmvZK0gnewC5r4HXnmiMBBccvMar7/BxfGrFDeltGAqfKULGz3y3hCVw4nuineCzxKPx
	A+wIPifLN/IrBWFoHY9IuMoxX9E16vaFvcX6vw9XZDK78pBj650zfvPJqJsAoejCo76xm9ELy4G
	TGPBOVRTllZ3XTBlxTMG/xpgtq+a215J+7dsoXd71O+ds2DDDKzi8Uw1pCDEn2YsvNJ4TeW2uhK
	kaHAmPCVvz+6KeYv58i3UDy72ws12ufDyqsMQsdE2Z64rJOZWsBwMbQPcBE46Gxo7r2I916FXLu
	clienBFOgLQ==
X-Received: by 2002:a05:600c:e555:10b0:4b2:61e5:b2f4 with SMTP id 5b1f17b1804b1-4b261e5b38bmr21493425e9.11.1793647883361;
        Mon, 02 Nov 2026 11:31:23 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2a5372d8bsm9940525e9.0.2026.11.02.11.31.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 11:31:22 -0800 (PST)
Date: Mon, 2 Nov 2026 19:31:20 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Jonathan Corbet
 <corbet@lwn.net>, "Rafael J. Wysocki (Intel)" <rafael@kernel.org>, Joe
 Perches <joe@perches.com>, Shuah Khan <skhan@linuxfoundation.org>, Randy
 Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org,
 users@kernel.org, Federico Vaga <federico.vaga@vaga.pv.it>, Akira Yokosawa
 <akiyks@gmail.com>, Carlos Bilbao <carlos.bilbao@kernel.org>, Avadhut Naik
 <avadhut.naik@amd.com>, Alex Shi <alexs@kernel.org>, Yanteng Si
 <si.yanteng@linux.dev>, Dongliang Mu <dzm91@hust.edu.cn>, Chen-Yu Yeh
 <chenyou910331@gmail.com>, Weijie Yuan <wy@wyuan.org>,
 workflows@vger.kernel.org, linux-doc@vger.kernel.org, Petr Pavlu
 <petr.pavlu@suse.com>
Subject: Re: [PATCH v2 0/2] get_maintainer: stop sending every patch to LKML
Message-ID: <20261102193120.4c88f066@pumpkin>
In-Reply-To: <20261102-affable-undetectable-beluga-eded3e@meerkat>
References: <20261020-get-maintainer-the-rest-fallback-v2-0-162aea473488@linuxfoundation.org>
	<20261102093206.50b6c9ad@pumpkin>
	<20261102-smiling-binturong-of-gaiety-f64c1f@meerkat>
	<CAJZ5v0iOJ1r1OvYhV_KJSnHOJL+oVUrbOXizLk0kbGNiep7a6w@mail.gmail.com>
	<87a4nrfgjm.fsf@trenco.lwn.net>
	<20261102150535.6c5689f6@pumpkin>
	<CAMuHMdXe1xxk2ZFJ=yr=7z1DUs3oRNfzHw1Ls1hftcGnmoNwrA@mail.gmail.com>
	<20261102-affable-undetectable-beluga-eded3e@meerkat>
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

On Mon, 2 Nov 2026 12:56:28 -0500
Konstantin Ryabitsev <konstantin@linuxfoundation.org> wrote:

> On Mon, Nov 02, 2026 at 05:24:51PM +0100, Geert Uytterhoeven wrote:
> > > I certainly scan it.
> > > It is also useful to have an archived local copy that can be searched.  
> > 
> > Indeed. Sorry to say that, but Gmail web interface search is still
> > much more effective than lore web interface search.  
> 
> Folks, I don't want this to turn into another thread of "me too" responses.
> 
> Yes, I know that some people still use it for a number of legitimate reasons
> -- but these are few-and-far-between exceptions. I need this change because
> the current status quo is NOT TENABLE. *Everyone's* quality of life is
> affected because Gmail's throttling results in (looks) ~350,000 mails in the
> queue, most of them waiting for Google to graciously allow us to talk to them.

They are actually waiting for gmail to reject them so often they get deleted.
If you try subscribing a gmail address to lkml it really doesn't work very well.
Maybe you get 70% of the emails (hard to say) but they all arrive out of order
and sometimes days late - makes a real mess of patch sets.

More interesting would be not sending any patch emails (and replies to) to
gmail addresses.
That isn't as harsh as unsubscribing gmail addresses and still leaves the
gmail addresses getting any 'admin' messages.

> 
> So, we either unsubscribe all gmail addresses from LKML and prevent them from
> resubscribing, or we do something less drastic and revert it to how it was
> supposed to work in the first place -- only patches without a dedicated list
> end up on LKML.

Then those of us who want to see most emails (or use local filters) will have
to subscribe to all the lists we can think of, and then handle the fact that
we receive multiple copies of emails that get sent to multiple lists.

David

> 
> -K

