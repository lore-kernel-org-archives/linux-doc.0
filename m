Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64CED55887
	for <linux-doc@vger.kernel.org>; Wed, 19 Jun 2024 05:25:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718774759; cv=none; b=ihlYC/Lpq2YMMXUtwy5YTxbOHoEMVp+ENjWFHls6eGgLRftCEvAY8BCEuMkk8eMDnbJZAOVya97GC/+jS3OBoDuluYbas1JBT+gWpSKMKFIwbPHpLVFbbuti4zh5SqLKajjP5SFYiz/rcmJzsXSXLJGvLPk/+8sJ7s7Ha+jsFms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718774759; c=relaxed/simple;
	bh=t9EaaUg3L/TRQLJ6x2jYN3aMV18XlDlw2j8eGqK4Z10=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gkfAvNLFFZN5w+ya3vxQMsycoWUx3ZAdA2PxGMO1whNXYqaZ/eCgTVJk0+h8bAcGvZZ9aIWa/1dNXtZwKZ33PQMsykmXDecRhYmaoSZD907ykQUDNvqKP53WsGtrd4qv0QI34UWPZ7kbKi3Tv75qIAGNQvry44jr9ZQZjm8O9e8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=egHOHM37; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="egHOHM37"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4217926991fso55597355e9.3
        for <linux-doc@vger.kernel.org>; Tue, 18 Jun 2024 22:25:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1718774756; x=1719379556; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uwQGsaeVkR2wdQtFm/A8WK6CqmtUyAoP0AL0lGKk5Q0=;
        b=egHOHM37xxZZVk2qD4PknPPw2jWJRxhPM1cz25eqGf3ryv7g8avMNeRIApJDuwU7T7
         OcYIqkKiLQesuaWzibRumMzVpTFi7fUMd2wOvW1BDPd4flxokZqdKifgJQT8DCz8sZNG
         PenpIqvwIsoWTnfXleMIP6hBPZjpKdb0EexA/C0COYg/jDzpZTBgQXi6lfDpmBUgBho7
         zRfOD0qEp2BCHA6pZ1KGU/NzTBe44Sb8clfxt6vus5Q9puZNkLUwA0PGl+dyrSHlmaHs
         nCkCtPVUtUyyYQl1Y8RNFcr69EJDpRcLLxAIvbjAOnwpJgKDclI3qn6/Q/hFUYWBYXGh
         NeQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718774756; x=1719379556;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uwQGsaeVkR2wdQtFm/A8WK6CqmtUyAoP0AL0lGKk5Q0=;
        b=Dyv5Pt0pXdayYBuBoKdNjlyFCvK6HzPIR6bj9/0JvN/5cAZXBJBNN1SoRR5nIcdCpz
         f0qB5M5vHUV1gVqkTCI0C0ve2rrQ3uKKEnGn7fUYcWXyzFjFcq69DiZyBfCaQjeowhvX
         SW0fAJA3P355N+5hMAFDPbyCvq2EGSIjr+n2pJ6giIChsV63K/KZBTsGdI7g/RMDegqB
         V6OKNLsV9LSNWCaa5Wdm62Tnf5kO6XQqNG+xc5ZbeYdz64By3HvJkMuHmvIPBCTWNgV2
         6QgTOASXyP4mnuxx/fhyixOJKF2bTXOAvSTR7q9Mw0/LRPKGU0czKEeOlQYNClnCWf4i
         YLNA==
X-Forwarded-Encrypted: i=1; AJvYcCUhMF7YrauwHdm5a+qDYI0/egZR2xFNvdSVxfx82rtp4qKrDQ1Is/9ZYRBs6GdBkalfg8CnCYGOoJPX6iEZ4HR3ZeAF64m7yQ9r
X-Gm-Message-State: AOJu0YxvsYo1nORbo6PLo8EUgTx72h097XnsYuwZ0OlcFjI89rn+R4Tv
	mE/M9qKMWcUBRe6M3IRoCiKfE7H6EeHcISklb6jEhHLMO7/qQk6CipbwWBF10ywYlV6FCf1Qzlg
	3CyA04gIHgf+fnnkD7UzHjkrWoQUgX1fdg8dv
X-Google-Smtp-Source: AGHT+IHIJAsmZ4zkrcutJrcSMRBI2Bt/fiEgHmTrXDGLrPqmD2yvGF4Y0K9pp6S1TS65bsqrBUo/eSG0vK+aIBsGNDQ=
X-Received: by 2002:a05:6000:144:b0:360:746b:6015 with SMTP id
 ffacd0b85a97d-363170eca2bmr1114580f8f.11.1718774755356; Tue, 18 Jun 2024
 22:25:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240617170545.3820912-1-jiaqiyan@google.com> <20240617170545.3820912-2-jiaqiyan@google.com>
 <ZnJmsqvJz63imq3O@localhost.localdomain>
In-Reply-To: <ZnJmsqvJz63imq3O@localhost.localdomain>
From: Jiaqi Yan <jiaqiyan@google.com>
Date: Tue, 18 Jun 2024 22:25:43 -0700
Message-ID: <CACw3F53SQHQaaBAyEMww=iPXENhG3uVbEzedG+0S+gvz+O3kPQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] mm/memory-failure: userspace controls
 soft-offlining pages
To: Oscar Salvador <osalvador@suse.de>
Cc: nao.horiguchi@gmail.com, linmiaohe@huawei.com, jane.chu@oracle.com, 
	ioworker0@gmail.com, muchun.song@linux.dev, akpm@linux-foundation.org, 
	shuah@kernel.org, corbet@lwn.net, rientjes@google.com, duenwen@google.com, 
	fvdl@google.com, linux-mm@kvack.org, linux-kselftest@vger.kernel.org, 
	linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 18, 2024 at 10:03=E2=80=AFPM Oscar Salvador <osalvador@suse.de>=
 wrote:
>
> On Mon, Jun 17, 2024 at 05:05:43PM +0000, Jiaqi Yan wrote:
> > - * Returns 0 on success
> > - *         -EOPNOTSUPP for hwpoison_filter() filtered the error event
> > + * Returns 0 on success,
> > + *         -EOPNOTSUPP for hwpoison_filter() filtered the error event,
> > + *         -EOPNOTSUPP if disabled by /proc/sys/vm/enable_soft_offline=
,
> >   *         < 0 otherwise negated errno.
> >   *
> >   * Soft offline a page, by migration or invalidation,
> > @@ -2783,6 +2795,12 @@ int soft_offline_page(unsigned long pfn, int fla=
gs)
> >               return -EIO;
> >       }
> >
> > +     if (!sysctl_enable_soft_offline) {
> > +             pr_info("%#lx: OS-wide disabled\n", pfn);
> > +             put_ref_page(pfn, flags);
> > +             return -EOPNOTSUPP;
> > +     }
>
> We should not be doing anything if soft_offline is disabled, so this chec=
k should
> be placed upfront, at the very beginning of the function.
> Then you can remove the 'put_ref_page' call.

I think if MF_COUNT_INCREASED is in flags, we still need to
put_ref_page(), right?

>
>
> --
> Oscar Salvador
> SUSE Labs
