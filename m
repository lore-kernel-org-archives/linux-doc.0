Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A00525CC74
	for <linux-doc@vger.kernel.org>; Sat,  7 Jun 2025 23:58:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749340729; cv=none; b=Dpzm0n7XM6Tp6m4CwQEuT6ZSeJBO1BUez13vWCZqarKL4Az5Boe+8rpfPK+yGrn7WaoHboPeeeANziFe7ahfGVrHsVV16whgzvFsyKLWnHBPafGfvIju4EkojxjLvho/68zQp+KKfPF3Xx+AYf+fq9DLSSAkrWt5s36Bc9xKbuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749340729; c=relaxed/simple;
	bh=zktDSaYXBb4SQwR6FYYnNsk19oya6DAnWYfYGvtkKQE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bucQKl6FfQC4dH7nUwt/TEL0mOk2HnNjl9OII/I+lZy9wLxXXAYsJKQx55CEvezharsEUANJOe2nAjoXztTsyegn3EhXUSHttc5aJhIf0I1Lv+OeMNZfPo5LW4nUDxN4+xZPoeFcwQA3+U1TrDabfdPUvFXN3BQ3GnUws0+AgDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b=TSA3XRTn; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b="TSA3XRTn"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-4a58e0b26c4so51661531cf.3
        for <linux-doc@vger.kernel.org>; Sat, 07 Jun 2025 16:58:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen-com.20230601.gappssmtp.com; s=20230601; t=1749340727; x=1749945527; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=SZb0yQu3bW7FIgr5rV6Gh9DpSUWQW7LKM4W2HiNGYQg=;
        b=TSA3XRTnZVV3OYW2vQ45ouvU72g+7zjPWtGYuFpdeBwPKIWEeIUWp0eTJmRs6nEcMb
         9KuhRbzTlwQLOVGZ2oAu7J+a+gv7gCVMu2FfkPHVBPk0FxUGbxz2MsWSWy5/g4NUnw38
         71lHLFJ2sIWmgrU0IXg/3k6VuX0zf4rfMBhQ1fKUisbaM3SBJQO0/A6amWSwoMz/oX9D
         Q58diwYajwayY+97sOlZky9WEo2BSuSKL2ZKLBHDo2D42uvgqDo0OYcOMFEJ2edQhMNJ
         5EFZkl65UnpPg3Z7WuxKXChzCuWIndXHONkWehebmTLdxYQys0/Tji3aTL3OzeUmgBH3
         FdXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749340727; x=1749945527;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SZb0yQu3bW7FIgr5rV6Gh9DpSUWQW7LKM4W2HiNGYQg=;
        b=EYGjj5Kiz5tPH9ZXFTgJCmT3xI15CrdXZrHXkxdW9jFI1T8Vr9BpTi8KpdwKiTEiwn
         HgYKNA1Ux2sx/lEVlqGfHUTIR7e/xcH9LHY+5+US2JBCQhTphaPkVq0vwRD4NUtgJpFT
         9O4qEQmCpRdLJWwl/rxMKGukVFefdZ05bXBlFLm0rk9T3zr29zEQkyFFZTROjzVcxeMW
         g3ya45+aEyLoT5FmYNTkkufhdKLnuF3baRSB8rQ3qZYQto1bjE+FWbJC2uRIOBJ66FKC
         CctIBq49VP406anFiHgAATkc2KXaJrgjTCKbg0+1xmWWhRTk1tr+wISApn6p/YZ/vE5y
         niog==
X-Forwarded-Encrypted: i=1; AJvYcCXz6b+dOSlwwgwTWCyC8vAYCVbUrXNKS2IMoW3P0R3JeXXWu7ei1U61QwCAkuRh9+/UyIzXkxIHDSc=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywegu7uu7YdktOnvoMcmneFOPr1DxQTEfbH8L97VFUqd2gdUY4L
	xcVclctjcgczTynlrbfr5U2tPm44X+WCmByb/V2PZT1HSMbzO4aixKR+k7EwijXs+Al0odvnc5W
	O+9N8Q9jFmxK7o3nUHT7OD8Rp7HVe3gKrXhBcqz7AYQ==
