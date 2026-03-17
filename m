Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D16EA280A21
	for <linux-doc@vger.kernel.org>; Tue, 17 Mar 2026 17:16:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773767806; cv=pass; b=TD6OXIJ5TZX4TEOBF0PuiExV8fkvUol8VEbHRT48hofksLv4x0HDJ++ikc6haN7xsFszG09+kgL3iqbzKQ8+g3wNgU/nNCdsOVDpPxtsD0XIxsB87dPN2FgsMNTo7NX5qPkm8vO90FUBKKlK8dxSWKuo/C2/68vvYT5X8yk8r2Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773767806; c=relaxed/simple;
	bh=0X1C52PqIrwx96rcpzTjPe1RKwZx0UYmrEP+1YEkuuc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mQlLTbsV5wXhUnO0lMHI4vsCL8EjNVWWRDzLX7p1Mg9dxhnNx14vqFC1nKR3z4cj9Wn0axh04O6OPMDPaj07YVO0FXbHj9g0ifewMrconpWX2Bth4R0FWGBSrl7GIlc9m/PF+MedJGkt76/nggT8cfo0/uYDzGfKW13ZZA08bGw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=btUf5r46; arc=pass smtp.client-ip=209.85.160.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="btUf5r46"
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-40429b1d8baso2393672fac.0
        for <linux-doc@vger.kernel.org>; Tue, 17 Mar 2026 10:16:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773767804; cv=none;
        d=google.com; s=arc-20240605;
        b=SOG42vwE3WhV1LwD5P2WHzuFRlUVzqfKcIKDlOo2/1zmrqT/HxW95tRU9p5+ZIaSub
         XTyuS6buXEOBW8ExihZKpeAYksopBuIJ5jfs2sNJVuPrUdGCTFp3mE4nVdoezoin7+4e
         5IYd6N23Al2h0rv6XpE7JlogxzQBPLV4LliWIBeLy2bSfVrVle8FyOREuvJ0tqGO2Hj3
         dhMRJGuO2M2M11HLSmSCc47ZfLy9IcLVbjbsr7o5DU45t6vQ1V7XuGG8L/gai/lTM/G7
         PpfY2gvRbxGoAlZAJBJf751em7WzfvpP8NdPXHt0CBIfHEz6M/k3cIVhfAaAqr8OK3w4
         NNdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=IQA0G5mhKczJyjawYFlORE9tYVJfYphQQzWbxz3uW6o=;
        fh=N3q8Ucd3G1Ekv/NFOrZ6iSqydVi7gQ+NyXpF7XJPLMU=;
        b=KxBD+iKmTjn1HqCTkOLtaD61axEqpMbrr4ewPRzsHHE2iQG8Cxr31cvA5YCCMl8ure
         ZOfGUp6WHClZe3Ayb908OlxBimKewJVwMiFcN6catHHa1BPMt8rsrTMKy8/W1p7kaSUV
         oPmbFq4lwJIwvwd0PlXuCwwXQAyJq1KMN54NqXyhUgBn0g5bQIPxdGgM2dVodyKl1L7w
         ihc7qmxeinE1Nu5qS/OEZTalFIvJFXoVE12Cieqaq1DfQ4pNVkKkR3mdNNzMVo2dkQcs
         kRK5phQuzA6HTcTfUqbfxooO7NJ0lN3n4MFXfxcQOn3XelnbZtTpTkBHBiACcGLLmbhn
         a/Eg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773767804; x=1774372604; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IQA0G5mhKczJyjawYFlORE9tYVJfYphQQzWbxz3uW6o=;
        b=btUf5r46iNoTMcTXdyUVGlsEe++L3UKR4guXI4x8cFZMFS3swQIUz+HbuYqEf7Bwm+
         SAB1/Fk+4tKqqo/dUH1/MBFt0TLZbxDPiRBoXSd6RJngAOuvvB41YbTukpTER/ZS92Tk
         cn8rAlzM6VZmfOYjeU2jMFAOCIAbxWc2pTQPySnZqF4wMpPoZ4rJ4lX1fL4K9De1gPzx
         RA+yfEIh82hqRaP5XOVWTsMofVi97KR4AGkggMEl1EGoTDxPdnCZAPQuSGxgFVvx1Fsc
         gNheBaebcaT4z/7c9HbhRzulTpPOEtdJ4KPhF6OGMDyQ2xKzEEewT8ap5jXS3OZz/Avb
         xF6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773767804; x=1774372604;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IQA0G5mhKczJyjawYFlORE9tYVJfYphQQzWbxz3uW6o=;
        b=m/26J8pT/UvoPVevwQKa1YhMMt2eLKKUngd/ZO4SYejK5yKVQ78Gfl1679EdwJL1SR
         tXgA+cdcmjkTfKWxHyObd0fmk/+dNmSIMkHiTRqOuAHacxBEHMljHOLn86MJgL6g8xlz
         y6u5v8RZ20mFmJppEk4vO/LCuUiXvXFMVs8iDm/3kEDf3mU80qQN8R0KBp6oEh1hd7KG
         tJ5cB40Hzi/kSTmjLXMKtQLvS86GtYPEBiuOhwpx04b0HTstYHqJF59ovnmuBv8I/B8o
         hc/96xesmimeszayuUSTDqSkpa+PLo2coQCrcpI/Ymz+9rDPyXSo9qzoQnp7XZlcj94j
         bZOg==
