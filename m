Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14588127B67
	for <linux-doc@vger.kernel.org>; Wed, 21 Feb 2024 21:26:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708550773; cv=none; b=jBCJ1OX/EUHSZVAivTPW4UG7H5428f8egsUIHYJYnS0xS/QRzct6AT9P0dGRCbVaYAJTQ9Ue87DPEHHfWsHTZAUzvEwH48ezedPW9Y7NP3aJwKfYul87MxG8N2y1M9apzNxPJ/4YMCF/GB24cuCL4fNZHPsY1H9PTIU7naJVeDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708550773; c=relaxed/simple;
	bh=1oEaHzezRAll9SQ0JkGYVz7chMh/UI28PlbGaomS6oA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NpHjlrdPm9C2xt5ASgwStSAtfeTXiTlAppUeb9zYyJhc+i+FJESn6sWThLSd77mkQQrGDE5x8UD3jvVnqJbMbRNrKFjMEqB4wgkcIF9AOl+AhUJo3ociulTqImtzf8jxfdkejJ6/EDKekBbSyrTjiA4g7LzTAA6Kx0oIqprIDR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b=twlEEf1y; arc=none smtp.client-ip=209.85.167.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b="twlEEf1y"
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-3c049ccb623so4727158b6e.1
        for <linux-doc@vger.kernel.org>; Wed, 21 Feb 2024 13:26:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen-com.20230601.gappssmtp.com; s=20230601; t=1708550770; x=1709155570; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1oEaHzezRAll9SQ0JkGYVz7chMh/UI28PlbGaomS6oA=;
        b=twlEEf1yUUSQY4M7jcQpxVobd+dWC5ezggwrEwNE60AZ8QeMObLxP14XTPx38VQ2eQ
         TyrB4dnaVh7ipn13+vKwt6sJKS491Skg4KAMlL9NyxSI8HytAsFXSzZSk+umh+bpebcW
         YHwErdKYko8+z7QnDr0g9jOg0w3y7Juvk+0CXSSikE8fwrDLZhKCz4YDBKFAX8UfBeYy
         jUTHfw76ke8UM5rMB3x0u8xRuKsnecR7d8tvj0OaUwXWM9ceEuSwr94Fi6j2NKkbOyG0
         vuocKoz75fJUtkV5Hsf7vnXoE01wfziYx61d427gMjkLIq2cHgMjI++ZqF99CfNbPmnQ
         VnhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708550770; x=1709155570;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1oEaHzezRAll9SQ0JkGYVz7chMh/UI28PlbGaomS6oA=;
        b=BTIeRbhXjz6ciuxLCP/59sU7rpWpffWxFiDzFXMTG+JcvKMcr8TfkM/NPnmE7CdSF2
         EieWAkHRDNJ+vcTDb4xWythYtPCe/yg0eJ+3rlXeRXM5otnq/XPcnxsXSMJfUqMVSVO9
         4L/CtCWcL7CaulehEEx2NOTdwOgO7ugYJCQr6Hs/IlXBw0UW/jAd9w5c1ZwAMIUMNaSw
         nqAmm63dHjLj7m2qUPSXN5ak8Vxu1JvggGZSB+YwZHjqX8pZAJ9VBvJJtBmSvItNaePZ
         UIikdIHeycHn01S/Rp0Q7Pz36A9HXIajBqkJLf0CtIScolz/2ir2kLjWqcDeIvHmdj1e
         EppA==
X-Forwarded-Encrypted: i=1; AJvYcCWgS3cFWJXQckGDNeIZC/nXC+r9t+vigcBp+Ag2htzcMK7yXjP1ncbTNNaRJRyGiTbFNsg3mfvrADI28mdPSGaKmlTQjBLDZ4io
X-Gm-Message-State: AOJu0YxV7+VULhO+e0+WPb+JcKDXDwSVh66nxbuB4pL6qJKritfbAlyn
	5uBPPNwq92uhEEy3WMlqsqxa6l4SkzCOi0E7VUyLX7Ed4hDqKGJly/r9X/gUFBhX1qXzqZzm6SL
	Ae3hBszAvSZW5AIzG+1KttBJ2NLH/S8Ytu8SL1Q==
