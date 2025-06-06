Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5984E28540B
	for <linux-doc@vger.kernel.org>; Fri,  6 Jun 2025 16:13:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749226408; cv=none; b=pG7gJwff5JBsgTphE8qEAkV9ENO5YwRlzKeAMNxbfhVZ1JytELNQLPrnjxv7jPtoER1MWmpG74qsIlDRRK86Wd6g+YFgzOkQPC2teaJyrZgmONzGswiSW8/p1sqdHWsZXNSag5S/L6AOthlny3pqp5PeA7WW+U4PpISWWL1u/d8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749226408; c=relaxed/simple;
	bh=3c+OLiucfxV1ODvVU6ZZSFapIkuKRd0oSKGghYOHS4Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QfqKj6H2Ux+WTQHe7+XmGukjl/VqHt2PKqKFMBUkpi8x0v+kJGolmyL7u820kloYFegGomsZqMW8jDgKWeVQdDV9LJ3RGi9z7iJXhfj1qloieRZSJqV7Aybf0zMRuUtELzCgJsjkLQkfL7UvO23n8DQzEPC41CgTkdV7bU4bHTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b=UvFYjfJ7; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b="UvFYjfJ7"
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-4a58f79d6e9so21728721cf.2
        for <linux-doc@vger.kernel.org>; Fri, 06 Jun 2025 09:13:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen-com.20230601.gappssmtp.com; s=20230601; t=1749226406; x=1749831206; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3c+OLiucfxV1ODvVU6ZZSFapIkuKRd0oSKGghYOHS4Y=;
        b=UvFYjfJ7E1AYqFNifHJ5vAD1nNFuopa6CqxKS7CzMVV/zdci4oALssnI+fKuU0bZIE
         54K38UM6kiDb+UTarbiwFst1UU/sCv4W62u2CH6v4wUWp9qQluFTFNwyyJWlWmkdiBh3
         9nIsaak6uIFKEiO9EkDUqZNIEG08+hZUo5QBI1ESMZQgyhNaKdzsNETC0YmFExWflKoB
         JKUwscRQ0Y3/bI5WU5lZeHUQPRsnAYBj0fDOMUEFpAhFqdGHnYVZHDf/7EaWeyrr/sP0
         OrrCoJiE+ra/XIZkh8DIXwXjZwtMJ026l1OZPG6mrgDcufElcIM41E0/iDYQA+7bkf6C
         YXaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749226406; x=1749831206;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3c+OLiucfxV1ODvVU6ZZSFapIkuKRd0oSKGghYOHS4Y=;
        b=oOO48/Ebf6WZ8gy/vHf48KDTXyCjSELuVzrTwLBDm97zZdcQKrJJpmjuBn6K8hMAHx
         gwj0yWuSN1Yqyg9eEE3o9iglDKevWxx8mZYYDX6UNIwt08+opQFHfiYUzJ62c1EcZcHg
         TdDMVvwonaQht5iLr3hMEil/ZZAEU2USDenRxuPYmiUZL88yqjT2mEibmIifR7yVMAjj
         6Qm1wvk5HsOjYjCNuLQroRmGU3w1skW0h+OIUum8CZb0mzCu+kqfDGYUsfI2HmyPZJf7
         X3jVYCvo+rdGDwE39G6uuXngxj2UjpgjTkibf4NaVpwqrMNaM0kHfYuUkp4O45xaNpS3
         EzYw==
X-Forwarded-Encrypted: i=1; AJvYcCV06pEZDLZStT58I13XfgSt68ljji0HIniFpvJfBsW2Z+QjtMjbKp/xnHgKcmF/D73v5f/TVzshhR0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzXNyv1/OyepbySLZjzjYyeJnixHPFwOyCTt61xGXadjdkUBug5
	61RpfgosW6htIg+Xuz+0mOBgBp0dpeGjhi9T7cfKcQWPhfCUhIhJCJSQwJxNvhFCz8G5G19k3/D
	4QuwBWMm6x3gr8DTDw2ShSQVO/+YrwMwxtgl/aiSmtw==
