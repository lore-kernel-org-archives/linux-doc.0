Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E59C348883
	for <linux-doc@vger.kernel.org>; Tue, 28 Apr 2026 07:06:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777360005; cv=none; b=DDEu/ASkVY+ZhY1vN4nnrOJrbs6Be8Vqe9ISxMV5/UAzfuIUVSAHa4dXHXfsgMlcFsqGpsE9zjsiQEIJS2/vxw0hXrd/Lf7Za5qA1jl9PflklGBd3ocfvRfB4ZN3yuHlZQ/we5U1I+oozccQICYYrGMyDj/xivTHJUv6OWPl//8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777360005; c=relaxed/simple;
	bh=jWnnU2GAmGy56FDiHBeXBrscnH0kfpAc22pKr7Qeghk=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=XIiXxisqtXC5Hj5pVcEQHDV1g7albBZvSiSer5xsxGxSckgSrt3u/hkumb3/14vB51hVTuYS1V7Wu5KFs17XwTG7UZlfRrfR1DNKbNABAwKQgDuzIyoLsYhMzb8jksRlJWQF27lc+IhNTdTnbYvCSuv7PpYb2cqx67XOwWtTrCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZbxL3vAl; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=pp5dhrH/; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZbxL3vAl";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="pp5dhrH/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1777360002;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jWnnU2GAmGy56FDiHBeXBrscnH0kfpAc22pKr7Qeghk=;
	b=ZbxL3vAlyoygkV+HaA3uF04MxDOWg6JJXYMAok2+PLYscsH7U34v4jLebDM1dTYnYrALZB
	54p22waliRjweL+BgCI54NQegQU1BelTTbDUifUnQmQHzmIWYWTCIfTS1e7RgafdAB5U1f
	6dRt6Ti1aBYreCMtAuKO0lF5rUu+LjQ=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-75-UzSyV6PSOSyiLlEpFvpykQ-1; Tue, 28 Apr 2026 03:06:40 -0400
X-MC-Unique: UzSyV6PSOSyiLlEpFvpykQ-1
X-Mimecast-MFC-AGG-ID: UzSyV6PSOSyiLlEpFvpykQ_1777360000
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50fae95c82cso211357381cf.2
        for <linux-doc@vger.kernel.org>; Tue, 28 Apr 2026 00:06:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1777360000; x=1777964800; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=jWnnU2GAmGy56FDiHBeXBrscnH0kfpAc22pKr7Qeghk=;
        b=pp5dhrH/0usOQa3NvCT8JEgc8pOwCarx0UHHS8XxMR5xQEQhbdn4oY/YedIeSdhLmH
         PKgmVcfVx6i81S52FBmx6HdJWnp/e2cp0L7E5hE+G9yuJZztZIVz/MS3Zrp2Bt4Kg95W
         R3OAIFaWQ05uca7x3SuNBvWN28CjqSxOuVuBEXCFW1qmW3uujwLTCOTPieS1Fs1LiopW
         NNU06dgTWwE8lrJmrEVf+0umsN+wncNl4u7C0xTG/3wxsxLspjlH+raqsSaFUEx3K5fK
         nYsI89UGxYC33i6gn8iNT/o4wUJjhAe3H4uXPXD1PNMBg/OanBsVYBXj9kCc3Pw9g8Fd
         ngQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777360000; x=1777964800;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jWnnU2GAmGy56FDiHBeXBrscnH0kfpAc22pKr7Qeghk=;
        b=ezfbMdhDzunIEy1iqyCvXesAOGlVgoXx1CqaVkDpNuN27vXwS/Mk5b6KDsj5d4GeWT
         zIaT954qDF9M9ns1WR4odHDN8RNHamWlhOVFFypEsf7o9OOiP3dQ6Bz2pBxh6GWYNfEX
         XouNCHDL1DmnASnEGDsunjpfeyO8Wl0V98glNso+XgukoHAp4YKlkNgZ4r6V9Segf7/L
         P+aMyNtHFQHRUHNF/+jGMGoMAHDKEgsGFq5G/XD1ea74D7YQ91jQQXIYBtBqOh7VyNlU
         QtL4GOSdhfenBmqBxGoFtHMsret0s7mFXvgvgRTgXLRFgmEMuG1XdMY2va6XTVSw+jDl
         5c9w==
