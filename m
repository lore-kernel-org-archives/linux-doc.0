Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03D0B2E8B73
	for <linux-doc@vger.kernel.org>; Tue, 21 Oct 2025 09:42:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761039760; cv=none; b=RGSef+NGtX0HTvbJS0g6yeLlxL2+xGFBzFbEDkzmN8m+xk4DrpBsuYY4QpfGgx6lDu3R4mEHRphCt4a6VcfKR+gemRmtG4s16RZakxvhDjYKpNy8HecXvw7iItSIINADbfHZS1jASJBe67lzlYuCCGdchO/jl1EqCMmrjptVowU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761039760; c=relaxed/simple;
	bh=MSVMapS+wT8A48mbedXknuF6hMRfcMnPOR8fjkLNzBQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RA6JyCPPnxTGLGFi5WaQVo29eeMVb6nEIHW7QkYOM/ZqE60KGSTgmS9kTRk2zcXk+zKvIwFQcRe4tOo0FPpm9UDRkCvQOm3hKMyCV8Iu8jm1K9bMhEt4vPps8alGvzOrrCinLAsnNS7E6eYy6H7bJeLoCp8jxzLD3BvMtM7hj/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=cYxy82pA; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cYxy82pA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1761039757;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UHjS/qyeeKcJ3eN+7yFgpurORtwwe8MoT2GpgobO51M=;
	b=cYxy82pA+fjtnSs8kfgHcNsl0wGBbBsMQRBG41ACA+7CSNb/OBrgqAsEvNwLN+uFxeSpKC
	vYQaljoIpmyKo7wWCx5axfcPv0WBde3JufWEFIttmhBsoZCjqcgvTBdiXpvwMOo+2s6ojQ
	47yTjQROpASezdVVcLzBmaTKGKh7+bw=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-653-k1hPat_3OfqB5C-6RP9w6A-1; Tue, 21 Oct 2025 05:42:36 -0400
X-MC-Unique: k1hPat_3OfqB5C-6RP9w6A-1
X-Mimecast-MFC-AGG-ID: k1hPat_3OfqB5C-6RP9w6A_1761039755
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-88ef355f7a3so2366432585a.3
        for <linux-doc@vger.kernel.org>; Tue, 21 Oct 2025 02:42:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761039755; x=1761644555;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UHjS/qyeeKcJ3eN+7yFgpurORtwwe8MoT2GpgobO51M=;
        b=EIMC0slxcKAmw7aKsJ/gXt0Fl616s/SFLR84Q6z5VG5CtF88uQ+nRZJOSBo2dmIi2Y
         48LeORJ5N4eqK6g1SqVxBS7WAZOAvt5QYHqbC+fcZBujPuKj2iFZXog3FL5G4d4ZQgIV
         c/jUg5XTgdvWrlO/Z5q5tCgyEY4qWA/endfU+CwEC3WbkgI6KDcPVCcyjQmLSbXROIzR
         5F43EzFXo2xmit7UKWreXRLhvnqxO/ouzDMcjGvpAQBWKjIdcYuRaHhenAQShP3SrGM/
         NPbZVcLMRoL3v0T2UcNzw5dsYrTG8Z410oHlGY2M5XAaZk7om8WcOOsRnhzlJvQijWwB
         avIg==
X-Forwarded-Encrypted: i=1; AJvYcCUFnyAfFg9h3DRrUKT1kgeCbZHBJOKrnzf3JvYvQB0gZ6bTMJeO+uAg2r7DKvI1xV9LdDseISzCtro=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1yC8ZI6KpWY0t5UDLm26AiRYjhYgO99ks+eGyKkOVaFmf1HAu
	I4s5mK/MmreicQsUopb3mGF9dE66JY9D2Ejmq1eipz+Xzpc39Vqutg7kGuP3Ri3edG42pEv9ccv
	WECt8O2QwSs/GyUwgKxEp1I6zgmbPxBIwAEY9Fm1wzJIuchF7bz6Yf2Ch8Vlz7vbPsQ9vc04LXw
	EJq3sWW/qmdZlf3jY+hOR8XmjOZuNd+mR2agly
