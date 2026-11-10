Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794337070;
	b=3+zntlBD1Q543a4Y6rGDiM54ufqCEFdtHlKTPbd2PrlZkVAk7nlSKhFW/2AP9OIxE4I2
	 JVn1bSN5GeR5NuMqHepg1byGpK5lFiOxx2WT/dQlqbpZBxgSTr2902W2n7iMXKofgnmZ3
	 tH6NSVZg9GYtTxmgGEaW+vHVVuy2FzF9Ny3gdXUAZvew773Ui95JCGjxT2F8LzBmkB5v8
	 PnbmN8xVKDB9KdrTzeG6jAjUPQz8W14HesiRiH2YxEf/WhM3J4w0VwP9ZcQfPX4CYZBOV
	 IYNOH5HwFk/p+f0BOU+an+ElKojP/F8b+HKI1obunaoBAPGttgTMDqAlw6Hoyr5TB0g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794337070;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=jZ2q7zCDeh9+qJcv+PdbfEkMzzuX6IJChiSNXNctPLA=;
	b=jdBpQ4Rm7xKnUMwNXgUO3hfoJrQAgPr65m6SPxaBnwzVhZpkWyvW0t8lXhSvu7VLq9H6
	 imDZ9Hle4ykYfkXud14js3dPhThEIDGLjv1gnXzvm/7JNFe0jRBEe+/N53U1bx4Q+a+xs
	 JuiPn5p35CnXsiFAfE2EanS+MC8mLGAoX8+GNEp329p8foeq2j9o/7AA0fjUSEH/13XXn
	 qL5ELKC/Um/hiRNULwDMroyNV3ex//X1vw4v3U7AZki+5OwQjUYGSMvNXYY0jXSo8XAJ2
	 +jmWgpZ57XzyJqYJcdEbK1z3oi0hhCabBpB7EY0GRrzsnn/JgdJdqstnT/Etnm5L1Dg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=iQtu1cWh;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.42
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 350E460A2609
	for <linux-doc@vger.kernel.org>; Tue, 10 Nov 2026 18:57:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 350E460A2609
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=iQtu1cWh
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5be4a2d94adso2170136e87.0
        for <linux-doc@vger.kernel.org>; Tue, 10 Nov 2026 10:57:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794337068; cv=none;
        d=google.com; s=arc-20260327;
        b=MD409RooG4AouXHtHTcz5pP1YAIe5pqmW19R5GLcQsWjVZod+r8+YyW2BYPvg4IyPF
         r5Wu/Qqxzvl9lhbCpI1BkPoZm5m+foMMrwe5PRCiR4XSe83FH3c7ZXOiFxf0KuffIamm
         U8N3Wjf3Wtt+diMFS9hSSKep20oHud2GxMzhpX3gNPfDFRFtLAomj59QreMcPu5Xu5mw
         N+9wRTrbLEIIXkn/pcglJzqBsye9cclF6LtWAiqlKYjhfBQ++2KLoHNgd1fdS8886H1g
         ilij+r+hO22MpIl1vVzOkfs1bvQG2kDA33vu4+fzY9FNj8j8Ks1Fo5S9tkWjmbcfrs9f
         FYfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jZ2q7zCDeh9+qJcv+PdbfEkMzzuX6IJChiSNXNctPLA=;
        fh=pZ7Ex4m0vjpw504ugL1fB6SupxZ3PSNhvhPWlnwP/aw=;
        b=KKimnpqwXTcuUdtZZB79ioxe3x2G02mROUvp9kBR9BoQkkMHbGHWZo8VPVg8d18z2t
         JQ7R/MxMBcn0k/g5gVSPpXvVrjF5pOwFUB8rGBFDXqsxXRvHDjKXRjhrklOJz+aKS+fv
         R2HEpygJh8SAxvsQK0merS5yIbgUDhlOBdJalWhbrNvlXWNdfvSM20wqtmQflQ9h39dC
         bHCGFyDXXT9GNKbEYBlnjwF6uGfdWNISV6aAvoDjECWj2nzpuxGqkc/pdqpMSSFTuqHn
         +55W3IJt9kHEah2oQYKxwobe6W9cw6y8dnI3UE16ijRfe/xR2wRle1RbwCf7HnEipPXf
         TgUw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794337068; x=1794941868; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jZ2q7zCDeh9+qJcv+PdbfEkMzzuX6IJChiSNXNctPLA=;
        b=iQtu1cWhnOLMlZ4E5YGX7Tg7W/m3OqQiapHg7wYxHLF4F3LmarjWo6O16g6NCVP5/I
         h6lLQXA8mKzDp5HNFA9ezPw+Tk1ftzV65/nweBFK3hRTbq033BeSICNH87SZNvN82II0
         0EeyQkE0DJCwIV0l+fpETv1vCCLzlYomtS/Yu5c6H3KuAUuoIqraEm5UbUjQ+MV51/ap
         jVFX2bWotbz5ty/PLs9cHOlrEqSpBmipZNsED4BQ1rTcPZ5pkNwj+Cl3nmOmqax7QAkn
         Sz1ONCybN7zHEfCjN3TqINbLN0oKsSnEwQCRRXCwiULshPoqjwdcVXaT+s9TW3i96tUN
         U5nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794337068; x=1794941868;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jZ2q7zCDeh9+qJcv+PdbfEkMzzuX6IJChiSNXNctPLA=;
        b=sW6jtBACdJyyYM6ejeOHNhch2fsgxz1tQzFiS4UHF4f5yQNF6nCuaaetC/v5Gxwgiy
         /c2BmVsDkt4WZrJFfFkNafUHxktW9akpmCNWa4Fb+xfgYfdpuBfGjYc8RTW7osQboaQi
         j+lxPq/wfR+M1A+zZhVLwpsUVel4W4vLFkst6XpjCro3SMjCYyubJOg25FsreDR8JH36
         Hq148L9IXUoIJJubHkvF0aTQUBFPtOgVDyOtxnR+LRURZQ+tVnWtkQImGXJBjJR+gKGB
         ZvbAVT0B36KkbLX+KVeWcmJl2QvS8Ok/bwPiE9x+Vr9KuOJ4vFZuwzS3KOTc1JWTd21h
         KFrg==
