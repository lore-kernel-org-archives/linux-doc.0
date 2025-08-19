Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35D7223371B
	for <linux-doc@vger.kernel.org>; Tue, 19 Aug 2025 06:40:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755585618; cv=none; b=lBc8hO/VTCrSMdsR2gLFopuKUx8ft38fPtV6fkg1pEWSnABoNKceKPSe8DRqX+xSMSxNtDCQ14zXlGdU4ReceraXMBswzIQGUCwYMJHH/3kqN0Zpm0GQDtntYGDQ4Oy1FPFsea8YwpxdEeFUuSVnIcBmgKD1Vl/bPgsa1tC6R50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755585618; c=relaxed/simple;
	bh=qD0vQssPqxpj7lej1JnmRiBOzgpAai+Uu6JQSkCuAA0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OMeV4wOcC54s9sl7xntK0G3wEzRflprCjUTvP7w0p1QczwY+yjD0/XBDX6EMEunQ657PaacnE2R2BhqljgyQzx+Z3YY4Q14Jbm7V/EWBLajb7vmBZYADlz3WhJJSqCG5zdA7YCmxEq3QOU9CK3vmghxeGzP43r7xb88n8IeBGvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HIpKanZs; arc=none smtp.client-ip=209.85.221.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HIpKanZs"
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-53b1737003bso1925506e0c.1
        for <linux-doc@vger.kernel.org>; Mon, 18 Aug 2025 23:40:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755585616; x=1756190416; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t/hsSyp0BU0dIGoQ1I943HbjW/hqPyxYDs1Igup4dMw=;
        b=HIpKanZs6mUXNlbn9tz/KBA/pecK5g2NpYadXuU//T8k54qiiQ/OECYk9bPaHfGrtK
         Ks7hOaXWKXYkufWPaQ6PienW4rvefsdpkvx5LoZVud0j6zOlM5pDZlO53Cq0Ktajex5X
         aoiV8tIDVcpvnvHbzwaF7II435gWdr9P0Hn79fhUcG9jIudhLFLC0qQK6rzyKZf8cy6/
         uvUJa8lclHjFZQ7xd3p1JnE9XgF9HXvM7DnhAcZq/uiVdduY2686UfCUApY5HzX4n46p
         IEE623385tWqn/SUxeZuajS4chx9dofnyGeqmTe/0c5JVELAszQ+abLtS0WXZ7ue4rhE
         TSYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755585616; x=1756190416;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t/hsSyp0BU0dIGoQ1I943HbjW/hqPyxYDs1Igup4dMw=;
        b=ZP+FZERPLAS0+FJOab/6rhaf0URrnuRx53StzO8TFn44ZccD+OUJLp/HmSMsPDZv9t
         M3sMndHNHOabgDcY+CgRyWeh2Qxdpr5makmHSnyGAR0CAUmCRmJimDO2Ymo9/m/4/V/B
         w/BLvJoMLkFYrg57Q3pSruK0bHniVxC6GJ9Lh9CaJdx8GDBoJA3OfEEgjuwO4rJW9O7B
         HYio2wX22sVD8LK2GhSoJ+aW0MbRgCncTK4vATpp+yB5F2loyzsHGWfSIpbRoI7BP8Zy
         SqBK2gR5EPk7BK63085yHYd+igcKoFevyyIc2jo0cb6uPNaCEDfRxx/SCrJAfTMXbn+e
         SfRw==
X-Forwarded-Encrypted: i=1; AJvYcCUe3LZP3poVs2v+A6tiHkhiIIk5kL5bkHqGw7MsCv/kbKWok7pKGQG5OJeQGZY1zxZtzV5appRkTFU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyHn+jskBaY+FIyiJBIN7OzCpFO4Hu8Y4ectJ9Qu+Q0g1RYMNO0
	He5Wz6cexbKk0PuXzw3rMXCTVmwVdf4mlk8xQxA1saSZn7ghmYk1HC5xnZ1zDjNvedyv6GbsrfR
	FuCJYINilu4bzcm316oJbJl6GmztEPsg=
X-Gm-Gg: ASbGncsC/LZSmwdxOQ0BnWymRVho5hYOfrslv6/IkRAt924aLN73M6nQHCWy0eLl+CJ
	cwEBVYZpLuycgjm4YS5Dq4ea2ltpUJWGwerZh/RrZx+poX1WXWIxZBxfBhIKR+b49ObeAqun6TZ
	BLc0ug5mYAfO+QyMpBDuuGimFM9wNBK53ZUke2LQRGn4pGIUW4H6C8ARpY5aSV0qESXHY+ynUiQ
	riDB98cbz9sdwF5MxEb
