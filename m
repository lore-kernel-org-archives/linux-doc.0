Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 716ED376BC6
	for <linux-doc@vger.kernel.org>; Mon, 16 Mar 2026 22:30:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773700236; cv=pass; b=czewJzH+dsTaI6DKK4oLKTb2JBOieD6oWQOiue3nEdwrgpSBeREeHoHEx79VtTgpt8uthhpYQD79VpPTjPHBvKSKlYSxYqoFtQVidqM/lbgPmEb8ZbtVyA8CfbmjQwI5WDvSbAiOtUDDHX1FVP1lT6rhFgOqB2fobl3dEVuLZG8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773700236; c=relaxed/simple;
	bh=zOX//qQWt0hksu4DcPXbpgchK0aDuV0IDH++kKVCMlc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sIF7P39aSI3WxTQFslT2d05hbIWRZUIwEwENg0pSySfvwBlGPv+EdPGxbcZgQ799DxCexrEQsnKQ7ZHEfkmdyNbInJTUSKpXCLggNbegE73c0Nkl9c5hFd/KpiRSeHxtT+MxJY17dhxRBjO7UlDwGyk6xfGLdXToozDYs7Hltnk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=S8OUYxBX; arc=pass smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="S8OUYxBX"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5a12c310e8aso5298146e87.3
        for <linux-doc@vger.kernel.org>; Mon, 16 Mar 2026 15:30:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773700232; cv=none;
        d=google.com; s=arc-20240605;
        b=bvCgWwIdkIY79wchXbHxEK/xaZYEdqylfHMXzDCDnSA2hAxISQ3OXOhEQy/bfbxrU1
         +fp3r2CGauqnxYOnUhct9ohcatqiOGAld5cA9GpNpQLwjoon3eeRxkPnlS3TsaV8rPqF
         epST7tuDrOCqnWXCEMjQHovGi8hqJn59ZVBlqUgIriBtqmP0p1ahia2XwjpBmIwEJRo+
         M6JzHFsCCUvJeromg3WCoeFMFH0jXxyqtmEWYQBWWvNbnPOhn9Qj71q+ZW1g5DtskuFq
         n3W5FawlWinQqQc1qhRkEv2xXI2AO+sYtGTJGTmnDc20Ey8VE/Q26XMxdCd/E6EW8jqk
         iCZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NHBApg3dIEw9R1t5Yh73owWQt2Uh584izEOKgKc7ZzQ=;
        fh=UcHw2EwgmqHoZOEdhb/LG8LYqHelSEHUOTkhLV5essc=;
        b=dHzdohhuA8opRrJ+vFyZdCVHzliJhJylGw/j6QFSX9Tnd0C/asvciyp1JpPQ9G7EcA
         VKwR7Z5veC9zRxfrAgRnllKtDxqrmKJgnhNuQwqO4s3fc21ZJ94y7BP3SkQR5gGGZ29F
         /2wEZk8N58iJ1kj7PJKgHCQOvVV/UnR7bnyVl911bi0+fL7Qs0w9luwJElLRVu8aVGBY
         7tb7jvk+mBLlEtMX6G2R7TF8AM7lGr/4PkQ6CtNA5lNSFQVX01jm1HbOk6DkdfM2qMdx
         /wdiB/TdHKWsZ1dEu+taGyXCPBqtdWJFLvbviKsl2lHCz4tQdG7/udEbcWzObbD7FT9i
         6usg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1773700232; x=1774305032; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NHBApg3dIEw9R1t5Yh73owWQt2Uh584izEOKgKc7ZzQ=;
        b=S8OUYxBXmFk+Y6amRZJ5f8g9oCUwoPge4lKp/bnqvsLpQu4TaBiY9YxmtvXAIPuwjQ
         vDaB5OERJhvwosImf1/dH1iHawVRNvO4e4jpO5ljBAIEiC0pxx5N5mOW4Ux+VN1rbT4I
         P/JY421qxcrNmXeReYWij9KJEL52vJALlXy80BOqjS/5RHl9Fu2GxuBnU2vGRUdIUBJo
         yDs43NE+RgmvVvitTglEHogh2VDT+QHcFABoCjX35EZhVkuGPxkqksZRGGlG5KrPumYN
         c8YtYpZhgEjhK3jFJnBCgoTLKfv4Gnj+bqiS+FubXg56kABqYwsNvpdy2QvDEKD/D96U
         UETw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773700232; x=1774305032;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NHBApg3dIEw9R1t5Yh73owWQt2Uh584izEOKgKc7ZzQ=;
        b=Zty9CYW4PlAYX07R+yfP+kSNKZ4np9E/QpqofMKk57J6teV+m7x1mPQOk8ccHSJIDy
         /uAfeByXxuSVdJUPWHjNNEfjRfhzLvRarH9N6CAH6CB9LindcUs5mwdV670LRctHg+0N
         Mpz/EeDnHAi1dmLlfbXa1PfY513rCbSF0elliYQWcZmtMLJmXFE6m7IbcM1X6NxDdWWE
         YLiJogmFLDL4DDbnKAZZXvC3YjQRqdy0Qf3Fx7qrOnVCkO+6G1qVI+4VleC3cCmYzE6q
         VEpy9wD9wnr1nYPWj2UXHohBYgaui9VIe3Jo1/rilXJnpqbm/0JTbUlKHyfikX6MqGEt
         gajA==