X-Google-Smtp-Source: AGHT+IFZSNXNYlAy0AiXEzXx4upknBW0nGNBljw/bbiwmtTqAeSgHzhF6z+ApQTHTR9DUqPj2ju2fMwMSbPw53G4Luo=
X-Received: by 2002:a05:6808:1208:b0:3c0:3d12:2002 with SMTP id
 a8-20020a056808120800b003c03d122002mr24802049oil.13.1708550769929; Wed, 21
 Feb 2024 13:26:09 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240221194052.927623-1-surenb@google.com> <20240221194052.927623-7-surenb@google.com>
In-Reply-To: <20240221194052.927623-7-surenb@google.com>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Wed, 21 Feb 2024 16:25:33 -0500
Message-ID: <CA+CK2bDX7v8+NHi2ioxQ4KF+vBYA0JhR3=Sj6ZxBS0jD7i2Gmw@mail.gmail.com>
Subject: Re: [PATCH v4 06/36] mm: enumerate all gfp flags
To: Suren Baghdasaryan <surenb@google.com>
Cc: akpm@linux-foundation.org, kent.overstreet@linux.dev, mhocko@suse.com, 
	vbabka@suse.cz, hannes@cmpxchg.org, roman.gushchin@linux.dev, mgorman@suse.de, 
	dave@stgolabs.net, willy@infradead.org, liam.howlett@oracle.com, 
	penguin-kernel@i-love.sakura.ne.jp, corbet@lwn.net, void@manifault.com, 
	peterz@infradead.org, juri.lelli@redhat.com, catalin.marinas@arm.com, 
	will@kernel.org, arnd@arndb.de, tglx@linutronix.de, mingo@redhat.com, 
	dave.hansen@linux.intel.com, x86@kernel.org, peterx@redhat.com, 
	david@redhat.com, axboe@kernel.dk, mcgrof@kernel.org, masahiroy@kernel.org, 
	nathan@kernel.org, dennis@kernel.org, tj@kernel.org, muchun.song@linux.dev, 
	rppt@kernel.org, paulmck@kernel.org, yosryahmed@google.com, yuzhao@google.com, 
	dhowells@redhat.com, hughd@google.com, andreyknvl@gmail.com, 
	keescook@chromium.org, ndesaulniers@google.com, vvvvvv@google.com, 
	gregkh@linuxfoundation.org, ebiggers@google.com, ytcoode@gmail.com, 
	vincent.guittot@linaro.org, dietmar.eggemann@arm.com, rostedt@goodmis.org, 
	bsegall@google.com, bristot@redhat.com, vschneid@redhat.com, cl@linux.com, 
	penberg@kernel.org, iamjoonsoo.kim@lge.com, 42.hyeyoo@gmail.com, 
	glider@google.com, elver@google.com, dvyukov@google.com, shakeelb@google.com, 
	songmuchun@bytedance.com, jbaron@akamai.com, rientjes@google.com, 
	minchan@google.com, kaleshsingh@google.com, kernel-team@android.com, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	iommu@lists.linux.dev, linux-arch@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, 
	linux-modules@vger.kernel.org, kasan-dev@googlegroups.com, 
	cgroups@vger.kernel.org, =?UTF-8?B?UGV0ciBUZXNhxZnDrWs=?= <petr@tesarici.cz>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 21, 2024 at 2:41=E2=80=AFPM Suren Baghdasaryan <surenb@google.c=
om> wrote:
>
> Introduce GFP bits enumeration to let compiler track the number of used
> bits (which depends on the config options) instead of hardcoding them.
> That simplifies __GFP_BITS_SHIFT calculation.
>
> Suggested-by: Petr Tesa=C5=99=C3=ADk <petr@tesarici.cz>
> Signed-off-by: Suren Baghdasaryan <surenb@google.com>
> Reviewed-by: Kees Cook <keescook@chromium.org>

Reviewed-by: Pasha Tatashin <pasha.tatashin@soleen.com>
