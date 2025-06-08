Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDDB51922DE
	for <linux-doc@vger.kernel.org>; Sun,  8 Jun 2025 00:07:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749341260; cv=none; b=U5URROCo0/Q7gWQ3/kA8XgALAk8c9d4igieP0jakD363H6LgNw8hTlY6lyLxhSp4+exu+mKgAnR/P+vKNhSC/1TujLVJVkbe5hk7apIa9iuS5ZOWlQBR+g3S1gB1PLpL+Q/YtlfrQKLTyX5m/sPwPIk4QsMopbZmSnDp1+Po9ds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749341260; c=relaxed/simple;
	bh=0UHtAUcnJfFf44KjoiEAzK/GgbeDg6XEKPgsifKNFJI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=teosi8pihm1b9b2AcKgNRIo0V237yOEl7JfH7gbJB4gd32ESWHLJ9i8H5Wi3XhBgVlFdvsl16o4qLpaMETnPfi62B2ZcK1ba8L+p66JILDWIGUQcjkbUh29BilMLhWdfoONzDfnc7gr5IAjHBxNPk1XCXs6TaQIv281px8G/h3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b=bo5ZRkmi; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b="bo5ZRkmi"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-476a720e806so29600281cf.0
        for <linux-doc@vger.kernel.org>; Sat, 07 Jun 2025 17:07:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen-com.20230601.gappssmtp.com; s=20230601; t=1749341258; x=1749946058; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0UHtAUcnJfFf44KjoiEAzK/GgbeDg6XEKPgsifKNFJI=;
        b=bo5ZRkmi673wFRTTZdjmi2VX+/ESFRowURL0Xy3X2kYxQmK9Ij+JLv7xGoaSv0N4i9
         Qc+DoysiXzeDzW1zONrbKWziPyIp2Udv2KGvHsqbFodiADzcq8DW3vnWfs4wwuAieJhR
         z91O2ivXuTsrMCVshK1xS/kFZ1PoACHbYsMNJN2RnRnwBe34AZmfcpDSKoC2HQbhBfgk
         sXtci7tVscfGRaqS+EWVtwrQoWVRCRDtODlUNEjl5dLEjly1/ZZ/S+UR3hmCzFiQS+Ho
         dT8bMjf9N8nBhltzA2oW63+TeI1z3irlhAOwGQX6jkS/V8F3sc+fYdFna5tWsQAurx/M
         gjLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749341258; x=1749946058;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0UHtAUcnJfFf44KjoiEAzK/GgbeDg6XEKPgsifKNFJI=;
        b=LxdMF88EMjIh8eKsp+//TbFhsfaKVCtUrexWHwYRfTihGxGSpmYVmeogsMQnsP85T3
         l/gyX236gofjd84AeZuKKlGiBWZCoM/3Sz3HgMHyjzfJNpciOSBiTXVlD2RCRoA/Umk5
         Pdgt0K759ZCd/ETuBiL+0jqJvRIluwibJNx2IDXyzis5j4l11CE2Y48pBGcUhdhyR7Bd
         CQJSENqVC5gMZYtGlK5U9FUgQDsz+K/66aJIQT8CMxZZriWJMw/ZtbxVRtXMmn+FnWTH
         GdQ2f3mHf6QlKX+bIxTPGSieDrfYRj2BEApbAi5yQS8eXG2OfTJi5BZ1GkkUq1hLwaSp
         6ePw==
X-Forwarded-Encrypted: i=1; AJvYcCU1FBZENBhYS0vymlQk1r/L+A1j6iC3qkUaYb5IBl2dL2nONVwypcd/b34EQkOnyrKwiXZVfQtqXRY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxUaat1c90QZxC4y3AxLMtDjHfC1qo62BvLSLYcxXyxlXvRWjA4
	187RnsYsDmv7hHQ4yiTf709OOdpz079GfmoYme/vHtBHYAMrUfcRXXc+S1vulN95WEt5Ca3Vzdi
	6vreaVb+81v7wReqCX6jfw41y72cvJzECYOGblwbDKQ==
