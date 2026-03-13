Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5B8B214813
	for <linux-doc@vger.kernel.org>; Fri, 13 Mar 2026 01:00:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773363659; cv=pass; b=iVHA4lZb+X7NTPF1OgnWD2wPg+l+QlpOQjeWBsSJULOWe4FOCA9ncdLcvo6bcswUljKYZyjwFxKSbafZQnIy/B6Vyzwn8hygI+jTPr5Ki3JGybwgBZIxlFGaRJrdOD/Nbk7miYbp6euS/E8mkxKxUP29JMheBut9rydOOpouHnM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773363659; c=relaxed/simple;
	bh=W1qR4UYr3qUat3cCP1L0WH3vUtEZKMc6jRrqTX60ATI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=M2qfm3rQPt0fAEm3JT8Xw01pemwLA8BXvhMxU0qj39nsoeFNDc7aLbGYz43K7uQJO8K4G63IVboXE9tMBPtWj7ydntQP7GowaqpiDFXnS9el9AcTByK6oVxgjqePZdBThumV2rCmydXMbLdgmlLoDAxgM41BPuy3klPLy5CBpgQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=NDk+ccoV; arc=pass smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="NDk+ccoV"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6634d819492so3149811a12.3
        for <linux-doc@vger.kernel.org>; Thu, 12 Mar 2026 18:00:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773363656; cv=none;
        d=google.com; s=arc-20240605;
        b=M19rrBjh36p6BlUzJE1WJUlPkb0NK9boJvX63Yga26mIhCdPVPRy4QbMmN8LLfDwo1
         uezkfV9vgJyxXSeHgFTyOOB2SLL9PKwLVLyMQoCXyHMhkV8Cdsr7U3ShSB/fCReZDBBQ
         MotDb/DnACFcoqAAXj+Kltqs0MhemDcdy3pOLnpyZwNMHHQ11atyjTwjz6RIzsZOztUu
         /ryZp9ON9VKarb4pWA/hVN0ui65sJm1HiJOkf/5ht9IlI+5j9gFlWmSRYOJTNwUpU3re
         FVbq9QCKHp3m/C+vkryg+GBarskh+rMDAQ79ka/H18Zwk/SJ85uwzKX14WtNhAtR00+n
         pJAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rmWX6afwcKK+qAwiN0L3nTeMMcjlmmTvmcIb6kXEjoU=;
        fh=eqF/7fDv4IEC2mvIfBfQFVlWGIL0xcZK535FITjS20g=;
        b=kHnC3qMr7oqVq21ZUcc2oGUXFrjfyN0IhGJto1tSxt1P3icLEejmY0TiMyPMJX+KdE
         vL3Y10BGKliBLbOxRcgbgc47E9vqTh5nmldEu7za6JrTYEJxGrApkSpsQF8jzHX/pnaN
         uw6rZdc30cFtubVYSndoEmmWGARV25+yFpQNFujmbAaFfsRpDrZCFNOj1/GCZ12Z8RlU
         3+8V+X+uYIHVxkuHMM8GSHowoXB8K/VIwjHFUgBJJ8/iG5W5iuG0Ygmw/QypdBRvh4xn
         loz+0zFPRyBrQZd6fLWvBbWsdKFVE83sLZI+7vFJZn1E/nF1ECIqm5+mOVZQCXJzD8gI
         E3sQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1773363656; x=1773968456; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rmWX6afwcKK+qAwiN0L3nTeMMcjlmmTvmcIb6kXEjoU=;
        b=NDk+ccoV41473Lg8Nsqz3EuHkbq1phT3CplrYrZ148GXQjwORO/WNsOB1EKecTWcJE
         rtQZZ2CAYNXWIkds2Bn4XRoSXlHB/1mjVRYQ6BAsKBFEp+f/lmoKOI7glkpdZKcyPv0W
         2F0PH+rL4gcv3DcHtjwHRFdmwRsgbTPvwqrWnbgP/Fx5z1w9jZkorvmlfiZU5o6XKO/u
         8lDTI0xVxbOZYAYRdZd1QM4+V4ajyO21d35zZ6JB4F9xjgmBKLdz5Tq8zYv3uHAcAReA
         X8zj2ENY7jpS+7uFuf+1ipyZDWW/5k+33hp12bm00za2LGw27enD0W0A0b3N8UK+1xPM
         wa+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773363656; x=1773968456;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rmWX6afwcKK+qAwiN0L3nTeMMcjlmmTvmcIb6kXEjoU=;
        b=khqdt3lg1fWXFPSKUBbYgVOD4lddp/OB/yZlzGDOnHs0c/8UuAr76GZi3CQudgF4jn
         3OJ+gWqQXmyn2fT7uEe/DclUJvqosqoyKNz9jm0Ty+bTHSGZV/S7lF1D6JQNNEIohark
         3pppbWAxjv90D4Jy3J27RoSP2pnuMiAu5gX6KtmAc3l5Oid+Bl6wYihOEwsNDtwoQ2J6
         ybMydAoFtf7G5vg3IGZgorUdcvYF4HUXlyr2KRsaVP25fubyAaTweIHAGelvdwrrSctj
         lZCqr4YetNI+xysX24ZHkyPcROwOk6zumknaUPt42M9YGAKxylwmWJQWMO+6uc3NqyGQ
         w6lw==
