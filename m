Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9000B3DEAF2
	for <linux-doc@vger.kernel.org>; Tue, 30 Jun 2026 05:04:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782795896; cv=pass; b=Fu2uD8RrK+eJS2GyKxvfVtSvqRHuY2S6ofIAvgAdEjjLOseG2MEhk92OtnLeeOoFmUJ9uGiJ3S70z//QMHUHCdberYVWFZcEqhwJSnGkdJeaYlJ7vy9XNERdjzTyzorhKUjIDIaTdf2pBP4Fbwy8n96fuDM7PZMhXt/UKZ4scgI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782795896; c=relaxed/simple;
	bh=JSmL/2riPz7JdDua22+DrV1rd4FHdRa+ItDrM60NlcY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=C/dd0Us+N5NBduN0ewCad8K0OgVEvFr0L4aS77C4iPQkRE6W5Nw4Iz37aCY0UNlts9eHvNca2BxJhfrXxUBpxkPVSOeOckH4eXQjNsQli2WiHbwsMOoVrOJVAiWtmzjVAq/ETJqJvRN2qR2R14AxHSdIl5QZtcdx1+4VEDeS84k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y7s3oo86; arc=pass smtp.client-ip=74.125.82.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y7s3oo86"
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-139e498e428so121826c88.1
        for <linux-doc@vger.kernel.org>; Mon, 29 Jun 2026 22:04:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782795895; cv=none;
        d=google.com; s=arc-20260327;
        b=ZQBF2mC3loBj1P58HuVKRmprU0gosvK++wnnhc0YrSbTwagJ7aN2f3clRVZiI656uA
         ajpTppDIcZ90OHrpYtzB//zFA/POWg3KVqwLMKmude/Wo5EMxu25o0Q6QopQb/LVq8ts
         uK2v7EUTO2f2rguJNpWYXPZpeJ+8hzLHoiEuOwcaSX+yFF31ZFCkK2SfCg8FAIJ3JnX/
         CFBUkrNBKiPer1fviYjnze9pO5kY31lK4jPbzs726YOVVlSCXPsvQtI0CYTluc7QO7Po
         KFp2wUlpKgU8JFLSsl1jXuDBVTOa0dJcSXKzHKKOJoQAkxX0pHqoNKUMBfuvC3gWjD13
         4YvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+C6hj2XUPcZex4S9rTTRGwiYoI9zoWRu+B/pN0fu6nI=;
        fh=9FrSWzRAAs/i019aCRVVn7oU8W/mCmtTJgo0w9lH75U=;
        b=cS87ze0ES/wFO+WZb7EgJ52yh1kTu1F73kOQEx5q2ir+XSWUrCclbzG1syDJupQd7C
         mUELVlZbOb8s1R41QtdyLor6xJLAMf6KQc01efRljBurv9jAfa48rMPtPpdmwMOSFBaP
         fdQaA/f3OqZKmjQfj3VcxUu4+1Bul56x4n7EakGGsRTDVaGkgy03OhSB6db8deQKhxnn
         mJ3VI9tNAKOZYhc/+dM+kpsub5YJU2b2ZQ/1GNwOiJVW9A4mgERNiUV+sjHiH0kP5upQ
         RZd8s6eBl+ugAdn0XmAnWkgcwgy/10+mT4Dim6mb4j4PTqz3FT8K6Rar+Bm5FMgQr6T0
         cQqA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782795895; x=1783400695; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+C6hj2XUPcZex4S9rTTRGwiYoI9zoWRu+B/pN0fu6nI=;
        b=Y7s3oo86WY2u1SY/lSGxsVtfwox4MP/6Y7P25p+l6waC6Q0lX7o9PciRgFhJ0XjYCB
         2nTP+DED86f2daE0LKwQt//ZS9MdvDQpMuUDZZvjSXk1o4zoW+YOzXlWV59Q7Cm9ZNY6
         Fgw57QW7pOSb4EfxZlXOfKU03szIOsLREhEy4S495VIcjDwxAqNGMoEqAyS6SrlDrKgm
         GG6GUWcH2rmujjBkOjlL2XgHubMqBRYBh54hv/cHeiUhMG/876QCAbgAGBUggWaFiqRo
         d/2NYelJwXwFKiR2iJ28z/FK7ZcSDS8NWFnBmZNzLkYjIegwL+wQ8UZC6usNcgWPgOTM
         xgpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782795895; x=1783400695;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+C6hj2XUPcZex4S9rTTRGwiYoI9zoWRu+B/pN0fu6nI=;
        b=M97hlbKXKSDNSyB1HvS7G4mjpTiybUG6IgVh+Y7gbuwCaJw/Nw3OJciaqbNnpW1C9r
         fWkEU9h6KB5st4xPetEoAUlApUd2zfAVUEq1eghwda1m66njYhRORi7UbLruXYHIt4Ct
         +HfmZvmSz1lihzM0t3r6esBLGkoXJnBOdd6jym1zWUq3PFFgAV4PowM52NSwtBpd1os7
         Ykx86bfKVTx2f+YzZ5c1rYdvCuSi92wCwfvjQu8/mHDlcF7ZN0kSaGH4aEJthz4FD6Ib
         nH24vBw8/Oc3eAwYaAW+VMmTikTkIm9uMS9Q1Pup4/TCKV65K4RC1/qDawHDq8/ztKI2
         ymLg==
