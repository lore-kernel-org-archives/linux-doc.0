Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE87926E702
	for <linux-doc@vger.kernel.org>; Tue, 26 Aug 2025 16:11:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756224671; cv=none; b=qXKAhQyiq5GzZv0RLBvTN6e6TiXfO+yxQaxInekfnf2M1Xr7hQkTFWb3cBZ/3VQF15jp6JH3TQM1nKydTf4mvTnWMwCVq1rzKeT3JPekTK3LCKwtITRHsFc46rrrrPFX4V6pmnxcDijpjmQvSWbmQJAJwNQmEPF7fJqUViQ/8P4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756224671; c=relaxed/simple;
	bh=U41H8paY3p/UhGGEDthRVDk09Qo/XemI96p1ae/Gb7Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=K4od9mx9xhgBkkXm8kHFKTRnJOseP2J3IHrF2Ve3SRGtiKuYsjR0vly/pJBn/ol+bla+pQh3rk5Jtmiusfz7QjydjC1UgT/h5HB5jAEqe+TNkUP7DiKWszXsbynPvbC41mn2w9+gByC3VER/KzxgZrwhCk6u4dLzOdRcHm+e9Ik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=SpCO/+5h; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="SpCO/+5h"
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-7e87063d4a9so659191685a.2
        for <linux-doc@vger.kernel.org>; Tue, 26 Aug 2025 09:11:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1756224669; x=1756829469; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BOi2/n6Xz+xQb5GUHHEjvZymVvCpQ6XbmnK9/vs2FEY=;
        b=SpCO/+5h7oHKpHHcdQSLv1ZaJXrc/q856GDwMewoEniVqyrxUO9w6SlepEU1Ea66w5
         l/gudFh6Wqzr46glOhQ+9EMJxKUNOstktovwRNPXTFWtYhfHGpjkSaolOtsAE9SCOrsV
         7LsQWy1ozMGfoaFowgUN3qM3anmWEjw1cdx8LvFonc9RNlDhD4Gos4Hbcav71mbKvblZ
         zhgMkAwBpOCZeDOjnZPUC1HnzO6DSmTDvWVj2Azt7olrUhBjoMVXXH3MtGhwy6L5/x07
         cqn8nwznH2CU30DGvFiDoHgLmK9cZgOWGMq0UcR6l9hp2fcdtB9j/gOalt7FX68683WF
         Vj7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756224669; x=1756829469;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BOi2/n6Xz+xQb5GUHHEjvZymVvCpQ6XbmnK9/vs2FEY=;
        b=PSwiAw/jIhXh1O1LNgQaS5iGgEmC1766rwetiQvn059t/q6sWvICydiKq7RTdqbfA2
         dxcjHs5wrJK8hCeB77q6mLHLP6SVF4u2BJB2Fd9H7UjhekZfb2NOoErpAp0+a+r0XdgT
         zt8wyrcDdadR9RhYOUq/BjFDy/eRCrirKQhEoVM06eyhBMPXv696Ucfmm3RpeQ5+YiuX
         cTNX0am8UD83lE9EN+HWt8dJFhQqvyNSEuuVVRUdEZdGVeBE6qqXtCrH7KiRGMGStlRc
         xc2R9ZAEuRs9mcc8/tR/Opy5YGZR2LI93/yO+ozCVvsWPCf5s71SMphJUUu08J166aW6
         JK9g==
X-Forwarded-Encrypted: i=1; AJvYcCVdq5dPT2qgd9j8Kn4DLHkeQqY9XjwoIlk9k6CJToS+uBLPZZKtgzLmaHXrmgMM3blwOaMWh8SJLfI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzfVvWXtfXNvpg+uxhYLjP4edA5aJfW1cQN9o1/IMjcIrKBq4je
	axmniB3ptDFgW8Oi1wnNLVLPFgRDNHNQCqFcJ7YxI7wHSXT+ulOcvXP8x+NpS1Fb6aiqakgyhDo
	EgMp+ZnL3OROXDJh+RlYbaw61uVOxbJGvOwB0sKLOaA==
X-Gm-Gg: ASbGncsHbXMoHPhKUtaTDv9ZmKr3jz+cm7SggW4+varKvWNK4d0pENkRbFdjhDwUsHO
	WlJSUEo8rWT4bh+O/oyfc+Yw9Nev8KAwgqT0f6JMD8VMhnsD9h20/VMaQr5KRhIV7wC/QMttqNd
	mOA3bglPNeI4ysR7rCn6hbpi9yyHzYpu/VRUQ0jgFTlDCWcLex8bDW6SFgYBus3/qXJbDYzMnUt
	w21
