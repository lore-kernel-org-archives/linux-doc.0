Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 594891F2C48
	for <linux-doc@vger.kernel.org>; Tue,  7 Jan 2025 17:45:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736271918; cv=none; b=FrkEiSfh+6ZXfcqhkP66ZBczdvyiPHoDYGjMIKSu9+LN7+Wi6vzgl+DFyiS6Yi/xhL5UZCtxB11W70i9ofMb3uFayGJ2fU2uIACe/TWrhXzJGImqcJD95vl6RpWoC6g1FNePGqWGW3V+Z6/ll/JXLUDqDcNmo755BdvHXTet5yo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736271918; c=relaxed/simple;
	bh=t6cBFuR5oYoX4d5dgaMvJGN8Rih10TOs/E3wVaiFQAQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Q5vEZmjlMcsf0+I6pe795ZINOzipLxK5PLqyrvprZBqrytVUWTtJoPJXldScBXDgLjxjQG3KEsKBZjTsbaUsz6lgIAMa0KYwn7X+65GY3VrbfzWApZ03PwPOZaAMunrOFqK2A3ljgIFkoCb0p4BlXOpNkfcO2530P91T1ZRG0Q8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=HYHn08r5; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="HYHn08r5"
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-467abce2ef9so5871cf.0
        for <linux-doc@vger.kernel.org>; Tue, 07 Jan 2025 09:45:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736271914; x=1736876714; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZV93VUPech+aDp5P+R82vpWYr/ENu1LDnDURQ32K4jA=;
        b=HYHn08r51gLjj+1UjQdQ+jtam27cUQJGglmUrcilPrnvD1lM2I8wafhxjftbERXKO8
         JTkRWAbbP229nr+fKB/xxV0UT+1KvgU9hLLlJOSfLvv02MeBGzSScT2nLhE4hP28PFVQ
         og4R+FIhodcRZZxozQ1o0td4QO8vgIH4q285R+v3diaYAjPaO7xsX6dxAmvnkYinq64Q
         LU0aOBItmk8faJe1fZkTMdYXyWXlpJ/LTBYBv01kFJsdiVVSxZ9bJmWREKQcnSsfFnR9
         ddin40eucKRNnhpkvNwOLrlsiVf7rPsikp62cUdoJ81isUKNXgO0d6R+3UIiZuy5F2MW
         q5FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736271914; x=1736876714;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZV93VUPech+aDp5P+R82vpWYr/ENu1LDnDURQ32K4jA=;
        b=G3i1yQ3xFReSEtQiY8YOq0aX/ybhByrbTr6om40YZPix7/GPw0MwVbcuxDCk7JeTQD
         G0AAoiefHS/PT6xkyn1NTjQt21LAiX2+lnYwJcKrptv+/Q0mNCs5aZz+eRTgKyQB08yI
         Hfp/ojl0KwV8wZGIrIVcTraN/HhAY1s1jt/ZzjriDodGhXQlMvFQeFG6oLiUUAXEEWwl
         NgQuF8U1M+EGarYGv2SBSMsUc1EhtpmgTkxY3Rpy00NqTsbuZ2pgV8/12e4YR3cD1FjA
         wEcCxBdcGfKeU9kSH+KxNVu4CraknNp60Insuz8vkspsetCnf5zrROVpft3bZ1fpDnSj
         LkPQ==
X-Forwarded-Encrypted: i=1; AJvYcCUUixVETs6lyeXRg6Zkye/N6zqcMgrRKDFiGThJeNrcPOqMqAE5hXo85SxxVFjakIRgBdtM99t4CFg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwqVqnXutWB5Oq62+IouYqiSNZVK7lbRBymxr5dHR9zbJrxRtJK
	/MQOLWY9jB0SAUGMYuZIaio14Fm1DyjkDI1vmsq3WFe2OF7o/mJtOyYmvNTrrsVSrL+fIf61drU
	jJXKLMmPboL45s9KiyM7TUghkYkbxVndyA6Jv
X-Gm-Gg: ASbGncssf/5ewaJ8w7xawSgKkZhCfzXGCuOTbVmB53F10I7Jf1vGCllTkNCnUtjcTEc
	iWUscmR9xpDU4zDkFM087HPUrmH3gs4s/q+Qh5taDIqMZGGpABkeqLrBCZNpapfz83RVh
X-Google-Smtp-Source: AGHT+IHZ0PRyj47AFsXc/kz4t2BngIa9FU0t+YkwrwaQn5xBWFIIbMvTtR0HUFbSrOy1CDU0Zieeox9P6tZ4O6GwIcU=
X-Received: by 2002:a05:622a:608:b0:466:8c23:823a with SMTP id
 d75a77b69052e-46b3c814b88mr3906951cf.17.1736271913933; Tue, 07 Jan 2025
 09:45:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241226170710.1159679-1-surenb@google.com> <20241226170710.1159679-11-surenb@google.com>
 <0d36fd53-b817-4bbd-ae38-af094bd301df@suse.cz>
In-Reply-To: <0d36fd53-b817-4bbd-ae38-af094bd301df@suse.cz>
From: Suren Baghdasaryan <surenb@google.com>
Date: Tue, 7 Jan 2025 09:45:03 -0800
X-Gm-Features: AbW1kvbQ5eB81Czg-BskCYXstYQRXiuXVcnQhjZ4clU2cXzdV3Y2_y24itu1HbI
Message-ID: <CAJuCfpH63RQiSoxyXTjrU7Fe1VyKsFrK+KqQdRCXFSf01DqO1g@mail.gmail.com>
Subject: Re: [PATCH v7 10/17] mm: uninline the main body of vma_start_write()
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

On Tue, Jan 7, 2025 at 9:35=E2=80=AFAM Vlastimil Babka <vbabka@suse.cz> wro=
te:
>
> On 12/26/24 18:07, Suren Baghdasaryan wrote:
> > vma_start_write() is used in many places and will grow in size very soo=
n.
> > It is not used in performance critical paths and uninlining it should
> > limit the future code size growth.
> > No functional changes.
> >
> > Signed-off-by: Suren Baghdasaryan <surenb@google.com>
>
> Reviewed-by: Vlastimil Babka <vbabka@suse.cz>
>
> > --- a/mm/memory.c
> > +++ b/mm/memory.c
> > @@ -6328,6 +6328,20 @@ struct vm_area_struct *lock_mm_and_find_vma(stru=
ct mm_struct *mm,
> >  #endif
> >
> >  #ifdef CONFIG_PER_VMA_LOCK
> > +void __vma_start_write(struct vm_area_struct *vma, unsigned int mm_loc=
k_seq)
> > +{
> > +     down_write(&vma->vm_lock.lock);
> > +     /*
> > +      * We should use WRITE_ONCE() here because we can have concurrent=
 reads
> > +      * from the early lockless pessimistic check in vma_start_read().
> > +      * We don't really care about the correctness of that early check=
, but
> > +      * we should use WRITE_ONCE() for cleanliness and to keep KCSAN h=
appy.
> > +      */
> > +     WRITE_ONCE(vma->vm_lock_seq, mm_lock_seq);
> > +     up_write(&vma->vm_lock.lock);
> > +}
> > +EXPORT_SYMBOL_GPL(__vma_start_write);
>
> Do any modules need it? If not we shouldn't export.

I'm pretty sure I added it because of the allmodconfig build failure
but let me rerun it and see which module was using it.

>
> >  /*
> >   * Lookup and lock a VMA under RCU protection. Returned VMA is guarant=
eed to be
> >   * stable and not isolated. If the VMA is not found or is being modifi=
ed the
>