X-Gm-Gg: ASbGncuYP781cZ4jIvVFMlixf/sBbV+7kk40t/ejUF5pZeCQw89n0mSvAAsKZrMFGt+
	flmh8eHo9euoCxz+I/FqvEanK99QeIRUIhomf9D05QbBg0hT8/6iMtOxtsG5X087Aaq3WfGNzex
	2qUW+gt+QU9lPAiWtGq5fYZIwX8fhNeeGXxZrDORGW
X-Google-Smtp-Source: AGHT+IGZXoZIxS9/yln1HGP/gC39IRXpdwmbCIccfIgA/QRPKVyeFdcL/3Evwv4wy0rGEIkAT0IK7awaOmhPrDGklrU=
X-Received: by 2002:a05:622a:2287:b0:4a4:4da5:8b55 with SMTP id
 d75a77b69052e-4a5b9d39e8cmr156784701cf.28.1749341257836; Sat, 07 Jun 2025
 17:07:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CA+Sjx0XP2A+rsA95NVwX7czQGNREXcFT=psedA7fawwKJb5rkw@mail.gmail.com>
In-Reply-To: <CA+Sjx0XP2A+rsA95NVwX7czQGNREXcFT=psedA7fawwKJb5rkw@mail.gmail.com>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Sat, 7 Jun 2025 20:07:00 -0400
X-Gm-Features: AX0GCFt1ImFK2hsbn3A789K1X_AfOKzUxJEaw3s1RQYNVvl-mWg1uEajt-sMD-4
Message-ID: <CA+CK2bDJ6eYrVh4qewzH63HUUwKwGjcw=e8NhTF5AQ3f3N01cg@mail.gmail.com>
Subject: Re: [RFC v2 08/16] luo: luo_files: add infrastructure for FDs
To: Anish Moorthy <anish.moorthy@gmail.com>
Cc: Jonathan.Cameron@huawei.com, akpm@linux-foundation.org, 
	aleksander.lobakin@intel.com, aliceryhl@google.com, 
	andriy.shevchenko@linux.intel.com, anna.schumaker@oracle.com, axboe@kernel.dk, 
	bartosz.golaszewski@linaro.org, bhelgaas@google.com, bp@alien8.de, 
	changyuanl@google.com, chenridong@huawei.com, corbet@lwn.net, 
	cw00.choi@samsung.com, dakr@kernel.org, dan.j.williams@intel.com, 
	dave.hansen@linux.intel.com, david@redhat.com, djeffery@redhat.com, 
	dmatlack@google.com, graf@amazon.com, gregkh@linuxfoundation.org, 
	hannes@cmpxchg.org, hpa@zytor.com, ilpo.jarvinen@linux.intel.com, 
	ira.weiny@intel.com, jannh@google.com, jasonmiu@google.com, 
	joel.granados@kernel.org, kanie@linux.alibaba.com, leon@kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linux@weissschuh.net, lukas@wunner.de, mark.rutland@arm.com, 
	masahiroy@kernel.org, mingo@redhat.com, mmaurer@google.com, 
	myungjoo.ham@samsung.com, ojeda@kernel.org, pratyush@kernel.org, 
	ptyadav@amazon.de, quic_zijuhu@quicinc.com, rafael@kernel.org, 
	rdunlap@infradead.org, rientjes@google.com, roman.gushchin@linux.dev, 
	rostedt@goodmis.org, rppt@kernel.org, song@kernel.org, 
	stuart.w.hayes@gmail.com, tglx@linutronix.de, tj@kernel.org, 
	vincent.guittot@linaro.org, wagi@kernel.org, x86@kernel.org, 
	yesanishhere@gmail.com, yoann.congal@smile.fr, zhangguopeng@kylinos.cn
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 6, 2025 at 6:28=E2=80=AFPM Anish Moorthy <anish.moorthy@gmail.c=
om> wrote:
>
> > + token =3D luo_next_file_token;
> > + luo_next_file_token++;
>
> This seems like it should be an atomic fetch_add: I'm only seeing read lo=
cks up till this point
>
> (Sorry if this is too nitpicky. Also for any formatting issues, I'm on mo=
bile atm)

Thank you, this was also found by other reviewers. I have updated this
to use atomic.

Pasha
