Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABCEA3B47DF
	for <linux-doc@vger.kernel.org>; Mon, 27 Apr 2026 09:58:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777283885; cv=none; b=j7SL+pNsFxH1UQVWhJfCQAe8U/JPNjNzHo02KL12/LMvhCYo05zpxNBQqVTVXy0gm8y8+8eyF4uolfOucaEHpl3OzOwV3B+0EDPrF58kxaOZRMj9TTjHAHM2WYvetNJ5PxYuBWIWfOFwloQADxdJkvc1QIUB/VCGVLd6pO6W5e0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777283885; c=relaxed/simple;
	bh=UBAKpwSgVQhj2CDVJ5Ec6/hyakm5YYHivnrEGULpfaU=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=MwToWWFDSseBX++jXcFohWxaLs2rvatKNp5sPRBFrh2G8uZhqIMhCKiySnH2WoLjkQT94VVgtqxmvTI3kuquU7Di2M/W8/LMtaTABG3AEgfOQu04YCxYpXfHqmVEZid38Q0rC8or2RzeNCL4lrOj0XYWu0x6aTVKFpFKRcvo+RQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=F/ExpIXI; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=XkgOp4jf; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="F/ExpIXI";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="XkgOp4jf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1777283883;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UBAKpwSgVQhj2CDVJ5Ec6/hyakm5YYHivnrEGULpfaU=;
	b=F/ExpIXIqzDBvkwV5Da6H7LGTBkZpMTd+1Jkh8hEyS+R0LtuSenuD6Q2R2rznsWv+znxBt
	1BhukisyV7k3gmv/2rSzGJT3kiPbTunSJ2oLFBmeTph0IEVqOl8qyOgkVHNLErJ1cEcUNk
	QAZiWPUmEFRFL20Rgapcz2znKqNQ6FE=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-35-qWzQ1Sf3N_SXq3PHvOybCA-1; Mon, 27 Apr 2026 05:58:01 -0400
X-MC-Unique: qWzQ1Sf3N_SXq3PHvOybCA-1
X-Mimecast-MFC-AGG-ID: qWzQ1Sf3N_SXq3PHvOybCA_1777283880
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-43efc93e4f6so8016507f8f.3
        for <linux-doc@vger.kernel.org>; Mon, 27 Apr 2026 02:58:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1777283880; x=1777888680; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=UBAKpwSgVQhj2CDVJ5Ec6/hyakm5YYHivnrEGULpfaU=;
        b=XkgOp4jfzC6GDyyPSJ8KAOTtEZET2hSOow3+JKvK/HdCAUMNoLlTTvbXjpeHtbYe5h
         iRtMT2XQxwGkvnwWS/rmZDkVUNwkC/kyaOJ3HTmCxnMGu/0iv0Ppg8twQK2AlsHUhDBK
         8FyWroT4aRteCTUXf0H3dXmIjJDT9UOyfZ/6LZrlXWpyz9VsDOSKDXDIhqs0blAfoqkh
         AzXcMd8OVhTCwf9jM0aaklW9I/MWCFK9NEKs6hvjrp9RYo9dkxCTRcD+sP7okGg1FlAn
         C/6oK9j2KFLMvC7McAMlPXBzUJWphs6vkglzETwa0kqnSuG7yZ3q9IijR8AO5tLncqZP
         CBWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777283880; x=1777888680;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UBAKpwSgVQhj2CDVJ5Ec6/hyakm5YYHivnrEGULpfaU=;
        b=LVqwvg5KyJNNp9nrwAqxK8yaNp+sQnpFcFqfS3J6YVgZGryD5xMF+56PA3P1UjjAz6
         vV3LTh7Qbliaz8iQ/OBu/cQxqk3hyt1yH+f1CAKr+FVqppJHCXeU1KMCyuPE1sqlq5an
         sY8eABP7WQWe/w8NGSm+0T9gTGP8Q9h+CmjOJTXiU6A1CN93a+k94IDBwhgQ1D9TaEjh
         4ZoGfmmvo+6QU5Yv9itkd2MdH3UCjoEqgZ1/xgWbjONlE28kjYpXHUx1wJhxxp7bgByy
         Tcrx71N9otAgCb8xODwxoDUgJO47e5AviGz04MH12+kc9eDIRac2eQR9inT4THGEAPic
         vlXQ==
