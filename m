Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3767B158DD8
	for <linux-doc@vger.kernel.org>; Wed, 15 Jan 2025 15:14:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736954058; cv=none; b=Q0yabfsY4l6uGKWxNXmibgsUuaFvFMnlOGOlVRyQkj6fmPgYkt5ZL29MIFhxpIn7DrTEG2C0osmcKDyFwqWy++NABiAClMHHrIjK17izA5BidZosSUG58o9/5PT7hpxHdooJwyBJ0l0SpnOqYMjYDJKpfV8gtQxfM1qvP9WeGJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736954058; c=relaxed/simple;
	bh=Sh014yg23opCCpRLRCAGUu4YLf4e64tPgudKZ1Z8z/U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dw9jQNFj0NTljCvz8IgCtQFjOiAlzmnG9BXgO1FIZfIf2vVYyjMX9NFlgaWF9c8tHxrp6S4EbsQI7KFJyCLXWYVHYc4sgGm9oJfjiEIxGPeypiu8kKaDjmtp+/V9j91/Q3Ixs5dCLe4hKs6ri5HYenT3DEVR/vL+F6V8W51n1m8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=mWwDXKPe; arc=none smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="mWwDXKPe"
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-467abce2ef9so551891cf.0
        for <linux-doc@vger.kernel.org>; Wed, 15 Jan 2025 07:14:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736954056; x=1737558856; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zwgbsMFckqvGB3RSi7xaGSyNzRvElK3RoYAL3sQfulw=;
        b=mWwDXKPe5bc6z0uGX/9wYTuBIRt7Qh46leuY/vdPCNlyrHhBURDVxP3o0mkMBKdlKE
         mKPfvMN5C3fRfSgu6xVWqN4eyg2EQonDrz5QolwiX0BOzKmn+hIL7sCa1RrlmN4V2k6h
         O0HRKfIsEUWrqf/aHaAjWyxt5CoGzGyYih8AJ89T4Hm/Xu0VM7vwlZo6etL26kswMNOL
         jZHSalmatBu2GP84WTXUUdlVlnLYNaB2HnIZCPlGDJBaxR/H3amgeQwVTOZ4zBsF7Lci
         eWrQ3lfqUh+UIRfnmTxPbzdrxZy88NDynsY3xMD6TaQRjPTOwSOHAanctbzkt0S1YbyI
         974w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736954056; x=1737558856;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zwgbsMFckqvGB3RSi7xaGSyNzRvElK3RoYAL3sQfulw=;
        b=SM4Rypm0r4JsBcIL883Fho2bQ8nLpeHfN7JiNZx4/u0S5G7+qfc9As1n9MPbGNtpCi
         E2p7vd6YXl7VtIAbN1Epux1Mxp8YXH6nljn6bSC/tG7eIgwDYJaxrFJUa6ppZTwFs/y1
         Ea7CtzgCaA4iuyvnNdy7lQlpFZI8VzsulFAod2h4qSTv/VSkxGON0CIF2cToKtlsEkI+
         OtZO0Bg12aYKydtKFLZdAXQIiWuzZ0qZjas4JlnhCeN8pUqqRHe2SXp0LFeud6RU2Q0Q
         eVZGLFKPqX66I9hKBex6N6b4iqkwvPsvTA7dhJ94ofYIRAmxiXNvgjslL/iBvJJnscOe
         Ahgg==
X-Forwarded-Encrypted: i=1; AJvYcCVTSwmBy8Yc8zh3YBW38UOJu6AaaMjLISly7vsYCfrgg7ziYr3pUDH/zHk0puYUffPwt9DY0N9tuZs=@vger.kernel.org
X-Gm-Message-State: AOJu0YwZwW8zhWw6LkYTZmVtPQA/HqfS021wc4700voiUDTXKuWepzAa
	rUgKZYyosjm+1g/O6N3Ym/DnxEcwlrFv3rgI2XHpLfOVXYqrAcqFeqn1SvpW/IwBzo2LOk5e/+I
	KSsw4TF/w5UiISmm3JhSaKlaA3/8zSK1cGKaq
X-Gm-Gg: ASbGncs/ArpQwbw3I3CUNS94rOkzelztRdigp5qFQbSyfO+2kg1ZijeD7THWR91Hvbh
	7jzCEk3MciD+y0KAEaytbvYRRXi/PEarmaSc4Yw==
X-Google-Smtp-Source: AGHT+IFBSyrZH6oH2V8sSJ8g3vWD0Xzt9EA1FlosWujE9GKZW3/jjLsBoULYSb8IJOdDM/4YQoilY629BSEWDbaXB1E=
X-Received: by 2002:ac8:590b:0:b0:46c:9f17:12f6 with SMTP id
 d75a77b69052e-46df70108bcmr3230121cf.27.1736954055812; Wed, 15 Jan 2025
 07:14:15 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250111042604.3230628-1-surenb@google.com> <f5e26a57-ec77-4df8-8b4f-5a718a046894@lucifer.local>
 <20250113174941.8c6d5defe18c8b1a7e477ace@linux-foundation.org>
 <CAJuCfpE0Kdd8EnsjOJ0WW8QcDYbWji3S_LEu+=J9aTVioFMQ+w@mail.gmail.com>
 <20250113200908.d821636a39e9ca6130a90e24@linux-foundation.org>
 <ajefxu3ed4oz2uomvmc7u4fj4zj2x2lvzmec7okif6stjptc6l@i6wmo4wuwgh3>
 <CAJuCfpHGJ9RR0tJyrLzLZEf9r=CQidoi9xJEAyHYs4Kx=1JxXw@mail.gmail.com> <f954fbec-2cec-448b-bba6-5c36c80c137a@lucifer.local>