X-Forwarded-Encrypted: i=1; AL+hErE9cwV4vTiA5VilkTXrP38DYsXqDaXvuQ9b/JM735q1gvSwpSjFcQax5vKXy1lHSL6YfZ28RRF04cI=@vger.kernel.org
X-Gm-Message-State: APuU4Z8nfqNi3J5x44HkNLufDWc9saxE6gdfZMLCpVE7u2mH1KWbPjCq
	0amZD4GsODcNSjAwWUN2KH9jo6lAm9kHV5kyVT1QYK7nny7o5fRAUbcUKxPHbnumswHRYwbM3MO
	BToIx6wAgrXa4yoTSDoiKoYvh+EzOCAsfWbgjkyTd
X-Gm-Gg: AYBFou2u2tuUVWv1D013yGRjCwYjx/YGUTswE6qJjAR3lKECytFoKcrVXnJXEvUgR7F
	c8CsJR4fSSm/qn3yvqkKmNv473nUQSXCnnJRJXuzaqAVcanJlMXbHr9Pr88+AySLW5akJm0UFUW
	uL0VhdDniEQRrzdz0scExjhy6Eqi78hl03uUKyEZpvctdMItb2uaLC1mINDT+1tBYYeeEOBjWgJ
	0KFhiL3EsAsP0K5FCxhWZdXF2AtBFlKM48pnOYv4YgLzPR9XW0/lcrv69UwH+OcQshfVKmtsWR5
	9jhDuDsbvWWsB3BctS/D8i4fBgA4LfvGd7t0ktxw66fodO8jo6Q+BUR7nGoaHVixmHxpqwWPxXR
	rpUV9xCYrl8sNJD2xbbO3bBM/lpnmU//eGcejEF07O7UBXMI36nCf1P0ll5BKlBEXhbk=