X-Google-Smtp-Source: AGHT+IGIp9L40rMIB/aowtWlVCpWwoAnLOKn+XiCciGgI7/tRZjmsc4dZJQpXr0goyuxaIU9p7AaWzlMhyhPD14SX+k=
X-Received: by 2002:a05:6122:468f:b0:539:2a2c:6efe with SMTP id
 71dfb90a1353d-53b5d1af882mr510444e0c.4.1755585615892; Mon, 18 Aug 2025
 23:40:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250818082630.40097-1-kubik.bartlomiej@gmail.com> <87ikikaaev.fsf@trenco.lwn.net>
In-Reply-To: <87ikikaaev.fsf@trenco.lwn.net>
From: =?UTF-8?Q?Bart=C5=82omiej_Kubik?= <kubik.bartlomiej@gmail.com>
Date: Tue, 19 Aug 2025 08:40:04 +0200
X-Gm-Features: Ac12FXxtQ25zbgGof2ZlIbrulFoGItlTzkHFXiu_IIvm1IAkA51qtfPdhbh-3Ew
Message-ID: <CAPqLRf15U31=VnXsEBiB-G7BsOH65FLCeoepSMc=D5bS4P_Y=g@mail.gmail.com>
Subject: Re: [PATCH] kernel-parameters.rst: fix document warnings v2
To: Jonathan Corbet <corbet@lwn.net>
Cc: skhan@linuxfoundation.org, linux-doc@vger.kernel.org, 
	linux-kernel-mentees@lists.linuxfoundation.org, rdunlap@infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Thank you for clarifying my mistakes, and I apologize for them.
I mistakenly generated this patch against linux-mainline, which is why
it doesn=E2=80=99t apply to docs-next.
I will switch to the correct docs-next repository
(git://git.lwn.net/linux.git docs-next), recreate the patch from a
clean checkout, and include a full changelog section as you mentioned
to me.




On Mon, 18 Aug 2025 at 17:59, Jonathan Corbet <corbet@lwn.net> wrote:
>
> Bartlomiej Kubik <kubik.bartlomiej@gmail.com> writes:
>
> > Fixed missing definite article "states that the parameter" as suggested=
.
> >
> >
> > Signed-off-by: Bartlomiej Kubik <kubik.bartlomiej@gmail.com>
> > ---
> >  Documentation/admin-guide/kernel-parameters.rst | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/Documentation/admin-guide/kernel-parameters.rst b/Document=
ation/admin-guide/kernel-parameters.rst
> > index 445248787e77..7bf8cc7df6b5 100644
> > --- a/Documentation/admin-guide/kernel-parameters.rst
> > +++ b/Documentation/admin-guide/kernel-parameters.rst
> > @@ -215,7 +215,7 @@ need or coordination with <Documentation/arch/x86/b=
oot.rst>.
> >  There are also arch-specific kernel-parameters not documented here.
> >
> >  Note that ALL kernel parameters listed below are CASE SENSITIVE, and t=
hat
> > -a trailing =3D on the name of any parameter states that parameter will
> > +a trailing =3D on the name of any parameter states that the parameter =
will
> >  be entered as an environment variable, whereas its absence indicates t=
hat
>
> Thank you for working to improve our documentation.  That said, there
> are a number of problems to address here.
>
> - The patch does not apply to docs-next, or to any recent kernel
>   release.  Which version did you generate the patch against?
>
> - When you do a "v2" patch, you should include, after the "---" line, a
>   summary of what changed since the previous version.  That is
>   especially true when you have seemingly just dropped one of the
>   changes you made the first time around?
>
>   Ah, I think I see...you generated this on top of your previous
>   version?  That explains why it didn't apply.  Please do not do that;
>   when a patch needs changes due to review comments, recreate the patch.
>
> - "Fix a warning" is rarely a good subject line for a patch; you should
>   say what you actually did.  In this case, "replace a duplicated word"
>   or some such would be better.
>
> - Finally, Documentation/process/submitting-patches.rst asks that
>   changelogs be written in the imperative form.  I am not a stickler for
>   that, but some other maintainers definitely are, so it is a good habit
>   to adopt for all of your patches.
>
> Thanks,
>
> jon



--
Best regards



Bart=C5=82omiej Kubik
