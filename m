Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 290BCAD24
	for <linux-doc@vger.kernel.org>; Tue,  3 Feb 2026 21:04:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770152660; cv=pass; b=RT7PsAoGVSJAsHdyRb0m/R2NG+YLWoWZQriu6KpayVyGRQSyqi+Kv+c5pMTcv96/ny9RZ5DderjTldRA3K/FjYJ2xoOOia83Td5ZYxK0MDJ2DM/FbcdQaVvfltDU41aZT0Joh5KUsM/JzdmnLitQ1U8JT/X2wzwGdidoIki20TM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770152660; c=relaxed/simple;
	bh=RJWS/5hocPsBCaoCO9iKgBlV56I3HiBK7SRGHVvi0Pg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BygdJjL1Ns1OGDdmbcQLc8q+zdFfkFGTzHk+0LeUPUTENpD/e0yejb+Dz0KDASK/7tqOdR0g/DH5m5bz/5MLcCwMGIFKlFKs0rh7mC6JBETKed2lZ4V/pWXARdPAg3fMGRHuEyYqdQ2Z/vg7oNb+kOhZ31GgLEfBHtwuG4dWBAU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nMWwK4pz; arc=pass smtp.client-ip=209.85.210.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nMWwK4pz"
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-7d195166b2cso4914363a34.3
        for <linux-doc@vger.kernel.org>; Tue, 03 Feb 2026 13:04:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770152658; cv=none;
        d=google.com; s=arc-20240605;
        b=ZqJ39ypha79Iqb0XDixbbq/PR5dCN1yhJWpnf7P43EEIlFsexP1HPGMpPveKNKBbiw
         sGJV1mV88/EjjvAM7WlKewyXK+bGRzORs7Qadd2lOhTd9Vbo/ekRfZvXr+zX44jVHoMm
         HJbnFYQhtpahyFmV5wvI7VONrj4Sz8ZQ0AFHfcpwaRgO2Wjgi2lnHZxyXVmR8M38kmkQ
         Ai02IdviSlH7aaeZk+1gjwDZeVMIKfDgD8z4Ry/wTugALIZNDx+9RJCtXKkOUUoAxJ/2
         ltYaI704pkcWegMcbFHa21/eKttDaZ5DHgJz6L1cFs4bEjq5zCyLyILklXQbTevcWyJO
         qcZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QHAFB9FV4IIKqsJ9Dsq1BP6DtSJ08zpqLAnC+6LRrJU=;
        fh=PcGFxBoU3X2VUwKSfQL8B/R9Q2ayP6JJOoSmAv3kBWY=;
        b=PhmtV/9+mlzO5lPBsSwqcy16ZbTYKK2nxrzpCmC5JHxf6ttP8Lhs4V6PNg3hranEOE
         LfZ4fr0vXktqyAsDQQW8t526hF38ZvKj+/yW2JyiO7vtlcDgoKkA7UwNnr4fT85hC6uW
         Lv2L6NczZ/guLS7LU2586g5aXWodeELUCOlwdcF5CnzkjUzx55ziLXbInctEFS5HVTtP
         akzWRxFbbJZh4lTJpDtzeAzI17z8c7rGgO5sFSV8O4trh4ewAy6ordxOuLQJeRnZ97C2
         UPGZS3Jt7AXnJTnvjU3I5/0Cz/+DR59yxuzOH+0aNyYKMf/WRyCk/lHnZWMjbjAS9yQx
         X/tw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770152658; x=1770757458; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QHAFB9FV4IIKqsJ9Dsq1BP6DtSJ08zpqLAnC+6LRrJU=;
        b=nMWwK4pzvyqcIp4S8zs2qqo3r+AXXseYGjDojIHnd7ULCRuIV/F54lVnGkOVbe9eZ7
         qzJG/Uc9ZLVRXXW70GnI0PNHSyDHQDhOQ7lq16btxYRIOat5qE3dg8zN7VwUXq1nwjzr
         r1TGrlVrhm8fdGLeDZWx5KQ/xrpPGEB56YH1pZAZ+4kzwvVjwFLmxJFSn9mLSvAzfUWs
         VuqJj+W4efB08yOCblP0ncVZc2nXM0SPZoeTv5aLu8jZOaPkgw3OvtieXHyRQPAXsUlg
         6hmlRf5Yzbtb4c2Q6oDOJJrXu/CdxVdNd7fulIEqxqwqiofAYjqXP6a8l3YMzyAUTW3y
         85mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770152658; x=1770757458;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QHAFB9FV4IIKqsJ9Dsq1BP6DtSJ08zpqLAnC+6LRrJU=;
        b=l1ZGgBYHtFyPeUwNmQE8j6vGlgqsBkKrX85EDhZMOuO7983aArTCxhe0s0MuCnfVbF
         FsKOce6UiylHIFrOasdIcbViRTMHS2f8mR3xaER4eLZaEIRWTHU7CpMtz0lyi64jjdY/
         xUABugKmNMxAJLzuf8r1iZLJQ4Ya1XB8Y7xKe4pzuhBsXuybl8IfF5Dotj0zfdC13PA4
         TzItiJARSqGcdM+Mi8b99ljkWwTOL9UFkYMnSYRKR6CD4NZew6dUewtdjPETPY+J+fR8
         cc3Jfwwee4rTVUi0z8tTivR0uQoLiypOXbIpF27Sj27gsGieWbIt7ryXBbBtRT6TbgPe
         5lmg==
