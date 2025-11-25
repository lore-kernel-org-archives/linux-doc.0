Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE9562D3EDF
	for <linux-doc@vger.kernel.org>; Tue, 25 Nov 2025 18:55:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764096908; cv=none; b=JlvNF84Zt0iCbUD/jH7KGcQ/hFdR3DaZH/Y/rqYJmhrpqcPhCVhghvHppe8xJXc9I1oJuBycnZbf2cew+NGzMsWUhbyYL1TadJVJNj5ePZzTckjnMRHJJBmplv9iEdvn/UmzCJvz8tvXxbxT6yJuoLLmi4HsP6tnKVFrWZaf4xM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764096908; c=relaxed/simple;
	bh=HRq0fEmSLdbqSqBDU+IM/YitmlyC+uQDyXNbdhOeZwA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Xk3anoDcIvEBG1JHjh4d4I/ukzpHK0k07XOQrfhFJk+M7BgvY22Wn8KL8qVFynCOdf0JDEG77i+9TXw4BE/bDIPfQNavg0GDW8fhXz0M3rHW/IkmGYFe/F8E5kZgqz45T/xIeof4l0LkwJctlrfaaqixlFeOTvxoCt/138YLrcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=XtG8w+eB; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="XtG8w+eB"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-64320b9bb4bso250336a12.0
        for <linux-doc@vger.kernel.org>; Tue, 25 Nov 2025 10:55:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1764096904; x=1764701704; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TTCNx8vWQBYhmY++zaqhyqyyYNnaJr9KGGVzzHKQdqA=;
        b=XtG8w+eB5qRXzPUgChF/yWMI90bL9wBGTJZonr71PdWsilhnchYUYbU8ktoM5jSBjG
         M48R7ZzKCgh5y4SjsO8xwDPTrzzzfLM/eMyLLWsVgSdHrBbvdkT1027JBw/vxgqmBiCx
         pt4rd7Bg0seNjlTrb6bCA7ywnjVXyQMQ8LJohNPtuR3iyKAZEEP/dELLoHF8QMZfiSqf
         T1ZIOB1S+xfMkkLG9y8rqkg50JGiVoGsp5mU2KwLihpP4ibpgSY+csFoUd79VP1zp5mN
         PZVSpHod3QkgieyEgI7E9UlhW5hLg95ghwgVOi46fvxxo4b2TLQvJl4E0nChDfhOPxyd
         r1rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764096904; x=1764701704;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TTCNx8vWQBYhmY++zaqhyqyyYNnaJr9KGGVzzHKQdqA=;
        b=jcDL3ZKgjscZyj6xHozLQtjOlES07pgJ4tuqOEHEsT+URnjYDiiioq/ed5cfhbRcAX
         MXfYAmN61tLTD9t2kkB0W+30toFgQkSkfaOL44Pa//NT9k09sWT5C44t04TVfjmmlxWJ
         neAPAH8aGvwx3hwgcRUbUwDTMxm+BszSZSkYnmXjXltqKOGlFRPBgq5bN22Z53Ho53Hj
         ARCOixzDlHeal/Kce+1y+zOK5VnjCgf//w+xyncVTtjFu7uvFmnmXS6d1yPvMsKJLUY/
         N3lzIIU2x0IlGmFph9VSmphiSu+WRJMhlauVC7pn36FtX/8QVrabFyi8LsDTGgC1Xk7O
         z0LQ==
X-Forwarded-Encrypted: i=1; AJvYcCVOPWAYQ/TehR9PjVslHZBFbHYtTPQVxCxXqUPLGN/xkXf0wXQYaFR9xfiuV0laEsVLJuAECHMEuf0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwkvhvGgUQaD3mpUci6m44Pqx2bhiS1+JJvCOvZDfFGShP2MXPx
	qx3S8SfWFjcTh4Ashocaha5l2IDTJP4EqUF23yLbmWFC4SA+3TnXd+h5jp+LPQYXFJ3slOgZ8OM
	D0IYFBXX2F9Zn+Hr+gfbX2tlhmv0BcYjuMVylohGtEQ==
