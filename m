Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 463532EA496
	for <linux-doc@vger.kernel.org>; Thu,  9 Oct 2025 14:27:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760020034; cv=none; b=trhls3yFj2ZfUaF99olTQvvZilLPvDFOHYeTEahP9QlfWDLy4y1Yl+51SYzUX9u8RSRzT1y12eOmmcU7cJiU7uBAv7X0WMWrx8sjOAWIyRFfqmO2HOYMlLKVk0hN4svwQMqobl0VFmjV09d35NBqXmEA9ZivP0WAZ4FO1Z7HfAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760020034; c=relaxed/simple;
	bh=r/F02S07YxY/vR+W+qaExDIN6Da+5SzwX0AXZ3uJSi4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LMxpKuPYST/+q0nyXqIn0Msd80zWsncyBYWXfQ83lLfVa+J3y34TUCS6tx6Zchw51UxNYI4gfnpNBqynEN1tUJody46XHB47FkHRAAMI+MU4gf3KfSWkveORtqsg1q8azGwMjOoCLxBJVYJ0Tpacn5OPSJz3wiuypRxcj+imAV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=IQH5MGD0; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="IQH5MGD0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1760020031;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=r/F02S07YxY/vR+W+qaExDIN6Da+5SzwX0AXZ3uJSi4=;
	b=IQH5MGD0UDxq+A04zJcE0f80/9nfkfcKWTuAJH9W8DVD4X5ZPk+CR5HSTAASeB9GJfqzlY
	q11bo++aUV06F6vsXQERpEddS1Egho8bx22l9n3z9PL1MrARk9XQurZ/pQN6yL0lTuws+i
	FwgiqFNuAautaI5/Xy4g45miV0lC95E=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-212-nSxhld6SNQWwunAkmkxPMw-1; Thu, 09 Oct 2025 10:27:09 -0400
X-MC-Unique: nSxhld6SNQWwunAkmkxPMw-1
X-Mimecast-MFC-AGG-ID: nSxhld6SNQWwunAkmkxPMw_1760020029
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-b4ea3f1c12eso175943966b.0
        for <linux-doc@vger.kernel.org>; Thu, 09 Oct 2025 07:27:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760020028; x=1760624828;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r/F02S07YxY/vR+W+qaExDIN6Da+5SzwX0AXZ3uJSi4=;
        b=b4G3P3iMrkHZnYRllKQGo6xeq1UtYXGKvguvCbAgh4PG0FugXpsarLzu3UscrFLHSy
         48jeBksHM7SjRAjvK1N1vqw6AF/04xbIn5ZcLQtTtSLa9d6PY++BS8iyCSDChD3yc8xo
         MzNPAOSJMBGIDGi3onQUk/XTuC1BzcYTQQAmfAq7nrNxqs03q1JRuuz25hMsEZrJ1osF
         NUHRT6/iaCAAyu1hM1X6RikejtmgN+R2x9efhWYeuzJCtn/oklK5hTfsDr8ZsIP4+u25
         1MC9avxD4BDa7tQHefKIyS32/xwwrrEj+OI2lDcCg2GMhNUMKyISgrLQlGL/mz8T2N/I
         aUqw==
X-Forwarded-Encrypted: i=1; AJvYcCWisI+NOL953kQtSeu6EHcz8jFno0tYT8kcTK1YgsUMCO3noaGUQfy+tSUY5vKUIs320YX4IdqQ24o=@vger.kernel.org
X-Gm-Message-State: AOJu0YyI787hzFn2m7mZjLtVOPYpQKjbqiAaVzZ7llLyOlpoj62mkSk5
	T3f+ELCA7WFb8R9ky+zWc1d0TbZ1Yw8kVdIMlEfTDB/qF71b4dsna+M/K51C+ogaJQyrpMUgzHr
	ahqn4Go8Oi64kMGz3M516cWKEfn9O3bkQJXYKCJqphUSOVZZ1pvVrtZNncEzOA9euA6XUN6Rjhi
	ro6VHTTfF3Yv55Aus4Wkge4QqoaDbhV2ZIdxlw
