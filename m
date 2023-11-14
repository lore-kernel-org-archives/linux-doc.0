Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F20A541773
	for <linux-doc@vger.kernel.org>; Tue, 14 Nov 2023 17:20:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="VjEf0JiO"
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A3CF11D
	for <linux-doc@vger.kernel.org>; Tue, 14 Nov 2023 09:20:24 -0800 (PST)
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-9e8b36e36e1so371423866b.0
        for <linux-doc@vger.kernel.org>; Tue, 14 Nov 2023 09:20:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1699982423; x=1700587223; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3rKlcLic1qzOex60qzBrHqaG9Vs5/tn6fuZtH/qFUOA=;
        b=VjEf0JiOpZoFwHFLqXzORodvUwts2fxJT6cldHtqnid3lXj2yjyzUBUV24i+9/Gxzw
         jzPGi3VxjM6KOaqgrMvTNp+ONMZsAzOsGpFSMYS9LJKXkuFcua4cgTsYZwR+QZam6Wrf
         ZGZhgx2lScHxMOnoI7GUw3BakiveKKVPoJ6BFr710P1aYh7bSuXUJDieHfCGBkHq/zCL
         XSpSJRyWJsdyeihHp8yomZsRkx855QAnw0vtryonCsgOxAc8zRTFt6rN9SoaahLZ1Qcp
         YXUyzbbDatgw3VK58kWEfIoGsiim5+2TJP7lOLP+S9LHWIAk6q2THbhca+RLPz5z6ewU
         REwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699982423; x=1700587223;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3rKlcLic1qzOex60qzBrHqaG9Vs5/tn6fuZtH/qFUOA=;
        b=LrmRkXr2g7Jlg16zRg91htE2V8GgNrdJbfoGVQ52LafdjDiZnTmNohzc2twzoVACUM
         U2voPVd4nj27G+Uamrc7+uZDStkq3f/KbHDkqHO5++gPkJlDdgkpiLLdOmBt47FxybIl
         YQ4fMsy1DiypubuAGr1O9sBZ2xZOaWavC+3iBd0zJiL8rupPRS1K5CYbO/uFLnpwkGP+
         Oiy+/DyCjJutlXqlQq9951rmkLcJRV6/HN2VV3qPNCtlAe7izufAzCnxrxiQdd6xs8F9
         XzzuzeHfwNtYSxXbesgvOUbNXBCqDgpw5MKK+FTMlCYAUCa9/MGh7C2hnx0lYRBgFjje
         2NJA==
X-Gm-Message-State: AOJu0YzYCB7vftEFEMEfchqw3TF555tSeweyyyxswjitLUQCMJ6zU15F
	y3jdyofQa/NrtzDeDCdmaVdzmoQwU821g6bMt69+AQ==
X-Google-Smtp-Source: AGHT+IGhSisnarNys5lTyq4VL5Encb5qZA5tBioOvi7RCHTSdUTNkv1pqYrWuCzXMyZa6ml0jbKaDxtpHidMHyJEskc=
X-Received: by 2002:a17:906:c56:b0:9db:e46c:569 with SMTP id
 t22-20020a1709060c5600b009dbe46c0569mr6783787ejf.45.1699982422867; Tue, 14
 Nov 2023 09:20:22 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231106231158.380730-1-nphamcs@gmail.com>
In-Reply-To: <20231106231158.380730-1-nphamcs@gmail.com>
From: Yosry Ahmed <yosryahmed@google.com>
Date: Tue, 14 Nov 2023 09:19:47 -0800
Message-ID: <CAJD7tkbbkk1anw06fNpkHB==dmVPfDOja+Bae3uB3y7U_NaJnA@mail.gmail.com>
Subject: Re: [PATCH v4] zswap: memcontrol: implement zswap writeback disabling
To: Nhat Pham <nphamcs@gmail.com>
Cc: akpm@linux-foundation.org, tj@kernel.org, lizefan.x@bytedance.com, 
	hannes@cmpxchg.org, cerasuolodomenico@gmail.com, sjenning@redhat.com, 
	ddstreet@ieee.org, vitaly.wool@konsulko.com, mhocko@kernel.org, 
	roman.gushchin@linux.dev, shakeelb@google.com, muchun.song@linux.dev, 
	hughd@google.com, corbet@lwn.net, konrad.wilk@oracle.com, 
	senozhatsky@chromium.org, rppt@kernel.org, linux-mm@kvack.org, 
	kernel-team@meta.com, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	david@ixit.cz
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 6, 2023 at 3:12=E2=80=AFPM Nhat Pham <nphamcs@gmail.com> wrote:
>
> During our experiment with zswap, we sometimes observe swap IOs due to
> occasional zswap store failures and writebacks-to-swap. These swapping
> IOs prevent many users who cannot tolerate swapping from adopting zswap
> to save memory and improve performance where possible.
>
> This patch adds the option to disable this behavior entirely: do not
> writeback to backing swapping device when a zswap store attempt fail,
> and do not write pages in the zswap pool back to the backing swap
> device (both when the pool is full, and when the new zswap shrinker is
> called).
>
> This new behavior can be opted-in/out on a per-cgroup basis via a new
> cgroup file. By default, writebacks to swap device is enabled, which is
> the previous behavior. Initially, writeback is enabled for the root
> cgroup, and a newly created cgroup will inherit the current setting of
> its parent.
>
> Note that this is subtly different from setting memory.swap.max to 0, as
> it still allows for pages to be stored in the zswap pool (which itself
> consumes swap space in its current form).
>
> Suggested-by: Johannes Weiner <hannes@cmpxchg.org>
> Signed-off-by: Nhat Pham <nphamcs@gmail.com>

LGTM,
Reviewed-by: Yosry Ahmed <yosryahmed@google.com>
