Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C3BE39D6EB
	for <linux-doc@vger.kernel.org>; Mon, 20 Apr 2026 10:43:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776681826; cv=pass; b=RVgGdL5EFLHASkjNCphzxoDnT7qCg18qZvTrCAdROLbi2bXrJhuKFWwKCSAKBE/IQeALIpabIJ5qq1jZWvr1bgwCZcHo31cSPbSl/G0n2UGRwtqufLsoehW6pfMSrNkUAZZmCAlBtp+vbSraQCj8w4oE346Vr4XCXzsiZgS9JtY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776681826; c=relaxed/simple;
	bh=DlHI3ioMHq0MOalAY/xQaHVREbCO6W+fHPlV0QJvFf4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ILG/8DdSOInQVYpp1TnYR1ZdfJuo4vUwPtVRK4TeeKVdz0UGaoV9WsGnJ25txjjC3gcsm2yMwUZ6ZbEJJxdZicgaFjrSbfsoLgD8W6znNDmH7+n7p0LuyxH+vJNbamI+fXoyRriGCehOCSAj6TBAQiH6KtxaK7xU4MT3EHSA7OA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F5anO9+q; arc=pass smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F5anO9+q"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4896c22fcbaso4146875e9.0
        for <linux-doc@vger.kernel.org>; Mon, 20 Apr 2026 03:43:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776681823; cv=none;
        d=google.com; s=arc-20240605;
        b=IUPYj+noJcwozsyA6EFfnVM8iGeAi3OHPN1rPebiCHpPd509Xv+TwkcUYcE5Z7Ueoc
         ozIRTvTF8nV79vMuFtynGBL0qt6w4cqfnKQ3rv8LANK9mWHWXsyDzqy4NZTXIA8gLBb3
         sqck0MoIpmgwk2zp4FIr3wkIIMIeUijjSRyM/oZgdFOCeI5U6qrfnPayClwjd2GmlAXz
         b022E3SH8u+8NBz1bxbnuZQwIVT3lKBkA9mcja7QVetla2bfkEt3t31Dy67kusneOtsb
         DeEjmQbhAXP3Zg1GsuzAXX/ZWci2UFfYEtqmxWMcSjMGNAodx8SHNt1y+fbmqj7MOBL4
         eX/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wdriMOYuqf1JuyNyCdurWt3dDtXG7MpE23d9jM/g5eI=;
        fh=PWgVOrllgObzZkBvDb4O0gaBuf9jbO/ZtexVHLASIPc=;
        b=X2EoXsNdyVfY8VH+yp3sKZHkuKFZu/OOmL2HLvyuFut9NOcrQIp/6coyHW1Sn/OWs5
         ko4XVjX43X47ODMO29LeRXzcwsdhksG24tFxJ7n86Qvbd9lJsxK6F+qdTS1G2BMtOS0m
         jLAhBQCz3rvgzBszvvj2iSvFOpDMd4ktggxUpH0RFh9PknhR7zaPSIUCB8bhta2bQXqo
         zfkum5T2G5uEjX7aMazT849bYXeNc4+tVV9ZuqPMKSB8VQZSt81Ayvle4krZ343wFo9d
         Mbu3tI+xmmZmMlN4sPC1WfZYXBKQerSDTLEAfvv7QQdjvWCtjAFTTd+yyH89JtQ+1MXI
         LbWw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776681823; x=1777286623; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wdriMOYuqf1JuyNyCdurWt3dDtXG7MpE23d9jM/g5eI=;
        b=F5anO9+qzPtCq0FNTORS4bzPEyikZ7MTkz/Wxja1EUMMfcg/n1hpV0Uvmq1r+GlrOW
         PV45zLTmNsTNlAsdYey94tdeHiJCyiz0oe09AR4Z1vfFPaEKjfsMu9Dx8K+Y0DINBMWu
         Na1F2/LPNCCjfXuKDGuPMHVt5bi8MAGu10yXEIYmhiEROjUcoarSlO1iFUuZp4gX0NUR
         XG2Py8ao30VeHoDqzA988xccug1rFeMs5WqkwoeiH+Eqt+ssjvUdOJUCuR9NwPTSNGB4
         gBK8qh6hE5QTaF8KaD4k08tW7Xlu6Pru+L6fV84M9e3dVnMgtdM1Pfnb44gkj52Pa47m
         n0Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776681823; x=1777286623;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wdriMOYuqf1JuyNyCdurWt3dDtXG7MpE23d9jM/g5eI=;
        b=AeLVge+ETB2wYaoP/a7sU3hESjQm1NIty3maZsObT+O7uvUYNZFshA8/1JqNf1K+KP
         p4uqafYXnIku+DzdFXB7RYwTrgKOTtAlHGfuwF5cq80xkqBnj0mV9+0Bs8MvJVA6YH75
         RYrx2lGg4yRjBUANLk9syJXMlZA1c8Dh7CCguWc23WIWoxSRdIu1rYphmEhCYKDW3qF8
         YS6SetjzmMaU42z43x62yg049sPodrQXCN5jdKjJqM3zSvKO3gbesD/00GnYGHZgdgvK
         UDRWLWBPZJ9EiGZeo2d67JMv6wWbEYxl4k231bJWGjpaECvxOo6ML6vD5ymccpkZ0taf
         TjAw==
