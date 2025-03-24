Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0B961925AB
	for <linux-doc@vger.kernel.org>; Mon, 24 Mar 2025 19:27:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742844443; cv=none; b=dTZiXiErknW63pF6m7v9/hrlMgdKc0mKBuaT5KRswpLpmoK2InRw2zTrG2gCvjh0izRgjQF7a2XZ13gLP5ggPQIFuUfJSg+yVvftvEQcGqOE5vOxJ6n8V2n36bu2VDsjlTTQ3DkWKVn/hj1dVXcrieFXWFaFacbz5EWOlR+3Jdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742844443; c=relaxed/simple;
	bh=tow1bbsuiMKdxwcgM5wqdG0LBLdJEDfAWZYo0p/RsCA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lJZ8JvvP/GZ1ynKBadkZNsB+0VZAS1B/+Ipr0KT/RmPDMzRgDaerhnPQkv5NXuzGTo2zJgTaIcANDjNo7zU6El19kw1CTcAvaC5L4TdNwg+0ILHKSAABtcdO15EmQi1dZYFRSn1UhxzRDPX3SytfZ76RuMoYcujrsFR9X3FCABQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b=hzrlVIqF; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b="hzrlVIqF"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-4766631a6a4so48574451cf.2
        for <linux-doc@vger.kernel.org>; Mon, 24 Mar 2025 12:27:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen-com.20230601.gappssmtp.com; s=20230601; t=1742844441; x=1743449241; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=risWjFwCypYzMEcsgslZMqIUPKF0hXh9xXq6g1dCnwU=;
        b=hzrlVIqF5lXKCI9UnOheIx2QUoJEvTxg22bRKZZBa+LUBMgnKw+pD4bt4qLCuyssJk
         XV6T0WIwlkOQFa6HFlqpDlXHqYyu1vfwxV5vegnUU+nD2dZh9AJR1xwcoCwU1AIti75W
         VTpsCkZ+fdKar18/9YWbd+I2rZbCCBSR8hqqACZ07U/4ScUoeHEAZ+MP/2um+89n7+yC
         0yTM5MNH4uHWkOi1uvdUmTVb8xpyXD3DPT1vl8eVrr2pTw8b6UOggWB1HWhHCwY7zhqh
         TFB56YDd3f4rdl1xQXCvCCrMzR7h3VZ24+zNHQ1K8mnvig7AHXpQCVb0VhD/wG4ghasA
         /vIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742844441; x=1743449241;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=risWjFwCypYzMEcsgslZMqIUPKF0hXh9xXq6g1dCnwU=;
        b=YEhI5J/oUizfXyF8Y5CmrzUSxf/FJVAFccBTIBBaNgR593VcR9K1jthldNy6Km+d48
         4Ac1wNsazHc/IvRwGnnh9iZparBHtKGASrx+DZU3fxVTW4zTXho95IdZTGgKidTEAsO1
         Xo5sRGGdS/ZAGlZA1F4ubKW2aqQ1SmfRrJF/8Khuf9iac7Yzh1izpd6wh7BGEy6Tc57L
         YSgSePRt/o5H1bU6G+nYYJ9fVHMgG8rG5ypQ77mxHbg6H5MuWKnzV8kRiCgXDNxGLqif
         3DkCvsh4AsU/PaXHGLoAT3vl3eueoLkT3rmmpn57PT7N6sBUD3ldahT9JLxD7llIKMBW
         t7bw==
X-Forwarded-Encrypted: i=1; AJvYcCULnM3/hLWtkFE4gz7Y/GAgyg5pckO28NpZKcsG7k3+lRqg2LxdMMs7sJMHWsEYScHPNYxIkJ7bQCc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxeaStE9R/L0v27X0unHzxfjPb7GmloEzZOFJme17UV1KFhBfi0
	dEsUMA+AzJc/jt2n+PJGxQxtqHxr0ntAIVRpKPoZ0Ak790w/oB5RVgZQGvqdWcDT78Y4AfScGym
	y825KzpuXLLMA3yZFg9z61tn9aihFUCgtAhP38g==
X-Gm-Gg: ASbGncvYirsXRVF397Z624vahQyFMZNeN1LKBpu93BRfO9yt8FL6n5VrTkwtKvNPXbn
	v39e2vNE6/WfkDBDw9yZOLUQO7XjiPSyWYd8VrBzmtl/qHWWon0CyUd4/36z52nNIuGRwrzb+19
	DER7zWClm/K1hgoO/6gIwGeskryjdoRqLTNH0=
X-Google-Smtp-Source: AGHT+IGstsIg4qTmJ5YmWZYDNChDQ3+AV2nMWCj2a+cFs02lJM90kE8eqj7HIwLM8JIykyDhXLdef0fVOQCXvqByXHY=
X-Received: by 2002:a05:622a:550f:b0:472:bbb:1bab with SMTP id
 d75a77b69052e-4771dd88e91mr196322501cf.24.1742844440714; Mon, 24 Mar 2025
 12:27:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250320015551.2157511-1-changyuanl@google.com>
 <20250320015551.2157511-12-changyuanl@google.com> <CALu+AoS01QJ-H5Vpr378rbx==iRQLG0HajtMCUzDXRO75biCag@mail.gmail.com>
