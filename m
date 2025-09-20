Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 737017081A
	for <linux-doc@vger.kernel.org>; Sat, 20 Sep 2025 03:55:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758340538; cv=none; b=gk2ZRMcclVPr5OAcTc7WGuegRcl7gIFfLSxwXlFWXcPeeWezqLI4+4jb2Qgv8B8iXt6X81Y9Ey/hJjqoPAkg53H/tfOrBDGUgSucTmqoRVqJUvcgcpFmBuA9R7/MQQhL+ePMiFeINYE0n1NM0PO9A2TmNjh2qj1i2rtodSZxL8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758340538; c=relaxed/simple;
	bh=wLR5A4WVJygISPHG42IIvYb+LPD25B9I3WH7jC2e5xU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=R+ztk2LstOWH5b/Sj1xd6h3mVQ0E6e7f6FJs2YsDh/Cw9PBfaXrLglzFI9IZh+Wuga6Cri3LYu4tHwXGDOliVTAizg5hJvf+S4EveyEjun7832PSgfDsU+3Ku2eXBakF/wY5zk/6xeXc25nQle09wfV9AbX4/BIDk64M1+nOqZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZFPKZ+Oq; arc=none smtp.client-ip=209.85.219.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZFPKZ+Oq"
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-ea5bc345eddso2257559276.1
        for <linux-doc@vger.kernel.org>; Fri, 19 Sep 2025 20:55:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758340534; x=1758945334; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wLR5A4WVJygISPHG42IIvYb+LPD25B9I3WH7jC2e5xU=;
        b=ZFPKZ+OqAAj1VhKugky3kjemp/VIqd75of38HGEmt1IOj91W4b7jLe+Myfu3ent1n8
         I+OsNztO7baVS7SDNqQDhsKyRcudzp5fPl2dQ3EsKmIi5TGzzTSREF9BOYtdvwLtcCQ9
         lX8BgfQDKyo0m2JfxIC+zD4CzDFgLzCucCTNnl0sqYXFOybMgodTGPU/RxeED3KpD6Ge
         7yQG/mA18ZVwa9TAvZspdmtVMoFft3MmApalEp7/PJVnD7pAqdNfemDIdWOkktS1fK7N
         5MIan1ZBYEJnEUm4lD9oNaRI/NjfTi3RIA4zVC5lAmPgo6eel/h/B86mXEMgdrCKJemE
         DM2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758340534; x=1758945334;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wLR5A4WVJygISPHG42IIvYb+LPD25B9I3WH7jC2e5xU=;
        b=m0wGDjktPHrDVhQaHyqD8zBNipaXmmQm5cMUizNEWreaNmd2kgkxKPG7LDc4WRE7z0
         X8edXwpY/zdNPAoWPA4nTa1SLCi9UrB3FDu41u45go+HRcOe3CDr055V83f5WWAn4CPF
         hPEckvM+KLaw4zpQ2nPtRL2fabw9G8eM96x5d9pZ3Jm8hfY5gjLn40btgMdxwMTWq7eP
         mEJvb/jvhq4+9bWlHSNIjiqO9NQt/4JGsXz6wzro+nhjsxge8JbvC5QMvY0gom/EDoWI
         hVTXEe9HOCct7AqUtfG37/5YaTrE8HWYwd8nU01dPYvbGA5z4YqG7gkx4iIJj3xYbPSv
         Mi3A==
X-Forwarded-Encrypted: i=1; AJvYcCXEYwHWoxZn6cSRofNzm8kJvWu+I2oIMM1rWuYGxUR2g5p3lJS3VuZnUSdqPn2O0hysVXbYwmU1uCE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1IIscHhrjDczW05OwQWOcVQBZjAlGM3J5xWvvu+AOM1Ai/HZU
	DtDvlap0M8xI/nAoWbSpBW8W65L+ln1bKKIa0Kgl6g4//WuAQ0sBJuFEWX3QLPLQSsgSuAwVte4
	nKLkca5TRb6AlQ5HLzPfkzcj4Em/eOqU=
