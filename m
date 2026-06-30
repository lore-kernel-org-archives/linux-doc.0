Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57BD03E1687
	for <linux-doc@vger.kernel.org>; Tue, 30 Jun 2026 05:12:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782796340; cv=pass; b=DRqQKPpyRzxNQRUda5jGxRmAcojfP0YlQiEzoIrroNu/aDdxbKF/Cw8RM2u7fe/gLABlZlYa6JvuoLFRcMVayPFacqBMUxSs5c001nge2+6WapjfZUkyhxZ6iqx3snccTfMcbVJZVN+1RonZaZJK9xYrlcZfPQL7JU4hXVO+bWo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782796340; c=relaxed/simple;
	bh=Jg2KFnUPXXVh2w7pTC0cl0+cUJGWiqwyAJlmxHSLgmo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hI88figrJKgNxHiKUoFRLSEyO9gfEBZjiMDif2zQTtZKizk5L+mDHfl+DV+yqbO2gbVEOgRrWvkVo+yljFfNL8uXBCZtXCd3sbGNu8t+IbM4PUw9hlmRoLlcfl4ka2+/WyWifmaQ9FkPfnIlm88yRHdRUvP/9TngPou+ZSN9KhA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mV8ju92r; arc=pass smtp.client-ip=74.125.82.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mV8ju92r"
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-30b6dad2382so7520568eec.0
        for <linux-doc@vger.kernel.org>; Mon, 29 Jun 2026 22:12:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782796338; cv=none;
        d=google.com; s=arc-20260327;
        b=W/o6+UB1kaX+a5sE+2gxN4kyMn5Kcks8zUKtfjhIcqYcafGn9Vdjeat0bmdS6lciP/
         eNpAOF6U1rPWawN6TGhyauD7fCxOp4tMSXMBebzEeM6T8Az30LT5RhKzLAuyJa7VdrMm
         +K8e33SthLRWDthKr2PGxGO0Cr0ZeCHXpHid/Qe1q8ZNKk7Sk/MTNBWz5HEkrH/Zn9Xw
         /qKR5nwYHtNfWeZTWlDZW8HTCsA7c0sZ4Vtkex0pQD9ObXfNVBa12YZLwvKBnTKrFbmY
         f+eGEE6u2FMdnn5AX5/+GXtDgafdIU8N4lORMqY06S6ksEVSIrJGGqbrYymmzihLOH4n
         oAWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nK415PdI5kDIUChilJR/Nj79A+EUwz7TNDqGP9JEC+o=;
        fh=mhpJpP/0iFDOitEs0VlnmkIXY0itQGMnAHQPOvH24Us=;
        b=j64yGUTl5GReZ/2iS6vp7PxYUnvo6LWy3gkW1P9LP25wkb+j/XfdYJvix31t/N4b4h
         ZLTZ6oozbWBteEq+7t6HAsWNHMwzLyicOaMS7655RFZfXLQ34ka+IA/DKf53a7d+UWn0
         R0IK5nw+nZt8Hze43cj0OZnLcfdSzmuYBTaIapQdR39ecifQRGpu4rqviTpOfcWbJLkk
         oHhoUz3CJU6p5uv0u6b+ezJH9XBAHLUFuabvSV5KLBfDD48E/s6Mt4Rwe42zMmgtJR+L
         bfcTgrTCMul03t8aN8fBKbz6r2scvDd8b3eKiC2GmOvCygzUzktdKtLT+QbK43ct6sxO
         B9Eg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782796338; x=1783401138; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nK415PdI5kDIUChilJR/Nj79A+EUwz7TNDqGP9JEC+o=;
        b=mV8ju92r7uOn2Vc5X3KF/aO35sAnvxGpHAEEtkEwxYqBpoRIC0O8HGBLhigIazDu5C
         CMz9Tky6dBMv+y1GWeiKmZ9I4WZJMSRswHIrJvBxWuXPD6RZBVMgZbK5A1dBObS+/mTi
         50EBpFSpf28gbnuCnUj3xiC/nAajU1slP01IqJnu4s+tUEtDJMS37gB5R751kNdkd9u6
         0Rl+F/wCIL8cCVyCVPqVCjrqS/iCoyFnWeBUfBI8eM/i4+kdmVpCRCCv+AGBK2OQc5eH
         QVbRS5M2jgNEEnPoYzRm5WwmgopdZNamqhhW2Ud/XzJl+fRjoJakmL2h0LJeFKXVkrQu
         jKgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782796338; x=1783401138;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nK415PdI5kDIUChilJR/Nj79A+EUwz7TNDqGP9JEC+o=;
        b=YN30WYxL0+hOqt9tSlsi5lkSe9AVDxnRgcePxluSw19bdRb3THlM8F60BQeUAFPKwq
         SZxm/nQ+aGxdLjmgTnQdaZgEzHHIayqkyYuO5GjxeJAQYCRb9h38hazIacSdUinbJ9Tl
         1yg6iz7WpviQqzFOfEMVwWwPOnfdXgDNI3F9pk6t8htTVcbkSsXgvLVukihLx4YijvIq
         lHfjwqsueh0/l1HLMYECDml4ROH0EUK4Hbv4hX3nDaLCLAOBH7iFm9tQ5L1swBqOO6pk
         lgDXDEc5F0HrJbq1cugfdM5bYi8WihBxzTTda/04Gp/eW+BWQPuvjAOwQeCnsMm2Wwli
         mHEA==
