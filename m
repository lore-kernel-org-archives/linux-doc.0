Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9F86435AB3
	for <linux-doc@vger.kernel.org>; Tue, 28 Jul 2026 18:24:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785263075; cv=pass; b=TOe90MeYP69Km70qr/dTDPBAHvCBjSgv/z1rc4VjgJ8INy7zyy8vBhzRiySnODo7YmLOqrnHf+9FsjVLWNfdLWbihCP1McISRY6FkpRqUtrysw5y2nzLycULSqZwjdi+1uwZOas1h1VAcUp3TZiLX4+CT4wTqikwoilB2D3R86o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785263075; c=relaxed/simple;
	bh=5Gl4WiQQqZmtOIZZSDE9FM+gS2TqMV064oFRF9iA060=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gQi0vKrrJNljmzq+8QHT3IFr9IGFdSZNh3e3ncBfdvabRfeiRlAN7AgEFQRu36/4I90RqIhewhb4nA/pnsCh9MPtqBFkPXf1N95hHUF7QhPHJmnbprn/l85xsqDKL4Da2gcaaemrWdMJr4ndw75D2dTlm547u/fTjHmjUnUWlg0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HQQiO3qq; arc=pass smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HQQiO3qq"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-39efab5d138so33341fa.2
        for <linux-doc@vger.kernel.org>; Tue, 28 Jul 2026 11:24:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785263072; cv=none;
        d=google.com; s=arc-20260327;
        b=IH+x02yTU4Iig8mB30laf8uDYSMHzvkG0ZZOZalcR8N4bpI5kAmDO0B5ryXFYy2KHl
         CF6zZvnLUMGBZ/piCA/LPbhQFJ2NSNhr6jeZGSx4TlX17e5mSA2nyWfIf8uUnRA+HD5j
         cnk7oQSLRGqwy1T6qBMF6lUtg9nDAhmOnMXCZ8ZHg8Wf/8Jn2wHVEackEWNefrrNAdzi
         Hp56DmXFwiDyuKLGEPuCLyBrr9jbmsIUsEQyg3aI16vn7qN2QMGIkqiFBLG4ZJeLsO7W
         1GTVEHb++MEHDE15WTR89z6lCwS7r6uUnYMgQAwTk+8/tPqAPbfmMTSMmA6mrwbjGA6h
         h53w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=50/iY+ce0hmfZcEw5dcAO18p+YBDWz7z82CYLxB1NPs=;
        fh=0eZp7Vny+LL8oymhG3HGluEGjDzuh4DEIHfpTtg8VR4=;
        b=hmPSIb6ZYISJ5lVvjLwIa9aI6wvzD9jbn6DXOHUjOMwegink5ageHP/lvVpe7bn8J5
         OlwmOp5ScknT+dW9Pgjw7xhQaBWt8IvCHbWEXv7GaXjkXWNLScXrSuBK4zSmmSJBymQU
         eiOoPkKN30jtPE10og/2XQZmNwQXgAipTZ/sUf9NK1rhpbg/rn7IQI0GVmI4wCc24Waz
         YW49tMqvHLMw056attMIsjQ8F77dBEeDblwm2BN0oD4MldurTomxs3eE0j21BLjAd8WI
         WKQr/STbWkrDdgW+PKfREDayiiayvGz6eTXn6AmknvTNcxJNzwBtESAGgUr2ID1w//yW
         BYrg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785263072; x=1785867872; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=50/iY+ce0hmfZcEw5dcAO18p+YBDWz7z82CYLxB1NPs=;
        b=HQQiO3qqmPIugBNMjN5wVdH6WD9PvEZWuUEdSDXai16dA4W0l6UjSX9BX7oavDF4Re
         tqFhS4J9h8U0eWtmFje4GnKObhQM3LRlKEWPzJU2Fwth4rtdQNPHZLEUCa4Bs0o3GyuY
         oG6J1j69I+NysJs0sN3uhOUqFiBytwaRdWQIYO1UfZRrCWYkrkDtcoYEiOA5J4wDxnq7
         T7XfR0VRHxOBDngi1T9FyMIy12+tMocJhyNjv9X/bZODK+kbKO6cWcWb3tq5nPi6ggcu
         LoofQIG7gfIhDC5P20ISmZ+azRSWu8/V8RsfiTYpV9PzYIfa68kJol62JThH9gvlNU3f
         gX8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785263072; x=1785867872;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=50/iY+ce0hmfZcEw5dcAO18p+YBDWz7z82CYLxB1NPs=;
        b=iSZA2D8IVu3n3uQ3Tj+bXbBSN2X7b2QorFUZpvKb+03nssUfRrfhiJXMbp9pANTRo5
         lNz1C34/WCNUygBX+icap9xH+DaetaFvjQQ8CtfqV7ty3ZbdH5NQTbe/Ydata0XakUcH
         XNqluRyXifKYgR1siM/4ggmmStdNhcphjQKeQvp/NZ44Bthnb/sdZPUL/1R2Zm1MLUt8
         VeyMLrDECASrAiEz3vD7zMjWvPp4m33jdosYQXYGvi0AYNSjH6q94UkwxcRAcWbkYoD5
         0n60Ra4GDOrxg3j9xvVuWF/2+FAxenNCF3GnJgPY30iXMZi8Q+UKBloIFq8O2+nqldgj
         9JmA==