X-Gm-Gg: ASbGncuiKsJDVGw+GuMMli0upV3HdmM9szqOZqqAZ9uJG8tSWlE+awvrwDoYtgTAvD8
	ubagIijWZ7DodPt6AncvOzTHrJiLeLTSt4hgsJekbfe42p1ALZgNq6qU+anhVOLjTfm9Szm2T3A
	SwuGQSharEPSj7bv8kWe8h+qzBSA==
X-Received: by 2002:a17:907:94c8:b0:b47:de64:df1b with SMTP id a640c23a62f3a-b50abfd6d92mr811671366b.39.1760020028558;
        Thu, 09 Oct 2025 07:27:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF9K4Ovcv1oyU3VJoFriYFnWdSwGIcpMlhvL4pFzCqlwbu14cCZhq1aVRyK7USxJfsD/yZfE8XNTnaHJkha3f4=
X-Received: by 2002:a17:907:94c8:b0:b47:de64:df1b with SMTP id
 a640c23a62f3a-b50abfd6d92mr811668266b.39.1760020028075; Thu, 09 Oct 2025
 07:27:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAP4=nvTjauRawBPTnGEztZpdDSNhGpgSJtjoTFuq+cCQHP5oEg@mail.gmail.com>
 <20251008184522.13201-1-krishnagopi487@gmail.com>
In-Reply-To: <20251008184522.13201-1-krishnagopi487@gmail.com>
From: Tomas Glozar <tglozar@redhat.com>
Date: Thu, 9 Oct 2025 16:26:56 +0200
X-Gm-Features: AS18NWCYOpNrF7B48EqcyTUqbw_46aTsbs0KByL75_VH-zZNmvaxGmgx_22fbq8
Message-ID: <CAP4=nvQT5xkOCvVK9J-aYMjwqPv=F8bJ6m1yj2W9OcUwwJw+7A@mail.gmail.com>
Subject: Re: [PATCH v2] Documentation/rtla: rename common_xxx.rst files to common_xxx.txt
To: Gopi Krishna Menon <krishnagopi487@gmail.com>
Cc: rostedt@goodmis.org, corbet@lwn.net, linux-trace-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	skhan@linuxfoundation.org, david.hunter.linux@gmail.com, khalid@kernel.org, 
	linux-kernel-mentees@lists.linux.dev, crwood@redhat.com, 
	costa.shul@redhat.com, jkacur@redhat.com, 
	Bagas Sanjaya <bagasdotme@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

st 8. 10. 2025 v 20:45 odes=C3=ADlatel Gopi Krishna Menon
<krishnagopi487@gmail.com> napsal:
>
> Running "make htmldocs" reports the following build errors for
> common_options.rst:
>
> Documentation/tools/rtla/common_options.rst:58: ERROR: Undefined substitu=
tion referenced: "threshold".
> Documentation/tools/rtla/common_options.rst:88: ERROR: Undefined substitu=
tion referenced: "tool".
> Documentation/tools/rtla/common_options.rst:88: ERROR: Undefined substitu=
tion referenced: "thresharg".
> Documentation/tools/rtla/common_options.rst:88: ERROR: Undefined substitu=
tion referenced: "tracer".
> Documentation/tools/rtla/common_options.rst:92: ERROR: Undefined substitu=
tion referenced: "tracer".
> Documentation/tools/rtla/common_options.rst:98: ERROR: Undefined substitu=
tion referenced: "actionsperf".
> Documentation/tools/rtla/common_options.rst:113: ERROR: Undefined substit=
ution referenced: "tool".
>
> common_*.rst files are intended to be included by other rtla documents
> and are not meant to be built as a standalone document.
> common_options.rst in particular contains substitutions that are only
> resolved by other documents, so building it independently results in
> 'undefined substitution referenced' errors.
>
> Rename all common_*.rst files to common_*.txt to prevent Sphinx from
> building them as standalone documents and update all include references
> accordingly.
>
> Suggested-by: Tomas Glozar <tglozar@redhat.com>
> Suggested-by: Bagas Sanjaya <bagasdotme@gmail.com>
> Signed-off-by: Gopi Krishna Menon <krishnagopi487@gmail.com>
> ---

Looks good!

Reviewed-by: Tomas Glozar <tglozar@redhat.com>

Tomas

