Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFBAA3D47BC
	for <linux-doc@vger.kernel.org>; Tue, 28 Apr 2026 09:39:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777369151; cv=none; b=YkwE4wZ9Uwl9lmQUjZiW5TOrgshIFISOiwfZd7skA9eeLFyRDnyzKI/ew0HkhK65uiaxH2ThWbRu+sDA43+u3zG7cmcSQRW0z7i2wKB/GIbKYdY2z5GIz+PCEkdoZPeTPK0fmTG/ZasIbuhTumkP6ehWojDF0LpZSOsj1bUVvWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777369151; c=relaxed/simple;
	bh=6FGqR85BhZJ6h8elPP/cyihqUcN7Hm8wATEVHCmTtkc=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=abEU5N5c9MOele37dKeALeqONvznWEPFnmuEjjeyl7eP+DVPE8wxUkINDK8o53pL1pQBCvUDnSrEojVjeWajI4qQ4nJVznbFlwL8Ax0h2FR9B1F7wTE+u5wp9gtHGfF3vi2/+elN8eiU+SZ4z3YboufMJfcY4IECz6QN1SeuEZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=V1xSssYY; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=Y+Vw1qtT; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="V1xSssYY";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="Y+Vw1qtT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1777369148;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6FGqR85BhZJ6h8elPP/cyihqUcN7Hm8wATEVHCmTtkc=;
	b=V1xSssYYKrvg5oGAwU6Cw3o03RdMUeTuJ+Zg90zx4WKbclgMqW7wIhFP0Zq4XTv9f3FUBi
	W34SfWy3aTMSGa3KKtzsAvexxjbeqPIOWi09bhWvv+anwCKtMg013TtkievuA+lWjtgrdx
	xo0OyOuFnx5T8ekRI/asyFaHjugLwSE=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-340-2IARIxx6Pwqvo1dpMbKFqA-1; Tue, 28 Apr 2026 05:39:07 -0400
X-MC-Unique: 2IARIxx6Pwqvo1dpMbKFqA-1
X-Mimecast-MFC-AGG-ID: 2IARIxx6Pwqvo1dpMbKFqA_1777369146
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50faf1ecd1dso232407581cf.1
        for <linux-doc@vger.kernel.org>; Tue, 28 Apr 2026 02:39:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1777369146; x=1777973946; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=6FGqR85BhZJ6h8elPP/cyihqUcN7Hm8wATEVHCmTtkc=;
        b=Y+Vw1qtT49vIliq11FhGdsyLncYtvP0zfXz2j/FcONpD/OAhoacnHV6m07cxGQZzXT
         /Rfbe0oN6xFy+0VJJuPuxKz2Ku66F8cdfD2ZoG/x58y+8RYjtZejpsl3vL4BCSQ3TYTJ
         l5x8YBMP+XxzIDins3Ki88aA+E+i3/RHvOIlgEVOY5919Hm0gqnZIVvpTG4pbjqNOCD6
         lgU97u9vpocIQYxWwXVZBaRaO7KkIqnQ6HRX/BTLJ/v8eHyNQzVFG/sUxBAcEF0KMlTE
         oAVEyk7QP/rD98JK6lEgX0T0YhCWS7C3BP2du3VnXsHZdliM3a11OmZwGUUDEs6ul5HK
         7mEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777369146; x=1777973946;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6FGqR85BhZJ6h8elPP/cyihqUcN7Hm8wATEVHCmTtkc=;
        b=iHaVucwsQ7f4U1CeHG2e+cHHAXHj/3jiZhb6zUMALrKyikL/yVwskpu4c7N3uNy7FH
         di8grmRkXwzl5LQpL02NJuN7aiaqr/xuqk/DltP81wggFWoD5v7nnHxIjWwpduwaNJga
         gAdd8/XxrzILoqUBXLeeKns7B40wO2TEzStCGFWlWNPUIp6ktHZPP7Atnvq/Bs6pbAiO
         WaY8ksbv2ajHfmvLfGSAEjOUjPrnGgwVrM4eh5oBa0gWof8tuk+M+yz2efNV9ytNu4Ze
         sjROgTp1CsGaXha9OCfa1Va7o3/MS0DB0dBfcGoMzVyIMeYNrhGIogOjkUbd40CQJOLr
         Gykw==
