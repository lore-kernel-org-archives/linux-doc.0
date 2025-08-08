Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79804230981
	for <linux-doc@vger.kernel.org>; Fri,  8 Aug 2025 20:23:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754684596; cv=none; b=rakFEqggWX5BkXlyoNeS3X3YeeETx7kiN6xtWf7TaXp3DcVQi3uKeWEzD4sB+ZmzAIjpqUCXPcXtm+l+1PtKAyUXMGhXBu7SnLUYiv9Eq3w0I5xccAZANMmVHKWyzgIRjatq0lMNvfCMY4XWNW0jD4vDDJZaM9bCcy5VKR0Ik+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754684596; c=relaxed/simple;
	bh=NhHbfYOgDkzOK4h3wiDpp3jR6kbXu2EDTW8+sgV6Bvo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=gbeJb2oE86cvUBK2khaxpSRk92Zbp6cpZFaibE7ILSTvvtSFNqkykj10HTYC3rI6YTqmBI6Vg7B8uNIzUeuyCVhnbaxoLb2y0DgySg74aG/XqDt7GqesW0CTp5Fc8VGfOql5V2IJexB9V+DPhbVshB5/LQhtH0LQUarPw4tWy+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=Bf8vaC6J; arc=none smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="Bf8vaC6J"
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-4b0784e3153so42605651cf.2
        for <linux-doc@vger.kernel.org>; Fri, 08 Aug 2025 13:23:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1754684593; x=1755289393; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qffYeRv+DqqEfz28gtOh91dhHjRzZPBAshXCIYuUUzk=;
        b=Bf8vaC6JRDjL/6lZEnt++a3LTNTzo3fO4g7wLtbQNqcxGBSVhEDFENn2J+t6vSpaRx
         P7KpwdDj3JGkg3Y+F+0vZNuGO0/vvMT5m9Y7I2ut5rRmWHXhPUIV+co8ZfPqwN/nqXEA
         4UpS8cJ89kQIei7FEsg8sxvPCbS9+F3GVf7bOnqJzSKx5Zk/rE87bYCKVxY8Lo/X01DW
         jFhPz4qE9xv5lsjr6BmfLC7c7fKvXDLr1Lik6d3d+i8jSRGLHbWZrwGTYUNxHEM07tJG
         /BK1c+0kIfU02YprO0LzhJHMuNuwqeNIArJjz+mo/zBbQedcXsRhq2zf2ZiaccMqD+0k
         RjZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754684593; x=1755289393;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qffYeRv+DqqEfz28gtOh91dhHjRzZPBAshXCIYuUUzk=;
        b=q7IPDkY7QmVbwh6Gfe1sQ91GCCuBeclC+FMIHoXxYw3SEOv4fsmSAw9u8mMrl0L184
         a5I8UYKAbYpQJncnSKHgWYcx0WNQNxxz+I5fO3abdp6VOJLPYPABLiaxKneCscTkT3QY
         d3+xYv5uYNhEDp87NODLLgwhgOOQi9CJZs1vdoAus8pPi9bjKO0D4FbFxf98cIpICgs5
         R4ASc0gGWMMFe5OjCFZnpMdfFqDlaNvSjxlpH7H6yiLbFc6KjegpljfXdCjeGCnaB3An
         R3oFwhGa8rJgZWFOw4Kif35Rpf4KEq2qcPyWS/ThQECNva26WmviCr5vwIZaQFQP6gGe
         EdCQ==
X-Forwarded-Encrypted: i=1; AJvYcCX0Awmdr6a2LS8JHm0Gi1oFNBTXveW4QgvnUNuiGsgJElkA3U2uXw9QWhyagTN7pcIzyXjI/XYC4Ic=@vger.kernel.org
X-Gm-Message-State: AOJu0YzNSIcy7OJOhgA894HQ6Ei7Lo1ySqTflWYYlrOXBDBH4xt5gC+t
	geJPYoCwnGIb4cPP49NbYQ2IkY55SRwJd4hnzYTnXts4UNCA2LM6byqvTcXqVdeAF4evA1Rshv6
	Paut3cJEoKZP5e73WbkILMF6MbuhoyUDDXBou7RH50Q==
