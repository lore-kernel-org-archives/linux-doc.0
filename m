Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792428606;
	b=XX/h5/kg8g4/Hl1ueuoSzsvRDQB3R2lHFNAUX5jqoALEJ8gR3tp+BKM2BGyPRZDP05lJ
	 aikAjbf7SpfJVewGIaw5rl0eR9TAdAqxqVAOP+2imxtnkKTa2GM9tE5GJXCfUxMmoXItN
	 bxJBuggzHDMG2RFzthALxTk6m5ZZmPsAJRzQb2DfUJVz19EtlE3e/7Km4v3E/fUXPpzWk
	 GDqpnn4jdXAZQndTPrJCNkqF8ELaRhQKlVgB8TAQQhRm1QG8Zlz2EzbGNCHQkAUwT/QjG
	 h0v48GfNZK4DddMxRacEVuWQ5AZ1Cfyam5k2GmXc5DmV1rzulIkFdmzcQRuC30voqIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792428606;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Subject:From:To:Cc:Date:In-Reply-To:
	 References:Content-Type:Content-Transfer-Encoding:User-Agent:
	 MIME-Version;
	bh=Uxw38r8wB/IQJnVPPwaZxC07zUgL/ICYp4/1chpBGhc=;
	b=yrJCXmSrzjSH6dCpE17QLpmOLSgLZPbifqqXeV0etEjNHgfmcj3w4VzlrK1Z3QuB9mqb
	 VOU/AfKaS/TjGzMEAsCYEPZk1VvtEWJs1kg1+IB8+eVBl5/+su6rd26TBzTGJ9r+ZDbJQ
	 lbQGDCIXWtBUt48SOw+OM9r2WYeBoL4xABx/l3rKvTF+wLgGPdEP62yAX6VW4l4vZ3vpi
	 eNstsib6D/73NH9WX2nRb9jgVHNPyvn16sM3h5XLbp9m2UO3ohP9CioPPOMB5703Ba8Qc
	 sFOcchGOV/oUu2JvVLw2YeXygrKPMcDNaZVHf02Z/wwK0leAWIytPI/8Sj9IARHR0SA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=dcRMvGrR;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=eDiGZkgg;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E6C9606A31B
	for <linux-doc@vger.kernel.org>; Mon, 19 Oct 2026 16:50:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2E6C9606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=dcRMvGrR;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=eDiGZkgg
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792428605;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Uxw38r8wB/IQJnVPPwaZxC07zUgL/ICYp4/1chpBGhc=;
	b=dcRMvGrRYE65JobqEJDpqLlcG2AUFd2X9z6vY7tccthbk8ulGh9fHfHP5R5uhUSZtTnIas
	FnLOYQmG7x7LW9KPi/Lfp2k6zXZ2g4+tpwruPPHPKCxrVxMck1gzPDY+pM0XTYr0vmBCs8
	pEv+LnN8Mpfp8HHCjJYUbcFtGdqup0U=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-263-LPqWzw9QNjSMcifzCLukzw-1; Mon, 19 Oct 2026 16:50:03 +0000
