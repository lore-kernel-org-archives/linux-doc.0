Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06ADB4430
	for <linux-doc@vger.kernel.org>; Sun,  8 Jun 2025 00:04:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749341081; cv=none; b=giURkmE9Ebk1CES3KI/fdqqdCAsxyz5oObdVioyCvfn4TaHS2YXq6qZXKQTtWUcYgnwCsb9p4f7S1/ETuOiCWegIfkYkCu1B3DSKXzbE8Ia5V1kyN0pmk/CHhCZQrsSNbUmiZv9RUyLRG1nZs9dHk80MTxp1NLi/pRyLmlyfE4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749341081; c=relaxed/simple;
	bh=3nrXo6s/BNr8vei07z9IKKe/5qIGj4qXfxgKcrALLnE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pdG5aW0qW6nI/Re1v7/77qDLmk2M+aaYQNZVAEVFxlNvznixo2YzFEL7Vf+SJ4BAdjoGZST/da4OeN5NanHCnghHeNZFEYSdGvPQ0riq53p86/f4S7zORbySM0ObVOPPe8r33S7jvFDuOqyuI3X5HoFLtjCjGjX0uf7ZDXX/t8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b=sXPSIOqc; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b="sXPSIOqc"
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-4a442a3a2bfso59039851cf.1
        for <linux-doc@vger.kernel.org>; Sat, 07 Jun 2025 17:04:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen-com.20230601.gappssmtp.com; s=20230601; t=1749341079; x=1749945879; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zp/D6Nx8BfMiScISjeIblyGMtACHkzJtCPjT0UaHWyY=;
        b=sXPSIOqcR+uRUP1M3yJgrgvtormDP1CUe3U+Wj+dWQGTexfgekJpOnPM3anFwgCR3B
         I78T6ydDpf+21so0ENVzw6PuN3DAHV5oKATGruzPBB5o4MIqnT7XEQ122X0L7BcFu2kI
         X/+G7yQoe5OO4jJTGTDQ1NlRolKjuXwGLx5xDzj66uqZmImHhzlCAA7gqDGzgbUS6ewS
         89mvyjD0GI0nrie4ndUWTciMfl8rtD/biOPXns5UILg5IvNpfaeHM4IpdakEkja6zJs/
         q2WhAnGAjJbBcJNcIGgmDxmQEeyvhu14xSVDPFFn5OWDd+qcpw8cqq3h5l7EEk4pZ/dr
         WwpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749341079; x=1749945879;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zp/D6Nx8BfMiScISjeIblyGMtACHkzJtCPjT0UaHWyY=;
        b=Yg3JuJJo0M+3hhOmxdq1TWruOdurf+MkSQQ6lRUZMUarRSgvCYUZ9QePEajg5QoOzN
         FBQ3ew1MsXAUvmGZ2n1uVkaHw5ftd0tHrszlH+2H+2F9BSy5967O3Jd1W6IMLvtsWxjb
         65aVeg/3JsuMUvaicFVglFQcw5kx1HUY10Sq/2AKJBCTiOJ9PjUkT8hUz0i8jrtfCr1c
         NJW6W+Deg8Mk/1AOjoIOYL0P9Q/abUukvB8Dm6cuyPuoC4hffDJ1T/Qjh9TupD9dzAfz
         ojniDLuV4HsUviHbdSGufFDHYQBMsNg/OGNkB9cVCgDTKu+jv9hCimOu45pUWVLdhPUb
         qRpQ==
X-Forwarded-Encrypted: i=1; AJvYcCVS0ChxqzpgpTPu7qV3XAapJJsw7ZY0lFeWZf/L9xnDPqWRRx/DWDfRkYoIBrd1Zuzh7MDthKJLnrU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxKke5eB2XAfkGi/SVSy4+VEB7htwUeXGYUhJMuoYdtfEEoSyhC
	LoXEe2ElEkl3OjEP52+17viaE6tWt7E84Dxco1PJs5CXUp3VKRBAwnvC+j37IgAomdlQdncy5V6
	u0SLd8MOZvlZpKncVzjpz6WeLkSwNQhI45WFtehFgIQ==
X-Gm-Gg: ASbGncscJwgEfQA7h2P64O8aVPCz3CPhLQ94RI2Rueie3D9bEw95Ryw/7TfrsHOIuS+
	F1nbj4XUmhZzvRF9FF5SzH/0/DdmvB+/D+6kiWpjxCuYp+yYU4pobykTWIkhqCEqw3KDNhsAD1G
	MB6p+HgXK4l//xcmmGnihgHPeGzynHQdn0EUlVOi5l
X-Google-Smtp-Source: AGHT+IEHyFkt2x/bEAiQ5dSYS8a+nTEZ4nXGxUXv1xBh/B/nln1ArBefBSOd6jxdD7aTJ5evdbG2kp9u/gDYdQ8Odpo=
X-Received: by 2002:a05:622a:1b0b:b0:4a3:800d:2a9a with SMTP id
 d75a77b69052e-4a5b9a0498fmr129085641cf.6.1749341078791; Sat, 07 Jun 2025
 17:04:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250515182322.117840-1-pasha.tatashin@soleen.com>
 <20250515182322.117840-7-pasha.tatashin@soleen.com> <mafs0iklbtqpc.fsf@kernel.org>
