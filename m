Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05C4E306B34
	for <linux-doc@vger.kernel.org>; Mon,  8 Sep 2025 14:13:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757340788; cv=none; b=YsGDyKcbJ+WkOiqzv117wMy60yFQu1GyqPUlxO/NFfMM4vMwuyIxbO/mrG32OpCRltaWyks1O2lHCEhRFzc0d8Cy1bpUS6raP5BtuH9Pklzd3A94zpdCRtHl6XspQxmRR8xzp++FVToRRr9DOlW6WzCF2hitvRwFuUYpFTZhM7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757340788; c=relaxed/simple;
	bh=2fgRlL6oi2NJYIr3taFUqWRo08czRzxQd00ThPrISyo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=M8Pq1vcokNK2I7yJuKNb7ZSnshZaqyOikLzOG5tKrPG4jRMEYcw0FRc20/ujZsXjZCR6FsXYDB97J6NXSxQRnOaboo5VrqTrELf5h2waonRWIX+Q+Gsav/+5j+oPzVNO8nmOg26EwKY0DQ3VJF/zRYZ6r7mJ69um2o0Zc1z5aSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xlMHOIKW; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xlMHOIKW"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-244582738b5so36800155ad.3
        for <linux-doc@vger.kernel.org>; Mon, 08 Sep 2025 07:13:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757340786; x=1757945586; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hRlboR1j/sYEZ4y8841eR/apYQLD4WGaeuEbSq15i7s=;
        b=xlMHOIKW1s0WHPYXDCO56wNWuZnSpEMjPC5zg/mHAGFv4MeWwMQpW3xfj/wxjaqTS/
         ev0rFoHBwGiPrJLykBb5ZZOg6g/FgWU93d6UofhBks3uDP3qu9bIbHMjFgMoE36CLXPs
         HuUWCGRTtCKIbQcALx6GsaTgLaRQwNSDedJeYTGTeQPPEPjLG/8f6Y6bp10JI40Kp4dE
         ownT4YokmdrjwCs8pN1NXF7hH/fCp1PN3OXXk4Olduf79tEA6yOiT22sxkh2CcwuIsqM
         kqnB8zmQezvFtrI05w8zq6RKkl93JwFbvsY4K+88Z/V01ONg7nucc1gFpMJUS7nZKshe
         qdxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757340786; x=1757945586;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hRlboR1j/sYEZ4y8841eR/apYQLD4WGaeuEbSq15i7s=;
        b=Seq9Pj05538Pey+F5ldNkta/IOsy0qff1+4knrv/sgQJPymoxNiOTc+PEa/soesNMs
         e0cePr3okdNDCo44m8ipqM8YSZv58+zITWR44ASznmvDwfFQHauaD1Ci/rxLANFV3Btc
         0Ep2VDN0wuwiJuIp/NZI12zAry9FVbME0Yf7EIEeda+BfuIIyhJZI+qEBz4n1UKFfaEi
         b2OdQXk1E5hMD9UBqlwbnFjg2IOxZ2wp5hvNeVPBWQntTYEJpag9AMZyuMBtPGMTaOXH
         C0PNI8YwmRgdM6BKA85eO8h1fraPFvr1vjbRMj4D+OoG0aFdJjlZQTL7KUPrKQdZRHKo
         92WQ==
X-Gm-Message-State: AOJu0Yzt+GPBE11pTm+upb1Dfa7BqkICmCsZyk32QCjQw5gLLtXyUzMb
	QwQTeAdNYgGV7kYNaLAU6f0eLY8Bw1aBZr1A9HY86zixBUQ1rzRgaBG0Jt3Dt9bZSty2rqvjLSj
	RWhfm75QQwHeqObbUdaPZ4LjfcXBk0NPa3au8WTlG0A==
X-Gm-Gg: ASbGncugogmLeH2xan5urCaF7YL0Uahxzl2n70lwEcvvRE2e3SeGzVpLi3idkQ4MxIq
	tmdvDtMw+FZshOPPkn88doFmITnJX+mZhnHWqT/MRI70ZBzxIbOvFXIhYWcwGP/rGarllmxBwSo
	IBstiME7AUFtMETa+5Qf39W4gryoDSS6I8e3KZPtaJaTiwCp2SGkA2zbARnIe8RRMCR4hOtsopS
	+uC7a0ttbZV9TLo