X-MC-Unique: LPqWzw9QNjSMcifzCLukzw-1
X-Mimecast-MFC-AGG-ID: LPqWzw9QNjSMcifzCLukzw_1792428603
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93ecdc701a2so274650885a.3
        for <linux-doc@vger.kernel.org>; Mon, 19 Oct 2026 09:50:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1792428603; x=1793033403; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Uxw38r8wB/IQJnVPPwaZxC07zUgL/ICYp4/1chpBGhc=;
        b=eDiGZkggUvGmkPK8PjiQVX2k3YcgL59lqvZLJAlQnPsJHHX2GIzOJ8FzKkEfD3StbL
         pKVLwkvgjzSu3unmR/AQqh5lVn6itXI37kYmdpgk35fjOJrtmsXnE/lKnGb31zeg5I5L
         eIzYi2kamp3D0512lhUHo5/IhxLbLhJBPGUiNY3Zp7IV+csJabwiuu+L/vZffmpWCVh5
         VX83DpyuaJn7167VE/A5+XS9WN9c9pExbD08Yn086L+ChBLs0dpBG+TVOeL+tav6FAGO
         +erMoD5MGoaHwf5zuqUj7VO2QkwUn2dR8YjEgv+xeSSLjKNIiQLa5hWw1YtQV58oewYF
         Sy6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792428603; x=1793033403;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Uxw38r8wB/IQJnVPPwaZxC07zUgL/ICYp4/1chpBGhc=;
        b=EevG232m03m8d2QoewOiBZ1XycyAVo045oLLtUMUlvSKG/tBT3LBWr+DOC0GjFUnaH
         xTwXojL1hd1Wa86/zfMEhZGDcDCcRe/XjHY5FU3bkTz4NhTqQEjNzmpR/79Pli5e4YMD
         qhldCycFJeUFbbaHIyTBH6m3vbLKXABdorm5SDgvxkgnBl4F4DtqK9i6Ej8LJ9XKJ424
         WmFD0wiqoAME8oIFpmupVHJEyWr8XEjPrS9qM0jRKeKjCNUB87GzZpowE1kjBITQIg84
         4ROdtdzgrtR28FNbfWfXD2FjS30P3s7etf+r7eMjZkoYz5a4IeuiiVfiiX/m63Jee24S
         bowQ==
X-Forwarded-Encrypted: i=1; AKwUvByszhyzQWGh8htrPvwGIlRF6DHvtpXC/yZyweCn2R5YuEOqG/Z5BZBkMcGEM46pf5M3ebA8KzQ23Ro=@vger.kernel.org
X-Gm-Message-State: AFq9FYK6ADwAZTPSPlih9VXBUdQwlNw2ApJktqf5FTKDXVRmZzbAlTKW
	JUwLiwqJ73QCTl7XnVqItMHRxuApYLHfnOCMcUrQ+A58rWlyqeWYRgqzLizSWy0OHWYnKIzV5vQ
	iswF4xRXkgfTGf1LfKDSpO8TEHWKcCCFwnM8h6rAzSwdsxUHO220hlQUW7N5hFw==
X-Gm-Gg: AYBFou3vn0xFgIWmc3u4czfiCdffuZNyL94a8E5GReESoLj+706v0innIL1n+z9AcAY
	7Lk56DQMjmzmQ6XWlhUq8JyPRdmB/d0lXdOEGoyx8qBhspBVRcGyuWN1+LLQAj4lHe7XdXUxSJM
	fnHjMG422Te5sgqlPXUOUlGGtMQ+dY8GhiNo8b8wuR/IeoMoC0+BDyTmDolMX9T4hXn3ytuc2Ye
	rQVp9cyfs+7Qv2NCbL+g0aOhQI7hYjcHq5JDCTegtO4fQpbIRNzNNwdgR/07pRSAdEuNgPj0Z29
	a7Rl+N5MiaBFChudahd74kIvQ4K/clEQz1r7b3Hfhw8vFiGlIzMpfHOL/KMJZAnDcWZM7+c=
X-Received: by 2002:a05:620a:2954:b0:93e:48fc:aa88 with SMTP id af79cd13be357-93f29d492c0mr1355988985a.44.1792428603067;
        Mon, 19 Oct 2026 09:50:03 -0700 (PDT)
X-Received: by 2002:a05:620a:2954:b0:93e:48fc:aa88 with SMTP id af79cd13be357-93f29d492c0mr1355980285a.44.1792428602323;
        Mon, 19 Oct 2026 09:50:02 -0700 (PDT)