X-Forwarded-Encrypted: i=1; AJvYcCXBB1ALWaqJ98LozcWtMrrcVcyAlkqpcvI1Ig7E3Hd7gUoMcVzoyjEwR69cax0dX/7U5YZneDyY81Y=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+YrlIu2rWEdOtHyjdVdS3cCx3/ViTbv50hRLCWdxWRrLlrfsR
	CQ8T9dUeTV3xW/VEKxFsHOHO1USTpmAhOXWMopiiDdXu5NwlIeas7nyySfYYeRBU65qr0VBDzME
	1maFrgFuuR7nrKQ6dDCIKDD3ocyFLqJhuAtfToGv8DQ==
X-Gm-Gg: ATEYQzz5CZP74MC10a2Ra1vZfPogpTpdzA0JWivpeDqnupBsIengkIYi1leCNdT4Wy3
	2ySP0aOcFezHguoB6D2IzyGl2JEDMEkJA6i0u0Nn9RbYJmCACpBnjxCH0lf1276DMzGjhGyaNQw
	diXHrqIxqZR026N116X1FCpRz1F0hTifXF1AsXhKWGZV4tLMTjTFj/TlvgcK1Hdo068FrvvsXj4
	qqdoqSzRJ5I8moOR3taC18qN6WhRz+m1TNjzPNqsj6fkoRxi5fqb7oZVSeCPAN23wpCPFb/xV5r
	2W/CgNGfdRqK0EIbEmUD6nX779AFy3UNUjwV10b4hxd79QZx
X-Received: by 2002:a05:6402:1d49:b0:663:4560:aa8d with SMTP id
 4fb4d7f45d1cf-663bac0b2a9mr787697a12.26.1773363656161; Thu, 12 Mar 2026
 18:00:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251218155752.3045808-1-pasha.tatashin@soleen.com>
 <20251218155752.3045808-5-pasha.tatashin@soleen.com> <CALzav=cJmgG04+Ba82Rnr3iKpU0gKD5WD3oF-_43rdD7T+REEQ@mail.gmail.com>
In-Reply-To: <CALzav=cJmgG04+Ba82Rnr3iKpU0gKD5WD3oF-_43rdD7T+REEQ@mail.gmail.com>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Thu, 12 Mar 2026 21:00:19 -0400
X-Gm-Features: AaiRm51GTpcl9Y1xewqBoObbD5fxW5xRQjRFOFdPyL_QXAS4XNVVlbgb9vcN1yw
Message-ID: <CA+CK2bDwNjiCbLXzBuh7Q89NFi59NHsQjwwBy8iRdyJ-5cMyrw@mail.gmail.com>
Subject: Re: [PATCH v9 4/5] liveupdate: luo_flb: Introduce File-Lifecycle-Bound
 global state
To: David Matlack <dmatlack@google.com>
Cc: pratyush@kernel.org, rppt@kernel.org, skhawaja@google.com, 
	rientjes@google.com, corbet@lwn.net, akpm@linux-foundation.org, 
	kees@kernel.org, davidgow@google.com, pmladek@suse.com, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	nicolas.frattaroli@collabora.com, linux-doc@vger.kernel.org, tamird@gmail.com, 
	raemoar63@gmail.com, graf@amazon.com, Bjorn Helgaas <bhelgaas@google.com>, 
	Alex Williamson <alex@shazbot.org>, Jason Gunthorpe <jgg@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 12, 2026 at 7:59=E2=80=AFPM David Matlack <dmatlack@google.com>=
 wrote:
