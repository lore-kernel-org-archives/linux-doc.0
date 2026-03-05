Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 150203D3D1C
	for <linux-doc@vger.kernel.org>; Thu,  5 Mar 2026 19:42:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772739768; cv=pass; b=Y2AGmsIl0j2j3JBizgOuZCmNtQ9KD1s2fTMOLsCEugJbVX7SkmC8RjGZhRn+TrNrh9M+gRxqjroe1whicVBizobIeTGJp51oDXdIatPgcWWss+wh/JHD0o0pXM0tSlejt/AwTRYllbUj40qlibPQmZnULA7fyVNwitRCk/OKoUY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772739768; c=relaxed/simple;
	bh=BFL2J/Icfk5z6sblaLG86L1o2xcdsDyOfso7V9JzEr4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UKx82dffhCFZ4Ja06fNkdvP8souYa7VG9RTvKfFJovKWYVNLU7F3sMLObTC5xOMh5ZqBRGMVLMfRZFG4dRwASaest//tQrA4p51Nxayy3CMx035EhbCw7P8f29dBOqFlOa+P5O85s+8b/2SsTXNriggA4t/5ioyC168Gek5EOlw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=J7y/Lq1I; arc=pass smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="J7y/Lq1I"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5a133b686f7so1169789e87.0
        for <linux-doc@vger.kernel.org>; Thu, 05 Mar 2026 11:42:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772739765; cv=none;
        d=google.com; s=arc-20240605;
        b=Q9MEHGZt9k2jG6XGOUqEjK9/52KFL8gzcG4CEfbtqA6OFizSTOzDDWIA/KmoP2C8jU
         621JTsaCedpriZjewJAe2rfNkZifovxfUhgffYAKca87nY8klxx9ZOZ7CBsH78yzcI23
         hYPrFWFG3yBhsYxhjH4EaklQ3w7uKgpNkMBwK4olIhfZwmGtwF8cwvY2/q5vvNq3na8z
         sMth66LP3Kw9CWCrnFDsFqUNfVNAFJvTGgD5Zx3oaX0MBbrykEElwLpxDXtZFu6d5eld
         e8zHiLeNEZ0eQWTxd7T8tO+u3L1RbTjw/TK1k7iN/chTdfxLXhRhkWx/jIeOOLObZ1hZ
         K9yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BFL2J/Icfk5z6sblaLG86L1o2xcdsDyOfso7V9JzEr4=;
        fh=CX24qjbFMSHAG56lt8AWTzpm45WotoDWLsqh0fT9X8Y=;
        b=Bb0an0Lw0zMBWK1IMkj4FhtaBgkcpF+E5KdfVxivYSAcPK8IwHAeToHQnac7avmqK3
         j0UsmAOW0J94NE4k4iklco3E1yD7S8AhjXNfgPBwfg64DRLHpgr1fyIRMYYmAa1wU5ab
         SoSMKGfdtubI8MHJGAcqcve1ULbjDbBONmeiCSnFS2zMiEOSOOJhXeiWNul/CYguRd+N
         mYDKAWKO9uPAmVXjP1CuLpzsmY0yxXMgjdwtz8CZj0WXcX0VzdZA4eok+4sx6ZcAcyC6
         NWqjWjkDcZ6cW0PpITkeT1OmsAmOo9uUsP9OOs4ToTGm4Rop9onlx2dkck9CWuDMzALW
         7Yfg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772739765; x=1773344565; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BFL2J/Icfk5z6sblaLG86L1o2xcdsDyOfso7V9JzEr4=;
        b=J7y/Lq1IxLU+Dz/yjyvb/dPGPWnJbQob8Q2QuxVwDq6DrAe8KOLBbCw/RJH28ZsIVm
         eLzXtNQcCvkAEH7bpRZF/pHYbvI0NuBd2MgR2c/Tmts2IWoPoUSUjur+tO8lJhe/JPu+
         wNIM01PysIEn8QP4iLyrMtWwOGswInpVK2slbAeLvCixJcS5Jcfm/YXy9W33WHWUlNiP
         +p8C9bhO6HnUerwsZkWaI2Fa4KQlt131xsUL2xLViCepC/XpkT2ZzP5F5tcH1trI7ll+
         91MgpSRqDkP3dwwPHNc+cwgxgozBIsjP9eh+BAsVQOwjVYYakt93rQClSztQIsXMrt+/
         C4Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772739765; x=1773344565;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BFL2J/Icfk5z6sblaLG86L1o2xcdsDyOfso7V9JzEr4=;
        b=VcEf7zjn3jaFLRfulgjDTAP+ePVBoDrlAEsQ3FJo/dMbn/g7qZgml+D3DIQOJ+RHnZ
         cayxXnw647qiEpwcnyLKd6NF25CcmPY8zSzZpi+0Z6ojsbcZ2vfywP7tK76VXyDCBL1Z
         MdzNohXBwt2Lo+R6VYhFOIDp8xSeGJbnjckp01JenA/9oktPBkLQWFt86OH3YHuIHgcP
         qZQ5p2SABqNI/NPj43eWiNZUl7c4rvu9U/YpL/Qcj4yVanzKd9eFtaz1yKWBKFA7t3zI
         pp3IixATijKLSB55dS60zI3yJW+1AFbqnjZNRzZ1qsOGBeXRBbJ7x+M/HeyvpmliyOS2
         0Yhw==
