Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCA2614AD22
	for <linux-doc@vger.kernel.org>; Tue, 14 Jan 2025 15:55:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736870103; cv=none; b=kWHA9n6Ogmeg9i4VScRYkhXVLxnIT6Az7oglEbjdPQlq3/msErQZB14hh6zX5m0lYti6rNtuzfVBv32kpkWhreyU5h5OTT/ElGefXH5sbHASHdH5D2PMCjND1JdgPSj/AgwJbhRE8IrdqUB/5TdPJTJdZpYm8lvU/qxrj+IJtXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736870103; c=relaxed/simple;
	bh=fblTB3hUb4UbQTwtdqf6FFOAlF1I2XILRkBy4ZMf0/c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=brrCnbQDbMCFS3v6UoGicnw/bDak+DxPTBUsR/UZQMICYxESh9g+ka1AMXnpRUb+evE2E9ax3vPyMeq3dEL1aQ1qxc6hNtTdywT+MJCbQE4JbGpvZRTn0ZYkszH9u02peR/q9FDH0FQW/wBo+MlHDcri0Y8W3yyAVTsdhqAvhlA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=vnt6DrO9; arc=none smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="vnt6DrO9"
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-467abce2ef9so258381cf.0
        for <linux-doc@vger.kernel.org>; Tue, 14 Jan 2025 07:55:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736870101; x=1737474901; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wF1XaPNeeHyy6I0ZTk5qOi0F8MmKtWhrdYbpkEjSIu0=;
        b=vnt6DrO9lScuZC4RW62tSVY+JcMObcyFOgFAJSOvLyV4KduLnhyo9SQsyxVkWww3P6
         22hVVIWpqwamgvYu3dBx9GoEG8yn2yOUD8i379sohL7QPDonjEBMNxfKG2gJPUPtAKzH
         4X7qpPyAhotF3IAVszhYA6801QKUsB+LaavoaPFP6zNkIkPnrM0ZIXNor7Scydo+bZVm
         4uF3OMROtDY46UPlP2Xb+U3664qFmW/lAB9SNDP5eG8fA8oMpeObW7kEJnoUNeiLuB15
         J1tayNXx2Ankmgz+NCMrLsoP1FmbPguiv+tptrzp8rMehobLz1fKPrFlkGb/eTPc9oOU
         CzxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736870101; x=1737474901;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wF1XaPNeeHyy6I0ZTk5qOi0F8MmKtWhrdYbpkEjSIu0=;
        b=inCrXBrhW5BuJIO4yTGLlgWdJwmYNgzTIHvxo3HDfK0Ef2trM7vy1oSyCjMX6D/Yt+
         HWLW4Uin9re7SZS3CtENgPqkimf9317tND0sUN7iLKxos/dFrmxS4KFnAStndNgnoV8M
         GYL0gHsjjYeo3kmJ65sDQ2Q89MbSQeSBr/sT/gDuUUHuvl1EiTpiPoo6JVsXCI44Q2vc
         ikaJoyaGhpSxzlbEgfcI4LNzaFSSFnIN6+uFk8iymeklb8fjp+lcQ6dAUCuEjIAWxdJQ
         tBPxdUMfGUKZEAEJLMG/RqFN8s5FNpOM76b5rIxcZFs0PKrbgwv9C5RfSL+EOQMI+pLd
         XulQ==
X-Forwarded-Encrypted: i=1; AJvYcCWg45vPMpRF4ncSwMG4qMXPMbI7W9JnNqG3PmV5eIM7xjOD0fhXhDBHOPBb2DrFNeVSU4J3q7bejEM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxbvYoQp7ZI7RbhVbqKwAnmgbgOook3oq41XlzWwbQoYVKfX9sr
	+KsAUHEVrJu6coje7cAlEfpynFiQCa0Cp8Bx2gEy7oIsJqN4KIDRNClExVweBffrrMqyxpJTOJw
	lYla+93+KBZ2BDGdhLhFtlN50COFWBH7FdDZC
X-Gm-Gg: ASbGnct5WC0CSamoKo+qlU5auKsz+KxwGw1+NxKtcCVo08GBF/M1PfwxLX5xsXhNAX2
	5VPYGxZbGnsPN/SfTg5BB3ZPPAYaLyPGhhnkO3JmHGQ2GYKa/UOOLSh9DVdZwgPNJzvw=
