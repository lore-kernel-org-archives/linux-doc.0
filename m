Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0E14277CA5
	for <linux-doc@vger.kernel.org>; Tue, 24 Mar 2026 16:30:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.129.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774369827; cv=pass; b=D0hxOzqeRuxlc7/RtejDn4N1Tu1IHLXl/qXCWTxdo+BUWKyBShFxZThOy4BwBs6m58UY4HsdUppm7vsRUA5N08FTxDkS+T8U0CQ4ZucuR5eHJvazFn0hdO/naZs3iPKaqYfKdbQcs33JfX0yI4B7SsXJDWYnBWR1VpTv1Fy0DLg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774369827; c=relaxed/simple;
	bh=GedLTtgddWEJUyRlhK6X15vbM4AFh3IuYy7fD8Qy7UA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Edgnmu9c0lEaPkzstGTaF4SgcZTTaBCTtl2pOAazZ/Jc9/UoIfC+LKD2f8s+NByFXrPJ6iMAC5VImfHktHrNj4q05qK26K4aYbqNRi6PYqcz0Jf0VLkr0mNoebbsnPUnQnHP4CCLNn+oEPE5VKipLgxUcuQNrpz5Ydqk4KbBEhk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=SI1l376t; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=FPbJwMGR; arc=pass smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="SI1l376t";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="FPbJwMGR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774369824;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Cy/sMQ7RhCqH87m41O4mchOBapesGxmdoWuSE/4nMCU=;
	b=SI1l376t6yd6pNekT2quVF4D3msgqAL2aRffwcf8DOHrdJqe1golf45ml8HM0LU+3hERbt
	r/gLFSfKDUVo/hgDwzvLtZ4FyNMvH1CfegdVAO1R7zbyEtF8W3/BgnTD3cMi2X24h+1lyD
	LeILgaOkT39YCvecg12T5z4Z3GbEpUk=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-533-LQInycpBNXWMupi01rncLQ-1; Tue, 24 Mar 2026 12:30:23 -0400
X-MC-Unique: LQInycpBNXWMupi01rncLQ-1
X-Mimecast-MFC-AGG-ID: LQInycpBNXWMupi01rncLQ_1774369822
Received: by mail-ed1-f72.google.com with SMTP id 4fb4d7f45d1cf-661827d7a81so65752a12.0
        for <linux-doc@vger.kernel.org>; Tue, 24 Mar 2026 09:30:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774369822; cv=none;
        d=google.com; s=arc-20240605;
        b=CJ1ZxQIQrzdLV3lx1ngssSgXCm7PwVsQXXNd2q2jaISR6hzDgUqHSkZWwxKEkUHU82
         wStGgsBXqz9/K+fekWX/fGEbJak3dmMDobyU1+v9P3Ifxdfz/W09IqVrgqEBOTL6IP8Z
         PzB7s9wJYB7ogqM7Aa0L7GVwfCVkZhkoddQuU8AIbbHcE5uTCAkzIXx4rEOXa58hn39v
         s6rwfIDyiOM0+xh5JYOauSa8AW3gVay1vyS93fyLudtVTRekHlkzVv4y2K2VyFTsincm
         MLtXh0HdpFLZu9vNlixWQsVW79HDR3awdf6ahxyysc5Ez0hqy49e7AOTxc2fUhVzukJ4
         ARPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Cy/sMQ7RhCqH87m41O4mchOBapesGxmdoWuSE/4nMCU=;
        fh=ihzwCrHiE0HoNQqdlO0a1MPagm7hKiuI9FSuru+zPPA=;
        b=XXPBXfKAtyPFpIyVI7/tS0ntL2C/jGwAWFZC9QUp/fRZqDL9F4LuR/q43xPH8apP3x
         kx6Uuqd7Ej2kAQRjeff4Kj5ve3+pUS2wCd3PLoDPPzYGimMBzkeChTBbLutchF5wWEL+
         JhLmLO18BxnxYOnu/XKmec5H651tujCaLDKFQcprVJU0FQ5JohccKDhBJV+BAzxiRTsg
         0zrCTdeGGCSmMumTwjKLFpeh7ITxNB+reeKhSIebnkAPgXTL5mvP3uvHzgYtRxUUoXPi
         9+0kDjRv91xuCwT/n982K/vaZ1+fQQS1wkSqr7pGpwdRpOZRDpgj+Uhr1U0euIVZcr9c
         gFhg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1774369822; x=1774974622; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cy/sMQ7RhCqH87m41O4mchOBapesGxmdoWuSE/4nMCU=;
        b=FPbJwMGRAtA9+VTtIlylhht05gz2qWvPeTbjlSObz01lWtZQ0E5wm2w25xDjw4cPVi
         oCynpWPjOGgXRuhDVxvKItlsZmt+UDU8g9kmIMbJ/aTlJ4zqTMBMwz5sUX7o5wldfOj7
         khVYVpwhDpZgYAk+XVVmKBb+GaMM3nLTyTh9MfVIFeXfJTC3z4B+96tfe4vsazX6pmc5
         5asvojh2p3VgpDtUzXbymrZDE77A/EcC/DSRktGxBFnjrQHMnqbMix4bTUKBw2Q6iLTI
         GB+S1WHVK/ddx2q9pmA9LORBJWJwZyOSmht25FWbJzcht8Dzo0U2A1HN7p0U3VNPnmRh
         3d9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774369822; x=1774974622;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Cy/sMQ7RhCqH87m41O4mchOBapesGxmdoWuSE/4nMCU=;
        b=auCMysra8uiIxD8YX8CHCi+QggN7DaDTxViGS+4hViCz+tQ52rYxLrfiNOpDl/A3r3
         CNeZPOEL7v3mUwCCcgALZ8RLj8W8itaDWZ7CoulmOVI3YfHl9jPNtA8buIxVDlVHAZTm
         diJUkxncDgzpMWuwU/uUoxnZtNDipqPztRLihPjKPN1o8RAP+CPKVEeBCOznIhhKt6zY
         4zM3RLKWIzdo+g2uugfrYWoTXh73ecGLjXlsy971lzSnXuKodinBej1QKQXh1Fxt5U/T
         BpC0olArcE+9oUA2p7Q6z+T1Bb7P0L6UTfGGFSjRW9eRLkKO3GRh0pqVGcRLh/pLubh+
         TrhQ==