X-Google-Smtp-Source: AGHT+IHEi3OE7lLiMPp7C5Vv7KNwlvLIH7ud61BnCQRJa7ny6WBbwsORCRR5wSbzLMiP0IHaIOWVGEwTlDbKi+wkxxs=
X-Received: by 2002:a05:620a:170f:b0:7f6:88d3:1188 with SMTP id
 af79cd13be357-7f688d31502mr113653485a.86.1756224668510; Tue, 26 Aug 2025
 09:11:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250807014442.3829950-1-pasha.tatashin@soleen.com>
 <mafs0ms7mxly1.fsf@kernel.org> <CA+CK2bBoLi9tYWHSFyDEHWd_cwvS_hR4q2HMmg-C+SJpQDNs=g@mail.gmail.com>
 <20250826142406.GE1970008@nvidia.com> <CA+CK2bBrCd8t_BUeE-sVPGjsJwmtk3mCSVhTMGbseTi_Wk+4yQ@mail.gmail.com>
 <20250826151327.GA2130239@nvidia.com>
In-Reply-To: <20250826151327.GA2130239@nvidia.com>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Tue, 26 Aug 2025 16:10:31 +0000
X-Gm-Features: Ac12FXziiQIerbPv84meuIa4-TsBxggHz0dU1bLBX-hwN0ZHUFz86xiQcWhtMqM
Message-ID: <CA+CK2bAbqMb0ZYvsC9tsf6w5myfUyqo3N4fUP3CwVA_kUDQteg@mail.gmail.com>
Subject: Re: [PATCH v3 00/30] Live Update Orchestrator
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Pratyush Yadav <pratyush@kernel.org>, jasonmiu@google.com, graf@amazon.com, 
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
	ajayachandra@nvidia.com, parav@nvidia.com, leonro@nvidia.com, witu@nvidia.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 26, 2025 at 3:13=E2=80=AFPM Jason Gunthorpe <jgg@nvidia.com> wr=
ote:
>
> On Tue, Aug 26, 2025 at 03:02:13PM +0000, Pasha Tatashin wrote:
> > I'm trying to understand the drawbacks of the PID-based approach.
> > Could you elaborate on why passing a PID in the RESTORE_FD ioctl is
> > not a good idea?
>
> It will be a major invasive change all over the place in the kernel
> to change things that assume current to do something else. We should
> try to avoid this.
>
> > In this flow, the client isn't providing an arbitrary PID; the trusted
> > luod agent is providing the PID of a process it has an active
> > connection with.
>
> PIDs are wobbly thing, you can never really trust them unless they are
> in a pidfd.

Makes, sense, using a PID by value is fragile due to reuse. Luod would
acquire a pidfd for the client process from its socket connection and
pass that pidfd to the kernel in the RESTORE_FD ioctl. The kernel
would then be operating on a stable, secure handle to the target
process.

> > The idea was to let luod handle the session/security story, and the
> > kernel handle the core preservation mechanism. Adding sessions to the
> > kernel, delegates the management and part of the security model into
> > the kernel. I am not sure if it is necessary, what can be cleanly
> > managed in userspace should stay in userspace.
>
> session fds were an update imagined to allow the kernel to partition
> things the session FD it self could be shared with other processes.

I understand the model you're proposing: luod acts as a factory,
issuing session FDs that are then passed to clients, allowing them to
perform restore operations within their own context. While we can
certainly extend the design to support that, I am still trying to
determine if it's strictly necessary, especially if the same outcome
(correct resource attribution) can be achieved with less kernel
complexity. My primary concern is that functionality that can be
cleanly managed in userspace should remain there.

> I think in the calls the idea was it was reasonable to start without
> sessions fds at all, but in this case we shouldn't be mucking with
> pids or current.

The existing interface, with the addition of passing a pidfd, provides
the necessary flexibility without being invasive. The change would be
localized to the new code that performs the FD retrieval and wouldn't
involve spoofing current or making widespread changes.
For example, to handle cgroup charging for a memfd, the flow inside
memfd_luo_retrieve() would look something like this:

task =3D get_pid_task(target_pid, PIDTYPE_PID);
mm =3D get_task_mm(task);
    // ...
    folio =3D kho_restore_folio(phys);
    // Charge to the target mm, not 'current->mm'
    mem_cgroup_charge(folio, mm, ...);
mmput(mm);
put_task_struct(task);

This approach seems quite contained, and does not modify the existing
interfaces. It avoids the need for the kernel to manage the entire
session state and its associated security model.

Pasha
