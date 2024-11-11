Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 395312E62C
	for <linux-doc@vger.kernel.org>; Mon, 11 Nov 2024 02:26:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731292007; cv=none; b=u4iggMayXzmDP2wSgOm6J+Lhcjjx6iHalQv0TNLUJ/3I2HJsOSPE8b7Yw73PfIG/KGCbKpVqpDD4WAA8+gb5VUjvzP7UOycXMkYBFCPcexFqWrU1ZsCeTlVul9S7fnw3LSOdESYM3AzNDum8Vj8GTY+cmfmK/aNXz8V8Su9WP68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731292007; c=relaxed/simple;
	bh=JqpB7SZubFqe89D7DBdOu5N3pQV3sXQ8xMAaYMMU988=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ItNAZj/U7qx5ka1PEQcWwhkD9RCz90o2kRatCJamYS0EDxu+G65DNx79ti2ukv2P2K6zLbJ6bjbox1EF2dR0gBOjb+h1oIYdpqnG+5I9Ohs2RNUxmU9XetOmKCh8okZydhwq6zoc20TpUdJFTSblGn2hKgaXkQnha2td9WJ/4Hw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lZ5SWCml; arc=none smtp.client-ip=209.85.160.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lZ5SWCml"
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-288b392b8daso1828870fac.2
        for <linux-doc@vger.kernel.org>; Sun, 10 Nov 2024 18:26:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731292004; x=1731896804; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fzfS48a1GIzGY3xt87dhk1WqlkPms5JTovOMxU3WonI=;
        b=lZ5SWCmlKfwVMZjBX2l05PoTCzWjwjFRj2EAAqgPp+A0KUeLdksUdrqM8ohIV8euiH
         COnEM3P4MhEm0id3Qtr8qpZaIo4ByiMxJHkYQPjLpNLQKCyXGrolTYUWZdkhV0Rj+cTW
         7wDQ5zwm1Ks59MStJxacR4XSTQrSStEUOj+hW2E/G5MKjWE3VHUBkohMV3DCL4gMLQM8
         BJDRCdt1v221fTm4sGZa+yv3HkII1LB8v9CyJV/h9vp7fnv59CmC+PrIDV3Hy0q5G7Ok
         P2VNC+oW1jabRmVoovCtPdHNB8hGfiiPiGZLmmRlzAADafZUTgPCWzNf3nkPUjnoLK6U
         lavA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731292004; x=1731896804;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fzfS48a1GIzGY3xt87dhk1WqlkPms5JTovOMxU3WonI=;
        b=FLUORkwUZISRfOjvRp0SIU1xj0j6btJCcMQ3Vdu7JB7R2RMZNcCnqG5oUGfDIVPoMS
         7NTIIG1vwWaLZFs5UL6smM4Y8uufcYVGW1iPY6evaK7OG4HE5PIg/SccG+45FB//K6sK
         SfmjfkU2fs5w5fvPGlMqBIrZpTb0IaYa0yilzPnyWwbitpe9SscFnYrYUTgRjlqemoGG
         F2JhnW7Cx0VH/vVZWPtZ3o/Rnc0Vjg3RO+ER6FCkdVowWPlBs22/R7eZQtOlv0g9kr1o
         IE1sBNRlUui7cxcctBIV3JIbxeeerMhvCc/QRFkqaqbCSfOiMc26Xh8qB3Da0ugEGd86
         W9Vw==
X-Forwarded-Encrypted: i=1; AJvYcCWBvlb3iFjIFnbnh+XwWV2pqame03NAYlco2WepqAFF91Kls5Ugg+Xt0SE0GmFO7+19N03CGrFiPOY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2OhVZEH5Oth6CHS0CeiIurFnYCO+qITdxhxNzIfB+LUqBM77Y
	ueOIkeiYMOLj/tygcbmIMwVXayZoe5FbcwUQCpJHNpV4VJ7IKkovxcaTl63UgmegGtc2u+O1mq4
	sDx7P6c6DRZSjPGcpemsV64KoC4o=
X-Google-Smtp-Source: AGHT+IGMOscR1LGeFI6OuLyBsNoF0tI4gNq2v5+mEPQEXgrPd7ym8GucTYwtwIzAON70NrFK2r24DrVAMETTKcLK1VA=
X-Received: by 2002:a05:6870:31c8:b0:277:e039:7aef with SMTP id
 586e51a60fabf-29560008d60mr8471148fac.8.1731292004193; Sun, 10 Nov 2024
 18:26:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAD-N9QX7B_io6wnx47w_CJpBF4vFOSS5wskr591BP1xPtz4cYQ@mail.gmail.com>
 <87a5e6vlr1.fsf@trenco.lwn.net>
In-Reply-To: <87a5e6vlr1.fsf@trenco.lwn.net>
From: Dongliang Mu <mudongliangabcd@gmail.com>
Date: Mon, 11 Nov 2024 10:26:18 +0800
Message-ID: <CAD-N9QUGNsm9vm7vcRnBkcd1xWMghFt2T69E3_qRZo06wFfPmA@mail.gmail.com>
Subject: Re: lwn.git does exist or changes access rights?
To: Jonathan Corbet <corbet@lwn.net>
Cc: YanTeng Si <si.yanteng@linux.dev>, Alex Shi <alexs@kernel.org>, 
	HUST OS Kernel Contribution <hust-os-kernel-patches@googlegroups.com>, 
	"open list:DOCUMENTATION" <linux-doc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 11, 2024 at 5:09=E2=80=AFAM Jonathan Corbet <corbet@lwn.net> wr=
ote:
>
> Dongliang Mu <mudongliangabcd@gmail.com> writes:
>
> > Hi all,
> >
> > Our mirror site (https://mirrors.hust.edu.cn) reported the following er=
ror:
> >
> > Mirror=EF=BC=9Alwn.git
> > Upstrea=EF=BC=9Agit://git.lwn.net/linux.git
> > Return=EF=BC=9Afailure
> >
> > Please make sure you have the correct access rights and the repository =
exists.
> > git update failed with rc=3D1 fatal: Could not read from remote reposit=
ory.
> > Please make sure you have the correct access rights and the repository =
exists.
> > Total size is 2.8G
> > =3D=3D=3D=3D SYNC git://git.lwn.net/linux.git DONE =3D=3D=3D=3D
> >
> > Jon, please help check if lwn.git has any problems.
>
> An update on git.lwn.net broke the anonymous git service.  Fixed now,
> sorry for the trouble.

Great. The sync is already successful.

>
> jon