X-Forwarded-Encrypted: i=1; AFNElJ8yoZ5oRH8o+djt0rVPwou2pgROAAuhndqhcvcArFVb/rQzq7K3XnMhNkecya8YsE7h4n+SU/rBva4=@vger.kernel.org
X-Gm-Message-State: AOJu0YweHsHBC1Q5yslsINqtUZfn6Sl0WilQ/lxXK+OnPIXrrpSDJaC2
	T/5WojPZxVAJxxPpVerjF41DW0XpOtmIYkCV8n31SJRp94lxAjF+Cfe5P3NmnUvFkdv1CoThI8F
	H0BJnF1aMRCHnFZUyFPNMasnlCWlkcHznHRkbD7TqN2p/T9Ic5b6zbwfsgcdgHw==
X-Gm-Gg: AeBDievt/TlHSMrgNLezCrG3lHhqaFXOlJ831MwAaAjJz6+NByWOgqzQGNQK0KHqgb6
	N/ntMs2xP46anvoe5ffRWUy7KnfMkakulqmcXDLJKVH5r/04F3cziI2KibRUQHm898cAl+PHMAJ
	6V6vHJLgayVFkyI9q31DWg030jPA93erwq2uCwxXHJb6Ot+qP2mhmswpy/4QS3NEQJkkcUw5Uof
	9SLE7aXh9KllOd8/ftPmL2hwqpEJGD0PSc1z7y2DTsdoxKIWrsLnSn+Ekr+23rVSMGKFWSqlnad
	I0+ouI32P7L+vo312IKuFpSG+xMkmAw2kTH4qpU+qgTVPiCRNu7sae3SsxLnK4jcGFQYOS8bNQ0
	Cl/CREJmRS3DyHGjIDoOkqJ5AF4/mOOibHH68
X-Received: by 2002:a5d:5d88:0:b0:43d:6e0:9458 with SMTP id ffacd0b85a97d-43fe3e0c779mr65091410f8f.39.1777283879968;
        Mon, 27 Apr 2026 02:57:59 -0700 (PDT)
X-Received: by 2002:a5d:5d88:0:b0:43d:6e0:9458 with SMTP id ffacd0b85a97d-43fe3e0c779mr65091370f8f.39.1777283879422;
        Mon, 27 Apr 2026 02:57:59 -0700 (PDT)
Received: from [192.168.1.167] ([185.168.96.228])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4e4daf2sm77141294f8f.33.2026.04.27.02.57.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 02:57:59 -0700 (PDT)
Message-ID: <6d7e529c7cb0ad599669e3f33e5b6168e92a8861.camel@redhat.com>
Subject: Re: [PATCH] Documentation/rv: Replace stale website link
From: Gabriele Monaco <gmonaco@redhat.com>
To: Jonathan Corbet <corbet@lwn.net>, rdunlap@infradead.org, Steven Rostedt
	 <rostedt@goodmis.org>, linux-trace-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: matteo.martelli@codethink.co.uk, skhan@linuxfoundation.org
Date: Mon, 27 Apr 2026 11:57:57 +0200
In-Reply-To: <875x5crb4g.fsf@trenco.lwn.net>
References: <b845c448-1655-4860-9b6d-93d6f8426740@infradead.org>
	 <20260427085526.111835-1-gmonaco@redhat.com>
	 <875x5crb4g.fsf@trenco.lwn.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Mon, 2026-04-27 at 03:44 -0600, Jonathan Corbet wrote:
> Since, as you say, it can be found online, is there a reason not to
> include a link here?

Mmh, perhaps being overly cautious for the link not to break again?

The paper is published so I assume it's always going to be available in
some way. It is currently hosted by the university at [1], which may be
unlikely to change, and can be found via DOI at [2], which should never
change (at least that's what I believe a DOI is for) but brings to the
publisher's website rather than the open-access PDF.

I think the reference to the paper I included is robust yet easy to use
with any scientific or even general purpose search engine. But if you
believe using either of the two links is more appropriate, I can send a
V2 with the change.

Thanks,
Gabriele

[1] -
https://www.iris.sssup.it/bitstream/11382/533630/1/Elsevier-JSA-2020.pdf
[2] - https://doi.org/10.1016/j.sysarc.2020.101729

