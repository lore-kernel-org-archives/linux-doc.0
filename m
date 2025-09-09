Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAAB225D1F5
	for <linux-doc@vger.kernel.org>; Tue,  9 Sep 2025 16:31:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757435478; cv=none; b=d22OR1QsxLgdWTSw2zVRo+f49YPvcopxdGAURkvx9BWO4nxeBbKdLGJKBYbC2p4EZarffbd1axhyYuXndGDs4/qnWsMAcM2joUbOkPl843HHoH5KznpwGiu5bZlZrdmWPdp+1/e4UpUmJmF54FvJQFJAKnSpWtSc/6GJnAaJUQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757435478; c=relaxed/simple;
	bh=mefygqhgG/25eVyDa/qEx6O2io7m5fyI2dwOWnP2+28=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aQlAENaVC5+IkENtTn8j9QgBC+gG/z4LC/PtRu4O8FD8P0cvHDQL/NxOdVnguOobA0cIVIGGXu3xMh+GAmtVp6Ucr9Ehkej1va2dZ1PKq8lWJfITHZ+ODyJdWcneT3JhFLfc+IdegVsnX31b/Uyo0vg6EVzF6yecxRkU45/kZGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=MjkRVCeG; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="MjkRVCeG"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-4b60144fc74so33235661cf.2
        for <linux-doc@vger.kernel.org>; Tue, 09 Sep 2025 09:31:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1757435473; x=1758040273; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mefygqhgG/25eVyDa/qEx6O2io7m5fyI2dwOWnP2+28=;
        b=MjkRVCeGYqtWgZA51G1XdQDmq0aipoVTf9eHwu/VD4iGDytyMy/y/QSncGUyvrb4gJ
         0GoTL/2AiR8cp4avbjjC8ekpiNWoJVi9sWT7IcLL3/0XQt0uwF0Bj/1BytY+fYCUZ5BA
         G68Sb26p4jUMftUIPEMW7LldKBFyaeexx5bqGI0f/ea1CKosZrBdOggBFOiJbxbST3Xt
         7hXb3WdNphFueG3KdAtlcsjBqC+KEDMDTk9JA0F29NNIDSvBRbIvc7HZ40gLfQIxYEPf
         o/S48YnUGg5RBHVJ8gOIgxhXU1asKIPwb38RuM7Yju9CpUZs5epDsm8loMg6NAdgZ6m2
         7DFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757435473; x=1758040273;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mefygqhgG/25eVyDa/qEx6O2io7m5fyI2dwOWnP2+28=;
        b=qg7VA7AnM8zqO7c/dTQwTEG/1IU9XLf/E+BXoMEhXMu8zA+7iwwSMHmE7grnKdavZo
         ese0WWCfNE0w3shMz3eUVXbV4YCBC4xVZ9xfNDntlW5fy/XVyi/5ZkCIJU9XzN74fRFS
         Uh+XaNP93obq9jg/7lclhkdlZzBVFcADCKuGBgbDICB3f6M5sHCYUMgT2SYtONDDFRNI
         hhKCwaegWlELBeSznjl28ZERwytYOGZbltwIDDCqBuunzw4M3eTCZyYv0ddatgWifDJM
         SEPycIu1HNqDoI+UWDT4tP4uS7TZGw1EFp4jzwTVLbvq9jCD5tOeLqv0tL9A8Ywts3M7
         PJlQ==
X-Forwarded-Encrypted: i=1; AJvYcCXtqyo0TPjnqdeLEYyx4izoR/U5cZoRV2JlZG7cJ93vM2Qll+5tpSrhujeakQU5oVB6/xVgGjLrd88=@vger.kernel.org
X-Gm-Message-State: AOJu0YyFMubscB+5L7oTj3ChJ/QXNiwvDxwodDJiuM/+QFUMADXUNUdh
	wqw8mPAQl44VvXzf4ssUkJ2Dlbfek6NAlbsBHXfV5Py9N/SzL1l3VltN5uQEg6gNzIBfqM5AP8q
	sVenqJE6aeyIXL/HurWcKre8dUcPQ7+RJbrm+bkRVEA==