X-Gm-Gg: ASbGnctFQAPoIt58bgvy9Rio6RBRQNjLpstauehrJ1nYlqc+w6EclrNtmTl5ZBdCLeS
	n/kGWkGWnNyxMQS0c4m/U74y31Fn7QMTPNtTyGYxdYDo04bVg8F99tb40cAZVrJsysL2T46MByd
	ekpE44C0cgcrbd3J490zlCqhjgIKrid/CPLI9QQA1A7sim7IRG2CZpAq9cWkXQfzlfsJ+nMDphw
	AMSPD4=
X-Google-Smtp-Source: AGHT+IH7cxRQcDAWrx6iopGK0fgAvvotX/SwRt/T/KElvH4XQULrd96czgOrVv1CSvA0vDpbRNCMKcVlhfdowxEBryU=
X-Received: by 2002:a53:b3c5:0:b0:622:4818:ce38 with SMTP id
 956f58d0204a3-6347f610c7emr3546092d50.37.1758340534336; Fri, 19 Sep 2025
 20:55:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250918152830.438554-1-nschichan@freebox.fr> <20250918195806.6337-1-safinaskar@gmail.com>
 <CAHNNwZAzecVcJXZmycX063-=p-M5jVkfStfgYVKJruOFo7y9zg@mail.gmail.com>
In-Reply-To: <CAHNNwZAzecVcJXZmycX063-=p-M5jVkfStfgYVKJruOFo7y9zg@mail.gmail.com>
From: Askar Safin <safinaskar@gmail.com>
Date: Sat, 20 Sep 2025 06:54:58 +0300
X-Gm-Features: AS18NWCqg0xtU5KiNe17DWjmiPCEbBI_FSj5NCOyDGZFj_7oFaRqSu7O_vUKCrA
Message-ID: <CAPnZJGDwETQVVURezSRxZB8ZAwBETQ5fwbXyeMpfDLuLW4rVdg@mail.gmail.com>
Subject: Re: [PATCH RESEND 00/62] initrd: remove classic initrd support
To: Nicolas Schichan <nschichan@freebox.fr>
Cc: akpm@linux-foundation.org, andy.shevchenko@gmail.com, axboe@kernel.dk, 
	brauner@kernel.org, cyphar@cyphar.com, devicetree@vger.kernel.org, 
	ecurtin@redhat.com, email2tema@gmail.com, graf@amazon.com, 
	gregkh@linuxfoundation.org, hca@linux.ibm.com, hch@lst.de, 
	hsiangkao@linux.alibaba.com, initramfs@vger.kernel.org, jack@suse.cz, 
	julian.stecklina@cyberus-technology.de, kees@kernel.org, 
	linux-acpi@vger.kernel.org, linux-alpha@vger.kernel.org, 
	linux-api@vger.kernel.org, linux-arch@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-block@vger.kernel.org, 
	linux-csky@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-efi@vger.kernel.org, linux-ext4@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-hexagon@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org, 
	linux-mips@vger.kernel.org, linux-openrisc@vger.kernel.org, 
	linux-parisc@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, 
	linux-snps-arc@lists.infradead.org, linux-um@lists.infradead.org, 
	linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev, mcgrof@kernel.org, 
	mingo@redhat.com, monstr@monstr.eu, mzxreary@0pointer.de, 
	patches@lists.linux.dev, rob@landley.net, sparclinux@vger.kernel.org, 
	thomas.weissschuh@linutronix.de, thorsten.blum@linux.dev, 
	torvalds@linux-foundation.org, tytso@mit.edu, viro@zeniv.linux.org.uk, 
	x86@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 19, 2025 at 6:25=E2=80=AFPM Nicolas Schichan <nschichan@freebox=
.fr> wrote:
> Considering that the deprecation message didn't get displayed in some
> configurations, maybe it's a bit early at the very least.

I changed my opinion.
Breaking users, who did not see a deprecation message at all,
is unfair.
I will send a patchset soon, which will remove initrd codepath,
which currently contains deprecation notice. And I will put
deprecation notice to
other codepath.

Then in September 2026 I will fully remove initrd.

> SMTP server I used wasn't authenticated to google, so all gmail
> recipients were dropped. Hopefully this work better today.

Yes, this time I got your email

--=20
Askar Safin
