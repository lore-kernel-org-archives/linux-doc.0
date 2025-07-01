Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23E1E13AD26
	for <linux-doc@vger.kernel.org>; Tue,  1 Jul 2025 02:32:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751337136; cv=none; b=oRxIuPZkN6BIhF3FM1hx3tIVrvF+iE48cEMRD2YH619Nfb3yk+eSpqHJJhMgZB6icBD3gadQMlyL5oqrQzA7z72FpgJjyGGH4mOjSi6pW1CLFGSl5XvroySzuZb5BwtvN4Iev8IPznSmJMUechBNOpMm4KPKJygn1bVfmnbLC1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751337136; c=relaxed/simple;
	bh=rRVdG5V5THof2kVFbuGpoPO6Ew/jSkC8Uar+R290sas=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GmYvqIC34R5NKla6v2yHIEd/lklwV5lKalHKIa4C+crLkOTBtHXbBslZdalSxjc0zHgPwDpYUz73uXHdjgBKmBpEz8KqGNVfTYqmOuG82A4JwqrfIsThGwplRuXMMuYCpZQhrtyuVAkSxWgS5CaPbzsbNUq+8YdXc0c6uLAZj+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hsQjokHb; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hsQjokHb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751337134;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rRVdG5V5THof2kVFbuGpoPO6Ew/jSkC8Uar+R290sas=;
	b=hsQjokHb7oONY4dnBLXNEtlI5qZ++9RL6QqW4YbI/Fhd5VUdfLTDVCrheEPwov6Rhp20Vn
	CiuRk+Gb4v+4RvPVUvG4w9I2fF6Y1xMukyu7ztl5qaFGaq5BCpg6QlP+I6clKkzUGmpClk
	L8RuLNroLjFz/PvEHPf9BplgC5bigrE=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-674-ZG0i4hPkNqOsIv6F8Ny2HQ-1; Mon, 30 Jun 2025 22:32:12 -0400
X-MC-Unique: ZG0i4hPkNqOsIv6F8Ny2HQ-1
X-Mimecast-MFC-AGG-ID: ZG0i4hPkNqOsIv6F8Ny2HQ_1751337131
Received: by mail-lf1-f71.google.com with SMTP id 2adb3069b0e04-553b902b3cdso2985706e87.1
        for <linux-doc@vger.kernel.org>; Mon, 30 Jun 2025 19:32:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751337130; x=1751941930;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rRVdG5V5THof2kVFbuGpoPO6Ew/jSkC8Uar+R290sas=;
        b=TqXpZxLhRcSWLGAjVwjDgSAkPGa5Zf7sWWLIr8GFwArs5MCmvlbRspQkkmFjCDv2Mj
         cy36xivf9WOaBSw0GJuJDN3cisWLrtypWliKLgDOaW1UMQXzniQW+ZL6C/MafckTlxo/
         OhcxuTDK2ERCPYX6kcws3QM5OsfTniqAjnL9AlPtbFUVDXxShlchTcjYE+jiQ0xedGCg
         TbrfMPknqUM5l2FNBDo77CgSeezgtSoC2+yjo7ce0wG8sKPCI5PSSEnSUhOTR784vXYs
         wgqDxV0dnwBx3RzdvKa6DpKjG7EOEJ3Xkl75+r1whnGC35NzuLT9hVXyyfoI9+dwd9kM
         Ww6w==
X-Forwarded-Encrypted: i=1; AJvYcCU1C1gOcGlYhc7D2HJFjXkDYA30RMhAX0xBqIb2nPTiTamx7qjN+jBUqYIY8GFqY0PQjK8auODxjWA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwrWYu81OmO3+R2KkSQCSqVOeZPQJcEOTv+C7wPU6NSlBg7m3j0
	dTvj9kpyhhJhyvBDKfMyw/4J39/kKXlsg0GO2HJY9EDailwwXF612+F3NEM5WHFZKPLA+jn20uQ
	Rlyxq1glbgzKB6cVvDJFy38l+ZpwoaXm0kQOFoiPrDaHLNUjoPzMzQWJ13FuhA9+S6uagPSm2T5
	0d7rGUBJpbEq2J0PV/wStmH+JZnnfB3qAPipbtmutV5SPQ
X-Gm-Gg: ASbGncvjUJVbQ5twHi7AlkLQA2uJqSTKsRfTU+eyzOfGzIUB7+J2TnKd9Zq+AcwCz9n
	kqST3GAqpDLe3Hs05+sfqLb029F7BvgRFdxK50/fxUagFD4bT0Y4rsSq7zYRhZN+bIJMKtrbq6J
	6bbb9v
X-Received: by 2002:a05:6512:3f14:b0:553:33d5:8463 with SMTP id 2adb3069b0e04-5550b85a6aemr5124499e87.24.1751337130027;
        Mon, 30 Jun 2025 19:32:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHYxhicPvjsrYMTzNnBgN66EEIC9O090pHpKX6MSHN6FdUCZQawP5ktZNml7ohAaKF8rzbjcIZejG5Mnsuzl5U=
X-Received: by 2002:a05:6512:3f14:b0:553:33d5:8463 with SMTP id
 2adb3069b0e04-5550b85a6aemr5124492e87.24.1751337129620; Mon, 30 Jun 2025
 19:32:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250524061320.370630-1-yukuai1@huaweicloud.com>
 <20250524061320.370630-17-yukuai1@huaweicloud.com> <c76f44c0-fc61-41da-a16b-5a3510141487@redhat.com>
 <cf6d7be1-af73-216c-b2ab-b34a8890450d@huaweicloud.com> <CALTww2-RT64+twHo3=Djpuj81jArmePQShGynDrRtYab3c1i2w@mail.gmail.com>
 <93166d88-710f-c416-b009-5d57f870b152@huaweicloud.com> <CALTww2820X=HU3Zuu+z19oCaPL+oQ4bMNostoAgfDk1-3nB3aQ@mail.gmail.com>
 <ede16ca4-96ef-e8e6-45fd-1c88cddc7f4a@huaweicloud.com>
In-Reply-To: <ede16ca4-96ef-e8e6-45fd-1c88cddc7f4a@huaweicloud.com>
From: Xiao Ni <xni@redhat.com>
Date: Tue, 1 Jul 2025 10:31:56 +0800
X-Gm-Features: Ac12FXzhMQGjHMGlqGWC7dqp0aHNgDpMVdT7Q6bEMzZcdixQ6dP5r4Yqwzr1sd4
Message-ID: <CALTww29r76X9C2-AEVGLqQ=BaWba8yrCCLcwkwVdO9ZhpkvWvA@mail.gmail.com>
Subject: Re: [PATCH 16/23] md/md-llbitmap: implement bit state machine
To: Yu Kuai <yukuai1@huaweicloud.com>
Cc: hch@lst.de, colyli@kernel.org, song@kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-raid@vger.kernel.org, yi.zhang@huawei.com, 
	yangerkun@huawei.com, johnny.chenyi@huawei.com, 
	"yukuai (C)" <yukuai3@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 1, 2025 at 10:03=E2=80=AFAM Yu Kuai <yukuai1@huaweicloud.com> w=
rote:
>
> Hi,
>
> =E5=9C=A8 2025/07/01 9:55, Xiao Ni =E5=86=99=E9=81=93:
> > If there is a filesystem and the write io returns. The discard must
> > see the memory changes without any memory barrier apis?
>
> It's the filesystem itself should manage free blocks, and gurantee
> discard can only be issued to free blocks that is not used at all.

Hi Kuai

Thanks for all the explanations and your patience.

Regards
Xiao
>
> Thanks,
> Kuai
>