X-Forwarded-Encrypted: i=1; AHgh+RqkSYc2e5yZgHRIHxVBRNyiqM9/9CUwAzAEKtrFi9noOqlsMVmX4BoQe9Q+6DDY5KFQiDVhfQLPCnM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzDNFFTbjWwBAW7/ykukhxh3f2080guBzJA8ih9/Qjgz5NIScua
	daH/1H5BKsh4NlLo7edSuyG+7Oxcs+Kv85a/Z7DWKCDln6gzCx3p8CxJODSLUHOvl4us9kVvO68
	tzRihq0GJxqdAIgl9ZwnQBiO1VJiIDMY=
X-Gm-Gg: AfdE7cne9liYkwjXixKW+qb62HqNJwQPARHMyyRV7x/jK47lrFveL8SE5rt6WZ+AXON
	gcGpck7SHFwfyt7IbO+XtHmthJBFQxw3A4a20RVuj60fYtv6YU45FOz/R7eMops8C5cEflR2tes
	u+ckzu440Ij0IfKoRrUROkmNGyyH13gX4naNsqZKxY3h8/bzy0/LNK5SnC9QDww5hmiV5Ia4lbf
	59zo0h9dEvamMIM1Bmsut5LfrQmsfSOV55Bc+rz0kXQxzZGxOQBfIqxG/IoZa/b8KSeachWak7f
	BmUVtUQbLZ47a37uR0kcM/T1p6jhTxoMJJLYsWzusTaGPn4RWRUZnrbcjVLWdFXHHnAjmdg=
X-Received: by 2002:a05:7300:fd10:b0:30c:b4c2:e46f with SMTP id
 5a478bee46e88-30ee13a132cmr1443873eec.36.1782796338376; Mon, 29 Jun 2026
 22:12:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260628191337.937-1-kimjinseob88@gmail.com> <20260628191337.937-5-kimjinseob88@gmail.com>
 <akJ818gkVzLN7HqU@ashevche-desk.local> <20260630000623.0c030d5f@jic23-huawei>
In-Reply-To: <20260630000623.0c030d5f@jic23-huawei>
From: Kim Jinseob <kimjinseob88@gmail.com>
Date: Tue, 30 Jun 2026 14:12:06 +0900
X-Gm-Features: AVVi8CdocNxkcjtLkEqmDLkN2xM35fTtk5KMTfZs6X8uWqKmDEmufDHm8OnrplU
Message-ID: <CALMSewJo-tnQL9KRyvABHpAf0-k=yOd1N=JzgK91rk0R0j_CBA@mail.gmail.com>
Subject: Re: [PATCH RFC v6 4/5] iio: osf: add authenticated stream parser
To: Jonathan Cameron <jic23@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	David Lechner <dlechner@baylibre.com>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Understood. I missed applying the earlier style feedback consistently
across this file, and I should have explicitly replied where a previous
comment was not addressed.