In-Reply-To: <f954fbec-2cec-448b-bba6-5c36c80c137a@lucifer.local>
From: Suren Baghdasaryan <surenb@google.com>
Date: Wed, 15 Jan 2025 07:14:04 -0800
X-Gm-Features: AbW1kvahTytgn6M-KDT9HLtFEEQh-_QLeCzYhPsDAwNf1510Y1g47IjxkM1hWqg
Message-ID: <CAJuCfpFWob8-+RXujY3eus3SM-OYVsHdhHFmt1r++D_TnXZ5Zw@mail.gmail.com>
Subject: Re: [PATCH v9 00/17] reimplement per-vma lock as a refcount
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>, Andrew Morton <akpm@linux-foundation.org>, 
	peterz@infradead.org, willy@infradead.org, david.laight.linux@gmail.com, 
	mhocko@suse.com, vbabka@suse.cz, hannes@cmpxchg.org, mjguzik@gmail.com, 
	oliver.sang@intel.com, mgorman@techsingularity.net, david@redhat.com, 
	peterx@redhat.com, oleg@redhat.com, dave@stgolabs.net, paulmck@kernel.org, 
	brauner@kernel.org, dhowells@redhat.com, hdanton@sina.com, hughd@google.com, 
	lokeshgidra@google.com, minchan@google.com, jannh@google.com, 
	shakeel.butt@linux.dev, souravpanda@google.com, pasha.tatashin@soleen.com, 
	klarasmodin@gmail.com, richard.weiyang@gmail.com, corbet@lwn.net, 
	linux-doc@vger.kernel.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 15, 2025 at 3:34=E2=80=AFAM Lorenzo Stoakes
<lorenzo.stoakes@oracle.com> wrote:
>
> On Tue, Jan 14, 2025 at 07:54:48AM -0800, Suren Baghdasaryan wrote:
> > On Tue, Jan 14, 2025 at 6:59=E2=80=AFAM 'Liam R. Howlett' via kernel-te=
am
> > <kernel-team@android.com> wrote:
> > >
> > > * Andrew Morton <akpm@linux-foundation.org> [250113 23:09]:
> > > > On Mon, 13 Jan 2025 18:53:11 -0800 Suren Baghdasaryan <surenb@googl=
e.com> wrote:
> > > >
> > > > > On Mon, Jan 13, 2025 at 5:49=E2=80=AFPM Andrew Morton <akpm@linux=
-foundation.org> wrote:
> > > > > >
> > > > > >
> > > > > > Yes, we're at -rc7 and this series is rather in panic mode and =
it seems
> > > > > > unnecessarily risky so I'm inclined to set it aside for this cy=
cle.
> > > > > >
> > > > > > If the series is considered super desirable and if people are c=
onfident
> > > > > > that we can address any remaining glitches during two months of=
 -rc
> > > > > > then sure, we could push the envelope a bit.  But I don't belie=
ve this
> > > > > > is the case so I'm thinking let's give ourselves another cycle =
to get
> > > > > > this all sorted out?
> > > > >
> > > > > I didn't think this series was in panic mode with one real issue =
that
> > > > > is not hard to address (memory ordering in
> > > > > __refcount_inc_not_zero_limited()) but I'm obviously biased and m=
ight
> > > > > be missing the big picture. In any case, if it makes people nervo=
us I
> > > > > have no objections to your plan.
> > > >
> > > > Well, I'm soliciting opinions here.  What do others think?
> > > >
> > > > And do you see much urgency with these changes?
> > > >
> > >
> > > I think it's in good shape, but more time for this change is probably
> > > the right approach.
> > >
> > > I don't think it's had enough testing time with the changes since v7.
> > > The series has had significant changes, with the side effect of
> > > invalidating some of the test time.
> > >
> > > I really like what it does, but if Suren doesn't need it upstream for
> > > some reason then I'd say we leave it to soak longer.
> > >
> > > If he does need it upstream, we can deal with any fallout and fixes -=
 it
> > > will have minimum long term effects as it's not an LTS.
> >
> > Thanks for voicing your opinion, folks! There is no real urgency and
> > no objections from me to wait until the next cycle.
> > I'll be posting v10 shortly purely for reviews while this is fresh on
> > people's mind, and with the understanding that it won't be picked up
> > by Andrew.
> > Thanks,
> > Suren.
>
> (From my side :) Thanks, and definitely no reflection on quality and your
> responsiveness has been amazing, just a reflection of the complexity of
> this change.

No worries, I understand and accept the reasoning.
And thanks for sugar coating the pill, it made it easier to swallow :)

>
> >
> > >
> > > Thanks,
> > > Liam
> > >
> > > To unsubscribe from this group and stop receiving emails from it, sen=
d an email to kernel-team+unsubscribe@android.com.
> > >
