Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D9BA3FB072
	for <linux-doc@vger.kernel.org>; Mon, 27 Jul 2026 11:29:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785151774; cv=pass; b=Ugvi51jggkdDVckmvw/OlCZP6UIBV0+ph8pLG8aZvgyVthR0WTsZ49OwaAHSI/qWlQ6ZZ/spuoTwAaMvuLBFb+zRLcMSWg41uhYmEhunXDT+NI90L+dJo6YXLuQNsue4FXlPMheTZjJdU/YGk/b+VvDVw28vxLFZc7hnl30Hhsk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785151774; c=relaxed/simple;
	bh=ywNktrN1eKe1snSr89eAFAX1pzSt5r/UdWzrOeAzj0I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WQNbmrJT6IbdIiw9xfwPfaEYIIl7/LqlFZClcJBKhJ0aDVQEZa6F2B3noec4DD6uovefhsVVvUrYU8+xbLrPS2LQ7B1SxJiJfsNisyxFmF+O7m2dfKmctLeDXihwJOAINvP+EynBICkGHUFRVZGyoL8heaHYiX7RbnIlM14RNZU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nlTUrW5l; arc=pass smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nlTUrW5l"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-51c16ac21acso16206021cf.0
        for <linux-doc@vger.kernel.org>; Mon, 27 Jul 2026 04:29:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785151772; cv=none;
        d=google.com; s=arc-20260327;
        b=L8v4r6n+SU0XckqUg0G5mxASczB8/HhDBER/ytHRCF8GFMyGtoY7+Qmj4XQ30Fqd8I
         OkamO7KbclXmXUVgGKVZ1z6n1reg0ConRqHJANypRiKpQGXXctlvx+QA+7IaJMzWpfqR
         fxQoXf1pYsHpXVCWK+5WpQFEVvlRyUQSvrr5Sp30Byj0hA8Be7phytoF2v0ED4Ph7ih+
         pvFZCigh/VMABF4ovytVsB0HxuYbnE/Dsd4yDG5V2c44Eq3iFkZKlaCGWptrns+L6/KC
         eQzsjFHPqI83BQkNLUm/TfdxvTMdiK2ApXynPkU3yl54eZRsncbIYOQh4/RpFLLSO6X5
         AF9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ywNktrN1eKe1snSr89eAFAX1pzSt5r/UdWzrOeAzj0I=;
        fh=MwM/ibIM5CqoA0CYmYNey+nKQGz3x85+tcO5XyP/Ie8=;
        b=NCy2z7WFZw8POX+vfktouLK4zIGIG8s1sVDZppU3/W0vM3J2uXvqoaXUJQY8ab1kNs
         08qex5+e871BR3AC2QfbjxTaq6QIKMwWdCfWt9M9jx79V5LoI0PN8awlgP78UbVvLwlp
         NzHa0EvpSNXx3WfGTZ8SbA3Mu3Deqa13GC1iKtbbahDm6R1uzkF5sLzsNRBejnZ/1UZt
         j3m353U2oKtizVRut2P0WCZprANK446QCuDMG+A7d6mTHkAcdPcLQs1HRvZfjQxKyt++
         vDdlsEF6rBpnt7I5Vn6G35QFT333jq2Hy/YhUz+KUibRZr8oYMRL6yFORdGY+lhLC4Bp
         dmRQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785151772; x=1785756572; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ywNktrN1eKe1snSr89eAFAX1pzSt5r/UdWzrOeAzj0I=;
        b=nlTUrW5lxAlvJu3BlDuOMlT+Cep90SAezNN28M7IR2Q5YTDU9kDgnhS6NEfqlq+UTC
         rAYlW/IY3SXBosnfe6vm3t6x69ETc1KuzXJb9Z/37O/HpXvHbtAJWc8zfs/88wXCiT96
         fd7pnmNZFTGgXto+DVK+vD1aRsVSluTHSLFz/M4lOG2WfWFc3MKiiaJkHuOWb9uagY4y
         KaN5qY+sCrLvCl8/3npb2TRXH3iQuSIxgg51GyqPTTK563S55n60plpGLSI5KpNj1XUN
         wr5a1ktfQe/4XVuV8Acg07yPm+36oQmfFxqMHu8Jbpu+j7PrN434A12NrU8huvKYwP9F
         aNqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785151772; x=1785756572;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ywNktrN1eKe1snSr89eAFAX1pzSt5r/UdWzrOeAzj0I=;
        b=nGAsGzENrd0226AzarN0RtqED93G77Ly+hsnI2LzqOWYaC7HWUc8XBU5ty3CfPj67r
         7STg7OX3n1rNW5p4XicZPA6ymxqnQKtF+fd0C0Bt0cHqQMY3Hw91ESw5Vg+sFDBmfIJI
         4Fd5pruNDl18bE5bdOWlXDPbkfg/SGAcpCTQySfLc9IkCiWijJZhMMHOBTWcyrSsfN/e
         htLS6RhIecf4nK6ZaftIMI8CV7fg0TXM86RR4uymcK/sHvFEhROBJQFFf1JEaoJHXEFj
         6uMJYs+Ejo1KH7Ry4EEYyYmnZ4quz+NKAxPye5hQNiNzWSBycrGuzZaA36pALvZ2eJUV
         iLiA==
