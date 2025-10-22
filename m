Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AA3F32F751
	for <linux-doc@vger.kernel.org>; Wed, 22 Oct 2025 11:16:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761131810; cv=none; b=F7FNTfOSha8toraBSaHCfJe5RrqktzkL2ORpuUI1wDXuPwZzBtBptZaZE0NtT8StX35IIQd05fDPjBCs1w14YyqB0zNOJdNbecQnu0GfKKSgdn/f8BpAmq/yd+UMLejeFk3uzTqnhXgsLUdjs/JZ+BZpvd+CNWIzGFOvWqe8wPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761131810; c=relaxed/simple;
	bh=MkLx2R4aQDQRSte1k6rDu2d4S0+mLWdRZ24YtDib+QU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cUHUBZT69kMTh7jqUxOzMCGm5g7SgtHad97uq1z6F/mnEvBV3LjYLoEKOpFQOFTBe4TknIX42cgbeSxVk9p9M5CLc8DIZqIxtrmh8nTmvYJTkpFaUCNkEsxTnktqOLPphLFcOSWGPUCwzYUByCMVkc5deF534G84mAwoczLQDfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GtZ7IAcJ; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GtZ7IAcJ"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-63d6ee383bdso4376731a12.2
        for <linux-doc@vger.kernel.org>; Wed, 22 Oct 2025 04:16:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761131807; x=1761736607; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HUpfROanALk009O5ukzxUjqqmJACMBILWAOKJHciC34=;
        b=GtZ7IAcJ+qPUT1UbyjSQlczc/FYy37J5wFuyZSAtHhyN8k8n4AQCldnUC7PgsdQ/Ds
         nQ9DwjeO5G3bQs1dfBeP0ZiaA3kwUeIuVqrrrDMmpvXtbKgkoC3YE0aRj0MSiIIjOQfm
         O0h28Bn0E38Y8RxtcMLU6yN6BOzpM0KSZALGkq+kphNBZkwBB1zabOwMjBnSGgIYLHoj
         eAPCezGxDjNyexsTJwbVrWuZkI1m6S0PagwCbHBXelSO40N+BIGIQkNIso4gV9LZIKak
         obLWnXS/nhyY3mC2H1SbOaX1toSgPt/gVJdbgNTrfE1lwxxiFxCyYLdjYTyDgoYgd7vb
         Oc4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761131807; x=1761736607;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HUpfROanALk009O5ukzxUjqqmJACMBILWAOKJHciC34=;
        b=l3mq5H3BMJ7F8Kahmfzhjo25xVa+KR0yaEHVBDFV7aTrPkvJJtAE8A9vLNiBkchJA5
         gbKVUxKScP2kUlJZe4COHmBacHXpkyd+6ONcBzkCTIH7lA+BF9Mk/3XToIF+yazjMnDf
         0L1x3nHzn/I6jSlIrTsP4exDUHDArq69tF2ck0DRkzrZtF8NmFAdN+l1PCaKGbfSquBq
         fLayuXvc0vk+SwFX96n5vKRWr4kBHiZuMR/2EVgmzEWTfORZkrXi1YuYtu5GWjtczqt3
         HckOCyXTA1aYMwDLQ6ShhtEHF9CMA9wNrVs33LMt6CimTiXp4nYZjpqrBnhh7z/bhbXW
         QhqA==
X-Forwarded-Encrypted: i=1; AJvYcCXI5Vxj+nFhMb9qindyKkhfAJhYo+UidKQuD+UvO3KagiifR1T2FTee8UzujHjLXqHw/s7EUTUnp0M=@vger.kernel.org
X-Gm-Message-State: AOJu0YwqBNTib87HwLys5srmIM7viBFQRyQJlbaZ33xFSBBfH10HlQOO
	vBYcR1qM8bKN4D3QIIDzOdeJXC3ZsTHjc9y7hGeXkIvMVFOSoMVR6JM7MAltq9j1txO0wq/yd+a
	OGjtJRWbB7OD2nwnv6ChQBvxtyHqkie0=
X-Gm-Gg: ASbGncvK1UpbshbRMIx7Asnz9wSbrmMXNdXiyOulLo+6VE27gMEoIGe+f3H2nj36KkR
	uNnhj+KA7lKY1zdV/FqEQ8EOnqQOFvFHi6KxvVOsfvAjgF4UlF2mlyNP0nKu6z+Oa9+oLDlSO8Z
	vbnogsCi49W9zmjyGJesw0srf/Zjq5jCmaa3pl5Umgn8+dC10e1OFUq8f+SBNN7/8ck4HDAVBD/
	edyOt2FAOGB5Ec/KAp0WPGmPx+cLUBU28E98OqnEA1uNC81jDLbADysXUcPZJeuRxH65byCOsX1
	kgl+a0HSlQOoM562EVtNCmF+YQ==
