Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3B1C2DC763
	for <linux-doc@vger.kernel.org>; Tue, 30 Dec 2025 20:06:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767125209; cv=none; b=XhuRpZsX1y4Uc2L07lPElTnLTNR4XBl0wSngjPtQKHJj2s2d5s0GKKO+d1R+GR/tIb4pXyxlNvn8Gney0pC1bFICekh6mYPosO7letnHBd+6BLD+A68QnGoGYgU/eQL2v8Ce8OVCAJzE8C56xhGBCWgUkFBUL+tE9IwNWUUirXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767125209; c=relaxed/simple;
	bh=/PLYzH5+CixfJDCVvl0DaVA5ug/F7wDjS7L11ku8Huw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XrSHQRypxsmd5gwvH7JJEUxJsN3uQkPPPxLlc6lRBzLXjbwFMlJLc7tebJi5X5qV84Dp/8Ctpn5IlWUmJGMs39k0HVGbkjShQMwei8wtb/u7UUdRNWIExSxBeZyy4stsjrFGbel309FqiPwXFE7JEvwzMCDCvPkLE375Oc2IS4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XQ+4xYPf; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XQ+4xYPf"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-b76b5afdf04so1545240166b.1
        for <linux-doc@vger.kernel.org>; Tue, 30 Dec 2025 12:06:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767125206; x=1767730006; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LZCl5Wv0IkKlmlTExHQV1tS3zQvMog8+SwwAO4vVb1E=;
        b=XQ+4xYPfkZ/oZ+mNOquxbhC1Mp67L+Cb3YpqfFfg41Mu/cj2e2OQhc4VYArU3Hl2+A
         /51HttwkIJuh3oOZNG6O0Dz2dSTjUmKA7q4pPTcttoGK0h7RQAmHsdnLVLV48tfigBkR
         PRYi0KHYw/4mf7NnHi3QzPYLF6umVEHV8wiMMcR21TNtJ9/fjlPq0T3eItjAv3Ct2vNn
         SysFevOJCE+6cD3go/uWFYZfQisW0peKAvJiS18Ax3AM0/FkTjf6FRQK5DPiThGnLNYQ
         gZ4lNGGI/VY4qlFUQMWQxt0t5+E4eJ0hLoPfTEVEVDoHZtrm+8MiStOE2Waue+pYmG7p
         VJ0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767125206; x=1767730006;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LZCl5Wv0IkKlmlTExHQV1tS3zQvMog8+SwwAO4vVb1E=;
        b=H9a/EzwcGxkA+d085m4+gVaieJnDYIGpHi/WtB1nFtE5Mbkan86Ugr3fMMMGwigwSU
         1LjErSLGEUKiO0Np+WBZeDsZ4NGT5PLsf5Z4iMKvrPb/odWc7qXnlv0bn5FYHh7oWqAS
         JUMOvf/8UIA/05WN2g1NvOmpndKWojXVHHe3f3JGxRuomyf4dhupqeEgfj7qWccQ1368
         u6ON+STxboTIXlm8tS33h/bxthl2XqBXpDFXHc5Py6yjxWj/WyexY2V/JSgiZWnWLYzx
         SLPPKDLAlRlWEdGZQMX0B/+xAAtwMMLZnJnTtdodkxorQDxyPeqxkwquTDWKHot4nrAf
         ME3A==
X-Forwarded-Encrypted: i=1; AJvYcCVFD4iMOKScv8wr71eJh1OcPRwq/9KIow+w3J1scCpLkMPqNHWBCcpSeJlIDOkWdBJZLVUyOcRezWM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2DJJyLgZSz7ACTLqdggLr3djCelbPLiC0+YfEy3QhIDS0dXMS
	u4D8acWQkS/nMCnDDoak11RT8foMaAtcWCAExI7sqtSLlnH3xW35Gozu5MEcu0NE8MG6UEDoIBr
	RJOVo+MK0Vyv1BaLzlDMtM+0gqBscgQ5r7bI4Q5sYEQ==
X-Gm-Gg: AY/fxX7/IUhuiIrmp5ZOEP5qROgRSwqIUopaR3P9dlSLJYaxtxrgsweIWag5CvIS2+N
	e0kKiUR0ckVGgpbTLNtyPZ/39ykpINihUECGWt0OUwj1Gzas95jQEkiUfvCcz7Et+OoUoafIqV2
	JqTl+xSOhF19XALMj+UlgPTIvnqWbA24oPxW5eVzbK4CekLW8zrErbJwXVqMBno9kdM82bRfPEk
	3UxG6h/uBxVSPq0Ki4DjevK8X20MAmuuPEnzn040MWb+KkTPvWoHgPXJIw17svw78d6PsR0i+Gy
X-Google-Smtp-Source: AGHT+IFY+a96YKfGKpUiGe0AtUxNfyjF6PwVq7cze6WacEffcWnIHIXCMvm1zSdM0EtElXinZkKWzbY6cpilsqUBGQI=
X-Received: by 2002:a17:907:6ea7:b0:b73:8639:cd93 with SMTP id
 a640c23a62f3a-b8036f2ab38mr3518606966b.14.1767125205662; Tue, 30 Dec 2025
 12:06:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1766099040.git.hilbertanjou83@gmail.com>
 <e6efa01104fb4476abbee4e4b4fe4f6bb99464f7.1766099040.git.hilbertanjou83@gmail.com>
 <d6e73d89-c86e-44c9-ab40-9fc5cd31713e@hust.edu.cn>
In-Reply-To: <d6e73d89-c86e-44c9-ab40-9fc5cd31713e@hust.edu.cn>
From: Hilbert Anjou <hilbertanjou83@gmail.com>
Date: Wed, 31 Dec 2025 04:06:34 +0800
X-Gm-Features: AQt7F2oy_ORhG4hbdGHuPjtpmwO1o7dwMGdMv99hzmkDw7puW4AqoIx8VVk3Kps
Message-ID: <CALrsmp=F160OojMw7=Sdm5TAwOyeiCHU9rYQXFqO8roaiFdSaA@mail.gmail.com>
Subject: Re: [PATCH 1/7] docs/zh_CN: Add timers directory Chinese translation
To: Dongliang Mu <dzm91@hust.edu.cn>, alexs@kernel.org, si.yanteng@linux.dev
Cc: corbet@lwn.net, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On 12/29/25 3:36 PM, Dongliang Mu <dzm91@hust.edu.cn> wrote=EF=BC=9A
> Please fix the following errors and send a v2 patch.

I have sent the v2 patch.

---------------------------------------------------------------------------=
--------------------------------------------

> Seems like I am not on the receipts of cover letter. So I directly
> comment on this PATCH 1/7.

After checking the terminal history, I can confirm that
the command I used at that time was:
```
git send-email 0*.patch \
  --to alexs@kernel.org \
  --to si.yanteng@linux.dev \
  --cc dzm91@hust.edu.cn \
  --cc corbet@lwn.net \
  --cc linux-doc@vger.kernel.org \
  --cc linux-kernel@vger.kernel.org
```

The PATCH 0/7 in my Gmail shows that the email has been sent
to"dzm91@hust.edu.cn",
and the mailing list
"https://lore.kernel.org/lkml/cover.1766099040.git.hilbertanjou83@gmail.com=
/"
also lists this recipient.

Please let me know if there is anything wrong with what I did.

Thank you very much,

Xingqiu Xu
