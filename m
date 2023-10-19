Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B47938DD3
	for <linux-doc@vger.kernel.org>; Thu, 19 Oct 2023 17:34:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="xvmEuloF"
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6AC4116
	for <linux-doc@vger.kernel.org>; Thu, 19 Oct 2023 10:34:22 -0700 (PDT)
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-53e3b8f906fso11808850a12.2
        for <linux-doc@vger.kernel.org>; Thu, 19 Oct 2023 10:34:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1697736861; x=1698341661; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vrMvigYB3sGbXrzmGtkW+duvRLkjqgFO+ebJCA8YXIo=;
        b=xvmEuloFUK5vMxtbHzs2mrZRiBWtrFHkq5R4Tdr4Rf029w4U+DZvh9ZLc3EWbftwM7
         FK407yfgM4XUX0AmqgPmcqvxgqcSTdhVg35i/vXFUVNMOYnaMiDTSt8EY9bLMVZTLAke
         Z87XX1G2gxSYeqYzZaZYqA7cMo/kh2srtKYU1YNI7t0g9NcDe2w5HZLEYo5xrHmIJdOn
         M79Sfm5QQvIuovE64NvE5tA6qO7ckxrhVXNWKTCXmqoj4jJzugnqiA8CxIadBM4qdH49
         87UHJVRwzQtYWty/nZev1c9pW6IHFcDRXEvFP2ZQxY1s8MzHjdK5FEbb0TT5ri5NtrM0
         g/Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697736861; x=1698341661;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vrMvigYB3sGbXrzmGtkW+duvRLkjqgFO+ebJCA8YXIo=;
        b=Lj2BOjsC/PyIjp/zC4tFTMiQfO980LJ7IAFeXLu4CTtSltJxZGe45OKpWHwieg0tTB
         AJlpkeEJBTHBxLHg9w76b3WQbC5PlT/Pu7o9LOtXE5vzNPMbccYXp/nJLomfweNPgIz0
         LVPYD3o6fulloTPqpHdXT9rrWAyFAC0NWn/zPCE1ROSiOkxifEuQKOGWrV3wRtId+6Jl
         sfWmfTXlF26auBgMLSZNfCkrKADJ17fxgc4BwbEwdCrusGyxpM+cwJc11i3nbVWB1vCM
         9ksqC1I+Nr94Sm/J0KP9v8Q0mkV0FEWO11PV2fe+bqZgXzTSgLEnIFwJm3xHmy7whPYI
         YKxw==
X-Gm-Message-State: AOJu0YzD4LxWoOkRYYYC6Iiu/vmLKFa9QG3Mh/kI3xtUkmqxi+iL54Io
	YLeyfT1Pn/S4FIBJ98Bj5Xu6g4qBgFr5lLeEkYsgOQ==
X-Google-Smtp-Source: AGHT+IEXaAShkeRYMp2kuDHKws4X4gLvdPhiPGnuGhJBGTip6n1Ab0xYv3oA9sQrddtbSVhOwchiiQkFTqpYi+Oct/Y=
X-Received: by 2002:a17:907:2da9:b0:9c5:cfa3:d044 with SMTP id
 gt41-20020a1709072da900b009c5cfa3d044mr2405065ejc.19.1697736860992; Thu, 19
 Oct 2023 10:34:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231017232152.2605440-1-nphamcs@gmail.com> <20231019101204.179a9a1d2c7a05b604dad182@linux-foundation.org>
In-Reply-To: <20231019101204.179a9a1d2c7a05b604dad182@linux-foundation.org>
From: Yosry Ahmed <yosryahmed@google.com>
Date: Thu, 19 Oct 2023 10:33:43 -0700
Message-ID: <CAJD7tkYZ826ysjnoSbYnTH3h7eWKOE=ObHNCADb78c4x7NBHzg@mail.gmail.com>
Subject: Re: [PATCH v3 0/5] workload-specific and memory pressure-driven zswap writeback
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Nhat Pham <nphamcs@gmail.com>, hannes@cmpxchg.org, cerasuolodomenico@gmail.com, 
	sjenning@redhat.com, ddstreet@ieee.org, vitaly.wool@konsulko.com, 
	mhocko@kernel.org, roman.gushchin@linux.dev, shakeelb@google.com, 
	muchun.song@linux.dev, linux-mm@kvack.org, kernel-team@meta.com, 
	linux-kernel@vger.kernel.org, cgroups@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, shuah@kernel.org, 
	Hugh Dickins <hughd@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 19, 2023 at 10:12=E2=80=AFAM Andrew Morton
<akpm@linux-foundation.org> wrote:
>
> On Tue, 17 Oct 2023 16:21:47 -0700 Nhat Pham <nphamcs@gmail.com> wrote:
>
> > Subject: [PATCH v3 0/5] workload-specific and memory pressure-driven zs=
wap writeback
>
> We're at -rc6 and I'd prefer to drop this series from mm.git, have
> another go during the next cycle.
>
> However Hugh's v2 series "mempolicy: cleanups leading to NUMA mpol
> without vma" has syntactic dependencies on this series and will need
> rework, so I'd like to make that decision soon.
>
> Do we feel that this series can be made into a mergeable state within
> the next few days?

There are parts of the code that I would feel more comfortable if
someone took a look at (which I mentioned in individual patches). So
unless this happens in the next few days I wouldn't say so.

>
> Thanks.
