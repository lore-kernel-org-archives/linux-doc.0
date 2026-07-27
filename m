Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A62A23DDDAC
	for <linux-doc@vger.kernel.org>; Mon, 27 Jul 2026 07:57:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785139073; cv=pass; b=OeGwKGDftGYg4y8GIdq1tU7onLkHBBhlvKhphFFXcKy4XhFU5F7JehBl8vyxA+b2l4A3oRoJvl3wRywgPZd21/GKOUEk72rsRTsp3ylUtVRIB/hlNFGvmuJtnFxhgy4tuZheZTb/Sr2qJh+dyA2f9hVx8nPTbbP2vFRIUUJjvA4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785139073; c=relaxed/simple;
	bh=Mtj7E3sp4PM/1qDolAPNcQQ7cQN1ADKk1/zSl9D3Kg4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=T6gDuA3Z3gXDtau481l4Jed/VsbigbzRtDR0OOuJtqXpOl/0P6aL4oL30QIkCjx25xbFrtv9dbWvdtBAjc/AZeK6rQuOyrvv5zKDJQjr7ZgMx9B+hFW+V2EQi8y6Adj8aqsB5AnusRri9XcoKiQKngFcLhgHsbHiaggDox5T2zU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amacapital.net; spf=pass smtp.mailfrom=amacapital.net; dkim=pass (2048-bit key) header.d=amacapital-net.20251104.gappssmtp.com header.i=@amacapital-net.20251104.gappssmtp.com header.b=QGT/Hzkt; arc=pass smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amacapital.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amacapital.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amacapital-net.20251104.gappssmtp.com header.i=@amacapital-net.20251104.gappssmtp.com header.b="QGT/Hzkt"
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-39f1ac13687so19049761fa.0
        for <linux-doc@vger.kernel.org>; Mon, 27 Jul 2026 00:57:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785139070; cv=none;
        d=google.com; s=arc-20260327;
        b=nJQfgHZ3zUtOq6HpYMhd6pBvaxZl19oVwy9sl9HXQ8IwGpKO18gB3kIMscOXWfWwLv
         /3uyTOdT8Xl2uMwpiqihHKfDHaGWdQ3uMgN17aO7gZXYXzVR+wGIwntAiHvpwDfrs4WX
         VPCj2i4zEsuAkgH6un3rNq03is34pmjZKNSI3GMl/sJcjHIGCMj8PLOl57XFCkElkPV+
         fjDIqYUYVTyzvjpD99pMx/bx7wUKEBb9e+gl6B1VYku36+YICv1rhoBiu5YJGZxlPhLa
         YWM6vQbk/38Kr9snx0v0VBhb40AVUV76eiqPkR+Vh0VxAU5tqMO1+jslx8wDSXLyzspd
         C9jA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=iUOhhztmgpvLEc5gPCO2PXYJYdr4yBUECC9y0Kg5xWU=;
        fh=g7kugTXTpthXUO6gBo7uothzNtpGR0XA/QLR7M6GBZA=;
        b=biY7qutW7TN0M5t6IomE+OnHILihDlMb1sygc42aGdZQxp7476HWuUoWL/rTjwKStt
         6sTvFDjU3DRT/qwzUHzmAppecSEOLb45bX8qIGTMpmH3rWKkQU8a17gSEN736ti4weV1
         za46UhF6s1z2MyWFITrViFySyxgz11kgjd+P2HM+2Luv1aJoN4YfcTgW4tLhWU/ke6t1
         sj34RTQV81u+hq3aUjW/lTt7wHkpXexjHEc0s/xSeYznotFRHqs1iNe1iNnb8+ENmrC5
         +Sr+tzanwx0ZVOVp/OTlnnUWMVJZzrIGD9rleoy+wOTmB5jMsd6QINgSKJrLHKSJyL4W
         LCxA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amacapital-net.20251104.gappssmtp.com; s=20251104; t=1785139070; x=1785743870; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iUOhhztmgpvLEc5gPCO2PXYJYdr4yBUECC9y0Kg5xWU=;
        b=QGT/HzktyAZSYyS09YqGyszjwpR9WaHAQZSpwmQiSDK+92Vx8KG5uDnrBOxkOPVkz0
         ENQ2BzBGxtoNHzoYZwYbWxjhT8699JNMpvdlo4kbtUACKLyXuK9XJ3mh1+upZvmPVCeT
         tfGgrZ7N4t/nAGGGJfDljcKJm/6S6WL407Ho4dGVAbsDBTbOOMm427JfZqqqhnwWRC5F
         pOY/thFRmCro/TWt6YrJlxNC35zgqHbAR1eF1QEJpP2XUVMNNiLOIEHVFEEnzYc6XNUu
         Mwlyhrqi10zSfvEgDQFPnd8Jc/o07XnTnNU6UkOyBYV2EWrEPd9skuMCL9mgsDKpTXFS
         2zrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785139070; x=1785743870;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iUOhhztmgpvLEc5gPCO2PXYJYdr4yBUECC9y0Kg5xWU=;
        b=i/Q7C+dLphWPlIb8QDUqX8huT9fzXrhXsnWzUKZXbmzbe89ntWCd/z+6QlC0PJ024c
         ZFOYjKG7G1EEpZZtOlDdSgvfmHsHAJclWiYb/CH9kS5tD+EEixOTC/3SxuxqdQO9+0BR
         tAJYrJS1UgXmfYem7r91gBIwQEhFRLQLE8vzeOzN3R9g1iOYOAQH4Ow4dDY02Q6aUrK+
         kh3GeuvjcFQGYGlUq8C6wTxyyzbmlu7130SDot98kY0FkheK52H/HlX8Q+zxfJbUeaj0
         UygmoSQ+WfgrHQzo5xiJEBzTcYJW+UPPE16UiFbnFPG3kUjkMSfy/zrL0vjQYoYOI+Bs
         lE2w==