In-Reply-To: <mafs0iklbtqpc.fsf@kernel.org>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Sat, 7 Jun 2025 20:04:00 -0400
X-Gm-Features: AX0GCFuiagbyWhs5WKRlcCrzhjgoTlRaZx67U0f0XBer66fayKl3tu7mrARjDcI
Message-ID: <CA+CK2bDrvd1dgZSbN08aDuNYD9hOxTawR-RL2jTFLmT7B608ow@mail.gmail.com>
Subject: Re: [RFC v2 06/16] luo: luo_subsystems: add subsystem registration
To: Pratyush Yadav <pratyush@kernel.org>
Cc: jasonmiu@google.com, graf@amazon.com, changyuanl@google.com, 
	rppt@kernel.org, dmatlack@google.com, rientjes@google.com, corbet@lwn.net, 
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
	stuart.w.hayes@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 4, 2025 at 12:30=E2=80=AFPM Pratyush Yadav <pratyush@kernel.org=
> wrote:
>
> On Thu, May 15 2025, Pasha Tatashin wrote:
>
> > Introduce the framework for kernel subsystems (e.g., KVM, IOMMU, device
> > drivers) to register with LUO and participate in the live update proces=
s
> > via callbacks.
> >
> > Subsystem Registration:
> > - Defines struct liveupdate_subsystem in linux/liveupdate.h,
> >   which subsystems use to provide their name and optional callbacks
> >   (prepare, freeze, cancel, finish). The callbacks accept
> >   a u64 *data intended for passing state/handles.
> > - Exports liveupdate_register_subsystem() and
> >   liveupdate_unregister_subsystem() API functions.
> > - Adds drivers/misc/liveupdate/luo_subsystems.c to manage a list
> >   of registered subsystems.
> >   Registration/unregistration is restricted to
> >   specific LUO states (NORMAL/UPDATED).
> >
> > Callback Framework:
> > - The main luo_core.c state transition functions
> >   now delegate to new luo_do_subsystems_*_calls() functions
> >   defined in luo_subsystems.c.
> > - These new functions are intended to iterate through the registered
> >   subsystems and invoke their corresponding callbacks.
> >
> > FDT Integration:
> > - Adds a /subsystems subnode within the main LUO FDT created in
> >   luo_core.c. This node has its own compatibility string
> >   (subsystems-v1).
> > - luo_subsystems_fdt_setup() populates this node by adding a
> >   property for each registered subsystem, using the subsystem's
> >   name.
> >   Currently, these properties are initialized with a placeholder
> >   u64 value (0).
> > - luo_subsystems_startup() is called from luo_core.c on boot to
> >   find and validate the /subsystems node in the FDT received via
> >   KHO. It panics if the node is missing or incompatible.
> > - Adds a stub API function liveupdate_get_subsystem_data() intended
> >   for subsystems to retrieve their persisted u64 data from the FDT
> >       in the new kernel.
> >
> > Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
> [...]
> > +/**
> > + * liveupdate_unregister_subsystem - Unregister a kernel subsystem han=
dler from
> > + * LUO
> > + * @h: Pointer to the same liveupdate_subsystem structure that was use=
d during
> > + * registration.
> > + *
> > + * Unregisters a previously registered subsystem handler. Typically ca=
lled
> > + * during module exit or subsystem teardown. LUO removes the structure=
 from its
> > + * internal list; the caller is responsible for any necessary memory c=
leanup
> > + * of the structure itself.
> > + *
> > + * Return: 0 on success, negative error code otherwise.
> > + * -EINVAL if h is NULL.
> > + * -ENOENT if the specified handler @h is not found in the registratio=
n list.
> > + * -EBUSY if LUO is not in the NORMAL state.
> > + */
> > +int liveupdate_unregister_subsystem(struct liveupdate_subsystem *h)
> > +{
> > +     struct liveupdate_subsystem *iter;
> > +     bool found =3D false;
> > +     int ret =3D 0;
> > +
> > +     luo_state_read_enter();
> > +     if (!liveupdate_state_normal() && !liveupdate_state_updated()) {
> > +             luo_state_read_exit();
> > +             return -EBUSY;
> > +     }
> > +
> > +     mutex_lock(&luo_subsystem_list_mutex);
> > +     list_for_each_entry(iter, &luo_subsystems_list, list) {
> > +             if (iter =3D=3D h) {
> > +                     found =3D true;
>
> Nit: you don't actually need the found variable. You can do the same
> check that list_for_each_entry() uses, which is to call
> list_entry_is_head().

True, but for readability, 'found' makes more sense here. I do not
like using iterator outside of the loop, and also if
(list_entry_is_head(iter, &luo_subsystems_list, list) {} harder to
understand, and would require a  comment, instead of simple:  if
(found) {}

>
> > +                     break;
> > +             }
> > +     }
> > +
> > +     if (found) {
> > +             list_del_init(&h->list);
> > +     } else {
> > +             pr_warn("Subsystem handler '%s' not found for unregistrat=
ion.\n",
> > +                     h->name);
> > +             ret =3D -ENOENT;
> > +     }
> > +
> > +     mutex_unlock(&luo_subsystem_list_mutex);
> > +     luo_state_read_exit();
> > +
> > +     return ret;
> > +}
> > +EXPORT_SYMBOL_GPL(liveupdate_unregister_subsystem);
> [...]
>
> --
> Regards,
> Pratyush Yadav
