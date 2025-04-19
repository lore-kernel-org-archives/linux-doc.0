Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 748781E884
	for <linux-doc@vger.kernel.org>; Sat, 19 Apr 2025 15:00:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745074832; cv=none; b=KwxeNsd052mwRlMY3k7LH7yZrJoTrgqRSAyufO/FWYRrXtulyOKR7/5MicoabqoPXm5cHYlDzDxaDbGEUH7Od5h2Y0ycXNMWBTZUY/5fNTfNuWHL5NPmFSFxOIIWFF/t/4E2AvQ+qY13eDI4Ey9diFsOOy8iV034KHyggpNMi44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745074832; c=relaxed/simple;
	bh=9xCEYtpgb1hZuU8K9PxHjh3gENobahV+wGnuyFGzMvU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bcW8TlM+kIejjUqqr5iI1JfyzOPK2njOwywmF69aHRr6LdEkFWx9gW1xzsVsmcbj0vodheILcd0LZQBVWeKUuiNIOLs2jjw41iPtpoYxNo2UQQXGAj5PfnwlGVOKMYH3nUu5v0OiqG2tZaReXz6STb99MC5CS1GxjoosgkWMVmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=LnZYnSfg; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="LnZYnSfg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745074829;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=C1YNXlZccJhw6+9V7X+8HuTNFp3YGR8roOQvHdNcuP4=;
	b=LnZYnSfgrdA4wBO2LkfmzzJ/7pLvqk1dYIZN+RvlLZEQiGji4zHok6Yk4IS6NK2UwGhveN
	0quqbpZc9ECeydzhG2B3ljkBibK2IEh7G/TcGkwRwgEuOcWxaT4Ao7UlXrjbmE5/mpGMXc
	sjWttkn5w1B1DuhN/GDMFuxPlbIVUzQ=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-314-cPrY-3HGNy6Z1YESbrf6Dg-1; Sat, 19 Apr 2025 11:00:27 -0400
X-MC-Unique: cPrY-3HGNy6Z1YESbrf6Dg-1
X-Mimecast-MFC-AGG-ID: cPrY-3HGNy6Z1YESbrf6Dg_1745074826
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-ac3d175fe71so185239466b.0
        for <linux-doc@vger.kernel.org>; Sat, 19 Apr 2025 08:00:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745074826; x=1745679626;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C1YNXlZccJhw6+9V7X+8HuTNFp3YGR8roOQvHdNcuP4=;
        b=g6+wa0qD7RKCNo11L3FwoPMyI0lZHQGvieMM1nvmSyQKDPp8iUJRqN+4q3igqamNsz
         u1jFo4t68H36wyUw0QVoIdZXcR8U44417bUn+fK2hX8wtwvEVwQcKfY0bhHVbPS9a1kw
         0pBxHISn+Yex0FNH4Oz4OVpY3skip7z0K/PkN73+nGFJWaM31O9e+qXysbPNMCciPie4
         ytDMiI04x1iqEgC11mYjsElmHGr5jrXN30ZrgnBOzVS7CgD4wh7safdtpyAVxuPI6uTb
         r8TUgSOtbPrPUiQoxumUTZls6XhmgxaevPwce1g/nhlJVEvGURhKKxrARTHD45QC/f0u
         QGrw==
X-Forwarded-Encrypted: i=1; AJvYcCVFvBw4wM0+51quyH96XoTOJ/0MEGUoYn3tBZ/nvp8uNByCTdG3VP+8qdbfuMqyX++bo85Xi/8PCOU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyC8OyIA7WvS7vesKfIoxPjgIzF+A6CvN5Ed6O70rUWu61fFKOW
	3HDf6Q1a02khmamyeZbM4d+lkYDRq6wim2cx4nUZXYzfYN7Piu950d09r1GQ3jQufarTNQZno7M
	3J9zRwXQ0JYWEvBJaW5i1YoL0XkYo/UGGm8MNx0F6j+2Ng5xFskAguOwgjG+N1ODurduK9h1gxW
	l6jtDX+6zPwhmJWNFOKwBn2eiYwaA/Dek/
