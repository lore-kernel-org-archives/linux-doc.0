Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ECD218FDDA
	for <linux-doc@vger.kernel.org>; Thu,  5 Dec 2024 23:18:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733440694; cv=none; b=sn1HHb+nlelvgaBposZQP0NoJeV4f+ePRxJB0lcabU8ySUeBND/gokFV/Lv8NfurVbZ+yZp44y2HJF5D5XyG/bqs6+W6i4/RwN7uUZqIeEnxg+0L2SNcWpyR7rUHV6CQCKMcUZCX8nB/ep0u0LwMOyno/WUOGsSUjijZ8k9+XG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733440694; c=relaxed/simple;
	bh=dVFX0iweJAmgsuLhqVkE2GOMr2kcozOmtW5wiosZ9RA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hSE5pnVmEcRq5EdwdpME0BUR1/Of75+cBMDwBT0ux7hIUEsikETZQS63oT6MRo/kjIuT8SnKHsePBe0rBVXBMsTIOXSTSsXUvKif+bPCK23uJqCQWAfLb/i+w/0H3UH6nZkaJ+XE7pA3hASO8RoXhJoWqsUNhu/ssKDlddLdp1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=h/tHW+FU; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="h/tHW+FU"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5ceb03aadb1so1939268a12.0
        for <linux-doc@vger.kernel.org>; Thu, 05 Dec 2024 15:18:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733440691; x=1734045491; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ABRkDj2N+QkWL48IvhN2/HmURfPPjhYtD6+wjCTrDIo=;
        b=h/tHW+FUgRRL6F7R2AnC/KqM1dywtivCU14ymVfKRGJXl6Oe4jiFCRap4JYs74+yrN
         NAVlnbOsh/TN3JlzpYIlPfEuxNMoUZftCcFT9l52QYoo7z0vERzLjs7rAi0UwxOaEmjn
         ex8ANYYvOGDpQ52YRV+18Wxu4V5/OcJRmtbf8upbCbHSb7E0nau8VRDeE03mLF4fWS1B
         Bchxb+Pi2l2CjaAIFNmdNLK3mfjo5roVvsr3h6BZxOtKALxqmcFmDUurxpq7AqAJ/iQO
         PmKBO64AtnbAIRFmpN13A+7ENZLAllErO647R4bBP2goJUdJ38KRH2g5GdCooqbXKY9y
         thrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733440691; x=1734045491;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ABRkDj2N+QkWL48IvhN2/HmURfPPjhYtD6+wjCTrDIo=;
        b=ZDVGTax4v6y8p9MtKtzSO+McwzCyastXOM0ZG47nscznmFYR7appPRJhna4RZy2W52
         qdJ98edi5jj8c36GRtswrRnfhIF1Y5kkxwzpN5yprAotCSWS79tm1eCRjhz+0gF1bY9f
         WA5B0v9lpMpRg+VJ/0sWSIrvPIdZ5yr1STHKaCs89u1abyn2YWGb7kcKRcOFEdt7MNnv
         3PCioceaYY2ceqzUNuP0xsiUB7Vy8rEiMqC/He8hLa2X3xtjmMRbpOhncg8Uc5rn7ixq
         pNpOCCWHj1/veeenLMzYeYdnthd3Spz0/Zqo83PoHcxrS80fUvCHsRNSoB8ECxf7Otfi
         dWXA==
X-Forwarded-Encrypted: i=1; AJvYcCWRopWk/TUb3vbxKg/xAA8YMSFIix/Rw5fSowyM35dYdbER2n34ocMfbmWL9MAGsMBelsDX2BaCHZc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6WTDkQvk03gDMER66Li/yhol2uzX/1e0ac6Yj5J5wbC1Iw6Gg
	2RsY+2BT1uIiL3tGN0QSHDc+CJaTgLmwR84B/9rRPUfSuddXjutuAvRS5Z0WW6MDEALIU1RguMv
	kE7exkzXc7I4CslZf5PB4bkanO2ZX/wwA+SQ=
