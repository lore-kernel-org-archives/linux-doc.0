Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BD561F4737
	for <linux-doc@vger.kernel.org>; Tue,  7 Jan 2025 17:14:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736270046; cv=none; b=n2T+1luA70K5et+cLrpXhF9EARVl0iYxJY0vt6tD6RqWthrCWy+r7h/XAGVvoJyApF0yo3JSxn/PpqYHGtPQ1U59qgV+fRiBbCauH2uD/Fu7xL7fqtuvjjn5W2LmBkUdxLOwyJXcwnODfBYPYbY8pJD1zZ9pNuy6sipJkYf+Ay8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736270046; c=relaxed/simple;
	bh=MIRF8bJXB/wI9+9f+RHDB/6OqJYuFmLTDZv3NkPzKgU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gprY+8+/R20aog5bEJyekiT9SpgkbwaXQxYEn9VjgaaaTfJc3t125o1DU0wYzkgLFhnjTBZ4fN1PfeW0tjyy77oKY6BeK3wl2Zy3Hmw4rCz3xIT6Gjz7FRgy7nx8RAcamMKsgXEdcA7sC7+XXhyZobwcL30AKm4XnQEmWRmpZD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=XAbAJne9; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="XAbAJne9"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-4678c9310afso256211cf.1
        for <linux-doc@vger.kernel.org>; Tue, 07 Jan 2025 09:14:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736270042; x=1736874842; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yQAOTrU4VpoJco4k8RE54/hb5Tu2/1vtaB9nhBxcNBQ=;
        b=XAbAJne9vQqJ4nWD1mInIG/JqKbDYp4HNPhJglaRNaW+fCcDV8U3SOeHcS8cPmOm4n
         gh1VBnXgNeun7UGn52ffXVYHvCKtZmUkOo0QqyxiNtGwXoa0Mdz5Yt1DbH+57Yie+08J
         k5l/U/lFDG65fjxQyYn9U2IrcfZ18nbbnTtt6PZss/CJIK0w9En3XVy07tz4Ig4ByeeI
         xZs+H50sJKcGItdvdK+roYz1BBtiZ6SaZc77uJuWd0Wkw+Uh8+wYdPVRtj+0H4erX2EK
         ifDltGqMqDvNLp3pqDDmdhinhSqa94Fs/SWbC6x0sGBvvj1FR6uOzMnCQcCZaCKFyrQl
         WGWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736270042; x=1736874842;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yQAOTrU4VpoJco4k8RE54/hb5Tu2/1vtaB9nhBxcNBQ=;
        b=qDCNdgfKfaIlwEOf8lk6+Lhgw2C6MZ9i8nne+UCp4GsdzqKrRQLgBHDvZszTuqJTX9
         OKbZkezBmJGDy26HdEnWm7OPl01ep6ZWZ+HXFB2FKTGnOb+ZI70VlA9bqp0mGwvViEd4
         JAwx6zxVNWLSFWji+j0khePsdzlaIlTWQZvfjfkP8irV+ouQlCl/Wu2A2tLgmsi6zhd1
         sSqrdEbFlRvD7H7eX6uKquhjN0fXBA4++aPjw1NL61tn6UMoLPscEhS/9R8ab1piiG2O
         ss3JViYMKCVAYvYlvFm5S2cIWu/6mDh2gM+XiisF6jPb9dzVlXUDd0Jv7E4EV25zOhkO
         CXJg==
X-Forwarded-Encrypted: i=1; AJvYcCXiuyixS/ZAP9z2/xCi7Hx5wFkKQVM8fSmypE3aZDOWG4gglmQbggyu+vpiyG3mYC6F+VOmpHhqKeg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyNci7vhQUfsympHtH6qmh7NXzh3lzxcJow9HMP529i2j/r5XAu
	UwT5c5eOiWGVmIJ4tpAi8dRy4Ts7SNax5UnIM+nSPfOxhkaMZZ/8aoipr5TDFNMwmCoZx2XZEak
	4GsXDUPppLACMAQLuakXixromskwmYiqvRr7B
X-Gm-Gg: ASbGnct8CNRrX+YQcgOsxuNNItnD9hxcHeIYvE+vUspV4trzSVhw4uBnRtgMPdFA/1g
	KEhNxC7hovzycVPnYkblwHKVEHjNMlN3novFwRC7BTdggifTAM/s/vW/e3DneWatTrNwc
X-Google-Smtp-Source: AGHT+IHqKp00BEUH8wMejBp+7U2R3Ste7wgeW3qNXS/trd4DacSk0s31gBWUyGKguqjnKqLZ6TbVFVuXstE7swYZeTM=
X-Received: by 2002:a05:622a:413:b0:467:7c30:3446 with SMTP id
 d75a77b69052e-46b3c829c93mr3776531cf.25.1736270041673; Tue, 07 Jan 2025
 09:14:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241226170710.1159679-1-surenb@google.com> <20241226170710.1159679-6-surenb@google.com>
 <08a0d865-991b-48d1-adcc-f9184d708ff1@suse.cz>
In-Reply-To: <08a0d865-991b-48d1-adcc-f9184d708ff1@suse.cz>
From: Suren Baghdasaryan <surenb@google.com>
Date: Tue, 7 Jan 2025 09:13:49 -0800
X-Gm-Features: AbW1kvZj_yj1fsEGq_JzLlHHxGmKe4UXSUML8jbgll8VawTN1JL0_8tQzOg1esg
Message-ID: <CAJuCfpG+fcdEi0s9jN6L1eiymSnY_XXzeazDq7RXN7JUU3f_Pg@mail.gmail.com>
Subject: Re: [PATCH v7 05/17] mm: mark vmas detached upon exit
To: Vlastimil Babka <vbabka@suse.cz>
Cc: akpm@linux-foundation.org, peterz@infradead.org, willy@infradead.org, 
	liam.howlett@oracle.com, lorenzo.stoakes@oracle.com, mhocko@suse.com, 
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

On Tue, Jan 7, 2025 at 9:08=E2=80=AFAM Vlastimil Babka <vbabka@suse.cz> wro=
te:
>
> On 12/26/24 18:06, Suren Baghdasaryan wrote:
> > When exit_mmap() removes vmas belonging to an exiting task, it does not
> > mark them as detached since they can't be reached by other tasks and th=
ey
> > will be freed shortly. Once we introduce vma reuse, all vmas will have =
to
> > be in detached state before they are freed to ensure vma when reused is
> > in a consistent state. Add missing vma_mark_detached() before freeing t=
he
> > vma.
> >
> > Signed-off-by: Suren Baghdasaryan <surenb@google.com>
>
> Reviewed-by: Vlastimil Babka <vbabka@suse.cz>
>
> > ---
> >  mm/vma.c | 5 +++--
> >  1 file changed, 3 insertions(+), 2 deletions(-)
> >
> > diff --git a/mm/vma.c b/mm/vma.c
> > index ce113dd8c471..4a3deb6f9662 100644
> > --- a/mm/vma.c
> > +++ b/mm/vma.c
> > @@ -413,9 +413,10 @@ void remove_vma(struct vm_area_struct *vma, bool u=
nreachable)
> >       if (vma->vm_file)
> >               fput(vma->vm_file);
> >       mpol_put(vma_policy(vma));
> > -     if (unreachable)
> > +     if (unreachable) {
> > +             vma_mark_detached(vma);
> >               __vm_area_free(vma);
> > -     else
> > +     } else
> >               vm_area_free(vma);
>
> Nit: per style this should be { } too now.

Thanks. Will fix it in the next version since I have to respin the
series anyway.

>
> >  }
> >
>
