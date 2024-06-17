Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9717313C800
	for <linux-doc@vger.kernel.org>; Mon, 17 Jun 2024 15:43:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718638993; cv=none; b=N5g8oc6+o5TUOqcc1jS0NIAwHs2vk+vQFLeBRN0vWj9LwpZDDz5M7DrgbQ5uB+lM/f3WzSRxb/9fQ9LMCmCnNjRUljrivnhxk2RntilT5X6p7bnuC0dHO4p0lPFMuUQSHF6UYuM3pliDlxiumtjwI+mJRbCxixVKnybys576wNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718638993; c=relaxed/simple;
	bh=3rpOn7wmB03jGangiSgD+W9gDmbQjsVJU7AA1yKqnss=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=q1GOGYPXhfHyJGoPT8uj63GDowY0vXqXtVJ6zpHK+blaisrfAvZSBrEZn0AhTg6ThCy7cLHkQCwOB59/YNeR79rXr8W6twv0gDZxtnR8kgySe4z+LsqthDpHqGrH3uHhLJW07im9Wng2Tg7z69vzdAIeqeYg2u47QvPZumuABoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=eOh+e717; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="eOh+e717"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-35f27eed98aso3619272f8f.2
        for <linux-doc@vger.kernel.org>; Mon, 17 Jun 2024 08:43:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1718638990; x=1719243790; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3rpOn7wmB03jGangiSgD+W9gDmbQjsVJU7AA1yKqnss=;
        b=eOh+e717jlG1mOmois7Rsm8bLMT5d258xR0cqix9IFqquFVdgzVF3hQ8kv+coWUTAo
         3Wf+KY81p+gCrohlJVQP7JvFoXtfld7/0a5A7Bqh6cut6MldZoh3PG6y6ebjIJnwNBVo
         xpHLEXRxzqigSKPwtFRbXzbjvZwhmbG9R4Im+X1gYFIh9noNzRLkAAWqZhar8YEBT3Ap
         HFPc+dZ9LnzDyvGilVDWuPHpT0DkhIYlC7VkZTrbQf2y3dB0gPcGC46WhvCwQNTR2SfY
         IBo4TM6357LjfsqBqMASmBtPq1OgW343uGmWgTv8iXUT2v85zsvLD06nVOuv7ULCeSCs
         eelQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718638990; x=1719243790;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3rpOn7wmB03jGangiSgD+W9gDmbQjsVJU7AA1yKqnss=;
        b=fb3rDEToQPwyAo/RJto+EODcKPCYKjPbxRPJvgXEoEvQvj3cl+mdh/aSiN7EWE+lTi
         EqwjiVdCClvAOMXGkTdCcp/zgJ8ppddACFtVrsY0Lt4GlDH7+n1Y0B9rOvAhnKyznZbW
         Se6LEmnk4Cj/1x2Wcq0mOyM+0bRCSSMrqFzwvO+ZjlCNKvN+dTQR63/Nf8hMLvfrTpq7
         pllddRoxja4Sq3CCxN/0TEcqu6naVYRLWysTQan8tbItq2axnLkz6I7OJJwFwC4oHZoo
         WXZDWx5kxZpy4BSRe/bGd4qERCsDy41J7oHst8aF8V/OnBjGHvaJfxwKfCKH9GRFoMmO
         OGqw==
X-Forwarded-Encrypted: i=1; AJvYcCX8uMLauIYSQps6I+jYfcEePQNCWEj7kpLnes0Bjr2G/lmqWAmVFl5q+Q4P7QvUzyPneFbgAYLhyiEV8tPsnrtqDoKGmvEOpxAh
X-Gm-Message-State: AOJu0YxA51wwQZWe3msyngmpllPOc4/sCTtPrViqEN7dE6SZmuGXZhuZ
	Nd0jQ/RgIJdnLXeTIe3kh5ISXRX4ppmC3jHY16CJY8Jr1KXhVnvEHmJPKpbH762yTFjd5uo6a5C
	fbvsJzEAlOJY5RDi9SmrEezTP6NuVeGXBmb2T
X-Google-Smtp-Source: AGHT+IFBfl3x7/L8nQxM1QvjTlIgn1s5t150VGQVheEXCV7yaZuCdmpleaoWcZ2XwPzZrdhJy5cclsKUbrXdj104+sg=
X-Received: by 2002:a05:6000:ec2:b0:35f:1cec:3ce with SMTP id
 ffacd0b85a97d-3607a75b68fmr6488848f8f.29.1718638989616; Mon, 17 Jun 2024
 08:43:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240611215544.2105970-1-jiaqiyan@google.com> <20240611215544.2105970-2-jiaqiyan@google.com>
 <CABzRoyYGY2EgT5wC9o98Vn_auh59poQ-OOnKceCiWQAJrbZoBw@mail.gmail.com>
 <CACw3F5134NmmLNr4zXHV1h0sLMTGcAJLpApQ7Fv_-DtUieD7zw@mail.gmail.com>
 <786a08ff-aa7e-49d5-f589-0a405c7e1a34@huawei.com> <ea8c5e390bd18c532b768dd9eeaa105a@suse.de>
 <8faf45d3-0722-2b9e-f641-9d081aad5a82@huawei.com> <CAK1f24mRaScJgKc7E4riQ6xTc-SVx_PanTJkA3duwpJZVhyxFQ@mail.gmail.com>
In-Reply-To: <CAK1f24mRaScJgKc7E4riQ6xTc-SVx_PanTJkA3duwpJZVhyxFQ@mail.gmail.com>
From: Jiaqi Yan <jiaqiyan@google.com>
Date: Mon, 17 Jun 2024 08:42:56 -0700
Message-ID: <CACw3F50LRtWh_BhLu9Q5w=sHqrZYCdeFhR8Dqwk9uK13q1r8bg@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] mm/memory-failure: userspace controls
 soft-offlining pages
To: Lance Yang <ioworker0@gmail.com>
Cc: Miaohe Lin <linmiaohe@huawei.com>, Oscar Salvador <osalvador@suse.de>, nao.horiguchi@gmail.com, 
	jane.chu@oracle.com, muchun.song@linux.dev, akpm@linux-foundation.org, 
	shuah@kernel.org, corbet@lwn.net, rientjes@google.com, duenwen@google.com, 
	fvdl@google.com, linux-mm@kvack.org, linux-kselftest@vger.kernel.org, 
	linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 17, 2024 at 3:34=E2=80=AFAM Lance Yang <ioworker0@gmail.com> wr=
ote:
>
> On Mon, Jun 17, 2024 at 4:16=E2=80=AFPM Miaohe Lin <linmiaohe@huawei.com>=
 wrote:
> >
> > On 2024/6/17 15:51, Oscar Salvador wrote:
> > > On 2024-06-17 09:31, Miaohe Lin wrote:
> > >
> > >> IMHO, it might not be suitable to use EAGAIN. Because it means
> > >> "Resource temporarily unavailable" and
> > >> this can be solved by simply retry later without any further actions
> > >> taken. But I might be wrong.
> > >
> > > We usually use 'EOPNOTSUPP' when we fail due to a setting not being s=
et.
> > > EPERM is more for a capability matter.
>
> Agreed. Let's use 'EOPNOTSUPP' here ;)

Thanks Oscar and Lance. Agreed, will do in v3.

>
> Thanks,
> Lance
>
> >
> > Thanks Oscar. So we should return EOPNOTSUPP here.
> >
> > Thanks.
> > .