X-Gm-Gg: ASbGncuNSkaGnjI4dYQo3h7ucQHJKuwz99AJD+OjmVgkpKSu394ihIws37CVuG/UAjj
	0dBHOTNEB5J0zO3XX77mpu+78cYjsUCmyIz/b6LzUSE/q77az+WwtIfTm9gqQ2g9hDTt2DWt0nS
	IZbl+2FpBWqaSFYSzPzk0S/j63CQhmUUdudJU6X6Q644lN+HUp4cBN7s04GrMin3UKpy01cIV3f
	Col
X-Google-Smtp-Source: AGHT+IEAzSN3MsXLZMJqt6wu2Cu/Z9Yks4q60j6ZTc58+gOys6Rgr8NdSPHkKqE9760XDbit4QV9DAY9VZSc1qgDJcs=
X-Received: by 2002:a05:622a:4016:b0:4ab:536a:ad35 with SMTP id
 d75a77b69052e-4b0aedd7c07mr68881521cf.34.1754684593193; Fri, 08 Aug 2025
 13:23:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250807014442.3829950-1-pasha.tatashin@soleen.com> <20250807014442.3829950-30-pasha.tatashin@soleen.com>
In-Reply-To: <20250807014442.3829950-30-pasha.tatashin@soleen.com>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Fri, 8 Aug 2025 20:22:36 +0000
X-Gm-Features: Ac12FXwZELMUp6FmK0bakKcUqFiUYIIUNXgn4oPjuRKBZW9iuH-cHyWFuj5z7U0
Message-ID: <CA+CK2bAP-PWkYtZbw8ofhTgDaW3qoQkNob30wWSjidxEUTV4pg@mail.gmail.com>
Subject: Re: [PATCH v3 29/30] luo: allow preserving memfd
To: pratyush@kernel.org, jasonmiu@google.com, graf@amazon.com, 
	changyuanl@google.com, pasha.tatashin@soleen.com, rppt@kernel.org, 
	dmatlack@google.com, rientjes@google.com, corbet@lwn.net, 
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
	stuart.w.hayes@gmail.com, ptyadav@amazon.de, lennart@poettering.net, 
	brauner@kernel.org, linux-api@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	saeedm@nvidia.com, ajayachandra@nvidia.com, jgg@nvidia.com, parav@nvidia.com, 
	leonro@nvidia.com, witu@nvidia.com, jrhilke@google.com
Content-Type: text/plain; charset="UTF-8"

> +static int memfd_luo_preserve_folios(struct memfd_luo_preserved_folio *pfolios,
> +                                    struct folio **folios,
> +                                    unsigned int nr_folios)
> +{
> +       unsigned int i;

Should be 'long i'

Otherwise in err_unpreserve we get into an infinite loop. Thank you
Josh Hilke for noticing this.

Pasha

> +       int err;
> +
> +       for (i = 0; i < nr_folios; i++) {
> +               struct memfd_luo_preserved_folio *pfolio = &pfolios[i];
> +               struct folio *folio = folios[i];
> +               unsigned int flags = 0;
> +               unsigned long pfn;
> +
> +               err = kho_preserve_folio(folio);
> +               if (err)
> +                       goto err_unpreserve;
> +
> +               pfn = folio_pfn(folio);
> +               if (folio_test_dirty(folio))
> +                       flags |= PRESERVED_FLAG_DIRTY;
> +               if (folio_test_uptodate(folio))
> +                       flags |= PRESERVED_FLAG_UPTODATE;
> +
> +               pfolio->foliodesc = PRESERVED_FOLIO_MKDESC(pfn, flags);
> +               pfolio->index = folio->index;
> +       }
> +
> +       return 0;
> +
> +err_unpreserve:
> +       i--;
> +       for (; i >= 0; i--)
> +               WARN_ON_ONCE(kho_unpreserve_folio(folios[i]));
> +       return err;
> +}
> +
