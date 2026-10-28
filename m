Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793202048;
	b=AU6NJJRlKl414rVhcfDwdJz59whOQKJpeyL+/yO0CGYkpa7aVxNIzOQ+gYZYmkIxawlt
	 OZpViq84+eiXOEUQvZOp3TsPJOTKr/fDoY0h+2KeFo/88JGyBUANZQ+wQVc1IqAPLNoIC
	 ++DZiMuuEYpWrrUI3iov/wXZN8lGG+XSdXiS7WcRILckK8OFX4/0ccqfurCylF4jwyctx
	 mdmhtbXGwsvIskDy0rctMzazotu92WYGmEZfIiTPaKxTWehMOiU8UVXSj1vwNMC2Hb6/d
	 peeVxFQuzMHl+AOWWj80GXIX9Ibu3NvO7QKaGL/g0Rq815iiPHjeFDfv5C5MrZNVIpA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793202048;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=VvqihW4kC4LqjjOksCpSTYN8rpLOhj25iPkPggjLihg=;
	b=n72e/ELeoCq0EeKFGdMZ3xJaYtFY4OttgaX9dUkDptzmCx1LjCrFCcqwQx1UOXHOZ4d4
	 kTQd8kz9o8CpUyk8GmGRPOIgKSmMnw+rX32yyp+W3QgVqIPZCKDUw3Sv2fWcqN9qFaIAb
	 AXuig0eMgZhHiXzb+sWGmQ9xDr+mWmer546GXnWvU0KIiDCcFkTYN3G5tlsJCBtrwrD02
	 HHa31v4oF9yIGE68IHpK0blsh9RzL4xX97xi2+iCkMdEhrp82vLZjo8MaL0lqmX1HgMru
	 P2iKjuVyKiDvBZQdK8v4rPFEg4DpQ19O6Q0fK+QTDI6vcfVaS7+fxDMkW7lwCpBkAXg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=x3q7OCPN;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.46
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 171B2606A330
	for <linux-doc@vger.kernel.org>; Wed, 28 Oct 2026 15:40:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 171B2606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=x3q7OCPN
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5bfc2ae6e9dso906308e87.0
        for <linux-doc@vger.kernel.org>; Wed, 28 Oct 2026 08:40:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793202046; cv=none;
        d=google.com; s=arc-20260327;
        b=N7PsAtHgflBHWdJZPuMffFAItNLDHqT7OgA+AfU3HiPOKep3GBWswg7ZT/O+c/9pSm
         etxeH/B0usv6z4gOUHTg265Cex3OYnq8HMrFV2wSnf9SvBqYQlOpoY+JgMeycJxCqSO8
         OVmxWooL4O+HXpqqxA+yKacrFdiJGUYvtFh7xqWRKA/CEt7EEXyAGF/KUGIZZL7PEHn3
         53omy+LGeyn6miZDz5LU9pqb/g6AQGH125Rs4zw5BvtvUekSja6kYn7/05KMKRS+j0oE
         v3IUs589Cpk+mU5lcRhgGWhJTtsbxozEIazmI/Vua5a8D4QdI2q+olVJJVQRtS9IxOyz
         Oyww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VvqihW4kC4LqjjOksCpSTYN8rpLOhj25iPkPggjLihg=;
        fh=RDZ5krGlGY6jP6cCuVC6CU0OH0aFhjAa0NDQ2Wp817o=;
        b=jEnFVgJUuN9mH4oW8ryTP7NK8GZ2SJ0twDSJ6qOaOm2BUHSt5N9szee1IDUmWFuDO0
         ypTGykY1Ge+TrmdeMUfSmOq4t+XowgbMApiuHeXFk9jONPYiIfuZWRDdl+XZHash99H+
         zavBawr5h99DJvnu0Hxwq08mECPYWWZV0sAZXrOlaLm2n9ev6CdtLfDkSFdGdtktMD30
         +huaIBg4tm+EsHWju8rrz/yh/fA1MSrwTIYIequNi3LAzHh1UxFD3LV+89WTaPTFc++l
         zkMgoK1YzfTHLdlbnzyyF2pSO9BN7CIPgR4kv1RNHIc+1MeuJttNSCaoO1hehiP7ZphU
         gOdg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793202046; x=1793806846; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VvqihW4kC4LqjjOksCpSTYN8rpLOhj25iPkPggjLihg=;
        b=x3q7OCPNcUCc34NkqUOqBdRCsfVvc2F+hVUDgLJ8nUF3QaI/dgkMA7pW6vxHoj+c3D
         S3fjF10Jo4KLhEhMxAiy9CCOU1tKTa+IBhCTU1TcXjiOpyIrM+hm8q0vUTD+ih/S1dsi
         BOn5syXmLcFRVOBBfFRkLV+eEP2LmizvNE84ylIMJE61ckJJbQ8ZkVEz6djHm/f9EbAt
         SkEnMdwNKrzjBoWTM1mjEDLL9TJPFmK95vNd2tRQH/hTo/Vu4+1gNjqnccRxc1+aWFRp
         PNmCvUQg0DfEsn1P8mg+evC5l+jociDlIkDKVXlOSsbDYhp5z3dVZIe6gQoxt8QamOTe
         2/2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793202046; x=1793806846;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VvqihW4kC4LqjjOksCpSTYN8rpLOhj25iPkPggjLihg=;
        b=R003fe7GTTY8GSYQHEnrTKq84kZ62nBJQN4KrDP8yxJETMU4Z3b4i4wRaKHHwIFF1A
         Zs4QN26ApWbi0PLKtRjrdAHZbNXVrx0Jf7GaRfqbngX+rpVxSUDL246GMzSu2/VOM2Ha
         O0iFtadxq20PJ/X+jYed/T40zwuo2leOqWcexELtyb5NNViNMv+fapYBELWU1HPPINjd
         m2PXTz2RRoMAbD7sWMYpbGhE4xmTPdCXRMkPrIUi1ieLd1k3fRyY1Wo4P5K3iDAm/sFK
         zhXcC6djlGAYyT4YPk855u+cJDT+Eo77v5ZZzL2RM1BSgXspSuE67bUawEtei2LxKewH
         Xm/w==
