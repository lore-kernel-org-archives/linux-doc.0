Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BEAA147C86
	for <linux-doc@vger.kernel.org>; Mon, 29 Jul 2024 13:37:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722260270; cv=none; b=Rm28sHsXPsOJaTYvDYjMBIIoUnF7E9x+/jxZ1Y0U49wZggE8BmPpRtfJLZXalLvK2uJ4WObDQ0paUCGan0IPZ2NgOeFuWclvhN7Eq9ciJ6Q/7AX8ncnwFimKqXsmZ4nl8LTxodGAl/Sw8diJznGjga78SnGNFsgUIS4PICzYZlA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722260270; c=relaxed/simple;
	bh=yG95b8+bC4kOE+uaI8opD8vDKWLRODfkFzlGoBvrT+s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QB3n3MYZhHFtr868psjk82iFx79j/UXIu+tU0KY7FnxVJxLe2qN3bfFfpyWhmisaLtEFUhdkikvqwZyDv8aDS12GesK9XzLpbXgE8Iml2CGcNEZjYZXpEVceHnBbvEkkzfJexSSB8ulh2o188yr7BIiX4RXxEFpXWfPBqLPnNr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vimeo.com; spf=fail smtp.mailfrom=vimeo.com; dkim=pass (1024-bit key) header.d=vimeo.com header.i=@vimeo.com header.b=FlpIE8aw; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vimeo.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=vimeo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=vimeo.com header.i=@vimeo.com header.b="FlpIE8aw"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-70d162eef54so2068058b3a.3
        for <linux-doc@vger.kernel.org>; Mon, 29 Jul 2024 06:37:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vimeo.com; s=google; t=1722260268; x=1722865068; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sVlA1fdRbUzGUAt+y6uU46luMcytNgyhT35LNSCEVFI=;
        b=FlpIE8awr0cTwKExXUN4iBYmqWqHwMJfgkTsUPn3rZoChr+1ZTfybqcEcHMBBgNrCA
         UfWYShJ/dKI+3SfRhH/KQmuM1Xfluw/U7s0AJnZNA54MrNVGCaBVHb4C8RZkebG4agNB
         1Sp2VyRup8IFSC9jKmYyAii/ykANZ72Are/I8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722260268; x=1722865068;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sVlA1fdRbUzGUAt+y6uU46luMcytNgyhT35LNSCEVFI=;
        b=wuVza9Rvx0ksRFt3Dck+Afbu8JXFFqxlIzZ7Z+fF6uTkgBSs9I+16Tzyf4io0QNhgU
         +rqf1s2w5uZEds6Xquxf4zMH950gZlZ/84K7w54uIxha320XtkNEb7h/NGCDKI2v7dR5
         NnoKcDXUsS31X2z42+PZT7Eo04G7nWC07THKJbF/WKuRDTkLkxNtCSRA1YkVPC/lpUZ+
         I/2IwiTRNQ8LWhPWvT6AjAuOOVgMntyxAYQ6WPJ9B98OGAbD6ig629RQbTpNj3yqSvDA
         NKF5yLuR04ejZsjJPnHAzNzEv4fLDRelzEcyK1iOV1YeG5EBt3NI5XEKfYLs82Bo3N74
         mr3w==
X-Forwarded-Encrypted: i=1; AJvYcCVPorrq+NyDXKX4t5x4SVQsBCIst804/MMgG0spQgZc4lTWRVhFsrk2GsJMNAFeaxEJDRoSuT6JvnUvhxS/NTGvN/QXD7tEyKbx
X-Gm-Message-State: AOJu0Yw1O4l3MG50PyktFCCoxyt0P85nASyM+QcJz1o+JHEUg9OUpHAG
	R1D4r+qYWVdUSBuGxmtnj0rlnDHwnL5ouM4MW3BnjCV33Tg0//ofmNCGVVnEf3Y8eIn0uOvOCz5
	/LUPdCvHXM7kZFoyyuF8Hjrv1nIVpFmf+V+A46g==
X-Google-Smtp-Source: AGHT+IF61PUOxYopexvONqf7EeqGxcofDSZYfNicSgd0cvdI1gdvPurED0XAgonezp6ozKF6WcHIo+B+gfQ7euXDvTg=
X-Received: by 2002:aa7:88c5:0:b0:70d:262e:7279 with SMTP id
 d2e1a72fcca58-70ecea01412mr6938042b3a.3.1722260268207; Mon, 29 Jul 2024
 06:37:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240723233149.3226636-1-davidf@vimeo.com> <20240723233149.3226636-2-davidf@vimeo.com>
 <ZqQFaz07jIg4ZKib@slm.duckdns.org>
In-Reply-To: <ZqQFaz07jIg4ZKib@slm.duckdns.org>
From: David Finkel <davidf@vimeo.com>
Date: Mon, 29 Jul 2024 09:37:37 -0400
Message-ID: <CAFUnj5Op_SZ0sx7wCii=EWgx-nXycpMe1=961Z8ayOeAFSb2yA@mail.gmail.com>
Subject: Re: [PATCH 1/2] mm, memcg: cg2 memory{.swap,}.peak write handlers
To: Tejun Heo <tj@kernel.org>
Cc: Muchun Song <muchun.song@linux.dev>, Roman Gushchin <roman.gushchin@linux.dev>, 
	Andrew Morton <akpm@linux-foundation.org>, core-services@vimeo.com, 
	Jonathan Corbet <corbet@lwn.net>, Michal Hocko <mhocko@kernel.org>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Shuah Khan <shuah@kernel.org>, 
	Johannes Weiner <hannes@cmpxchg.org>, Zefan Li <lizefan.x@bytedance.com>, cgroups@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-mm@kvack.org, 
	linux-kselftest@vger.kernel.org, Waiman Long <longman@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Tejun,

On Fri, Jul 26, 2024 at 4:22=E2=80=AFPM Tejun Heo <tj@kernel.org> wrote:
>
> Hello, David.
>
> On Tue, Jul 23, 2024 at 07:31:48PM -0400, David Finkel wrote:
> ...
> > +     A write of the string "reset" to this file resets it to the
> > +     current memory usage for subsequent reads through the same
> > +     file descriptor.
> > +     Attempts to write any other non-empty string will return EINVAL
> > +     (modulo leading and trailing whitespace).
>
> Let's just please do any write. We don't want to add complex write semant=
ics
> to these files. Writing anything to reset these files is an established
> pattern and I don't think we gain anything by making this more complicate=
d.

I still think something more limited is right here, but it seems that
there's consensus
that accepting all non-empty writes is the right option here, so I've
removed the check.
The next patchset will accept any (non-empty) write.

>
> Thanks.
>
> --
> tejun


Thanks,
--=20
David Finkel
Senior Principal Software Engineer, Core Services
