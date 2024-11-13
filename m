Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F66D200CB6
	for <linux-doc@vger.kernel.org>; Wed, 13 Nov 2024 17:44:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731519878; cv=none; b=jyOHMdda3Zvg0snuCsoZsfiDO2dA63xKG0pvQoHySE9FJbAicI8YrjK0DvgGT1QkSTPwhdMHe+nB4Ic+Tczr5FSciBEtTJhnFHEhN3/VRRMAfy1Mxy4qYIFjQIbt9ZpMUCBBWHlmj/ISemJyibFhGqw+CHuBM0ZW6WCUgO3IKQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731519878; c=relaxed/simple;
	bh=TcvEUkeKFVgGLTt37+MUAGAHziBUQjifnkJdXdV9wRI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cYHvljiTExMIbNktP+uzC8RpERs4KluVr2fa1jutu/VEihtsW83C83NKXTYierQV9zeHcQKFck+6S9SaGVd41NdmuOhSGi9jWLCNADw8TDxYm5q64UaqLYg8pc8la5I+4Ce3Y9ifVgYMs+I+uA14NnXxWv9pkn1cGVxmjmIYcP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=2NzEQ1SL; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="2NzEQ1SL"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-539e66ba398so10628e87.0
        for <linux-doc@vger.kernel.org>; Wed, 13 Nov 2024 09:44:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1731519875; x=1732124675; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Di+iKJ5akzTFP1IjKCqjyy6r9Jqh1xsxmJVtI0c5XMw=;
        b=2NzEQ1SLUDr16WIa7I5O1+BRSVbZidtehWFMcTahBxQf/FeuOKzO4HoWE4ylhzdqvW
         YxpHiS89GXeVubNcWbBHRibxjf5rlSxG5cR1hl6PuBJw9rdtRbfCV7T8mIBBBfV3b11T
         iFjGBudQh1vMf59kI70/LzO3PFGvjSNYYnpdGiHeqXYK58S0FctI2ElBHDAgDdUUw/8l
         8AL0Ow27S4pS1Kw/tFsNYMokBD8rkJf0e/rwf8tb2hDYTYpXdk3FWakeiwkeHDibi0bb
         mQDorCtGBjMdOf4DbeSOa624IIK6VO7BlQzkVvAvootbhEvEULlkWvASE6lQDdSkXpOm
         jYUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731519875; x=1732124675;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Di+iKJ5akzTFP1IjKCqjyy6r9Jqh1xsxmJVtI0c5XMw=;
        b=YJYb+CHc7iQf25wFeGuE4asTRTZzdx755f2sbHhbLDAiuSlQtA/tlA+bX5XquayEhq
         lrPPdTUS097nCDQTBp4kqbbA1vlhACgbeLsfEWbkRXgUEkY6ks+TvEUarOz0uDL2UgQt
         /DwNtMSggLwvIVNab0lB332/YsW05SDpM67rBc6e8oj2KuKkvs9e3n0K2EY8fbd5f8G9
         4Y/ijKvR/cq11qJBVg3sgVFEP+NpUqJvCZIgPndijtfBNWjm6+XKvhNRzuDsJTJXbtkf
         mf1yUOAmvoEEsZEA2zAZlFFGUyk3n9caGsb4lVQr0JTqYIBnDFz1h/ti6hcVSF/J7MJI
         /pMw==
X-Forwarded-Encrypted: i=1; AJvYcCWm5cOMGJqm/A0rs6wBxx4B4wRiE17+9fxmvRbIlIUnFa6PvDIrZpc6oagnTDxv8DqSPRr04DeVTP8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3XsJh2EIAUWGFmcf1Q62cCEeDPEhE0HdPG4zZZJB6warNyYh6
	aX8HnYupco9CBbx2WrH5eaYO62B+oTGoFMYnQp0HGl95WZ/ndkB5ExQb4Fqn2Gvqu8+CCTpIBTe
	y2tCaEVuN7lkJKusOJF4Ic/J+QDrUnpDh6AoL
X-Gm-Gg: ASbGncubKtciI5cwlfOKw61O+Pgd7nYz5aX0np5MDVP5/ctf6Hr/kP2cg5lHzhmMrCw
	0qVJAT58ONdHe92V1kQG7iJVZqLu0f3KB53Qaku7bPi3Ph7BSuku3IsIIcLoQ
X-Google-Smtp-Source: AGHT+IEBiRX+iakj03mwhRodl8EB4ddlvW0A0JNFLYItqjRlt/va0erAr2MtetPxwlyJPF24ToOICU0mFNtQbJtF85E=
X-Received: by 2002:ac2:4438:0:b0:539:d0c4:5b53 with SMTP id
 2adb3069b0e04-53da0736535mr143602e87.4.1731519874758; Wed, 13 Nov 2024
 09:44:34 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241108135708.48567-1-lorenzo.stoakes@oracle.com>
 <le3ykvrau2lbncrjsqll7z6ck43bf3shon4g5ohchxcvcs4fuy@h3pq646xgoz6> <3593f7ab-c37d-4c1d-bf2f-e47c30bb5d2b@lucifer.local>
In-Reply-To: <3593f7ab-c37d-4c1d-bf2f-e47c30bb5d2b@lucifer.local>
From: Jann Horn <jannh@google.com>
Date: Wed, 13 Nov 2024 18:43:57 +0100
Message-ID: <CAG48ez3Ap0XWr+3UmQeW6O82PU_Fh85pCuwOpC9n6J+kxtPVRA@mail.gmail.com>
Subject: Re: [PATCH v2] docs/mm: add VMA locks documentation
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Jonathan Corbet <corbet@lwn.net>, Vlastimil Babka <vbabka@suse.cz>, Alice Ryhl <aliceryhl@google.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Matthew Wilcox <willy@infradead.org>, 
	Mike Rapoport <rppt@kernel.org>, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, Suren Baghdasaryan <surenb@google.com>, 
	Hillf Danton <hdanton@sina.com>, Qi Zheng <zhengqi.arch@bytedance.com>, 
	SeongJae Park <sj@kernel.org>, Bagas Sanjaya <bagasdotme@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 13, 2024 at 4:44=E2=80=AFPM Lorenzo Stoakes
<lorenzo.stoakes@oracle.com> wrote:
> On Tue, Nov 12, 2024 at 10:15:44AM -0500, Liam R. Howlett wrote:
> > * Lorenzo Stoakes <lorenzo.stoakes@oracle.com> [241108 08:57]:
> [snip]
> > > +Each mm object contains a maple tree data structure which describes =
all VMAs
> > > +within the virtual address space.
> > > +
> > > +.. note:: An exception to this is the 'gate' VMA which is provided b=
y
> > > +          architectures which use :c:struct:`!vsyscall` and is a glo=
bal static
> > > +          object which does not belong to any specific mm.
> >
> > vvars too?
>
> I'm not sure if that's the case? For instance for x86-64 we have:
>
> /*
>  * A pseudo VMA to allow ptrace access for the vsyscall page.  This only
>  * covers the 64bit vsyscall page now. 32bit has a real VMA now and does
>  * not need special handling anymore:
>  */
> static const char *gate_vma_name(struct vm_area_struct *vma)
> {
>         return "[vsyscall]";
> }
>
> With no reference to vvar. Also vsyscall exists in a kernel range, and vv=
ar
> in a userland mapping (along with the vdso).

Yeah, there are different gate VMA types depending on architecture
(arm has "vectors page", x86 has "vsyscall", ...), but vvar and vdso
are just normal VMAs set up at some point in execve().
