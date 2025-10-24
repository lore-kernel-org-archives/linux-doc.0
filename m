Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFE1528DB76
	for <linux-doc@vger.kernel.org>; Fri, 24 Oct 2025 19:22:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761333766; cv=none; b=jz+SCr/3pVrmLRnTMew0Q4z617O77zaKlFUuAviYxLcma5ULa1d42Fn2f+utOT8/2JuktwQCRib433EFDyEM5xpzwtrp6jJ7ML5HZ60Yml//6KTaAHsOWdm0XUSf4lySOIsVdxZN109LeHxeCn5YxqMhubfkT5b6NVPUIg61se4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761333766; c=relaxed/simple;
	bh=QgsR+Vv3MGDc6mihpTVQXoOx12Z77gAlV2xrGnLO6/E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nQSXj5ULwCYpGn6bxyNoKTN/kRYeP7u3aMzS28xBhBoNTeimI3qi/AHgXzFVZgbKWqsEL1vPf1xr6R+KwO6eje1WAeTXv3AX4uBkrujW1/ttMi0faHhpu1b1Lp61JCZrtKLhRjjHwiR1vnrH2TxUy4H53dbePk6dole2MtWLloc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BPjfy8RF; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BPjfy8RF"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-4e89d2eaca9so15162571cf.1
        for <linux-doc@vger.kernel.org>; Fri, 24 Oct 2025 12:22:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761333764; x=1761938564; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QgVsq2p7ysLPME1WhWajPgNYUjlNdQ3sSEmcEy2qO6w=;
        b=BPjfy8RFaXc653UEcDt7aXACeN5dBOMeuj4rA77Emfracun9ngFDcRYifmFpEP2AXK
         5m8C22v7SdieEVE2rVxNAFRd/1Xc35kZLKBy9wl7zSvt2qfcQnsXmcsAFF7cUA9LNkqA
         SytL4/F3PHlWEKaUTFmlran24Xb9TNKnOV/BhYmhBRFHM2OSm4FiJ1/DcbkRJ7ZXYK7X
         FumnweK7iumntqEMKm94QaR5Ssc6S0OVZDEMIUPAiOuAsHk6xqnswWbBWDWKTs3IOcAI
         wTJ0muof9YdKtxEpxjMCIbnAISM/wVevoa9m7D+4RcHdqFPfObTHJLDHDL+NXhaTzDW5
         zUwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761333764; x=1761938564;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QgVsq2p7ysLPME1WhWajPgNYUjlNdQ3sSEmcEy2qO6w=;
        b=PmDyVgCR+etF+16y6VvtdyG8OxgdtpndfpDaaCl+qVPTuHGqCDMR+7tP5j85d0r6k0
         zwuT0jN/sVzWi+4g3SjcGEvPtOFeNfekCMEPfvrCBYJEZshyGh9aLR6t/NmRvlvjNCIa
         iDwar7pyeTj5iGYPHmapMrUnLj+0MqRP2lzvpUVIs7IkBEfQGjBPRNNWksUf32MGgev6
         88PmJzidpIf8n3veKv92Q0SgFIAbW+9unIvDCjkpR59SGTNVuWF48UtPeCXKB+bx1aX+
         Rwf5Yvpzw+lvWjgv1QFWZaqV1xNN9ADEqg42N959KaZZmcULuhrJumZaaztneIUIhkQ5
         pa5A==
X-Forwarded-Encrypted: i=1; AJvYcCX+mYSpR6JI7YBaxcfqOMRSRPi5N/VWBzUD3H77nfvImQE7efsM+TFghyc4ol59wvCYv5rbdzZPOSY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6LAjPmqpccXbPoINmiUDvcDYPiEMqY/vh8jN21qCcz7sxi6gP
	6oArlL83oQD1u/3eu300AKSMGpnY4FjuxmA+zVE4ljGEcdwSvZfcpvZpEC7SffSmaLrmOdf2lKw
	e59uH0fgAsej5yrX7H+QssQVrMr7o+v0=
