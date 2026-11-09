Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.172
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794263409;
	b=pytd+gEmmuBubDPz3e59E4XdKYTsB8PpM1vgTsp/L8ZRNlBxKRICELir3go8Fq5ylhDl
	 R7WquCVym+905ja28m5Molwf0Ld+JIWYbuEtCpvkisEZdtDI0PcIMMTgv8rLNjpVwEnjW
	 hoRnJMVfOak+yFytCGwgbJS+G+E/AYSfaHNZAAi/1ZYA+KiFlPceJj5oC3gM5P/SP1Kq9
	 OEJuPoO3T4uE8D3TkL4tRlBPDJQIMSd9afrPKrymiU/OAK0fvohEmCUI4kZNc0ooxVv7t
	 /NAJhtjaREhPcw6vDhnbTFFL/NFlI8oGVm4YYDJx7doPFxWmtqIppbZrhkq4+QkcdqA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794263409;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=S6J9qhUwfhfejNNDnNi/t39zME3R/+tshu3QmKCryWs=;
	b=kYuWNEWtlI7HevNdekTkDo+7R42OEi4TxqhGEGfsar9G75UGjB5jwMhngPtIaiCPouOC
	 MW0AEwnjO0EExcBJGLRXO8QjHQndrQsiopbE1FP4fMzPofaUQOsH8otOBjKeISnoXhoyC
	 3GJuYzxbQWrfqV+keDV3Tf/LHhAAYTzudwl4E/66/1jxH5pyG0DSQpyGpQB3zyc4qE4aA
	 MaqDjQcLgKoF9waHSVeMYnIpOvvQ1mRJjZF+LzWFdOuXNC94UpNDL9z5vi4N4ogANTef9
	 JToyDVkFIigrAjFgvqDZKQURMJjNkRkcDmVDoBFsUm7FBEhF0Bf3tlp+Yq7/spJ3Rrg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=bc6ecKnX;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.172
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C335606A333
	for <linux-doc@vger.kernel.org>; Mon,  9 Nov 2026 22:30:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4C335606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=bc6ecKnX
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-533202fe429so33351cf.0
        for <linux-doc@vger.kernel.org>; Mon, 09 Nov 2026 14:30:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794263408; cv=none;
        d=google.com; s=arc-20260327;
        b=V4o94hnsHQtQEgnDJAxy5zHqmTTieLUVYY2M9GF8waq3ixBbEgnSR8ilm9tJgbnw7D
         /zus7YZF4KJryf8GTWa1O2fTzPPjpCD93e/S/JesbTKxs28HADTEuffLOFITr5fYcLhU
         vrODuLDgTRknk1tcEK/lmPcKqsNkpB/jxIBBERPZkoOYzXpdprj5rv8lnSOvO7+IRnyR
         CQACGUDlkGDxqTSTjA+oSPgIPHegergfIsm2lpL1CqFi/rgzzqaUqXf982eE2ZJBiDJh
         4ioFAOxk2jcIGRPmYXctM2pu86u8YaSUDFECpFNpf96s9kvY+cKBQzZJ/phXURKXQ1c7
         txQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=S6J9qhUwfhfejNNDnNi/t39zME3R/+tshu3QmKCryWs=;
        fh=XrdS+lOSf1yDZO8hAbYutJqKLzr2HJnS9jycyEsPyTY=;
        b=c5JpMgMLBMD4j3mvNuQdC++NBO1XqfkzcgFOG1xi0tJbINUdAERzWZFBidNSJ18IWv
         PJY6aFq7v6JixIshfdI1zaUZW/MgHH/SmKY4f6EEov3rrUd2WrrQQcZhsWpeGNK/42AY
         J/RlJ/3zFoqNH7a+cJyfRGZ0a8S/IvwE2PSbw80vyzKvr0u54bbMVedr+iPJzlCNcekP
         hw12rQlNfPDfipUGUMBJOitDs5HlabJUSHYY3fxibSR8WbNZffGRXQ+9ZitnEFPhpQzV
         IBxyrFwe9eN8xn3YAPm1vQ8tnC3m/7DO4DkJBqzSUt0rfL3Qejh+ywP5km7iAgMVTneD
         1akg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794263408; x=1794868208; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=S6J9qhUwfhfejNNDnNi/t39zME3R/+tshu3QmKCryWs=;
        b=bc6ecKnXzqp5zahKN5US+W/GLFNu9bOCxLTorv75CdL/TyOgB/Qh6QFUi86M3M/XI3
         3gbxOXuAYS2+xcjqU4SLj5C27dCKM/SCCgBGdSbxDV00eICb4MzgEjo9vjECQ1QTCTmr
         MgCtojiqIWlVyB6AunwAs2qSQJP0tUdJsdT71C1y4WilJg+rQa++O5B+9FpAikzFpyGD
         TU94u5aUZCMHCz2bEPFushfsTW1bpin21NCA0WBKSF7omxyVw4eI3lnqeaGfI4JhzN5X
         ZQZwi7mBvwRBGIVH1EKWZ2xsmVHzuYxoBrVKANockiyw6pDDJKKlw7J5nTOQpM4hDjUm
         KR1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794263408; x=1794868208;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S6J9qhUwfhfejNNDnNi/t39zME3R/+tshu3QmKCryWs=;
        b=ubSs9Y1nQJ+juBLiq+CeHnMdHighofOsWvT6JcGt3UKSWIppyrE0Llr0hkqOEj88U2
         hWe74geejpU3YnRJs3r1r2ZhLoWDAexEB0Lvgf1PY0CeuJw41pIcoESG4TPV9s28fxzw
         U6E8Efi57i7+SrVK3jPBplTTBqMB1hmdKJ/JEMqkP1aySqtifwbwVewLieZ1Te0k8eQc
         2Q8fU39W1zxfLr/TCpdFrK06HS8IPZTfgnzbCeuzql2HxC7i+cUN+/oX2cS1QKJ9lcMZ
         V5ouKt4f/oGDzw6siAuOY9ELCh4jAhAVt+P6MvJ35gnc//RCQhgFNaKLGxuupz7ATwxl
         ptTw==