X-Gm-Gg: ASbGncuo7FxYjFL9z0fiT+8AUVnFi9495dyY3R3Fwztb2beYWrdGUKHu6kJAVHWh1A4
	2SiA0VNcePLu8oFre8D33nWkkU5aH2MIe60dBPkV6yDi34AFw0LgP/JhL3CGSFQAKB+IZhrDBP6
	L4Yxvtow1NEUNHNORR+q2FROAtvS3u8JELswv08t6MdybwdwkEsqbw8cPxfRO9yKjrCCZpQ+hNe
	yiU
X-Google-Smtp-Source: AGHT+IG7jq+sgIVXGN3h/LueN2WhEhyxg+lgF8zD8d4TVGlNbmugwYuofv2hu7ci7G9Y0iK0GJJdSRb+1h+3q0EXcwA=
X-Received: by 2002:ac8:5acc:0:b0:4b4:94e7:7307 with SMTP id
 d75a77b69052e-4b5f85898f4mr141860471cf.66.1757435473222; Tue, 09 Sep 2025
 09:31:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <mafs0bjo0yffo.fsf@kernel.org> <20250828124320.GB7333@nvidia.com>
 <mafs0h5xmw12a.fsf@kernel.org> <20250902134846.GN186519@nvidia.com>
 <mafs0v7lzvd7m.fsf@kernel.org> <20250903150157.GH470103@nvidia.com>
 <mafs0a53av0hs.fsf@kernel.org> <20250904144240.GO470103@nvidia.com>
 <mafs0cy7zllsn.fsf@yadavpratyush.com> <CA+CK2bAKL-gyER2abOV-f4M6HOx9=xDE+=jtcDL6YFbQf1-6og@mail.gmail.com>
 <20250909155407.GO789684@nvidia.com>
In-Reply-To: <20250909155407.GO789684@nvidia.com>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Tue, 9 Sep 2025 12:30:35 -0400
X-Gm-Features: Ac12FXyuJ9OO-2DZjI3E0TxJNzWUwRCJ02D-wXqnWeEvra68NFxAUUaITiNW7fc
Message-ID: <CA+CK2bAvxvXKKanKzMZYrknBnVBUGBwYmgXppdiPbotbXRkGeQ@mail.gmail.com>
Subject: Re: [PATCH v3 29/30] luo: allow preserving memfd
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Pratyush Yadav <me@yadavpratyush.com>, Pratyush Yadav <pratyush@kernel.org>, jasonmiu@google.com, 
	graf@amazon.com, changyuanl@google.com, rppt@kernel.org, dmatlack@google.com, 
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
	stuart.w.hayes@gmail.com, lennart@poettering.net, brauner@kernel.org, 
	linux-api@vger.kernel.org, linux-fsdevel@vger.kernel.org, saeedm@nvidia.com, 
	ajayachandra@nvidia.com, parav@nvidia.com, leonro@nvidia.com, witu@nvidia.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 9, 2025 at 11:54=E2=80=AFAM Jason Gunthorpe <jgg@nvidia.com> wr=
ote:
>
> On Tue, Sep 09, 2025 at 11:40:18AM -0400, Pasha Tatashin wrote:
> > In reality, this is not something that is high priority for cloud
> > providers, because these kinds of incompatibilities would be found
> > during qualification; the kernel will fail to update by detecting a
> > version mismatch during boot instead of during shutdown.
>
> Given I expect CSPs will have to add-in specific version support for
> their own special version-pair needs, I think it would be helpful in
> the long run to have a tool that reported what versions a kernel build
> wrote and parsed. Test-to-learn the same information sounds a bit too
> difficult.

Yes, I agree. My point was only about the near term: it's just not a
priority at the moment. This won't block us in the future, as we can
always add a tooling later to inject the required ELF segments for
pre-live update checks.

Pasha
