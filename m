Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF96A211A05
	for <linux-doc@vger.kernel.org>; Fri, 10 Jan 2025 16:08:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736525319; cv=none; b=oDUnzEipwEEhgCVeEHjXTEigtprxsss32/kFXDfduibVYGA1ZNEj0olmjJKoafvWQTJFVHORVSO+kEXSMDMMDMzBeqKvf3bWQLyEpIOy3ZTDcfKO2pIOZXig4i7lRiAhu1ihtP85WwUK38MMuXWLQEowgKs4oK+f9WYLncGMxf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736525319; c=relaxed/simple;
	bh=eQdKZjRxeeydam05FMMTDoKcgoiA9rwBSCpvxVwWxe8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MJ/BACOadKzdX0sffPSUrZMuuKB64w1Lkc7W8jzIQtFMS3ijDXlvIMqUSR3HcOFUGocTcI5xSEIPINC4HBPKkjx7b/RtOHbBlSpq0dukfLMfDIiijaJUgEj3rgsHhtkNjgYha20Q5getqvaoWOUHjt7cY04w6qkGA6iSzzGwp7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Ra7uroeM; arc=none smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Ra7uroeM"
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-467896541e1so283001cf.0
        for <linux-doc@vger.kernel.org>; Fri, 10 Jan 2025 08:08:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736525317; x=1737130117; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eQdKZjRxeeydam05FMMTDoKcgoiA9rwBSCpvxVwWxe8=;
        b=Ra7uroeM5Y53hoa7ZHCxJ7fWBT91OqRfv0K14IEj30c8BCnW/BnWRfNZvcrucwXf14
         KBey1imxK4s2TiUeBoQmBD6n+YjpnAtXSYe53Stsk30JcTNHdQzrCevp9JCyRJD1gvzX
         L2b5wnsTe3H020cop+eHOI2qXAqo296fWbP5z28GtUurFx0yOh3wV+o3oPGdO+hTLKos
         vBPP41K5SN2hCWSaT/Q+paBYZj7TFMflzgBesTm5hfLtTWAJ2UHc92yLatUY4GWHKzb5
         fqMuZfIPOvrgAZwK2cVX8gr8EvdqUB96QM/+EC76dNHbZ5VCWSu6698avEWD+z+Xg1tM
         J6Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736525317; x=1737130117;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eQdKZjRxeeydam05FMMTDoKcgoiA9rwBSCpvxVwWxe8=;
        b=UfaRiXS/CfOe4tHiqPm3oT7Fikp16CZsGWQwar6NGrXdc0u+G1n02vxHtlxMq9qu6k
         eolMiPLkPfmr8TpHLIpK9X49DnY3ONm2ou5p78fIydCwYG1ax2/v+gfyHziAy8M839aM
         qFRj7hseq56a0Sp0wzs6Ld0AlpMxkw/OGvgoFCKWho3jV0/HFnc1QlGrn+epkY9p4LPW
         89oWAMlIHdLZ1ZUKtuTC6T0rwGgTwvyxyTcxDsZC3628QHRtjtrlcl7D/kUmGx4WS/Tf
         0Q2P6MeK2zIsVqSDJOoycuMsN/dNBJjidJfKI0nz8hChQZdDmFoeyD/HxQxZ7LlRp+F7
         YkuA==
X-Forwarded-Encrypted: i=1; AJvYcCUa0mZrsTGR3DkB3sPrW8iXWmgAqLRRA64sVllSwP5EEizY0BjdPWM+igBHbx3mv4XDsTWJ/J0etlk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwGkCqFn0o3Lzh3fybsz8QAgb1BJlY+DEGiK2AuGIw0QsgcBH/s
	reubTg+NDZVp/9P5njjgjUd38DNVfb/OiqDO2RP2ZURTSYz+gcojAYf4ZCx22YwWSJ7TRl/StR4
	H8kmkgmL0RJD0+YedF+la+1pzyRsatnCXF8nU
X-Gm-Gg: ASbGnctMz2Efx47PAzcjFJF86KHdFiHI554o6kSd8ctlNbsq7p65ez7ckijyVZz8hZm
	rxZe0RVD1Dw52DUZVOlNRi681oy0oxmjTjdr6wQ==
X-Google-Smtp-Source: AGHT+IGiEnegCes1VOKgTzv3fYf1w1YMWN1N5jLmOhLl+H0+epGB3/C8YqB/esdrW+qcXlYZjNShopYqHsG6eKOAMOc=
X-Received: by 2002:ac8:5755:0:b0:466:90dd:19f3 with SMTP id
 d75a77b69052e-46c89dad79dmr2807921cf.7.1736525316551; Fri, 10 Jan 2025
 08:08:36 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250109023025.2242447-1-surenb@google.com> <52ecd3fa-5978-4f4b-b969-c42b00a5b885@suse.cz>
 <CAJuCfpExmxZFh_RB9t0+KmiJMiPOQ9priEx1xz63SCMTL=b8uw@mail.gmail.com>
 <CAJuCfpEgWOi09QPfTJTNp5mO2=SMx-svSYRmUs8XYZG131Labw@mail.gmail.com> <745d6935-3732-4639-a1d4-ead73d590597@suse.cz>
In-Reply-To: <745d6935-3732-4639-a1d4-ead73d590597@suse.cz>
From: Suren Baghdasaryan <surenb@google.com>
Date: Fri, 10 Jan 2025 08:08:25 -0800
X-Gm-Features: AbW1kvbMGxfnandwwSSoXFOuwVZJhT_NUPWmEZUi4ln9zuiNvcnTYFwE8Mgsw44
Message-ID: <CAJuCfpG7CXMqCHTqY-RAeitsGS+j1r10rJM4bSiug3i6By+b-Q@mail.gmail.com>
Subject: Re: [PATCH v8 00/16] move per-vma lock into vm_area_struct
To: Vlastimil Babka <vbabka@suse.cz>
Cc: akpm@linux-foundation.org, peterz@infradead.org, willy@infradead.org, 
	liam.howlett@oracle.com, lorenzo.stoakes@oracle.com, mhocko@suse.com, 
	hannes@cmpxchg.org, mjguzik@gmail.com, oliver.sang@intel.com, 
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

On Fri, Jan 10, 2025 at 7:35=E2=80=AFAM Vlastimil Babka <vbabka@suse.cz> wr=
ote:
>
>
>
> On 1/10/25 1:16 AM, Suren Baghdasaryan wrote:
> > On Thu, Jan 9, 2025 at 7:59=E2=80=AFAM Suren Baghdasaryan <surenb@googl=
e.com> wrote:
> >>
> >> On Thu, Jan 9, 2025 at 5:40=E2=80=AFAM Vlastimil Babka <vbabka@suse.cz=
> wrote:
> >>>
> >>> Btw the subject became rather incomplete given all the series does :)
> >>
> >> Missed this one. What do you think is worth mentioning here? It's
> >> true, the patchset does many small things but I wanted to outline the
> >> main conceptual changes. Please LMK if you think there are more
> >> changes big enough to be mentioned here.
> >
> > I just realized that your comment was only about the subject of this
> > cover letter. Maybe something like this:
> >
> > per-vma lock and vm_area_struct cache optimizations
>
> arguably the biggest change here is:
>
> reimplement per-vma lock as a refcount

Ok, I'll use that. Thanks!

>
> but yours is ok to, don't want to bikeshed
>