In-Reply-To: <CALu+AoS01QJ-H5Vpr378rbx==iRQLG0HajtMCUzDXRO75biCag@mail.gmail.com>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Mon, 24 Mar 2025 15:26:43 -0400
X-Gm-Features: AQ5f1JrjPincvTv7ELB8J7T2hdmnlfkqUUS0uCgm9_GvQ7ohVp8PZ0NaxW7sdEs
Message-ID: <CA+CK2bC4PM0JnHOUm7qfpQ=wUhwsYQ-hJ12tTK_7pSWgYk+bhg@mail.gmail.com>
Subject: Re: [PATCH v5 11/16] kexec: add config option for KHO
To: Dave Young <dyoung@redhat.com>
Cc: Changyuan Lyu <changyuanl@google.com>, linux-kernel@vger.kernel.org, graf@amazon.com, 
	akpm@linux-foundation.org, luto@kernel.org, anthony.yznaga@oracle.com, 
	arnd@arndb.de, ashish.kalra@amd.com, benh@kernel.crashing.org, bp@alien8.de, 
	catalin.marinas@arm.com, dave.hansen@linux.intel.com, dwmw2@infradead.org, 
	ebiederm@xmission.com, mingo@redhat.com, jgowans@amazon.com, corbet@lwn.net, 
	krzk@kernel.org, rppt@kernel.org, mark.rutland@arm.com, pbonzini@redhat.com, 
	hpa@zytor.com, peterz@infradead.org, ptyadav@amazon.de, robh+dt@kernel.org, 
	robh@kernel.org, saravanak@google.com, skinsburskii@linux.microsoft.com, 
	rostedt@goodmis.org, tglx@linutronix.de, thomas.lendacky@amd.com, 
	usama.arif@bytedance.com, will@kernel.org, devicetree@vger.kernel.org, 
	kexec@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-doc@vger.kernel.org, linux-mm@kvack.org, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 24, 2025 at 12:18=E2=80=AFAM Dave Young <dyoung@redhat.com> wro=
te:
>
> On Thu, 20 Mar 2025 at 23:05, Changyuan Lyu <changyuanl@google.com> wrote=
:
> >
> > From: Alexander Graf <graf@amazon.com>
> >
> > We have all generic code in place now to support Kexec with KHO. This
> > patch adds a config option that depends on architecture support to
> > enable KHO support.
> >
> > Signed-off-by: Alexander Graf <graf@amazon.com>
> > Co-developed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> > Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> > Co-developed-by: Changyuan Lyu <changyuanl@google.com>
> > Signed-off-by: Changyuan Lyu <changyuanl@google.com>
> > ---
> >  kernel/Kconfig.kexec | 15 +++++++++++++++
> >  1 file changed, 15 insertions(+)
> >
> > diff --git a/kernel/Kconfig.kexec b/kernel/Kconfig.kexec
> > index 4d111f871951..57db99e758a8 100644
> > --- a/kernel/Kconfig.kexec
> > +++ b/kernel/Kconfig.kexec
> > @@ -95,6 +95,21 @@ config KEXEC_JUMP
> >           Jump between original kernel and kexeced kernel and invoke
> >           code in physical address mode via KEXEC
> >
> > +config KEXEC_HANDOVER
> > +       bool "kexec handover"
> > +       depends on ARCH_SUPPORTS_KEXEC_HANDOVER && ARCH_SUPPORTS_KEXEC_=
FILE
> > +       select MEMBLOCK_KHO_SCRATCH
> > +       select KEXEC_FILE
> > +       select DEBUG_FS
> > +       select LIBFDT
> > +       select CMA
> > +       select XXHASH
> > +       help
> > +         Allow kexec to hand over state across kernels by generating a=
nd
> > +         passing additional metadata to the target kernel. This is use=
ful
> > +         to keep data or state alive across the kexec. For this to wor=
k,
> > +         both source and target kernels need to have this option enabl=
ed.
> > +
>
> Have you tested kdump?  In my mind there are two issues,  one is with
> CMA enabled, it could cause kdump crashkernel memory reservation
> failures more often due to the fragmented low memory.  Secondly,  in

As I understand cma low memory scratch reservation is needed only to
support some legacy pci devices that cannot use the full 64-bit space.
If so, I am not sure if KHO needs to be supported on machines with
such devices. However, even if we keep it, it should really be small,
so I would not expect that to be a problem for crash kernel memory
reservation.

> kdump kernel dump the crazy scratch memory in vmcore is not very
> meaningful.  Otherwise I suspect this is not tested under kdump.  If
> so please disable this option for kdump.

The scratch memory will appear as regular CMA in the vmcore. The crash
kernel can be kexec loaded only from userland, long after the scratch
memory is converted to CMA.

Pasha