X-Forwarded-Encrypted: i=1; AJvYcCUUFeWIvw+bfMuTu7sxl2feXkiQQkfWArFUelxh2d7s10qbCDLAhFL05V0QG5b9OE7xTSMClXs66M4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwobqoEHRo+TXyERNOfv8lehvMNwhfaXIARDBafAd95qvnuH062
	6go+WB25Ued/KT9RinDcM6Y84RrS3K7y9qNBqrV0+fXDlHe3fniYfrnGkQGRrq+B7oF3IsRH5Rv
	1zF9N/w9j6YYAxAvTgbU4DPj1oZgsA7g=
X-Gm-Gg: ATEYQzxZeEnBs7rv/c9H1NGZEBPDFPvQBpxCrIGk9jKrYzHLIvjI/y2VQVui57vjB6e
	+mkAyxi+9e6Oiq5ssZHNKj7+uQdmAFM6yR0l1AZmH7QCfEcaFU9jeEZrZQk9MwYn2iaNxAY6jpg
	rlzLsBpfcn3xLSPH5Q5VE42/+uBf35JT8CE4s7Ek6XZrrxdRDLCw4qs1l5ERExxnPf+skBdD8/i
	zuNxT8xghAlf9F2fn6MmOTq6RE5rqK5AqNttCOTn/vuja3zN6Cb4T5v4m/7xloP8MnDtg5Sa+rC
	Zd+DCzhscZ5NV8vh/io2ykxX64Rqfuzt0DPF+1Q=
X-Received: by 2002:a05:6820:1694:b0:67b:b735:9cb8 with SMTP id
 006d021491bc7-67c0da95086mr58777eaf.14.1773767803735; Tue, 17 Mar 2026
 10:16:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260316212435.19303-1-arantescastro@gmail.com>
 <20260317140136.29256-1-arantescastro@gmail.com> <CAMAsx6c_oq5-cuf-N-+RTo-Hym-K+PF-=BOBZySWMN4E7O1s4A@mail.gmail.com>
 <875x6ubdci.fsf@trenco.lwn.net>
In-Reply-To: <875x6ubdci.fsf@trenco.lwn.net>
From: Daniel Pereira <danielmaraboo@gmail.com>
Date: Tue, 17 Mar 2026 14:16:32 -0300
X-Gm-Features: AaiRm50T8i9DJhfyOp-sreqN7PT8beJQEcDgsDLQhhGZfdiTpL2s0FBeRfng5e0
Message-ID: <CAMAsx6eaXHDquZqCjp7P0e7hwK7UHi0mr=QTusCxPixzBPGFdQ@mail.gmail.com>
Subject: Re: [PATCH v2] docs: pt_BR: translate process/1.Intro.rst
To: Jonathan Corbet <corbet@lwn.net>
Cc: Daniel Castro <arantescastro@gmail.com>, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Jon,

Initially, no, there are no further blocking issues for application.

The purpose of my comments was solely related to the initial
organization of the collaboration and ensuring adherence to community
submission practices.

As for the content itself, the Portuguese documentation is
grammatically perfect.

Thank you,

Daniel

On Tue, Mar 17, 2026 at 2:00=E2=80=AFPM Jonathan Corbet <corbet@lwn.net> wr=
ote:
>
> Daniel Pereira <danielmaraboo@gmail.com> writes:
>
> > On Tue, Mar 17, 2026 at 11:02=E2=80=AFAM Daniel Castro <arantescastro@g=
mail.com> wrote:
> >>
> > Thank you for sending the new version. Please review the following
> > crucial points before submitting v3:
> >
> > New Email for Each Version: Always send patches in a new email,
> > including the version number in the subject (e.g., [PATCH v3] docs:
> > pt_BR: translate process/1.Intro.rst). This is vital for community
> > tracking.
>
> Daniel did mark v2 correctly.  A new version definitely should be sent
> as the start of a new thread, though, rather than as a reply to the
> previous.
>
> > Subheading Formatting: The misalignment in the subheading separators
> > persists (e.g., +Cr=C3=A9ditos/+--------). Please correct this.
>
> Looking at the patch:
>
> > +
> > +Cr=C3=A9ditos
> > +--------
> > +
> >
>
> ...I don't see the problem you are describing here?
>
> And again, please put comments like that inline, as I am doing here;
> that makes it far easier for everybody to follow what's going on.
>
> > Use checkpatch.pl: Always run the checkpatch.pl tool before
> > submitting. This is mandatory and will catch these style errors,
> > helping to prevent rejections.
>
> Good advice, but checkpatch doesn't emit any actionable suggestions for
> this patch...?
>
> All told, I don't see a reason not to apply this version, is there
> something I'm missing?
>
> Thanks,
>
> jon