X-Received: by 2002:a05:6512:2381:b0:5c0:a80:2837 with SMTP id
 2adb3069b0e04-5c156ea57c8mr1243048e87.45.1794337067799; Tue, 10 Nov 2026
 10:57:47 -0800 (PST)
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
In-Reply-To: <avKAaJxlxE8gOYVV@google.com>
From: Siarhei Vishniakou <svv@google.com>
Date: Tue, 10 Nov 2026 10:57:31 -0800
X-Gm-Features: AclHuK_Y7tuYVtqC14Xyd8VRbI_P-1UHcUvd0-bsysWD1j_K221SrIMS6_jP6lg
Message-ID: <CAKF84v00nJ_+2Tf8m66LhGEKvqnHb26YD6p+FRUXK5juYEPQZA@mail.gmail.com>
Subject: Re: [PATCH 0/3] Input: add ABS_TWIST and support it in HID and Wacom
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
	Ping Cheng <ping.cheng@wacom.com>, Jason Gerecke <jason.gerecke@wacom.com>, 
	Jonathan Corbet <corbet@lwn.net>, Henrik Rydberg <rydberg@bitmath.org>, linux-input@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BF=D0=BD, 9 =D0=BD=D0=BE=D1=8F=D0=B1. 2026=E2=80=AF=D0=B3. =D0=B2 18:25=
, Dmitry Torokhov <dmitry.torokhov@gmail.com>:
>
> Hi Siarhei,
>
> On Mon, Nov 09, 2026 at 06:06:29PM -0800, Siarhei Vishniakou wrote:
> > Some styli can report rotation along their long ("barrel") axis,
> > commonly referred to as "twist". While the HID specification defines
> > this usage as HID_DG_TWIST (0x000d0041) in the Digitizers page, there i=
s
> > currently no corresponding evdev axis code to expose it to userspace.
> >
> > Because evdev has no MSC_SCAN equivalent for axes, drivers and OEMs
> > currently work around this by mapping stylus twist onto unrelated axes
> > such as ABS_Z or ABS_RZ. As a result, userspace input stacks must
> > maintain device-specific workarounds to know which axis carries twist.
>
> How is it different from orientation?
>
> Thanks.
>
> --
> Dmitry

ABS_MT_ORIENTATION describes the 2D angle of the contact ellipse (or
tool projection) on the surface of the touchscreen. Looking strictly at tha=
t
initial sentence in multi-touch-protocol.rst, it sounds promising:

> ABS_MT_ORIENTATION ... The value should describe a signed quarter of a
> revolution clockwise around the touch center.

However, the rest of the section clarifies that this is the alignment of
the contact ellipse with the X/Y axes, not the "twist" of the finger
itself. In fact, the docs note that orientation can be omitted if the
contact area is circular - even though a circular finger or stylus tip
could still spin in place, and that rotation would not be conveyed.

For a stylus, orientation is equivalent to the tilt
projected onto the touchscreen plane (which single-tool stylus drivers alre=
ady
capture via ABS_TILT_X / ABS_TILT_Y).
By contrast, the proposed ABS_TWIST can be thought of as keeping the
stylus at a fixed position and tilt angle, and using two fingers to roll
it in place like a pencil.

This also matches the HID Digitizers specification, which defines
Azimuth (0x3f, rotation of the tool projection around the surface Z
axis) separately from Twist (0x41, clockwise rotation of the tool around
its own major axis), and hid-multitouch already maps HID_DG_AZIMUTH to
ABS_MT_ORIENTATION. Since styli can report tilt/azimuth and twist at the
same time (and single-tool pen devices don't use ABS_MT_* events), twist
needs a dedicated axis.
