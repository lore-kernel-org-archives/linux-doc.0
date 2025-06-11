Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D91D7190685
	for <linux-doc@vger.kernel.org>; Wed, 11 Jun 2025 02:30:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749609014; cv=none; b=aBw+WGHPh7B5CmEKyE0slapT69ceYfiCxwS2GM8smgHT/Jym5PA8ZRqJO7Xl7jZeeKM92tA7o2h48Xt5uS8DSXcom0KdDE9TFL+OpnHVClY86hXCorskNVuDotG/IMFFHxOGazUMuDzk3jaj3YuuMh8EJHac0yVVGq6wxbHkcN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749609014; c=relaxed/simple;
	bh=iCpBMms2h3htRJxHjabTTwDLXUDGdOj+IKVyoZke/zI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=r+SJI/lopHNSxHNQpkBY7bV+nc+tod3875JgqoynFbKBHICI4DrmQfuzplslMXGiATmefSeAAbLy+za9aNk035tG/Z12oyeF3GPfrEw6bN5hRic/+F4GWkjfhr81XjADWXvdA+rAJk2Em36aSKzN/IQBxJt1bWZ/6Jv83bFrmqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iVUjRcUp; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iVUjRcUp"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-607c5715ef2so5421338a12.0
        for <linux-doc@vger.kernel.org>; Tue, 10 Jun 2025 19:30:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749609011; x=1750213811; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/dUEfHpL30NiOCv2yTR3s0lPJM/RQp9Xfe/xLVIiFMU=;
        b=iVUjRcUp8O5FXUakhA1zYwmKiCy7LIIiu1FQ7UaDOoumXG4BTCzRnAHtoqtVCmvYiU
         ALngV+KCaQiN4LyYRklJfB5ewXyNKkZJP8GQ70o9R8sw2oeKhXBorrQM6AblOShPRMkI
         C4BBAhY/QhYfPZ7DFXR1B9bdkM8IKdr7vIgIe1pef8euCDFXQ419BDwuSyB9MTTr9c3N
         7WTojcEarbVVM1PGZaGro1o0Fzcq8EzqSEvF224fKx6LmcCsa+s22wH4f1VU8LluKyoH
         O/dFttJuRj15o8Q9eLBsmIVMGun4I1wLa1xbKX/YDIGciWl3JL7rmYILFjzMs5uTOYXo
         bSNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749609011; x=1750213811;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/dUEfHpL30NiOCv2yTR3s0lPJM/RQp9Xfe/xLVIiFMU=;
        b=k/8wMSEyaCkcc047FOofyYzyxAjLwQW+p8y2n6FXlJ5+kzEaszKKPD6r7KQKcPsYDj
         ZgL43YOgLovv4qRm7HlTr5+IAE/A+AzdieIpGwnn0Rk9UmtOCxd1EYIYqVYIiaWJi8w+
         1fXXLsCqxK5LH6iEok7DVZZADFg0E07c8Vvf3uMkIDii+v4k6LdnVieedMsb+8CdHvTi
         y9C102mcruWCU3F/D1w0QJsVKOfTQzZQtAuWEukZU1StILGzfC2yelRDmRpNyx/X6RmE
         HQJ6IrmuYmIDs8gzOquLe2vHv2fXcsirxPENhP32baGm74DGD6G0ekmQY4VS6en0p2x6
         6usQ==
X-Forwarded-Encrypted: i=1; AJvYcCX/3aT/T2m4diljFe7YX0eiEIU/+AGGTsdYD1xIAm9GT3uD/YHfI9LkpP9CEAjTQsGiayAoFxn6ex4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyT8MmuD309PbuaCuwym8w3/HLYP44S9oM6RdJUvb7ApRoANPkf
	i7ZrBkxpnWHN99LiTZbhL+kj+16Le8G8zWYfr7N0bISmgXTCOBAetXDXITcJYSwuzF/PheL3eu1
	z/Ht0ZGz5E2H6brIP4/9uOQuEi2HGz1cuRIN8Q90=
X-Gm-Gg: ASbGnctwN38LxdUHtcoKo7w9ulcHStiegGgkoQ+5zHr9leko6aH+HG/cn+kSchbczOT
	ORYOsZ4QJDZK9V1Pzs5xZ+5jj1NqO9bz4zUpq56ukty2qU+FQ9c9PPglfr+qrRB8JTxLMY3bDmM
	+8ypepbTCyEQq/spnFZCu1Y9DT2FrPwqEVe5NsvIh+SSg=
X-Google-Smtp-Source: AGHT+IEGoI0IyH+wH1MlAu8R1e8w0z20jFq2leWYSw3PqdgayH6sgORCYyfmM+ZdK7/w94HwtPFuonewNIN+ohIaJ/g=
X-Received: by 2002:a05:6402:44c7:b0:604:bbd2:7c6c with SMTP id
 4fb4d7f45d1cf-60846d03412mr1071477a12.27.1749609010966; Tue, 10 Jun 2025
 19:30:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1749557444.git.dzm91@hust.edu.cn>
In-Reply-To: <cover.1749557444.git.dzm91@hust.edu.cn>
From: Alex Shi <seakeel@gmail.com>
Date: Wed, 11 Jun 2025 10:29:34 +0800
X-Gm-Features: AX0GCFtNojQu6PmLxtXaO7TA9RV8qSE7RI9FpKzdOKm7SNtiJZzA_QXAGuv7BVo
Message-ID: <CAJy-AmngU_7TAN7DD_nx-32a2NNxoUeJqgJqy91szyqfNEgFxQ@mail.gmail.com>
Subject: Re: [PATCH 0/5] update the translation of files in the process
To: Dongliang Mu <dzm91@hust.edu.cn>
Cc: alexs@kernel.org, si.yanteng@linux.dev, corbet@lwn.net, 
	linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Nice update.
All looks good and will be picked up later.

Dongliang Mu <dzm91@hust.edu.cn> =E4=BA=8E2025=E5=B9=B46=E6=9C=8810=E6=97=
=A5=E5=91=A8=E4=BA=8C 20:31=E5=86=99=E9=81=93=EF=BC=9A
>
> Update the Chinese translation of process/1-7.*.rst.
>
> Dongliang Mu (5):
>   docs/zh_CN: update the translation of process/1.Intro.rst
>   docs/zh_CN: update the translation of process/6.Followthrough.rst
>   docs/zh_CN: update the translation of process/7.AdvancedTopics.rst
>   docs/zh_CN: update the translation of process/2.Process.rst
>   docs/zh_CN: update the translation of process/5.Posting.rst
>
>  .../translations/zh_CN/process/1.Intro.rst         | 10 +++++-----
>  .../translations/zh_CN/process/2.Process.rst       |  7 +++----
>  .../translations/zh_CN/process/5.Posting.rst       | 11 +++++++++++
>  .../translations/zh_CN/process/6.Followthrough.rst |  5 +++++
>  .../zh_CN/process/7.AdvancedTopics.rst             | 14 ++++++++++++++
>  5 files changed, 38 insertions(+), 9 deletions(-)
>
> --
> 2.43.0
>