X-Forwarded-Encrypted: i=1; AHgh+Rrac3U3znJv/1fd2/q8YvWrW7L/oOu55Kzuz6ypahJfG38NLYQKDjFe4/PgNyozWPbS2SBUnaZdS8o=@vger.kernel.org
X-Gm-Message-State: AOJu0YxxSAONLeEWm4v9iFpI5KOjrSQy9jYH0n7/x6Z6BqcZqEVrnt9j
	i7irA9ZpTBLn5JEzrD9tZNXkyMlzo7ff+2kICEOiUHwvE+DOvYxsfjP5Dv3aYYjre+oSdgBQTOt
	EwALr+5xKUBKynRnOuqg+PRWl1+NucDo=
X-Gm-Gg: AfdE7cmtcyL4Cwdwwt4CtCy2TD3+pW4GZpQeZzWMdFAjYSnWoCM19NMwFLnYi7xYhq8
	oEUVQlfK1zkPzYg+gYkvWQIVLpCdx2rwarZqnov5f4G7piW29SIusZrzdKSPF0XN9PjY8iNWdic
	PWgj1kfJrChcctT1xZNFl6HQtNKhjp/6ePakQ5FE9K0kiUt18nUbj+bBEu93Sq4tPQMjFndno4V
	xom3/ejY8XwjnQZMCJOmNKAaz2VLyvIpTKlo8mGCKmLQYy5r9sDz5jr/p46I2YilaeSY6iNqGCH
	VxD8iN6vQvYGX6YB4B4a0Qic70po8PbspE+hgIg1efJKOIMcK3MersmPPKm4
X-Received: by 2002:a05:693c:3b04:b0:30e:d66a:3faa with SMTP id
 5a478bee46e88-30eea052cdfmr313611eec.15.1782795894553; Mon, 29 Jun 2026
 22:04:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260628191337.937-1-kimjinseob88@gmail.com> <20260628191337.937-3-kimjinseob88@gmail.com>
 <20260630000254.1d1cf422@jic23-huawei>
In-Reply-To: <20260630000254.1d1cf422@jic23-huawei>
From: Kim Jinseob <kimjinseob88@gmail.com>
Date: Tue, 30 Jun 2026 14:04:43 +0900
X-Gm-Features: AVVi8CdiEieYKWqJIPC16G_ZpvLkF5ev-gruUCYcVF1FK7T-4gCgQd__iRhQI3A
Message-ID: <CALMSew+=8P851Wdc=zDLsU5T9YC_ZeTHRotCzYiFP=LNznZhDQ@mail.gmail.com>
Subject: Re: [PATCH RFC v6 2/5] Documentation: iio: add Open Sensor Fusion
 driver overview
To: Jonathan Cameron <jic23@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I will remove "initial" there in the next revision.

Thanks

Jinseob

2026=EB=85=84 6=EC=9B=94 30=EC=9D=BC (=ED=99=94) =EC=98=A4=EC=A0=84 8:03, J=
onathan Cameron <jic23@kernel.org>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> On Mon, 29 Jun 2026 04:13:34 +0900
> Jinseob Kim <kimjinseob88@gmail.com> wrote:
>
> > Document the Linux IIO mapping for Open Sensor Fusion devices.
> >
> > The overview explains that sensor channels are discovered at runtime
> > from mandatory capability reports. It also documents that OSF0 is a
> > wire-format detail and that protocol_major and protocol_minor carry
> > protocol compatibility information.
> >
> > Signed-off-by: Jinseob Kim <kimjinseob88@gmail.com>
>
> One small thing inline.  Otherwise looks good to me!
>
> Jonathan
>
> > diff --git a/Documentation/iio/open-sensor-fusion.rst b/Documentation/i=
io/open-sensor-fusion.rst
> > new file mode 100644
> > index 000000000..832901f5e
> > --- /dev/null
> > +++ b/Documentation/iio/open-sensor-fusion.rst
>
> > +Timestamps
> > +----------
> > +
> > +OSF frames include a device-side ``timestamp_us`` field. Buffered IIO =
samples use
> > +an IIO timestamp captured on the host when samples are pushed to IIO b=
uffers.
> > +The initial driver does not correlate the device timestamp with the ho=
st IIO
> > +clock.
>
> Really small thing but I would avoid talking about 'initial' driver.
> It can cause confusion about when something is true and when it is not
> as we may have multiple non 'initial' drivers before you get to changing
> this handling. So just remove that word.
>