X-Google-Smtp-Source: AGHT+IFgdTpup1GYDGSEvF1leaxbVoZ8pyqiDLUE7jpajzRtPs6Eg9Iy9tZ5ym096+KKR5or2HrexB3d6Hejq7V2YLk=
X-Received: by 2002:ac8:5d50:0:b0:466:7926:c69 with SMTP id
 d75a77b69052e-46de97879d8mr3457441cf.20.1736870100414; Tue, 14 Jan 2025
 07:55:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250111042604.3230628-1-surenb@google.com> <f5e26a57-ec77-4df8-8b4f-5a718a046894@lucifer.local>
 <20250113174941.8c6d5defe18c8b1a7e477ace@linux-foundation.org>
 <CAJuCfpE0Kdd8EnsjOJ0WW8QcDYbWji3S_LEu+=J9aTVioFMQ+w@mail.gmail.com>
 <20250113200908.d821636a39e9ca6130a90e24@linux-foundation.org> <ajefxu3ed4oz2uomvmc7u4fj4zj2x2lvzmec7okif6stjptc6l@i6wmo4wuwgh3>
In-Reply-To: <ajefxu3ed4oz2uomvmc7u4fj4zj2x2lvzmec7okif6stjptc6l@i6wmo4wuwgh3>
From: Suren Baghdasaryan <surenb@google.com>
Date: Tue, 14 Jan 2025 07:54:48 -0800
X-Gm-Features: AbW1kvaX8NijIyw9mxov9DIlqORZy3MdUBdxlhrheEa5wt5NbEsbklLgwutsy98
Message-ID: <CAJuCfpHGJ9RR0tJyrLzLZEf9r=CQidoi9xJEAyHYs4Kx=1JxXw@mail.gmail.com>
Subject: Re: [PATCH v9 00/17] reimplement per-vma lock as a refcount
To: "Liam R. Howlett" <Liam.Howlett@oracle.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Suren Baghdasaryan <surenb@google.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, peterz@infradead.org, 
	willy@infradead.org, david.laight.linux@gmail.com, mhocko@suse.com, 
	vbabka@suse.cz, hannes@cmpxchg.org, mjguzik@gmail.com, oliver.sang@intel.com, 
	mgorman@techsingularity.net, david@redhat.com, peterx@redhat.com, 
	oleg@redhat.com, dave@stgolabs.net, paulmck@kernel.org, brauner@kernel.org, 
	dhowells@redhat.com, hdanton@sina.com, hughd@google.com, 
	lokeshgidra@google.com, minchan@google.com, jannh@google.com, 
	shakeel.butt@linux.dev, souravpanda@google.com, pasha.tatashin@soleen.com, 
	klarasmodin@gmail.com, richard.weiyang@gmail.com, corbet@lwn.net, 
	linux-doc@vger.kernel.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 14, 2025 at 6:59=E2=80=AFAM 'Liam R. Howlett' via kernel-team
<kernel-team@android.com> wrote:
>
> * Andrew Morton <akpm@linux-foundation.org> [250113 23:09]:
> > On Mon, 13 Jan 2025 18:53:11 -0800 Suren Baghdasaryan <surenb@google.co=
m> wrote:
> >
> > > On Mon, Jan 13, 2025 at 5:49=E2=80=AFPM Andrew Morton <akpm@linux-fou=
ndation.org> wrote:
> > > >
> > > >
> > > > Yes, we're at -rc7 and this series is rather in panic mode and it s=
eems
> > > > unnecessarily risky so I'm inclined to set it aside for this cycle.
> > > >
> > > > If the series is considered super desirable and if people are confi=
dent
> > > > that we can address any remaining glitches during two months of -rc
> > > > then sure, we could push the envelope a bit.  But I don't believe t=
his
> > > > is the case so I'm thinking let's give ourselves another cycle to g=
et
> > > > this all sorted out?
> > >
> > > I didn't think this series was in panic mode with one real issue that
> > > is not hard to address (memory ordering in
> > > __refcount_inc_not_zero_limited()) but I'm obviously biased and might
> > > be missing the big picture. In any case, if it makes people nervous I
> > > have no objections to your plan.
> >
> > Well, I'm soliciting opinions here.  What do others think?
> >
> > And do you see much urgency with these changes?
> >
>
> I think it's in good shape, but more time for this change is probably
> the right approach.
>
> I don't think it's had enough testing time with the changes since v7.
> The series has had significant changes, with the side effect of
> invalidating some of the test time.
>
> I really like what it does, but if Suren doesn't need it upstream for
> some reason then I'd say we leave it to soak longer.
>
> If he does need it upstream, we can deal with any fallout and fixes - it
> will have minimum long term effects as it's not an LTS.

Thanks for voicing your opinion, folks! There is no real urgency and
no objections from me to wait until the next cycle.
I'll be posting v10 shortly purely for reviews while this is fresh on
people's mind, and with the understanding that it won't be picked up
by Andrew.
Thanks,
Suren.

>
> Thanks,
> Liam
>
> To unsubscribe from this group and stop receiving emails from it, send an=
 email to kernel-team+unsubscribe@android.com.
>