X-Forwarded-Encrypted: i=1; AHgh+Roeib0l6waMWG0HhavJV4wwz1fcghfGpC46761aM7oQNLLKJZ+1PkiKcjJXfFs1fhp39QwlrYBDu5U=@vger.kernel.org
X-Gm-Message-State: AOJu0YzyA8MBQNF8TwbsMd1WjG/94Iw8mxDan5VGxwG3L9bVuv1akVEi
	AUBOtrAgEzaYXbyWDqxHyrWhSv1Mm4VcBIZAPiyhF7riZc087dfsY2A92Ng8WN/q3tuvePuxOld
	IQyQ8cjhkWqgPQltxRUxxubksRm+7Tx8=
X-Gm-Gg: AR+sD12Ng751cH4ujDpsM5VgMxd1Sr4nF8ZBoQhDVheGZwKIopIJbpa2cNHngNklVCA
	KeUcj4jLzXcEyVNAh175jIvm0lbRywAux9aqORfFp8DGifpdwPgQ3Od+/b3FTXTKhyHw5VIbpkI
	K7O+o9GKs80zHa4EybkqeOMMWRa6FolZHS+zIIez2l89gf/wqrp1OkswbaULbetVKZMsdRJY6Ku
	JO3mx51BgeWMkVR2sBwLMffLf+aSuSmjfGC2PcvhVdX4R99Hwa6VS7lK6K/t0TdoTJ7s+A9zwtm
	Ira27ToKY6Gxjp2QrJm28n8UK/Gzzp0C2gf7B69QNuez
X-Received: by 2002:a05:651c:19a8:b0:39c:9b7b:7e4a with SMTP id
 38308e7fff4ca-39f57ddb4eemr2997501fa.0.1785263071678; Tue, 28 Jul 2026
 11:24:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260728091038.171033-1-chenyou910331@gmail.com>
 <20260728091038.171033-17-chenyou910331@gmail.com> <e137128c-0289-42e5-87ea-4de791cd1808@gmail.com>
 <CAKspUh+nRVUXxr9-S9D7jK9nTR3Emwer1ZFOdLQeChGBN+Hc-g@mail.gmail.com>
In-Reply-To: <CAKspUh+nRVUXxr9-S9D7jK9nTR3Emwer1ZFOdLQeChGBN+Hc-g@mail.gmail.com>
From: =?UTF-8?B?6JGJ5a645L2R?= <chenyou910331@gmail.com>
Date: Wed, 29 Jul 2026 02:24:20 +0800
X-Gm-Features: AUfX_mxgr-F01JuGXV48AujRX5xY0-qpXTDYpLL207OQRvaMtwfCtYQkAi19d9Q
Message-ID: <CAKspUh+UhkiJ=DzYQ5jkjqAcAQZiRsnnU7kk+b=3XVbJTHYGWA@mail.gmail.com>
Subject: Re: [PATCH v2 16/16] docs/zh_TW: Add a glossary for Traditional
 Chinese translations