Received: from [192.168.8.4] ([100.0.180.93])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93f4af42903sm3989085a.5.2026.10.19.09.50.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 09:50:01 -0700 (PDT)
Message-ID: <c0e0a34aa136104c9644e007032b98cf0d56417a.camel@redhat.com>
Subject: Re: [PATCH] docs: remove Assisted-by reference
From: lyude@redhat.com
To: Jori Koolstra <jkoolstra@xs4all.nl>, Laurent Pinchart
	 <laurent.pinchart@ideasonboard.com>, Lorenzo Stoakes <ljs@kernel.org>
Cc: Kees Cook <kees@kernel.org>, Randy Dunlap <rdunlap@infradead.org>, Sasha
 Levin <sashal@kernel.org>, corbet@lwn.net, skhan@linuxfoundation.org,
 federico.vaga@vaga.pv.it, 	apw@canonical.com, joe@perches.com,
 workflows@vger.kernel.org, 	linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Date: Mon, 19 Oct 2026 12:50:00 -0400
In-Reply-To: <28216768.791900.1791897606751@kpc.webmail.kpnmail.nl>
References: <20261009083137.3-1-sashal@kernel.org>
	 <202610122124.08E058768D@keescook>
	 <ea3ff257-70e2-43e4-aba7-140e84994872@infradead.org>
	 <202610130120.E43D236E@keescook> <as4gLo_6acb_zZu0@daedalus>
	 <20261013125559.GG4214@killaraus.ideasonboard.com>
	 <158571150.788122.1791896588591@kpc.webmail.kpnmail.nl>
	 <20261013131056.GI4214@killaraus.ideasonboard.com>
	 <28216768.791900.1791897606751@kpc.webmail.kpnmail.nl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-2.fc43) 
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Tue, 2026-10-13 at 15:20 +0200, Jori Koolstra wrote:
>=20
> > Op 13-10-2026 15:10 CEST schreef Laurent Pinchart <laurent.pinchart@ide=
asonboard.com>:
> >=20
> > =C2=A0
> > On Tue, Oct 13, 2026 at 03:03:08PM +0200, Jori Koolstra wrote:
> > > > Op 13-10-2026 14:55 CEST schreef Laurent Pinchart:
> > > > On Tue, Oct 13, 2026 at 02:28:43PM +0200, Jori Koolstra wrote:
> > > > > On Tue, Oct 13, 2026 at 01:25:59AM -0700, Kees Cook wrote:
> > > > > > On Mon, Oct 12, 2026 at 10:56:59PM -0700, Randy Dunlap wrote:
> > > > > > > On 10/12/26 9:24 PM, Kees Cook wrote:
> > > > > > > > On Fri, Oct 09, 2026 at 04:31:37AM -0400, Sasha Levin wrote=
:
> > > > > > > > > The Maintainers Summit reached consensus to deprecate the=
 Assisted-by
> > > > > > > > > tag. Remove the documentation requiring it.
> > > > > > > > >=20
> > > > > > > > > Signed-off-by: Sasha Levin <sashal@kernel.org>
> > > > > > > >=20
> > > > > > > > Yup, it has become as redundant as specifying what editor I=
 use. ;)
