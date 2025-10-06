Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA0351E5705
	for <linux-doc@vger.kernel.org>; Mon,  6 Oct 2025 16:18:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759767518; cv=none; b=EIKJnN0auN6MHzHVHufZIlpe8EvnLdWhAVQ0PU+/ld9Qr9cq46Rcu9zLWQr/KuitLOBo7bWUdysj9qHobAQSs8Tg13n4qBwI1aFEsSutpZvPEASBUiDJpbCtVjsb09UMWFsiLafMO6yTdP/qgCoiQO6j7J9oP9GsSjaj2ELJCo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759767518; c=relaxed/simple;
	bh=Qz9D6w3G/yjpN7oFudrZ5DCv7qahcZFISREkkOiWrf8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=goBmlau6GQXRFkrl2Rx1ivvHihX+mwKWdaODbvGTV50A5nMaQHh7alcYvtABpW0/B8O2NeRDFCZDWA9E/ay7D+5A4NRPFFWCCcm3OHw8y6qyAC1GwbcOK5hZc+M1sqhZRDY4oe7z31JB8D1GOvlQeZytSvnIfoa07gqJz/xZ4zo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=VKxnlQon; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="VKxnlQon"
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-4e6d9573c2aso10699571cf.3
        for <linux-doc@vger.kernel.org>; Mon, 06 Oct 2025 09:18:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1759767514; x=1760372314; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XrjZ2N3nijkKvhfmQO1vA7QLR5P8LLIRs7v5R7YmxE0=;
        b=VKxnlQonDU17q6xDTEbfLgRYJ+JTaCw5HtH8g+bESBjpYEk2C9DC3hHwnntK3WJk/S
         2cp2hYKdkul/t9YZsAH7knaUSNCfjIu9aahu6mtuB0LfLfc5jlD3QS2E/c/oJTRH9X5/
         W/tougYGwUK6/pLT0sX0zvBkKVYRJFJzrX0xKDHX9H/ch2fPrDSwTvs3HHnuvK1Y7yQM
         M4RGvtAWl3DwYiPBesEhuN97tpbhLOUqYxVdlbiBeljlK1en4sSOZ9Iq+qtcDEY1p74U
         kQbnNPVWRxMSAhooqBAru8reNiFSoQlPZghLznA59oQkzSIQ2W5DDBo+TtDBhQWkuZD3
         b28w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759767514; x=1760372314;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XrjZ2N3nijkKvhfmQO1vA7QLR5P8LLIRs7v5R7YmxE0=;
        b=EjLEHW0Z1aGS1YsBGGjpm1BgsNwa2L9N2cK5fu9UC2BCg4xgLtPIzArI+EvxpVPhJc
         Keq2RRg3LtOu3I65HETS8kRmPwx9WxvhK/IxmRJ7TcN7QqKIA453+Mwh1NshhS/ipmdo
         itUwu5dANNBkWUPJ3t7P9epWnanxJAeCzdLdazOG/5aYqLufw5cnWwIj85NIcsgk/DdH
         Z9gIn3iuE8h1z700qaFo/BlwWkQKTjnRGWZ+xVFhn5mvqF29D40v634+ccsFxfK5RdJD
         SmL1dwArQAGsAaJ3ucy5WYSwclGmzfseoz0Fa+GAO3x6mcnHion4KmLEtSaUmf5PPeWB
         Kjhw==
X-Forwarded-Encrypted: i=1; AJvYcCV2NWXqYNGrZ4AzOVb+i0RFLIYe0a4WV/jkQ7ZOv4eirLbghZtcNYm4+ai2kG7ma2I73BlZVAhxQhM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7R1B8LMnk8NwcQSsdOoZcGW9gAYtLm5kWgqc9K1FJwxY5rMqi
	Rb2RnK8IvlRHyl1UZQLFjv1wuEWYRbOC4RQuNhZlaCE+Jxjp9Mcs9WvCUh4pnBbVdG4EHeO6dnP
	jch1Nmp4nofNe3agUjxFY6MZTpPb5CSxyC4Z/TmnRPQ==
