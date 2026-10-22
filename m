Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792688960;
	b=IDNNcsiTVDLNtJsXujgqQDsT8qEcbTA+M6uheiDx2skv0wBy3PmgmzHcc4VCNDOLHac2
	 9syD9D/m2pt/q1IStpHrBxn+cPHr3xPRP8Wk2FsVtJjSryl6wJsFRpb8xWZO/Gp6zU/sC
	 KvV4m+4YmxcINltSyfcOwfIHs+qucf4GpLTPdY8SWpfYJ+pImIubIIC898sOh0eFkZ2fG
	 aR+tXtUq6dMfIvGC0yqlCzHzkSlDQQcIEOeQqZ6WtoPSv59BFhGNmghIn2TPAl9mLaQD+
	 yOcSgmTaQIIVmzS+N0tyZDyhktQynfgFzxbaxfwANgHHy6T2kTbkCKl2+awQdfo6r3g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792688960;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=82k83wFmz3nVH+5krCkB7NOaf/KiiZwPu1SQ8KFsgks=;
	b=H/uJLFptHPBML0tmyAvzqzlSiWx9/i0NWVsS1FyRLHr3l4ImJ3Kpr8TIpwgP4FYi+Wl+
	 8Yn7iApvSyUYmunfbeE2sHIXBRXV2Ws4cOlzYlTj536NV5Z1x/TOhGAPs2mzHzsOFfF8I
	 2JxuTwX2sAhOHVDqZQNB7PSiDqrvyvUZJABH6rV8BQGxEOcxzWMLN2Y6klMru9fJdqXOg
	 QByTOZLNswZzq1dkygQFcBr3Um7NcO8Y61kyQIIAbwGnEs3KqUBkY0X+Q9BxWVZnZVpA4
	 nucSQxWUN5Wuu6Hbm7fbzKmE5oy6dfzLA1CM/e81nCyUvJlabmE8of8cJFvBfz0gThw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=RhfHyM8+;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.47
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69759606A31D
	for <linux-doc@vger.kernel.org>; Thu, 22 Oct 2026 17:09:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 69759606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=RhfHyM8+
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-91c162febb9so1092156d6.3
        for <linux-doc@vger.kernel.org>; Thu, 22 Oct 2026 10:09:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792688959; cv=none;
        d=google.com; s=arc-20260327;
        b=lRIzfbktdmpVy0DP6Zksv3KY/5s6+FqRAvs0CZyPWH6NoElVS/JCiyuG2wsmIPt7wH
         2atXKlg569S+3DSLTglBGBqks0bTjjITdGtIXA3/hWIs1pkGwFrHN0qeLc0Eyft5yrAV
         RPnH0TqyemiPKDRED6FkgiVPOsNfROm7nqdzXlEXLHm7K+5T9ZTqTg2fwvrXwWVDp9O6
         0xrwn/DDX9q7P+Ux+EDlw3CctFJ16Qg62G+buuTZlSSecIND3snnIIfSeYdskQtnaw3v
         7FkX56IdLS3ELISDeDDa8VlxUtIdbAaS0awbSZwf4rutxmNGTC9Xj6Z21Z8O9mnTGSOS
         1FrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=82k83wFmz3nVH+5krCkB7NOaf/KiiZwPu1SQ8KFsgks=;
        fh=OyyuMz5nVk8okwmv8cOT6vLqioLRqVvJuNmQy9KKhmg=;
        b=Z4SaZwdQR0L9kud2TuaB5msziWjfswRkd3BWG9dZNGMBX/LJIpPLGCvkMMcbmFiuke
         cGrCQalRiW6XNJ+OLvN+QZCyoHkPz8z2QDvvLoqY4Vx6orJAZ0DBz0uTxwJECFCOdtip
         TNR2MgObj0gmgP4l1ovfY8JmGpBTOVQ61cBKn+lL8llthjqWTcSE7CGBJj1K1TRCfYzc
         t2+kabdTZ2oTUY956iklufanWxgCagy14zVAlH2HNr7fCGzute20I8a3+rN/1bGha7gi
         swBjaTy/7CfUpg218BYbCN2T3dXrOeMp0tntsRdSzLUkSBt2fYyv5CapRcA40YzXQc8P
         iDGw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792688959; x=1793293759; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=82k83wFmz3nVH+5krCkB7NOaf/KiiZwPu1SQ8KFsgks=;
        b=RhfHyM8+YTOLhxAHUIkmfxcsFa1XPxmpMO9yLA1LhxyURUokw5gs8D+ug/0FyeyAQc
         MyqOz6cMqhjuVj1gwgI0gbq9eogfxKwZj/+mH755WwL38zLbBnpuwp9kyNR+uPC3Hsm6
         pBrn5oIMrsw+JTjRQJAOJq63fAQvU3tR6WNfyPWW0G5Q2ZJx9CR46kfCwdh2YJ6ru6Z2
         mHVWYprG4efwN5Lr/0Diolv5ub+nBdOGcZ6RYDpJpgbpdtYtjtd8nz9wPhNI5M7BSnWI
         xWFTK4kRBqvw2RmCfhvPLIivhbbBeGUW47ZvIwkCzb5lMYsosKVhNyKGJ7AZt6sbD8bx
         ZeVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792688959; x=1793293759;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=82k83wFmz3nVH+5krCkB7NOaf/KiiZwPu1SQ8KFsgks=;
        b=bhUolXV8yhT5xb0KrBOO2Ziscm/Xlia7YCQ2U7WJ7bhs+8vKzckMmkX7vB6yoUK3sZ
         0tVoeBXeWl0d2bIET3yzKPF1jQkE4/afwI1N8rVVF+XiiHE/MBDo0Qr9DRydErkMtUjr
         zK2JdbIcxV8xFj1iFdWJhkxgKnMWEAA2U9emo3V3rJH/1C5Q/K5n+TtUHH41idrvaJLJ
         psonA4kVU7P/2Ay0Ixef70QERv7iACzhpApSVApBUoJMNGprV1QRizT3+FlpKdwXxHyo
         jbnNh2q9H5+FxOsKdJQ2xBxB89czZFEI0JvFKouv/6HIseEtjzVogGhsVX1VPS7m3zlN
         sd4Q==
