Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B18224023A
	for <linux-doc@vger.kernel.org>; Mon, 13 Jan 2025 17:03:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736787784; cv=none; b=RU6QWch0C++4dWDMafV8xqeMRn0mPAvcBVCPludkPORo8HP8wZ0miz7eEp/qAMnlRWzXCktzYh2d3McPiqnAkBFSDzp/+fWoOS+tDUiDtRIWpSBwqW997lA3dp5V76FiwHkx84Hboxvezf8xaz0EUUYUm7cGcsbewvI4kS8Y1PE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736787784; c=relaxed/simple;
	bh=eGog2//UMCAOh7DR1wJkgtEx5G5E0EOdW3KlVDnssUM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qu6i6etKSjm4PhyuvK6XKQO2UfLTKjSCKfmJIaio/ltku4oqf2bAlAQFs7Ki7lTh/Qnh9Qu5/OA5Dpo73lcDUNuwqYHpmcYbKsuOwH5+TmtIOh9zBMRTVQLw2Qyk2muET19DaGCvpt8p3nVso6homKqWMjnu2Wh7l2oLeWzJ/Mo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=E7XnPXrO; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="E7XnPXrO"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-467896541e1so500451cf.0
        for <linux-doc@vger.kernel.org>; Mon, 13 Jan 2025 09:03:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736787781; x=1737392581; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HBxGDkceMU12zhfBryQTAu2EO0ZBqIU54/StMx3RiBA=;
        b=E7XnPXrOIF7MWCUeJ15SYThoiJ6Vd0/mO/MXgjBFfVIydcvjmlAbYtDH1eoh69IPcw
         1HqdRuDAIWzrNHrXt/9TMQH3AoylMzLdt6GpMTqDPp+QxX2GYGKo6EMk60PGyp/9HuD5
         O6vAQraA6s6kJiSZQCCH5Ias4wpH95B7SFOJXk4WdurUtzWg3AY6UvD7KsVUs+lSp6nJ
         s5wYbwPoLPwbu0B/ISCffkJtD5G6q414mtMUI+0BhZQcsOlVJ1hYhBU2hMQV7/4SJkYB
         I4a8HQIKsyRKim8WzDm3qSIDthRl/BV33MZJLxD0QfxusiFlEuKCkus6gZhz8rCozBqD
         +F8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736787781; x=1737392581;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HBxGDkceMU12zhfBryQTAu2EO0ZBqIU54/StMx3RiBA=;
        b=b9NbjpOGT0LUlLkZYT5HF14pAJLsHREZcDFFx+AVZX9+lfVNHNAHpcETutH2q2BbF8
         xnn8TmGeMPgcGwwtLTa9N7qyanSZa3IEsLdElBLqFQVkmYDsSKCT0s4DznRY4cVsCDaE
         v5dgYNEWuTcC0XEBIbSo9w/1qZW7FMhNutAKlXo3Gbr1j17zd3+FvKDgf3+S6ScH3m8q
         6XLVxd2VVrNr4CdUSK7ulnoEwMFg6MWL4Z3kZcOd+2yStjIjpaNuuhM3WJuXK7I1kVyU
         CtAkwl8eh8dtfT+bIKX6sDJ+7dlnijiSMx/AYzGOucZUm+XYTWkMyHCN8G/fCAZ5RZzi
         8nKQ==
X-Forwarded-Encrypted: i=1; AJvYcCVnxLR6zgPbJKRFSoR5TW1xrcAxhrfOnaNj1YdiOA1SQ3pA4sFno2gPjs4KtX3q20qlEKdAmlcXNxE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxMQGkhS5uCDwhAJrjI7zw3Spha8KILGI5vUhubvxL7Mr54g55S
	NKfZ3ZYM4coXe1NLR+RGT1SHHNw6JYYUFZLKCGc6S0VcLiRVtrLagAMYICkr4S5c1K4juuaQaH3
	kQdBspVbVtAO633JQydMdlioseYVPP8AASFzE
