Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0EE8197A6C
	for <linux-doc@vger.kernel.org>; Tue,  3 Jun 2025 18:36:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748975813; cv=none; b=PT5u6UcADwrk8npnvE056FWLk20QZFwRlCvEWCBXi5J950lfNiv/kSA5VvLa01X852eZT30PW01IV+v9Jzw63bmVPQ6u12VifFDxmAKh4T+IPYvsJZHqRA6FxOZ2/U6va5vZJVAnwABv/RWFVuqTWB+CLV5kK20x0LwppqdQ984=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748975813; c=relaxed/simple;
	bh=4LWPpsQCFsV2Ez6SwVV0Xkw9P6OqWEXrgNYorJqhk28=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=R5Zo2iVGa6MAWxVRdQ075azP8EU0XJGyGtOxwdvCPXoi7NYuPmhFv99ZH/T5l9RhIk3p8irHU1MJZnn6Do/1VH/xhZcEUaHcQZ3p17lojwogvBscWApaug42cQXCLOaUQ6pSj9hRdmk+umYoolFDNwTCqNRvpQviNzlRxvjinBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Cx398UtL; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Cx398UtL"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6000791e832so1610a12.1
        for <linux-doc@vger.kernel.org>; Tue, 03 Jun 2025 11:36:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748975810; x=1749580610; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4LWPpsQCFsV2Ez6SwVV0Xkw9P6OqWEXrgNYorJqhk28=;
        b=Cx398UtLKR6jY23N7OkTHlA/+/RI+spVVTQrPjAF7A9usS4UTphe9/1FTZNbIp+Gpb
         YHmdGCkIgiDOKAl0yRTVhEf4NJE+L3uV8IC67On4X0bpqaQ9KRwfAG9GlJCw9invMsp/
         8t5pecnQXol86y8g0uqieFpvQAUfvLpaIu+iby/7YGMp68eQARCL7CZSo9Dxmz7nRmGJ
         KXuEIh10B+4j/7lFU2+l067lOfENN3inWu9vXIwd7e04vewHkVgvJz3k3Jp/X99HD9sb
         KbQ0jIubOJKHtSd4GAMOaxHwu+1cvcCcdX1yWtBv/IU0LqU6vr+dJYDBvenBbhOymbK7
         BerA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748975810; x=1749580610;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4LWPpsQCFsV2Ez6SwVV0Xkw9P6OqWEXrgNYorJqhk28=;
        b=RPFr3c95H3srrUGRRMD7t6sAUpQFH/i+7WtirJ3NzkvBpA7ARf4Lw1h6ziU0AGhL8q
         jYHdmr5BqWMyzo4oALROgbkuHfo+P0Pk5+7zkn8CtYLXBdZ+Dhe+KaOK8MEr8Ls2oJhT
         i+HT3fSgqFa1ADJiF2ILbrrJJFFwL6p5TF9H707QMVPGiA9ColOxg0HyEwNJvHCeslrh
         nIsi7U08p3jS7A638wsyDvEbpeirvcjpiz/RqEY2uB3L+OwEUwIx+jZuQnnOhKBiUFUU
         40zYSI9ZRgGucC2JG/2MEVXho8+Dc6T/WILu6ueoPZ2dLK4lvDdKQ9M8c1t6h27WCMYL
         6c2w==
X-Forwarded-Encrypted: i=1; AJvYcCX+qq51gwEd7y3Gsxlc4ifiHI+/MDIXpXLBTg4ENIJRmO4fJxeh8aIAxr+KTE++8kkVDdIGmDLbacM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw88uipoS3cOplZ8bInMQIh6rEBRQgnL9j/vEsL9VfMnSE2TI+p
	iGD7ZTEorSgL119i+qZwOwF6890XCHqFvmQYT34IiP3nhfzreR21fDxaBjGE4xYvjvgGPPK/8c9
	IW4QVvHZY9EP+9rIJGqdlwl5f5Lp7hI2liw2idXl/
X-Gm-Gg: ASbGncthzqWncsKDstK8tRhE7tifntjJnicNYiGJ8IGlMilVPVEKLLMGrLDMB3bm5XZ
	A4kpOZbTfnhPQsOHMVLT3mbLo6aE+9DxrQQSe47ic6H23PPM/CCo4nqTPVCWFriTc89MrNjuUBg
	z6RrrPLZOqcPduvWZ6V6TjYZea44uq1WUdTWBTCLC5U1AgLSfz8Qi0En5n8HmkvgD+vE8G89H3g
	e6DZg4c
X-Google-Smtp-Source: AGHT+IGUjNIfNKkJvJxhDkcKmt6M2XDy1Zqe3h4hEjImdinzMRBauy7k4TcXPoEfdt7FexX4FqT2gfwsrZ2hazxos5o=
X-Received: by 2002:a05:6402:174f:b0:602:3bf:ce73 with SMTP id
 4fb4d7f45d1cf-606e80b8d4amr4929a12.1.1748975809756; Tue, 03 Jun 2025 11:36:49
 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250602210710.106159-1-lorenzo.stoakes@oracle.com>
 <CAG48ez3DCwDdA1UfzonFzradrYq5VmhwLGgqMXNq6k68tr+w6Q@mail.gmail.com> <f08104bc-8ef2-4f6d-8d23-e5a087595a40@lucifer.local>
In-Reply-To: <f08104bc-8ef2-4f6d-8d23-e5a087595a40@lucifer.local>
From: Jann Horn <jannh@google.com>
Date: Tue, 3 Jun 2025 20:36:13 +0200
X-Gm-Features: AX0GCFuBBAO2PAXs-lVLk6mYc2WXvqPy4BatY5BO3b03KdmWhPbCsmTQkGQ00QY
Message-ID: <CAG48ez22QsH5NcE8+-_ofA185j1AiBFZNsaik338pjNr8kC-gw@mail.gmail.com>
Subject: Re: [PATCH] docs/mm: expand vma doc to highlight pte freeing, non-vma traversal
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Suren Baghdasaryan <surenb@google.com>, 
	"Liam R . Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Jonathan Corbet <corbet@lwn.net>, 
	Qi Zheng <zhengqi.arch@bytedance.com>, linux-mm@kvack.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 3, 2025 at 12:45=E2=80=AFPM Lorenzo Stoakes
<lorenzo.stoakes@oracle.com> wrote:
> On Tue, Jun 03, 2025 at 12:25:36AM +0200, Jann Horn wrote:
> > The one way in which I think this is currently kinda yolo/broken is
> > that vmap_try_huge_pud() can end up freeing page tables via
> > pud_free_pmd_page(), while holding no MM locks AFAICS, so that could
> > race with the ptdump debug logic such that ptdump walks into freed
> > page tables?
>
> But those mappings would be kernel mappings? How could ptdump walk into
> those?

/sys/kernel/debug/page_tables/kernel dumps kernel page tables. And I
think /sys/kernel/debug/page_tables/current_kernel dumps page tables
for the entire address space including both userspace and kernel.

> > (I think we should take all the vma locks in that ptdump code and get
> > rid of this weird exception instead of documenting it.)
>
> We really need to be sure that there aren't some weird architectures doin=
g
> weird things or circumstances where this is meaningful.
>
> I mean people went to great lengths to make this possible, I find it hard
> to believe there aren't some _weird_ real world use cases.

FWIW, looking through the git logs for the x86 version of it, it seems
to mainly be used by developers of arch-specific code trying to
debug/validate kernel behavior.
