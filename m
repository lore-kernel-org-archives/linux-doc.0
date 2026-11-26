Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795661405;
	b=ttwWUCKTNDL8p4o/6OYzJ9YxFqIFSkpinh0eWQxf6yZ2v8n0VB6x3EtLOz97JP7TywqA
	 cm0wz8jMlAI4SUIbPZ/gu3x/D4IqwzyzybRmR2RD5C11dueDlK4YkU7QEI2kIX6CN6WSv
	 gKGWDH3ryV/3OXQUg9FdCIzFIQUANc6VWugX0J2u/DU6rQXvj1hzjJLSufJFHiSrcYJgK
	 1sVZrwf2b8OafFnQQpKEUC2kV+T75SElsLI4XBDMpCPS3fiVXqgARacJveGyQNhiSZKSi
	 A1mprMO1OuznxByrAMPpqtgFyxuU68s6bViQTEen1+kEzBE2bhuelIGAe070lAHDi8g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795661405;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=BmeVPwr9SKwxZECZZ/qpqnmowyCWmqTyCjMYX/8OCrk=;
	b=R8RPftSubEfIyQTC6adT1PLEFFfYI6uIhA3s7iw6ewZxLUi1zmwWa+KwuPrVZbw7GOk3
	 XAk/0akJnHu2EFx5oTNZqloRnKbqSFJqlf21sIHfvb9/4WLUDj2f2KLJ6kOUGFpGgAE8v
	 SNZ9lP8Ii0b+hmTj1dxpwzGL4gnuP1bidvVm/+lfPoQy+QK5ZS447ZYUtq4jxgterCtCt
	 Cp12IdZLLZ22sMlo6fNSV2H8gQ5n/Ee586pg93mj9Dvgzb9mZxW6esdSXoRXL9sckwO8N
	 OdPcPqY7z3LKjwKZKz5GshbaiSctu+bIZOst7OuqDVY1vFQH8vROJhLtRFa+mmo5UUQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=epBmNt2L;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.54
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4529E606A31E
	for <linux-doc@vger.kernel.org>; Thu, 26 Nov 2026 02:50:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4529E606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=epBmNt2L
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5c1a947b4adso5439721e87.2
        for <linux-doc@vger.kernel.org>; Wed, 25 Nov 2026 18:50:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795661403; cv=none;
        d=google.com; s=arc-20260327;
        b=Fs4xJErXj00R2ugvmbQxYuzrrvDmajt72ejfKp+jCd1PfQbDksmqZBL1ZOZtamK6At
         TUNfHClYaSVoigrrzbIt1iEn3/8HkN0hnfLcuyYpzG5hH9RVnfUnps6tIAgEEboWr+iR
         LE+tpHNM5fk6qjJfIr2axZQJ12ZAB0hEILkihfAlp8S8rzT5lrX6tvRAU9VQ1SCGriT3
         i52zJl+hTjfHFhVKuJbGyAFrb1qXcIcFfOjeGWuSfQtKugZE0PG3cxUpGXhCDX2TeWwB
         jNf5sLHwlBtj0Wo493X31eARU4pkfKBxaki5mGCWsI4rooidcNN9f5/zvEyN5kQ3/j3K
         ppFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BmeVPwr9SKwxZECZZ/qpqnmowyCWmqTyCjMYX/8OCrk=;
        fh=n/KppdIqmbRLxoIjv7av7ttBbxOot3/3d+wS5NhGN84=;
        b=IvWNdeus/f02lTNPFsRmftT5IBrC05ZjHta3kYgPlzJ/fZsK12TzDdBVuCIPbL61yZ
         Bce8eUhBF51pmWR2eYPKg4II8FPomFRLACqakX/jwbComGGlvB//lcGO0nvorB5paUzF
         oPzRagzsbhvKw/YPmL61EiBDEE4ImAU8VGRyrcIPFY7zrsOuSo9Y3TaAXmoNQTQehKOi
         YXKhCRtFSKlhE1mx1IfpqBRycjWfnDRDDi3UWaPrPOoNVG2eQdzFGgQFJRHGb+R8p1zs
         m+JepLDfyZiDw6i9KwhjcfBFS7TGY6SLq3hyf7JRyPC1LXaUTdk5UOya8WU2zsEfKTvb
         19og==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795661403; x=1796266203; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BmeVPwr9SKwxZECZZ/qpqnmowyCWmqTyCjMYX/8OCrk=;
        b=epBmNt2Lv7Dcu8bzZ4iBr1H6rQ82whFFTrCChG8DCgR1ptCnX78/BbmIpTwF8a7L3T
         eIPXH3FwV2Ahe+Ar796UlHkbFTMIfk6SUNGp7L68LZ4MBNU0clJ1pPuiegK5QlB44jdi
         XeuaJXP4HWpl033aBhoIISlJlOjGvc2OAxZoVeXxAxvPW9IW2PHJc3iil1phHrn3Qmow
         tp5LPWh7gceHx8x8+yaJbZCAaRS+Z/AXpVEVZ6ed8qMJh0n9XCgavhUR49jhSJi6wUd0
         91dLuVfikSCiKeUStFiicmpr8uIEOM1nUNOS25HxhleNe5g1sSWCjIUv8bha7OoZrHM8
         yDSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795661403; x=1796266203;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BmeVPwr9SKwxZECZZ/qpqnmowyCWmqTyCjMYX/8OCrk=;
        b=SyGJsLqskqIflkXWzTTSqAOwUo32hNRuERWn3+RWU/3W7nrmFVhMDd0c6FdrgNWT/t
         r0cJ1vTZLl3t7LxWlxLQe2mkUJ4UcU3vxWnQiOlcp2bLXvLH2+kZwHKeCY16rEipbVSH
         jocannIuQ/rDArW0/KnrBdiTBo5phzzaQ1w6e2vPP5KKArCCDkqQMaJ/n/+wMW4QME7n
         xnHvHUKMNuYliowAWic1uMrfIvu/4tYqxbT0o4ofaVQafcV5TizKZfvxYaKe/xwfXL42
         E3AqyjA4e+0sAbtSzO8oqxBCDi1QagfaKiuE0vrS80TlAccQLaB5ntRrRKzOmY6yRJqL
         QcKw==
