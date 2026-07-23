Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5EB9473C9A
	for <linux-doc@vger.kernel.org>; Thu, 23 Jul 2026 14:08:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784815696; cv=pass; b=CoRVeXt2wyL0EmyhzTYTu7PN1SW8boz42j5cAmLmRmXtYOLdE+tYtF8SzjpKCgoyip+Ftu9I7UH1ZZj/o9zf1yEbD2buHXB6Cz4pbJRqvKSuDJbJITsfL4zPMOnzwY59QpwQiryYrq5RdLoDSaV4q7RUUyya4RdeigeNWioHI4E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784815696; c=relaxed/simple;
	bh=My0yYJ9gfBuiqRns4rQHBKbjK6CnjyaqD+SHjIQuSfg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fN1OnH10KuVngB7ixDVh1gMAC4adxcTOoIc4nrQsHzIvqtgZR0NOVmPtzclOLF5rVgYggsFTWjUZrHEjSwn+k13RBBrceb0BZx9qMJTF1FY8fdVH5MV3bgWZLaLxqlUfCbup8ytifacYsI4ehA/QzmQZLlep6ZvR+i9lj1Dn5ck=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Y986YNCS; arc=pass smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Y986YNCS"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2ccdf36f63dso120295ad.0
        for <linux-doc@vger.kernel.org>; Thu, 23 Jul 2026 07:08:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784815691; cv=none;
        d=google.com; s=arc-20260327;
        b=WXLnA2FdCVVNmw9PdCEIpIgXmbZeveNeOdvhbt53fhyjf2ifLEvPMpemt3reMyNciG
         IKMyKUvLpeC+ko3hwVPAv9JiQKozmERq/jvcr3i6fnJnnb9yZQ1Y03SDMAa4QXNRwuJJ
         8bHAnBwMxQQhCOW5wCfreFdwCyhiu6YG/2LRyjp0J8RoVoN+mdQ7rJpPXJFwBXgUt+7Z
         HvrU17eSsmRSQylZr1wptE+solcQtZbhyc6Qgpc67d+I+IkvobAxrkzaSlte7SjyZ8+6
         GhrBqyZE2pJxNaqs0kdbo2lZYaldfobdE+yU8j5UQvyJMg1U9xrm3BD7SULy9yeiwIRD
         k8Cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=My0yYJ9gfBuiqRns4rQHBKbjK6CnjyaqD+SHjIQuSfg=;
        fh=Obycd2J6zbyL5I8p2Z5OjZmZ2WPIzQuDJx6U1dUB7a8=;
        b=dPuTT9rfL4z7sD+EkOeeIxxlJWHpVfa2dE+Xs/MPSmnN0yZ9n6/M06b7BGycVVHS54
         BTKtkJJdaVSgusPmNhD5XZKymTqltDFEnhAABgClM2mNkHp+jrB1ySNb8iiP/yZRikVb
         BukT5h12jAnUNYTX510qCw/hUoC4XN2PXh6YqBFdqJ6tlHmRpjrIs9lbOTOss/a+mQHX
         fITIoqN48jP67X+z6L9UcWWJ9bZMGQmLvLcoe67YQrMW4YmzkUZybCCz7EU5T9P1x+VX
         KGxEi+qx4nI3ytx+skxnY2I1/7PKuAhrr5pvlUyKVi9vaoLGtCnwS9adabojMfj6aHod
         jpDw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784815691; x=1785420491; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=My0yYJ9gfBuiqRns4rQHBKbjK6CnjyaqD+SHjIQuSfg=;
        b=Y986YNCSkmgo72X6PBt396rFEQKIvPpqiCoYdJJjTsQ4n0oteOOFGO53kLlkR2dCVm
         PreQdE/OwXCQda9G1WvPG9jSRmatuVp24BqzBwhAEcMa2Ophfw+MS0QWg0IzoHRMOXY6
         a1KdU9O7P4i6SsHM6fn8XySnEGSw1XPcn2wIoIofWDzw//1TZxaV/6qDqE+i+BOT9DjR
         rhm8dIjJsUaWbSpxoXcR9Evp1KS2aXyh1GEMZ6wVcAigGpB+ekJV7mcqeVhEBjkqXzcg
         AdNIR/nYklwzaO4tJlNrN/UxFtS1KCxoU676bVdglVxmF8sUzxyW2oSAuEE/KCFInVkA
         bi4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784815691; x=1785420491;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=My0yYJ9gfBuiqRns4rQHBKbjK6CnjyaqD+SHjIQuSfg=;
        b=UQc0OMUEld2oHY73sst+4DYXBHFNZGiuO8Ql5lzPPBz4eI255bGqu7+7ymNecgS1pm
         0FX9mEYTtqnu+gb7mNW4EMCrJy6FperPwm756o9R4AlJdo53qcVuHCEEHFvQsi5iDV6w
         o1VmWJK8F4NxR3kG0PVVULrVGCrIudmXdLdLPnMpAySSQK/12rhNacCWRnHxtUtx+BCU
         xJCHJV6EdjFrMXD5jCg+FqxPtCrmCDRFkHZb6nlghT6mNAqoPjiJ8NnZq5Nqg1CcOKFx
         SkHbKS2idcPWACEjbnQy9+vuvXSVC9+iCawPxCvUwt7GpaWW5dSKDw41fmwVNR7IriNO
         0yXA==