X-Forwarded-Encrypted: i=1; AJvYcCVFgNCdwL7BwDx/jw2asG4idr7Ct+ESuxd2UtSQ7Q99jqSydxRKZCcb+f7sE9sDIMypKFimJKPnoEw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyjcXbidCQmPstc6IJ6XbL27uqIolkhA/m3UaoGDV/o+kJyBRp5
	xGiIH72cIw5FVO27BORtLUqBXXFMzFlrQNKC3W+ENjGwhlJ1ZX67xsI+QUkQSZwa+DKiIS83RIX
	05HdUNsC41wSCsssU/ciLT1OPbn2I4NCwU5UAC9OH
X-Gm-Gg: ATEYQzxiCWKC0jmuall7QYjk+AFqXmyWPCrjmr72n4Rwr9icvW2LpYM2PV0TCXydJdB
	IYF1peEoTPM83++rZowZ0zbsNL8yJRTL9jPTQK4elvd7U3Dr3qBu93R7BcXGYqFkiV0l/wuZRrq
	eCfBqky284T1u+edDrQejFlZ4wnN34EHLQeu3qRmd9yoLmrmyjEBdwvKTqRzwb0CBcyviPSE8NU
	oOWQHM/YsdYhA9w1f1VQ+Ccm8XeSeD8iRlWeFqMnDATj1tKkQWI7PK/Sr5kaJVUKrCeDaBVuy7e
	RKWHySPY
X-Received: by 2002:a05:651c:1587:b0:38a:6f5:4b54 with SMTP id
 38308e7fff4ca-38a3c815300mr2046311fa.4.1772739764639; Thu, 05 Mar 2026
 11:42:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260129212510.967611-3-dmatlack@google.com> <20260225224651.GA3711085@bhelgaas>
 <aZ-TrC8P0tLYhxXO@google.com> <20260227093233.45891424@shazbot.org>
 <CALzav=dxthSXYo13rOjY710uNbu=6UjzD-OJKm-Xt=wR7oc0mg@mail.gmail.com>
 <20260227112501.465e2a86@shazbot.org> <20260301192924.GR5933@nvidia.com>
In-Reply-To: <20260301192924.GR5933@nvidia.com>
From: David Matlack <dmatlack@google.com>
Date: Thu, 5 Mar 2026 11:42:16 -0800
X-Gm-Features: AaiRm52QizUmbxb_ZZJRNIFYAvXcIrsVMR2oGVyxQJsUboHWoi4G3a03BNBWEM8
Message-ID: <CALzav=deyfyzGXzSGmEbjvLr8Nn9Rpeh9w9JVk0vmb9FcURYPw@mail.gmail.com>
Subject: Re: [PATCH v2 02/22] PCI: Add API to track PCI devices preserved
 across Live Update
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Alex Williamson <alex@shazbot.org>, Bjorn Helgaas <helgaas@kernel.org>, 
	Adithya Jayachandran <ajayachandra@nvidia.com>, Alexander Graf <graf@amazon.com>, Alex Mastro <amastro@fb.com>, 
	Alistair Popple <apopple@nvidia.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Ankit Agrawal <ankita@nvidia.com>, Bjorn Helgaas <bhelgaas@google.com>, Chris Li <chrisl@kernel.org>, 
	David Rientjes <rientjes@google.com>, Jacob Pan <jacob.pan@linux.microsoft.com>, 
	Jonathan Corbet <corbet@lwn.net>, Josh Hilke <jrhilke@google.com>, Kevin Tian <kevin.tian@intel.com>, 
	kexec@lists.infradead.org, kvm@vger.kernel.org, 
	Leon Romanovsky <leon@kernel.org>, Leon Romanovsky <leonro@nvidia.com>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-mm@kvack.org, linux-pci@vger.kernel.org, Lukas Wunner <lukas@wunner.de>, 
	=?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>, 
	Mike Rapoport <rppt@kernel.org>, Parav Pandit <parav@nvidia.com>, 
	Pasha Tatashin <pasha.tatashin@soleen.com>, Pranjal Shrivastava <praan@google.com>, 
	Pratyush Yadav <pratyush@kernel.org>, Raghavendra Rao Ananta <rananta@google.com>, 
	Rodrigo Vivi <rodrigo.vivi@intel.com>, Saeed Mahameed <saeedm@nvidia.com>, 
	Samiullah Khawaja <skhawaja@google.com>, Shuah Khan <skhan@linuxfoundation.org>, 
	=?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
	Tomita Moeko <tomitamoeko@gmail.com>, Vipin Sharma <vipinsh@google.com>, 
	Vivek Kasireddy <vivek.kasireddy@intel.com>, William Tu <witu@nvidia.com>, Yi Liu <yi.l.liu@intel.com>, 
	Zhu Yanjun <yanjun.zhu@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 1, 2026 at 11:29=E2=80=AFAM Jason Gunthorpe <jgg@nvidia.com> wr=
ote:
>
> On Fri, Feb 27, 2026 at 11:25:01AM -0700, Alex Williamson wrote:
>
> > There's obviously a knee jerk reaction that moving PF drivers into
> > userspace is a means to circumvent the GPL that was evident at LPC,
> > even if the real reason is "in-kernel is hard".
>
> Given we already have GPL licensed kernel drivers for the PFs it
> doesn't seem like a reasonable worry to me to fret about some cut down
> version of a kernel driver running in userspace.
>
> Further, let's be honest here, the people most interested in all of
> this are doing it to support their proprietary VMMs. I'm pushing that
> we must have at least a reference implementation in qemu before the
> kernel parts should be merged..

Yes, this is why we built VFIO selftests with the driver framework
[1]. We wanted to ensure Live Update support could be well tested
upstream independent of VMM adoption and without requiring complex
orchestration.

Google is also working on upstreaming Live Update support into Cloud
Hypervisor and the kernel pieces land.

[1] https://lore.kernel.org/kvm/20250523233018.1702151-1-dmatlack@google.co=
m/
