Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7565553AC
	for <linux-doc@vger.kernel.org>; Tue,  7 Jan 2025 18:05:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736273136; cv=none; b=cpcz3tWbGvBaRph34JKNLqaBAuxjLdfsZ8r2XBP4rsr0e64yvu/70fMXeyqDTs0AvSJf/wt44qXPMkSCQfqIfU9YiE+TxI6ge5DDbGPaKcn30CSc1zelQCbPyvVU6u+W/1K8UcvwmnFh+FQCdSO7phbYf5da9cK+ijuiZFA+C98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736273136; c=relaxed/simple;
	bh=EImrMRjqDRIV/tFXEpfFVM1faH/hFJFcT5Jfpcu1O8g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=bmF5+c03PxkR+OtBwfpwlcRKDfbI5KQdeURZv//Qoq5UNJKfBV0p9boT1L7wUSanb+YbzlpmPI43ko3uCKDikZ52zFGfOqSfyYjDFGEAV1SS65FD/U7Sa/KxG0mieT/CzRLnqOBPumTKU+cvlSlSvXW9tETchgtPf0dSGuFAlqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=C5LERyIU; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="C5LERyIU"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-4679b5c66d0so6181cf.1
        for <linux-doc@vger.kernel.org>; Tue, 07 Jan 2025 10:05:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736273133; x=1736877933; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mi8vUyECGOxZyI2yWyC7X/khIQlYQruZTzmD5xskgiE=;
        b=C5LERyIU5d0ZZutk66vEegdq3mOAybtOKCzLsTZreoz6gD5etfoYoTsE+AEC7FPP17
         gjSNM4ts8c2JdObSZrCzOo5q1En/dgKJiqrXE7Z2bZKwp9F6MSLPckDqc8C3UQHqQFT4
         dJ9h4iC6IExPkSKPvIuLzCzeJU+r8Gc0owFve4f3fXRwcvPmSPzfePfKEGeMKcN48/GJ
         WKX2bvxw3j8tiQPwvSWqRZK+0u6q5Ct0UVKjwEicENnFSrdgMjlYaPYGZpzIm05xzUxP
         9+vZKBnhEWtKHJe55nNWe1YOdymiatcyN+00BxiB1eiZnK8vf4AV2i99PuUz0FzSYm4J
         igFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736273133; x=1736877933;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mi8vUyECGOxZyI2yWyC7X/khIQlYQruZTzmD5xskgiE=;
        b=qgNe2q9W94KyR9e+9DkF77Cxw9vGBCcQOAszccU7ZT7+0zFbpizX8Nob8yB7db1FdZ
         4PM5gANp3o+7vGEIAXxUZ7Wm5xGBUBqZ6C/VW7nCVnJAjT2DaovCXY/5gxizVlkNRMjA
         Yj2DPRAMKd653CuarZ2g8hjH+1qNuB29QS43g2lT1g7l7WUlKgpPpki1JbEhv/SQ8nSm
         2WIrPThLdo9BThrKLHUsbSXiT6cavBhKwVz5rx+c0XUHda2TTF4js1Cdw3B/2KyVp+9j
         WDAao5c3GXFPaBJatqlYc+Bs2BxiJ3KFv23/il0zrrH0NaioytcIrHT7UQg3c+4jPa+k
         iaDA==
X-Forwarded-Encrypted: i=1; AJvYcCWeuaAH7EWL9UY4EY4fvInEM531TN+BFD9qRNuVhMH7pMYKB+4vHKWbKPjc98hAGbVXhGuVKZE92zw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+qyBnReQwiasI7mwWjJZbEWjAbjN7zCjzbl1WKUXsC80rQlzY
	ohnawGudbrerTdyIaS7qp205FEajfA1BOQdnLxTlDwLNxsi91NJQt5XxV+gA91A+joTK6AzC/Uq
	uhzI8jhKrEgQc3SegNSpepoxCKORjFKB66cfX
