Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 276213DA5DB
	for <linux-doc@vger.kernel.org>; Mon,  9 Mar 2026 15:42:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773070945; cv=pass; b=iKlnLl7uVMPeEqgW1L8Y/vmfkvP3SK+DiC+6PUgIWO4704UxvdZuBGYmCEHhMmq8lPtQ+FWXBWTPESGFoHFPcFKKxBkgm0gJpqooxNI2ru1ysPNgOsUDkuWXRXXlv0gAqP0uBRjPQhfUSas8qUtSRD+PZc5Ld25OoKSn0saI4Sc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773070945; c=relaxed/simple;
	bh=kGw5voA1KmJwKFY6CkPWjSKKQ3x715P8GBp4QFY51nw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BkvKa1C8khubdkCdQ1ZdZZEz2tKAEmECRMsoWRjgiicH/NytIpEAQpLpbCqzD9oB2j70Km8ADT7HaSbJ/zvFVcqF/8dGjhvkAXG/tqHxbLHBJ4hYAr1OhEi4i0o0MVntNiePyzaL/VUkgDo9QDI+KEgtq/0m2JZRPI2cbsog+HI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m2Csianl; arc=pass smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m2Csianl"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-439b78b638eso9020817f8f.2
        for <linux-doc@vger.kernel.org>; Mon, 09 Mar 2026 08:42:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773070942; cv=none;
        d=google.com; s=arc-20240605;
        b=ZiTxiiWkilCu1OFMFFesL5D+k/RM8l+3qUt/PsK/EW/as7dmySB89TWX1kdMpX9f/T
         JiPGPVvgyhT1asOHuTdJJGmzPDjEFTad5y5Du36WH/tzKVyjOj5XKEruWbUNMNzBmE3b
         Q/7jlCJqL7Y3UWQOlccA/y6O/n2LhYIEtMVFzHwBvdu1z80lIC95Kpa8TKG0IaJlZynN
         v5CY32vW1FB+MnNR/inrY5wCR+7hc0Qn/nGNX1jcXxYkK8crLqcNgbsBG+6W3+ZyiULy
         RP+KI7xd4NSthYVdj1SF83E+Y1545UrhT7jM04ilRb/1O+nQE/fF3DgMGhLw6EnO1zBZ
         azaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kGw5voA1KmJwKFY6CkPWjSKKQ3x715P8GBp4QFY51nw=;
        fh=tnmjEOXOwQkn+YtYOhOTOg7eNM8MFjSaKVUoWE+yFb4=;
        b=WT3+bpqHEfd5iUZzTXYJYq5+JAbyGoVltor7jRRLC1EIeSzpuH0Z35u/TZsIx7R84p
         am95+/bv02wRLVXzy5HR9Nzn8vnXJvMtwaW5k5hVaWI8eZROyUPfWXUpmXh/FvBvkANv
         YPF7PPy/GMuYdyFUtQVkd05dLG5UiJcnrh9PvIJPY4d1hTzXpELY9pSCnCM1xx9NuJcn
         3nXQPkfAwgi4VX1XjU3BPG+/2IvsxHCn/hYFCPLJhNK0tj2CQi5dz4HjxAickmr59xEa
         GR+SQKYWgyev4QIehZ3SzBOPucRoFFHgTA7avIHZSz72po8xKKTc7VMisxbcyvsb+Uje
         8NDg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773070942; x=1773675742; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kGw5voA1KmJwKFY6CkPWjSKKQ3x715P8GBp4QFY51nw=;
        b=m2CsianlYhiJf7cBMwPK8ILm29kV01cmwxqJiGfM72MbrMQL4XFiNi+JHu4qMny3m2
         tvdPX6vpHlShHx1vim+yL16kEbfJx5FfkHwHq4/QRkShf35ASVj/qMmwgA9em+Tw2YjA
         91lGRMnrJLCTlDgA8qcn1CQMNp04E+HsTyGDDevAuHcBabyvLqPcMh0LzAacn0jN/ats
         wuu1pZKS3ZXluLYG+11mZzJmjs25dg4AOfPSps9ZehokQGOCJNqNl8RbbgihgsmGJweU
         cy04bEstzCbyiIjdGx6G1a5yGiSBitzjndz9PU7TC/BKg+155GQNdKYKqq/LOD/MqcCC
         SUeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773070942; x=1773675742;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kGw5voA1KmJwKFY6CkPWjSKKQ3x715P8GBp4QFY51nw=;
        b=QA87TvizFZBi4RSTHCaUc0ttBIi7UUXUU9hay+NQig9RWTOS+jeLTrWQmxtXI+gnfE
         ozgjGLsh4G38MdB3Co0oQZ/F3Ko7OFEPsUfWTFblWm+Ym77c5aFa26oD+cXpWY8l6lqY
         CM+f7/F/SHeU/qlkLVQdtZUB2rwvLZoQLmh528fBfhKU8Qz8rHXxpbzp6r1RORR7bZ78
         7pPsJsD+nUHLDPHASvMS5AQ8u/fUf5QYspBOgmQvfMV69ddJoNNDHanQxYyjBax7Ycdo
         iuo/HnpsNH1vgF1V86SbVnIADwBGZquRi2JVq2Si+XQPZ9RfsAgGCSVdFTJdfBdr7wEY
         R53g==
