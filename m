Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795254788;
	b=klZJTz9uFXoEEhdLXkNmNNzyog/y82v+80biCWsZ040niW+rjDzjK6NiJnaS7EvG3zdf
	 TV6wSUzY6NNdXlbjojne69pIHcVE5C3jfFJqlqIUhphf8Oci5GhgzMlcfynrp4eZzOKdG
	 ks7dtoYpye11+FW4OGWYeLJ5snzxpqX0BvN6exTP3fxlt06acpCC9e9pATV9LGB1Kwi1l
	 JjjqEw/XQ0+H0H9q8IPQV0rb4CFopPPk2pU9u06kA69AZ0lKFD3+UMGxiO80+6rXKp8vz
	 bYNSDA8K+eLzW6lWtdgKSAClEF6B8ao2psPDrKMH7wc/LU6+/HxtuOjnID2sDPtzTRQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795254788;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=zENLsrjxXzbyMbN8YT2IRoZaTX6XrURmTnkpOGqlJsA=;
	b=BFyYmXwqdaZwBaR9EBIbsaj30aUM/SnLM0yFeICDFApp9qBcRwgq760wbg+JmDPr5pPY
	 ObEDtJCoh7mTCAK+Q31vg20L8XNMnymTmHkib/mLwcrmnshkZo24LWIAZdkHY4OqKInCK
	 okgC/sK/CsfAmMu5x66RzfC5ILmz1caFia06xaqcSSe3ghh81WwAXbAgoAYzjOLQYYOHh
	 fszEUR9F/NgXkyJUwhngf1h2Btlf91Dcz7kPg2FsFx/FxCmFUBGP9X/64X7TgYHfrhePe
	 ITxJAvlFk36wtIaa2Bzvodep0YnYeyntAlMmgORJxsAeCdoEXTp36M1EZDIzi4fpTiA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wbFgbxOU;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.54