>
> On Thu, Dec 18, 2025 at 7:58=E2=80=AFAM Pasha Tatashin
> <pasha.tatashin@soleen.com> wrote:
>
> > +static inline int liveupdate_register_flb(struct liveupdate_file_handl=
er *fh,
> > +                                         struct liveupdate_flb *flb)
> > +{
> > +       return -EOPNOTSUPP;
> > +}
>
> I think LUO could use a cleanup to return 0 in all the register
> functions when Live Update is not enabled via CONFIG or parameter.
>
> I think all of the users of these functions are going to want to
> ignore -EOPNOTSUPP. memfd already does.

I would think EOPNOTSUPP is a standard return error when a feature is
not enabled. What if a component would need to do something different
by knowing that FLB is disabled and therefore perhaps it would also
skip some of LU related changes? I think it is a very minor think to
ignore EOPNOTSUPP when checking of other error types.

> > +static int luo_flb_retrieve_one(struct liveupdate_flb *flb)
> > +{
> > +       struct luo_flb_private *private =3D luo_flb_get_private(flb);
> > +       struct luo_flb_header *fh =3D &luo_flb_global.incoming;
> > +       struct liveupdate_flb_op_args args =3D {0};
> > +       bool found =3D false;
> > +       int err;
> > +
> > +       guard(mutex)(&private->incoming.lock);
> > +
> > +       if (private->incoming.finished)
> > +               return -ENODATA;
> > +
> > +       if (private->incoming.retrieved)
> > +               return 0;
> > +
> > +       if (!fh->active)
> > +               return -ENODATA;
> > +
> > +       for (int i =3D 0; i < fh->header_ser->count; i++) {
> > +               if (!strcmp(fh->ser[i].name, flb->compatible)) {
> > +                       private->incoming.data =3D fh->ser[i].data;
> > +                       private->incoming.count =3D fh->ser[i].count;
> > +                       found =3D true;
> > +                       break;
> > +               }
> > +       }
> > +
> > +       if (!found)
> > +               return -ENOENT;
>
> FLB users have no way to distinguish between "there was no data
> preserved" and "there was data preserved, but it was not a supported
> version".

Strictly speaking, FLB doesn't have a concept of "versions", it only
operates on compatible or incompatible data strings. If we find FLB
data but the compatible string doesn't match, we have no way of
knowing if that data was even intended for this specific handler.

> This is especially going to be important for PCI [1] since there's a
> big difference between "there were no devices preserved" and "there
> were devices preserved but the incoming kernel isn't compatible". The

If the incoming kernel does not find preserved device state, shouldn't
it just be treated as if no device state was preserved at all? In that
scenario, the subsystem would fall back to standard initialization and
simply reset the device state.

> former means there's nothing for the PCI subsystem to do wrt Live
> Update. The latter means we should probably panic the system.
>
> [1] https://lore.kernel.org/kvm/20260129212510.967611-3-dmatlack@google.c=
om/
>
> > +/**
> > + * liveupdate_unregister_flb - Remove an FLB dependency from a file ha=
ndler.
> > + * @fh:   The file handler that is currently depending on the FLB.
> > + * @flb:  The File-Lifecycle-Bound object to remove.
> > + *
> > + * Removes the association between the specified file handler and the =
FLB
> > + * previously established by liveupdate_register_flb().
> > + *
> > + * This function manages the global lifecycle of the FLB. It decrement=
s the
> > + * FLB's usage count. If this was the last file handler referencing th=
is FLB,
> > + * the FLB is removed from the global registry and the reference to it=
s
> > + * owner module (acquired during registration) is released.
> > + *
> > + * Context: This function ensures the session is quiesced (no active F=
Ds
> > + *          being created) during the update. It is typically called f=
rom a
> > + *          subsystem's module exit function.
> > + * Return: 0 on success.
> > + *         -EOPNOTSUPP if live update is disabled.
> > + *         -EBUSY if the live update session is active and cannot be q=
uiesced.
> > + *         -ENOENT if the FLB was not found in the file handler's list=
.
> > + */
> > +int liveupdate_unregister_flb(struct liveupdate_file_handler *fh,
> > +                             struct liveupdate_flb *flb)
>
> Alex Williamson and Jason Gunthrope both suggested this should return voi=
d.
>
>   https://lore.kernel.org/kvm/20260303210733.GG972761@nvidia.com/
>
> I suspect liveupdate_unregister_file_handler() should as well. I don't
> think there's anything callers can do if unregister fails.

Thank you for the heads-up; I replied in that thread. We can clean-up
some of the return erros, but I am not sure what to do about -EBUSY.

Pasha
