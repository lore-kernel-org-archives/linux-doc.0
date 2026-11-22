Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795305634;
	b=o3x3lVmNRwjYhHB95bwI8UyhmBCP/qsblrhYtBOuVgKS9X/j1QQ7qmcdX9Oik79CKIGe
	 IHgfz0dBSQSqfnRKIFlIR/dfOxTTz7vC6O/1UNa/tXvmZ5y5zMZYQc/QoMl8hBKYExd3Q
	 m3GflZBnlGnunIERiUYrz2ftgF6qxXUox3y4gXU3vwmdKNVRw1SrFDo4ddHTAZSfKZDYA
	 ZmmCK927EFg01+zaaKuf2ZCdZF3jeaBMJG5Y+KCuEOiK4yOUi6maz7buAJvtyl5E6/g4z
	 3uxdoAC9B+egJVBIUb/00Ad7N+FT2gFNvpkI67ZXDqSkWsDBSFmjvw+odm+59edW1tQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795305634;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=oX79inJRzxgZwR0Tcie38RtbzYQdIj/eTCukvbMNytI=;
	b=1HwWTd6noRN4QPN3mE7GaoDSgPenS1VfbyPvxoJiy19+quyd/pKDM6vmxR7aGNbuWZQ+
	 Or2GmsgMcg4420HpWA2U4Oq7uZAHXqNj2RP328mt09t3RoDdtaKU1EXElm0NnNmwNjfdz
	 nKcUeLDbHZexuvMaCN846Ib94ap6rMz6ZkT9gGtqpEuoPpS6U24eU7AP4X5qY2+A2u7xu
	 LztUiz1FHTFgUZQF9y91OqdE5Kzsy2QXrCRVcsQ3DrNay7gs4HlS6uGDd4WptdL3dM7JU
	 i20XFL8RwmxT8LfbdLT/76ZEgmM7SxX1dy1X4bVNeKdnrBivDwH+MHKcmtSQaNrw0MA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=r4RcuYCf;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.46
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D03FC606A320
	for <linux-doc@vger.kernel.org>; Sun, 22 Nov 2026 00:00:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D03FC606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=r4RcuYCf
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-8631e07b756so1013383a34.3
        for <linux-doc@vger.kernel.org>; Sat, 21 Nov 2026 16:00:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795305633; cv=none;
        d=google.com; s=arc-20260327;
        b=fQivGwonbfhTztXCyw8QKSzokQFhZpJbZAUM4h6PCUO99MaYbJefiqXz/yH3yX/zBX
         8kYsHp2LWSLSyaghCRusQkmuItxfpFCglhgGZBp2P3rukYplFEVv6C7bYEDxZFlBsja7
         ZD5xwZjSKJPCbCFnGytyBTukgE4vya8+ZLqeCkoyPx5nUKX0ZkDsle9uF3GhH2Bmg5pQ
         qcXqFWjBtU7NZ8UlolHU62dVCZ1njl8RbJS6FrSvcbXtc+YkF4u2hv8iqPenvwoSnivN
         gSCQHVVTBFkIdxQlG78NKYzI9zTK8z/yNdEBu8WCIThw+TVHYCDwT+sSDvKneAYEjzPO
         PQiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=oX79inJRzxgZwR0Tcie38RtbzYQdIj/eTCukvbMNytI=;
        fh=cvGIOPVCfeSRfOBCFF9N5OrTlwAUMIn4X3oXHrU5Kso=;
        b=dT+K/lXzq7DlQ7ciG41TiuB88ge6HQKg58UAx3yU/sX4FY65ievLggjjyHLD08WA0a
         yeJeLvVLw3l1L6jms7LM6DGiSB9glY/HP+m/z4ZveZgT+2XLKxnHvvQpxeDS+cw3UcUe
         zV0VizY1IV9hzkaDGzzEfPN5gr89vm/7tHx/uI3dclxnHtRlc5Q4qTYF7FahZvlMDo6M
         GEl3LCw+IvXXkwFQBUFq4AOmzs+vkZD1ksi/AjmDC8zcjbKiIxqDAhE4toHj0ibnjnW5
         y72aNnibSTU0LmyOch+gYA4DgJ6jTUMMu1MIutcohYpOqEbpec/BHsLh4pKoFZTK2gdy
         XSDg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795305633; x=1795910433; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oX79inJRzxgZwR0Tcie38RtbzYQdIj/eTCukvbMNytI=;
        b=r4RcuYCfIn90HdIwxItumjaK30zdLhmUJVAGcRQ71nWGgskz24QbkTinofHlgkbenY
         G4MS+YOI2jv+T9Xu/GlYrHhhMxTKnQSORkt1g1N9xvgo09K+WmL6Ol4n4KlM7ZnHdfYH
         Dga8N+dVnRKwEx03n6ZRzaZUmZamKVkc3zEM3qYrvuR/ZiJ6LVd5aEscodL4zVuRKxr3
         1CeCqEP8fs5yW/L1fJ7f2jpubwiyYMJLqCP2Y6+Ydqe1XIaG30BcseHXiwDcr3LDh8h8
         aceKX/ezytlgYuce5vlrWJqmIhso+LfDOfRKsao1qd8ZMx8JiPefxktTgvAjr8j03MY9
         f62A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795305633; x=1795910433;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oX79inJRzxgZwR0Tcie38RtbzYQdIj/eTCukvbMNytI=;
        b=tjwkrMd2PqMq1ZgZZfJD6LoGZg1sTbJLAvsxIl+M+fdtZIIRNgzeKaPuSijpf9C+qI
         zn8DihW9SvaVdLaJVWhCpWavhdHhDkkmr87TzDEHSDS9HxnSnkdzb3Bw70ZnBQRtxiwG
         P5bAHkdpyFHqXgQW9E2eVllNRX7wUXJK+9RykmI9aoCtHXy7OUorDXt96R70pU4RkseI
         6XoHmUFEjMiymXQN/wiYfnQx6eBvHyQH/Gi6rYCb7yZdedHA5GY7niMvJX1E9aUcL+/U
         QP/vO0COTzel80qIbRMcKNAVK91OuRr5Y5FrgWVBzaqpCQCQQqAlck9MqHj+rOxvfYzJ
         LAow==