X-Forwarded-Encrypted: i=1; AHgh+RoE12PN8X/oN7Jjdr2OmJiiItoomTw98gmZAuZoLwrndwpbPTDsisa2387e87KySn0LC5axLnnD1pg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8vAJmkTYDsc5CoyNTNibPssnE49F9Hy7kDaSezRaBhtj/vEJd
	0toocOlLTtLkxAs/yxxoh2VUi99q1mqCvZSWypytPLuM5PQR6soHrNaORcDDTz5rqouSYK6JH/0
	2wgXTyl1Qefc6mFwEVSEyoLE3ukoO7oMQ4JBaKYBu
X-Gm-Gg: AR+sD10V2txMk2O/FMr+3WX5ISPhtwpn3SIPQUSrVZUnjc0KRTLGlA5W2tmrAkndAhi
	9Tz+shmtbg65HD+47JaF4sNbGUCCS97nlI3+JE72szCWL//JYpvyLibdendZPx9bIhXQeTbTQqy
	B4jHVcaNlDsChLDc+sgYr3XhT6CbDYXo+nevPyl/OcNUC4nCboFxQQ6CTOlUx2wSbnxD8Hie+zD
	p4z7FU44l56UFoDq1dAY7ThscxfdeyyeFfVrHVCdXA6fmwk5JOzQfHtchz/CQPdhtppJu2/uGQs
	/0znML8HglYLDZNjZ0zrum1DdsyFLZjOVekXXWvizYo=
X-Received: by 2002:a2e:b895:0:b0:396:9630:5ed with SMTP id
 38308e7fff4ca-39f28798792mr12845401fa.15.1785139069116; Mon, 27 Jul 2026
 00:57:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <09b4735f-c04e-40f3-a7f5-254b7918fbfd@app.fastmail.com> <ABB3CF80-5F05-4279-8E0F-73A21E6B9DDA@amacapital.net>