X-Forwarded-Encrypted: i=1; AFNElJ/b10+a47l41kLK1ReCY8wjq5iqwxZsFD/oUKnKDScKqgIXXgNV+fJ5KGcoFYjoKEw7xSsKg/M964k=@vger.kernel.org
X-Gm-Message-State: AOJu0YwbJ/JOnHh5Z8IjJQzU51xWp67WZfhYsgE5cJ1AK1SHo+8g8Axv
	yTQH7eAHg9gN8tzDA50nUcgCf7lAuDz77DC1zWVevud5PMM1IX3bbrQTBeKl/YrQkYTCGtF7rqM
	aDE0ROdNWbMzNvHkWPWAoHAZdE7y3zMc=
X-Gm-Gg: AeBDies/Csnl0VXY6iZ1mOHWYYdnycINOQ8ywvVzEP+ODLr0M7irQmlkAV9iYCqgalt
	IWN/9BhmcUBIhKJYyEWstPvhxUHJ1pm1cEHECjhtJtybArebg9TUJPFo6j+6P3xDgeboPdHkjbr
	+aYswpvxTG1PCV7Ux+z5k7y6oqtHbLCntCMnGOEUPWdEX1ZeRSazXPnl1tKzrt3u64j+whYTqz9
	Lp0IDxv0E/WW7oMMzIx9h27XN9i+YNPDbP3z6CmyGgYcCKwMhUHvJsTuPamSs8nG9ry+K9P39Bd
	ifH1Rg5gK5jCMyzZSm3on4V0rzME8qrsKr9fpA6v1fY0lGUhBKUpXH+prZQbWg3qTTDb80ob/GG
	5QrhK6fY=
X-Received: by 2002:a5d:4b81:0:b0:43f:e721:76ca with SMTP id
 ffacd0b85a97d-43fe7217864mr10702499f8f.45.1776681822491; Mon, 20 Apr 2026
 03:43:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260418000635.17499-1-sef1548@gmail.com> <aeNGbNyPxJssnkbO@lucifer>
 <aeOuCH8ydw_yzdXZ@casper.infradead.org> <c113f667-f897-42cc-a0e5-b8a0bbd91be3@kernel.org>
 <aeTTw4gziJigaNbU@lucifer> <CABZAGRHXtjzGJrgR1NAmVHFMP9eL5zZr3DaTAtAvywv_1sOHdw@mail.gmail.com>
 <87jyu2w2rs.fsf@trenco.lwn.net>
In-Reply-To: <87jyu2w2rs.fsf@trenco.lwn.net>
From: Nick Huang <sef1548@gmail.com>
Date: Mon, 20 Apr 2026 18:43:31 +0800
X-Gm-Features: AQROBzBZHx8GRi3NzcgXlhRjqdOVlbvZpCVncN88SDSfN9NuGphI-_yYe0lxFoQ
Message-ID: <CABZAGRHKq8SUnbXu5jGEP28fXozMbp1CJi+8215Ytqq66FvJzw@mail.gmail.com>
Subject: Re: [PATCH] docs: Add overview and SLUB allocator sections to slab documentation
To: Jonathan Corbet <corbet@lwn.net>
Cc: Lorenzo Stoakes <ljs@kernel.org>, "David Hildenbrand (Arm)" <david@kernel.org>, 
	Matthew Wilcox <willy@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, Harry Yoo <harry@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Hao Li <hao.li@linux.dev>, 
	Christoph Lameter <cl@gentwo.org>, David Rientjes <rientjes@google.com>, 
	Roman Gushchin <roman.gushchin@linux.dev>, "Liam R . Howlett" <Liam.Howlett@oracle.com>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Shuah Khan <skhan@linuxfoundation.org>, linux-mm@kvack.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Jonathan Corbet <corbet@lwn.net> =E6=96=BC 2026=E5=B9=B44=E6=9C=8820=E6=97=
=A5=E9=80=B1=E4=B8=80 =E4=B8=8B=E5=8D=882:43=E5=AF=AB=E9=81=93=EF=BC=9A
>
> Nick Huang <sef1548@gmail.com> writes:
>
> > I am really sorry for causing trouble for everyone. I would like to
> > ask which aspect of mine was disrespectful, so that I can be more
> > careful next time.
> >
> > If I want to make this kind of change, should I send an [RFC patch] to
> > ask for everyone's opinion?
>
> If you want to be respectful, start by reading what has been sent to
> you; the problems with your submission were well explained, more than
> once.
>
> To reiterate:
>
> - Do not send LLM-generated material without marking it as such as
>   described in our developer documentation.
>
> - Do not attempt to document systems that you do not, yourself,
>   understand; you have no hope of getting it right, and you will only
>   succeed in wasting the time of the people who have to review your
>   changes.
>
> The point of documentation is to be informative, accurate, and useful;
> simply filling in a bunch of words is not helpful to anybody.
>
> Thanks,
>
> jon

Thank you for your feedback.

--=20
Regards,
Nick Huang
