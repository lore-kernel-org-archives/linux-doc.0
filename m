Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C07D337998A
	for <linux-doc@vger.kernel.org>; Fri, 22 May 2026 16:11:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.133.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779466273; cv=pass; b=MoEioNqcw2vTInlRlbA0TFIHPgegg1GYg0WVIM24JOuBF8qKBh7VBGK3kQaZfcZm/81SDyQjQVC7f4JSDwlTNyeOz2TjbUlI5yevuVoLSAsaDuIKHW38mm9/qeWOcemdLm10pzDNzKItRz3BcCOz8Amj5d6I23+nGZP1hiOeMug=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779466273; c=relaxed/simple;
	bh=La2W+yN0vzwPkY2oECj6NHOhikNkncK+jT4y0b881Cg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RcvxaOZXRk4n3mZ/6NXF+qxVhTrXxYrDWcMvuK3kNS3k89v5H3/oO2MACSfSgz0TUpAxBZrQfe9XpndMGln/Ct7EWOd0cUUMgyIgxuoydIyUoH4DnGHTjyLLKF881kzry4IKiJYdj+AjRrM6QkLVnH4raBrlhFXlBLaUy7DEDT8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=JlT3hKo5; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=L/LwCJXL; arc=pass smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JlT3hKo5";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="L/LwCJXL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1779466271;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IzxgIsKBLy9Uo/RJ5aMTM+y5Ci98qZZTufyvn4tb+6I=;
	b=JlT3hKo51763Chr+28crtcDS7xH9BtWFNUwqozOalRZHjhMcrvF2ShARYATaI5XOzzMIzR
	WadL15AHn+PgaGL47D6tbsqVx0BcCXsalMymWVt1oYZ2bU5yVrqkmuvAKOfyAZERFS548a
	C2It6a+VYr0yPdEqWvQUFaoG5C9g8f4=
