Received: from mail-io1-f43.google.com (mail-io1-f43.google.com [209.85.166.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F36D02DBF49
	for <linux-doc@vger.kernel.org>; Mon, 20 Oct 2025 21:02:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760994143; cv=none; b=BN+HUSAzv86S+t5jjUrEZGvGBlyp82/sXHEDD4Yjd+5EsIcufB22iP3nXlVQHrhPFPGZCcwb8R1eHdaBgPV7mhS+xXdMpnHRqhRYFxOQuL8PnlzQ4dVbBSc2Zv0H8BV5D+anXtfSVixb0lwxUOBN10X4y4FVROm9rqqnYpGH9fw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760994143; c=relaxed/simple;
	bh=IgYE1mZTkxVPjcoFUAJYAa4jA2ZPp6tn7R05SstSckI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hxbBKpOoSJWA4SbOhQnVFDUxJQ8Shwo4ncpr0PRrAZ7aNUait/DsGO1sCAQZuC0FD6G8mOxTOSxZYgGY+MUngqIPyrXI26nnmA4c/zNVvwyjxR0mIq1vhgt4oUnmXpmP8ixdiVnJYkbCDcZEGg78alsRMd4fvQaU5xQHI+w0cG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UMuqGiiV; arc=none smtp.client-ip=209.85.166.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UMuqGiiV"
Received: by mail-io1-f43.google.com with SMTP id ca18e2360f4ac-93e2d42d9b4so207930439f.2
        for <linux-doc@vger.kernel.org>; Mon, 20 Oct 2025 14:02:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760994141; x=1761598941; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bEuxap4uXOw4PVhBkZanJl9OA3DpfYNQ9aSaoCPuf2A=;
        b=UMuqGiiVhhJ27Y3UQ5+FGE6JUilR/j/goVjwHnXsLfldvTBErq7MxbHHm+8Ja+emzj
         qllmESMNlV0eVPJAkwf9hmaMJM5OETGAx0q7EGDX6kd5IuL+pmUkL53XrQ4ZpyimtVRp
         GB+KypAuEO3rbcC2+YzL3hPSUHaP9yjCbpIXMsyq9gGpbA+0+qDWNJCinPZBCnMfRS2f
         nA1mY/G0ZPN6GcV2xEG5b04BPaz0yXqN0zVlV4erE8MqZ7180LNs1t2wCdXaTZw67LBJ
         bbr3rHBz2QCAW2fXNQP9mKSRVQpxESNrQM0br6DUmTvbxBdTpFop+PhrOs+fi4O0reA8
         x1bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760994141; x=1761598941;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bEuxap4uXOw4PVhBkZanJl9OA3DpfYNQ9aSaoCPuf2A=;
        b=KIi2IKgh6p3C5Akh0BewlDLKNZln4Uvg9FYhjsOt89SJ5ZRSYrthVTegb9vWzHmoup
         nhyacqgzkaW568p8LSC4actp1aManxYfQjAXmmkpt8RMIR89fHDoLHb72ORlqTDmjwEo
         Gk54F8HuYIG6Xdm5O6mcgxNDEKUj9AX+FQLgvzAnjGigQQkrbU/Uo2AHJh00OS6V2FAS
         /6n8Y/45HyhCe+jpJ3/zvhDdosOhdMhW3mJxtlQa2mEtUxZj6+MLgXGHQFWygzmxj/N5
         e2ZLWTdryW/JNNwvH3i/fKdWrGxO6tpyKfo+iIAiGNRgAzVxpaxSshSAgXDUiu58DJ49
         BnTQ==
X-Forwarded-Encrypted: i=1; AJvYcCX6OQMdlC5QWc5dtbVA96JsgSAXdjoxwIOoZ7f7J6jXQAqVqUc9Ne2DMtQ8PRCU8u4XvvyUCPCm4vM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzFqrvRI/S3ceBUefkX7DjBS0ZrboRb7oOzHcK5cTEJPYx+7WjT
	o+reX89R58LPkuLdrNcVksDRR5Uq6Lle0gvlh+/g4qHH5lOWaql4RGCAxJ6qU46op5Sgowhmd/R
	Au8B8FVi/j8hbel9RRnyfCcm/SOhdh2U=
X-Gm-Gg: ASbGncuveRo7AFticf7l493K3+s58K3quku7tkYJ3jAY8IwxWbsMW1Z86GNvuJfFA+L
	UZ/FqUAQykUTAE4RMJd09hNvwUXUIeS4uS/Te1VUAWeSTQHBMgAx5K4w+aGLa7hwjHaaDss/gps
	QuDWQlBoWF8vCjXbZ19D5oUUO8Oq/vnTOeTDMIeWqmjZ3JPfw+p5Zm8rB/+1fxWKkuBCYwx2bk3
	5Amj7nI4FLivj+eH3PG+gVZVorkzEyOF+Hbz3Wmnaht0PKxpCvkqJPFY7JWprxIJ1DwuzImlybw
	4aeuCwYycAo9EtH5N23iFvTr2JKAF05NBUZcWWkMSdht7CEEBLcEMmllqQlievfeVO/4iLPbL5g
	bIOZ0i/CBFKvEib2bOVgf/282Cq92KSB2mDIuVyVRPiMlO70CWmhfeEBF
X-Google-Smtp-Source: AGHT+IGAeJGAQIBM2nto3h7wo4Ux1j4JQv5kFnMFKMPjSOsA8laTc7KGJRta+EANCOydZnJICpXKfizFw0bVF/vJHG0=
X-Received: by 2002:a05:6e02:1fc5:b0:430:e9d2:8f3b with SMTP id
 e9e14a558f8ab-430e9d28f40mr20917205ab.27.1760994140614; Mon, 20 Oct 2025
 14:02:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250910170000.6475-1-gpaoloni@redhat.com> <20250910170000.6475-2-gpaoloni@redhat.com>
 <878qifgxbj.fsf@trenco.lwn.net> <85166a8a-ad54-42d0-a09f-43e0044cf4f4@redhat.com>
In-Reply-To: <85166a8a-ad54-42d0-a09f-43e0044cf4f4@redhat.com>
From: Chuck Wolber <chuckwolber@gmail.com>
Date: Mon, 20 Oct 2025 21:02:02 +0000
X-Gm-Features: AS18NWAdMqoSfNFq5XutKr0MnkgQ82Rnk3fUSUQqpBl0J3sT2E2MC5yWctws4W4
Message-ID: <CAB=6tBQP3aCDWch4ZcEYMqFsJ4OKXSyC_hb9V9hA7ZZty7vFeQ@mail.gmail.com>
Subject: Re: [RFC v2 PATCH 1/3] Documentation: add guidelines for writing
 testable code specifications
To: David Hildenbrand <david@redhat.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Gabriele Paoloni <gpaoloni@redhat.com>, shuah@kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, gregkh@linuxfoundation.org, linux-mm@kvack.org, 
	safety-architecture@lists.elisa.tech, acarmina@redhat.com, 
	kstewart@linuxfoundation.org, chuck@wolber.net
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

[Reposting with apologies for the dup and those inflicted by the broken Gma=
il
defaults. I have migrated away from Gmail, but some threads are still stuck
there.]

On Mon, Oct 20, 2025 at 7:35=E2=80=AFPM David Hildenbrand <david@redhat.com=
> wrote:
>
> >> +------------
> >> +The Documentation/doc-guide/kernel-doc.rst chapter describes how to d=
ocument the code using the kernel-doc format, however it does not specify t=
he criteria to be followed for writing testable specifications; i.e. specif=
ications that can be used to for the semantic description of low level requ=
irements.
> >
> > Please, for any future versions, stick to the 80-column limit; this is
> > especially important for text files that you want humans to read.
> >
> > As a nit, you don't need to start by saying what other documents don't
> > do, just describe the purpose of *this* document.
> >
> > More substantially ... I got a way into this document before realizing
> > that you were describing an addition to the format of kerneldoc
> > comments.  That would be good to make clear from the outset.
> >
> > What I still don't really understand is what is the *purpose* of this
> > formalized text?  What will be consuming it?  You're asking for a fair
> > amount of effort to write and maintain these descriptions; what's in it
> > for the people who do that work?
>
> I might be wrong, but sounds to me like someone intends to feed this to
> AI to generate tests or code.

Absolutely not the intent. This is about the lossy process of converting hu=
man
ideas to code. Reliably going from code to test requires an understanding o=
f
what was lost in translation. This project is about filling that gap.


> In that case, no thanks.
>
> I'm pretty sure we don't want this.

Nor I. If you find any references in our work that amount to a validation o=
f
your concerns, please bring them to our attention.


..Ch:W..
