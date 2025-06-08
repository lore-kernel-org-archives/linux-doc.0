Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B25A910F1
	for <linux-doc@vger.kernel.org>; Sun,  8 Jun 2025 16:47:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749401280; cv=none; b=brfAROonTX7qklpPxsMTfRpD78BRczk9eRAiCsAeJTlWHz2RY9Nj7L0y9HFtT9dJKEvCjW22Q7zCB/dxENsdLBj+awFKDHlYE56oHS++hZG63DzujBPMPKTH0aESLdBAePWV2tWCk1rejTw9ODByRfekhu5ojVG/2yTbZ6crafg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749401280; c=relaxed/simple;
	bh=pcc00lKL07ldGo8PyyfZ8jInejYQP/wQpM8Kg9OlyoY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=U+TGshwagY3/ehK1FestmotpluW8xooYMuJSuagou9BuBW/12SZ99tXwudwunwMWJJ2TgqGzmA3TiWDh+c51DX1QyUARI3WtcnifZou6kMU3C3Sbt/s37kp/GLhgd/16r6vI92PtRpBXA7V/IUyUjbV29Pgh9trQNOQnUsvbRug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b=NTJCV3zq; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b="NTJCV3zq"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-4a442a3a2bfso66423661cf.1
        for <linux-doc@vger.kernel.org>; Sun, 08 Jun 2025 09:47:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen-com.20230601.gappssmtp.com; s=20230601; t=1749401278; x=1750006078; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z4mLD6ZBDCacy+5KKbwWASUNAXTCWi/82rv4+F3m5es=;
        b=NTJCV3zqRJKBcPQsaMocIBN4yZC5locd1ZresRihskMaqluYi/0f5AHHacc9LrNB1V
         x1oBrJBUNMNk5n5TXVc2lEzwjVgRwsPcs6FED17V5Z7GTHmR0SgxtxQGZ0dBFZeGtWSP
         Lnr8ASqBvxVOwWj455Fm9Ruvq0CaO98Ng6S++xllKRSQr+V8t6XAxOQijpW24210YbpT
         IVMRKB8iPSVW0a7t6yZni6ExptvWraMnJnPmRT+0NxuG5p3hKZBWhpP8+l1HEjDHmMhh
         kK+55n51dFfOk9UmcgPwnOhg3OzrrRZyboqawL4TNZMFqbX1qyXUqiChtPRXNjccXoCN
         izEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749401278; x=1750006078;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z4mLD6ZBDCacy+5KKbwWASUNAXTCWi/82rv4+F3m5es=;
        b=aeGfGnnilqnzM+qLALUPNlCb5NbWP/O2ybvKuvpSybKyVwNWMEx7wCxZiqfIWFCOAn
         rMyQAEaHS6DgrWzzLoDj3n2MxBXW69CBTq+zOLYwTETnl920q47F+OvhT6PwgDRL6pot
         ZMHSSp6BSdqEIXs9Oo/m3K7bhFc36kcog+Fk/hzfb1Ma2k8bq/1BsyzoMfWvSkWoP/Cs
         uRDYVMnB/Pnt8pPRcXtXN6HlHg4IVnEcn75VJlVWnX3z/CfkhZjy2CTgT6dv1xFYJ1W6
         i9EHy9G1ez3yJkDwyADMgM+dre5jpMMvC0mtBQ2eiKVw09NKe5gZxktuqbu1njnF/Re2
         YlLw==
X-Forwarded-Encrypted: i=1; AJvYcCW73/Qqoap3ZldZevw1o/9tcqhZuQt5Kkk9FiZ/eegoSwcgkoDqOLmG6zJp2ZwYK+ZKpOBF1+/Cdp4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyalxwXJF24NSHB0sEfnW/FCIfjvbPm154QE0vp7Sb3nQS9azUE
	vjrRQN5RJS+WkNm13EMMuUVBoE8KQezMvSb+5/noSBGJ8PyjcfiTVgi29Sn3cWjnvgcNXzS04NS
	ysMMLNpH5MIjWfit9w0u3NnKfe90hENlGF6QmMnzQFg==
X-Gm-Gg: ASbGncs9Uk8CATt+UFR7nvEiHTSpiISTrROW2YJ4CKXmcPJOwKRO9eYyPWCdR4on0bR
	KxhrG7vIbjnav40gtqPJTAcefWa65kJ++76phVHhMwxuErmdBgS66O/dkKJArobzIP+oxzIFWxV
	v8nWPXVbpv+Gn0ObKBJX6T2xw3LwyfyAhiP/zmMenY
X-Google-Smtp-Source: AGHT+IEs/C9sBlNWz2wXNsGbPqskhgwVgo/QLWX02D5Sf9R590oESJfie1k8PTRBskdNsn7eCrILFqcX6T3swqr/wZA=
X-Received: by 2002:a05:622a:260b:b0:48e:9e05:cede with SMTP id
 d75a77b69052e-4a5b9dc4512mr199150681cf.52.1749401277864; Sun, 08 Jun 2025
 09:47:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250515182322.117840-1-pasha.tatashin@soleen.com>
 <20250515182322.117840-14-pasha.tatashin@soleen.com> <aDQr1E31Gw-x-XTE@kernel.org>