X-Gm-Gg: ASbGncsxh9cg/pjjZsOEMKVMnqllCSJ2VIfIzursSS/7NnWdhFSQrpwV4kwBo5WAFVo
	NDKKXFBysE6CQ68+B2OWWSHVp6FR5swyZASavwg==
X-Google-Smtp-Source: AGHT+IHZUqiUW2TdTijDnYW298vWshWfjCjNGwibZ85BeH2x4uiKxeyc0KowefHIQpDbMbw+3IhjXToAVqSqDQW5sv4=
X-Received: by 2002:a05:622a:2c1:b0:460:491e:d2a2 with SMTP id
 d75a77b69052e-46c89dad5a8mr10535521cf.17.1736787781064; Mon, 13 Jan 2025
 09:03:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250111042604.3230628-1-surenb@google.com> <20250111042604.3230628-6-surenb@google.com>
 <5d46531b-570b-4f81-90f3-2fb157664f87@lucifer.local>
In-Reply-To: <5d46531b-570b-4f81-90f3-2fb157664f87@lucifer.local>
From: Suren Baghdasaryan <surenb@google.com>
Date: Mon, 13 Jan 2025 09:02:50 -0800
X-Gm-Features: AbW1kva24UmjIHnrtwbQDfckK6vVILPLXKlOEFQ433jaxF1GXtqbqRlIBqKlthI
Message-ID: <CAJuCfpGJu88XgJUJ45aSPQNfUw4UuBRtGzB4HSybiP8xzyUTPQ@mail.gmail.com>
Subject: Re: [PATCH v9 05/17] mm: mark vmas detached upon exit
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: akpm@linux-foundation.org, peterz@infradead.org, willy@infradead.org, 
	liam.howlett@oracle.com, david.laight.linux@gmail.com, mhocko@suse.com, 
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

On Mon, Jan 13, 2025 at 4:05=E2=80=AFAM Lorenzo Stoakes
<lorenzo.stoakes@oracle.com> wrote:
>
> On Fri, Jan 10, 2025 at 08:25:52PM -0800, Suren Baghdasaryan wrote:
> > When exit_mmap() removes vmas belonging to an exiting task, it does not
> > mark them as detached since they can't be reached by other tasks and th=
ey
> > will be freed shortly. Once we introduce vma reuse, all vmas will have =
to
> > be in detached state before they are freed to ensure vma when reused is
> > in a consistent state. Add missing vma_mark_detached() before freeing t=
he
> > vma.
>
> Hmm this really makes me worry that we'll see bugs from this detached
> stuff, do we make this assumption anywhere else I wonder?

This is the only place which does not currently detach the vma before
freeing it. If someone tries adding a case like that in the future,
they will be met with vma_assert_detached() inside vm_area_free().

>
> >
> > Signed-off-by: Suren Baghdasaryan <surenb@google.com>
> > Reviewed-by: Vlastimil Babka <vbabka@suse.cz>
>
> But regardless, prima facie, this looks fine, so:
>
> Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
>
> > ---
> >  mm/vma.c | 6 ++++--
> >  1 file changed, 4 insertions(+), 2 deletions(-)
> >
> > diff --git a/mm/vma.c b/mm/vma.c
> > index b9cf552e120c..93ff42ac2002 100644
> > --- a/mm/vma.c
> > +++ b/mm/vma.c
> > @@ -413,10 +413,12 @@ void remove_vma(struct vm_area_struct *vma, bool =
unreachable)
> >       if (vma->vm_file)
> >               fput(vma->vm_file);
> >       mpol_put(vma_policy(vma));
> > -     if (unreachable)
> > +     if (unreachable) {
> > +             vma_mark_detached(vma);
> >               __vm_area_free(vma);
> > -     else
> > +     } else {
> >               vm_area_free(vma);
> > +     }
> >  }
> >
> >  /*
> > --
> > 2.47.1.613.gc27f4b7a9f-goog
> >