X-Forwarded-Encrypted: i=1; AJvYcCWZwGXavUy+/OI8i5Q2jMFqKIzF8a8n6HJj4ntWk2mRhJFO0AyWcIyQUC5rHca/JjegJI7LrIsj/s8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyp7a12JSJ/HBcAkShCDi7FdQkHZAY76P3dFYQowLzW19URCcWp
	ovbsAWR6kleifjlj7rLelaYSOUZfvR60MC6tE7/z1xHZu8sXIC8JyiYeYH0U4Z1JRYVK9Eje1sT
	gJ7GWIq3mnhhuT7Tk25WkmZxXrvP/KIjm1rPvGJQ5
X-Gm-Gg: ATEYQzzdwCsp9lFk1S6qF1HbsnCVg7/lHLOTt2S1zl0v2JLG7RY9zUJLAkghkPs0e5/
	QnwmI8viDottO0eMXUxi/yjarQsUDnqYnhWHfejeOzOjsnAz5KpiOTI9kpXXrGW08BolFBNRKzv
	4WJ99COlVnGqKcliha2sGyGr3FyeempuO+E8ayAOAM73FZpA7mtrnYmnXPT0Jh/oNNM0e5hlJE1
	rk+M0paD0a5AF+1mOWRsQTPTAgsDyA63w7d30z7ct+VGhR6OnXdXkKROivFWKTlJr2ShIB+Y4YH
	Ucs8Yy4nSN43aDgl6Fo=
X-Received: by 2002:a05:6512:38a4:b0:5a1:2a64:202a with SMTP id
 2adb3069b0e04-5a162706bf5mr4418611e87.18.1773700231818; Mon, 16 Mar 2026
 15:30:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260129212510.967611-1-dmatlack@google.com> <20260129212510.967611-12-dmatlack@google.com>
 <20260316215056.GC1846904.vipinsh@google.com>
In-Reply-To: <20260316215056.GC1846904.vipinsh@google.com>
From: David Matlack <dmatlack@google.com>
Date: Mon, 16 Mar 2026 15:30:04 -0700
X-Gm-Features: AaiRm51TsPFqmaxXeg5vtHycDWCNAMtrDhfsa1Ts3dgQ-gFDNbzitmE0jWYnMy4
Message-ID: <CALzav=eKbTiJYz4mCWTmVghnwFLHZOY096Pf=1GYpO_UBixozA@mail.gmail.com>
Subject: Re: [PATCH v2 11/22] docs: liveupdate: Document VFIO device file preservation
To: Vipin Sharma <vipinsh@google.com>
Cc: Alex Williamson <alex@shazbot.org>, Adithya Jayachandran <ajayachandra@nvidia.com>, 
	Alexander Graf <graf@amazon.com>, Alex Mastro <amastro@fb.com>, Alistair Popple <apopple@nvidia.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Ankit Agrawal <ankita@nvidia.com>, 
	Bjorn Helgaas <bhelgaas@google.com>, Chris Li <chrisl@kernel.org>, 
	David Rientjes <rientjes@google.com>, Jacob Pan <jacob.pan@linux.microsoft.com>, 
	Jason Gunthorpe <jgg@nvidia.com>, Jason Gunthorpe <jgg@ziepe.ca>, Jonathan Corbet <corbet@lwn.net>, 
	Josh Hilke <jrhilke@google.com>, Kevin Tian <kevin.tian@intel.com>, kexec@lists.infradead.org, 
	kvm@vger.kernel.org, Leon Romanovsky <leon@kernel.org>, Leon Romanovsky <leonro@nvidia.com>, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org, 
	linux-pci@vger.kernel.org, Lukas Wunner <lukas@wunner.de>, 
	=?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>, 
	Mike Rapoport <rppt@kernel.org>, Parav Pandit <parav@nvidia.com>, 
	Pasha Tatashin <pasha.tatashin@soleen.com>, Pranjal Shrivastava <praan@google.com>, 
	Pratyush Yadav <pratyush@kernel.org>, Raghavendra Rao Ananta <rananta@google.com>, 
	Rodrigo Vivi <rodrigo.vivi@intel.com>, Saeed Mahameed <saeedm@nvidia.com>, 
	Samiullah Khawaja <skhawaja@google.com>, Shuah Khan <skhan@linuxfoundation.org>, 
	=?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
	Tomita Moeko <tomitamoeko@gmail.com>, Vivek Kasireddy <vivek.kasireddy@intel.com>, 
	William Tu <witu@nvidia.com>, Yi Liu <yi.l.liu@intel.com>, Zhu Yanjun <yanjun.zhu@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 16, 2026 at 2:55=E2=80=AFPM Vipin Sharma <vipinsh@google.com> w=
rote:
>
> On Thu, Jan 29, 2026 at 09:24:58PM +0000, David Matlack wrote:
> > Add documentation for preserving VFIO device files across a Live Update=
,
> > as well as some generic file preservation documentation. This
> > documentation will be extended in the future as new types of files are
> > supported and new dependency/ordering requirements are added.
> >
> > Signed-off-by: David Matlack <dmatlack@google.com>
> > ---
> >  Documentation/userspace-api/liveupdate.rst | 144 +++++++++++++++++++++
> >  1 file changed, 144 insertions(+)
> >
> > diff --git a/Documentation/userspace-api/liveupdate.rst b/Documentation=
/userspace-api/liveupdate.rst
> > index 41c0473e4f16..dbf1e4aeddd7 100644
> > --- a/Documentation/userspace-api/liveupdate.rst
> > +++ b/Documentation/userspace-api/liveupdate.rst
> > @@ -14,6 +14,150 @@ ioctl uAPI
> >  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >  .. kernel-doc:: include/uapi/linux/liveupdate.h
> >
> > +File Preservation
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
> Should we use the existing way where documentation is written in code
> files and referenced here? Maybe luo_file.c for this?

Good idea. I will look into that. It would be nice to also have this
documentation in the code.
