Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com [209.85.160.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E76413B0AFA
	for <linux-doc@vger.kernel.org>; Mon, 15 Jun 2026 22:40:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.193
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781563232; cv=pass; b=cbb4NZC6u8mAA/rjzHqoWxF/KJzDU5eEm9YZy4E6M4bqloo5tpJpFOFOKrSYES9V2PUPg232SDO84UxQzPKnTtDCOrnP5X3+VWr7/WrU4OvSRE1+7WvtljSpIDE46i8bf486uTky7RtkUYTSZEUSZppJJpq0Cl5f9IPW6V9n8EE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781563232; c=relaxed/simple;
	bh=EWoPj//5pIkn2cgC4tGr9apDCikGzluVBgHuTm0N1eU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MMQXxpzzTnX2xVmj+lgD35L6eafcelx9++ymolYuhS+LEVk2QqOHqbeo2ZAcOwQa+LPeFQZVB2a61KIPSRMNhAYi4U2AFW7rjS/DXXC/UPyDvBnRFpB0kQnncHDzv47/IG61BpQP1jzfpaDSYUULSUbPZaWBEkGhQaenRt82/mM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F/608Djw; arc=pass smtp.client-ip=209.85.160.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F/608Djw"
Received: by mail-qt1-f193.google.com with SMTP id d75a77b69052e-517583cb07aso44335311cf.2
        for <linux-doc@vger.kernel.org>; Mon, 15 Jun 2026 15:40:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781563230; cv=none;
        d=google.com; s=arc-20240605;
        b=lNkVV/BnXsEbUdXxRZ9IgoRJ5jAHMfjI6U3TyT8Hu9f347d/5LCXsBerMsp0IG3oSe
         z3LO37Bgi/5lSUyw4B4+/8GprjtOnV0f6rUFv/fhrXob6nsJauKC4UU+zkIxUYbrqoFw
         Qgs4paa2wDLc2TORvY51SuQ6nzYAPHNhmbRv48tTP+NZP/aUmG9Jdxhce2Tyx+fJQEdU
         u8m/Le+dP27guL2GD3bYkwM/i8YYF0Cz+ovR7lTS4YrT0QhNcuTIGIo7rjxo/mw75xbH
         gDcyObGc8ioc4rL+2jhlHHCcMDJlpLmyDOuc0Sq61JXqV5VFX1dpzkQpSqMkP4AQH7+j
         Igqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=EWoPj//5pIkn2cgC4tGr9apDCikGzluVBgHuTm0N1eU=;
        fh=f5qMy+Ygo8GFXfHvRAH7yRyUPBxRr49fSY4zfulYUYI=;
        b=ftwzotCgoXUPN/e3X96xKp71sIHFAxmx2cP0EnJpAZHMZwYvTFJxifP2vI3y9cNjau
         d/neyaOg4tMip37xnyY95sZPi7ypqv9C/tlhlD3PxBg2Wmjqd0cRhiKFVWmC/RUCAFiG
         AVLTy3C0hP5HArLEcm7s69f+cPtWJfJPaTg7zP+2uRQvuK1kZr93tr8XWgqOwWY1oWuv
         dgKE9YKEojM/uWIqi0pPpp2E+JKxo34BfCTFOnWQWEsPeNIoGpqlrLdgoGLwVnmDwixr
         ln0O9MSwjfF/ERrsaATgg51PxTtN0NBAdsZDdyXZQMUb7p6toxe8VL3QWAm03cJokRoz
         c9FA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781563230; x=1782168030; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EWoPj//5pIkn2cgC4tGr9apDCikGzluVBgHuTm0N1eU=;
        b=F/608DjwVEQjBcstIwxS4ufVjV3DUYWAsd5ZUCBOdnzVOX2BWKSdKBn3jpPOqZOOtR
         fqpWGvVxKxUlTj6Czbab2QKOpgJ0zoxWkJPFuItXWOWou5R3V9zx4Iq6J/iA9pm9AzAM
         /P3c1yvlGHzwYKlIe8CvSHljaYEMWxtW2lQPxM7XHbRV3XUcMYLuNyeGzUYN3Yrxbe2X
         0/27UYdsHTS+6Xp1tYtzpO/eLpvwXxrvTegvx3NYyWXvEuMPdquC3v50PbOxTHCdD0Hy
         Hvmn2QYu5xKgT7dYK8cimbW9MHl7lHSOoCUvSp13PIoXB/Cr2q8e5Dx+0fK5N4Jt3+ug
         sUqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781563230; x=1782168030;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EWoPj//5pIkn2cgC4tGr9apDCikGzluVBgHuTm0N1eU=;
        b=OHPMQNVqqFwnRxeyBW/xK/dzb3S6bbuDJ38yAQ1+fZEI8yHsbYdCw/xNb+BtW66LmH
         aUgLS2DpIgVHiZttvCIcGxSfxoiRZRH6MELlArf+uwmVTLbCJuDTKz1w2b/YiA/OPZwA
         alJQ69aH3HmAnzR1yz10vtMAvUxEnCA3NGI3ma7sxwgUv3XeegLgeS+At3bbInsgAnIH
         XxWvb6TimjSuOKM2pOCiM2U+t0DVr7mSsTM9G0wwsGyVoEzJvYCwGGkfAu2z+V/+pEW1
         Cdhtx/KEcG6m4SZXiDQdEtT0cSj1ma3bKrcq6v4osa4TZmRsDyjetAts534BhCijniQa
         SikQ==
X-Forwarded-Encrypted: i=1; AFNElJ9v3SJCxr4aTAlX/DJY9qO7/zOPV6BuK6aMdK+aWvoNJz2NN+SznlL+Zoxawb/xrfrAClCrbgiB+UM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzKvBRH3/Qw2kXfaEs+1/mxRBpOvySBHX7AZSqtAtu4fRuNTBUi
	WTXlLq5/1GsLATVnGvWvuEY4tEtB0MCQUl9ncKwMx91grrRWmV1TrJaDadktxhtHxyAcrngZeFo
	3XlJgNdM5uDHEdjHlKUpMNJJbSwEg0rk=
X-Gm-Gg: Acq92OGAqayGSDdqyMy4phXFFQRDi0so9znWnIi0esXga2Lq+eHPQZ8Rig9VmwKLItz
	D/FJULljR2cOWCQdqXp9/IbXI69I/wu8jW13ww2+ZyjHU8oNznrwYN2n4ChlQZeHg70DperB+wb
	M2ZIEiibWDOlUodjXZ4kdSSU8bLYiN4YgPqhrG96QgDS1KmcrWt6CCmsnaXe+pFsEd7QAOi/uxJ
	ocsz9zFtXO5+Ph1UgVjJDDV/nAfFxlIhN1HAwl3AbWNiq1agqVGy1Kz73XS9GiI/J970d0uFpvq
	3dId11MuWGK86+iI3eFw9LHb2PcIO5YDa0ubG0P+dCAqi1dJwTfUHVBDOMPW5PGrjNFs
X-Received: by 2002:a05:622a:5c6:b0:517:6e5b:ebd9 with SMTP id
 d75a77b69052e-5195359df67mr192701151cf.31.1781563229855; Mon, 15 Jun 2026
 15:40:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260615222829.17420-1-enelsonmoore@gmail.com> <ajB-ebLDYB-pX-4h@casper.infradead.org>
In-Reply-To: <ajB-ebLDYB-pX-4h@casper.infradead.org>
From: Ethan Nelson-Moore <enelsonmoore@gmail.com>
Date: Mon, 15 Jun 2026 15:40:18 -0700
X-Gm-Features: AVVi8Cfl8fCc7Bi3Qc6xQu_BABLdm-w0yCx9dyS-GZQY3rTc-hFej9cvIxi9rIw
Message-ID: <CADkSEUgoqfjgt2OhL+HGjArLrAEiEsZAPOMUQC_-gwtPGRQy5g@mail.gmail.com>
Subject: Re: [PATCH v2] docs/mm: describe current criteria for enabling split
 page table lock for PTE tables
To: Matthew Wilcox <willy@infradead.org>
Cc: Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, 
	Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Shuah Khan <skhan@linuxfoundation.org>, linux-mm@kvack.org, linux-doc@vger.kernel.org, 
	Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Matthew,

On Mon, Jun 15, 2026 at 3:36=E2=80=AFPM Matthew Wilcox <willy@infradead.org=
> wrote:
> is enabled _at_ compile time?

Yes, I think that would be better. This section of the documentation
has a lot of grammar errors, though, and I didn't want to spend my
time fixing them at the moment.

Ethan
