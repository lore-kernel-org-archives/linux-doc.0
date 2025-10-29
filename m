Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B47A6314B6C
	for <linux-doc@vger.kernel.org>; Wed, 29 Oct 2025 21:13:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761772432; cv=none; b=N6XotXI8S/E+4UgDTajqikza/X4MoKpm63cc2SKcf4ru5hdy6AJe81xoh0iYp2YSxq5ImSahtb+skG1Ahx9dp2suHYK2QIUoUKx3toy+wWIbtTB9XO7E6RsOWu9CyUnZjTeWhA3FfG40KaH8QwDXkKYoWGG2LoQqoNw0QH9R9FI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761772432; c=relaxed/simple;
	bh=JEkVL2yw/xHlwVM5DiMfV/wkuCa8mgAwcpgYx81B7GM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WxuKgU2zhFHdDGrmDPZnULaM4Jsk6/D0+O1NPc7uloXK5ptep3NGDq1Ri62T9HGdsgHEN2AxThGq/AhCX7gj8o4wV9dJCbo/1fVuhWOMyGGmZbVmXLfOEYeJGT53k/71g6xfMbVYjAw0TjKlP94UUR4RR1bfsNx3gRMkO+dN1LE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=nCYmfsCb; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="nCYmfsCb"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-592f1988a2dso1590164e87.0
        for <linux-doc@vger.kernel.org>; Wed, 29 Oct 2025 14:13:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761772429; x=1762377229; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JEkVL2yw/xHlwVM5DiMfV/wkuCa8mgAwcpgYx81B7GM=;
        b=nCYmfsCbMA9NzQaa64kEC4baExLRtapT8fdvk0MH1d4zIRtbMvV0rLZ/ptvT0vq5CH
         +HkkqrBp5hoG9mo4GWeyy0x7qGtAdVpMS8K3dMJpsG8R4Gt+JjDASlsjGYQqmymIoVyT
         A6Sryrmiwb5pfkfJp9gETz5OEwTM4FvK/RviWFqKH+bjnkpz5JWpDmMTDjF4RehWZFUL
         PWQrbsWOFTWFRGCylRTz4MVqnJZ/baSDn+D5saaFFFU3XmtfX799iUDrSmrCGfm9+ds4
         P9T3r0jAjxlhY13vVHr/97QV9jAZlnFLnIVoGydDVThAbYOXAg19krfWu3pizUwtsxj8
         vr8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761772429; x=1762377229;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JEkVL2yw/xHlwVM5DiMfV/wkuCa8mgAwcpgYx81B7GM=;
        b=GLf8ZRE21cxQSuf9+gkWhfhCrffBMMi54EpDoq7pjAD/Qg1egM+ky+8XIr6S4kHIom
         B51ZOxnHGkTPp4er+x1865B2oXyIQVotizNzDfj0ZZ0CdXV26HVe+ECMwraMHWgEoHc9
         WO/L+uHf4QR8uYNIDx/Fr2M3jIMslnLWIpuGIlpyQNaIRk/fdsLN4BMjfmRZgf5X0Z78
         0nTCNUvunoV+Q5j6llF4ZlJa70oB5mNxaQMUrkkjc2WlKHCd1i/pcHh12gJx58pMB5/l
         neZfmhwUtJDI7F5IsdOewyiDIZYFiojP+l19Xnfii632qN7y7SXSCBEIQqJU5djsrFJC
         /zCA==
X-Forwarded-Encrypted: i=1; AJvYcCWePeQJy8sY2dcmpuzwvIapuqinXpiJ1Y07AtTBurGC+ht5/NEAU8hCi8j6tiyCItM6CPrCEyj3gBE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzOXCADt56Y9OQsHiEpq8gZzHChNUslnGCTNdGtU/igXeWx9Vzy
	IC406KIGC0mW0gCNxA/RjUPrggHQJwjcLmAdkAj/+W6r6dWcPAsT9J0raEwyc/o7VEuTEzyWMBM
	pvS+YyCffSBsfxLWXe9qMrqQiQxKvZWPBpZNUee6c