X-Forwarded-Encrypted: i=1; AL+hErG1HmGn4WnGgFzuAscRZcu34OSP56luUs2ZmE+7iaZbh2tJMioe9iJyDCfWpRE+QCHFRDzaVakifkw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+aG4EZzNJoxdGQQrRR36mlhKMfG5XxbcVQcKJgN3MI49RLJgxL
	ILYceHoHWUPc0BzahgUXT8NRp2HnkptpFqbAZP8On4RIJWBSs6QdthyUPUeckJl1ytBjm5FpKY5
	iIrT5/jIeiYf3EMtM6idP2P6aHaXLgErB78EUOY7NmMsQvnl8V14BXjkRrzM=
X-Gm-Gg: AYBFou0OnbB2BfwVwAiNCYYvOjItCYDeYl3uv5g3XT/NBurq0c5JNnJShIvw1Rw91dS
	aAtnJ3+l27/bzcMu4HKK6qJGhEySs0vIzx7WXvuMe8SZsceIXUyJinz8D3U3vqSJM92sJoWoan5
	z1mO8xPO1JCBhA4WvqdU1GJcKx2d+ujndYv73QvOa05jOA/ya0UggD1D3Z07FoAWg+70jZamoDQ
	Be6INjxhVoWE+X+VJ/jEwgbxGucfdpTZRaHyH4f5IHKRLsTaK4K3h6chDdej/+T8DC8Nm29WMLc
	1uG5SRkaH+U4OdFW5a2SGIvozijZ0TcqzaRWIF+VwD8icpxUc0Trb+Xx8l15TJ7k3vC0YOP+X2c
	eYygcuV9X8etb8vervt0qjng83jitRoh0j9y+7ySMsukxRiuiuL6lls7LTsQuWxXgVG8=
X-Received: by 2002:a05:622a:1b16:b0:530:e00f:7768 with SMTP id
 d75a77b69052e-555290bb288mr6464421cf.0.1794263407457; Mon, 09 Nov 2026
 14:30:07 -0800 (PST)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261108223913.3624571-1-irogers@google.com> <20261108223913.3624571-7-irogers@google.com>
 <b8d171de-52fe-474e-96db-d119840c6240@suse.com>