X-Forwarded-Encrypted: i=1; AL+hErFzSmiOScRjh4BRsNByFTGR3HNmdItZUK/kV2Nwfzrhb4Mbgm6gqcV1bmSnQfpmwb/5kxy2yiw2VJ4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8KBfalTrtpkleAmrAvxKikQ3zkvpc3pYcpDkshFdPz2w6i1j3X
	HmaLvrSw6kEWZ6xvJ5cY3bIcv7rnSLiiaFpdwNiM3lUJYWpkX2rl7GtJj/IY6+TXvdV5Lzo65ZD
	O+JMOweIizyXvhsvOPbx3iy1EiyWVcO4=
X-Gm-Gg: AZFdTZezGsREoSVKSgTck6mk7ZECjoiR8+IU3ZTpuBU9sayxDEnsfD6A7RXeVgU5MEb
	AEAshKdoGFmZu3M1q4VWaARBQNNAj8EC8mlV+T8SUmq1DRRL5wd6CwdsM/8VPUksXMOSjKcUQTZ
	yDkHwShf+Zbs4JvXqIgeRsID+rz8ms3qfjT91kYLCqSCVnEpIn59ehNvL18TqUa7wcodLEz9vda
	wkyHRlh5kVs1LQ+uy/mO1aD1nrS9NbJW4vOTG1Rrdw70CzvcemmXl0CE6bPfy6jrQcaE/kdLOwY
	suHmPHJ1WfMvCq3hSeva/NDlFORVY8vKUQJNRiBazKnlx1y3wa2cZJpm/AgYfQnSgoaqiN9R8oF
	1pNjOn5vnH6OiYMDdOl2GlcOxSgV9qhHAuyic