X-Gm-Gg: ASbGnctiAxbVj1extpPNIRMCyXZXxXZdIyKR+Q6xSourn7lvUn3HsT/uucwPlOBpU3n
	V2ABuKRANB1al4cTAQfoskDTjOWuLWPazby1/dSr1Ui3taBaniLPn90HpLifTl98NdBxH
X-Google-Smtp-Source: AGHT+IE9ZiKToP85339GTZL6knFJDZBH+wPf+2gn25k4vD+HxjpROcu+RjNoaUFbdiUIvUqxGVNeySX8ejHQjchcIfI=
X-Received: by 2002:ac8:5884:0:b0:466:7926:c69 with SMTP id
 d75a77b69052e-46b3b7fcd36mr4985011cf.20.1736273133124; Tue, 07 Jan 2025
 10:05:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241226170710.1159679-1-surenb@google.com> <20241226170710.1159679-7-surenb@google.com>
 <lravkk2p3gm4x75d7ut4d4godowaguliciuixs5exlpgfzpc5o@nwtcwqyf46mq>
In-Reply-To: <lravkk2p3gm4x75d7ut4d4godowaguliciuixs5exlpgfzpc5o@nwtcwqyf46mq>
From: Suren Baghdasaryan <surenb@google.com>
Date: Tue, 7 Jan 2025 10:05:22 -0800
X-Gm-Features: AbW1kvZEgazQlT5cnwjr7aCC59gUjm4MXlBVLcsCWU968CA8pQ3U-eS0rzVVaek
Message-ID: <CAJuCfpFXuZq5YVW2fzFnnmLbpB9Gqn2M98b3Ds5LEhmB2MDzrQ@mail.gmail.com>
Subject: Re: [PATCH v7 06/17] mm/nommu: fix the last places where vma is not
 locked before being attached
To: "Liam R. Howlett" <Liam.Howlett@oracle.com>, Suren Baghdasaryan <surenb@google.com>, 
	akpm@linux-foundation.org, peterz@infradead.org, willy@infradead.org, 
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

On Tue, Jan 7, 2025 at 9:51=E2=80=AFAM Liam R. Howlett <Liam.Howlett@oracle=
.com> wrote:
>
> * Suren Baghdasaryan <surenb@google.com> [241226 12:07]:
> > nommu configuration has two places where vma gets attached to the vma t=
ree
> > without write-locking it. Add the missing locks to ensure vma is always
> > locked before it's attached.
>
> Does the delete side need to write lock as well?

Ugh. I just realized that CONFIG_PER_VMA_LOCK depends on CONFIG_MMU,
so this patch is not needed because all these per-vma functions are
NoOps when CONFIG_PER_VMA_LOCK=3Dn. I'll drop it in the next version.

>
> >
> > Signed-off-by: Suren Baghdasaryan <surenb@google.com>
> > ---
> >  mm/nommu.c | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/mm/nommu.c b/mm/nommu.c
> > index 72c8c505836c..1754e84e5758 100644
> > --- a/mm/nommu.c
> > +++ b/mm/nommu.c
> > @@ -1189,6 +1189,7 @@ unsigned long do_mmap(struct file *file,
> >               goto error_just_free;
> >
> >       setup_vma_to_mm(vma, current->mm);
> > +     vma_start_write(vma);
> >       current->mm->map_count++;
> >       /* add the VMA to the tree */
> >       vma_iter_store(&vmi, vma, true);
> > @@ -1356,6 +1357,7 @@ static int split_vma(struct vma_iterator *vmi, st=
ruct vm_area_struct *vma,
> >
> >       setup_vma_to_mm(vma, mm);
> >       setup_vma_to_mm(new, mm);
> > +     vma_start_write(new);
> >       vma_iter_store(vmi, new, true);
> >       mm->map_count++;
> >       return 0;
> > --
> > 2.47.1.613.gc27f4b7a9f-goog
> >
