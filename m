Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57948272806
	for <linux-doc@vger.kernel.org>; Tue,  1 Jul 2025 12:06:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751371593; cv=none; b=G59DkzbpjpB94R7NYp8NyJ5+u74v6vACPkU8lnbhqpwwjzRe3Rf5PTkUv6ODk1A6avoBM32H7t1MGZv6PAM+o+DGVybd5+lClmUu1BqMS0e5Dm+0WnULxvC+bvgOh3gKA4tb6oUBsAD/1BaDrKsDvSO9EUmOgpKv7tBQVE1iFUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751371593; c=relaxed/simple;
	bh=fwZQhFulCtk6W9St9reCgVe3JkeISDZLWskJCaogHtY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gdwFi9eQLXtLKOkb1/sHxyKpihA86/2ybrvMLQhTR0Ziv7hQfmfrURbYQqNgfve6SwPNpgOIBuyizsGm8p+mQUQgt6kU1Ry0uS4y75gZ0wFkmF9S0wi0aByxMB8xTIeSEOA/neRIV7NjG9ffLEZ9Aoiv7p6ZLnXb+TaaFPC+B54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=zImGM2RB; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="zImGM2RB"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2357c61cda7so114205ad.1
        for <linux-doc@vger.kernel.org>; Tue, 01 Jul 2025 05:06:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1751371591; x=1751976391; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fwZQhFulCtk6W9St9reCgVe3JkeISDZLWskJCaogHtY=;
        b=zImGM2RBPz/vycaCoiTRNCq8beO5NLj9NhJOdtCsbGN2Uo/hek01RNagPWqBF8n5Q+
         yQQvrc9SIah4ux88gPrZB1aTmVfU/QK9Z2ECanZj6NaxdKoPlgTJbDSDme5a3rZHqttc
         AyMdOzbKiS18foFSLC6LSvJE68bTcdji7XWE+PC9Iq6FLzCtIIi8bMrYtyPczcDpnmmA
         B9pjKze72+a+BxozEMccX+rnSm0Zp1VefdK+wyjjKPTaCSMy8UGYD1fFgQ+2HeUChC9A
         yGZjjZPdHKvz9MWMyLoIWXdeu9rMv84YBHg2pBPbapZk//eQntFjHByln6xs2TsjqSXf
         z7kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751371591; x=1751976391;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fwZQhFulCtk6W9St9reCgVe3JkeISDZLWskJCaogHtY=;
        b=d6bQifSSThp4J+IZkpUfvgWafcdT+70AcjqTOOOk2MA7mqJ8XjquRlk4ykDx31B7CY
         2PZhT5AQVs8rCohJuS1u59s3hjGZfYOBXZEGk3HqT3egyjRlO6XrXpRy4g3EM/Goo/gO
         9PK4PGCGH41UzqJSXlkxmwQIabud7IwVlYypymX4X/eB/XQEs/HJKFLTEC/VRgGtULkW
         T58f219WW5TXaPhbDd/J5pXICf34w0Vv3LR2iS8ESZ9j0Laudql7jtUJljOd1auavaDj
         GrlArpU5SKRUCj4RtJqW3wykqoQtKuv1VcruyKPVl+XcNCz64rrKvdksuZf0owevW7ri
         6+Kg==
X-Forwarded-Encrypted: i=1; AJvYcCUVjVeGTcCwCM8P4wE++UOKVSAo3835O0D5qEffn4hRe8Rr6nv40PXmjl5BGuShKfiZVjiUk6WL8zM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzEk4iHo2B89sWgpZXtgQeY752maXsJGZcu0hfLXZS9nL0SW2Cg
	0hObfqHullDSxyqfpww0UZKP0drB+CGhN8GcqUsmmBMz9N8t3/pwTTwnMIWpTBxqWxhph3c6WF6
	7DQaKNn+kygUhVg8C87w+tF6YtSbrPwcJn8xwO4KH
