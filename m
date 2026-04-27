Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E2DB3BBA1D
	for <linux-doc@vger.kernel.org>; Mon, 27 Apr 2026 12:56:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777294614; cv=none; b=Caia4CWMXPoixj5tbd5yPpS7hEZLLlpYa7bowcD1OhC5IKFtmvQG6NsDpxM6Rwfk+T09u+2tYLR8v0vIteN7VXmvkpMTQrf0Hn4TQlnAkua/sU1M4YKI/PHJcKML2odQNK/SRBV+IZbtY2lN8q/OQgvuXUR/cElkTim4l4R835s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777294614; c=relaxed/simple;
	bh=KedIuWX1a4sKhpzql75Dew+nPjQpg/hAa4LZaYM7SwE=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ZXSu1IrjoE5xRnsmpvY4eYODKD4kBpAk41A1keo+6LJ4LHhmJbB1P+wqOPSq40y6NMqEWOA1PO+ux5H7uDFxDhgSkLQ9LlobhSAb4KV5XvAUGDkDV8FZTvMtgE34T5By99PTTSLcnSPwnTaDcRLLWTnc84hjne8bHUl8Yotwhpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=E0UhSOVy; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=WRyl9EVF; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="E0UhSOVy";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="WRyl9EVF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1777294612;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KedIuWX1a4sKhpzql75Dew+nPjQpg/hAa4LZaYM7SwE=;
	b=E0UhSOVyDqE47e4eWs/cOa338IG6ro9qjnw88HAPjJcPuGohgew/N53+CdGJ700DmAv7Hh
	mDIYRPDHAv0Q+q0Ig5+kCMr3+RGpcqWr1z4jYfFV9OczDKvhsHDooJqfEe84mtCFctKvPr
	Sat/mhUJowaCMbMmLxryqVhMGz2Kek8=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-664-QLV9wMYEOCuultU85NiqYQ-1; Mon, 27 Apr 2026 08:56:50 -0400
X-MC-Unique: QLV9wMYEOCuultU85NiqYQ-1
X-Mimecast-MFC-AGG-ID: QLV9wMYEOCuultU85NiqYQ_1777294610
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50d812c898cso270721621cf.1
        for <linux-doc@vger.kernel.org>; Mon, 27 Apr 2026 05:56:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1777294610; x=1777899410; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=KedIuWX1a4sKhpzql75Dew+nPjQpg/hAa4LZaYM7SwE=;
        b=WRyl9EVF62T2xVd5iOqjcvQ30qsAb0X95uxTB42iW1KGNb0v9RR2H0t4nGD2Owjyg6
         AvsmrVM0QJaVh5jw+0oRTkBINuvDRwQ9xKg0BDNyPhUjm40ZyFn3Y2EpPFaygDV3MpCv
         sTdKVmsWPITEU9EL5qxqte34aVMY/doPS/8dIsJD3E9jPFoulBni7sVq2Qz/rRyhhylM
         IazpuZ9t/ssIsIKgg7l41o7ALIXSiEAZ0ITAjoRzOUUbtO3eBcbt1pUWn0eiqqAPlQYs
         /XCpj4AR+bwfIlOZBI7HEFhSXUL8yxbVNp6ml+W+7bEBlAdO1XLAEzyT+Q+jBOko9cnC
         Nu8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777294610; x=1777899410;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KedIuWX1a4sKhpzql75Dew+nPjQpg/hAa4LZaYM7SwE=;
        b=ITo8Yh6o5t7pFjoJ1eLcsJTytEfOEzjDa6EP+HvLzdW8Lrx6dPz+SO0PSB6gaNUbCD
         9uNSTf+fAi1Cza8hbRn/+EV+baDpn9dF0SDvoXMsAfsOH0dLDxdiBS3Pmdmuj3UlLC7I
         MVi+vJjs6I13hBT/3sHeWzX1ilnoKlPH3JdIZnSMoQn/zCxvlQu353zgPQP08SufLV65
         h6oKCgHSUUsjPHYeatGgbqADYMWxsUT29ND7OqgcUBwGFH7muGJhbAI9VKu5OiuC9tNj
         thUAlsgch8W3QC/MtKDOqY51wHgyHLaIErstDEX+ydM+QaMyiZf84MDm+mLZSOC4yEGW
         KFqQ==
