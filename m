Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9402D25632
	for <linux-doc@vger.kernel.org>; Mon, 16 Dec 2024 05:06:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734325577; cv=none; b=fLYqzq+W8jxqRqRMusmy8WhtynAigbIsjhhxWqJ1oJxFB1t/nK7p9J2VKg9D5HxHh19nYCKEn3vsGgBN8bSAhE1pLitsYGf0p5Dw50gXk0+fHoRfW4e4eA02g+mbGxV+dzZ856VtNNmqQ/BTPzGxVGJtuT4Uzf4DMNHRdo9+o0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734325577; c=relaxed/simple;
	bh=kCRva32N0VhrNgQfChfjnrcWqJoDUo1iXfZ0ODPK70c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rS0186qQyoWXcdIuT5OXBB7j2kUfUHRFEKWLJZBDTW67x4yFxQk1W8EBalhKkUwkx/r7eRg/1FKdiA0WzgS7uGrmRTKH3XlRmrQ5weSXvL06uCC2Cheep0o6E9eYcY9/EHyGKKGJJvc28VPVmymWRcwhHPXeT9WcC1E5k/PCAWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=azaRBaeI; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="azaRBaeI"
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-3022c6155edso37226281fa.2
        for <linux-doc@vger.kernel.org>; Sun, 15 Dec 2024 21:06:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1734325574; x=1734930374; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kCRva32N0VhrNgQfChfjnrcWqJoDUo1iXfZ0ODPK70c=;
        b=azaRBaeIXKBmrQxHeg7eil9IwlxtRI7RD+KUYevzjWqTvRXER0+JsW20rEMWRKwAsP
         XdGGAdBylCoo4e5rAb4UexmI0GBbWRywRHd/Zs94JvzD0B+qjIfFS87CtPL4cvP1WCCX
         4y/eaubA7yHUD6ZWh8N4Sd8gjlqCdkFrNmBUA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734325574; x=1734930374;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kCRva32N0VhrNgQfChfjnrcWqJoDUo1iXfZ0ODPK70c=;
        b=leu0P15POpLD+tqzn8cxIDJrWgB3+R4Tj/uZOqKNFhrCmm/iqAju9MRjPqgsZd0PMF
         w+6BzQiVU0pZD6viyKqVrdZqsrsjoEXFJeuVfQgOdrzeS2Y4gRWT9ECUFsIsQI5qsvJG
         RQilugJ4BNUVomMrgDgBkEHj8MD5vkXck/Hb4qveDJbbrSr9i2+cJ2INPOGGMZoNJxLK
         ACP78mIaEWs3mMo+vG3iaZ0lfpWv7YOuC4ASgP4mltNx9HvNFl/RlrxOPiGqBPkfxPLo
         tz/CpRFi488Ag1F+nInSmr7aipExNYj5j7GApa2fQt2dJ5tpwfFYnj03KmNJQWojK39e
         63EA==
X-Forwarded-Encrypted: i=1; AJvYcCXaxc1NuLQ2wgDnHrYp2fRXcouaVl05jAZ8/vSXuVPU1fZa+yFBZxWOGjVrhGHf20cj0uMBfLwhIBk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyMEmq5SapJ5KdvBzxGM6gLEaU5JRClvVia5GiyFH/y0aNb678z
	4+E7yE5dvLLebNJaLzUmYzpRFHmv8j876WxvzgjzAmxUphVKobnZgaG/rYO9xZmjnTP0MzSdmWo
	G7kjujYAcS8aMgJC1JOk86fRWu+jfnvnP/AmR
X-Gm-Gg: ASbGncuzMp22pEvuIaZRghNIWyLA/flUd91oouuvs7QdlqUugcJ11W4yUWplll6TE69
	ph/h+4TGCqcweWY5PfDt8PcXFtqw47OZ7QqpRIg==
X-Google-Smtp-Source: AGHT+IE2lSfy0plkHFYvqJzzMKQfZf0H0X0Pv4uKJBDZr2SBKnWb1wfneg9v2qKtvbV2M2+FSEtq4YdfQJ0p+sPWLjA=
X-Received: by 2002:a2e:be8a:0:b0:302:1c90:58de with SMTP id
 38308e7fff4ca-302544cd2a9mr45430851fa.33.1734325573758; Sun, 15 Dec 2024
 21:06:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241212224114.888373-1-dualli@chromium.org> <20241212224114.888373-2-dualli@chromium.org>
 <20241215142723.3e7d22e7@kernel.org>
In-Reply-To: <20241215142723.3e7d22e7@kernel.org>
From: Li Li <dualli@chromium.org>
Date: Sun, 15 Dec 2024 21:06:02 -0800
Message-ID: <CANBPYPi8Q2akivjbMCeThtHEw1L_rHErxL_Cwt=Xjf=B1fZ=-w@mail.gmail.com>
Subject: Re: [PATCH net-next v10 1/2] binderfs: add new binder devices to binder_devices
To: Jakub Kicinski <kuba@kernel.org>
Cc: dualli@google.com, corbet@lwn.net, davem@davemloft.net, 
	edumazet@google.com, pabeni@redhat.com, donald.hunter@gmail.com, 
	gregkh@linuxfoundation.org, arve@android.com, tkjos@android.com, 
	maco@android.com, joel@joelfernandes.org, brauner@kernel.org, 
	cmllamas@google.com, surenb@google.com, arnd@arndb.de, masahiroy@kernel.org, 
	bagasdotme@gmail.com, horms@kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, netdev@vger.kernel.org, hridya@google.com, 
	smoreland@google.com, kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Dec 15, 2024 at 2:27=E2=80=AFPM Jakub Kicinski <kuba@kernel.org> wr=
ote:
>
> On Thu, 12 Dec 2024 14:41:13 -0800 Li Li wrote:
> > +/**
> > + * Add a binder device to binder_devices
>
> nit: kdoc is missing function name
>
> > + * @device: the new binder device to add to the global list
> > + *
> > + * Not reentrant as the list is not protected by any locks
> > + */
> > +void binder_add_device(struct binder_device *device);
>
> To be clear we do not intend to apply these patches to net-next,
> looks like binder patches are mostly handled by Greg KH. Please
> drop the net-next from the subject on future revisions to avoid
> confusion.


Got it. I'll modify the subject accordingly.

Meanwhile, Greg KH did say we need netlink experts to review
the netlink code. Please let me know if you have any more
comments about the netlink part of this patch so that I can
fix them in the next revision. Thank you!