X-Gm-Gg: ASbGncuPfvIP3gwSBkZuJ+G0Mdn2CX88bYqga7W7EjmBc2hn6BQAhM7tk8OnZ6DZO9o
	kmaE5KABt1YXhy9/1c82Ns/ya/DcKqz7m0v7tL8xbaXVbHu7sW0TT3iE6WY6tg63CusK+Awz/ol
	wAPv0R0tGGjpD1fIvDEw0+tTv333ZBeyZSUqSFcFB3yg==
X-Google-Smtp-Source: AGHT+IGFAwjulo/i4stzSeDZyvangI+UZ0rJXA7wz0l2gf+G3c7FdoUDkNvfVQlKGJ7tNf7XQG97q/uJgkbiheh/1nA=
X-Received: by 2002:a17:903:110d:b0:23c:5f63:b67 with SMTP id
 d9443c01a7336-23c5fef26b2mr2103895ad.4.1751371591226; Tue, 01 Jul 2025
 05:06:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250612114210.2786075-1-mclapinski@google.com> <685c67525ba79_2c35442945@iweiny-mobl.notmuch>
In-Reply-To: <685c67525ba79_2c35442945@iweiny-mobl.notmuch>
From: =?UTF-8?B?TWljaGHFgiBDxYJhcGnFhHNraQ==?= <mclapinski@google.com>
Date: Tue, 1 Jul 2025 14:05:59 +0200
X-Gm-Features: Ac12FXxGIEan-Q08VvikT9LVQKRxgvs42efMWiz53YaKommHJZr1vh6fiZw9HYE
Message-ID: <CAAi7L5cq9OqRGdyZ07rHhsA8GRh2xVXYGh7n20UoTCRfQK03WA@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] libnvdimm/e820: Add a new parameter to configure
 many regions per e820 entry
To: Ira Weiny <ira.weiny@intel.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Dan Williams <dan.j.williams@intel.com>, 
	Vishal Verma <vishal.l.verma@intel.com>, Dave Jiang <dave.jiang@intel.com>, nvdimm@lists.linux.dev, 
	"Paul E. McKenney" <paulmck@kernel.org>, Thomas Huth <thuth@redhat.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Steven Rostedt <rostedt@goodmis.org>, 
	"Borislav Petkov (AMD)" <bp@alien8.de>, Ard Biesheuvel <ardb@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Pasha Tatashin <pasha.tatashin@soleen.com>, 
	Mike Rapoport <rppt@kernel.org>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-cxl@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 25, 2025 at 11:16=E2=80=AFPM Ira Weiny <ira.weiny@intel.com> wr=
ote:
>
> Michal Clapinski wrote:
> > This includes:
> > 1. Splitting one e820 entry into many regions.
> > 2. Conversion to devdax during boot.
> >
> > This change is needed for the hypervisor live update. VMs' memory will
> > be backed by those emulated pmem devices. To support various VM shapes
> > I want to create devdax devices at 1GB granularity similar to hugetlb.
> > Also detecting those devices as devdax during boot speeds up the whole
> > process. Conversion in userspace would be much slower which is
> > unacceptable while trying to minimize
>
> Did you explore the NFIT injection strategy which Dan suggested?[1]
>
> [1] https://lore.kernel.org/all/6807f0bfbe589_71fe2944d@dwillia2-xfh.jf.i=
ntel.com.notmuch/
>
> If so why did it not work?

I'm new to all this so I might be off on some/all of the things.

My issues with NFIT:
1. I can either go with custom bios or acpi nfit injection. Custom
bios sounds rather aggressive to me and I'd prefer to avoid this. The
NFIT injection is done via initramfs, right? If a system doesn't use
initramfs at the moment, that would introduce another step in the boot
process. One of the requirements of the hypervisor live update project
is that the boot process has to be blazing fast and I'm worried
introducing initramfs would go against this requirement.
2. If I were to create an NFIT, it would have to contain thousands of
entries. That would have to be parsed on every boot. Again, I'm
worried about the performance.

Do you think an NFIT solution could be as fast as the simple command
line solution?

[snip]