To: Alex Shi <seakeel@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>, Dongliang Mu <dzm91@hust.edu.cn>, 
	Yanteng Si <si.yanteng@linux.dev>, Weijie Yuan <wy@wyuan.org>, 
	Hu Haowen <2023002089@link.tyut.edu.cn>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 28, 2026 at 09:36:24PM +0800, Alex Shi wrote:
> > +=E4=B8=8B=E8=A1=A8=E5=90=8C=E6=99=82=E5=88=97=E5=87=BA=E5=B8=B8=E8=A6=
=8B=E7=9A=84=E7=B0=A1=E9=AB=94=E4=B8=AD=E6=96=87=EF=BC=88zh_CN=EF=BC=89=E8=
=AD=AF=E6=B3=95=EF=BC=8C=E6=96=B9=E4=BE=BF=E5=BE=9Ezh_CN=E7=BF=BB=E8=AD=AF=
=E8=BD=89=E6=8F=9B=E6=88=96=E5=B0=8D=E7=85=A7=E6=99=82
> > +=E4=BD=BF=E7=94=A8=E3=80=82
>
> This is related with copyright. At last, you need to ask the original
> author's permission, and give a reference here. I guess...

Thanks for raising this -- it turned out to be a more useful question
than either of us expected. Let me answer it properly.

On provenance: the table was not copied from any external glossary, so
there is no third-party material and no permission needed. It was
compiled during this work with the help of an LLM-based assistant,
which drafted the zh_CN column from general knowledge of mainland
terminology rather than from the zh_CN tree itself. I should have said
this in the cover letter from v1; more on that below.

That drafting method is exactly the weakness your question exposed. A
column labelled zh_CN reads as a claim about what the zh_CN documents
actually use, and "what a model believes mainland usage to be" is not
the same thing. So I went through all 115 entries against
Documentation/translations/zh_CN/, counting actual occurrences rather
than just checking presence, and found two wrong:

  - build: the zh_CN column had =E5=BB=BA=E7=BD=AE, which is the Taiwanese =
term and
    appears 0 times in the zh_CN tree. Corrected to =E6=9E=84=E5=BB=BA (246
    occurrences).
  - account: it had =E8=B4=A6=E6=88=B7, which appears once; the tree consis=
tently
    uses =E5=B8=90=E6=88=B7 (8). Corrected to =E5=B8=90=E6=88=B7.

The rest all appear in the tree. A few are low frequency but genuinely
mainland usage, so I kept them alongside the dominant form (e.g. =E7=BC=BA=
=E7=9C=81 2
next to =E9=BB=98=E8=AE=A4 328).

Both fixes and a provenance note will be in v3:

  =E6=9C=AC=E8=A1=A8=E7=9A=84zh_CN=E6=AC=84=E4=BD=8D=E7=82=BA=E5=B0=8D=E7=
=85=A7=E5=8F=83=E8=80=83=EF=BC=8C=E5=85=B6=E7=94=A8=E8=A9=9E=E7=B6=93=E6=A0=
=B8=E5=B0=8D=E6=A0=B8=E5=BF=83=E6=96=87=E4=BB=B6=E6=A8=B9zh_CN=E8=AD=AF=E6=
=96=87=E4=B8=AD=E7=9A=84
  =E5=AF=A6=E9=9A=9B=E7=94=A8=E6=B3=95=EF=BC=8C=E9=9D=9E=E5=BC=95=E7=94=A8=
=E5=A4=96=E9=83=A8=E8=A1=93=E8=AA=9E=E8=A1=A8=E3=80=82

On the broader point: I should be clear about how this series was
produced. An LLM-based assistant drafted the initial localization of
each document and this glossary; I then reviewed every line by hand --
checking each terminology choice as a native speaker, verifying the
"update to commit" baselines against git log, reading the text aloud
to catch translationese, and building the docs. That review is where
the substantive fixes came from, including the ones in v2 and the two
glossary corrections above.

The documents this series translates now ask contributors to declare
this, and I should have done so from v1. v3 will carry Assisted-by:
trailers and a note in the cover letter. If you or the other
maintainers would prefer a different form of disclosure, or would
rather I redo any part of this by hand, please say so.