Received: from mail-yx1-f69.google.com (mail-yx1-f69.google.com
 [74.125.224.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-604-U6Atk0z3PouAfJQzM4hMag-1; Fri, 22 May 2026 12:11:09 -0400
X-MC-Unique: U6Atk0z3PouAfJQzM4hMag-1
X-Mimecast-MFC-AGG-ID: U6Atk0z3PouAfJQzM4hMag_1779466269
Received: by mail-yx1-f69.google.com with SMTP id 956f58d0204a3-651c15e69d7so1347903d50.0
        for <linux-doc@vger.kernel.org>; Fri, 22 May 2026 09:11:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779466269; cv=none;
        d=google.com; s=arc-20240605;
        b=HiB3bzmjiMd9NL2e7KWcRxqvlQb5dKjjAVHbPdeEcjSNXIP4OnDkzMm/3EAPREfv5B
         R7qqJlVP2y2bqbJKPEgdjST8KpjLm59RRTPBkjXEXZRIbOVcolrMy4h9pZ57HtGTybc4
         El30QEUbhHEydb8jQlFxpiqr1BB2zUinagfXhT8e8GwNkpyd3qRROFHtZQZGoHVyM/Nv
         vf49GzEobrLQHZoZ0u9MK5242DsoaB6XTLcK2EcGhX1KWE1qVc++gSXA+xHwlkzQf6vb
         zymCLCF+MuYLVpGsmbJMR67dT8+WUE7KYr2WYVcPWU/NPMAMiajKwPkkXXWytKDeVwxb
         GZ1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=IzxgIsKBLy9Uo/RJ5aMTM+y5Ci98qZZTufyvn4tb+6I=;
        fh=qG38DUs7GM1PdFhiAApGwiSCQdww9xukaUXq2FM8OJY=;
        b=FV7D1wA3LCNWER7cGi4V44i4PgurI0pb2fTF8Q06sjpFI5V+Wvz5+j9UqLTsmWIF65
         y4cvRQZREm5tuQI0pVaqjVWYbl2QFJvuqIAZumHXcstHdEkkfCCGgRn7OUnYK3G/8Vq2
         v2/VDZtA6MrSah7dpAo0ZHQMNThoJvIRVBErBEkgoRKxi+bKxvouxVhPuySFiQt8UvP8
         4cbSmdllvL4aLNBiV0hbKsFm9oj7PA1uC6eyUKDSkP2iiv4HZbe4TupMuUdgI9Jy+n6z
         4PnrY9Z6QsyLtU1/eBoJxLZ3X/H1yQZXT+u7Bp8yoJBB2sDZNjgy2ZPZKe5VDdogEjnO
         v6Qg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1779466269; x=1780071069; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IzxgIsKBLy9Uo/RJ5aMTM+y5Ci98qZZTufyvn4tb+6I=;
        b=L/LwCJXL2/rUxvp4jxtPXzvbBABZnRBEI+/tINv5ZwQhc/cE+Exqf2et/UnaJO25Zv
         DMvI+LoOAWgofu4IkECDNJl3ZkWp/Aq4S3yJddAvEixut0wP/9yyzxWjRhCd4jjbylFA
         Vu4TVwC//UA9/qSeIZ/DVaNNj8RjUHFxl5tYfNRzQkt4ta/kLo0i/mbMzBZxDL/yqRlQ
         hmxvXXfLnXKjzZwdGjbQKOT0uOWsjahqlY4CnH7/NRAjKA0Eh3vYif30gyaNTvgcwQBJ
         HUBxLsEhM0pmhZA1I7yuJuYOYw7svwLfXdhQ6cyExe+FQZmMmPvoyNx4BWd8hMA6yzsJ
         yKjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779466269; x=1780071069;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IzxgIsKBLy9Uo/RJ5aMTM+y5Ci98qZZTufyvn4tb+6I=;
        b=Jzhct7p7n29WfMekU8KXiSHZc+5mkkOH4LddPPF8DrqlfsUYvGZPlMpTRIuBzrXLix
         iIRezoZVVhQwscyRgFLdWYdxbs9AH8SUS8bQmV0YmkOZb7si+Mcjtx0nOaYC9NwYiGRH
         Xiyd8o2z6VzUUT6HqLl2/H1t0XCCCprk25ABzvimNL+8tXsd6Cn+Qu+NU4uBaZPn32IL
         Ul+0yOJ+HRpvddDu74BAoxOgxRyKb8VmAj7j/OREAKkueUJym6Qci7ET6ej8rvUPwSf0
         oR2GGeVlXGnJRTlRZ7FTk3/c1Yv042uVSRdWu7IDeoYJ/AI4N45ieVxPEx1BfL2k470o
         sB4Q==
X-Gm-Message-State: AOJu0Yx2rrduIuh93MKk5FmkmVzJ5tEVRmc7ej/RoqkVABqFE2BohItd
	+/q2kmCDCuUsE7a1KD8m51Q/Si6bXWRZibpJ1G++c2wbKZG5bEsDZDNwkzuj/ZomNMAuQUJuaEf
	8K8U0FOaTLnu1C6+HDqBfkFEwrTTN9V1sxAjbY9dQrG9sujxOEJ4k+YCWMxlMCyXkVxDlRQVdH7
	c74RTZSa2MV59aOIqDGkeQx+/T+ZEs5aRvF09I+jcL3TzrR3I=
X-Gm-Gg: Acq92OHd1lufJDCSQSds6xSF57WEmhQ64k7ntfuM0JMA7FYLS0AHBBQDkx3N8H4IJfP
	5B61oAoukaovhqrzh6dWnuaY9RjcIAqGWaM/FzyqVGpm2xm5slir3Gn83ttkh+3xRAPt1s+mDPi
	VBhOmv7qQh3oM0bfiqlCSJvgxLEmzVkK3QVqcvfxw1KD+jTf9q2/unCW1zRDMB8InkOx7wRXh07
	ebW4g==
X-Received: by 2002:a53:c049:0:20b0:65e:b05:7679 with SMTP id 956f58d0204a3-65ec9631f73mr3544900d50.3.1779466269022;
        Fri, 22 May 2026 09:11:09 -0700 (PDT)
X-Received: by 2002:a53:c049:0:20b0:65e:b05:7679 with SMTP id
 956f58d0204a3-65ec9631f73mr3544806d50.3.1779466268532; Fri, 22 May 2026
 09:11:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260522150009.121603-1-npache@redhat.com> <CAA1CXcCoDU_pnp0SmMzRi8wPGB1OBjbbokevq2X_03X1vpWtOw@mail.gmail.com>
 <bd622950-62cf-4b57-b3ac-89635f28fa4f@kernel.org>
In-Reply-To: <bd622950-62cf-4b57-b3ac-89635f28fa4f@kernel.org>
From: Nico Pache <npache@redhat.com>
Date: Fri, 22 May 2026 10:11:38 -0600
X-Gm-Features: AVHnY4Kw4pwY2uJsQhaEmVi-b5AxtiG-JxHuFGdnogUOlR8F2xU-TlkRWivxYiQ
Message-ID: <CAA1CXcD373fFfo9YPWRj8mJ_rsnzyCrpn1uk3=k7kU=QuaLOgg@mail.gmail.com>
Subject: Re: [PATCH mm-hotfixes-unstable v18 00/14] khugepaged: add mTHP
 collapse support
To: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
Cc: linux-doc@vger.kernel.org, akpm@linux-foundation.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linux-trace-kernel@vger.kernel.org, aarcange@redhat.com, 
	anshuman.khandual@arm.com, apopple@nvidia.com, baohua@kernel.org, 
	baolin.wang@linux.alibaba.com, byungchul@sk.com, catalin.marinas@arm.com, 
	cl@gentwo.org, corbet@lwn.net, dave.hansen@linux.intel.com, david@kernel.org, 
	dev.jain@arm.com, gourry@gourry.net, hannes@cmpxchg.org, hughd@google.com, 
	jack@suse.cz, jackmanb@google.com, jannh@google.com, jglisse@google.com, 
	joshua.hahnjy@gmail.com, kas@kernel.org, lance.yang@linux.dev, 
	liam@infradead.org, ljs@kernel.org, mathieu.desnoyers@efficios.com, 
	matthew.brost@intel.com, mhiramat@kernel.org, mhocko@suse.com, 
	peterx@redhat.com, pfalcato@suse.de, rakie.kim@sk.com, raquini@redhat.com, 
	rdunlap@infradead.org, richard.weiyang@gmail.com, rientjes@google.com, 
	rostedt@goodmis.org, rppt@kernel.org, ryan.roberts@arm.com, shivankg@amd.com, 
	sunnanyong@huawei.com, surenb@google.com, thomas.hellstrom@linux.intel.com, 
	tiwai@suse.de, usamaarif642@gmail.com, vbabka@suse.cz, vishal.moola@gmail.com, 
	wangkefeng.wang@huawei.com, will@kernel.org, willy@infradead.org, 
	yang@os.amperecomputing.com, ying.huang@linux.alibaba.com, ziy@nvidia.com, 
	zokeefe@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 22, 2026 at 9:13=E2=80=AFAM Vlastimil Babka (SUSE)
<vbabka@kernel.org> wrote:
>
> On 5/22/26 17:07, Nico Pache wrote:
> > On Fri, May 22, 2026 at 8:59=E2=80=AFAM Nico Pache <npache@redhat.com> =
wrote:
> >>  include/trace/events/huge_memory.h         |  34 +-
> >>  mm/huge_memory.c                           |  11 +
> >>  mm/khugepaged.c                            | 634 ++++++++++++++++----=
-
> >>  5 files changed, 584 insertions(+), 172 deletions(-)
> >>
> >>
> >> base-commit: 6c8cb505a5634594b3ea159fd1c71bce2acf3346
> >
> > Whoops I manually changed the coverletter subject to reflect that this
> > in on mm-hotfixes-unstable but never updated the others...
>
> But why? That branch is for hotfixes that would go to the current 7.1-rcX
> series. mm-unstable would be the correct one for this, AFAICT.

Sorry this was a misunderstanding. The goal here was to base this off
the closest base commit behind where my v17 already lies in the tree.

That just happened to be the hotfixes tree (previously it was
mm-unstable, but that seems the have moved).

Sorry...
-- Nico

>
> > Hopefully that is ok. Just a small mistake. Base commit is referenced h=
ere.
> >
> > -- Nico
> >
> >
> >> --
> >> 2.54.0
> >>
> >
>