X-Gm-Gg: ASbGnctbnJSX5ih9gvnyrReFn3lNDPRt2nEd7lk8aq0DeoT6Bl5oMqZWZHSkCLTEMDX
	Xb9mnHPNLh7WVH3TWzrQQjTMx+yGA8X3rM/mMvNzYBCqGStQ1IkILxCYVPSYX
X-Google-Smtp-Source: AGHT+IFp8XCFg1lEU3e1fi+fHUhDavDNkEfjadO/eMfIJfRp5lhMaScdyBmt/tCjFNB2PINDghB3+C6LC7IZg7++n4w=
X-Received: by 2002:a17:907:3a57:b0:aa5:2bab:69f6 with SMTP id
 a640c23a62f3a-aa639fb37fbmr47238966b.8.1733440690804; Thu, 05 Dec 2024
 15:18:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241202115827.50388-1-mripard@kernel.org> <CANDhNCpTnc6=YkjQgQngRCw1_xLWgOFrcjTxrrGX+bRhvGb5DQ@mail.gmail.com>
 <20241203-cerulean-ringtail-of-speed-920c5f@houat> <f6412229-4606-41ad-8c05-7bbba2eb6e08@ti.com>
In-Reply-To: <f6412229-4606-41ad-8c05-7bbba2eb6e08@ti.com>
From: John Stultz <jstultz@google.com>
Date: Thu, 5 Dec 2024 15:17:57 -0800
Message-ID: <CANDhNCqtMUaO4Y_7UYGJebDEdN==vTAQRexuuek5SZt5rqd8sQ@mail.gmail.com>
Subject: Re: [PATCH v2] Documentation: dma-buf: heaps: Add heap name definitions
To: Andrew Davis <afd@ti.com>
Cc: Maxime Ripard <mripard@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Sumit Semwal <sumit.semwal@linaro.org>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>, 
	"T.J. Mercier" <tjmercier@google.com>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	linux-media@vger.kernel.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 3, 2024 at 11:04=E2=80=AFAM Andrew Davis <afd@ti.com> wrote:
> On 12/3/24 1:44 AM, Maxime Ripard wrote:
> > On Mon, Dec 02, 2024 at 11:12:23AM -0800, John Stultz wrote:
> >> Hrm. I'm not sure I see the value in enumerating things in this way,
> >> it seems like it will be a nuisance to keep current?  Maybe something
> >> like:
> >>
> >> On most systems the default cma region is named "linux, cma" or
> >> "reserved", with a few exceptions:
> >>      - Allwinner sun4i, sun5i and sun7i families: ``default-pool``
> >
> > I'm a bit worried about doing so. What if, on a "linux,cma" system, we
> > have another "reserved" heap created with different semantics?
> >
>
> Having the "default CMA" heap get its dev name based on the method that
> created it was arguably a mistake made when first upstreaming this heap.
> We should fix this, then maybe add the old name as a link just for
> backwards compat as needed.
>
> exp_info.name =3D "default_cma";
>
> All other CMA and carveout heaps will have names based on their
> method of creation as there may be multiple of them, but there
> will only every be one "default CMA" area, and its heap should
> be named to match.

This seems reasonable to me. Maybe putting the link creation behind a
compatibility config so they can be later deprecated?

That said, while I understand the impulse to want to fix the heap
names so applications can depend on them, I also want to caution it's
a little bit like trying to hard code eth0 as a network device name in
your scripts.  There are too many potential configurations, and any
fixed mapping is going to break in some cases.  I think there is just
going to have to be some (gralloc-like) device-specific configuration
glue to map a pipeline/use-case to the memory type (similar to fstab
for filesystem to mount points) in order to handle every case.

So if I'm being a little squirrely on fixed names, it's mostly due to
wanting to avoid anyone getting the mistaken impression that fixed
mappings will generally work.

thanks
-john