X-Gm-Message-State: AOJu0YyWQxz5Ya8aORzR3T5sKv/6Z0FaxkmbtlEkoOl0nFPdtAPq/Ljl
	gJHkxbvw4DqFgaf6HsvwoiShGMES/M67GStF4G/0xeL5ZmHsWh16LY2nakINWq76uRHcKohjGIe
	bO4ZG+Fju20P+PX6GEAYWJfSORbKXsnj4MM0ek4arMQ==
X-Gm-Gg: AR+sD11fM3dSFdIZ8nn+ie0YPQ/lcs/LhHKduzze1Ve8p/I3Aq7UGnRMBqpyx+vJ9j+
	TvlqOPFcNSX9nvXpE6+6X/XixkyDyz/y7ex3pOUg9omY8HN6habd69pj0iqvGPuJiGwGnUvGET/
	9gvxqnaFRqoym+BYeiBaUqypb8iU3ir0eKUDwf1d/EmoznRol5hNmeQkhUVx73TpV4DelFJWcGj
	jgrcVmKYucyJgvIyxgAs3L1d2TTi7BF5k58Jaw86tazRpAvxGk8M5WX6JAjOGgtBHM4xzQH2POs
	5xBaPSnEHOYAzsxXJfhId54ZBMgnTLRQ/PCMrXet4KDygpzYQ9OnQtK95HzpRPPOMpsacERp8cA
	=
X-Received: by 2002:a05:622a:83:b0:51a:8c99:1f17 with SMTP id
 d75a77b69052e-529a8732cd0mr78893851cf.70.1785151771676; Mon, 27 Jul 2026
 04:29:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260727000500.20413-1-le590616@gmail.com>
In-Reply-To: <20260727000500.20413-1-le590616@gmail.com>
From: Daniel Pereira <danielmaraboo@gmail.com>
Date: Mon, 27 Jul 2026 08:29:20 -0300
X-Gm-Features: AUfX_mwvkGCwNb90djQHwC1NcpagdYFOG4DTqWMr2lMYjG49bVIgHLfe0lCtTF8
Message-ID: <CAMAsx6ejgVS9cOjZ2GOFaEaEZQJLOKirk42ZbhQaCL0_+vZXew@mail.gmail.com>
Subject: Re: [PATCH v3] docs: pt_BR: process: Translate programming-language
To: Abel Philippe <le590616@gmail.com>
Cc: linux-doc@vger.kernel.org, corbet@lwn.net
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Em dom., 26 de jul. de 2026 =C3=A0s 21:05, Abel Philippe
<le590616@gmail.com> escreveu:
>
> Translate the programming language documentation into Brazilian Portugues=
e.
>
> Changes in v2:
> - addition of SPDX-License-Identifier: GPL-2.0
> - addition of the missing half of the file
>
> Changes in v3:
> - change "linguagem de progama=C3=A7=C3=A3o" to "linguagem de programa=C3=
=A7=C3=A3o"
> - removing duplicate "``rustc`` [rustc]_" from programming_language.rst
>
> Signed-off-by: Abel Philippe <le590616@gmail.com>
> ---

Hi Abel,

Thanks for your collaboration. The grammar looks good to me.

Acked-by: Daniel Pereira <danielmaraboo@gmail.com>