X-Forwarded-Encrypted: i=1; AJvYcCXDxEtzKfBXs0HqP2VY8fM589TVIxD3HkQX2NxA9q+5AQVbWVa2g4rEEmAtOjRdt0Q8rHKyYkO2g7Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YznMdwORi5FkNyM+YXYyGuWTFjTjnwStk5tVBDa3D/2Z+ZfLDDn
	PKxyGj+tD1+YVVz1UFq5Fx76a0+zZNN9/+jpsiBUxoef1uSrYR00+lbmgZqdwxgYvHDN1lEMiv2
	ZoLH6Oywd1MGYnUztNvFU7DaOy6EjrPZsXw==
X-Gm-Gg: AZuq6aJT4U3sLgDitwQ3JeQXgywD768dNsN65btIXNmMGyOfzpx7uFBCHxKA96MwXN/
	6l76x7mZoQr2ZfbJd+2S6jX8kjUlYFxNUzxYxeOag5nAh1UFhOTj8joe6ErzHBek1xESLvg/bqZ
	9B1wTcE++7ZGbLpz2wNY1sZyIhokjZmZv8q8DLWP7JFfJEyJxEGL7O5Z+owXCGBSPgPeppQIxgE
	wS/GXyqZ82zgsP5A2QhcHLqpuhYJQELYZ+cBUXZrF51OV7SHxP6w8QEN+JOGlhX8iAvlWbbWJYi
	fLhsASSs6zuKkPYvbFdpMeW0koDV469XxzQ8TdqMkLOpxvRdCjAwUD/nVsOJ
X-Received: by 2002:a05:6820:1842:b0:659:9a49:9026 with SMTP id
 006d021491bc7-66a23bf418cmr469936eaf.83.1770152657659; Tue, 03 Feb 2026
 13:04:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260203184826.81594-1-danielmaraboo@gmail.com>
 <0852503c-1d94-4cea-9364-d390ef076ea6@infradead.org> <CAMAsx6dtKd=kmvJZ-SYr=W+52VPOTTDCigP+3JsXZKOpDrbBkA@mail.gmail.com>