Received: from mail-yx1-f54.google.com (mail-yx1-f54.google.com [74.125.224.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D8EF606A325
	for <linux-doc@vger.kernel.org>; Sat, 21 Nov 2026 09:53:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5D8EF606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wbFgbxOU
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-67db5e13b0cso1585802d50.3
        for <linux-doc@vger.kernel.org>; Sat, 21 Nov 2026 01:53:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795254787; cv=none;
        d=google.com; s=arc-20260327;
        b=RGgIk96LYvozlSe66ET/H99rEsYX1WK2MKcl2NxklCoKbByFIMQ4ndBUM82IKgvTFd
         IpuGdYIJutR+IxLQCU+RF2puTPhoAyfu9L4O4pA3/xLNxXCkEOBnXA93rcNbr8+p1xlq
         96ocs/0CDSwZ7m6aFz+YYb7uY6A3I9HaJ1LYniI39jsOth+vHP2RVEqM2WRclatgwHwH
         FKB0KWOaPLJ1bH7guwg7TRhGQ+SbwAreJ/sUbZRUY87Kck/3Gfh2YMHw3DwOXw8KPfR4
         uQpj/Vy57HV0glwOyvMTTA4ql+ycz/pqbHsbxfthwCXMCIhbhxQaypc74KouzMnEJVEM
         RSZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zENLsrjxXzbyMbN8YT2IRoZaTX6XrURmTnkpOGqlJsA=;
        fh=DVWdZB9Yl5lVQ7hXxExS/OCYJ74d/mNoUK+v/h5W5sc=;
        b=lxH9hURn0fXHasFx6wNxVMmHSj+ucCRfMw5/iaqYw1oijXMr/hnFh2+YSm2rx5kw9M
         MNIdU3cM0uO4bmhm5XcbvAmEoy2849B+TelgBAlrrCkBLM9LkujxmUTWEsvEczKQ73yK
         cDdBDP3DYBqOStt/kPk1CpojpEl5gNoOZetGfYk107CejPl72zNcvCftFQSxNwx7PrGh
         a8w7aPgMJjiVEkfu5ZHKdU54HtstVE7gvtPtMAj6wNN4MIASSsnWkzMtsCS7fgxWW4pW
         tTgpXo9gou2o1upuDS+cYQ6kS9moe4ezzU0LxS6azM8io0dHy8ALOZ/o6vXsjyy9eIZg
         Cmjw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795254787; x=1795859587; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zENLsrjxXzbyMbN8YT2IRoZaTX6XrURmTnkpOGqlJsA=;
        b=wbFgbxOUakxTryJoiXSp2jmblEj0LxLmOUxBjzHpXKYmiO60BUuehLCYUjuiyQ1Bz2
         hTvI5lndvJ23ERuXtOUhJ/1KFR+P3K5pxH0jNAUHERWMP2BzwJ/Qz0pSPqolgIkx/pkA
         PJLfI8KIaKCUvP+vLALE18C8V/3bB1kXoh2Ero77lNo30zVT3cdckHfzmGgljHp31UKC
         8oRy02cXHh5dKfVf+aH0MTwMkPgwjKsWftGWJNaOHSCZjTo709pCO8zzqPupBud37S9i
         DZFVwA0NsW6p0Xo7/qVoTWsFoEh+u75OlvyDdKcpxcwkHSjCD+iC3WtrGGgeX6wZmA+0
         2UIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795254787; x=1795859587;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zENLsrjxXzbyMbN8YT2IRoZaTX6XrURmTnkpOGqlJsA=;
        b=Jiq//nKQF2n4DE4LpH6pbaNKkxw+RZIXDlz+L6kiJo3Rzy+LBqJhrLFqTvvuKfmJdO
         jsxjLv8JQDNVUFf8TzhMuqUTOnwicTEIrTfI7AL1Tpt+9N9rxo4wXMUNTnaUNrm4BXoz
         u+JoDhp6Ru+Ye//LtHEPc/5GkbGCsijQsi+P5YXOu6dlgnjwbnhZ865LhgItSeP8V0Wt
         PKv7LIjKw+oEyq4XL2aCSNj/o/86L2ergZE/V8ErCR96dMPdhEhg7zrhy0msDXHYouxZ
         cTTk5KlTzAqtHBQXpmArXea5Ukc4RWeFELAhl/Z9uIzWqzYJj/NEKY19tbJDaiV3dymn
         GMRw==
X-Forwarded-Encrypted: i=1; AL+hErEyurwNv/tfrIl6/azjb2mWnh6X6xRTef0pYp2k+3FzBz2iVprbTfjE1IUVnrGX6m/yF+6o4ia/fJ8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/m19v24yXrZNsXdi8Zq1/k9cqwrms6lYek0EmjJqXEsJZeVZnc
	hHeXbdlx/Kx5DBtD4L+wf8i5W9TpG0lDBQxBm8NpxLnOJwd8BCvCL8Dn1mAv6KNFf3ngHRzbvSZ
	xEe4hGfRtMD/Xrb7UTQbZdiPPt/+ijDM=
X-Gm-Gg: AZFdTZceo7xywht2haL3GUifUdlY2kjWWxXBAyyOVau/u8orKSslPCs/suu1WQ7PwmL
	WpW98ywcUyql2m5nNdXpzadIRzhGby8+ilDLtWzbW0/Nbv9cf4VFMLmYGUljdHjq2vTJGw4cY82
	dtANUoosbJXlcQlNu1oIab7P63jrhnMurGDv/Pqshjkb8qQyycgpXNduF/IJ2ZbtMRgMu91Adbv
	WqNvMD8oJ2ZR+PS6rEPLwizDlIffxswbs4NoqSyxX8JjcLSzPdObLljoDQ0safYntTv1ShrmG17
	oosQexrRIgYPRjap+raThbhlOWN4j1WuZwifJAzK2BuLT9ZkxwWCRFxOqzkfETy7jw+HVafkTZl
	gkyjUo3nMZwEBVfgru3PGouaOfWON2bmk6zU5ykc=
X-Received: by 2002:a05:690c:9a8f:b0:8b4:cd96:e2e5 with SMTP id
 00721157ae682-8b52047eb39mr22433217b3.57.1795254787409; Sat, 21 Nov 2026
 01:53:07 -0800 (PST)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261120141225.789350-1-sidong.yang@furiosa.ai>
In-Reply-To: <20261120141225.789350-1-sidong.yang@furiosa.ai>
From: Gyeyoung Baek <gye976@gmail.com>
Date: Sat, 21 Nov 2026 18:52:56 +0900
X-Gm-Features: Aa3M54p2-QsFjV4SsFcebynkN_mXbs5R4b29wWDoqMp8rJ_L5RBNQwxz99F4OLs
Message-ID: <CAKbEznuH4sgiAQvnCxh+DeLcLHfzariiMumo-K9S3=zi7LNYxQ@mail.gmail.com>
Subject: Re: [PATCH v6 0/2] accel/rocket: Report NPU usage through fdinfo
To: Sidong Yang <sidong.yang@furiosa.ai>
Cc: Tomeu Vizoso <tomeu@tomeuvizoso.net>, Oded Gabbay <ogabbay@kernel.org>, 
	Philipp Stanner <phasta@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
	Matthew Brost <matthew.brost@intel.com>, ckoenig.leichtzumerken@gmail.com, 
	Tvrtko Ursulin <tursulin@ursulin.net>, mcanal@igalia.com, Heiko Stuebner <heiko@sntech.de>, 
	dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Sidong,

On Fri, Nov 20, 2026 at 11:12=E2=80=AFPM Sidong Yang <sidong.yang@furiosa.a=
i> wrote:
>
> Report how much of the NPU each client uses through fdinfo. Patch 1
> exports the runtime the scheduler already accounts per entity, and patch
> 2 uses it for rocket's drm-engine-npu key.
>
> v6: Rename the getter to drm_sched_entity_get_runtime_ns() (Ma=C3=ADra
>     Canal). Report rdev->num_cores, the cores that are bound, as the
>     capacity instead of rdev->max_cores, and skip the key once no core
>     is left as a capacity of zero is not allowed (Ma=C3=ADra Canal). Add
>     tags.
> v5: Use the entity runtime from the new drm_sched_entity_get_runtime()
>     instead of a counter in rocket (Tvrtko Ursulin). Reviewed-by tags
>     are not carried as the accounting changed. Based on drm-misc-next.
> v4: Single drm-engine-npu key with drm-engine-capacity-npu, and
>     documentation (Tomeu Vizoso).
> v3: Add a rocket_engine_usage_create() helper (Gyeyoung Baek).
> v2: Size the per-core counters by rdev->max_cores.
>

Posted gputop support for accel devices to IGT, which shows the NPU
usage from drm-engine-npu here:
https://lore.kernel.org/igt-dev/20261121094225.628262-1-gye976@gmail.com/

Tested on RK3588 (Rock 5B+) with rocket and panthor running together.

Tested-by: Gyeyoung Baek <gye976@gmail.com>
Reviewed-by: Gyeyoung Baek <gye976@gmail.com>

--=20
Thanks,
Gyeyoung