X-Forwarded-Encrypted: i=1; AL+hErEOYtgIdD9x2Y9tv7hEVrU82Pv540sXMWPslbC9nUB0AdliANiEQ8i5IeKc7T8fnFCsFU0UjWiVog8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/ukTAgrpb7Mm4pX4F0GJBxB7eRLjh9sxIEryWfLHA1nWr+if5/
	JUwBk7wGBuHsdkLPXTRetO2arlsXC8W09qF9rxEaYxtCiHGXkbzALkbHNT6JjMDjnhuDWOAT2Z4
	od1uO5kwdzbD0tgZbVCViCfGn72kNcPAfcvE/YZ4O
X-Gm-Gg: AZFdTZcSV/9e5HrTLR1BvPLfO8/XGp+3A4TTHWe76gdX/PLpjKNGN54z1s5Podc0Um5
	i2pVH0owLudCN5tY51hr5rnG6b5MAElIaXfqieGvE8IMWlHyuFi7p4uNo5QzkyJFi39ajNtMHfz
	eAW9lM8ehWRUnd/lQ/yBbWFbqtaRzmnM0VAhB5/XIoBNaFLoR6/vAeca5n+OrpYOMqEbmaWjhvY
	OB1UCn/+OjRAJDMqNxBAD2re7Brp3cb7BNwy1NAcHM+YRRFsjsLpR4ZS+aQ4UXjBtaTnlBWb5ok
	tkMq1Wofs6pG0Zx3XuQQFvRywxWr2qH0kQmEICVjWkUeFr05uZborHD/dp9dXvLYpbo01GPPmT8
	JsiNV29HetxB8Q0Ir6yHoBkDhlE946r4lrscZDMj3azoIgslxgs3KWUSjN9vWmJtPQgE=
X-Received: by 2002:a05:6512:1318:b0:5bf:b8f1:80cd with SMTP id
 2adb3069b0e04-5c1bc8c2613mr5298026e87.49.1795661403093; Wed, 25 Nov 2026
 18:50:03 -0800 (PST)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261110020632.4003499-1-svv@google.com> <avKAaJxlxE8gOYVV@google.com>
 <CAKF84v00nJ_+2Tf8m66LhGEKvqnHb26YD6p+FRUXK5juYEPQZA@mail.gmail.com> <awNosbiWPFdsbUN5@google.com>
