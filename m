Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5736A2D7D47
	for <linux-doc@vger.kernel.org>; Wed, 12 Nov 2025 20:47:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762980466; cv=none; b=FSH0kDRuHAcfIW9CgIGhvQO2bepOu0kXDDn1NPbXwkv+V8eZK5DCxgp8ZU7PQmXgAmpbqi0VCxSC8bKUI2KfkL5zRdpGgGSt1GvP70i9vWks5eT8X27EvR7zFuC+xdEZpTuBromTvNjDJ/42YtsAk/Hq9yWatfqhDk7f8TBA85I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762980466; c=relaxed/simple;
	bh=usPtXPTZX6TXkeQ1v1bYEhzjiCuAM3VVnx8IxUxXsXw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=j1f57k2h924zl9ZZmHqjvvfjSAkXVzzvpWBniPSAilBZ1uDjfgcXzv2/ACZ0aIEI8dQIDm2ZMhNrvQiDR/lHFK8Yav4j1r83dEjeZyU3Tf19CDF4tLbLDAyXU4Of7DWz59G0r0qzyqdAsiCr++qFJE6LggS6yBN6R31CJNo0LQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=UlYBa8ac; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="UlYBa8ac"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-63c489f1e6cso178349a12.1
        for <linux-doc@vger.kernel.org>; Wed, 12 Nov 2025 12:47:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1762980462; x=1763585262; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dB48jiAJQmCTSUKKfFbF2w4Wvbq8+BICA0uZNvppCf0=;
        b=UlYBa8acZxIXxOCsd+IeAlRvOszYm0rcdeqrR+hs41Y9TNEpKoIvzNBg1HXwZ9JQNn
         4pEKzyUeVBEcpJxDJ4/FdgGpPeVChVeV+HStsILsNJuIBnz0OOxtSA6tnKbOZuByreGX
         V/H3+gRzxUL1vhOF745KA1vBK6SMRDvWaeiyXbsK6cmCdFhuehs860a88UtqaNOGCQK8
         w3EZmyLKw7sZpgDvd5rLKTlqO7Zv7ROfXuwzXl3+q2s0vIU+oUwuBi1TluI4kCD+Hcls
         16CYAofa4hItWp3/2SmeHyHOdxzMQx6fIZgBddgGI6m55D61j/ymcE58PUlg0AFEqwgn
         THKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762980463; x=1763585263;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dB48jiAJQmCTSUKKfFbF2w4Wvbq8+BICA0uZNvppCf0=;
        b=XlUCiET2px+bNpbgiXl85FDo9BPwwrBu+OvlOJYSYcFjd/CiPl8tPzM8d40VGY/xR6
         YBvknc00ESTFJGDqnJqWNUnGw0UzEo6CjGYPRHaOsBIpCxB4kcPvbU0e/+ufdAwFGYwD
         81YSf1YhfQ+doPIbnUESLN5uxnNMcDZn4A29Pi65Rj0ivZbE9kMEzSTiWSCjrrkxmhJm
         2/3Ktj7A8ejd5JNDeH6MBmNVwlnjFOOh+krBIYJUrvY81I8jM7zWqmxB/YNvCUib9slH
         3wBrolNA3FDOwcoTfZmsCOlcu/RRdWdHNlKcxdfYWGLG1HzPLmlJmjznVSkT2Oje2bkz
         LERA==
X-Forwarded-Encrypted: i=1; AJvYcCXcUfMgCCg6urdamFUY4xVjfIeZNDaP+sqBBQq02W8IOAEvwlYDGCp2xY0Gq/C3xxNNOnlrfQdoEAY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyrmgWh7mcnPJPrF9Q9KNhAxqd9yJo9H6LVYQ8NHwGDJgnXQTtD
	MGFMuxBXt4G72AvLCorSnO9WFeJmaxYmAcvf8vWbXrIDNjV+CUdFFNC4GzoHpn5TJsBZGuIIEir
	hVZ+LRJPUXYbnlchveAo1APd0dhRnPDverEDoOTa/Kw==
X-Gm-Gg: ASbGncs+kzTf++Xcu74z/UPCGeA/Yes8uLgKLAwDTqTEec1r+kaThZwgTT1ehGFrlKu
	reNil0nbzdAmUUyWXi/8Li3VGwk1L0G+XwCcGrf+EVWfgw9L2NkREkMMwUVtwsMKOZz/xVeGDsO
	zIhDnkZ6GNMXhh2Vcp20Bg0ikuFOGOFT8gtPh2oBFmUkpZTOAmjqIr58QuGiOylyrfIwCktREDQ
	4cOyuzMce/gQpQyX+i5SUGbD6dDclf7tcbgc9finPD1VWpYUqonAV3wKw==
