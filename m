Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADF4939185D
	for <linux-doc@vger.kernel.org>; Tue, 24 Mar 2026 16:46:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774370796; cv=pass; b=HN0HnGJF2Eoy8AQkY76SGYgJ23pu4iCJHVIBPG9uMVSshbpVq5J8hGnu+Kut0yauXbk37K1Y1NRhiNF6MS04js95btc7oZCdvE0j7AX2PEv2mYkQ51x2xok1Au532qwJqAj8Io9VfE0cqFzGx/GzlDcZeEiqLSJ+tgwyrJS/u/M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774370796; c=relaxed/simple;
	bh=kRBNZYBXvdyd0G3IRhmHcdN/BFg2bxldCxeHP1r/m7A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fYy5KtfrQjPuZNNhSLzWecIZ8aFpyscRAufHy90eoFU2fY6fvDXt17WhdvWo5zDm95svi2Af7CQD8l0JybqEvXAps/wS7om0hnSln1eZ9hADrcFctGGnDjFUokvTFcy4/hafSilm9lpgqkbFUpA7WtQ3Y4yzviogbgFDbHxAW8s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=H4sO8PKp; arc=pass smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="H4sO8PKp"
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-389f9895c81so14422211fa.2
        for <linux-doc@vger.kernel.org>; Tue, 24 Mar 2026 09:46:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774370793; cv=none;
        d=google.com; s=arc-20240605;
        b=Q/br2bKccQJb5Tzb6F5oJxbCvflizozAsABC4o8WJWZPNROKCCU3w3dQXIj4HOs9cu
         vs2KD81qVOK/iljqDqQbI/kNxcmfbXEnlD5ENTNrRMbkIyoYZFdBnMLBcR36IpqLIM4t
         mtSrVWOXIwlUrnxxHwEkC7qXB/uHPs8Fh44eKZ8J00H4HqMN47dkrLQH5JdCMfqNqoj4
         wlGriJ9zZL4HwStpv9/iRrO4J4dOEFpDjAUD2xQGJl+ncSC63tNnpfXG+nUOWIiLckre
         BxScsJOdEvg/ZKAK6EThkgbe3NW2mSr+X8vzoagVCdf89nEAS8Zy/x9/41RhX4Kl2Caa
         Iw/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UCikAyXiicm5k2VXyH9xrW1vWINN0uWZrBsYrIEp9jQ=;
        fh=Qt/zOguGxVlwnB/Yktp2HmnkcTSgr5V7NW0fCwWt3M4=;
        b=RTmfvIrlGyX7eAl+VGqCIZfzDU4qe/N1uCf5XmyYOQqxiYWObeLAHIpWdqqLArMO4/
         7ORMmt5KdPWQdQ8piauBcskk5iQLI62bOvOJzmX4Hw4LlI8wowzjhkAM3juGqc/AKhQj
         i+JqHPwjpN0fIUDnoAKhD0hRrcw9RoqiRIn/ThbHPYC8snqgN4VY3JX5YaBLyLHSXCHl
         B7qKeplw1wZPGKK8byO4c1zGuX2mHASaESyVf8WxzMnS6CUxKWQicIJTr04ikuqaeD/R
         Moc8xGNsWNi+VrRsmXNDZ096SlIp9XSGyEhp9YeC+vERjgb0iTeF5fz6KVTr7ivpvLbl
         VE4Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774370793; x=1774975593; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UCikAyXiicm5k2VXyH9xrW1vWINN0uWZrBsYrIEp9jQ=;
        b=H4sO8PKp9fcAPhpWTxNV+tFmYJ/sEMYatbvIzld2dPiEOMw9aGpQ+WGNGjATEm+51/
         YbUcXFrcz97hbxrzxsEftuOqLKQiOSrFXG8T8HXyVGKMdQx0HKHJye0LmCsymPDZPSvG
         M/CHqF2rcTta7qW3KZgb2NMHPAsk5WrMBrhk43stRUaU83lXDhrC0HIe/9Bl1cZQ4HWb
         MFIwP/f7Wk9f1aXFttOJmUlBwtLno++Ijt//Yg+3pVY62V59rXXtcCnbpzbyAluM8rv4
         cpGGN572WnyszDNQd0dUYDT9JLIypM2+/qb1F2bL6BWSOgFP/9k2jDhbbXODCuJNqqJx
         AsOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774370793; x=1774975593;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UCikAyXiicm5k2VXyH9xrW1vWINN0uWZrBsYrIEp9jQ=;
        b=E2tIUFlpk+4crsA+xMYYUKkRKvPCcoXPzYEznPSDKWkSXN3UwCDHYwpmyOIIPDqU49
         vWYCCGJGauGtC6P1NlbJi6Qw3qYwJY1fTsA0OTBgEiGKT1es/TDf0Af3Z007Ul3D5/Pk
         1nXhbMzdK2NJuRXarIetsd0b9jH1mmGM9WvrmsM9ORNK6ThotewoxPG/mkXfhggNyvY2
         E5E8An0B3mSFur8lIJLBNftDCxK2MgB3TX7HpPAdbrgUux2GdG81N+w7y04as65KcdPS
         ynZflZMx6PXyyzWCqyobXjyzuldgVKEKHqiBSueXQA30/gY3BJLXH/LFeqY1ZnvPu9uh
         sydw==
