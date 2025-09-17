Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A881333AB7
	for <linux-doc@vger.kernel.org>; Wed, 17 Sep 2025 15:25:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758122702; cv=none; b=RUBJqkhJDXecS5+V8nMxpfI9tpaVxfU3Cf9eBiVoR4GDJpT/u1osUoFC2xy5ABgP/6OG62RsVaSioEmwlOoNgSoxQ2yhufz3aGNKbCzGj82Xz69KIh4zCQftSJ8aCLHaEtLD3aIP/rCiNg9y5UBxrw3uefZaJl1gCdqXNoptT/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758122702; c=relaxed/simple;
	bh=le3rR+Y/6+X3RB7WTCbO7Z1Cx/tQDdq7HqEHt580Kts=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mZ4jDrPUTthmu4V6Vm466gT2858rkfuuN4JWugvF3AzjHe/ndEXZXkIYr56TNiXL50N1kIThwvG5DoUP1KNqE+96/CxdVYFC+oAvlCIWlfZWSZ8pBSUcRD4sE61JaOmXtcaLhWdwSKA1weTpeuQhv5kVnP7YyF7TsKb/tQ/Hu6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UecDoJdN; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UecDoJdN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1758122699;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nOCE7GBioLoeEPVZjsvaFHh39u6q73Q5ex3kMGocTYI=;
	b=UecDoJdNPzzHKwmqpU8hn10PEscwt1wWNUC/BWxE4CBcXQYHduBKQh1RWGJf8+YXvalAbK
	Bz4FR7B+tMgdv38jtC7PrYfNNIDJeC8vQiFi/bCKm64ESDaSg5h9xKRIo6pqLPffdRFQbO
	mutaJ5J74Vn4hRhmkueoNdupaolmFE0=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-387-Oxmu0i8LO3CDn8NLO066vQ-1; Wed, 17 Sep 2025 11:24:58 -0400
X-MC-Unique: Oxmu0i8LO3CDn8NLO066vQ-1
X-Mimecast-MFC-AGG-ID: Oxmu0i8LO3CDn8NLO066vQ_1758122698
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4b5eb7b2c05so154782981cf.0
        for <linux-doc@vger.kernel.org>; Wed, 17 Sep 2025 08:24:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758122698; x=1758727498;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nOCE7GBioLoeEPVZjsvaFHh39u6q73Q5ex3kMGocTYI=;
        b=poDTK2JR+J8GGw7/6YNBTK0OqOfc6fzc1GuFd236TdE2eyVpEhhE5TBULX2CTyUtpc
         TTJ2f7K7o31wUuq+rHRju5qC4TxNDpWOncPfSZShfh/uG0BeSvW0m5vHLDKNpU059FhO
         q+HvwOgNQ0MxjhyLdcMXHboz9/zv29wisH0FM3Uynlvsogc1cnwjZpw0EFS9ZDZE9c01
         84JDVNatehFMznlizWWKtGWWG27qLCct8QwDfR6FKn1hoR5mlv3PthDZCaInBF71Ht7n
         PZp29uGZL1dKeHOu8MJR6GY4ZEu+r48toYXxXSUp4cD+WZrG/VfY0J8WYAIuloTEly4f
         O9mQ==
X-Forwarded-Encrypted: i=1; AJvYcCVj6GC+BklTiWJT6ZjWZQTNOb8IEV6rdjTxNjiYPemxYIJ7uVvHkOp4/ePQJvOilWZGXI4wRBSUeZ8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzmdPqi6vNLb45gdNXIhk45VqaxTTLLB02FEavpxMHTtUDHM8AD
	cVvkodLHuarPwOkHfonjI7NiGfiIFvclby+YUWrXQHZscTAtkHY2cHpr2R198Y0j6aJUb9PFs4j
	t+I52+E5Va6GxgT8iGVAu7Hcjzpb3S3K0+JVpoPVJKvO3kpPYWGM+ZN0Rt9Vu5F9T60DmyRzowd
	FL6WUliD8Nv2vgCJ0+02FTRmBsLBrGF+CifX2F
X-Gm-Gg: ASbGncskuSLXrO7Zqkw7fU8hr3mXAJkE9ML947I2Ul2D9R3xpng4P3CAEb3OvEgtpuq
	geSrI6N368cLDFaW7hGVwFoW2i6MN5ZL9rLTVyAKo0negchUbmXBwjiJk7AD6s0W6W3Hg7VHshQ
	2VzT9Jvvk8jOOElKxNYLPm/Om6dJJOq7vI66cJ+O478aPQ0Zxk6H7TjA==
X-Received: by 2002:a05:622a:1e15:b0:4b4:8f2c:ba40 with SMTP id d75a77b69052e-4ba6a5db701mr19915901cf.43.1758122697457;
        Wed, 17 Sep 2025 08:24:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFGX/u0/DWoQ2j8jO01gOLX81vhmFXebVct9qpuqQjgpv8prCPbkq0kI6Uh7cjMspWrlS3R3UWH++SHXByzydM=