X-Google-Smtp-Source: AGHT+IEd8DdkxHgdaG5plUgmcm8Xuep198UNJ25N/qeyATAB8uk4bXjSIchDB/WbiLdPYyk6tQDnOBhph3KDrfflqKY=
X-Received: by 2002:a17:902:e94e:b0:249:2317:e811 with SMTP id
 d9443c01a7336-251756beeb0mr90842655ad.50.1757340785596; Mon, 08 Sep 2025
 07:13:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250902174351.2457022-1-raymond.mao@linaro.org>
 <aLkAYitpWxWx131p@zatzit> <CAEfUkULwQxJ-EKT7bQ8+hkH+_xO8esThnL2P_Rc-32tHyMdA1A@mail.gmail.com>
 <aL5VZfOoy1g2uyAH@zatzit>
In-Reply-To: <aL5VZfOoy1g2uyAH@zatzit>
From: Raymond Mao <raymond.mao@linaro.org>
Date: Mon, 8 Sep 2025 10:12:53 -0400
X-Gm-Features: Ac12FXw5u9129IUOnarwDAGAPCUwyAKhMBzRBf8Hu3dSinGoA8aJlhBDSSH3Di8
Message-ID: <CAEfUkUKtXZnGsyJAqGaBHE1CpRFOfA26FVuSRjXc+f=UAeK=-w@mail.gmail.com>
Subject: Re: [PATCH v2] docs: devicetree: overlay-notes: recommend top-level
 compatible in DTSO
To: David Gibson <david@gibson.dropbear.id.au>
Cc: linux-doc@vger.kernel.org, devicetree-spec@vger.kernel.org, 
	devicetree@vger.kernel.org, ilias.apalodimas@linaro.org, 
	Conor Dooley <conor.dooley@microchip.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi David,

On Mon, 8 Sept 2025 at 00:02, David Gibson <david@gibson.dropbear.id.au> wr=
ote:
>
> On Thu, Sep 04, 2025 at 10:40:31AM -0400, Raymond Mao wrote:
> > Hi David,
> >
> > On Wed, 3 Sept 2025 at 22:58, David Gibson <david@gibson.dropbear.id.au=
> wrote:
> > >
> > > On Tue, Sep 02, 2025 at 10:43:50AM -0700, Raymond Mao wrote:
> > > > When managing multiple base device trees and overlays in a structur=
ed
> > > > way (e.g. bundled in firmware or tools), it is helpful to identify =
the
> > > > intended target base DT for each overlay, which can be done via a
> > > > top-level compatible string in the overlay.
> > > >
> > > > This provides a way to identify which overlays should be applied on=
ce the
> > > > DT is selected for the case when a device have a common firmware bi=
nary
> > > > which only differs on the DT and overlays.
> > > >
> > > > This patch updates the document with a note and example for this
> > > > practice.
> > > > For more information on this firmware requirement, please see [1].
> > > >
> > > > [1] https://github.com/FirmwareHandoff/firmware_handoff/pull/74
> > >
> > > I think this idea is probably useful enough to be a good idea anyway.
> > > However, note that it leans in to an existing ugliness of the overlay=
 format:
> > >
> > > Overlay dtbs kind of mix "in band" information - the actual new
> > > content for the tree - with "out of band" information - how to apply
> > > the overlay itself.  Whether a given property is data or metadata is
> > > determined by it's place in the tree in a moderately complex and not
> > > super obvious way.
> > >
> > > About the clearest divide that exists is that generally the root and
> > > first-level subnodes are information only for overlay application,
> > > everything under that is data to be applied to the tree.  This all
> > > tends to have names that would be unlikely (though not strictly
> > > impossible) in a fully applied tree.
> > >
> > > Putting 'compatible' at the root of the overlay is putting something
> > > that looks very much like a regular device tree property in a place
> > > and with a function that's purely about applying / validating the
> > > overlay itself.
> > >
> >
> > Since all information at the root of an overlay is considered as
> > metadata (out-of-band),
> > If you think 'compatible' is confused, I can change it to
> > 'overlay-compatible' - which should be 'unlikely' to exist in a full
> > tree.
>
> No, as I said, I think the advantages of this proposal still outweigh
> the disadvantages.  Just pointing out that this is highlighting some
> of the ugliness in the current way overlays are designed, which is
> relevant in the context of concurrent discussions about connectors and
> the like.
>

Thanks for the clarification. Yes, I agree - the overlay format does
blur the line between metadata and payload.
I appreciate you highlighting the broader context here. I=E2=80=99ll update
this patch with 'overlay-compatible' as a clearer, loader-facing key.
If future connector proposals address this more cleanly, I'd be happy
to revisit the structure then.

Regards,
Raymond

> --
> David Gibson (he or they)       | I'll have my music baroque, and my code
> david AT gibson.dropbear.id.au  | minimalist, thank you, not the other wa=
y
>                                 | around.
> http://www.ozlabs.org/~dgibson