X-Forwarded-Encrypted: i=1; AJvYcCUYdFf03VtcsUEMlty6cWo/ZvpWCk2vglkBC85JvfMuE59zBlMFibW6hroQ4I27yJav8tUETSrT+bc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzvYdWX7fW/EabDYCuB0gMqmhIcalcgR/yox+gtTO/goMoyknOQ
	wY25dts8ll6n4eS0PM3VDarVQbBF5Qo2ZtETecss+hE7guTieVJSO5HCp7E9M2iKgRyJN8byC2v
	KjNZ17eXhfglrU23LpSnPpFRNUr+8XU29SbwaCIZ4
X-Gm-Gg: ATEYQzxaivWDy701USh/AI+Qu0gbBKfWt1cAQqjkAdb8Ds6XeTSOdlzbN/YtL8YiKYO
	VogjDQhm1d3G4EvZJHWPTqfPSRG0s+L9dXIEdIvaG3GMRiF8++UBgNRCUoqgH0vyayOKd7bK4xJ
	1nJPygakS7lsbBvKGvIUMLaewNZfRJ7cQ32Hi8IU+L9Ck2dDot4iZJo7VjlqIWvFNXD5l2dTPVV
	dOo63gwTeYTe2ySOoUr0UjwV7ROnEdEY1zCNVd/4ncFbqG1AII6ok6jUrAtbAfVcH3T2S5KNuo0
	yK5q+vVm
X-Received: by 2002:a05:651c:198d:b0:38a:45d6:c246 with SMTP id
 38308e7fff4ca-38c4309f785mr403821fa.8.1774370792285; Tue, 24 Mar 2026
 09:46:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260323235817.1960573-1-dmatlack@google.com> <20260323235817.1960573-8-dmatlack@google.com>
 <df5dac48-8a54-49e2-acb8-9370b7078033@intel.com>
In-Reply-To: <df5dac48-8a54-49e2-acb8-9370b7078033@intel.com>
From: David Matlack <dmatlack@google.com>
Date: Tue, 24 Mar 2026 09:46:03 -0700
X-Gm-Features: AaiRm53x8nRAyhq72BKXQ8vBk2jNU8cpC5QwT_5hu3qjlEbsk36YMzg6v1f1PaQ
Message-ID: <CALzav=cGzzZTL-tyaaG_AhC3gP7ULiU6hWS=X6joLTjyoo-6sg@mail.gmail.com>
Subject: Re: [PATCH v3 07/24] vfio/pci: Preserve vfio-pci device files across
 Live Update