X-Forwarded-Encrypted: i=1; AKwUvBy0tV1QH2/DigsZaNSxCLeCapnBXqefcqYJRhbn4ZELmttV4+RdILplINNj1R65wGPQLBn4SFUgxxc=@vger.kernel.org
X-Gm-Message-State: AFq9FYLDuCVyAmoKnET6cpdWnm+g9Z4MniPImlWSaZqQjErL+2pKcXaB
	oVcpC0+Q9RHAX10ZWXVjVfkK+rwLQvr0amPUjpR6cVgUEYl8MHsMIecJ0xnemhTNsxaL5MUweQ0
	znttcJFMYdhNkJYntH57CuD81jcEOWbs=
X-Gm-Gg: AYBFou0W9kFRwdZeMa6mz5afd/a5gAIjofm77OccaoC9rYbUY/d6zuIg530IMEibcWj
	F+uokdDZaUVqIty0gmKDPGP7ue4Pbj9958jinc3QOoOqiOT7fCO75R47Jl9zxIXpfIOmn9TR12A
	AX0UKvgbvX90NTuv3cQMP/KXt+4QKN/pGnzW/0FoUSnoHwmGSpon7+GbwMObVf/9O6PDgIqV695
	Ci3a01pmwmzO1mH4UlvOd16bZwqYfSEdbWuK0gqw6z5C2cqnILnHU4QFtgzXDoTFEDesA4S0My/
	JxKvnspUCkbMkvtYWZhjVZcbwKLfb2YofEJiVmWhneMRAOuVjYwfouQSSH7UEDFl3j/UiykZyH7
	2rfzL+L6K3TfhVgbLArzYaKPY1dnqVpIULz+KqR02SJ0H8M5V4XH24ZWOGOFxzR9+VCXPHjiRAy
	YGPSbpyBKk6JkHLbe6BPZJ2xEMUOD2TyK1ptABkw1qJx2S3mPg
X-Received: by 2002:a05:6214:2dc7:b0:917:af36:df30 with SMTP id
 6a1803df08f44-91c12eb349amr97591916d6.16.1792688959166; Thu, 22 Oct 2026
 10:09:19 -0700 (PDT)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261015125644.12908-1-danielmaraboo@gmail.com>
 <20261015125644.12908-2-danielmaraboo@gmail.com> <qthsqsh7gvelar6fpquej4x2qqho6ltttuwdv3bytxvkpis2r3@hbnhxep5sxx2>
In-Reply-To: <qthsqsh7gvelar6fpquej4x2qqho6ltttuwdv3bytxvkpis2r3@hbnhxep5sxx2>
From: Daniel Pereira <danielmaraboo@gmail.com>
Date: Thu, 22 Oct 2026 14:09:07 -0300
X-Gm-Features: AclHuK9cJWaAE8pMdznN5BGuXp9mwrvxRv_5jhrOTt82HaemknY-CJQPqq6o-Kw
Message-ID: <CAMAsx6cAaXUh+AkdMjZZhf6bFTdK31gqEEpHAA2F1wKkjeC7WA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] docs: doc-guide: add a guide for translators
To: federico.vaga@vaga.pv.it
Cc: corbet@lwn.net, skhan@linuxfoundation.org, rdunlap@infradead.org, 
	alexs@kernel.org, si.yanteng@linux.dev, dzm91@hust.edu.cn, 
	chenyou910331@gmail.com, wy@wyuan.org, akiyks@gmail.com, 
	carlos.bilbao@kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 18, 2026 at 02:03 +0200, Federico Vaga wrote:
> The following chapters are somehow repeating what already written in
> other documents (doc-guide, process). Everyone should follow the
> process and the documentation guide, there should not be the need to
> repeat "how to write documentation" and "how to send patches".

Hi Federico,

Fair point, thanks. In v3 I will drop the generic parts of those
sections and link to Documentation/doc-guide/sphinx.rst and
Documentation/process/submitting-patches.rst instead.

I would like to keep only the points that are specific to
translations and that keep coming up in review, as short notes:

- a partial build with SPHINXDIRS=3Dtranslations/<lang> hides label and
citation collisions with the English documents, so a full htmldocs
build is needed;
- tools/docs/checktransupdate.py, to check whether a translation is
out of date;
- the translation maintainers and lists to add as recipients, in
addition to the documentation maintainer.

Does that sound reasonable?

Thanks,
Daniel


Em s=C3=A1b., 17 de out. de 2026 =C3=A0s 21:03, Federico Vaga
<federico.vaga@vaga.pv.it> escreveu:
>
> Hi Daniel,
>
> thank you for this effort, allow me one comment. The following chapters a=
re
> somehow repeating what already written in other documents (doc-guide, pro=
cess).
> Everyone should follow the process and the documentation guide, there sho=
uld not be
> the need to repeat "how to write documentation" and "how to send patches"=
.
>
> >+Building and checking your work
> >+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
> >+Build the documentation
> >+-----------------------
> >+Look at the result
> >+------------------
> >+Run checkpatch
> >+--------------
> >+Sending the patch
> >+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >+Recipients
> >+----------
> >+Sending
> >+-------
> >+New versions
> >+------------
>
> --
> Federico Vaga
>
