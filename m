Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2784314B6A
	for <linux-doc@vger.kernel.org>; Mon, 23 Feb 2026 21:11:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.161.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771881069; cv=pass; b=NzySvnFypbc3AmSIWXpjH+Zb/IHQjY3ey0dQuJWbPoq3GxiGVX90w1crfp4HdLzhSyWkj8Mf5rBOF4wakdw81M7yxHl358kuEJeNrB+9AFYq3q4qShz9i3w4rcAFJRBNNKkCYoGTiZPMWh6OBJOxZCkC2n6zLBJib1hlDGA14f0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771881069; c=relaxed/simple;
	bh=SBNn9bJ+mn4rFm4urPqRfU37NxtjudbXHZSe27ocgO4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ay2g8lg/K9HZUQpcfxgSpFm6jsOGS533Fl3CPXGf+xg81T/k/2fJtWC3bnOkkn0/WAKy98rkqQo3iwe435VgPNKycfUI4SRI0F/UwKB9/BpGp77h5OrBQXQz1xNDoVYgsRqp+DpAUdPaL7xwlduviGyvyD9kPpF/qrbr0A/fHTA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l1uU793c; arc=pass smtp.client-ip=209.85.161.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l1uU793c"
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-6775a46c6dfso1402575eaf.2
        for <linux-doc@vger.kernel.org>; Mon, 23 Feb 2026 13:11:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771881067; cv=none;
        d=google.com; s=arc-20240605;
        b=XNv5F4NqBtY61D2kE/HPLeDQ2c5HS7FKJtBWOtxcJ+8huzaLh1f36UZi9wbtjV00CN
         uJGVRHg/2bDDGOo9afeerDLc2obiNXkg9TjNMslD5gs1JbAo9xqO5/4ldyVhU7bcfLYh
         MzVcqnz5NIxCFDSIxzY9gfkiApU6S9GAmJ3JUepMF+SniDWM9g2nIZRPfeLvwyXSE/2b
         DiVUQ7+cTeZuBI13YlVAgcQ5R1kRtOlK3fmnJdJl+GDsXuHBwVHRoj55cBQphMkaxgWI
         SmoUf5rCd++SXo+MioWT47tH5fMj6o+iXz3Ji4bSzH5E2TnwYUyg4B6qMjt3dCv0LHq4
         Y2xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=C01tRjdMdaUEOasjPgBS97A9p7M/5ZIJ1ZDRntEY984=;
        fh=CvAoNJxu24rG0D2SJaE2994iI9FE2xtVN6/18KyIvjo=;
        b=XZ0F5B2iBp8iiH5KGbQXeGHSwy5aPvx/hv8FXspxQq+ODymJNlFj6fFceG7Ba+Is5Q
         LYOMD3E+2tWl0HUlXh1JN9JT3BM93b33un/R5jkV+4UtGhg39Jc4tnHdzJ+xgzUFXyT1
         5lgnxZP1eWfJ1n8XWDbiCSAMLZFr2zMccIZUxbhagiw3K/fC7Cw2F3f2KkEHTyV5QZgR
         l1gHn9fNF6hLapJNx1Eja5SqoVPwc+QpEn1b/p1DZyzwRP9SBCDKXQ4elfsr8FuEz3z2
         Vv80PWkmKghRd8YDSZhOy2XWNZ+nwsGu/RyztKg2VmWBhC0G4UnU+mWPyrsr/PuqbY/s
         nO9g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771881067; x=1772485867; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C01tRjdMdaUEOasjPgBS97A9p7M/5ZIJ1ZDRntEY984=;
        b=l1uU793cmyiNlV+JdxiRAD6oCVFz+RCNEGOSw7bsZazuq134LbYpgYF25G08f+7GuM
         d9wyKX+snnviHzRhge2tpH87ZvpBz2AxMcuSv2dfANcyhaK7WDKzSiY1YS0Ft/zEDq16
         K8yCNcK2HS33pW1ve/wy6cScEZYg3RV+C9saCbQfh+4+y+/nytnV3UeWDYJv5fuXuyg8
         ZKrH2Lay7FHckAe7aToNNjQLBSJp9HPTZ7mimTcZ6kQl/O8k4/i3KRLjjVdofcq0Mjdy
         nfbFcDf6nQ9q7V6+NcXxWd7g3ObXIPqu8u2GdorTAp/8qlGHFCiW61IOKsbKKjyp8Y1X
         Og+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771881067; x=1772485867;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=C01tRjdMdaUEOasjPgBS97A9p7M/5ZIJ1ZDRntEY984=;
        b=eIli7gIUoSHztbleSMD8lX53sXcDZwyvEMnEjIbMcODA4Y3/2lNjU0MiuvAEYL8yWS
         OJRBJDiFX6vPuEUXEFHzfbqGfUSDGAnJpVnI89ENyjpMXGFTJR5wp7iaqWtZvOvBIYfM
         a0kD39LOY7aAwHdUNfZo6kbqZUZv9to4ot/PNJWn2HBdjyj1WFc86vSqL3ZIKjfd7OlB
         Im45MSh7I2FsQWjVkP1YqVQ6+SAv43HF+hP7LdkTKdw4ItrTdQRcmAvWvBEIWAKE4wiE
         L/ibH4QhZVUVr278Kw6fbnhgZ5lnAvutXwXkuakGjbrNLLHXOsYtMuNZXKLeBVAXxKpe
         q2vQ==
