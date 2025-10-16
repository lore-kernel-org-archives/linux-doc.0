Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DE18EEB2
	for <linux-doc@vger.kernel.org>; Thu, 16 Oct 2025 02:15:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760580936; cv=none; b=V02bdy+MQo0bnVHjBcH2wGfYmThUaEbSW/n9mEofAXv0+tl1oXn8yKohvneWJ2GPFI0uOq9Qlbss6ggHFgK1kNaLRODESWA5hf79UsqIyTfRwsoFb0HwsxJT5kww/Z7p0VLUuaVaXiRU3YjOhu2SvvNoCCHsv+X1vSi8QJN/iK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760580936; c=relaxed/simple;
	bh=67S2aIF/pfkOX5K2acGDT1zOvhxTeuM1fCJ9Zi55c+g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UEUy5LCdeVbvwrHvozbEMmIhMG2fnBwv1SWECmqJxGWGupAxysw+N9/pmbbl7G9jbvswJ1ukXuC6v56Y5uGnSis0VJWXu2myOTMFMmvI1X7QFzKdPyIMdE8FJ7xNITfN2rbNbCHaVuO4xBCct9X8Ju+QHOf1PcMP829QkUNgX70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fT5mbzuA; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fT5mbzuA"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-b62ed9c3e79so110405a12.0
        for <linux-doc@vger.kernel.org>; Wed, 15 Oct 2025 19:15:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760580934; x=1761185734; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=67S2aIF/pfkOX5K2acGDT1zOvhxTeuM1fCJ9Zi55c+g=;
        b=fT5mbzuAmxD2eXvzc367v/kjGlWToe/KaxukN8gEX0JqPkCenaRG12L1Ias+sey/K/
         eS9p8HtqLUcA1LKQMwphFi2CQefL+pFrfYZK/cJB1IYc8GZJv1mHqqhTW1s0pV5Y7Pal
         JRbGPE0Y4GzXv+NIAB2nD0Y5tfMTbMP3QxdXpsdxtalpmtCkdb4O9EmQHvtK7vbPROBT
         Q2Zx5wPKSxaxmR9kjrXu907pN2HAo9uL0T4eHQyoaGlyQ2objTDe5uNuWXHs9oYhKHio
         fuA5PbI5KpHc2gGK6H4Jt4kWsG9I0iHnKaNft4N+9RCYtZcfX2SzVZfviVs2HDnSODg3
         Qlkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760580934; x=1761185734;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=67S2aIF/pfkOX5K2acGDT1zOvhxTeuM1fCJ9Zi55c+g=;
        b=s+lsMRoJ5/Z/qwEYUgimO9sGNJBS74Gh0p4U06ZQliYP8g3CpX4OyUvXuStlcInvJc
         n6RHG1jN9PTFFo1+FaJ4nSDv6vW9J7FoQRW9ay7uORw1Uj0IPGveXvyFsBrb7Tr/El+5
         u5mI5XneH8TiVO/MYdyz6F9dT2ft9jA86bvzqMa+aftTQWV7P/QdkknPYdX6/5FXW7bB
         +ysmvB967ub69Tj/lex2shIEpK8RA0m8p89uy5geHHlqPFWMSj3xIgLnZGIXrF60tlev
         O1jR0uQRmqYkctvfXBlWbYjgBLAqJjCd4H14IgnIr3GPRTMk1b4dWpy8WawsgR1UNJoy
         TLpA==
X-Forwarded-Encrypted: i=1; AJvYcCUYJ2Fn0grzg7hbWcpGuk2wS1bFiE7zAUZ2WU164V4gLvJUHmoglRtfWlSXMeLh08aY88/zlJNXFk0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7bAtPdtmPZWy+gvWzVKynvNpmOXhfUK4wf0Y7/ileY2PaM5tv
	hUAi2JFUUME3PSHqLrHdb23yzN8yIrNfWvDTXCLwc5ReydkB2he/GlYo+A9suwBG8tDU65tx0qD
	7hE9S/rH3yAML69NXpaZHKQoz+H4LIrg=
X-Gm-Gg: ASbGncvYLPtDftVaY68k/RRT47rENZ4Ruzo/Fw+ijMIkiRev2DiiHJHUolgQoFTo8bV
	tHl8mHhNB3xXa0Yk+xRGoX/kfVxcPHnjhFt1SK8yVpKOR9x7a7yXXK9uVHzSuKiKOvwue8rkVDE
	kvHZbvwZnAsEICeu9Wsn4YtMeEE5XRQZ0NRUGgor/qXn29DvHo7ds0CRSnOWZbyXWX0zpglGwP9
	dETM1H5tYaprE6UnlF80HnYAJPeshF9Yue09W6U4DkudVOAeMH4IOx1bzLk
X-Google-Smtp-Source: AGHT+IEvRoOtfZkD7JBaJ7rZGlNV110A7XDi8jf3vUgY9Fd8pd0a5HquzKeGR4HlB+RP5ldM64qTIlUt/S7CQGX+WI8=
X-Received: by 2002:a17:903:1447:b0:248:ff5a:b768 with SMTP id
 d9443c01a7336-29027356a2cmr375723705ad.10.1760580934134; Wed, 15 Oct 2025
 19:15:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251015183402.1649988-1-kriish.sharma2006@gmail.com> <aPA18fxQW398WHte@archie.me>
In-Reply-To: <aPA18fxQW398WHte@archie.me>
From: Kriish Sharma <kriish.sharma2006@gmail.com>
Date: Thu, 16 Oct 2025 07:45:22 +0530
X-Gm-Features: AS18NWD2IGlwVYDG7C9iI2e3l9CLdrdvxxJHaMKCdoRSM9GgL7yUi4oi3QL3np4
Message-ID: <CAL4kbRMQCMqnjLq6tXCuGXfGZWMAN+Jn-oQ0Ljzc_WLG3rUazw@mail.gmail.com>
Subject: Re: [PATCH] htmldocs: userspace-api/dma-buf-heaps.rst: fix block
 quote warning
To: Bagas Sanjaya <bagasdotme@gmail.com>
Cc: sumit.semwal@linaro.org, benjamin.gaignard@collabora.com, 
	Brian.Starkey@arm.com, jstultz@google.com, tjmercier@google.com, 
	corbet@lwn.net, linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linaro-mm-sig@lists.linaro.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for the review, Bagas.

I've sent a v2 with the corrected Fixes tag as you suggested:
https://lore.kernel.org/all/20251016020912.1653230-1-kriish.sharma2006@gmai=
l.com/

Thanks,
Kriish


On Thu, Oct 16, 2025 at 5:31=E2=80=AFAM Bagas Sanjaya <bagasdotme@gmail.com=
> wrote:
>
> On Wed, Oct 15, 2025 at 06:34:02PM +0000, Kriish Sharma wrote:
> > Fixes: 1fdbb3ff1233 ("Add linux-next specific files for 20251015")
>
> The correct blamed fixes should've been:
>
> Fixes: 507211e3c7a1 ("Documentation: dma-buf: heaps: Add naming guideline=
s")
>
> Thanks.
>
> --
> An old man doll... just what I always wanted! - Clara
