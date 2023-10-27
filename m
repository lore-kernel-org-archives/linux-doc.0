Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16D65BA26
	for <linux-doc@vger.kernel.org>; Fri, 27 Oct 2023 07:16:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ncf.edu header.i=@ncf.edu header.b="ZI2RVfhu"
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34069D54
	for <linux-doc@vger.kernel.org>; Fri, 27 Oct 2023 00:16:28 -0700 (PDT)
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-53e3e7e478bso2653057a12.0
        for <linux-doc@vger.kernel.org>; Fri, 27 Oct 2023 00:16:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ncf.edu; s=google; t=1698390987; x=1698995787; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8ddgeFEbz6IlrCxVYwXYFwysgYH7+uLRZ36rsStSaFs=;
        b=ZI2RVfhuEZzJ/JoL0Xpdcsw7msBbgNhfcgZOGbKeJVv+w9xbeFYiwWBibCvvraKfs1
         D5YFRIqLDSeSAZnp08wY1G27bsklWxYpPZpT4zCIS2U/MLHHIRgoDti5yx7rBTotw3hv
         NJ36ehXDgM51ZM9YsftT6NO8HuYO2IzRGcG/6aqEZKKOHfiI/YUHvvNI+WkQZ++7WdaA
         r71pp5YhDZH4g48/QUYkyl6XvW5PbxoxIXoQk1IqW/kyGRjfaowL7FM/DJKN93oNnQmz
         DTv9oCis0JkVOH4p0NyFj0L0YWg68dh57/wyjaEjvptZbW3ACsvmUDBYtSZWJ2F5fgly
         aPEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698390987; x=1698995787;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8ddgeFEbz6IlrCxVYwXYFwysgYH7+uLRZ36rsStSaFs=;
        b=Ul/IiglSQNbP0JQybDF9HiwC4AyCOEOe+jjPIg2lpNg6H/NcEpbK9kCdYxSHFioRTL
         WOifCDjksJQsb8+92+61bBII3QdjQPENpO1x3n/ybMfdk6WupmdzFEB64/SsnB4ED40M
         UN0rpKbWoytpO/NkIr3DuhBR7qJu9qlemsMDTtHcgd71blnJjy8NBLoLUb0aZjdl8365
         qfVCZwYG2gqRY8e1zricR5owCKtAIsPN+I6RHtk0MNipVqyUmIz39TAFG8/Xa4Q6h0eK
         4Aze/AT+ijgoWKHNtKfHB6m6U0C4PfKhGPDhfGLnlVrnMqmtbsmSf66cqs+JwBRsHjXP
         oEYg==
X-Gm-Message-State: AOJu0YywkOfTDLnwbc3EEeJqIWwJqj2BIJ0en4lRTbg9KZw2/oNaRsLA
	CNay1Exa5IHnfII8v/DnIEJ/u/txHGAj7BGGiwhipg==
X-Google-Smtp-Source: AGHT+IE8Eg+gl1oUKbvd40VC6iGtzQrs1ua9ZwoVLBt3jaZI183+rzT7zw+HfCSU4qDQDGAb5C1GjDHUNXLe5IpaIQs=
X-Received: by 2002:a17:907:2910:b0:9c6:724:fa1f with SMTP id
 eq16-20020a170907291000b009c60724fa1fmr1128697ejc.66.1698390986930; Fri, 27
 Oct 2023 00:16:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231027041023.16681-1-hunter.chasens18@ncf.edu> <4257cc2a-c116-4a5a-8c4e-422e67258525@infradead.org>
In-Reply-To: <4257cc2a-c116-4a5a-8c4e-422e67258525@infradead.org>
From: Hunter Chasens <hunter.chasens18@ncf.edu>
Date: Fri, 27 Oct 2023 03:16:15 -0400
Message-ID: <CAFJe6O1UWXm-yhr+q2bT_Zt1wH8W-=XcvJsCV1JZo9irrL+hNw@mail.gmail.com>
Subject: Re: [PATCH] docs: admin-guide: Update bootloader and installation instructions
To: Randy Dunlap <rdunlap@infradead.org>
Cc: corbet@lwn.net, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thank you for the catch. v2, has just been sent.

On Fri, Oct 27, 2023 at 12:41=E2=80=AFAM Randy Dunlap <rdunlap@infradead.or=
g> wrote:
>
>
>
> On 10/26/23 21:10, Hunter Chasens wrote:
> > Updates the bootloader and installation instructions in admin-guide/REA=
DME.rst
> > to align with modern practices.
> >
> > Details of Changes:
> >
> >  - Added guidance on using EFISTUB for UEFI/EFI systems.
> >  - Noted that LILO is no longer in active development and provides
> >    alternatives.
> >  - Kept LILO instructions but marked as Legacy LILO Instructions.
> >    Suggest removal in future patch.
> >
> > Signed-off-by: Hunter Chasens <hunter.chasens18@ncf.edu>
> > ---
> >  Documentation/admin-guide/README.rst | 71 ++++++++++++++++++----------
> >  1 file changed, 46 insertions(+), 25 deletions(-)
> >
> > diff --git a/Documentation/admin-guide/README.rst b/Documentation/admin=
-guide/README.rst
> > index 9a969c0157f1..fba66f909f98 100644
> > --- a/Documentation/admin-guide/README.rst
> > +++ b/Documentation/admin-guide/README.rst
> > @@ -252,7 +252,7 @@ Configuring the kernel
> >      - The "kernel hacking" configuration details usually result in a
> >        bigger or slower kernel (or both), and can even make the kernel
> >        less stable by configuring some routines to actively try to
> > -      break bad code to find kernel problems (kmalloc()).  Thus you
>
> I don't see a problem with the above notation.
>
> > +      break bad code to find kernel problems (kmalloc()().  Thus you
>
> This way has unmatched parens.
>
> >        should probably answer 'n' to the questions for "development",
> >        "experimental", or "debugging" features.
> >
>
>
> --
> ~Randy