X-Gm-Message-State: AOJu0Yxhyde+A6iIYCBA1IavfGeHvOaoKsMYm2BVqRQzsrg7hUoN/sr3
	9f8r6Cl4IY/QyDI3wn3HT14p4kCb/gMWheNzHeCa8teVxi5MkOO8Y/T0OY1koLXeaJc36r2sl7X
	vj7wwYUxGL6gJE7Bq2O+vHhdD8YGBLXVHWgucY3k=
X-Gm-Gg: AZuq6aIVIDzxafjp0LYeD5zP6K1xQkxtozgd0vPFxOfvpC1LLqgaQjK6NZDpblgu4KQ
	ptkWIJD9hQOR0e5G+VOjk/bkohjE5shy1zNqrFD4qbwbUX3hG6qQVd8cqTk3CsLmQNtUDtVtE6m
	Uimaxnm9E/KybmesZCIUQAGIdBIOygzT75BgZTOd0mnxq2RfHWeyCzu3+Oh8OOL8o6FMFY1HZTh
	X85zskSmiF/1WHd5KVahUaGycmIldpO+zAaIPJOoJLnUqFrEeJxC4ooJoD/XLiR84NBb6B+CzPU
	ZM2hdGzjfinDMQAZ8ZMKYkKNeaHlRoANoNv7zzk3ZOkIj89ASoGFkDyye+ekIfqp2SFbiCZo2g=
	=
X-Received: by 2002:a05:6820:4dc3:b0:679:a650:cc0b with SMTP id
 006d021491bc7-679c44f09a8mr5248537eaf.51.1771881067481; Mon, 23 Feb 2026
 13:11:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260204113210.185221-1-danielmaraboo@gmail.com> <87a4wz5fzm.fsf@trenco.lwn.net>
In-Reply-To: <87a4wz5fzm.fsf@trenco.lwn.net>
From: Daniel Pereira <danielmaraboo@gmail.com>
Date: Mon, 23 Feb 2026 18:10:55 -0300
X-Gm-Features: AaiRm509JoYQnQMkkXbKAPLMa6k0WXUD1HorwBP2Lkh0DJHfiLT8dc0vCVibZF8
Message-ID: <CAMAsx6cu=SpJBvKd=q+ZyuXHVHMcSwBNdZxRoc22t2y-g6Lhyg@mail.gmail.com>
Subject: Re: [PATCH v5] docs: pt_BR: Add initial Portuguese translation
To: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 23, 2026 at 6:04=E2=80=AFPM Jonathan Corbet <corbet@lwn.net> wr=
ote:
>
> Daniel Pereira <danielmaraboo@gmail.com> writes:
>
> > Introduce the initial Portuguese (Brazilian) translation
> > for the Linux kernel documentation (HOWTO document). It establishes
> > the directory structure for the pt_BR locale and adds the official
> > entry for the pt_BR maintainer in the MAINTAINERS file.
> >
> > Additionally, this version adds pt_BR support to the documentation
> > build script (Documentation/sphinx/translations.py) to ensure proper
> > rendering and fixes the documentation hierarchy to avoid orphan file
> > warnings.
> >
> > Signed-off-by: Daniel Pereira <danielmaraboo@gmail.com>
>
> The merge window has passed, the floodgates are opened, and I have
> applied this as the first 7.1-destined docs patch.  All looks good,
> thanks for your patience; I'm sorry that the timing worked out so
> poorly.
>
> jon

Hi Jon,

Thank you for applying the patch as the first 7.1-destined docs patch!
I'm very glad to see the pt_BR structure landing in the mainline.

I appreciate your patience and guidance despite the timing of the
merge window. Regarding the next steps, once the "[PATCH] docs: pt_BR:
translate process/changes.rst" is included, I will continue with the
translations, as these documents are the foundation for all our future
contributions and help establish the standard for the Brazilian
community.

Best regards,
Daniel Pereira