X-Gm-Gg: ASbGncuBtzvyq4aJsunWbdGOQ4MByMAF+3gpcGrRPZOXXJ+QS6go4qA/6yvqB+6YliO
	lTzHa8E0OMwPgx02zBVnRiC4Yh3cNUk60gn5psvJNvJuoGxPiNXIVJnDQ2U4K2RFy2aY2+Kw0Q6
	e81Xcv0hWWdvUpZxiOFrl1F4H+ogVRDVSg1aI/kB4bAbpasvJyciheVuGs7Gj3wPa3IJdW4cLfV
	cuTCLYGgf+pptMbMOShhqxG1cD0nuCxfEtK9wDH57HOc0IKqswwJP1hNuuZqa5gtk56
X-Google-Smtp-Source: AGHT+IEfzHlIPEiuolnmC+PUY7Qx4g6VZmzqaCh+kJH+E2RdrqezJkmRTURyahiQenFGIYx+F1u+CuUpBK9+z1Di0cU=
X-Received: by 2002:a05:6402:4499:b0:643:130b:c615 with SMTP id
 4fb4d7f45d1cf-64539639594mr16646192a12.6.1764096904062; Tue, 25 Nov 2025
 10:55:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251125165850.3389713-1-pasha.tatashin@soleen.com>
 <20251125165850.3389713-2-pasha.tatashin@soleen.com> <aSX6sQqwwA6I2mxW@kernel.org>
In-Reply-To: <aSX6sQqwwA6I2mxW@kernel.org>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Tue, 25 Nov 2025 13:54:27 -0500
X-Gm-Features: AWmQ_bn51TAVMNgVIbPP9PoxfS_5IRPJ8eZ2jrzKpsVEpovGvgRKZept8XkPO9Q
Message-ID: <CA+CK2bDUgU8iBOL6eUeK96fZ3-XfokCma43cTore20c1L6GE0g@mail.gmail.com>
Subject: Re: [PATCH v8 01/18] liveupdate: luo_core: Live Update Orchestrato,
To: Mike Rapoport <rppt@kernel.org>
Cc: pratyush@kernel.org, jasonmiu@google.com, graf@amazon.com, 
	dmatlack@google.com, rientjes@google.com, corbet@lwn.net, 
	rdunlap@infradead.org, ilpo.jarvinen@linux.intel.com, kanie@linux.alibaba.com, 
	ojeda@kernel.org, aliceryhl@google.com, masahiroy@kernel.org, 
	akpm@linux-foundation.org, tj@kernel.org, yoann.congal@smile.fr, 
	mmaurer@google.com, roman.gushchin@linux.dev, chenridong@huawei.com, 
	axboe@kernel.dk, mark.rutland@arm.com, jannh@google.com, 
	vincent.guittot@linaro.org, hannes@cmpxchg.org, dan.j.williams@intel.com, 
	david@redhat.com, joel.granados@kernel.org, rostedt@goodmis.org, 
	anna.schumaker@oracle.com, song@kernel.org, linux@weissschuh.net, 
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
	chrisl@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 25, 2025 at 1:51=E2=80=AFPM Mike Rapoport <rppt@kernel.org> wro=
te:
>
> On Tue, Nov 25, 2025 at 11:58:31AM -0500, Pasha Tatashin wrote:
> > Subject: [PATCH v8 01/18] liveupdate: luo_core: Live Update Orchestrato=
,
>
>                                                               ^ Orchestra=
tor

I like the sound of 'Orchestrato' :-)))))

Thanks,
Pasha

>
> > Introduce LUO, a mechanism intended to facilitate kernel updates while
> > keeping designated devices operational across the transition (e.g., via
> > kexec). The primary use case is updating hypervisors with minimal
> > disruption to running virtual machines. For userspace side of hyperviso=
r
> > update we have copyless migration. LUO is for updating the kernel.
>
> --
> Sincerely yours,
> Mike.