X-Forwarded-Encrypted: i=1; AJvYcCUJ+bDtQMVHNTqkVbAPh0nnA7Syq21Ll6hiJUY3tza6oULF/zibYVI5x3rdhTn25ux8iqLPv+keY7M=@vger.kernel.org
X-Gm-Message-State: AOJu0YyhmC7Xzj7VlOdvvF5JqKRfEfGCpstvT/Oai6BvEix9butTz5PD
	Y4mJ3WXeyzkrkHupFBbZkTwiT2mW3dOTS3lR14gcvQuwxlZgK944ceYtGz4S7yTV1mkCOqpE8pz
	IxHYlefpysDzbDYnS3Yu+nJzGFviQS5I=
X-Gm-Gg: ATEYQzy3mTBxrpXWvxL8khLed6AaL7lXewUa6r8ab/UqUc42eie+g+tXKWApBnPz/si
	fZTmEGIM6GXRu+4qGxm96Dr5ijTJUE6BRJnOFZ0a1WGUzRmUfnJkocbIZoMrXPE2fscJenYWvL1
	RMCNLWkGcxYm83zzMu8jy2fLkTUYhGyTBelRDWhvsNVbAzfZ71NlDNprm15QQI6IeoT9rvn8YVN
	B/vp3W1EJaZhxX82X0X2bIY9qgEzgkI+xO0vCbkXMQKH4VrdVWHb9rwJXj6av6amC7n5P87c0TU
	rPq3yQrch/r8ZzXwMlw3/Eohcpxv6CDN1fFdlOT0qbl+ywSc6hma7Qv580B3B7oQWjuz0aNHMJW
	PQsiv0Bc2MSTjjl5tu9w53xPJYwrxYh+og4T9
X-Received: by 2002:a05:6000:288b:b0:439:b2ec:1710 with SMTP id
 ffacd0b85a97d-439da654313mr18931718f8f.3.1773070942410; Mon, 09 Mar 2026
 08:42:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260309134630.2638181-1-bqe@google.com> <87ldg1xdo9.fsf@trenco.lwn.net>
In-Reply-To: <87ldg1xdo9.fsf@trenco.lwn.net>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Mon, 9 Mar 2026 08:42:11 -0700
X-Gm-Features: AaiRm5118CIPDNbRTQ7etk8QlzD8w22P_KVYQ1O3uzq1vYrQVgyo0KfbrfC-gtA
Message-ID: <CAADnVQKqzM0FXv-UgeBismj8o281Lcg+dPOf9OMnLb9sy45HYw@mail.gmail.com>
Subject: Re: [RFC PATCH v2 0/1] bpf, docs: structured overview of verifier
To: Jonathan Corbet <corbet@lwn.net>
Cc: Burak Emir <bqe@google.com>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, 
	Jiri Olsa <jolsa@kernel.org>, bpf <bpf@vger.kernel.org>, 
	"open list:DOCUMENTATION" <linux-doc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 9, 2026 at 7:47=E2=80=AFAM Jonathan Corbet <corbet@lwn.net> wro=
te:
>
> Burak Emir <bqe@google.com> writes:
>
> > This is an RFC for adding overview documentation for the BPF verifier.
> >
> > The existing verifier.rst has detail but IMHO it lacks structure and
> > background. Here is my humble proposal to make the verifier docs
> > more helpful for newcomers.
> >
> > Finding a balance between overview and detail in documentation is
> > never easy. The idea here is to describe abstract interpretation and ha=
ve
> > enough information that anyone interested can learn what is going on.
> >
> > Please let me know what you think. I used Gemini 3 to get a first draft=
,
> > which I then checked word-for-word and reworked.
>
> I only got the cover letter for the second version, so these overall
> comments are based on the first.

Jon,
don't bother.
This is a no go.