In-Reply-To: <ABB3CF80-5F05-4279-8E0F-73A21E6B9DDA@amacapital.net>
From: Andy Lutomirski <luto@amacapital.net>
Date: Mon, 27 Jul 2026 00:57:35 -0700
X-Gm-Features: AUfX_mwQJvIGRaZR31lPycIR7yR099WfdPkmt1H0sjuC7GUKOwBvxFooo8kQZeQ
Message-ID: <CALCETrVSKnT=wo8j+3bUBjcizEEWcg_a7WtfK_erLDGRqp3f-g@mail.gmail.com>
Subject: Re: [PATCH RFC 4/7] fs: support FD_FAILFS_ROOT in fchroot()
To: John Ericson <mail@johnericson.me>
Cc: Andy Lutomirski <luto@kernel.org>, Christian Brauner <brauner@kernel.org>, 
	linux-fsdevel <linux-fsdevel@vger.kernel.org>, Jann Horn <jannh@google.com>, 
	linux-api <linux-api@vger.kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, Kees Cook <kees@kernel.org>, 
	Farid Zakaria <farid.m.zakaria@gmail.com>, Al Viro <viro@zeniv.linux.org.uk>, 
	Jan Kara <jack@suse.cz>, LKML <linux-kernel@vger.kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, linux-doc <linux-doc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> On Jul 27, 2026, at 9:43=E2=80=AFAM, Andy Lutomirski <luto@amacapital.net=
> wrote:
>
> =EF=BB=BF
>>
>> goes along way to getting Capsicum's "capability mode".
>
> One thing I dislike about this is that it=E2=80=99s (approximately) a tas=
k mode. Why should an fd representing a capability represent one capability=
 (a subtree) to one task but a different capability (dotdot) in a different=
 task?  Do we need to prevent unsharing a userns if this bit is set?   Do w=
e want to have to worry about any task that could potentially SCM_RIGHTS an=
d fd to a task without that bit set? I prefer beneathness being an OFD prop=
erty.

Sigh, I keep thinking and typing OFD, and that won=E2=80=99t magically make=
 it
be correct.  All these privilege restrictions applied to a file or
path reference need to follow every user-controllable reference around
correctly.  So if I fchdir or fchroot to a restricted OFD, my cwd or
root needs to preserve those restrictions, and reopening "/" or "." or
any other path (via root or cwd or openat etc) needs to respect the
restrictions as well.  Putting it in struct path may or may not be a
good idea.

And, if we allow cloning a restricted reference to a subtree to mount
it, we need to make that work correctly too.

Off the top of my head, for a minimum viable product, we could
disallow cloning/mounting from a restricted reference.  And if we want
to try delegation (as in my other braindump email), we could try
*only* allowing delegation via clones/mounts and not in an OFD or cwd
or root, since there are potentially mildly thorny or at least
unintuitive interactions between symlinks and privilege delegation,
especially if mounts can delegate.  (And I think that delegation via
OFD/cwd/root but not via mount is so weak that there's almost no point
-- I want to delegate to a container, and that requires mounts.)

>
> Note that the obvious giant holes in capsicum-without-a-mode (root and cw=
d) and their respective dotdots are fixed, quite cleanly, by this current p=
atch set.
>
> I also think it=E2=80=99s a bit of an ancient mistake that paths like /..=
 work at all instead of generating errors. Maybe a future beneath-only fd c=
ould also disallow trying to dotdot past the root, even for symlinks that c=
ontain dotdots.  This isn=E2=80=99t just an aesthetic thing - if I have ~/f=
oo/bar being a symlink to ../bar, I think it would be a mistake for a benea=
th-only OFD to ~/foo to have =E2=80=9Cbar=E2=80=9D resolve successfully to =
the wrong place.
>
>> Then we just
>> need to figure out things like more capabilities for directory file
>> descriptors per Andy's brainstorming thread thread (which I ought to get
>> to replying to).
>>
>> John
>>