X-Forwarded-Encrypted: i=1; AHgh+RrN2hsNTub7rKP7aJ0G9bjJrKtZ3qBqheYc+uMXQfhb8WCjJJWzmYOIvS3OKUSPRs2+CSIOzITQob8=@vger.kernel.org
X-Gm-Message-State: AOJu0YydIrMbnHd6ESFVyrCcMicvzbJiWrr57U21hyj+hft7/SK+aRok
	pM7c1A7xuxpDBkA9bhk47GfUwYjt8A6uEnncvDA1pJc/QzhueiI8myT9u0uq3FRxiEPffn7DioF
	depp3zURIwcofZKP6Bek+CNqLWnhgM1IfyQvtJQIxy6WCXrG31dH9xPx162o=
X-Gm-Gg: AR+sD12rhku+mtyjr/3h1H1g+cjoGyDAkhtXk6ie2X6Zeekf+KsYzg8k84VRwAqBziG
	DYGWwaAYxDTjLdysAhXH97LP/tH69AAz6Rn/6ZMQDuadyeqPuz7kVjElYNQdIQ+ZR/4Pg7jDYwD
	Gg8bkEGOBHxBK8oyay13x2dtflHNQqIhkDzaWaiGng+jOTKwLWaSOvsYL8chSaA+D0Neungn9xB
	UKMCeaUmPc/uutOPinv/9s/H3GKQGMcVT+Aj/ULywuG3KH4s93yp5i6GzWiOCz4+xzIZLhu4QFu
	enGpQAU+SV9/Og9ZRnMOIWs8whRdJZ8hrXaZ30hZKqMo0ZgrOWnsNjOLwQ==
X-Received: by 2002:a17:902:c74c:b0:2c6:cbcb:bc72 with SMTP id
 d9443c01a7336-2cfa80814ffmr2462775ad.23.1784815690567; Thu, 23 Jul 2026
 07:08:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260723-work-failfs-v1-0-3f69b9a9e958@kernel.org> <20260723-work-failfs-v1-4-3f69b9a9e958@kernel.org>
In-Reply-To: <20260723-work-failfs-v1-4-3f69b9a9e958@kernel.org>
From: Jann Horn <jannh@google.com>
Date: Thu, 23 Jul 2026 16:07:33 +0200
X-Gm-Features: AUfX_mz_mzCvw2h5o1pR1qMvYWw2B5M-LX-GbZFx68Jm-lMghOI_PEmMW2ywzbo
Message-ID: <CAG48ez1psv82Y98XT1p7vujYgj5a9hbPZ4=h7x4-yXQO5FQr6A@mail.gmail.com>
Subject: Re: [PATCH RFC 4/7] fs: support FD_FAILFS_ROOT in fchroot()
To: Christian Brauner <brauner@kernel.org>
Cc: linux-fsdevel@vger.kernel.org, Andy Lutomirski <luto@kernel.org>, 
	John Ericson <mail@johnericson.me>, linux-api@vger.kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Kees Cook <kees@kernel.org>, 
	Farid Zakaria <farid.m.zakaria@gmail.com>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Jan Kara <jack@suse.cz>, linux-kernel@vger.kernel.org, 
	Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 23, 2026 at 1:30=E2=80=AFPM Christian Brauner <brauner@kernel.o=
rg> wrote:
> There's also some thought needed around shared fs_struct state. It's
> obviously possible to chroot into failfs with a shared fs_struct if the
> caller has CAP_SYS_CHROOT and shares the fs_struct or if the caller is
> no_new_privs and shares the fs_struct. The non-chrooted-currently
> requirement still applies.

Having CAP_SYS_CHROOT and sharing the fs_struct should not be an issue
because we already ensure that any tasks that share fs_struct are in
the same user namespace, so CAP_SYS_CHROOT is implicitly also held
relative to other users of the fs_struct. (In particular,
userns_install() and unshare_fs() ensure this.) (Except if LSMs get
involved with weird policy, I guess.) That's what makes the existing
chroot() syscall safe.

But yeah, the no_new_privs check I suggested is kind of a pain...