X-Forwarded-Encrypted: i=1; AKwUvBwCt1dNbILbIywjQrBcjp4WJepH0Km/LLgz/pdkMPBNXFmPopEi/pswovMXP8dgHZ6f1820bexP9VU=@vger.kernel.org
X-Gm-Message-State: AFq9FYKYQfr+7NaJOgHLnw4U9j1K9QEcdnuMg8nYUnCnbUB6DQ2Eg/Pq
	M/sStS5n2nBQlYx03Kl6ljFLvRTTKKeWUTqmmwmTfdSOEgMH6xLipOGgKAP8uWMK50N8f6W6iY2
	joHP6IUrBqJWa3D2nXxbWhum+rVH05T8=
X-Gm-Gg: AYBFou04Yx6Axi6W8ZxCkUkdIwjUdA6W+XuQbMLPGipBCmqmhA2vuEn1GnjIx78X63U
	hC23gwZAovTwhTDLD0CTc4+cd0Pq2jctSg5hJnwG1ri4F/BhIWdkKc7akVHgl76J5xe2oIMSYVP
	tnytmpPQ4FeWmBYG9fFM6T2Z4j01ycKBl4NS0TMwtSXtzT1n5v1D2MCkxYMeC2zY8HetcW60X6a
	pjUR3rINN2EiC//CSRsbx8XtwLFXueME5N0zYkahXeNUvg1x81b+GQQy3VQdQPaEPuvOlmnb6i0
	T1ZyoqYA8xCars6cZE2FgQoihcx9MVWVxjaKbJWNKfkrmOMKu7efx5TNd4m2LiBNHRM+1xCc8SW
	/I9VlyeXxKUQM+pgriuSM9dtVBDR6MxJcTST3U7rg8QJIZRbbjbLKTRY1GXsnHgx2o0LhCNnhXQ
	azdhps6MoH1KUGs0iE13a8jT6f7VWa2+gBgYz/VGcPhXJzqoMCwydyql/V70+KIdPR6Lj4YA==
X-Received: by 2002:a05:6512:3a91:b0:5bf:a47b:ce4 with SMTP id
 2adb3069b0e04-5bfcad9472emr978004e87.39.1793202045880; Wed, 28 Oct 2026
 08:40:45 -0700 (PDT)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261028024333.795917-1-ruanjinjie@huawei.com> <20261028024333.795917-2-ruanjinjie@huawei.com>
In-Reply-To: <20261028024333.795917-2-ruanjinjie@huawei.com>
From: Daniel Pereira <danielmaraboo@gmail.com>
Date: Wed, 28 Oct 2026 12:40:33 -0300
X-Gm-Features: AclHuK-4RjPCzimHxGTwDAV8hHhfzp_jzOM0geiPB1vFfZ-ILbcZUW9vQG_ge-w
Message-ID: <CAMAsx6erAVzXbHUZNDbyazFQ5c+S=DYZ0YMq-emC8Mn7WVej3A@mail.gmail.com>
Subject: Re: [PATCH 1/2] docs: kernel-parameters: Drop unsupported preempt= modes
To: ruanjinjie@huawei.com
Cc: corbet@lwn.net, skhan@linuxfoundation.org, rdunlap@infradead.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Em ter., 27 de out. de 2026 =C3=A0s 23:45, Jinjie Ruan
<ruanjinjie@huawei.com> escreveu:
>
> Since commit d3d16750693b ("sched: dynamic: Make PREEMPT_DYNAMIC depend
> on ARCH_HAS_PREEMPT_LAZY") only "full" and "lazy" are accepted with
> CONFIG_PREEMPT_DYNAMIC: every architecture that supports it selects
> ARCH_HAS_PREEMPT_LAZY, which excludes the none and voluntary models.
> Passing either is rejected with "Dynamic Preempt: unsupported mode".
>
Hi Jinjie,

Thanks for the patch. I checked it against current mainline:
PREEMPT_DYNAMIC now depends on ARCH_HAS_PREEMPT_LAZY (d3d16750693b),
sched_dynamic_mode() only accepts "full" and "lazy", and all six
architectures that select HAVE_PREEMPT_DYNAMIC also select
ARCH_HAS_PREEMPT_LAZY. So dropping "none" and "voluntary" from the
preempt=3D entry matches the code.

checkpatch is clean, and the admin-guide build (SPHINXDIRS=3Dadmin-guide)
renders the preempt=3D entry correctly with only "full" and "lazy".

Reviewed-by: Daniel Pereira <danielmaraboo@gmail.com>

Best regards,
Daniel