X-Forwarded-Encrypted: i=1; AFNElJ+JJKrC6d7Ktc8WLaNGtq+GRLNCsQR8mbygBE7UHS9AsyUCtUyECDi+fCRF7+Cw/zkY3DcyDntuEoM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyDzqXLp1l1V/v/U9e3QTinBkf7E22eVu5Sg+Mw+QbhMTzvu/oR
	n/8NWCh8qPVgBuD2967D1+Rjl7+7PQ8wuqAqnGs1bLPxWc6p66joeVOcpSDwFo6HvjX51LORrdR
	uKay4HEVyRyk+wDOCUb7tZtFkEEo634hJ5/m1RKnolquUI/F0PxCAOpitIzxs/YmG5/xJRg==
X-Gm-Gg: AeBDiet6kk/Apxy2bMaWZYddQlF/dESsetmAfXLm9wwE73HFW137zHajMuvNdUTLZWO
	A8Y+OrsTKapbLgR39E4mc96zMEs71uLmad3cdG6biTkoz5OqCGrzrUl01rNUT1CcNd/LNvC6eqy
	BXLYQiwVoXDh42TuvSPmkUTY+beRQr0ZSNUguuu0ZtDUGlyAeZZyZ9rAzlcfRIdTlr/f4OVEqJB
	lbdyhoN8Wva+2F7Zn3lKK6tVo3PYgdUJCR3ZLTpkXZHODSL3M6wq0HAh4zWkn+PCIgZPEvnnTbN
	F9hj6rH/iLu0z09auFkS7H9yMz/cZkLYImVLY5dASpa/hy80kNYUZTv3dKLQIRzoqgFMRAihw6D
	azabBtggwLcl5wkQdTJHIXXMrh9CYToOMEHHC
X-Received: by 2002:a05:622a:4d06:b0:50d:9033:f2ec with SMTP id d75a77b69052e-5100e1db2fdmr23108291cf.50.1777360000217;
        Tue, 28 Apr 2026 00:06:40 -0700 (PDT)
X-Received: by 2002:a05:622a:4d06:b0:50d:9033:f2ec with SMTP id d75a77b69052e-5100e1db2fdmr23108031cf.50.1777359999774;
        Tue, 28 Apr 2026 00:06:39 -0700 (PDT)
Received: from [192.168.1.167] ([185.168.96.228])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5100db89c03sm11207781cf.27.2026.04.28.00.06.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 00:06:39 -0700 (PDT)
Message-ID: <75eeb7196b3e65b4b5d5144f87aabd8b57793ebc.camel@redhat.com>
Subject: Re: [PATCH v2] Documentation/rv: Replace stale website link
From: Gabriele Monaco <gmonaco@redhat.com>
To: Randy Dunlap <rdunlap@infradead.org>, Steven Rostedt
 <rostedt@goodmis.org>,  Jonathan Corbet	 <corbet@lwn.net>,
 linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Cc: matteo.martelli@codethink.co.uk, skhan@linuxfoundation.org
Date: Tue, 28 Apr 2026 09:06:35 +0200
In-Reply-To: <f841e9f6-9d0b-4e10-a930-fdd74a74b9b9@infradead.org>
References: <20260427131709.170505-2-gmonaco@redhat.com>
	 <f841e9f6-9d0b-4e10-a930-fdd74a74b9b9@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Mon, 2026-04-27 at 09:50 -0700, Randy Dunlap wrote:
> Tested-by: Randy Dunlap <rdunlap@infradead.org>
> Acked-by: Randy Dunlap <rdunlap@infradead.org>

Thanks for the ack!

> although I don't care for the "J. Syst. Archit." abbreviation.
> Does JSA use that? Not that I can see.

That's the citation format I got from semanticscholar.org , it's indeed
a bit ugly but it's apparently the ISO 4 abbreviation [1].

Not sure if it would be neater to just use JSA which looks more
official.

Thanks,
Gabriele

[1] - https://dblp.org/db/journals/jsa/index.html