X-Forwarded-Encrypted: i=1; AFNElJ+gKSHWGA7oOBEjpc4CDYM8E+rQBBm5wLg8WIkxVvTAK/Q010UKGUvuHnLgAIAXSdvUau8A9zTWwJk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyHCcYNet3YdAEbc9hYLcZIbFPVysqwR5srrz0gqnR/mS4cFWQC
	+w4J42EQkRPwBg25AQlHHd2Q8ZCeP1ReHtr82WrpmBgc3FYkcmP7szZeuL6xwPJR8YXf9qTj/Gz
	bR1qU/HrInGQuhFZzP/D75qlGLgghKFI5O5CKqJjqWtKxIixpdiRWIcgciM2rNA==
X-Gm-Gg: AeBDietynuow1kr7xaXEupYz5N6Hfg6phFQFVc/6uQiA8J3HTSnCV8Ka5qGZjZ46p8b
	B8xEBWmGFDtpjYe/SNh4OhekQZ59QIcCM2ov2YQnqT5yAEWH44Sh749H2fSc1qu5VUxXnsVA9kg
	HIrXUNqrUgxbSHvOVySQmO2nxEkY5Lh6FvtFrpUvtve37WRVpdKxahi8l/MZnh4h01fIyk/7uoE
	CBNLlnT/pM1JVMOJXs6cOercd7Xg/DIEnGyG5s1NxfvK6sUuLmzGcIAVON/mmmd+yayJBqWnhbg
	H7pLB4SMjHV8J/odG3t9sdzsWkqfhgp5thOUw0KO/vJjzswy7oY3UtBp2EHaprhMJX4OufRvQT5
	srgvAoMXV/hvyX17D0gAzVUujQfUhrLji46iF
X-Received: by 2002:a05:6214:e4e:b0:89c:cfb1:b59c with SMTP id 6a1803df08f44-8b0280cc0admr676933626d6.23.1777294610388;
        Mon, 27 Apr 2026 05:56:50 -0700 (PDT)
X-Received: by 2002:a05:6214:e4e:b0:89c:cfb1:b59c with SMTP id 6a1803df08f44-8b0280cc0admr676933216d6.23.1777294609829;
        Mon, 27 Apr 2026 05:56:49 -0700 (PDT)
Received: from [192.168.1.167] ([185.168.96.228])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8b02ae5ec2dsm266550076d6.29.2026.04.27.05.56.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 05:56:48 -0700 (PDT)
Message-ID: <93666b516d93f880ed14c3b9309e203014a7deb0.camel@redhat.com>
Subject: Re: [PATCH] Documentation/rv: Replace stale website link
From: Gabriele Monaco <gmonaco@redhat.com>
To: Jonathan Corbet <corbet@lwn.net>, rdunlap@infradead.org, Steven Rostedt
	 <rostedt@goodmis.org>, linux-trace-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: matteo.martelli@codethink.co.uk, skhan@linuxfoundation.org
Date: Mon, 27 Apr 2026 14:56:46 +0200
In-Reply-To: <87340gpvdg.fsf@trenco.lwn.net>
References: <b845c448-1655-4860-9b6d-93d6f8426740@infradead.org>
	 <20260427085526.111835-1-gmonaco@redhat.com>
	 <875x5crb4g.fsf@trenco.lwn.net>
	 <6d7e529c7cb0ad599669e3f33e5b6168e92a8861.camel@redhat.com>
	 <87340gpvdg.fsf@trenco.lwn.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Mon, 2026-04-27 at 04:09 -0600, Jonathan Corbet wrote:
> Gabriele Monaco <gmonaco@redhat.com> writes:
>=20
> > On Mon, 2026-04-27 at 03:44 -0600, Jonathan Corbet wrote:
> > > Since, as you say, it can be found online, is there a reason not
> > > to include a link here?
> >=20
> > Mmh, perhaps being overly cautious for the link not to break again?
> >=20
> > The paper is published so I assume it's always going to be
> > available in some way. It is currently hosted by the university at
> > [1], which may be unlikely to change, and can be found via DOI at
> > [2], which should never change (at least that's what I believe a
> > DOI is for) but brings to the publisher's website rather than the
> > open-access PDF.
> >=20
> > I think the reference to the paper I included is robust yet easy to
> > use with any scientific or even general purpose search engine. But
> > if you believe using either of the two links is more appropriate, I
> > can send a V2 with the change.
>=20
> I will defer to others in the end, but to me it seems that we should
> make life easier for our readers whenever we can.=C2=A0 Providing a link
> seems better than requiring them to search for it themselves.

Alright, makes sense. I'm going to send a V2 with [1] (the open access
PDF), in the remote case the link stops working, we can update it.

Thanks,
Gabriele