To: Yi Liu <yi.l.liu@intel.com>
Cc: Alex Williamson <alex@shazbot.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Adithya Jayachandran <ajayachandra@nvidia.com>, Alexander Graf <graf@amazon.com>, Alex Mastro <amastro@fb.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Ankit Agrawal <ankita@nvidia.com>, 
	Arnd Bergmann <arnd@arndb.de>, Askar Safin <safinaskar@gmail.com>, 
	"Borislav Petkov (AMD)" <bp@alien8.de>, Chris Li <chrisl@kernel.org>, Dapeng Mi <dapeng1.mi@linux.intel.com>, 
	David Rientjes <rientjes@google.com>, Feng Tang <feng.tang@linux.alibaba.com>, 
	Jacob Pan <jacob.pan@linux.microsoft.com>, Jason Gunthorpe <jgg@nvidia.com>, 
	Jason Gunthorpe <jgg@ziepe.ca>, Jonathan Corbet <corbet@lwn.net>, Josh Hilke <jrhilke@google.com>, 
	Kees Cook <kees@kernel.org>, Kevin Tian <kevin.tian@intel.com>, kexec@lists.infradead.org, 
	kvm@vger.kernel.org, Leon Romanovsky <leon@kernel.org>, Leon Romanovsky <leonro@nvidia.com>, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org, 
	linux-pci@vger.kernel.org, Li RongQing <lirongqing@baidu.com>, 
	Lukas Wunner <lukas@wunner.de>, Marco Elver <elver@google.com>, 
	=?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>, 
	Mike Rapoport <rppt@kernel.org>, Parav Pandit <parav@nvidia.com>, 
	Pasha Tatashin <pasha.tatashin@soleen.com>, "Paul E. McKenney" <paulmck@kernel.org>, 
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>, 
	"Peter Zijlstra (Intel)" <peterz@infradead.org>, Pranjal Shrivastava <praan@google.com>, 
	Pratyush Yadav <pratyush@kernel.org>, Raghavendra Rao Ananta <rananta@google.com>, 
	Randy Dunlap <rdunlap@infradead.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>, 
	Saeed Mahameed <saeedm@nvidia.com>, Samiullah Khawaja <skhawaja@google.com>, 
	Shuah Khan <skhan@linuxfoundation.org>, Vipin Sharma <vipinsh@google.com>, 
	Vivek Kasireddy <vivek.kasireddy@intel.com>, William Tu <witu@nvidia.com>, 
	Zhu Yanjun <yanjun.zhu@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 24, 2026 at 6:01=E2=80=AFAM Yi Liu <yi.l.liu@intel.com> wrote:
> On 3/24/26 07:57, David Matlack wrote:

> > + * Usage Example
> > + * =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > + *
> > + * VFIO PCI devices can be preserved across a kexec by preserving the =
file
> > + * associated with the device in a LUO session::
> > + *
> > + *   device_fd =3D open("/dev/vfio/devices/X");
>
> /dev/vfio/devices/vfioX

Will fix in v4.

> > + *  * The device file must have been acquired from the VFIO character =
device,
> > + *    not ``VFIO_GROUP_GET_DEVICE_FD``.
>
> how about "The device file descriptor must be obtained by opening the
> VFIO device
> character device (``/dev/vfio/devices/vfioX``), not via
> ``VFIO_GROUP_GET_DEVICE_FD``."?
>
> just be aligned with the below words in vfio.rst.
>
> "Traditionally user acquires a device fd via VFIO_GROUP_GET_DEVICE_FD
> user can now acquire a device fd by directly opening a character device
> /dev/vfio/devices/vfioX"

Thanks for the suggestion. Here is the wording I have for v4:

  *  * The device file being preserved must have been obtained by
opening the
  *    VFIO character device (``/dev/vfio/devices/vfioX``), not via
  *    ``VFIO_GROUP_GET_DEVICE_FD``.

> > +#include <linux/kexec_handover.h>
> >   #include <linux/kho/abi/vfio_pci.h>
> >   #include <linux/liveupdate.h>
> >   #include <linux/errno.h>
> > +#include <linux/vfio.h>
>
> maybe follow alphabet order. errno.h would be moved to the top first.

I will reorder errno.h to be at the top in the previous patch (where
the alphabetical ordering issue is introduced).
