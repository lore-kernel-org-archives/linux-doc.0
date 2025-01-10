Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99CB0212FA7
	for <linux-doc@vger.kernel.org>; Fri, 10 Jan 2025 16:29:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736526573; cv=none; b=L/0y2tDKXWItekggvrSWZ0CcV4qFjiUB1dpd8t4s+r+LwX+heeP5LzUjDbkcNDtIk3ouZhsqUwgWErRQN0Ppj6WeysyY7FWa5oz2Yh366TiS3t0lw/r/CmlHSLUvFqjOwISc3LObVo6rM7kwa21oylKLBd5FqJLSVDSd7ZDlcSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736526573; c=relaxed/simple;
	bh=irNi3xd0pz4Meo31QA5AzVJwwJjA68ZXqKld1QRUzVk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sol3ygsI3z6m03jDR2YrY+jJghREla8QYWJgClBzCwHpX6qVOiHAJxk6M495v44bUhQPS68/tZkAhtr+h3hdCHCDL3wYn14N0+mW/dp6zFHXXMlHtK7LLpJnSawYMwHROeZFEQHxaIlzck0vfY2Cz7Xg6nTj3vI4JrwknXPJmGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=b0mL2gUZ; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="b0mL2gUZ"
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-467abce2ef9so272501cf.0
        for <linux-doc@vger.kernel.org>; Fri, 10 Jan 2025 08:29:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736526570; x=1737131370; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eu8TRaExi0UIhJwc+M0JqMAQBG0xLG2ReZQvaIF3Oho=;
        b=b0mL2gUZOop4MZx7ZEik2hH3PFlZ3uE9K1aD7nVrvVVTmd5qwW9XKlRJVcqwAEa1Z0
         nEblGGZedYtKnrJOp51s6x6+ieotQ9CFqARZPaQJQVlkKHvSsrIR53eNFtT8F5UyNLlM
         3rfSaLe5mYlubn8vU50c3/SD+sGRFC8VJfZifuYetzGMAoHdug5phI3T7B4ReKGi3cD1
         zHISGrenID8OC3e7eeErC2x2XjojPU9EyDY1BvquXEDARbb97TB/bxY/HsHewmNEBoHu
         Ec0LRTBam2ceFF6ksiUKo+eIN94LNPHKlswBKOqSWL4/zNSR29qiGKV9fuxj5W64+zHD
         FChA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736526570; x=1737131370;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eu8TRaExi0UIhJwc+M0JqMAQBG0xLG2ReZQvaIF3Oho=;
        b=oisoPBD+w80xSe9apdgtH4eEpcAL45pUjlLI3fIq0J8il1LdDWbSiith8iSDSTmvAR
         tm4ok/Qib9fHkorHkqra7A2p8VrYlmF4SXInMEoYAQ9HODKwDDlB6Vq12fM0hvnZ4pfY
         oOqfVJMnrfhuRjci26NmUL6lxylv1NRMo8qlGWptlz5Bmm9kQkVoAx4X5FxbjpQevAS0
         C/woJJSr5tlTLXSbw7ne2LWcTxcUQdUojldlRSQodrzdNs5h6U/TrxoEx2weMSi6bPSd
         6RWICEpnSx2r9z/rFkIkvoAdzEQIBvMyFSGFkv/QT85eQyAlCIFTyaARCUq7WFz4e6AN
         d9mg==
X-Forwarded-Encrypted: i=1; AJvYcCUNS9gYW6mv+ak+KBw/VE/OeKBGKaXKj0Ja6eT5HrY5OyQAWCvwkWpE8QeAnfsJ7lZcIoDJCl096rw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4M0XqQrRZ9NmyzNz+O1lOGH2gYeNuu3nUAhxMziLGPosqqAlq
	UQSbOHqCtaXoJUoLwmGhzIO7nFySD1S9VuqRKGViZAKnRwOhnNdMe1AHmYBmuHpfmrl0MjOlNOn
	JKDcCzxlQ1JEYOAWyq+yFS5y9e5gVOBMpX354
X-Gm-Gg: ASbGncsQ6oheZ4Nfw7Cp3OerFLEtNjnsGVZXq4YbDJot5Rmi2yhN5zS6mf6XPyirDBC
	CYCAl7QIwGyR3+/gSwUkER7sjawxnmHW4ifG7dg==
