Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF3452472AE
	for <linux-doc@vger.kernel.org>; Thu,  9 Oct 2025 12:01:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760011318; cv=none; b=dmwJDz1ruifuB2vpW6GEApJWcAwmsWekGrtKuvq5/LsD6MDudaFazlbxzwJLYisgy86oqwjwFtDjq4P4oNmcH90Cboc4oHy4G9NweNdgJWo7wFHMoSTj62ExFDw25dH6sY4F/3/FptYSuUe1DuYDhDzzX2uqmXMj86qcZC3XO18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760011318; c=relaxed/simple;
	bh=GM7HHu3HbolbVRGEPyllWwUcu2/FcpmuCKiQlqwBpNU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Qx7g7P8pqFjy+Gu9GE38TrH6KvMgGI2kjuf7SJMwfJx0onLSnlyRUw/fB2vWIeMyb5fP6cOHoX2trY0+XRMmgLE0DaZb9SVJfZBqR2lSQShVjLnRpUfLJgIBG9YTIyhEPrYSN1JYtMsJV8N1Dw041JQfneyWM4Dhju7PwRVZUu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=b+zMQNGz; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="b+zMQNGz"
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-4d9f38478e0so9405511cf.1
        for <linux-doc@vger.kernel.org>; Thu, 09 Oct 2025 05:01:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1760011316; x=1760616116; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=GM7HHu3HbolbVRGEPyllWwUcu2/FcpmuCKiQlqwBpNU=;
        b=b+zMQNGzBJd1OaeJknxqIgA61IUUVrXkv8oIP3xZ2A0MdE1kUkFPP/N/0/QuUD4AJV
         N2naFEJj3vuVNfiVA9tpl7OH4gGf5eVN5FROd5V9mKU1OWYCFcuFVssSdauYOi6AUD/6
         WnMaklKCI1d7IS+RjHFdIpL6cgsbVVuZYf0mekI2EgeAPnUFh0kuUfSy61tIOE+4pa3i
         MV1oHs6F/pMl5Y8IkkBfyQXR0GRc6waWiZeDGSFpVeE8gLkKgYRBF6vgZfFF8SHims18
         DJzf5+VMrn7FWtL36gms+zIvDJUV4PXpXGcBx+ITMjtadkuovdUz3uFKpgyR33rvFcGv
         fCsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760011316; x=1760616116;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GM7HHu3HbolbVRGEPyllWwUcu2/FcpmuCKiQlqwBpNU=;
        b=EMdv9ncISKhha/zKwmax7jn4dBrK0oqRNJ3L8xNFzh2Pqu4p31XZBRPfgvrbSQQK72
         Jbt92eM7UzIu2drKm08al5x3ZZM2ZOHehNyu/tO29OamcjZlbCYksz/3CcPLzhGQCbJQ
         1o58TEDCKFewnyT/IFNc4l5rvN69zP3ZQh+JOU4V9KMyCaIqbEh0e7q1X5sQOfjl47je
         RbBgBruOnQZYMdc4zEUfNK0UP5mI8E19kZglyNDk3LGVxH11Bf3drKk+Vsm8KTcdKeWd
         UqIcWl9sL7pjS4+o17PZFdawm3726wlCqyVXXgtG2NTC5cAuBjb9Fc/HHrMernR9JDsy
         IIFA==
X-Forwarded-Encrypted: i=1; AJvYcCV/ZkNkdZo13zZtd42TVt7vpw/jXRmI4YkuE6Aw4g8ghbiCOHuH5PVrZVJuxd1RXT+zy2kBneGvaK0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwXxszehFy49KN4WvwhAB9v+jjM3Wnhw3TRqqawWdxKQxN9tz56
	NUBUU6J3cKrtOet+wMB89XayfK8jAt4a47Ubf1mzXQezdpu/yTc6PO3P3XJNj6GfEHdb1EMS7g0
	juJWDnrkEslTzT+CITT6z1fCUf0ldz6I2kKEXpDfjyw==
X-Gm-Gg: ASbGncvORA7qB4IEmc9Uyxv2fAZtmih3ecwiMFJd6xmj7A9AKSmOKCPVBaDA0Wm7iAj
	M7DdDDs2h0xBE2KcbYdHU/ZLiyazc8m63vwvz1iYq2UONGFJXcmd3k5HWxpSWPo1d8dGTa98SiC
	frHdHArK+2USJ2Vcf9TSxNoLsJdy7Q4ueLOKf26EXOX1Vxp9QqehAc72NHIcs/DlSGUdhpMNBfK
	krYsPyZ9yfZO5I8BSacFaNfGWZi
