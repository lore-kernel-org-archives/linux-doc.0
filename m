Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6452523C8D5
	for <linux-doc@vger.kernel.org>; Fri, 12 Sep 2025 16:10:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757693448; cv=none; b=ZDoYsvBA0WHX5xUCH9mWoe//uhgRm2afKZUU3+PeaBYYpUY1Kkqk3BoG3vwDi3TZuXweIXQh3ETIU2eRCz+bjaqO85rWD4x+4XMG4AaTV6HhcR6hVy/P70IB94Hfv7uba5NFW+ShHsQyfPZhts2/1WAM6Zb9PgPHSh/81UHZov0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757693448; c=relaxed/simple;
	bh=0RHe6bpoJIZwIozT53G/9zPYXo1UJgO60j6sIrqFoa0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RNVUY2rA424kQsfSMkTKp/WfiYsODpdbRoplBQHXytOmeoZqjkRbcM2oMdekGKx/3wnlhDn/S0FPj5x950nnpTNKqXZJBL/E96vWgH2nA6V3b60Ckj7FP/Oqzii1DCwJJRQ+dHhubc5lSnoOhDpDg88crRhOulx5Z1r8s3fiWJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GUnvxo3j; arc=none smtp.client-ip=209.85.219.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GUnvxo3j"
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-721504645aaso17061626d6.2
        for <linux-doc@vger.kernel.org>; Fri, 12 Sep 2025 09:10:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757693446; x=1758298246; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xwq/iCyIzHWorLG2Ir1bUT1FcNPCbVi//QRArwuSAcc=;
        b=GUnvxo3jTjQ98TYJtZYmV9Kp3cDyGCUaOA8obOqxRXsEfPttuobJObbWJInysARuej
         kLjLgS0Etct9lsAEpxFyFyYWAwSTNhCtVG2HV0uK5nmlk6gS9U/CYggSvD901gFcFaY+
         OiUX5S6iphlgsZOM65rHSx+SDdyhFb7TLmYID66oBiuc0HcegU4oHiLkS89B6pmtCFNu
         GJ/+hpZCA7fjF427b2mXBJ9Ab0gEDtB+IH1trHtrwAtXH4RLDoOFKgGGXpkNRrtjOUf9
         QhRPL1EXYlcYdKLAMZfm+5r3FvzL1gjFl2H8KCHnoKDaldP8pVyzzMpIdjbl7kGIOmnx
         ghyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757693446; x=1758298246;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xwq/iCyIzHWorLG2Ir1bUT1FcNPCbVi//QRArwuSAcc=;
        b=V7BbBFewAgvQ6+Ez8HuJ8ciFYjkwujQZR8QEARqpl/T/gczw2vUnZEF/TUtIVIJvNO
         aHvqfpUMwdfVAqyHHv0SrxAA9/zaBVH/YmJ0KzVDIGo2uOq5oOob1ok3Iu/3KKSbN0zC
         xR5ntyw0woqKNnOQZFIr0gr3sfdnsZ/1TO0ioUD7ouj4VhXT97GFVkmYkmlWBDgtqKLm
         ewifB0LoE6Ov79NfeBiRHK8zlTK2Fg5rXixQP40VI0vGFSe5MEB2Df14pekkxIcWkGME
         5AmxP0yxZDXgWbMpDVsQCYQ1ucVHsHMUMG36MR7KdjTIEoHGVSoiPZXug8iipDWBCWTr
         YYcg==
X-Forwarded-Encrypted: i=1; AJvYcCU3XjTM77ZYj8cMoNVoTDtfRVWcYHWPNOJ3YEu6jC3OTaqzqtHgnz19KioY6tkVnncdOzawxiBT2BY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5TAlGaShtZqF2D/UNA/nUXRBaj7DFRO2Iib15EMB/m3kGIsQ5
	wxCbq5RFJ82df8FeJq36W7iQ2naYyopZm21dUmP0lMebt4ZmZfBvzQG9yr8RT8wittL+yICumuq
	7IXirXoSfpIl+ME8g3RYr5fKxDFshEeY=
X-Gm-Gg: ASbGncsiRMv+YlNll/0m0BHHzyaDFld++9DrxuN54EOKqi6koiUk4TvQdxrdEVnuc0I
	tzla+1FPErEHRQgNs/PJZTWlCmZRac9SwvmQmTR8wj1QRsIV3xjYvuPbMzt1bElOFNJawY7rxA1
	j7Wsijh425TWwhL/W6CWuCLS0A88Ox8EbFVH9qKuMxD4ePlIxz7ohObIulLUAu7pxWf2T/bGvoI
	rtxoFFXdO61kVuLnS45drdT/QrP8z99PSyhyOMSJCHmOE9w+YRM
X-Google-Smtp-Source: AGHT+IEW7Q+2d2hor5P3hr9ksasgPpy8ttcb/zSz69+p8aktjcDEYkFuq3rxTSdGTnR+6WW44n0sCoS+JUh7Itaiy9s=
X-Received: by 2002:a05:622a:4cb:b0:4b2:eeed:6a17 with SMTP id
 d75a77b69052e-4b77d12a30bmr47218771cf.46.1757693446130; Fri, 12 Sep 2025
 09:10:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250908185122.3199171-1-joannelkoong@gmail.com>
 <20250908185122.3199171-5-joannelkoong@gmail.com> <aMKudxVnwafaoqmm@infradead.org>
In-Reply-To: <aMKudxVnwafaoqmm@infradead.org>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Fri, 12 Sep 2025 12:10:34 -0400
X-Gm-Features: Ac12FXytydEpN3AbZfB7NDTCU5MSfYzu7GMuXUcwO8TmZQQa1qHB0P4yWy0TUqQ
Message-ID: <CAJnrk1Y6VZUA0g8223cPvmO_FjnKmemVGQck0_9DVcZkw-yGxg@mail.gmail.com>
Subject: Re: [PATCH v2 04/16] iomap: store read/readahead bio generically
To: Christoph Hellwig <hch@infradead.org>
Cc: brauner@kernel.org, miklos@szeredi.hu, djwong@kernel.org, 
	hsiangkao@linux.alibaba.com, linux-block@vger.kernel.org, 
	gfs2@lists.linux.dev, linux-fsdevel@vger.kernel.org, kernel-team@meta.com, 
	linux-xfs@vger.kernel.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 11, 2025 at 7:11=E2=80=AFAM Christoph Hellwig <hch@infradead.or=
g> wrote:
>
> > +     void                    *private;
>
> private is always a bit annoying to grep for.  Maybe fsprivate or
> read_ctx instead?
>

I'll change this to read_ctx. It'll match the "wb_ctx" in struct
iomap_writepage_ctx.

Thanks,
Joanne