X-Received: by 2002:a05:6830:6a88:b0:863:3a1a:91e0 with SMTP id
 46e09a7af769-8633a1aa039mr1043518a34.10.1795305632770; Sat, 21 Nov 2026
 16:00:32 -0800 (PST)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260726212812.89266-1-shijujose2008@gmail.com>
 <20260726212812.89266-3-shijujose2008@gmail.com> <20261017055852.GBatMOnEl66YObvU5k@fat_crate.local>
 <CAG4KcR+NOKHNzg6FN-oLLHgUxeitZHKXg9cN7dz24+Ap=RrwSA@mail.gmail.com>
 <20261110071729.GIavLFCfLKzPx8R0i0@fat_crate.local> <CAG4KcR+ikfQEBjCZiNJ1CUz=u3Gtbk_XDroA_GQqYpgO4Lo5Qw@mail.gmail.com>
 <20261121194030.GBawHzrrCNCMpfr7Gx@fat_crate.local> <CAG4KcRKhE1UXwrhscUdSpDJS8R0t7kWp8RXZm8j_9yXYJSQ2KQ@mail.gmail.com>
 <20261121210749.GCawIIJcidCeWs3ij9@fat_crate.local> <CAG4KcRKzXNsvBWuuU2_aX5gO7u4vgKAK+bkrB2vgEFBGu3WJCA@mail.gmail.com>
 <20261121230942.GDawIktifTKlYhUlpB@fat_crate.local>
In-Reply-To: <20261121230942.GDawIktifTKlYhUlpB@fat_crate.local>
From: Shiju Jose <shijujose2008@gmail.com>
Date: Sun, 22 Nov 2026 00:00:20 +0000
X-Gm-Features: Aa3M54qnCHZib5IMTc_EQOb3UJ-aKnrHrCYP9h8mtw0fwRaNzLI4HvK65GdTkSg
Message-ID: <CAG4KcRJjU9WB7o0woOaAhtWDPoaL-52T8MUmbYJ9iC0EqP93Cg@mail.gmail.com>
Subject: Re: [PATCH v23 2/2] ras: mem: Add ACPI RAS2 memory driver
To: Borislav Petkov <bp@alien8.de>
Cc: rafael@kernel.org, akpm@linux-foundation.org, rppt@kernel.org, 
	dferguson@amperecomputing.com, linux-edac@vger.kernel.org, 
	linux-acpi@vger.kernel.org, linux-mm@kvack.org, linux-doc@vger.kernel.org, 
	tony.luck@intel.com, lenb@kernel.org, Yazen.Ghannam@amd.com, 
	mchehab@kernel.org, ashok.raj@oss.qualcomm.com, jic23@kernel.org, 
	linuxarm@huawei.com, rientjes@google.com, jiaqiyan@google.com, 
	Jon.Grimm@amd.com, dave.hansen@linux.intel.com, naoya.horiguchi@nec.com, 
	james.morse@arm.com, jthoughton@google.com, somasundaram.a@hpe.com, 
	erdemaktas@google.com, pgonda@google.com, duenwen@google.com, 
	gthelen@google.com, wschwartz@amperecomputing.com, wbs@os.amperecomputing.com, 
	nifan.cxl@gmail.com, tanxiaofei@huawei.com, prime.zeng@hisilicon.com, 
	roberto.sassu@huawei.com, kangkang.shen@futurewei.com, 
	wanghuiqiang@huawei.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 21, 2026 at 11:10=E2=80=AFPM Borislav Petkov <bp@alien8.de> wro=
te:
>
> On Sat, Nov 21, 2026 at 10:24:28PM +0000, Shiju Jose wrote:
> > Thanks Boris for fixing this and verified by testing.
>
> I cannot test because I don't have the hw. I rely on you to do the testin=
g.
>
Sorry I meant I tested with your fix, which worked fine.

Thanks,
Shiju
> Thx.
>
> --
> Regards/Gruss,
>     Boris.
>
> https://people.kernel.org/tglx/notes-about-netiquette