X-Gm-Gg: ASbGnctRxSqtAy7xUlIekAUWSiKL7xQs38reHbx/YvEzlrqAKMuGhu6oOXfOh5tgIW7
	BGYkHCkpsFBsqVn5CybiY/JcD8FC0txNXg6NKn+efz4LJsmWaNhz6k+V3E8HUWJDifLf3chsb+o
	bcOKOBnaURlGeerwzq5qQDoZ+33TYw4LfYetYcLjSo
X-Google-Smtp-Source: AGHT+IFvzMrq1D8K+hzBBEnf8MX2QMLz487m/utY5M5EEZJ2BtgId21E4drPVwNqY3sPf1S055BglVV7u01P7fkvw7c=
X-Received: by 2002:ac8:4f83:0:b0:4a6:b603:c37e with SMTP id
 d75a77b69052e-4a6b603c3d3mr34513811cf.2.1749226406222; Fri, 06 Jun 2025
 09:13:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250515182322.117840-1-pasha.tatashin@soleen.com>
 <20250515182322.117840-2-pasha.tatashin@soleen.com> <mafs0msantryd.fsf@kernel.org>
In-Reply-To: <mafs0msantryd.fsf@kernel.org>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Fri, 6 Jun 2025 12:12:49 -0400
X-Gm-Features: AX0GCFuCUPrJe40udzBKChlGW4OEJnp5DLFei3Onke-YT3nN79_JOUAzGKiEZOg
Message-ID: <CA+CK2bAc6joxJPCTdNkn8JxWA0MWtQfASiwNuHA68Nqt+7O61A@mail.gmail.com>
Subject: Re: [RFC v2 01/16] kho: make debugfs interface optional
To: Pratyush Yadav <pratyush@kernel.org>
Cc: jasonmiu@google.com, graf@amazon.com, changyuanl@google.com, 
	rppt@kernel.org, dmatlack@google.com, rientjes@google.com, corbet@lwn.net, 
	rdunlap@infradead.org, ilpo.jarvinen@linux.intel.com, kanie@linux.alibaba.com, 
	ojeda@kernel.org, aliceryhl@google.com, masahiroy@kernel.org, 
	akpm@linux-foundation.org, tj@kernel.org, yoann.congal@smile.fr, 
	mmaurer@google.com, roman.gushchin@linux.dev, chenridong@huawei.com, 
	axboe@kernel.dk, mark.rutland@arm.com, jannh@google.com, 
	vincent.guittot@linaro.org, hannes@cmpxchg.org, dan.j.williams@intel.com, 
	david@redhat.com, joel.granados@kernel.org, rostedt@goodmis.org, 
	anna.schumaker@oracle.com, song@kernel.org, zhangguopeng@kylinos.cn, 
	linux@weissschuh.net, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-mm@kvack.org, gregkh@linuxfoundation.org, tglx@linutronix.de, 
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org, 
	hpa@zytor.com, rafael@kernel.org, dakr@kernel.org, 
	bartosz.golaszewski@linaro.org, cw00.choi@samsung.com, 
	myungjoo.ham@samsung.com, yesanishhere@gmail.com, Jonathan.Cameron@huawei.com, 
	quic_zijuhu@quicinc.com, aleksander.lobakin@intel.com, ira.weiny@intel.com, 
	andriy.shevchenko@linux.intel.com, leon@kernel.org, lukas@wunner.de, 
	bhelgaas@google.com, wagi@kernel.org, djeffery@redhat.com, 
	stuart.w.hayes@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 4, 2025 at 12:03=E2=80=AFPM Pratyush Yadav <pratyush@kernel.org=
> wrote:
>
> On Thu, May 15 2025, Pasha Tatashin wrote:
>
> > Currently, KHO is controlled via debugfs interface, but once LUO is
> > introduced, it can control KHO, and the debug interface becomes
> > optional.
> >
> > Add a separate config CONFIG_KEXEC_HANDOVER_DEBUG that enables
> > the debugfs interface, and allows to inspect the tree.
> >
> > Move all debufs related code to a new file to keep the .c files
>
> Nit: s/debufs/debugfs/

Done.

Thanks,
Pasha