X-Gm-Gg: ASbGncsrW7fQCqLEpikslBrKJ0oojr18OOWoJzI5PT2Yl4VfP7NoRDfEUgBVNjh8nPN
	S21D3MI+h+IYsodCOCcXQlLC/aSUw6fs9JBbsSvXnmlx4Neqj0IRypMAl2JwEBd3jM79rYbJAAu
	z4fyECb2aVScmX+PFnN76gKijQx46mujNEj/hvLmN0nbUGfuBc/a/I/qMJp/XXDgSrju/TK4/7u
	VfnFlcEH1nL2HweHdhmTIrUr0S+dQ6OZhntvgEHiMxSmAw6BYtztzru/gNcL8E/S0YC9HrAAcDE
	bJ8OjTMTLwmCCFkdqq7/Fx9hCQ==
X-Google-Smtp-Source: AGHT+IGxXnezM7H6ghoHWHVk0i5IpwGNkPTA0TF+xQoIAFjkCgqjiFTZpTBBYWa/w3Z7zp2bKm+jQ4qd+hmkKIGk2Xc=
X-Received: by 2002:a05:622a:138a:b0:4d8:531e:f896 with SMTP id
 d75a77b69052e-4e89d293c59mr371291051cf.27.1761333763653; Fri, 24 Oct 2025
 12:22:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250926002609.1302233-1-joannelkoong@gmail.com>
 <20250926002609.1302233-8-joannelkoong@gmail.com> <aPqDPjnIaR3EF5Lt@bfoster>
 <CAJnrk1aNrARYRS+_b0v8yckR5bO4vyJkGKZHB2788vLKOY7xPw@mail.gmail.com>
 <CAJnrk1b3bHYhbW9q0r4A0NjnMNEbtCFExosAL_rUoBupr1mO3Q@mail.gmail.com> <aPu1ilw6Tq6tKPrf@casper.infradead.org>
In-Reply-To: <aPu1ilw6Tq6tKPrf@casper.infradead.org>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Fri, 24 Oct 2025 12:22:32 -0700
X-Gm-Features: AS18NWDml_8GOzBxWkDpLBz16byJMfZB750GwQQx4HmcQAC4dkTAAf9RVH0Fz44
Message-ID: <CAJnrk1az+8iFnN4+bViR0USRHzQ8OejhQNNgUT+yr+g+X4nFEA@mail.gmail.com>
Subject: Re: [PATCH v5 07/14] iomap: track pending read bytes more optimally
To: Matthew Wilcox <willy@infradead.org>
Cc: Brian Foster <bfoster@redhat.com>, brauner@kernel.org, miklos@szeredi.hu, 
	djwong@kernel.org, hch@infradead.org, hsiangkao@linux.alibaba.com, 
	linux-block@vger.kernel.org, gfs2@lists.linux.dev, 
	linux-fsdevel@vger.kernel.org, kernel-team@meta.com, 
	linux-xfs@vger.kernel.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 24, 2025 at 10:21=E2=80=AFAM Matthew Wilcox <willy@infradead.or=
g> wrote:
>
> On Fri, Oct 24, 2025 at 09:25:13AM -0700, Joanne Koong wrote:
> > What I missed was that if all the bytes in the folio are non-uptodate
> > and need to read in by the filesystem, then there's a bug where the
> > read will be ended on the folio twice (in iomap_read_end() and when
> > the filesystem calls iomap_finish_folio_write(), when only the
> > filesystem should end the read), which does 2 folio unlocks which ends
> > up locking the folio. Looking at the writeback patch that does a
> > similar optimization [1], I miss the same thing there.
>
> folio_unlock() contains:
>         VM_BUG_ON_FOLIO(!folio_test_locked(folio), folio);
>
> Feels like more filesystem people should be enabling CONFIG_DEBUG_VM
> when testing (excluding performance testing of course; it'll do ugly
> things to your performance numbers).

Point taken. It looks like there's a bunch of other memory debugging
configs as well. Do you recommend enabling all of these when testing?
Do you have a particular .config you use for when you run tests?

Thanks,
Joanne