In-Reply-To: <awNosbiWPFdsbUN5@google.com>
From: Siarhei Vishniakou <svv@google.com>
Date: Wed, 25 Nov 2026 18:49:45 -0800
X-Gm-Features: Aa3M54r6fq9UxV6r7ZXlZATug1kAneGhSH_0CFFee4KvRhKktEz0ou5Sv9ToIW8
Message-ID: <CAKF84v1B6bu_YAAcdKkOxC-BKY8f72tWQMz2s5D3Mg-pMnEH5A@mail.gmail.com>
Subject: Re: [PATCH 0/3] Input: add ABS_TWIST and support it in HID and Wacom
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
	Ping Cheng <ping.cheng@wacom.com>, Jason Gerecke <jason.gerecke@wacom.com>, 
	Jonathan Corbet <corbet@lwn.net>, Henrik Rydberg <rydberg@bitmath.org>, linux-input@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=B2=D1=81, 22 =D0=BD=D0=BE=D1=8F=D0=B1. 2026=E2=80=AF=D0=B3. =D0=B2 14:1=
3, Dmitry Torokhov <dmitry.torokhov@gmail.com>:
>
> On Tue, Nov 10, 2026 at 10:57:31AM -0800, Siarhei Vishniakou wrote:
> > =D0=BF=D0=BD, 9 =D0=BD=D0=BE=D1=8F=D0=B1. 2026=E2=80=AF=D0=B3. =D0=B2 1=
8:25, Dmitry Torokhov <dmitry.torokhov@gmail.com>:
> > >
> > > Hi Siarhei,
> > >
> > > On Mon, Nov 09, 2026 at 06:06:29PM -0800, Siarhei Vishniakou wrote:
> > > > Some styli can report rotation along their long ("barrel") axis,
> > > > commonly referred to as "twist". While the HID specification define=
s
> > > > this usage as HID_DG_TWIST (0x000d0041) in the Digitizers page, the=
re is
> > > > currently no corresponding evdev axis code to expose it to userspac=
e.
> > > >
> > > > Because evdev has no MSC_SCAN equivalent for axes, drivers and OEMs
> > > > currently work around this by mapping stylus twist onto unrelated a=
xes
> > > > such as ABS_Z or ABS_RZ. As a result, userspace input stacks must
> > > > maintain device-specific workarounds to know which axis carries twi=
st.
> > >
> > > How is it different from orientation?
> > >
> > > Thanks.
> > >
> > > --
> > > Dmitry
> >
> > ABS_MT_ORIENTATION describes the 2D angle of the contact ellipse (or
> > tool projection) on the surface of the touchscreen. Looking strictly at=
 that
> > initial sentence in multi-touch-protocol.rst, it sounds promising:
> >
> > > ABS_MT_ORIENTATION ... The value should describe a signed quarter of =
a
> > > revolution clockwise around the touch center.
> >
> > However, the rest of the section clarifies that this is the alignment o=
f
> > the contact ellipse with the X/Y axes, not the "twist" of the finger
> > itself. In fact, the docs note that orientation can be omitted if the
> > contact area is circular - even though a circular finger or stylus tip
> > could still spin in place, and that rotation would not be conveyed.
> >
> > For a stylus, orientation is equivalent to the tilt
> > projected onto the touchscreen plane (which single-tool stylus drivers =
already
> > capture via ABS_TILT_X / ABS_TILT_Y).
> > By contrast, the proposed ABS_TWIST can be thought of as keeping the
> > stylus at a fixed position and tilt angle, and using two fingers to rol=
l
> > it in place like a pencil.
> >
> > This also matches the HID Digitizers specification, which defines
> > Azimuth (0x3f, rotation of the tool projection around the surface Z
> > axis) separately from Twist (0x41, clockwise rotation of the tool aroun=
d
> > its own major axis), and hid-multitouch already maps HID_DG_AZIMUTH to
> > ABS_MT_ORIENTATION. Since styli can report tilt/azimuth and twist at th=
e
> > same time (and single-tool pen devices don't use ABS_MT_* events), twis=
t
> > needs a dedicated axis.
>
> OK, let's add it then. But we need a more precise definition of what the
> values mean (i.e. is rotation clock- or counterclockwise, only positive
> or negative, what 0 means).
>
> Can we also move it below ABS_SND_PROFILE in the doc?
>

Great! I've now expanded the docs and defined 0 to be in the North
direction. I re-sent a v2 series with these changes.

Cheers!
