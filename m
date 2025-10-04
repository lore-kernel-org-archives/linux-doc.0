Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E9A618EB0
	for <linux-doc@vger.kernel.org>; Sat,  4 Oct 2025 02:08:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759543729; cv=none; b=JPqEiMmninjl6bXGw1FIgguOV8nZYC1rNaNjaOi1x4+HYhAYJ6zOIVCdoeXBZPemat/lGjpALh6QqoBhAQEieU7IHCUawxdGtilgYtj5UWM1CUnB2c+Tl+vEOPVEryYDfFF2i3xbyHyedON1xf/qHpL/GDzqMlfxi/0iaRlB2Lo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759543729; c=relaxed/simple;
	bh=Nob5kKRkv8Qml7C9lk2znkph3asIUJ+dkyoMrrTUiew=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ghsRp6BELcWExnFck7qGpjafbSnAPXVoEGFNh8cevBqPVRDZ8URwfus3F9W3ToXGXw/JcJGZelhgALSl3t/gu/GQQ2ernyz4S4C3hLpvvuvp6DENtUbkIPf6o4ODwJQC8NXUCUY5qIF/mcPmM7zryL1I7+e6FL0N1l2WnVnQBfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=UVBohL8c; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="UVBohL8c"
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-4df2911ac5aso17758921cf.2
        for <linux-doc@vger.kernel.org>; Fri, 03 Oct 2025 19:08:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1759543725; x=1760148525; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Nob5kKRkv8Qml7C9lk2znkph3asIUJ+dkyoMrrTUiew=;
        b=UVBohL8cU+t8AHNXNBFMhP3Q1+ncT7/G64axJBW6tt6F87RkpDFR51Fn6SnQuXE1sW
         zMlqgn85RiMJx+APlHTL8Mupunuf3Mto4vwrClsFZwF3iZu2ccU9dJ6JRlRyzPECC5DX
         +M+8OuzvGRyJ3scu3u4q1CRCWAVaTDN/SL2ohwmfAUp/ZIDkfJWAqRidOCH6iJ3qUG71
         R4MVttxjbYVr0YOEpK0kBQD+5W2+BJo49b+lmv91vUqvuVTBcXKwlv+u/1pgjruKvZsq
         k9OApD4/bcxXXIN5TVARF+5M/3dM9Gfnj5jkiDnFxHRwZZQCkr6/X7O9MYejnitZ4oOt
         D5Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759543725; x=1760148525;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Nob5kKRkv8Qml7C9lk2znkph3asIUJ+dkyoMrrTUiew=;
        b=ULjvxs/Nt7ZpgTQS+R7pDtgCDts2OCqv0BEcinc37xTnOV4uvjUmgSGRADoVFZXS+q
         S6iEagxypSJyc2pIXt7RINti7vprLMKBkWuKssVWol4pQUBaVnLTt8OCq0wBxb1OGsrh
         7JMulYtTBnzF2VN/9JXWSsqNApoeH9doppUxF7pE6oHijDYDZiuKpFNpc1vaaFMHA4MW
         YtbmKRAWnNVWYaz+CzMNTH2tGSI8UZR/idE9DyQf6GWDDXMoKXcK+bcxw6QsyffUEOcF
         5/mObDNJBmhEuxfwaRmD1xFHOkp7GWNMYJF85A0YwmJVkdV0rFRYJvP2pWdgYJAFmusK
         qi+g==
X-Forwarded-Encrypted: i=1; AJvYcCUhVI3Qk5Tt1bCEAMO5I5rqmme42dvsvRbYh6OK/2qQCvHsBLxTwu8O7M2I/F3BVz6LrIcOMCvif68=@vger.kernel.org
X-Gm-Message-State: AOJu0YwAUCfDsuaoFJfMrzRRP3jUQZk6/DUZ5+l57vccPkK73HnAQf7S
	6CVNB7fU4nfxRjIEZ9gCeu3cZhfO3F96kaUn0CNfeyeVwQPn4IPl2J5qPF+JB7iYhlsfUbWD0WJ
	ZvpJgd99MwgJm3mVPffHesqFhlZqmKdOCkZ9d3bvhqw==
X-Gm-Gg: ASbGncusVQ/hoU0ex0oOQ3lNlgKZfHSDT5/F+t97swnBmHmbjecA5P0A/33Rx5gRfNg
	xvBDs/qxsSvfpi9QtHEIj327uQp55sb/J/vVJFHTlSZKEt3ti0ZnI9IvyZaJTXMDcXiVQFs3coO
	rcZ9vodaV7q/d9nVL1OnDOQVevhEjt/M0BwRW3k/UnrRddxG3/WocBGFhzIcJ2DjRLNyvRUlhs2
	voOB0SVmbmDcgoWVEKTgIaG9XCH