X-Received: by 2002:a05:622a:1e15:b0:4b4:8f2c:ba40 with SMTP id
 d75a77b69052e-4ba6a5db701mr19915641cf.43.1758122697037; Wed, 17 Sep 2025
 08:24:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250910170000.6475-1-gpaoloni@redhat.com> <20250910170000.6475-2-gpaoloni@redhat.com>
 <878qifgxbj.fsf@trenco.lwn.net>
In-Reply-To: <878qifgxbj.fsf@trenco.lwn.net>
From: Gabriele Paoloni <gpaoloni@redhat.com>
Date: Wed, 17 Sep 2025 17:24:45 +0200
X-Gm-Features: AS18NWDoDDpQpUCvPoMLIIOoLe9NuL6mhF4S2DmGBGnkJMhA8eLTTv_JNTSuMdM
Message-ID: <CA+wEVJZreV0zpaNT70_FjuWwEujppsP4ZW_miqdRSfcHyXWrmQ@mail.gmail.com>
Subject: Re: [RFC v2 PATCH 1/3] Documentation: add guidelines for writing
 testable code specifications
To: Jonathan Corbet <corbet@lwn.net>
Cc: shuah@kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	gregkh@linuxfoundation.org, linux-mm@kvack.org, 
	safety-architecture@lists.elisa.tech, acarmina@redhat.com, 
	kstewart@linuxfoundation.org, chuckwolber@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jonathan

Many thanks for your review

On Tue, Sep 16, 2025 at 12:34=E2=80=AFAM Jonathan Corbet <corbet@lwn.net> w=
rote:
>
> Gabriele Paoloni <gpaoloni@redhat.com> writes:
>
> [Taking a quick look...]
>
> > The Documentation/doc-guide/kernel-doc.rst chapter describes
> > how to document the code using the kernel-doc format, however
> > it does not specify the criteria to be followed for writing
> > testable specifications; i.e. specifications that can be used
> > to for the semantic description of low level requirements.
> >
> > This patch adds a guideline that defines criteria to formally
> > describe developers=E2=80=99 intent at the function and subfunction
> > level in the form of testable expectations.
> >
> > Signed-off-by: Gabriele Paoloni <gpaoloni@redhat.com>
> > Signed-off-by: Chuck Wolber <chuckwolber@gmail.com>
> > Signed-off-by: Kate Stewart <kstewart@linuxfoundation.org>
> > ---
> >  .../doc-guide/code-specifications.rst         | 208 ++++++++++++++++++
> >  Documentation/doc-guide/index.rst             |   1 +
> >  2 files changed, 209 insertions(+)
> >  create mode 100644 Documentation/doc-guide/code-specifications.rst
> >
> > diff --git a/Documentation/doc-guide/code-specifications.rst b/Document=
ation/doc-guide/code-specifications.rst
> > new file mode 100644
> > index 000000000000..dee1b4f089e1
> > --- /dev/null
> > +++ b/Documentation/doc-guide/code-specifications.rst
> > @@ -0,0 +1,208 @@
> > +.. title:: How-to write testable code specifications
> > +
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +How-to write testable code specifications
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +
> > +Introduction
> > +------------
> > +The Documentation/doc-guide/kernel-doc.rst chapter describes how to do=
cument the code using the kernel-doc format, however it does not specify th=
e criteria to be followed for writing testable specifications; i.e. specifi=
cations that can be used to for the semantic description of low level requi=
rements.
>
> Please, for any future versions, stick to the 80-column limit; this is
> especially important for text files that you want humans to read.

Thanks I will stick to 80 chars for future submissions

>
> As a nit, you don't need to start by saying what other documents don't
> do, just describe the purpose of *this* document.

Yes, my goal was to explain the purpose of this doc, however, re-reading
this intro I realize that it uses a negative tone, that is not good.
I will rephrase explaining the it expands on top of kernel-doc.rst
to further specify the expectations from the code and the assumptions
to correctly use it.

>
> More substantially ... I got a way into this document before realizing
> that you were describing an addition to the format of kerneldoc
> comments.  That would be good to make clear from the outset.
>
> What I still don't really understand is what is the *purpose* of this
> formalized text?  What will be consuming it?  You're asking for a fair
> amount of effort to write and maintain these descriptions; what's in it
> for the people who do that work?

The goal is to clearly define what the code is expected to do and how
to correctly invoke it so that:
1) A user of the code does not wrongly invoke it
2) A developer or a maintainer can check if code changes are compliant
    with such expectations (maybe he did wrong changes or the expectations
    need to change)
3) A tester can verify if test cases are correct WRT such expectations and
    complete

>
> How does an author determine whether the specifications they have
> written are correct, both gramatically and semantically?

For grammatical purpose, probably an automated check could be
implemented, for semantic aspects the first level of verification comes
from the community and maintainer review process, whereas the second
level of verification come from selftests that should be written according
to the expectations from the code and should trace to them (as in the
example in patch 3)

Thanks
Gab

>
> Thanks,
>
> jon
>