X-Google-Smtp-Source: AGHT+IHnCxJ5sXULWNZ4xyt6eOXGzcL5bRRpxTbpBkagcIsWqapM9iv+G712dgCOMjYDLl8hNWljgh4gZ1/4nXWnvWg=
X-Received: by 2002:a05:6402:280d:b0:641:270:2c8a with SMTP id
 4fb4d7f45d1cf-64334ce2bf2mr656038a12.14.1762980462571; Wed, 12 Nov 2025
 12:47:42 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251107210526.257742-1-pasha.tatashin@soleen.com>
 <20251107210526.257742-7-pasha.tatashin@soleen.com> <aRTwZNKFvDqb1NG5@kernel.org>
In-Reply-To: <aRTwZNKFvDqb1NG5@kernel.org>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Wed, 12 Nov 2025 15:47:05 -0500
X-Gm-Features: AWmQ_bkVh8Sk3xM0csiNTGOKzpW_RilqarlOG4vqEffeEKya7lO37kZmCW2_pO8
Message-ID: <CA+CK2bAhJ+Lbm6v375RuZKs40q34gsKHE-N+dD8gKqgzsHCqww@mail.gmail.com>
Subject: Re: [PATCH v5 06/22] liveupdate: luo_session: add sessions support
To: Mike Rapoport <rppt@kernel.org>
Cc: pratyush@kernel.org, jasonmiu@google.com, graf@amazon.com, 
	dmatlack@google.com, rientjes@google.com, corbet@lwn.net, 
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
	stuart.w.hayes@gmail.com, ptyadav@amazon.de, lennart@poettering.net, 
	brauner@kernel.org, linux-api@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	saeedm@nvidia.com, ajayachandra@nvidia.com, jgg@nvidia.com, parav@nvidia.com, 
	leonro@nvidia.com, witu@nvidia.com, hughd@google.com, skhawaja@google.com, 
	chrisl@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 12, 2025 at 3:39=E2=80=AFPM Mike Rapoport <rppt@kernel.org> wro=
te:
>
> On Fri, Nov 07, 2025 at 04:03:04PM -0500, Pasha Tatashin wrote:
> > Introduce concept of "Live Update Sessions" within the LUO framework.
> > LUO sessions provide a mechanism to group and manage `struct file *`
> > instances (representing file descriptors) that need to be preserved
> > across a kexec-based live update.
> >
> > Each session is identified by a unique name and acts as a container
> > for file objects whose state is critical to a userspace workload, such
> > as a virtual machine or a high-performance database, aiming to maintain
> > their functionality across a kernel transition.
> >
> > This groundwork establishes the framework for preserving file-backed
> > state across kernel updates, with the actual file data preservation
> > mechanisms to be implemented in subsequent patches.
> >
> > Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
> > ---
> >  include/linux/liveupdate/abi/luo.h |  81 ++++++
> >  include/uapi/linux/liveupdate.h    |   3 +
> >  kernel/liveupdate/Makefile         |   3 +-
> >  kernel/liveupdate/luo_core.c       |   9 +
> >  kernel/liveupdate/luo_internal.h   |  39 +++
> >  kernel/liveupdate/luo_session.c    | 405 +++++++++++++++++++++++++++++
> >  6 files changed, 539 insertions(+), 1 deletion(-)
> >  create mode 100644 kernel/liveupdate/luo_session.c
> >
> > diff --git a/include/linux/liveupdate/abi/luo.h b/include/linux/liveupd=
ate/abi/luo.h
> > index 9483a294287f..37b9fecef3f7 100644
> > --- a/include/linux/liveupdate/abi/luo.h
> > +++ b/include/linux/liveupdate/abi/luo.h
> > @@ -28,6 +28,11 @@
> >   *     / {
> >   *         compatible =3D "luo-v1";
> >   *         liveupdate-number =3D <...>;
> > + *
> > + *         luo-session {
> > + *             compatible =3D "luo-session-v1";
> > + *             luo-session-head =3D <phys_addr_of_session_head_ser>;
>
> 'head' reads to me as list head rather than a header. I'd use 'hdr' for t=
he
> latter.

Or just use the full name: "header" ? It is not too long as well.

Pasha

>
> --
> Sincerely yours,
> Mike.