Chen-Yu


=E8=91=89=E5=AE=B8=E4=BD=91 <chenyou910331@gmail.com> =E6=96=BC 2026=E5=B9=
=B47=E6=9C=8829=E6=97=A5=E9=80=B1=E4=B8=89 =E4=B8=8A=E5=8D=881:54=E5=AF=AB=
=E9=81=93=EF=BC=9A
>
> On Tue, Jul 28, 2026 at 09:36:24PM +0800, Alex Shi wrote:
> > > +=E4=B8=8B=E8=A1=A8=E5=90=8C=E6=99=82=E5=88=97=E5=87=BA=E5=B8=B8=E8=
=A6=8B=E7=9A=84=E7=B0=A1=E9=AB=94=E4=B8=AD=E6=96=87=EF=BC=88zh_CN=EF=BC=89=
=E8=AD=AF=E6=B3=95=EF=BC=8C=E6=96=B9=E4=BE=BF=E5=BE=9Ezh_CN=E7=BF=BB=E8=AD=
=AF=E8=BD=89=E6=8F=9B=E6=88=96=E5=B0=8D=E7=85=A7=E6=99=82
> > > +=E4=BD=BF=E7=94=A8=E3=80=82
> >
> > This is related with copyright. At last, you need to ask the original
> > author's permission, and give a reference here. I guess...
>
> Thanks for raising this -- it turned out to be a more useful question
> than either of us expected. Let me answer it properly.
>
> On provenance: the table was not copied from any external glossary, so
> there is no third-party material and no permission needed. It was
> compiled during this work with the help of an LLM-based assistant,
> which drafted the zh_CN column from general knowledge of mainland
> terminology rather than from the zh_CN tree itself. I should have said
> this in the cover letter from v1; more on that below.
>
> That drafting method is exactly the weakness your question exposed. A
> column labelled zh_CN reads as a claim about what the zh_CN documents
> actually use, and "what a model believes mainland usage to be" is not
> the same thing. So I went through all 115 entries against
> Documentation/translations/zh_CN/, counting actual occurrences rather
> than just checking presence, and found two wrong:
>
>   - build: the zh_CN column had =E5=BB=BA=E7=BD=AE, which is the Taiwanes=
e term and
>     appears 0 times in the zh_CN tree. Corrected to =E6=9E=84=E5=BB=BA (2=
46
>     occurrences).
>   - account: it had =E8=B4=A6=E6=88=B7, which appears once; the tree cons=
istently
>     uses =E5=B8=90=E6=88=B7 (8). Corrected to =E5=B8=90=E6=88=B7.
>
> The rest all appear in the tree. A few are low frequency but genuinely
> mainland usage, so I kept them alongside the dominant form (e.g. =E7=BC=
=BA=E7=9C=81 2
> next to =E9=BB=98=E8=AE=A4 328).
>
> Both fixes and a provenance note will be in v3:
>
>   =E6=9C=AC=E8=A1=A8=E7=9A=84zh_CN=E6=AC=84=E4=BD=8D=E7=82=BA=E5=B0=8D=E7=
=85=A7=E5=8F=83=E8=80=83=EF=BC=8C=E5=85=B6=E7=94=A8=E8=A9=9E=E7=B6=93=E6=A0=
=B8=E5=B0=8D=E6=A0=B8=E5=BF=83=E6=96=87=E4=BB=B6=E6=A8=B9zh_CN=E8=AD=AF=E6=
=96=87=E4=B8=AD=E7=9A=84
>   =E5=AF=A6=E9=9A=9B=E7=94=A8=E6=B3=95=EF=BC=8C=E9=9D=9E=E5=BC=95=E7=94=
=A8=E5=A4=96=E9=83=A8=E8=A1=93=E8=AA=9E=E8=A1=A8=E3=80=82
>
> On the broader point: I should be clear about how this series was
> produced. An LLM-based assistant drafted the initial localization of
> each document and this glossary; I then reviewed every line by hand --
> checking each terminology choice as a native speaker, verifying the
> "update to commit" baselines against git log, reading the text aloud
> to catch translationese, and building the docs. That review is where
> the substantive fixes came from, including the ones in v2 and the two
> glossary corrections above.
>
> The documents this series translates now ask contributors to declare
> this, and I should have done so from v1. v3 will carry Assisted-by:
> trailers and a note in the cover letter. If you or the other
> maintainers would prefer a different form of disclosure, or would
> rather I redo any part of this by hand, please say so.
>
> Chen-Yu
>
> Alex Shi <seakeel@gmail.com> =E6=96=BC 2026=E5=B9=B47=E6=9C=8828=E6=97=A5=
=E9=80=B1=E4=BA=8C =E4=B8=8B=E5=8D=889:36=E5=AF=AB=E9=81=93=EF=BC=9A
>>
>>
>> > +=E8=A1=93=E8=AA=9E=E8=A1=A8
>> > +=3D=3D=3D=3D=3D=3D
>> > +
>> > +:=E4=BD=9C=E8=80=85: =E8=91=89=E5=AE=B8=E4=BD=91 Chen-Yu Yeh<chenyou9=
10331@gmail.com>
>> > +
>> > +=E6=9C=AC=E8=A1=93=E8=AA=9E=E8=A1=A8=E5=88=97=E5=87=BALinux=E6=A0=B8=
=E5=BF=83=E7=B9=81=E9=AB=94=E4=B8=AD=E6=96=87=EF=BC=88zh_TW=EF=BC=89=E7=BF=
=BB=E8=AD=AF=E6=89=80=E4=BD=BF=E7=94=A8=E7=9A=84=E8=A1=93=E8=AA=9E=E3=80=82=
zh_TW=E7=BF=BB=E8=AD=AF=E4=BB=A5=E8=87=BA=E7=81=A3
>> > +=E6=85=A3=E7=94=A8=E7=9A=84=E8=B3=87=E8=A8=8A=E8=A1=93=E8=AA=9E=E7=82=
=BA=E6=BA=96=E3=80=82=E6=96=B0=E5=A2=9E=E6=88=96=E6=9B=B4=E6=96=B0=E7=BF=BB=
=E8=AD=AF=E6=99=82=EF=BC=8C=E8=AB=8B=E4=BE=9D=E7=85=A7=E6=9C=AC=E8=A1=A8=E9=
=81=B8=E6=93=87=E7=94=A8=E8=A9=9E=EF=BC=8C=E4=BB=A5=E7=B6=AD=E6=8C=81=E6=95=
=B4=E5=80=8B
>> > +zh_TW=E6=96=87=E4=BB=B6=E6=A8=B9=E7=9A=84=E4=B8=80=E8=87=B4=E6=80=A7=
=EF=BC=9B=E8=8B=A5=E9=81=87=E5=88=B0=E6=9C=AC=E8=A1=A8=E6=9C=AA=E6=94=B6=E9=
=8C=84=E7=9A=84=E8=A1=93=E8=AA=9E=EF=BC=8C=E6=AD=A1=E8=BF=8E=E6=8F=90=E4=BA=
=A4=E8=A3=9C=E4=B8=81=E8=A3=9C=E5=85=85=E3=80=82
>> > +
>> > +=E4=B8=8B=E8=A1=A8=E5=90=8C=E6=99=82=E5=88=97=E5=87=BA=E5=B8=B8=E8=A6=
=8B=E7=9A=84=E7=B0=A1=E9=AB=94=E4=B8=AD=E6=96=87=EF=BC=88zh_CN=EF=BC=89=E8=
=AD=AF=E6=B3=95=EF=BC=8C=E6=96=B9=E4=BE=BF=E5=BE=9Ezh_CN=E7=BF=BB=E8=AD=AF=
=E8=BD=89=E6=8F=9B=E6=88=96=E5=B0=8D=E7=85=A7=E6=99=82
>> > +=E4=BD=BF=E7=94=A8=E3=80=82
>> > +
>> > +=E4=B8=80=E8=88=AC=E8=A1=93=E8=AA=9E
>> > +--------
>>
>> This is related with copyright. At last, you need to ask the original
>> author's permission, and give a reference here. I guess...
>> > +
>>