X-Google-Smtp-Source: AGHT+IE9zb3wwXEpUh5P+ZmZZJCDFFOKUQIOo3/6KsN55Cs1OSGbV39rZ1DIVG9kDY7HFP8FPvwlsRPNuhjvFarm0hU=
X-Received: by 2002:ac8:5d4d:0:b0:4d2:ba6f:28fa with SMTP id
 d75a77b69052e-4e6de8b5d39mr171303161cf.34.1760011310206; Thu, 09 Oct 2025
 05:01:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250807014442.3829950-1-pasha.tatashin@soleen.com>
 <20250807014442.3829950-20-pasha.tatashin@soleen.com> <a27f9f8f-dc03-441b-8aa7-7daeff6c82ae@linux.dev>
 <mafs0qzvcmje2.fsf@kernel.org>
In-Reply-To: <mafs0qzvcmje2.fsf@kernel.org>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Thu, 9 Oct 2025 08:01:13 -0400
X-Gm-Features: AS18NWB0gqbxGnAmt0TyUGPWI9yXOeOjTQwVBIB2xaJy4b4dnuqgnZXYRRh26fc
Message-ID: <CA+CK2bCx=kTVORq9dRE2h3Z4QQ-ggxanY2tDPRy13_ARhc+TqA@mail.gmail.com>
Subject: Re: [PATCH v3 19/30] liveupdate: luo_sysfs: add sysfs state monitoring
To: Pratyush Yadav <pratyush@kernel.org>
Cc: "yanjun.zhu" <yanjun.zhu@linux.dev>, jasonmiu@google.com, graf@amazon.com, 
	changyuanl@google.com, rppt@kernel.org, dmatlack@google.com, 
	rientjes@google.com, corbet@lwn.net, rdunlap@infradead.org, 
	ilpo.jarvinen@linux.intel.com, kanie@linux.alibaba.com, ojeda@kernel.org, 
	aliceryhl@google.com, masahiroy@kernel.org, akpm@linux-foundation.org, 
	tj@kernel.org, yoann.congal@smile.fr, mmaurer@google.com, 
	roman.gushchin@linux.dev, chenridong@huawei.com, axboe@kernel.dk, 
	mark.rutland@arm.com, jannh@google.com, vincent.guittot@linaro.org, 
	hannes@cmpxchg.org, dan.j.williams@intel.com, david@redhat.com, 
	joel.granados@kernel.org, rostedt@goodmis.org, anna.schumaker@oracle.com, 
	song@kernel.org, zhangguopeng@kylinos.cn, linux@weissschuh.net, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, linux-mm@kvack.org, 
	gregkh@linuxfoundation.org, tglx@linutronix.de, mingo@redhat.com, 
	bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com, 
	rafael@kernel.org, dakr@kernel.org, bartosz.golaszewski@linaro.org, 
	cw00.choi@samsung.com, myungjoo.ham@samsung.com, yesanishhere@gmail.com, 
	Jonathan.Cameron@huawei.com, quic_zijuhu@quicinc.com, 
	aleksander.lobakin@intel.com, ira.weiny@intel.com, 
	andriy.shevchenko@linux.intel.com, leon@kernel.org, lukas@wunner.de, 
	bhelgaas@google.com, wagi@kernel.org, djeffery@redhat.com, 
	stuart.w.hayes@gmail.com, lennart@poettering.net, brauner@kernel.org, 
	linux-api@vger.kernel.org, linux-fsdevel@vger.kernel.org, saeedm@nvidia.com, 
	ajayachandra@nvidia.com, jgg@nvidia.com, parav@nvidia.com, leonro@nvidia.com, 
	witu@nvidia.com
Content-Type: text/plain; charset="UTF-8"

> > Because the window of kernel live update is short, it is difficult to statistics
> > how many times the kernel is live updated.
> >
> > Is it possible to add a variable to statistics the times that the kernel is live
> > updated?
>
> The kernel doesn't do the live update on its own. The process is driven
> and sequenced by userspace. So if you want to keep statistics, you
> should do it from your userspace (luod maybe?). I don't see any need for
> this in the kernel.
>

One use case I can think of is including information in kdump or the
backtrace warning/panic messages about how many times this machine has
been live-updated. In the past, I've seen bugs (related to memory
corruption) that occurred only after several kexecs, not on the first
one. With live updates, especially while the code is being stabilized,
I imagine we might have a similar situation. For that reason, it could
be useful to have a count in the dmesg logs showing how many times
this machine has been live-updated. While this information is also
available in userspace, it would be simpler for kernel developers
triaging these issues if everything were in one place.

Pasha