X-Gm-Gg: ASbGncs2pA5cCkFbW/Ht5qhQKCmLd9DPREteP5TNgcSuXkfgIZNvGmJHRi/NF0v3uZX
	YAskl05rm0A0Nb/Cat1oduqozAVJQ2afDF6V64XigwshEge2FiShCT9302Svc1ArynzQfH/1ijE
	/frSqsAUp8Uo21yp20vs0DnYGZrG76028RMSSqr2zwjkrpG8ixxLAiXNtQwiMahH0HkxCiIs3eh
	W/epuPvD+0TWhYIU1XoCcdNsdkkD9gB5qEjSeGcFpL8t7/wtz/SVwb3NuCzeHQZ2ceZ8ptC9lvk
	GixPeg==
X-Google-Smtp-Source: AGHT+IHZQoB9yL+ldFaXMM1bMXJiwccZfdn7OWdIICrdEFPtCJ4NB2qUJ+qk4p2BEZhWEpH+XIXLyp9M3uzoemzEy4A=
X-Received: by 2002:a05:6512:3ca2:b0:58b:75:8fc6 with SMTP id
 2adb3069b0e04-59416d8ce02mr294670e87.19.1761772428439; Wed, 29 Oct 2025
 14:13:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250929010321.3462457-1-pasha.tatashin@soleen.com>
 <20250929010321.3462457-15-pasha.tatashin@soleen.com> <mafs0tszhcyrw.fsf@kernel.org>
 <CA+CK2bBVSX26TKwgLkXCDop5u3e9McH3sQMascT47ZwwrwraOw@mail.gmail.com>
In-Reply-To: <CA+CK2bBVSX26TKwgLkXCDop5u3e9McH3sQMascT47ZwwrwraOw@mail.gmail.com>
From: David Matlack <dmatlack@google.com>
Date: Wed, 29 Oct 2025 14:13:20 -0700
X-Gm-Features: AWmQ_bnOObc6BWBaYvrzlZGN0Gzs0AQqmxe0DWfFCoP14pNjDRBJcsWZpskW2fo
Message-ID: <CALzav=frK48c1=nsbVJ4EvqqOqr33pUArP4G17su0hxOYveALw@mail.gmail.com>
Subject: Re: [PATCH v4 14/30] liveupdate: luo_session: Add ioctls for file
 preservation and state management
To: Pasha Tatashin <pasha.tatashin@soleen.com>
Cc: Pratyush Yadav <pratyush@kernel.org>, jasonmiu@google.com, graf@amazon.com, 
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
	stuart.w.hayes@gmail.com, lennart@poettering.net, brauner@kernel.org, 
	linux-api@vger.kernel.org, linux-fsdevel@vger.kernel.org, saeedm@nvidia.com, 
	ajayachandra@nvidia.com, jgg@nvidia.com, parav@nvidia.com, leonro@nvidia.com, 
	witu@nvidia.com, hughd@google.com, skhawaja@google.com, chrisl@kernel.org, 
	steven.sistare@oracle.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 29, 2025 at 1:13=E2=80=AFPM Pasha Tatashin
<pasha.tatashin@soleen.com> wrote:

> Simplified uAPI Proposal
> The simplest uAPI would look like this:
> IOCTLs on /dev/liveupdate (to create and retrieve session FDs):
> LIVEUPDATE_IOCTL_CREATE_SESSION
> LIVEUPDATE_IOCTL_RETRIEVE_SESSION

> - If everything succeeds, the session becomes an empty "outgoing"
> session. It can then be closed and discarded or reused for the next
> live update by preserving new FDs into it.

I think it would be useful to cleanly separate incoming and outgoing
sessions. The only way to get an outgoing session is with
LIVEUPDATE_IOCTL_CREATE_SESSION. Incoming sessions can be retrieved
with LIVEUPDATE_IOCTL_RETRIEVE_SESSION.

It is fine and expected for incoming and outgoing sessions to have the
same name. But they are different sessions. This way, the kernel can
easily keep track of incoming and outgoing sessions separately, and
there is not need to "transition" and session from incoming to
outgoing.