X-Google-Smtp-Source: AGHT+IHbUzSApGmCRxnFWZElbyxsoU4/P0TZBLF0BzTvLsCV+miCnogbHJNniWq337bBkZeh/jjC8xT2gDd4cs+U3JI=
X-Received: by 2002:a05:622a:5c98:b0:4d6:173a:8729 with SMTP id
 d75a77b69052e-4e576a44213mr72478001cf.10.1759543725080; Fri, 03 Oct 2025
 19:08:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250929010321.3462457-1-pasha.tatashin@soleen.com>
 <20250929010321.3462457-19-pasha.tatashin@soleen.com> <20251003231712.GA2144931.vipinsh@google.com>
In-Reply-To: <20251003231712.GA2144931.vipinsh@google.com>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Fri, 3 Oct 2025 22:08:08 -0400
X-Gm-Features: AS18NWCqgXSjTPwyDSbb0KSJXp4c4gz9L9NTQCHF71G2zcSqEq0ghlLm9Q7hBiI
Message-ID: <CA+CK2bD+gG41LA5=kfuWh=zsYm5L9Dq+M8Bhg9-2sn05YvNfaw@mail.gmail.com>
Subject: Re: [PATCH v4 18/30] selftests/liveupdate: add subsystem/state tests
To: Vipin Sharma <vipinsh@google.com>
Cc: pratyush@kernel.org, jasonmiu@google.com, graf@amazon.com, 
	changyuanl@google.com, rppt@kernel.org, dmatlack@google.com, 
	rientjes@google.com, corbet@lwn.net, rdunlap@infradead.org, 
	ilpo.jarvinen@linux.intel.com, kanie@linux.alibaba.com, ojeda@kernel.org, 
	aliceryhl@google.com, masahiroy@kernel.org, akpm@linux-foundation.org, 
	tj@kernel.org, yoann.congal@smile.fr, mmaurer@google.com, 
	roman.gushchin@linux.dev, chenridong@huawei.com, axboe@kernel.dk, 
	mark.rutland@arm.com, jannh@google.com, vincent.guittot@linaro.org, 
	hannes@cmpxchg.org, dan.j.williams@intel.com, david@redhat.com, 
	joel.granados@kernel.org, rostedt@goodmis.org, anna.schumaker@oracle.com, 
	song@kernel.org, zhangguopeng@kylinos.cn, linux@weissschuh.net, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, linux-mm@kvack.org, 
	gregkh@linuxfoundation.org, tglx@linutronix.de, mingo@redhat.com, 
	bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com, 
	rafael@kernel.org, dakr@kernel.org, bartosz.golaszewski@linaro.org, 
	cw00.choi@samsung.com, myungjoo.ham@samsung.com, yesanishhere@gmail.com, 
	Jonathan.Cameron@huawei.com, quic_zijuhu@quicinc.com, 
	aleksander.lobakin@intel.com, ira.weiny@intel.com, 
	andriy.shevchenko@linux.intel.com, leon@kernel.org, lukas@wunner.de, 
	bhelgaas@google.com, wagi@kernel.org, djeffery@redhat.com, 
	stuart.w.hayes@gmail.com, ptyadav@amazon.de, lennart@poettering.net, 
	brauner@kernel.org, linux-api@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	saeedm@nvidia.com, ajayachandra@nvidia.com, jgg@nvidia.com, parav@nvidia.com, 
	leonro@nvidia.com, witu@nvidia.com, hughd@google.com, skhawaja@google.com, 
	chrisl@kernel.org, steven.sistare@oracle.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 3, 2025 at 7:17=E2=80=AFPM Vipin Sharma <vipinsh@google.com> wr=
ote:
>
> On 2025-09-29 01:03:09, Pasha Tatashin wrote:
> > diff --git a/tools/testing/selftests/liveupdate/config b/tools/testing/=
selftests/liveupdate/config
> > new file mode 100644
> > index 000000000000..382c85b89570
> > --- /dev/null
> > +++ b/tools/testing/selftests/liveupdate/config
> > @@ -0,0 +1,6 @@
> > +CONFIG_KEXEC_FILE=3Dy
> > +CONFIG_KEXEC_HANDOVER=3Dy
> > +CONFIG_KEXEC_HANDOVER_DEBUG=3Dy
> > +CONFIG_LIVEUPDATE=3Dy
> > +CONFIG_LIVEUPDATE_SYSFS_API=3Dy
>
> Where is this one?

I removed the v4 SYSFS interface, and this line is a leftover, I will fix i=
t.

Thanks,
Pasha

>
