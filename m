Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28CBF1B0439
	for <linux-doc@vger.kernel.org>; Wed, 24 Sep 2025 12:17:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758716256; cv=none; b=DIqxIy9W2EXGENsIW9QZSeKY78nSw0Rqp8RhhiC7O0ZacrS99Y3eqw6EzybWI7d3NLASIu0/Xt6b0+YFGt3/jNHn6XpggvGZJEUQ3CnR/KNSy4lkf3sIyREt8EPOOMBmei73Jj0pZbABOfrGiBxnWQPkm6Y9kqq4jzoogK0c+aM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758716256; c=relaxed/simple;
	bh=43ScJy7wLNmjH2mCgKx92tBc1uX9OH2KD2Rx0nFjxzQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Rl5mJq8gY0sUrWhgJHJnG5wGFovbCwCbPuBbYRScrdQrQ3W0xmMtxp4Ge07zZpwQD9IUvl1waar4HlTI4xmF+/PSvgQzLN06Wu2ZDo7mt2CmgyuLMZ/tpwf6Gm3316nZXsjgCieeyxJwLvMG/BK1UEaAt5yerpcdQSmZz4x9N5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Pu2t3hUk; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Pu2t3hUk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1758716254;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=43ScJy7wLNmjH2mCgKx92tBc1uX9OH2KD2Rx0nFjxzQ=;
	b=Pu2t3hUkQzh6Vy2bUb//P8KCn7cOda9V0QX0hC8266uCae2peqeu4OvFt8vmtDHXELIkGb
	BZy9g6CJD/4/r/R8pthqbiFeimwBpAIAsmSVdgLY0A6KMMJ17eOvPU3at7pmP5Dx1yWSB7
	s/nO4pTSklfUKLbYsphCs0RBI9D4o6U=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-648-STgeFSH_MH2D-nI5qHup6A-1; Wed, 24 Sep 2025 08:17:32 -0400
X-MC-Unique: STgeFSH_MH2D-nI5qHup6A-1
X-Mimecast-MFC-AGG-ID: STgeFSH_MH2D-nI5qHup6A_1758716252
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2699ed6d43dso68338955ad.1
        for <linux-doc@vger.kernel.org>; Wed, 24 Sep 2025 05:17:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758716252; x=1759321052;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=43ScJy7wLNmjH2mCgKx92tBc1uX9OH2KD2Rx0nFjxzQ=;
        b=HLgF3x0RlBDRoUgVKXNduXJ5VCMhjmEUng2JQ/unUlh22H/KM15ApljeZ4L1+e4EIY
         7/XmBUR8ln422GPEMWewkNtox6L0KQQbXB7DlRri4JcOKjSRMo39UMXEk6wweM1BV5mq
         +llqPhx6ONOXKYCLEJOaKqh1Gn+OwS+nUWynQysCr6VaFJ/rQiWoBPfqbtaGBty3bZoE
         ZQWhGcaLLYP1Tq8zEQ5T4gJc1KABgbY4+NAypITi3iOFf4Pg7XHbU7bPi7sM68IWl4J8
         UxkcGXFXycz1HN2l/iiibJZXyUP/Cb6wBcDmBlMOgi6kxvR+t9fFgWpqBoSDeS3sUBPo
         tG8Q==
X-Forwarded-Encrypted: i=1; AJvYcCXmbalV3sbph8KbFwLpG1JzT+nT119YUcDoIrFvR4UKYL6jcRS269QZDiRXq6Oe3QlrHzg6pnYmU/c=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyc/CQgpCtKRE4566jVcT9rOD88+6HBGQ0JLR7JW1PnOCN3rtoo
	Fk5ugsF05683WRL765YB1bI0WByWactwEhYCA3TRsvP8op4G4rSuaw8iqkWIz3yCvp5wlcqcXT1
	5oIQ7ScQhdWaXPbvFSWEBj3lEQCSt/CrJ5ncnlO55ENKwqxQRunN/rCRc4hrLBX058vU7vPjBho
	c4zBMkp6x/Z5ivKZmWiiUZdyEBIkjbbtgSldml
X-Gm-Gg: ASbGncscLFhZLA+2AKDfV3qbeAEPT2nadNcvXZ06QMTJlNHkgDaS4Bo/tHiX5pjVTeu
	etSkGc5aAuboCgTrlJxRrjsa1cWcuysLpyWg4KWlEO6QfRGGb0crepJHRGtAetjE/HxGnyh1Jwd
	mMeYT4YRix9t7lDiqjG1A=
X-Received: by 2002:a17:902:eccb:b0:262:4878:9dff with SMTP id d9443c01a7336-27cc138187fmr67734765ad.12.1758716251947;
        Wed, 24 Sep 2025 05:17:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGoX3VdI0G6Fizy/WK4dTtMB9Z+FLYoC7j5niExyF7Cu27KjJ3BZdLL6gEniI2B+Td+UYJGc6x0mdk5W9Gpdi0=
X-Received: by 2002:a17:902:eccb:b0:262:4878:9dff with SMTP id
 d9443c01a7336-27cc138187fmr67734465ad.12.1758716251606; Wed, 24 Sep 2025
 05:17:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250911004416.8663-2-bagasdotme@gmail.com> <aNJ9yJ7XT4Pnsl9E@archie.me>
 <CAHc6FU7aGJZZzN8zhtnwDgXX9gVMh_fbi+sUpJ7tg1MWMa8XVA@mail.gmail.com> <aNMnSapfyfwga0Oz@archie.me>
In-Reply-To: <aNMnSapfyfwga0Oz@archie.me>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Wed, 24 Sep 2025 14:17:19 +0200
X-Gm-Features: AS18NWCa5jmffiBOp77B1fu-47YIJ8JwRk0Rn9UG9h-FDhgHGAvfBdeQ_JOjjPg
Message-ID: <CAHc6FU69a-R-u-Cr90aQMjb_75SChUa9BTSjL4AZKjuo_QVJQw@mail.gmail.com>
Subject: Re: [PATCH v4] Documentation: gfs2: Consolidate GFS2 docs into its
 own subdirectory
To: Bagas Sanjaya <bagasdotme@gmail.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Documentation <linux-doc@vger.kernel.org>, Linux GFS2 <gfs2@lists.linux.dev>, 
	Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Jan Kara <jack@suse.cz>, 
	Christian Brauner <brauner@kernel.org>, Miklos Szeredi <mszeredi@redhat.com>, 
	Jeff Layton <jlayton@kernel.org>, "Darrick J. Wong" <djwong@kernel.org>, 
	James Morse <james.morse@arm.com>, Bernd Schubert <bschubert@ddn.com>, 
	Chen Linxuan <chenlinxuan@uniontech.com>, Matthew Wilcox <willy@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 24, 2025 at 1:03=E2=80=AFAM Bagas Sanjaya <bagasdotme@gmail.com=
> wrote:
> OK, I will resend after 6.18-rc1 is out.

I have added the patch to branch for-later. There is no need to resend.

Thanks,
Andreas