In-Reply-To: <b8d171de-52fe-474e-96db-d119840c6240@suse.com>
From: Ian Rogers <irogers@google.com>
Date: Mon, 9 Nov 2026 14:29:55 -0800
X-Gm-Features: AclHuK-dlWDp0B4FdK6V9QBR5LM_sA67_T-19O3ovPwDJ5RdBpzojQ18ICzxF_E
Message-ID: <CAP-5=fXd640kfaR+soPdiEV2mfqCPGDANCt04KzaXBphYP4Htg@mail.gmail.com>
Subject: Re: [PATCH v3 6/9] xen/sys-hypervisor: Add release callback to hyp_sysfs_kobj_type
To: Juergen Gross <jgross@suse.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Kees Cook <kees@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <chleroy@kernel.org>, Nayna Jain <nayna@linux.ibm.com>, 
	Srish Srinivasan <ssrish@linux.ibm.com>, Mimi Zohar <zohar@linux.ibm.com>, 
	Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Stefano Stabellini <sstabellini@kernel.org>, 
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>, Alexander Aring <aahringo@redhat.com>, 
	Felix Kuehling <felix.kuehling@amd.com>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Zhihao Cheng <chengzhihao1@huawei.com>, Sumanth Korikkar <sumanthk@linux.ibm.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, driver-core@lists.linux.dev, 
	llvm@lists.linux.dev, linux-hardening@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-acpi@vger.kernel.org, linux-pm@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-sh@vger.kernel.org, 
	linux-s390@vger.kernel.org, gfs2@lists.linux.dev, 
	xen-devel@lists.xenproject.org, linux-mtd@lists.infradead.org, 
	amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 8, 2026 at 10:56=E2=80=AFPM Juergen Gross <jgross@suse.com> wro=
te:
>
> On 08.11.26 23:39, Ian Rogers wrote:
> > hypervisor_init() in drivers/base/hypervisor.c creates hypervisor_kobj
> > with kobject_create_and_add() (which allocates a dynamic kobject using
> > dynamic_kobj_ktype), and hypervisor_subsys_init() in
> > drivers/xen/sys-hypervisor.c then overwrites hypervisor_kobj->ktype wit=
h
> > &hyp_sysfs_kobj_type, which had no .release callback.
> >
> > Add hyp_sysfs_release() calling kfree(kobj) to preserve the dynamic
> > kobject release behavior.
> >
> > Fixes: cff7e81b3dd7 ("xen: add /sys/hypervisor support")
> > Signed-off-by: Ian Rogers <irogers@google.com>
> > ---
> >   drivers/xen/sys-hypervisor.c | 6 ++++++
> >   1 file changed, 6 insertions(+)
> >
> > diff --git a/drivers/xen/sys-hypervisor.c b/drivers/xen/sys-hypervisor.=
c
> > index 91923242a5ae..0e8a2cd69fd6 100644
> > --- a/drivers/xen/sys-hypervisor.c
> > +++ b/drivers/xen/sys-hypervisor.c
> > @@ -659,7 +659,13 @@ static const struct sysfs_ops hyp_sysfs_ops =3D {
> >       .store =3D hyp_sysfs_store,
> >   };
> >
> > +static void hyp_sysfs_release(struct kobject *kobj)
> > +{
> > +     kfree(kobj);
> > +}
> > +
> >   static const struct kobj_type hyp_sysfs_kobj_type =3D {
> > +     .release =3D hyp_sysfs_release,
> >       .sysfs_ops =3D &hyp_sysfs_ops,
> >   };
> >
>
> Wouldn't it make sense to have a common function for just kfree(kobj)?
>
> In your series there are 3 instances of .release just doing kfree(kobj).
>
> In case this is not wanted or with using the suggested common .release
> helper you can add my
>
> Reviewed-by: Juergen Gross <jgross@suse.com>

Thanks Juergen!

lib/kobject.c already has a static dynamic_kobj_release() that does
this (and there are ~15 other places in the tree open-coding a static
kfree(kobj) release wrapper), so include/linux/kobject.h +
lib/kobject.c would be the natural home if we exported one.

I kept them as local static functions here for two reasons:

1. Patches 2/9, 3/9, and 6/9 carry Fixes: tags, and keeping the small
   local callbacks avoids a dependency on a new driver-core export for
   backports.
2. Since kobjects are normally embedded in a larger struct and freed via
   container_of(), I wasn't sure whether Greg and Danilo would view an
   exported kfree(kobj) release helper (especially alongside
   __must_init) as an invitation for misuse on embedded kobjects.

Unless Greg or Danilo would like dynamic_kobj_release() (or similar)
exported now, I'll plan to keep the local callbacks for this series
and can send a follow-up cleanup for the tree-wide callers if
driver-core maintainers think a shared helper makes sense.

Thanks,
Ian

>
>
> Juergen
