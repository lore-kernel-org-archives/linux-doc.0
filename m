Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793848959;
	b=LYhy0ZTWwAGZceGJjj6c1dqUxf1W8JDLFYhvrYNN9GerUR6H5c+MFZLRosoJQNwzNCKK
	 ZYUjfC2MJIE3E+s47pkLPw9LzD3TUltC3rphqQvnJNzekUSqWNWGX1uTnpAXAeDfn6Wat
	 D7hvVUwd6wv1nDMWRZEYlIOjCwW1qmYdC3rMB/N/7sV7g1WuVYBbIgiRUcgPgnJb8QpU/
	 NXOpDsnh/g64uoGk+Fq2GNKYc5eZlxIVrhP67p36UcaJBEkBJNTxrNoUu5Q2mt6qiyRu4
	 fm77hZ1tNFLf1gZ8MsiFF7x88e5yM0n3A4Vyb43pwtxvbkkSXldDLu4pyOxcpv02rQg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793848959;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=avEJPS9ML1med4KWJvijH4mGMhfCeFDeDWnEyAF9h88=;
	b=t8BstoSfkx+0BUIVS+vx4VuPi2WC6ZqsULzptWipVdyu0LzOBE7jEzzCxEsDgMjPW8l/
	 MupzLwbxcV8F6jS1bBQaEbkGfrLp2h0/Abt0jtixHmANU/KpRBEMKz9K+s8nGLMnA4uON
	 m42ALzNEW8/rT7tIJjqvxcPyCpnppkWcO1jqjm8KPojOjCrgN0umAw12CvuoYDJgVdFMy
	 8Jx7oRuO9qgK2VUSYIt79evpewLNCuV8aipQzcEUdUKFYQu0ZCT7D0Olo3Dtlej0qECFa
	 z4KYLFYLNUyoEyICKLn2QYRvuYuQYXbO+9RZoZgLUX1Ay3A9MY6axtXPIKwImMDB6OA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wfKj1buQ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.41