X-Gm-Gg: ASbGncswK3d27JRGeB2rXmkh4gE/sibaIU+a1GWNVePYHl3q+g9+SUKP1dbrBeWlBM2
	+g3wDl/pQqEzq01xnQ/77ANvWcGCeHFfnQl8TclPygkK28qS5KQIU0H6IWIzWP+5pzzF9HUHA9k
	+uZC4khkbX3fmkH8GjF3TSsmaI
X-Received: by 2002:a17:906:dc93:b0:ac1:ea29:4e63 with SMTP id a640c23a62f3a-acb74b4f63fmr622522166b.26.1745074825957;
        Sat, 19 Apr 2025 08:00:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFVoou/D+ClXF/XynayICc3mjD0RG49GmtZXJ0LTCB9jlDObtEBVd0lsNFjiw09qbEFOHSFPk2MOMwDafXKw+Q=
X-Received: by 2002:a17:906:dc93:b0:ac1:ea29:4e63 with SMTP id
 a640c23a62f3a-acb74b4f63fmr622519466b.26.1745074825577; Sat, 19 Apr 2025
 08:00:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250418152910.1121670-1-jsavitz@redhat.com> <8807bdad-f41b-43d6-bbe0-af515f88abad@infradead.org>
In-Reply-To: <8807bdad-f41b-43d6-bbe0-af515f88abad@infradead.org>
From: Joel Savitz <jsavitz@redhat.com>
Date: Sat, 19 Apr 2025 11:00:09 -0400
X-Gm-Features: ATxdqUGXo8KixQ1IktQQJejcJeFuhEFxN0EoFKxlQWnpcjFdGC0EBd0SbMHE_3I
Message-ID: <CAL1p7m6C9v6z7-e4r+ro7EMvjy2yyOeLKU0UyMcVBHE9Ss1tMg@mail.gmail.com>
Subject: Re: [PATCH] docs: namespace: Tweak and reword resource control doc
To: Randy Dunlap <rdunlap@infradead.org>
Cc: linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 18, 2025 at 3:38=E2=80=AFPM Randy Dunlap <rdunlap@infradead.org=
> wrote:
>
>
>
> On 4/18/25 8:29 AM, Joel Savitz wrote:
> > Fix the document title and reword the phrasing to active voice.
> >
> > Signed-off-by: Joel Savitz <jsavitz@redhat.com>
> > ---
> >  .../namespaces/resource-control.rst           | 24 +++++++++----------
> >  1 file changed, 12 insertions(+), 12 deletions(-)
> >
> > diff --git a/Documentation/admin-guide/namespaces/resource-control.rst =
b/Documentation/admin-guide/namespaces/resource-control.rst
> > index 369556e00f0c..624f4dceea46 100644
> > --- a/Documentation/admin-guide/namespaces/resource-control.rst
> > +++ b/Documentation/admin-guide/namespaces/resource-control.rst
> > @@ -1,17 +1,17 @@
> > -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
> > -Namespaces research control
> > -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +User namespaces and resoruce control
>
>                        resource

Oh, oops!

>
>
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >
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
> >
> > -Therefore it is recommended that memory control groups be enabled in
> > -kernels that enable user namespaces, and it is further recommended
> > -that userspace configure memory control groups to limit how much
> > -memory user's they don't trust to play nice can use.
> > +In order to mitigate this, we recommend that admins enable memory
> > +control groups on any system that enables user namespaces.
> > +Furthermore, we recommend that admins configure the memory control
> > +groups to limit the maximum memory usable by any untrusted user.
> >
> >  Memory control groups can be configured by installing the libcgroup
> >  package present on most distros editing /etc/cgrules.conf,
>
> --
> ~Randy
>

