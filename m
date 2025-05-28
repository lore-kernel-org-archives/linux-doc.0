Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1095620CCF4
	for <linux-doc@vger.kernel.org>; Wed, 28 May 2025 20:29:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748464186; cv=none; b=E6U013+fzHlzMxVgVR2a/IZm+aNdawyHpz0o/7qRxlfjiAA4Yd655HZxNI6knurHHbE0l3GrH0U79fsPLnPk50RYDGD7rOHG+4qG8E8IOm6Xddne4GTogXeubDCVvgZLpBOHF6ttaEURtCuwTk6kSssOjAGySq0PTyGwVaZALis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748464186; c=relaxed/simple;
	bh=sbF3z9kaUzweO2TUVbqeSb4prVvCanJ6u3NDjk6MEFc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dKbirXNNMUvhSYDr6y54jbqNBKoM3qAGF+j0mso2BiIKwGrPuFmYDMz+tbLOGp6TODabajEH66Bx3cbuRw2u5Nj42rZhAdA7keBH4u/aEzgE5tMlIChbnIwo4Lj9CyaqS2puUUYieNSimTAfUV/GG7zvot3dpjVlmnbhlH0dT5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=0VwF6iVX; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="0VwF6iVX"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5532e0ad84aso176158e87.2
        for <linux-doc@vger.kernel.org>; Wed, 28 May 2025 13:29:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748464182; x=1749068982; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YAQTz4gs0qjYnO6FgGT3yFTm8XMDLPUsfY93F9OnJmM=;
        b=0VwF6iVX8HV48gHRxW05PCG6yttFfYkunrLxnLp6SBCwIdmio03m+AzBorJjF/P6TQ
         UnQSEb2PHG+Sz6qkX+S4r0U0YeDKKmIW1YwQE1ElYD24AQ7BN/OzOqMKVJSzbvSNOqo6
         GHuKVIv2Ba5qipTcPRQixB/9ucTmPnWtbWDakp57nlbMSo8kZohdRkkDYM9bcMWu2c0x
         VLlcoXL8dARAW27fKb9aPeomY2b3W6/4vT4avn2U1UWnp6yiSxb2OgA1lEHN5TBMUc7v
         Gv3UOEYijgEF/9OJcIAhyd/ixqzPOZD3DaNqfc4IwFAA5QchpUDd+sqeWmKf8xZnyOIi
         OrKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748464182; x=1749068982;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YAQTz4gs0qjYnO6FgGT3yFTm8XMDLPUsfY93F9OnJmM=;
        b=i8WhJoSnUeLRcgwTNZgT0bRdPMOrCm0efCext/F4QumZXVGE9Hcxts3jVaXi9ELj5G
         OLqp2rFrZ0p1LQXVN0kD2ARI6CJ8A+yR9aFgbKy0t0nMT7CaGuJMa4Io4502IVSm7V53
         CrTO9t4fQz96uVcskYpJlCdxhig1T8/2JwZWsb7MbCE3q5S9Cq3pJ0ztf9EhYrAc6DTd
         WOdkdG7wgsVxAXjFUjWKtpl88hEdiaezWviiFw83CD8ZLsb6qgZzwdpgftcu9mSmwYek
         ilh4h0X6K0WABY5DI7UiK9F+QKT9TH088/I8Zu9j1hL1MoYfJC3kUc2q9+6pDvAg6tep
         dsAA==
X-Forwarded-Encrypted: i=1; AJvYcCWipyM9zwvyXTA/oeDd/XQvl/GEEIEpHVNx4jATJNTJigTHYVYCP5Rry/ulPWpb7nlrIk0xDJYciSc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzLunetKPkFPTXLQsJ4/j4MENsnrCWpWymDKjIMJnP9LbowD04+
	BR2XiwnD0typgzfDtt9oGtkbAW5EayTx9BnFqKq2utwKEeOK9SwxvmcAWZ64jOczrQhm3HYVwws
	cYCKIRTxSkFC7GGRUlyzW39orklMzAYl1OT80gw7X
X-Gm-Gg: ASbGnctfAQ435KIQBhvpvIGZvJVIenkxTEz3dlPAnpTb6f6Fpo+7WJ5LYCERYyK21Vf
	7Sg/hFGm42ztXdEng5ugT3rRwz6cb6oAMQaLLTFZow9xtfJcZPB38/AWcx4KboEirJTt6XFfQNy
	BbXnGu5APJT1dt1x7EYqN9AHRZDAOyCkkcePMc1ugfqQk=
X-Google-Smtp-Source: AGHT+IF45STyrs34elU44CUwMCYWgaMk1iP9fwetArWutXYXe6915Ne5pggJH8TEQNxrkcCcU+Zu5CZn4NKDFdXs8YM=
X-Received: by 2002:ac2:568b:0:b0:553:24bf:2287 with SMTP id
 2adb3069b0e04-55324bf24f9mr3571266e87.11.1748464181753; Wed, 28 May 2025
 13:29:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250515182322.117840-1-pasha.tatashin@soleen.com> <20250515182322.117840-11-pasha.tatashin@soleen.com>
In-Reply-To: <20250515182322.117840-11-pasha.tatashin@soleen.com>
From: David Matlack <dmatlack@google.com>
Date: Wed, 28 May 2025 13:29:13 -0700
X-Gm-Features: AX0GCFu-az7wXS3tUctrkttv1BpVxbVwipCz3lDeWXiCiQMHX4cL0MiB-XnGYnI
Message-ID: <CALzav=eAWdADOyZHxCTF-eKwiYhw2ELj3mKJ+8uQY6sOf0Hmuw@mail.gmail.com>
Subject: Re: [RFC v2 10/16] luo: luo_ioctl: add ioctl interface
To: Pasha Tatashin <pasha.tatashin@soleen.com>
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
Content-Transfer-Encoding: quoted-printable

On Thu, May 15, 2025 at 11:23=E2=80=AFAM Pasha Tatashin
<pasha.tatashin@soleen.com> wrote:
> +static int luo_open(struct inode *inodep, struct file *filep)
> +{
> +       if (!capable(CAP_SYS_ADMIN))
> +               return -EACCES;

It makes sense that LIVEUPDATE_IOCTL_EVENT* would require
CAP_SYS_ADMIN. But I think requiring it for LIVEUPDATE_IOCTL_FD* will
add a lot of complexity.

It would essentially require a central userspace process to mediate
all preserving/restoring of file descriptors across Live Update to
enforce security. If we need a central authority to enforce security,
I don't see why that authority can't just be the kernel or what the
industry gains by punting the problem to userspace. It seems like all
users of LUO are going to want the same security guarantees when it
comes to FDs: a FD preserved inside a given "security domain" should
not be accessible outside that domain.

One way to do this in the kernel would be to have the kernel hand out
Live Update security tokens (say, some large random number). Then
require userspace to pass in a security token when preserving an FD.
Userspace can then only restore or unpreserve an FD if it passes back
in the security token associated with the FD. Then it's just up to
each userspace process to remember their token across kexec, keep it
secret from other untrusted processes, and pass it back in when
recovering FDs.

All the kernel has to do is generate secure tokens, which I imagine
can't be that hard.