Received: from mail-yx1-f41.google.com (mail-yx1-f41.google.com [74.125.224.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0E5A606A31B
	for <linux-doc@vger.kernel.org>; Thu,  5 Nov 2026 03:22:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C0E5A606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wfKj1buQ
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-679334baa1fso2190612d50.2
        for <linux-doc@vger.kernel.org>; Wed, 04 Nov 2026 19:22:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793848958; cv=none;
        d=google.com; s=arc-20260327;
        b=FjoovzwnG4J1MEAB3wHmSZobwZh5KKbv7OPrvLUBoLPvJrSeTtbs+Zme9q84NmOg8D
         QODCAG33lLNw2Mb7VBcfpsM2O59GytzoymrjHApTDwJnrvlpqbITAGfIDmt/yVWva0FO
         pQODMUqYzi2t/5ALymtYnLsRL2BEji3GR9xB9snzDDVMaq43fh9/VSj0TwASCk50OP4V
         cPoJOgWQUsqX0W4smIsoiquEScAUc1MJfUnwnFDu9GgWJdC4ettPb/vIg7Op0zfkKC3S
         KqiexZNP2zjWXsn8VPtSvwzZPVWyg8bDkTqeOA5UIff7aME9EmryCS9m4Xkgd7QVDzLi
         n0Ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=avEJPS9ML1med4KWJvijH4mGMhfCeFDeDWnEyAF9h88=;
        fh=jEPo7DMCoYqIBtALHBPaTyDdGVx//IBFM38TSWMrgIk=;
        b=O5rfwkB81gl6AWQd2KHl9bUX0mfF2addcwRoRZp+IJo8oHjbGO5yMMxYBulLr35cT7
         N36NgsVufATs8h+J5wT15cAKE6NrWg/0lkc2lxzU5LxBE598q09CNwK5lS0RvMupbAtJ
         TN1GCRUErwywWsZGziulEaXVM50S8//yAMsml3+IxoQnioHwfuw6BTjiuhx0K9TyNCNy
         /aVVxmOGz0TEXv+PozVBiY3gjdK9GInuSlnNti1gQkJqzHt97iFgiozVdsInO2HrAj0C
         bCy49KnZGb3IsLbWXNCc6rV4IItwq0+tT7Uh5vHmv4y41csD8oXl3+l7RpKgCABT//ST
         blNg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793848958; x=1794453758; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=avEJPS9ML1med4KWJvijH4mGMhfCeFDeDWnEyAF9h88=;
        b=wfKj1buQf/rydzJNuxv/MSQxz9n5O0E6PI+4GaO4nSUuyc+mE3m+KuMYE+3ENtMSOw
         xi0XQtoXxUTXkdyvHM5PpS0P71lFsYi58/bgV3qG72I27WGWAx3i78Hq/PGE3dJcTMcr
         HYmSTUJ1w1NbMTJ9E7RnbniUge1GF2z6Nk+ckX0ePry1O1ylw7ZipyCmuyzYv3HjDE0k
         ydDH2CsVXRxAuGC3ANurAWomBm9/kUlPhcoghbfEXyPmUSQ1mxi9uOy3fnF+Y0nWgmrm
         tFTG/FTgyn1D5L4wfKlhfaAE8urWwe8WOheH3ZkQxcic3LOTS0Jw6WOjWselp0G7OIsH
         vSzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793848958; x=1794453758;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=avEJPS9ML1med4KWJvijH4mGMhfCeFDeDWnEyAF9h88=;
        b=AX8pSvv5byzQrAx3gk588aRVOEFAdO9OQ7rPHSMWHXt3i0vChsqwe6cv1Wd8vaAf2R
         iSDlFQQin82pzBkB98x2PGwD3o8wRZYjbInivJWq6td8rV95xciv3KcXTURqWvbw3XNT
         ulD64/N48DoCiz8wEt0rjEu71jeTlqCpoJTPATBRu6kseNIg36OSB4x68IIMizWw/srI
         iBaprC9I1UlYEF/Xv5nM+alhHv2PJp7dUeAgYlZluaH/kyEMh8Qbs4UGrfJ+dAbmVcOS
         7nNv2VskW/Or9rizTPJd4PoRI1NpcdE4mClc+CcN/LH5z77CUliE9nIAY9zMiV9nZEra
         7abg==
X-Forwarded-Encrypted: i=1; AKwUvBw7vSl/zbDk4JCWs/d8TGzO3TwUSWzi+dwqyPbJUOolqed3k2jdX3rnComD15Ki9cDQPsgKyortb6E=@vger.kernel.org
X-Gm-Message-State: APuU4Z/+57H2EI1yUSoh7nQMqsNuqjMtuq3sTManzqXEpoFz7SDbqLk9
	Eij25meq0PPx5Y+zoYMKHeEpKfSv1hirlXoddfKQUMH4OeLe4k4W/QA/geV8a8AcWEJtvEvccgL
	LS9885M8wmoWRWBQmPvbkpNJ40DMEzKY=
X-Gm-Gg: AYBFou2x+04rVtjst05H3LjIG4ztFiu8fKq0XwBrEWDC7QJ+Abc6GNDVZ9/d3E7J6th
	egrgWkioPiz7ez0MlhCqsNTI6MJ889EcIFbGUm5aUKSxjT86g8auXivRDzCK12hrXG97aRurHVy
	IpqNAz27doe6mXekTEpguTE3PqZVkPYKW/WrO2euMgkd8h7DzDgFpLG+ht2/2mILzqhAfNVbCEW
	jYNfp/KYt9qEv8HD3sRWu0w/pJWBJiVsgAM3B2zpkYsrGmF791hCBgvGalLPvyWqCqIqzAxj/GP
	tPMLeVVHt+Sb7TbePTP1rrF4+dFzdTc0g59QQ9hqhIrbxMr/rCvP8n7raIROwr5ivXNCKZ9hmN8
	TXPAoWur1KyUqZvqKhhnHrRxQCfPZQ1/oXtt9xLhZzQZIpzovGorL+CIPHi4=
X-Received: by 2002:a05:690e:408b:b0:67b:fe7e:3796 with SMTP id
 956f58d0204a3-67bfe7e3a47mr1118045d50.5.1793848957564; Wed, 04 Nov 2026
 19:22:37 -0800 (PST)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261103155338.1949294-1-sidong.yang@furiosa.ai>
In-Reply-To: <20261103155338.1949294-1-sidong.yang@furiosa.ai>
From: Gyeyoung Baek <gye976@gmail.com>
Date: Thu, 5 Nov 2026 12:22:26 +0900
X-Gm-Features: AclHuK-SpSCz6RumENvx2yQ6iVXRKTEGvo6_tUmRKMrurLM7QwlEqialnFZRCuI
Message-ID: <CAKbEzns7nqMP0FSf+G9e31nXR-c+vy+Vv-gTyFV5jv46rAgwRw@mail.gmail.com>
Subject: Re: [PATCH v4] accel/rocket: Report NPU usage through fdinfo
To: Sidong Yang <sidong.yang@furiosa.ai>
Cc: Tomeu Vizoso <tomeu@tomeuvizoso.net>, Oded Gabbay <ogabbay@kernel.org>, 
	dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Sidong,

On Wed, Nov 4, 2026 at 12:53=E2=80=AFAM Sidong Yang <sidong.yang@furiosa.ai=
> wrote:
>
> There is no way to tell how much of the NPU a client uses. Implement the
> DRM usage stats: account the time each job occupies a core and report
> it per client as drm-engine-npu, along with drm_show_memory_stats() for
> the BOs.
>
> The cores are identical, so they are reported as a single engine with
> drm-engine-capacity-npu set to rdev->max_cores, the number of core
> slots. The time is summed over all cores, with an atomic counter as the
> cores complete jobs concurrently.
>
> Jobs can outlive the file that submitted them, so the counter is
> refcounted and each job holds a reference. The time covers the whole
> period a job owns a core, so it also includes handling the completion
> interrupt and the gaps between the tasks of a multi-task job.

nit: "the time completed jobs occupy a core" would be more accurate than
"the whole period", as timed-out jobs are not accounted.


>  * RK3588
> +
> +.. _rocket-usage-stats:
> +
> +Rocket DRM client usage stats implementation
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +The accel/rocket driver implements the DRM client usage stats specificat=
ion as
> +documented in :ref:`drm-client-usage-stats`.
> +
> +The NPU cores are reported as a single engine, npu, with a capacity equa=
l to the
> +number of cores. The time is summed over all cores, and covers the whole=
 period
> +a job occupies a core.

Same here

> @@ -139,7 +183,28 @@ static const struct drm_ioctl_desc rocket_drm_driver=
_ioctls[] =3D {
>         ROCKET_IOCTL(FINI_BO, fini_bo),
>  };
>
> -DEFINE_DRM_ACCEL_FOPS(rocket_accel_driver_fops);
> +static void rocket_show_fdinfo(struct drm_printer *p, struct drm_file *f=
ile)
> +{
> +       struct rocket_device *rdev =3D to_rocket_device(file->minor->dev)=
;
> +       struct rocket_file_priv *rocket_priv =3D file->driver_priv;
> +
> +       /*
> +        * This is an estimate: the time is taken around the whole period=
 a job
> +        * occupies a core, so it also covers handling the completion int=
errupt
> +        * and, for a job made of several tasks, the gaps between them.
> +        */

And here.

with these addressed:

Tested on RK3588: no OOB access, and fdinfo reads correctly with several
apps running concurrently.

Reviewed-by: Gyeyoung Baek <gyeyoung7182@gmail.com>
Tested-by: Gyeyoung Baek <gyeyoung7182@gmail.com>

--=20
Thanks,
Gyeyoung