X-Gm-Gg: ASbGncuH15wShtDRt0FsOZ8GyDQGlSomIvuioof4ZbRllxvsXFZVPf0912kHeR4Jbrd
	MaUXA9cx7Tq6PSt3b3QQ4AruxSeMKpyl4wKJCo80aP1krvk6ueGpeGCz9dF/qAtGamHvH1BItzm
	BqSRx6G6uQPjVsuu2jbOfYMBNV+r40L/q1w1q4bzcqmD/1JyVYJGqFn22TZMq4OmxOGI+s56FMz
	U1MAKvXYnzBSJX77cSYyrgk3uRAcQUetBey3vY=
X-Google-Smtp-Source: AGHT+IFwm4V/zCKBkbgm7pfKIp77PJD1NOmB2z+7xVCEcG6LKB3NFoKIKgya5mufGjYCV3AhGt61yn25CRIzX8BM9QU=
X-Received: by 2002:ac8:5fc5:0:b0:4b7:a7b6:eafc with SMTP id
 d75a77b69052e-4e576a5c404mr198174771cf.13.1759767511840; Mon, 06 Oct 2025
 09:18:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250929010321.3462457-1-pasha.tatashin@soleen.com>
 <20250929010321.3462457-4-pasha.tatashin@soleen.com> <mafs0bjmkp0gb.fsf@kernel.org>
In-Reply-To: <mafs0bjmkp0gb.fsf@kernel.org>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Mon, 6 Oct 2025 12:17:53 -0400
X-Gm-Features: AS18NWC8dVdnh9WrIeR8a0qx05q3jEVozl0VBzvOu40iLLzMHk8IAd4vKASusLs
Message-ID: <CA+CK2bBS-v_djpvw3v-xumPizzmOaiPsuPpoxnSUub-LocghjQ@mail.gmail.com>
Subject: Re: [PATCH v4 03/30] kho: drop notifiers
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
	stuart.w.hayes@gmail.com, lennart@poettering.net, brauner@kernel.org, 
	linux-api@vger.kernel.org, linux-fsdevel@vger.kernel.org, saeedm@nvidia.com, 
	ajayachandra@nvidia.com, jgg@nvidia.com, parav@nvidia.com, leonro@nvidia.com, 
	witu@nvidia.com, hughd@google.com, skhawaja@google.com, chrisl@kernel.org, 
	steven.sistare@oracle.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 6, 2025 at 10:30=E2=80=AFAM Pratyush Yadav <pratyush@kernel.org=
> wrote:
>
> Hi Pasha,
>
> On Mon, Sep 29 2025, Pasha Tatashin wrote:
>
> > From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
> >
> > The KHO framework uses a notifier chain as the mechanism for clients to
> > participate in the finalization process. While this works for a single,
> > central state machine, it is too restrictive for kernel-internal
> > components like pstore/reserve_mem or IMA. These components need a
> > simpler, direct way to register their state for preservation (e.g.,
> > during their initcall) without being part of a complex,
> > shutdown-time notifier sequence. The notifier model forces all
> > participants into a single finalization flow and makes direct
> > preservation from an arbitrary context difficult.
> > This patch refactors the client participation model by removing the
> > notifier chain and introducing a direct API for managing FDT subtrees.
> >
> > The core kho_finalize() and kho_abort() state machine remains, but
> > clients now register their data with KHO beforehand.
> >
> > Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> > Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
>
> This patch breaks build of test_kho.c (under CONFIG_TEST_KEXEC_HANDOVER):
>
>         lib/test_kho.c:49:14: error: =E2=80=98KEXEC_KHO_ABORT=E2=80=99 un=
declared (first use in this function)
>            49 |         case KEXEC_KHO_ABORT:
>               |              ^~~~~~~~~~~~~~~
>         [...]
>         lib/test_kho.c:51:14: error: =E2=80=98KEXEC_KHO_FINALIZE=E2=80=99=
 undeclared (first use in this function)
>            51 |         case KEXEC_KHO_FINALIZE:
>               |              ^~~~~~~~~~~~~~~~~~
>         [...]
>
> I think you need to update it as well to drop notifier usage.

Yes, thank you Pratyush. I missed this change in my patch.

Pasha
