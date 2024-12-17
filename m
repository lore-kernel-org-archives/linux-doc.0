Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5065B13D891
	for <linux-doc@vger.kernel.org>; Tue, 17 Dec 2024 18:49:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734461357; cv=none; b=bYIdbkIRrmHH1BMT7E2fujhgszYuXrzrbp53aGx3WFqLoEWm5bvnNe90AbiPxidaN4QPfQWy1sU2leTSMq4bn8JuuxvgFaLLTMwh5d3A3j5PmEM4yK7MnQgwKoS1a5UzjmaucDQByn8pt1lbqdA+nDB/LMFKTBsIyi7pGFcIwRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734461357; c=relaxed/simple;
	bh=gECHGDLfmlLFxfHSrS7Vrb8smZ7Grw8PZn2db5us/TQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YwmFVPwsao51sFD1uJFsMwySQKdXjo4HpGg58G2+zzxB4vRjHiT6y4aL6FTDJ5VaSF8QisXJUQyvod7ntkQDubbNGnU2KeZzU6GaDbneR7qr2NAKswVBe+2E2Q0Ly9VOTtvW/uSINmOt1baDqN398SAydglzIyRPEbe6+VSGRUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ZvP/Eebs; arc=none smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ZvP/Eebs"
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-467abce2ef9so26341cf.0
        for <linux-doc@vger.kernel.org>; Tue, 17 Dec 2024 10:49:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734461355; x=1735066155; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bYDU7PRkfogGx5ejuFzE77B1xu7cZtt+iKdyoItbELU=;
        b=ZvP/EebsLDKmDFi/5NYF7bPUkTwdyfzFBBBPd3aUoQ+IgwpHHMHlhPu1Xx75zpPUTV
         aEAn+sFfHG6l5IdUvRac5mchob+ohkW3LXCNfkTuII7apRf7jiuggVuVyef1lWaxcOiq
         bbK9TyjZjONSd1dq0KOCGTsBewZRUW6djnTOq6rO+BFWd6+y4mVlZLdLoO5Vt3SInMPN
         QwgKZVXzO8pC8ok9E51wahz9OlGUfNTcnyWwKybgjpJXGk3O6jiwREcYe2a9bTXnI832
         9H3h670xWvEECey7+Yl6yURnF4T5DOC5UWxfJSup3ku5+yfDRdDmFSnijNAUTyIibU7t
         DDug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734461355; x=1735066155;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bYDU7PRkfogGx5ejuFzE77B1xu7cZtt+iKdyoItbELU=;
        b=NYUQCSR3GwHEm5gNxEne42ONmc1MLKnEWnySabDalNlv6J/uJNYpZcUcXI7vKyTYq+
         HVwWk/7CZagAJ5LzjWDSIEZUya+ZhVwGLp9QC6HyG/dhSgsMatZrGg2VE3+fhSYXVEVB
         dLUVE5YbyFJHuNWYmQZ/H/0p9SjhN+GEQJV5P8q8NosWvzVi9KWdmwrjRlmskme0uql7
         YfqAe8fHe8WEfgO1POtYYbHNhLpFTJWP2w/UF3Rt0PS6Te6inzEEJyXfHZ8OSyuh314+
         6BYbfs91Gg63SYMjMLh6kyCD0axHAc5rb2c0zHhfgi4XkPmjV1ZqfhqCpuEsteXrQpt8
         S7dg==
X-Forwarded-Encrypted: i=1; AJvYcCWzByoAPb5gTDpTtveW2UcFuJCsRBjfNBBxw4mFCpM/iwTsVO7E3nbEjLNYEvHmmSjC8qo7bEhSDOo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwySwPJVqcHw/RQBD56i2VyiOvA4qvNQz3GKkPO9c/nNe5yN1/7
	PLxj2lYrIJyUiXqHs50DKIN7ij5lLMvsqtlIbiiG4ueuAeV5jAMvlPC0tYDQh2B2p6AG1Il7HLz
	0fTsykuYoZJlat+5UG+hLEzdYKNKsmJb+3wl1
X-Gm-Gg: ASbGncuEs6/anGtezwnc1CXS4uCuRZcaQh9jOdMj6aWJlcWEnuRi+zO2ULefTq9fCNn
	zkXaRS6CyQ6XBHe984KWAiHdoP6s73029pQCNYVQhO70pX1mBVFkxbSNn4R8d4CxqD/+w
X-Google-Smtp-Source: AGHT+IHhoaVUwQriIDrG+/nQrc5mfXTcjuZa/bAfk12lhZxf4kuyi2fU1Br0CJni6OGQIi809n/wf3XVbe+mIK2WnAg=
X-Received: by 2002:a05:622a:347:b0:466:91fd:74c0 with SMTP id
 d75a77b69052e-469085ac13fmr130791cf.0.1734461354934; Tue, 17 Dec 2024
 10:49:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241216192419.2970941-1-surenb@google.com> <CAJuCfpHL33E_=hHmM-4sgcG892j3NS+J69RWHJNmJs-N16y4Lg@mail.gmail.com>
 <20241217104218.7ed493c6647cea5c5c0a73c6@linux-foundation.org>
In-Reply-To: <20241217104218.7ed493c6647cea5c5c0a73c6@linux-foundation.org>
From: Suren Baghdasaryan <surenb@google.com>
Date: Tue, 17 Dec 2024 10:49:02 -0800
Message-ID: <CAJuCfpF+Gi25-JpL8dav-Uw3Lx9iVA8BDH2ZJr3OtZcVP1FS=Q@mail.gmail.com>
Subject: Re: [PATCH v6 00/16] move per-vma lock into vm_area_struct
To: Andrew Morton <akpm@linux-foundation.org>
Cc: peterz@infradead.org, willy@infradead.org, liam.howlett@oracle.com, 
	lorenzo.stoakes@oracle.com, mhocko@suse.com, vbabka@suse.cz, 
	hannes@cmpxchg.org, mjguzik@gmail.com, oliver.sang@intel.com, 
	mgorman@techsingularity.net, david@redhat.com, peterx@redhat.com, 
	oleg@redhat.com, dave@stgolabs.net, paulmck@kernel.org, brauner@kernel.org, 
	dhowells@redhat.com, hdanton@sina.com, hughd@google.com, 
	lokeshgidra@google.com, minchan@google.com, jannh@google.com, 
	shakeel.butt@linux.dev, souravpanda@google.com, pasha.tatashin@soleen.com, 
	klarasmodin@gmail.com, corbet@lwn.net, linux-doc@vger.kernel.org, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 17, 2024 at 10:42=E2=80=AFAM Andrew Morton
<akpm@linux-foundation.org> wrote:
>
> On Mon, 16 Dec 2024 11:39:16 -0800 Suren Baghdasaryan <surenb@google.com>=
 wrote:
>
> > > Patchset applies over mm-unstable after reverting v5 of this patchset=
 [4]
> > > (currently 687e99a5faa5-905ab222508a)
> >
> > ^^^
> > Please be aware of this if trying to apply to a branch. mm-unstable
> > contains an older version of this patchset which needs to be reverted
> > before this one can be applied.
>
> I quietly updated mm-unstable to v6.  I understand that a v7 is expected.

Thanks! Yes, I'll post v7 once our discussion with Peter on
refcounting is concluded.

Could you please fixup the issue that Lokesh found in
https://lore.kernel.org/all/20241216192419.2970941-7-surenb@google.com/
?
Instead of

+                if (!vma_start_read_locked(*dst_vmap)) {

it should be:

+                if (vma_start_read_locked(*dst_vmap)) {

That's the only critical issue found in v6 so far.
Thanks!