> > > > > > > >=20
> > > > > > > > Reviewed-by: Kees Cook <kees@kernel.org>
> > > > > > >=20
> > > > > > > and for those of us who don't know details about the discussi=
on,
> > > > > > > how is it redundant?
> > > > > >=20
> > > > > > No, I mean I use an LLM constantly for almost all aspects of my
> > > > > > development work, in multiple dimensions, so if the old tag req=
uirement
> > > > > > held, my email body template would just put "Assisted-by: LLM" =
in there
> > > > > > because at the very least, it drove the build and test stage. I=
t was
> > > > > > redundant in the sense of "yeah, of course I used an LLM at som=
e point
> > > > > > for this patch". ("This tag means nothing *from* me")
> > > > > >=20
> > > > > > > Do you assume that everyone now uses it (LLM), just as everyo=
ne
> > > > > > > uses an editor?
> > > > > >=20
> > > > > > I don't make that assumption, but I always held the position th=
at the
> > > > > > tag was meaningless because it's the human wielding it that mat=
ters:
> > > > > > they either sent a good patch or a bad patch, and if it was man=
gled by
> > > > > > gmail or an LLM, it doesn't really matter. ("This tag means not=
hing *to*
> > > > > > me")
> > > > >=20
> > > > > I think the tag did have a genuine purpose for a while. Now we ha=
ve just
> > > > > decided to implicitly attach it to every new submitter (because
> > > > > basically that is the case.) The point was that a patch that was
> > > > > obviously LLM generated could be rejected for not carrying the ta=
g, and
> > > > > a patch that carried the tag could be asked to explain further (i=
f they
> > > > > had not done so.) Or at least, that is how I felt and have unders=
tood
> > > > > Greg, for instance :)
> > > > >=20
> > > > > Essentially, the way I read it, is that Linus said we don't need =
this
> > > > > roundabout way because we can just reject effortless LLM generate=
d
> > > > > patches outright. This is good and an improvement.
> > > >=20
> > > > The absence of the tag on a suspicious series offered a low-effort =
way
> > > > for maintainers to push back. What's the proposed low-effort replac=
ement
> > > > ?
> > >=20
> > > To ignore it, really. Even less effort :)
> >=20
> > Are you saying that we should ignore series when we have even a slight
> > suspicion they're not perfect ? If not, I don't understand what you're
> > proposing exactly.
> >=20
>=20
> I am saying it is up to the maintainer. The word is out and we are allowe=
d to
> ignore poor contributions, in particular if they are LLM generated. The w=
hole point
> is that in the past poor contributions were still a signal someone was tr=
ying and
> it might be worthwhile to help them to grow. It is not that signal anymor=
e per se.

I consistently see new contributors getting involved in the kernel who
are not using LLM tooling. This is still very much a thing, and I would
advise against missing the forest for the trees because the new
contributors with LLM tooling are so much louder then the ones without
because only one of those two groups can send patch bombs at a moment's
notice that require going through in order to know whether or not to
ignore it.

> We need other avenues to identify talent. The kernel mentorship program i=
s one of
> those, as is showing up in person at conferences.

This is an open source project, submitting work - even for people using
LLMs - should be one of the ways that people can get involved. It has
far less barriers to attending a conference in person, and not all
contributors can or want to be at an in-person event just to contribute
to a project.

Also - I've been a kernel maintainer and I've never been at LPC. I know
plenty of people who have never been to LPC, it is more then just
financial constraints. If an LPC is so truly representative of
maintainers at large here, then why are there maintainers responding
here with objections? What challenge would there be to actually opening
this discussion up to all of the other maintainers who were not there?

>=20
> The tag helped some maintainers to push back (like Lorenzo). The tag isn'=
t needed
> anymore, because the push back isn't needed. I think that's an improvemen=
t, and at
> any rate was inevitable.

It is, though. I want people who actually took the time to learn how to
contribute to a codebase I maintain to actually have some kind of
priority over new contributors using LLMs, because we still attract new
contributors and talent who don't want anything to do with LLMs.
Projects like Asahi I've pretty much only started getting involved in
because of their no LLM policy.

Have you considered that maybe this is a self-fulfilling prophecy that
is partly the result of a lack of maintainers and the difficulty
imposed on new contributors getting involved because of policies like
"just ignore work and don't respond if it looks like slop"? The person
who could contribute and decides it's not welcoming, or there's not
much chance of their work getting reviewed, etc. is not typically the
person that says so on a mailing list, or as I've started seeing - just
simply doesn't want to look at the project because they are not
enthusiastic about working with LLMs in their spare time or ever. More
likely, they just leave and don't contribute.

Has the rest of the kernel really gotten so bad at attracting new
contributors outside of LLM spheres you just, don't get these people
anymore?

>=20
> Best,
> Jori.

