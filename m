Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF07E33EC
	for <linux-doc@vger.kernel.org>; Mon, 21 Apr 2025 16:14:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745252090; cv=none; b=LUs8fh18UM7gYj625LDk4+s5Royx36XOp7IJT9cSwi0RRyDkIyiq6qirLRXOrWE/2+cCft/FmJ0P8Iws8ozlygd5rxj88j8z5FWOqZlaa1mg/SryP151Gb1SlG95jMN/uPbToAN1NbZ6ipWMBNxdSSaZY3ARm7YCO5XLLrFBGU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745252090; c=relaxed/simple;
	bh=3OzJIct5NNohS8iztusylrQAVzv+H+U90LXJuOtw0HU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JN/W0YV8D/EV6TRcp5fEeIR/hyK5Jb02Vt5zxZqRaGl9abETRplcGjOoMMTXy2kaLK8mF3OOrizK4Jucbp9YjryyRhfBXF06FyHBk1HMmxZ7gpohsKlaB514+8ACWyzqHQlUmcabk9S2W/dlX17qsZCJR3ASfvgLNex9XMLpFtY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=OhcKxM0l; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="OhcKxM0l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745252087;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=G5X+2ZlQnphn009uh8TNhZMqD/l/s48KrnuuAvbgBdg=;
	b=OhcKxM0lU/+Fvujyp4KRZlzgaPCeqxhdw2rp8CW+mi2ewLovPcmNoANZLtYmP6QVGHMAGH
	47hk8+ijmYBHuAHfAncHt/enlQJnETr6AfSTZktX0somFArnO98sSUP5n+gQwncp6wkIn5
	ppU4JbWjB/Sx+eaxyVExAhShwYWM8Sc=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-660-ZnGgkciqN_6P7WAdYu1NZA-1; Mon, 21 Apr 2025 12:14:45 -0400
X-MC-Unique: ZnGgkciqN_6P7WAdYu1NZA-1
X-Mimecast-MFC-AGG-ID: ZnGgkciqN_6P7WAdYu1NZA_1745252085
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-ab39f65dc10so557456766b.1
        for <linux-doc@vger.kernel.org>; Mon, 21 Apr 2025 09:14:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745252084; x=1745856884;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G5X+2ZlQnphn009uh8TNhZMqD/l/s48KrnuuAvbgBdg=;
        b=M9rhxHbMBsSZ8vP7hzfbG3bWD/fJZ/EP/rRsdiWaSld675KUkSmuwsbSygxOrqNVJe
         GdnRpiQ3lxnNZKt1pxn6Nyfc1S/HzLTeS0ZrCF6klGSszICJ/KPxIpmsaQlvQpJUygSQ
         QBIrDuc1y/I8Xr7s0gcAMZN4Q3Ho2broYtmQIDkR0/iQ5uRLwftWimC2n0h5EOjJ4Cve
         9+HeFmk0WgR5nYbgEVRI9rPkWG/v95NxdyJT9qvVNxWjeRbEPxE9arSqiYwDrBJyv33x
         +UZDx7wA8c7UdbHpASaolJJcpyA1FJHN5S3gcJk7mkOmfTidR507qnL4HM1LO8aS/Ihv
         cn6g==
X-Forwarded-Encrypted: i=1; AJvYcCU60TOtvFD36fGZ79haeQdUcUKUS+onRE8pRPT1/lAcgVA0A2UuspD1e2NU2N4ruUwvqhzqyrJbxEc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxWT0qokZq+kDhE59WkwgDMxHH4sy3Dk3IHsHzCFZN3irXwuKrc
	084Ub0DBCOfTKLX14SuKgeHLxEhLe5RDgCV8SPMFxmYCH8o6kvk/Y+adzsN0DI4Mz+h/QDWbdza
	JEj6jSKE/DE3XY0rMUqPf6aprxQc2jkc5VDe2tjXHO04WRSxAsK3kzyyryFY3xUXHg1q1FBz9w0
	jf22m+ofs1olr89ilVpu5EnohGBTD88Ygdm+oW9WkZm4Y=
X-Gm-Gg: ASbGncua6zBiqmUwGROMcsR2oM+mGEXjTR4faPm0xe3Qx+Rp5rsfP5Xzybe3DJ1iN1Y
	KpLfl+ZuT8Imsgx93a19kO+aaeuWUzwfMGbvMtaT5OJs3alHWkWmobgX3lqBhjcy+aC0tY8jCOT
	s+sZlIFdnjK961hvA1gbviwtH+
X-Received: by 2002:a17:906:230f:b0:acb:5343:e75 with SMTP id a640c23a62f3a-acb74b8d0f8mr834620166b.34.1745252084366;
        Mon, 21 Apr 2025 09:14:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE3knQnWs2HodTUZGMoQRi1KMOmBwYSeJ3JQerwCdZYdiYgbg8sjwHlind4UuvyOig6HuCxOnlIKs7cZ/5/2VM=
X-Received: by 2002:a17:906:230f:b0:acb:5343:e75 with SMTP id
 a640c23a62f3a-acb74b8d0f8mr834618266b.34.1745252083995; Mon, 21 Apr 2025
 09:14:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250419150428.1129352-1-jsavitz@redhat.com> <aARdIqU6Y7baKrSk@archie.me>
In-Reply-To: <aARdIqU6Y7baKrSk@archie.me>
From: Joel Savitz <jsavitz@redhat.com>
Date: Mon, 21 Apr 2025 12:14:27 -0400
X-Gm-Features: ATxdqUE8VsYRGIOl4n4_wfC9xgagr25hIczQvW3IExl_6xXwE5I_-E7vVODx-10
Message-ID: <CAL1p7m6VGRDBrt89_5zqXzFgfZqm3mjmwH5WEn270Rwb49H7Dw@mail.gmail.com>
Subject: Re: [PATCH v2] docs: namespace: Tweak and reword resource control doc
To: Bagas Sanjaya <bagasdotme@gmail.com>
Cc: linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 19, 2025 at 10:34=E2=80=AFPM Bagas Sanjaya <bagasdotme@gmail.co=
m> wrote:
>
> On Sat, Apr 19, 2025 at 11:04:28AM -0400, Joel Savitz wrote:
> > -There are a lot of kinds of objects in the kernel that don't have
> > -individual limits or that have limits that are ineffective when a set
> > -of processes is allowed to switch user ids.  With user namespaces
> > -enabled in a kernel for people who don't trust their users or their
> > -users programs to play nice this problems becomes more acute.
> > +The kernel contains many kinds of objects that either don't have
> > +individual limits or that have limits which are ineffective when
> > +a set of processes is allowed to switch their UID. On a system
> > +where there admins don't trust their users or their users' programs,
> > +user namespaces expose the system to potential misuse of resources.
>
> Do you mean "when there are admins who don't trust ..." or "where admins =
don't
> trust ..."?

I meant to write "the admins", my bad.

>
> Confused...
>
> --
> An old man doll... just what I always wanted! - Clara