X-Gm-Gg: ASbGnctvamtBb15hkjMT/1hVtH3XpEZZRCmy2F1g9X9OPHqdDa+njfKj2AE97F6TLH1
	lUuCgzrlJfP3gFjEhoB3pyz4fc8UpZyqon1MimPV5YB8Yj0SEkCg4YpZlRbPxDqV+Ps+nlTAlbQ
	gkB+hkTjhMGwaplyXSi125cK9P53VPrxGrmeZAPgNT
X-Google-Smtp-Source: AGHT+IEB97RE71KtJwLfGv6pP8Smnjv6c4dtCN8qnbdxkUOKkq++jlKJyn0l2dku3FDr9koONk+VDXarqF/XGOS6QJM=
X-Received: by 2002:a05:622a:1a0e:b0:4a4:3c3e:5754 with SMTP id
 d75a77b69052e-4a5b9d8de25mr154274911cf.32.1749340727206; Sat, 07 Jun 2025
 16:58:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250515182322.117840-1-pasha.tatashin@soleen.com>
 <20250515182322.117840-7-pasha.tatashin@soleen.com> <CALzav=dzvVgmwxhh9ic6mTjQL32srzAOH-wXgkksXTa2rd=TNw@mail.gmail.com>
In-Reply-To: <CALzav=dzvVgmwxhh9ic6mTjQL32srzAOH-wXgkksXTa2rd=TNw@mail.gmail.com>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Sat, 7 Jun 2025 19:58:10 -0400
X-Gm-Features: AX0GCFul3L2zzvlJ2GXtOx9lQ9B5uuJgCwhDk6D1c4MrC7_egkKEFjQyvbKOx48
Message-ID: <CA+CK2bA7kN1sYN2P4eZ7=7fzB--nRwM53Gy=9dEVzRiyt-q+9w@mail.gmail.com>
Subject: Re: [RFC v2 06/16] luo: luo_subsystems: add subsystem registration
To: David Matlack <dmatlack@google.com>
Cc: pratyush@kernel.org, jasonmiu@google.com, graf@amazon.com, 
	changyuanl@google.com, rppt@kernel.org, rientjes@google.com, corbet@lwn.net, 
	rdunlap@infradead.org, ilpo.jarvinen@linux.intel.com, kanie@linux.alibaba.com, 
	ojeda@kernel.org, aliceryhl@google.com, masahiroy@kernel.org, 
	akpm@linux-foundation.org, tj@kernel.org, yoann.congal@smile.fr, 
	mmaurer@google.com, roman.gushchin@linux.dev, chenridong@huawei.com, 
	axboe@kernel.dk, mark.rutland@arm.com, jannh@google.com, 
	vincent.guittot@linaro.org, hannes@cmpxchg.org, dan.j.williams@intel.com, 
	david@redhat.com, joel.granados@kernel.org, rostedt@goodmis.org, 
	anna.schumaker@oracle.com, song@kernel.org, zhangguopeng@kylinos.cn, 
	linux@weissschuh.net, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-mm@kvack.org, gregkh@linuxfoundation.org, tglx@linutronix.de, 
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org, 
	hpa@zytor.com, rafael@kernel.org, dakr@kernel.org, 
	bartosz.golaszewski@linaro.org, cw00.choi@samsung.com, 
	myungjoo.ham@samsung.com, yesanishhere@gmail.com, Jonathan.Cameron@huawei.com, 
	quic_zijuhu@quicinc.com, aleksander.lobakin@intel.com, ira.weiny@intel.com, 
	andriy.shevchenko@linux.intel.com, leon@kernel.org, lukas@wunner.de, 
	bhelgaas@google.com, wagi@kernel.org, djeffery@redhat.com, 
	stuart.w.hayes@gmail.com, ptyadav@amazon.de
Content-Type: text/plain; charset="UTF-8"

> Suggest using guard()() and scoped_guard() throughout this series
> instead of manual lock/unlock and up/down. That will simplify the code
> and reduce the chance of silly bugs where a code path misses an
> unlock/down.

This is an interesting suggestion. I have not really considered using
guard()/scoped_guard(). I personally prefer regular lock/unlock/goto
error, IMO the code is more readable this way, but I may revisit this
in the future. Also, at least in mm guards are not used, i.e.  `git
grep scoped_guard mm` returns no results.