X-Forwarded-Encrypted: i=1; AFNElJ/q0fj2lIffwL6pDHst2g5t6hPob2mHKwokTvSTHAbfvBMvJcY1Jn8AfD6tZTQeIcq24qAA+RABoIE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzZJhDvu92s5F6VlPVgCru/7k7xfreunZDHUd9r97ezgkdkLjxw
	WwneRhzKPEaYqX+T74157Ai5Exh+MsGSkrBNeUvhqmekAgmoJoEEHiGIrcoHvKO7kfigZRk9F8z
	r1ktFjCIP3ihsmlheVQZEJ1y0wEDbNAkmE77SHxzYl3fJjimz6s5GX74UPQSeRQ==
X-Gm-Gg: AeBDietjHAelbyJrv1/Tz74H5EUA39ctYhYFhEq2ui8F+P3isXR/nblgOjQ6+ifJv3V
	qOj/Wt8lHj0C+d+CFSscGfi0bVWzEgck8urL1KnP34CJ67lNRE5RIj0pNwEYbmQPGBGYuoFBx2K
	eZ4TxUmmmanhcBxDzE3EJVBOVv4UF/PpHF8a8McGRx0Rg1D2hy4ALtSQ4Q+36SxNqWDXWjAB3Bt
	5QHL1bAplFZ1KtoQ8jRgvpxwW5apwv0lGMXB/htuSY5STu+UM2qxM6xlErwJ068IQHY4qVousq2
	cVutIEgwKe4gvLuZPf9l7HzmQqqk7uCwOUePYloZUVvIp1Q7s66CRrmyQepoP5h+QOmR7UDcChP
	7MIMViFHj7adxseGoqfE1Kju1JvTeDQX6q95h
X-Received: by 2002:a05:622a:590c:b0:50e:578e:bb18 with SMTP id d75a77b69052e-5100e1d5c86mr30854701cf.47.1777369146470;
        Tue, 28 Apr 2026 02:39:06 -0700 (PDT)
X-Received: by 2002:a05:622a:590c:b0:50e:578e:bb18 with SMTP id d75a77b69052e-5100e1d5c86mr30854401cf.47.1777369146052;
        Tue, 28 Apr 2026 02:39:06 -0700 (PDT)
Received: from [192.168.1.167] ([185.168.96.228])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5100da4d2a7sm13443931cf.6.2026.04.28.02.39.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 02:39:05 -0700 (PDT)
Message-ID: <b4a0f46f1b04462409b61f240aafbcaf6603c5a4.camel@redhat.com>
Subject: Re: [PATCH v2] Documentation/rv: Replace stale website link
From: Gabriele Monaco <gmonaco@redhat.com>
To: Matteo Martelli <matteo.martelli@codethink.co.uk>,
 rdunlap@infradead.org,  Steven Rostedt <rostedt@goodmis.org>, Jonathan
 Corbet <corbet@lwn.net>, linux-trace-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: skhan@linuxfoundation.org
Date: Tue, 28 Apr 2026 11:39:02 +0200
In-Reply-To: <d0a66f985640388ab13fda6f7d66c5ad@codethink.co.uk>
References: <20260427131709.170505-2-gmonaco@redhat.com>
	 <d0a66f985640388ab13fda6f7d66c5ad@codethink.co.uk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Matteo,

On Tue, 2026-04-28 at 11:11 +0200, Matteo Martelli wrote:
> Thanks for addressing this. FWIW this looks good to me, however I've
> just noticed that the same article is also referenced in
> rv/runtime-verification.rst with a slightly different format and no
> link. I think that it might be more clear if we had a References
> section in rv/runtime-verification.rst, add links to publicly
> available articles, and then let the other pages point to that
> section when needed instead of duplicating the references like in
> this case. But that could probably be addressed as a further clean-up
> patch.
>=20
> Acked-by: Matteo Martelli <matteo.martelli@codethink.co.uk>
> Tested-by: Matteo Martelli <matteo.martelli@codethink.co.uk>

Thanks for the ack!

That's a good point, I agree it's better to go ahead with this small
patch and I can make a deeper documentation cleanup later.

Thanks,
Gabriele