X-Google-Smtp-Source: AGHT+IFeLMsqZpbHAvlJBzKIdahXOOBShjYQZyOY7ATbt5n7WHdXXR/ON08TB4hturxLMLEB0GOq3i/bLAd52DC8p3U=
X-Received: by 2002:a05:6402:13ca:b0:62f:8274:d6bd with SMTP id
 4fb4d7f45d1cf-63c1f626dd4mr21176233a12.8.1761131807215; Wed, 22 Oct 2025
 04:16:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251017042312.1271322-1-alistair.francis@wdc.com>
 <20251017042312.1271322-6-alistair.francis@wdc.com> <dc19d073-0266-4143-9c74-08e30a90b875@suse.de>
 <CAKmqyKNBN7QmpC8Lb=0xKJ7u9Vru2mfTktwKgtyQURGmq4gUtg@mail.gmail.com> <4b2e5998-a646-4f99-8c87-95975ff8fe66@suse.de>
In-Reply-To: <4b2e5998-a646-4f99-8c87-95975ff8fe66@suse.de>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 22 Oct 2025 21:16:19 +1000
X-Gm-Features: AS18NWBDgW-hay2VUeCdIjfUCzoI0NhxABO1jEUfCaPHUmJ8eBnU71SyICyiPWc
Message-ID: <CAKmqyKM-uX6_a+Ru01RD3-CwoucTN7P_sU+d=MEKSo2pxG_tDA@mail.gmail.com>
Subject: Re: [PATCH v4 5/7] nvme-tcp: Support KeyUpdate
To: Hannes Reinecke <hare@suse.de>
Cc: chuck.lever@oracle.com, hare@kernel.org, 
	kernel-tls-handshake@lists.linux.dev, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-nvme@lists.infradead.org, linux-nfs@vger.kernel.org, kbusch@kernel.org, 
	axboe@kernel.dk, hch@lst.de, sagi@grimberg.me, kch@nvidia.com, 
	Alistair Francis <alistair.francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 22, 2025 at 4:56=E2=80=AFPM Hannes Reinecke <hare@suse.de> wrot=
e:
>
> On 10/22/25 06:35, Alistair Francis wrote:
> > On Mon, Oct 20, 2025 at 4:22=E2=80=AFPM Hannes Reinecke <hare@suse.de> =
wrote:
> >>
> >> On 10/17/25 06:23, alistair23@gmail.com wrote:
> >>> From: Alistair Francis <alistair.francis@wdc.com>
> >>>
> [ .. ]>>> @@ -1723,6 +1763,7 @@ static void nvme_tcp_tls_done(void
> *data, int status, key_serial_t pskid,
> >>>                        ctrl->ctrl.tls_pskid =3D key_serial(tls_key);
> >>>                key_put(tls_key);
> >>>                queue->tls_err =3D 0;
> >>> +             queue->user_session_id =3D user_session_id;
> >>
> >> Hmm. I wonder, do we need to store the generation number somewhere?
> >> Currently the sysfs interface is completely oblivious that a key updat=
e
> >> has happened. I really would like to have _some_ indicator there telli=
ng
> >> us that a key update had happened, and the generation number would be
> >> ideal here.
> >
> > I don't follow.
> >
> > The TLS layer will report the number of KeyUpdates that have been
> > received. Userspace also knows that a KeyUpdate happened as we call to
> > userspace to handle updating the keys.
> >
> Oh, the tlshd will know that (somehow). But everyone else will not; the
> 'tls_pskid' contents will stay the the same.
> Can we have a sysfs attribute reporting the sequence number of the most
> recent KeyUpdate?

Why do we want to reveal that to userspace though?

Realistically it should just be ~2^64 and it'll should remain the same
number, even after multiple updates

Alistair

> Cheers,
> Hannes
> --
> Dr. Hannes Reinecke                  Kernel Storage Architect
> hare@suse.de                                +49 911 74053 688
> SUSE Software Solutions GmbH, Frankenstr. 146, 90461 N=C3=BCrnberg
> HRB 36809 (AG N=C3=BCrnberg), GF: I. Totev, A. McDonald, W. Knoblich