X-Google-Smtp-Source: AGHT+IFqQbIhVyUUTFC28OXn+dsnTQM3CNfx3yLk9snNxklRt4li4TDpR+6Ie19J7BV3gtQHsJDjlRKNHLRabTqcWNc=
X-Received: by 2002:a05:622a:148d:b0:463:6fc7:e7cb with SMTP id
 d75a77b69052e-46c89daa62fmr3027231cf.11.1736526570363; Fri, 10 Jan 2025
 08:29:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241226170710.1159679-1-surenb@google.com> <20241226170710.1159679-12-surenb@google.com>
 <275bd492-7d7c-4b9a-9fce-fbe25639cbfb@suse.cz> <Z36UafdgGTcbvaun@casper.infradead.org>
 <20250110133237.61dd14fb@pumpkin>
In-Reply-To: <20250110133237.61dd14fb@pumpkin>
From: Suren Baghdasaryan <surenb@google.com>
Date: Fri, 10 Jan 2025 08:29:19 -0800
X-Gm-Features: AbW1kvYC5ijjJnRM6yZFH01U301Y6RYr4o7F4iGn7Q_jcoCDMuHg--7AHRcIRcw
Message-ID: <CAJuCfpHB6ODCJofQs232se+=hFW8B5fKOD8ex-JWm589qa=f1Q@mail.gmail.com>
Subject: Re: [PATCH v7 11/17] refcount: introduce __refcount_{add|inc}_not_zero_limited
To: David Laight <david.laight.linux@gmail.com>
Cc: Matthew Wilcox <willy@infradead.org>, Vlastimil Babka <vbabka@suse.cz>, akpm@linux-foundation.org, 
	peterz@infradead.org, liam.howlett@oracle.com, lorenzo.stoakes@oracle.com, 
	mhocko@suse.com, hannes@cmpxchg.org, mjguzik@gmail.com, oliver.sang@intel.com, 
	mgorman@techsingularity.net, david@redhat.com, peterx@redhat.com, 
	oleg@redhat.com, dave@stgolabs.net, paulmck@kernel.org, brauner@kernel.org, 
	dhowells@redhat.com, hdanton@sina.com, hughd@google.com, 
	lokeshgidra@google.com, minchan@google.com, jannh@google.com, 
	shakeel.butt@linux.dev, souravpanda@google.com, pasha.tatashin@soleen.com, 
	klarasmodin@gmail.com, corbet@lwn.net, linux-doc@vger.kernel.org, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 10, 2025 at 5:32=E2=80=AFAM David Laight
<david.laight.linux@gmail.com> wrote:
>
> On Wed, 8 Jan 2025 15:06:17 +0000
> Matthew Wilcox <willy@infradead.org> wrote:
>
> > On Wed, Jan 08, 2025 at 10:16:04AM +0100, Vlastimil Babka wrote:
> > > >  static inline __must_check __signed_wrap
> > > > -bool __refcount_add_not_zero(int i, refcount_t *r, int *oldp)
> > > > +bool __refcount_add_not_zero_limited(int i, refcount_t *r, int *ol=
dp,
> > > > +                              int limit)
> > > >  {
> > > >   int old =3D refcount_read(r);
> > > >
> > > >   do {
> > > >           if (!old)
> > > >                   break;
> > > > +         if (limit && old + i > limit) {
> > >
> > > Should this be e.g. "old > limit - i" to avoid overflow and false neg=
ative
> > > if someone sets limit close to INT_MAX?
> >
> > Although 'i' might also be INT_MAX, whereas we know that old < limit.
> > So "i > limit - old" is the correct condition to check, IMO.
> >
> > I'd further suggest that using a limit of 0 to mean "unlimited" introdu=
ces
> > an unnecessary arithmetic operation.  Make 'limit' inclusive instead
> > of exclusive, pass INT_MAX instead of 0, and Vlastimil's suggestion,
> > and this becomes:
> >
> >               if (i > limit - old)
> >
> ...
>
> The problem with that is the compiler is unlikely to optimise it away.
> Perhaps:
>                 if (statically_true(!limit || limit =3D=3D INT_MAX))
>                         continue;
>                 if (i > limit - old) {
>                         ...


Thanks for the comment! I think it makes sense.
For the reference, the new version of this patch is here:
https://lore.kernel.org/all/20250109023025.2242447-11-surenb@google.com/
If I apply your suggestion to that version it should look like this:

+bool __refcount_add_not_zero_limited(int i, refcount_t *r, int *oldp,
+                                     int limit)
 {
        int old =3D refcount_read(r);

        do {
               if (!old)
                      break;
+
+                if (statically_true(limit =3D=3D INT_MAX))
+                        continue;
+
+                if (i > limit - old) {
+                        if (oldp)
+                                *oldp =3D old;
+                        return false;
+                }
        } while (!atomic_try_cmpxchg_relaxed(&r->refs, &old, old + i));

I'll update the patch with this and let's see if everyone agrees.

>
>         David
>
>