I will these:
- reuse the existing OSF magic definition instead of duplicating a byte arr=
ay
  in the stream parser;
- use loop-local variables where the variable is not used outside the loop;
- rework the stream error handling so authenticated and unauthenticated
  failures are handled deliberately;
- either update partial_frames where appropriate or remove the unused
  statistic.

I will also check lore for the previous versions and track the earlier revi=
ew
comments before posting another revision, making sure each one is either
addressed in code or explicitly answered.

Thanks,
Jinseob

2026=EB=85=84 6=EC=9B=94 30=EC=9D=BC (=ED=99=94) =EC=98=A4=EC=A0=84 8:06, J=
onathan Cameron <jic23@kernel.org>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> On Mon, 29 Jun 2026 17:10:31 +0300
> Andy Shevchenko <andriy.shevchenko@intel.com> wrote:
>
> > On Mon, Jun 29, 2026 at 04:13:36AM +0900, Jinseob Kim wrote:
> > > Add a UART byte-stream parser for Open Sensor Fusion frames.
> > >
> > > The parser searches for the OSF0 wire magic, keeps partial frames
> > > buffered, checks header length and payload bounds, and passes complet=
e
> > > candidate frames to the core decoder.
> > >
> > > Rejected candidate frames drop only the current head byte before
> > > resynchronizing, so a corrupted unauthenticated payload length cannot
> > > make the parser skip later valid frames.
> >
> > ...
> >
> > > +#define OSF_STREAM_MAGIC_LEN       4
> > > +#define OSF_STREAM_MAX_PAYLOAD_LEN                         \
> > > +   (OSF_STREAM_MAX_FRAME_LEN - OSF_FRAME_HEADER_LEN - OSF_FRAME_CRC_=
LEN)
> > > +
> > > +static const u8 osf_stream_magic[OSF_STREAM_MAGIC_LEN] =3D {
> > > +   'O', 'S', 'F', '0',
> > > +};
> >
> > You have already this in the header (as FourCC), use that.
> >
> > ...
> >
> > > +static size_t osf_stream_discard_to_magic(struct osf_stream *stream)
> > > +{
> > > +   size_t old_len =3D stream->len;
> > > +   size_t match_len;
> >
> > > +   size_t i;
> > > +
> > > +   for (i =3D 0; i < stream->len; i++) {
> >
> >       for (size_t i =3D 0; i < stream->len; i++) {
> >
> > > +           match_len =3D stream->len - i;
> > > +           if (match_len > OSF_STREAM_MAGIC_LEN)
> > > +                   match_len =3D OSF_STREAM_MAGIC_LEN;
> > > +
> > > +           if (osf_stream_magic_match(stream->buf + i, match_len)) {
> > > +                   if (i)
> > > +                           osf_stream_discard(stream, i);
> > > +                   return i;
> > > +           }
> > > +   }
> > > +
> > > +   stream->len =3D 0;
> > > +   return old_len;
> > > +}
> >
> > ...
> >
> > I stop here, because it's obvious that you neglected and ignored my pre=
vious
> > reviews. No explanation given, nothing. This is not how you should inte=
ract
> > with the community.
> >
> > Come again when each of the given comment will be either addressed or a=
rgued.
> >
> Likewise.  Please make sure to address every comment either through
> changes or through reply to the earlier thread.  Perhaps some emails
> have gone astray (it happens!). It can be a good idea to take a quick
> look at lore.kernel.org to make sure you aren't missing any feedback
> on a previous version.
>
> Thanks,
>
> Jonathan
>
>