In-Reply-To: <CAMAsx6dtKd=kmvJZ-SYr=W+52VPOTTDCigP+3JsXZKOpDrbBkA@mail.gmail.com>
From: Daniel Pereira <danielmaraboo@gmail.com>
Date: Tue, 3 Feb 2026 18:04:05 -0300
X-Gm-Features: AZwV_QhbOBXK1XgHD95vmSCbxSzZZR8CTIJnJ9NjojivhHWBB7nMIIL2-nG2Cs4
Message-ID: <CAMAsx6fEF86EdLRTptdEK+VFwc4e1-GK520vHLNUJo5WkrzepA@mail.gmail.com>
Subject: Re: [PATCH v4] docs: pt_BR: add initial Portuguese translation
To: Randy Dunlap <rdunlap@infradead.org>, willy@infradead.org
Cc: Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 3, 2026 at 5:55 PM Randy Dunlap <rdunlap@infradead.org> wrote:
> Describe your changes in imperative mood, e.g. "make  do frotz"
> instead of "[This patch] makes  do frotz" or "[I] changed
> to do frotz", as if you are giving orders to the codebase to change
> its behaviour.
>
> so something like
>
> Introduce the initial ...

Hi Randy,

Thank you for the correction. I will adjust the description to use the
imperative mood in the v5 patch.

On Tue, Feb 3, 2026 at 5:20 PM Matthew Wilcox <willy@infradead.org> wrote:
> This seems an unnecessary blank line?

Hi Matthew,

I will remove this extra line. It was an oversight during the
reorganization of the file.

> > +Becoming A Kernel Developer
> > +---------------------------
>
> Is there a reason to not translate this one heading?

Regarding the heading, as this is an initial patch focused on
establishing the structure and the first main documents, some
non-essential headings remained in English. However, my plan is to
provide the full translation of all internal headings and content
in the upcoming patches.

> I have a delicate question ... how different are Brazilian and European
> Portuguese for technical documentation?

This is an important point. While Brazilian and European Portuguese are
mutually intelligible, the technical terminology and sentence
construction in a professional context differ significantly.

In Brazil, the community of developers and students is vast, and
providing documentation in pt_BR is crucial to lowering the entry
barrier and ensuring that technical nuances are perfectly understood
without the "distraction" of regional variations from Portugal, which
can sometimes sound archaic or confusing to a Brazilian developer.
By starting with pt_BR, we are targeting the largest Portuguese-speaking
developer base to ensure high-quality contributions from the start.

I am preparing v5 now with these fixes.

Best regards,

Daniel Pereira


On Tue, Feb 3, 2026 at 6:02=E2=80=AFPM Daniel Pereira <danielmaraboo@gmail.=
com> wrote:
>
> Hi Randy,
>
> Thanks for catching that. I'll rephrase the opening line in v5 to use
> the imperative mood as suggested by submitting-patches.rst.
>
> Best regards,
>
> Daniel
>
> On Tue, Feb 3, 2026 at 5:55=E2=80=AFPM Randy Dunlap <rdunlap@infradead.or=
g> wrote:
> >
> > Hi,
> > One more nit, sorry.
> >
> > On 2/3/26 10:48 AM, Daniel wrote:
> > > From: Daniel Pereira <danielmaraboo@gmail.com>
> > >
> > > This patch introduces the initial Portuguese (Brazilian) translation
> > > for the Linux kernel documentation. It includes the mandatory
> > > disclaimer, the translation of the HOWTO document, and establishes
> > > the directory structure for the pt_BR locale.
> > >
> > > Signed-off-by: Daniel Pereira <danielmaraboo@gmail.com>
> > >
> > > ---
> >
> > Documentation/process/submitting-patches.rst says:
> >
> > Describe your changes in imperative mood, e.g. "make xyzzy do frotz"
> > instead of "[This patch] makes xyzzy do frotz" or "[I] changed xyzzy
> > to do frotz", as if you are giving orders to the codebase to change
> > its behaviour.
> >
> > so something like
> >
> > Introduce the initial ...
> >
> > would be good.
> >
> > --
> > ~Randy
> >