X-Forwarded-Encrypted: i=1; AJvYcCWSq6LjpO5VyTSPdwfTkdyQDeffTdMkLTYdvDjUaGWzIG628CTeStedMMgc6dLYRhyL7jH0BuOT5Fs=@vger.kernel.org
X-Gm-Message-State: AOJu0YwQBGXCuIrnZdNBzyzjpcScUIKhqyhHpn8z0CkfHN+4luyguApP
	hrMIb2qAKHgMaP16Vr6sZatmFcqzyUdAlktRgyvMQz+G887OFPOd0dTrhmBH2lE+TEKIcvHKaYS
	NDT21f3p9zZmPFIGx7ipQqCUvJvflPG5k4gv5wu44VXewXMBgDby1DDpMR+NW3IYBVBAra1wd2T
	/Odk2Me0NpCsS/8ed0/82xlhR4NriO27OlmXYo
X-Gm-Gg: ATEYQzxtGcJKNrRZhcyXvN/ls3tg4ZqSBnMS7IH4TerF3wC568TvLcWU5P+19unqLTq
	Ic0hT+kvtn148bTFnRqLxwjwrsve3jAiwYvMEWo3Q+/zhUEs3O5GwaZy7kX8oVqYIEI8IMRGcbi
	GCK+EcDpnhfnGegGWmLeI8mUliVsXL/0WI6ht/20djSfYcot6dHtnnJc8TMFb9o1oj6WkkGnfui
	F/OkA==
X-Received: by 2002:a17:907:e916:b0:b94:113c:a89e with SMTP id a640c23a62f3a-b9886321044mr276827466b.11.1774369821873;
        Tue, 24 Mar 2026 09:30:21 -0700 (PDT)
X-Received: by 2002:a17:907:e916:b0:b94:113c:a89e with SMTP id
 a640c23a62f3a-b9886321044mr276824466b.11.1774369821401; Tue, 24 Mar 2026
 09:30:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260324123229.152424-1-tglozar@redhat.com> <20260324112249.5fe25641@gandalf.local.home>
In-Reply-To: <20260324112249.5fe25641@gandalf.local.home>
From: Tomas Glozar <tglozar@redhat.com>
Date: Tue, 24 Mar 2026 17:30:09 +0100
X-Gm-Features: AaiRm50Win-KQMvQ3JCFdbn6fqEhXmkuYyGL5536EXJW4ZPMCiOhtVACMahWg9I
Message-ID: <CAP4=nvRj3beYwzWKwGFRsM350xYhVwcOAUZBuSBsHfAeawk-oA@mail.gmail.com>
Subject: Re: [PATCH] Documentation/rtla: Document SIGINT behavior
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	John Kacur <jkacur@redhat.com>, Luis Goncalves <lgoncalv@redhat.com>, 
	Crystal Wood <crwood@redhat.com>, Costa Shulyupin <costa.shul@redhat.com>, 
	Wander Lairson Costa <wander@redhat.com>, LKML <linux-kernel@vger.kernel.org>, 
	linux-trace-kernel <linux-trace-kernel@vger.kernel.org>, linux-doc <linux-doc@vger.kernel.org>, 
	Attila Fazekas <afazekas@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=C3=BAt 24. 3. 2026 v 16:22 odes=C3=ADlatel Steven Rostedt <rostedt@goodmis=
.org> napsal:
> >
> > Note: There was a bug in SIGINT behavior, fixed in upcoming commit [1].
> >
> > [1] https://lore.kernel.org/linux-trace-kernel/20260310160725.144443-1-=
tglozar@redhat.com/
>
> Hmm, this may be interesting enough to add to the change log itself.
>

I thought about that, but it felt a bit redundant, since the other
patch will also be a part of the commit history. I see that some
documentation patches do mention the commit that introduced the
change. Here, it is only the SIGINT during cleanup part that got
changed (segfault/undefined behavior -> default handler) so it might
make sense.

> > +Also note that when using the timerlat tool in BPF mode, samples are p=
rocessed
> > +in-kernel; RTLA only copies them out to display them to the user. A se=
cond
> > +SIGINT does not affect in-kernel sample aggregation.
>
> But does it affect the user space side of reading that information?
>

No, it shouldn't, the pattern for both timerlat-top and timerlat-hist is:

while(stop_tracing) {
   timerlat_bpf_wait(...);
   timerlat_{top,hist}_pull_bpf_data(...);
   ...
}

The BPF program is detached after this, so all data gathered up to the
point of the SIGINT will be displayed. A second SIGINT does not affect
it, since it calls tracefs_iterate_stop() which stops
tracefs_iterate_raw_events(). It does not stop
timelat_{top,hist}_pull_bpf_data() - which is aggregated anyway, so
stopping it would just leave a part of the histogram/top empty.

> > +
> >  EXIT STATUS
> >  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >
>
> Other than that ... LGTM,
>
> Reviewed-by: Steven Rostedt (Google) <rostedt@goodmis.org>
>
> -- Steve
>

Thanks for looking at this.


Tomas

