Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F0B22E6106
	for <linux-doc@vger.kernel.org>; Tue, 16 Sep 2025 13:59:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758031172; cv=none; b=i4tOzKDBn8eIsO39HgqL/JTN/KFRBWKpqtL0YoSn4SFI8kU3vvC/tcofpmNWB+4HwX8BGBN59DRtRlvbJetE65dFJwQy6oeL5rkhgl/y79U6YQkVTIoy79FD0SIPE6t0kl6QsWjEfTinSV5ToDXgj09QCbqdUqiFXks8djNcQG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758031172; c=relaxed/simple;
	bh=zAdfiDdkXiV3tbwwu/omDvryeohazwZoga6t9KrFkO4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=g1hSEE/I5kukKYrg0yYbONC4Kcl1KixGS1am0QeyCNxhHT17R+m4zwxz3SIv2VahTXxfwbQwHcUE8wjWhyMskK9ikio+VOZGAAC6SbWUMS5ZpBuMPeeFrcbj4WgzuZB5udPbIQ9ixuHa1PxGC7Y2qdt1FsVTRc8HS7+cPgY+6d4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f3BBxWX5; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f3BBxWX5"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6228de280a4so2819611a12.2
        for <linux-doc@vger.kernel.org>; Tue, 16 Sep 2025 06:59:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758031169; x=1758635969; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zAdfiDdkXiV3tbwwu/omDvryeohazwZoga6t9KrFkO4=;
        b=f3BBxWX5ADWUCILYfv5fensqnONjUZUeu1P+W26viY8uRZwvAzPuW99I1ofJbJlrXd
         yxMcqm5sK9m7XjAegqLsoJ0NUh0ZmfQZ4DVuWC7kvl+Vnkb5QQ9/brzlK23FiFx3UCUt
         iqdEzsY+j9KWCxdoqlBDWfF8imtbwN+3hnFfebghYZlX0IVe0gY4ZKyQGqz+L7r5Uwlh
         ZhNHqKVkAEOrnDal2PJwkmDEOj9js09mKVJO/P5JrWXgr1qOYNG2rvGGt8hoO2siuTRo
         5CoX+bteFPIiZ1jLq1bR3y7GHGO/stWFjUzjzJW//q61n4g7w3izt7d4JtaPqSLJwdMU
         RiYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758031169; x=1758635969;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zAdfiDdkXiV3tbwwu/omDvryeohazwZoga6t9KrFkO4=;
        b=LJbCTiJzkuBjriv+zqdEpjhPP5vIrWgsRUCEu1VhU+cy58iCu/1uTRPFGGxPPVx/V9
         huIH17bBTxUvjHRlZ412m0UAOusHk8kbvMi3qdq/IpfQM2h3J4ffSb1Ahh0uIzmKjFCL
         T2GzAPzFelKAEXaNlNnJzbMC6EiSJyfalqyKdaZfwYGmP+ZZn/YAYYbeVCY7lwgIBW5g
         nWDCeIcU5cNRNBPtHezqdKNfwmrl5QsMjO+3Y0xTjlC6IdIM9aQQ0FUym6i3lyLA5rU/
         oBq9oSXG3rM1dtQfQXxdEgucCrf4Dvx6ibmiplBl2euVRplQz+v+oWP1tUbvG+A+vTLh
         rVAg==
X-Forwarded-Encrypted: i=1; AJvYcCUlPmn0ZrrT8kZpgcQAmcqx0f750i7eDbIJaU0fZ7r5WyrL9fxbWoYtqFTpDyXvrnKnV8tSmPviSdY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwCRJiix8rnTZO60++o6HrimzctDqCrlNVcKUrP1jqvY+SXoJTO
	aBWfDiF7qo8fDLrS3LeKiz04Ft5kM8FZ6Yk65/4UXXl9yBYRVkFiJgju1pvJ+bf3yyHMGPKON6w
	WpRckTacvLnfOV9+Y04ODcQAUmnE0Rko=
X-Gm-Gg: ASbGnctiaeUgivgoTKpBbWw6hpvDZ8LeVQJk0BSnS+3rJCl0D+ngWfAtcv0epirm7wH
	KpN3BCSepwnIMzMCIZ+2K/yHAMgYYf2tI9x9t4WyGiXTK02d50NZYnMpyi60gYkqCDzaq4BXW0O
	5MBKLsr2ztDEHeFQIuzxTKtgD9u9AJlmQXTR0DwuZbhnCbGFFsbz0SQKqBXC1SqeoVMSftRVuuj
	2WhFB5BISex6HpiZA9cve0vaz92tZJQT5Xz
X-Google-Smtp-Source: AGHT+IEIzUyZJpCWnYGAsduHf7Qhp1qaOmIKm0n55SsVJ/ZJFB8oHVTY56tz7Pc+9DML2SHbnb2+yIG027Ug05vfAf4=
X-Received: by 2002:a17:907:3e21:b0:b04:6cf7:75d4 with SMTP id
 a640c23a62f3a-b07c365eb87mr1706464266b.49.1758031168534; Tue, 16 Sep 2025
 06:59:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250830170157045JsLLov8_im0lUELq88aLu@zte.com.cn> <f0426e43-3d3e-4dc4-aa6b-31db8b2a2a53@linux.dev>
In-Reply-To: <f0426e43-3d3e-4dc4-aa6b-31db8b2a2a53@linux.dev>
From: Alex Shi <seakeel@gmail.com>
Date: Tue, 16 Sep 2025 21:58:51 +0800
X-Gm-Features: AS18NWDVR0dw4x7jsPMAe97nr_k16HzFbESF3SrJRor_9Uu3Y2BPcHCtbu3i-gc
Message-ID: <CAJy-Am=d4UgmLJOGmPmgWg2Z5-ODpZ=L7SX53ZmFT-9shtU=XA@mail.gmail.com>
Subject: Re: [PATCH 4/4 v3] Docs/zh_CN: Translate timestamping.rst to
 Simplified Chinese
To: Yanteng Si <si.yanteng@linux.dev>
Cc: wang.yaxin@zte.com.cn, alexs@kernel.org, corbet@lwn.net, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, xu.xin16@zte.com.cn, 
	yang.yang29@zte.com.cn, fan.yu9@zte.com.cn, he.peilin@zte.com.cn, 
	tu.qiang35@zte.com.cn, qiu.yutan@zte.com.cn
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Yanteng Si <si.yanteng@linux.dev> =E4=BA=8E2025=E5=B9=B49=E6=9C=8812=E6=97=
=A5=E5=91=A8=E4=BA=94 14:53=E5=86=99=E9=81=93=EF=BC=9A
>
>
> =E5=9C=A8 8/30/25 5:01 PM, wang.yaxin@zte.com.cn =E5=86=99=E9=81=93:
> > +
> > +3.2.4 MAC =E9=A9=B1=E5=8A=A8=E7=A8=8B=E5=BA=8F=E7=9A=84=E5=85=B6=E4=BB=
=96=E6=B3=A8=E6=84=8F=E4=BA=8B=E9=A1=B9
> > +^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> There is an obvious misalignment here. I'm curious, have you tried buildi=
ng tests?

Oops, I almost missed this, please resolve the problem and send again
with a new version.

Thanks
>
>
> Thanks,
>
> Yanteng
>