In-Reply-To: <aDQr1E31Gw-x-XTE@kernel.org>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Sun, 8 Jun 2025 12:47:21 -0400
X-Gm-Features: AX0GCFtdRr0JczX7XZvcuUGFk7aKkG5txkDs_LzBQs6_5QSoVZeflqKUSwLoHnM
Message-ID: <CA+CK2bDTjnumpYjaEor=2-bG--4YtbuJuei2bc-Af-hCguO+4A@mail.gmail.com>
Subject: Re: [RFC v2 13/16] luo: add selftests for subsystems un/registration
To: Mike Rapoport <rppt@kernel.org>
Cc: pratyush@kernel.org, jasonmiu@google.com, graf@amazon.com, 
	changyuanl@google.com, dmatlack@google.com, rientjes@google.com, 
	corbet@lwn.net, rdunlap@infradead.org, ilpo.jarvinen@linux.intel.com, 
	kanie@linux.alibaba.com, ojeda@kernel.org, aliceryhl@google.com, 
	masahiroy@kernel.org, akpm@linux-foundation.org, tj@kernel.org, 
	yoann.congal@smile.fr, mmaurer@google.com, roman.gushchin@linux.dev, 
	chenridong@huawei.com, axboe@kernel.dk, mark.rutland@arm.com, 
	jannh@google.com, vincent.guittot@linaro.org, hannes@cmpxchg.org, 
	dan.j.williams@intel.com, david@redhat.com, joel.granados@kernel.org, 
	rostedt@goodmis.org, anna.schumaker@oracle.com, song@kernel.org, 
	zhangguopeng@kylinos.cn, linux@weissschuh.net, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-mm@kvack.org, gregkh@linuxfoundation.org, 
	tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, 
	dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com, rafael@kernel.org, 
	dakr@kernel.org, bartosz.golaszewski@linaro.org, cw00.choi@samsung.com, 
	myungjoo.ham@samsung.com, yesanishhere@gmail.com, Jonathan.Cameron@huawei.com, 
	quic_zijuhu@quicinc.com, aleksander.lobakin@intel.com, ira.weiny@intel.com, 
	andriy.shevchenko@linux.intel.com, leon@kernel.org, lukas@wunner.de, 
	bhelgaas@google.com, wagi@kernel.org, djeffery@redhat.com, 
	stuart.w.hayes@gmail.com, ptyadav@amazon.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 26, 2025 at 4:52=E2=80=AFAM Mike Rapoport <rppt@kernel.org> wro=
te:
>
> On Thu, May 15, 2025 at 06:23:17PM +0000, Pasha Tatashin wrote:
> > Introduce a self-test mechanism for the LUO to allow verification of
> > core subsystem management functionality. This is primarily intended
> > for developers and system integrators validating the live update
> > feature.
> >
> > The tests are enabled via the new Kconfig option
> > CONFIG_LIVEUPDATE_SELFTESTS (default 'n') and are triggered through
> > a new ioctl command, LIVEUPDATE_IOCTL_SELFTESTS, added to the
> > /dev/liveupdate device node.
> >
> > This ioctl accepts commands defined in luo_selftests.h to:
> > - LUO_CMD_SUBSYSTEM_REGISTER: Creates and registers a dummy LUO
> >   subsystem using the liveupdate_register_subsystem() function. It
> >   allocates a data page and copies initial data from userspace.
> > - LUO_CMD_SUBSYSTEM_UNREGISTER: Unregisters the specified dummy
> >   subsystem using the liveupdate_unregister_subsystem() function and
> >   cleans up associated test resources.
> > - LUO_CMD_SUBSYSTEM_GETDATA: Copies the data page associated with a
> >   registered test subsystem back to userspace, allowing verification of
> >   data potentially modified or preserved by test callbacks.
> > This provides a way to test the fundamental registration and
> > unregistration flows within the LUO framework from userspace without
> > requiring a full live update sequence.
>
> I don't think ioctl for selftest is a good idea.
> Can't we test register/unregister and state machine transitions with kuni=
t?
>
> And have a separate test module that registers as a subsystem, preserves
> it's state and then verifies the state after the reboot. This will requir=
e
> running qemu and qemu usage in tools/testing is a mess right now, but
> still.

Normally, I would agree with you, but LUO is special as it has two
parts: user states and kernel states, and it is already driven through
ioctl() interface to do state transitions, and preservation
management. So, in this particular case having an extended IOCTLs to
configure a specific kernel state, and then use normal IOCTLs to drive
tests is very useful. In the future, I plan to add support to QEMU,
but we need more work for that to happen.

Pasha