X-Gm-Gg: ASbGnctAwWZJvH4hTrwnfA7+77XpHDw/3av9BKh+m8ZFI4gzurCH8PETQjBzKgG3x4X
	45iplI+vT50c/nFBF5xvB+jHtKcpXbp8UpBx/uY1hqLwNqnCg4LZuIULFPyK93DC2CMcZmBjQHZ
	Y+eu6IPGZ6qKPzHeEdEU/sY7w6O34k9n5+ZlIsqDzxA3zfEeSoFrcqCTpRr/bTX44AhKZfn5uG2
	7gw++DakrGO1JFV
X-Received: by 2002:ac8:5712:0:b0:4b0:6205:d22b with SMTP id d75a77b69052e-4e8b679b7a2mr115979231cf.52.1761039755351;
        Tue, 21 Oct 2025 02:42:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGtJWXOjke0RTmK0/xZXoqnt4Ou0KacBj/M07aRFHuZEpUI1vDSqa7DdT8a6/Yrxfq2QlaYBVOMZ0kPdqztzzI=
X-Received: by 2002:ac8:5712:0:b0:4b0:6205:d22b with SMTP id
 d75a77b69052e-4e8b679b7a2mr115979131cf.52.1761039755012; Tue, 21 Oct 2025
 02:42:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250910170000.6475-1-gpaoloni@redhat.com> <2025102111-facility-dismay-322e@gregkh>
In-Reply-To: <2025102111-facility-dismay-322e@gregkh>
From: Gabriele Paoloni <gpaoloni@redhat.com>
Date: Tue, 21 Oct 2025 11:42:24 +0200
X-Gm-Features: AS18NWBpQWaCgTUPFKBGe-mp83ffIdDKrAgAWm46CipP2yYr5wYthLbhuHqwos0
Message-ID: <CA+wEVJZEho_9kvaGYstc=5f6iHGi69x=_0zT+jrC2EqSFUQMWQ@mail.gmail.com>
Subject: Re: [RFC PATCH v2 0/3] Add testable code specifications
To: Greg KH <gregkh@linuxfoundation.org>
Cc: shuah@kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, corbet@lwn.net, linux-doc@vger.kernel.org, 
	linux-mm@kvack.org, safety-architecture@lists.elisa.tech, acarmina@redhat.com, 
	kstewart@linuxfoundation.org, chuckwolber@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Greg

On Tue, Oct 21, 2025 at 9:35=E2=80=AFAM Greg KH <gregkh@linuxfoundation.org=
> wrote:
>
> On Wed, Sep 10, 2025 at 06:59:57PM +0200, Gabriele Paoloni wrote:
> > [1] was an initial proposal defining testable code specifications for
> > some functions in /drivers/char/mem.c.
> > However a Guideline to write such specifications was missing and test
> > cases tracing to such specifications were missing.
> > This patchset represents a next step and is organised as follows:
> > - patch 1/3 contains the Guideline for writing code specifications
> > - patch 2/3 contains examples of code specfications defined for some
> >   functions of drivers/char/mem.c
> > - patch 3/3 contains examples of selftests that map to some code
> >   specifications of patch 2/3
> >
> > [1] https://lore.kernel.org/all/20250821170419.70668-1-gpaoloni@redhat.=
com/
>
> "RFC" implies there is a request.  I don't see that here, am I missing
> that?  Or is this "good to go" and want us to seriously consider
> accepting this?

I assumed that an RFC (as in request for comments) that comes with proposed
changes to upstream files would be interpreted as a request for feedbacks
associated with the proposed changes (what is wrong or what is missing);
next time I will communicate the request explicitly.

WRT this specific patchset, the intent is to introduce formalism in specify=
ing
code behavior (so that the same formalism can also be used to write and
review test cases), so my high level asks would be:

1) In the first part of patch 1/3 we explain why we are doing this and the =
high
level goals. Do you agree with these? Are these clear?

2) In the rest of the patchset we introduce the formalism, we propose some
specs (in patch 2) and associated selftests (in patch 3). Please let us kno=
w
if there is something wrong, missing or to be improved.

Thanks and kind regards
Gab

>
> thanks,
>
> greg k-h
>

