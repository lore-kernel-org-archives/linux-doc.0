Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795182192;
	b=0k166kO6dM9KNx/M5UP3GvXY+TkoeugMjjihyEFx4ZO4hXE9UrDgSj+bPwmPY3mLdxv4
	 BcFiY3e1tjNDDUnNPAZbJrIdp3EDKTazfKeczhdnxTLrRGU4wCYZDJ8vxMqD6XUMiSpE8
	 TaeSxCl00o9XXdAhS5etReUn8WTQYLCfRmK8ArVHBmjY7cptdfoOgTVSB82VC6RN6uhOn
	 L5hHU+WbyrKagB9+nBhnyLzkealnxOvUAvkaH2kot2tx55ys1Uoz6tj4wNRc60UuqtS3L
	 xwiHzvz2IfMp0Pk/NvWvQT4nKXfchEpEkRchKDblUbQQk/dZNSdd8Np6PPBPQeD+r2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795182192;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=VIHQ6P8dkesmxEyOVDs0FjmEXUh38LLL7Zp46x1Oq9Q=;
	b=v5KAwDIr1KU96N7Dm/o3oKMtris/7/RodoloLJMWBMkqF+n/vZYHj3pTGWyc/+3knuRI
	 VaC6M2UFY0ioF26bZddK5H8Sm4sQBa2zRJqWes51Ln4QU4rOlUcf6KeI2PMRdr1SWVW4H
	 G8bLJLk71TVeveRlofd/OsVKDOyW/AtC03JX2hJ/70qyBIUwB7nn3TPCgHKH8T4CJ9Q/b
	 NoM9woG63rLu1ipIAmxM9PDUI7lPobGgAJ8aUwIiyf6YPDM7iMci7kxZeVB5DvzYLyK4i
	 ndi/dDAz9Gy5A6qu+nJG59CunSVetpo9NVRExGGJqpvhdgaEY71svxgguQZvIyMP7tQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Jc5ErK9T;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39553606A32C;
	Fri, 20 Nov 2026 13:43:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Jc5ErK9T
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D99B1F000D1;
	Fri, 20 Nov 2026 13:43:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795182191;
	bh=VIHQ6P8dkesmxEyOVDs0FjmEXUh38LLL7Zp46x1Oq9Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Jc5ErK9T72oX7stoBX8PN/xYjF+JZgc0979IuyIMpz3y+/8bMOvUk2uuB8GXKW4XX
	 OzJojnWHaNnhDm+v/Ufnp3gzHomfsmyKeBAxR43IEagJInwje6wRPqrUNUXf/4DWos
	 6iWBOCfOy+eZ0IeBT58rBdPs15YUunZIPApewCx7m/i7qCe9WLac72TvaZAOpmqcs6
	 C8cpTxfCF6x2ezQHl0vMZRtWM8m9Nn3LCPT75mJDL1S2CFcgguBlLp93FUiou1Bjlq
	 paiJDwVcmnUzdXMSGRBA9mH1yQMZgDhLXi2zRtmnfBdVigsNBY5uvNlJibRVPdJIFg
	 GSUPWTXZs+KQA==
Date: Fri, 20 Nov 2026 13:43:06 +0000
From: Conor Dooley <conor@kernel.org>
To: lv.yating@zte.com.cn
Cc: pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	alex@ghiti.fr, corbet@lwn.net, skhan@linuxfoundation.org,
	rdunlap@infradead.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, liu.qingtao2@zte.com.cn,
	he.yilin@zte.com.cn, ye.zhihao1@zte.com.cn,
	zhang.cheng35@zte.com.cn, hu.shengming@zte.com.cn,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v2 2/2] riscv: hwprobe: Add LeapRise vendor extension?
 framework support
Message-ID: <20261120-various-achiness-6c942b0c4803@spud>
References: <20261120145117988UPrFJYA461pgTds3xOCwH@zte.com.cn>
 <20261120150437672HnkUOWm6mhr5u-3Ha2pJQ@zte.com.cn>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="w2lO8lDKTo8h08Wb"
Content-Disposition: inline
In-Reply-To: <20261120150437672HnkUOWm6mhr5u-3Ha2pJQ@zte.com.cn>

--w2lO8lDKTo8h08Wb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 20, 2026 at 03:04:37PM +0800, lv.yating@zte.com.cn wrote:
> From: Lv Yating <lv.yating@zte.com.cn>
>=20
> Add RISCV_HWPROBE_KEY_VENDOR_EXT_LEAPRISE_0 (key 17) and the
> supporting vendor extension framework entries for Beijing LeapRise
> Technology Co., Ltd.
>=20
> The key is recognized by riscv_hwprobe() and reports an empty
> bitmask for now: no LeapRise vendor extensions are defined yet.
> Recognizing the key allows userspace to distinguish a kernel that
> supports LeapRise vendor extension probing (empty bitmask) from an
> older kernel that does not know the key at all (key set to -1), so
> LeapRise userspace libraries can be prepared ahead of the first
> hardware shipping vendor extensions.

I don't buy this argument really. You kernel will require out of tree
patches to report the extensions for your userspace to do anything with
them, so why can this not wait until then?
Empty bitmask versus an error is a much of a muchness, both mean no
support.

I fear this is being done to reserve a key without actually upstreaming
anything to do with these extensions, which I think sets a bad
precedent. Upstreaming a user (which really should be trivial, unless
all your extensions need kernel support) would assuage that fear.

>=20
> Follow-up patches will register extensions as they are defined.
>=20
> Signed-off-by: Lv Yating <lv.yating@zte.com.cn>
> ---
>  Documentation/arch/riscv/hwprobe.rst          |  4 ++++
>  arch/riscv/Kconfig.vendor                     | 14 +++++++++++++
>  arch/riscv/include/asm/hwprobe.h              |  3 ++-
>  .../include/asm/vendor_extensions/leaprise.h  | 17 ++++++++++++++++
>  .../asm/vendor_extensions/leaprise_hwprobe.h  | 20 +++++++++++++++++++
>  arch/riscv/include/uapi/asm/hwprobe.h         |  1 +
>  arch/riscv/include/uapi/asm/vendor/leaprise.h |  3 +++
>  arch/riscv/kernel/sys_hwprobe.c               |  4 ++++
>  arch/riscv/kernel/vendor_extensions.c         | 10 ++++++++++
>  arch/riscv/kernel/vendor_extensions/Makefile  |  2 ++
>  .../riscv/kernel/vendor_extensions/leaprise.c | 12 +++++++++++
>  .../vendor_extensions/leaprise_hwprobe.c      | 19 ++++++++++++++++++
>  12 files changed, 108 insertions(+), 1 deletion(-)
>  create mode 100644 arch/riscv/include/asm/vendor_extensions/leaprise.h
>  create mode 100644 arch/riscv/include/asm/vendor_extensions/leaprise_hwp=
robe.h
>  create mode 100644 arch/riscv/include/uapi/asm/vendor/leaprise.h
>  create mode 100644 arch/riscv/kernel/vendor_extensions/leaprise.c
>  create mode 100644 arch/riscv/kernel/vendor_extensions/leaprise_hwprobe.c
>=20
> diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/ri=
scv/hwprobe.rst
> index 8454a6ae6fd1..336a2c5b05d9 100644
> --- a/Documentation/arch/riscv/hwprobe.rst
> +++ b/Documentation/arch/riscv/hwprobe.rst
> @@ -431,3 +431,7 @@ The following keys are defined:
>    * :c:macro:`RISCV_HWPROBE_EXT_ZIC64B`: The Zic64b extension is support=
ed,
>      as defined in the RISC-V Profiles specification starting from commit
>      b1d80660 ("Updated to ratified state.")
> +
> +* :c:macro:`RISCV_HWPROBE_KEY_VENDOR_EXT_LEAPRISE_0`: A bitmask containi=
ng the
> +  leaprise vendor extensions that are compatible with the
> +  :c:macro:`RISCV_HWPROBE_BASE_BEHAVIOR_IMA`: base system behavior.
> diff --git a/arch/riscv/Kconfig.vendor b/arch/riscv/Kconfig.vendor
> index 3c1f92e406c3..03af8bc0f903 100644
> --- a/arch/riscv/Kconfig.vendor
> +++ b/arch/riscv/Kconfig.vendor
> @@ -16,6 +16,20 @@ config RISCV_ISA_VENDOR_EXT_ANDES
>  	  If you don't know what to do here, say Y.
>  endmenu
>=20
> +menu "LeapRise"
> +config RISCV_ISA_VENDOR_EXT_LEAPRISE
> +	bool "LeapRise vendor extension support"
> +	select RISCV_ISA_VENDOR_EXT
> +	default y
> +	help
> +	  Say N here to disable detection of and support for all LeapRise vendor
> +	  extensions. Without this option enabled, LeapRise vendor extensions
> +	  will not be detected at boot and their presence not reported to
> +	  userspace.
> +
> +	  If you don't know what to do here, say Y.

This, for example, makes no sense when there are no extensions
detectable in the first place? A bunch of this is dead code without
anything actually using it right now.

Cheers,
Conor.

> +endmenu
> +
>  menu "MIPS"
>  config RISCV_ISA_VENDOR_EXT_MIPS
>  	bool "MIPS vendor extension support"
> diff --git a/arch/riscv/include/asm/hwprobe.h b/arch/riscv/include/asm/hw=
probe.h
> index 9b04377c0f98..e37e5a8afbb4 100644
> --- a/arch/riscv/include/asm/hwprobe.h
> +++ b/arch/riscv/include/asm/hwprobe.h
> @@ -8,7 +8,7 @@
>=20
>  #include <uapi/asm/hwprobe.h>
>=20
> -#define RISCV_HWPROBE_MAX_KEY		16
> +#define RISCV_HWPROBE_MAX_KEY		17
>=20
>  static inline bool riscv_hwprobe_key_is_valid(__s64 key)
>  {
> @@ -25,6 +25,7 @@ static inline bool hwprobe_key_is_bitmask(__s64 key)
>  	case RISCV_HWPROBE_KEY_VENDOR_EXT_THEAD_0:
>  	case RISCV_HWPROBE_KEY_VENDOR_EXT_MIPS_0:
>  	case RISCV_HWPROBE_KEY_VENDOR_EXT_SIFIVE_0:
> +	case RISCV_HWPROBE_KEY_VENDOR_EXT_LEAPRISE_0:
>  		return true;
>  	}
>=20
> diff --git a/arch/riscv/include/asm/vendor_extensions/leaprise.h b/arch/r=
iscv/include/asm/vendor_extensions/leaprise.h
> new file mode 100644
> index 000000000000..0d4ab8f03983
> --- /dev/null
> +++ b/arch/riscv/include/asm/vendor_extensions/leaprise.h
> @@ -0,0 +1,17 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +
> +#ifndef _ASM_RISCV_VENDOR_EXTENSIONS_LEAPRISE_H
> +#define _ASM_RISCV_VENDOR_EXTENSIONS_LEAPRISE_H
> +
> +#include <asm/vendor_extensions.h>
> +#include <linux/types.h>
> +
> +/*
> + * Extension keys should be strictly less than max.
> + * It is safe to increment this when necessary.
> + */
> +#define RISCV_ISA_VENDOR_EXT_MAX_LEAPRISE			32
> +
> +extern struct riscv_isa_vendor_ext_data_list riscv_isa_vendor_ext_list_l=
eaprise;
> +
> +#endif
> diff --git a/arch/riscv/include/asm/vendor_extensions/leaprise_hwprobe.h =
b/arch/riscv/include/asm/vendor_extensions/leaprise_hwprobe.h
> new file mode 100644
> index 000000000000..980402df0095
> --- /dev/null
> +++ b/arch/riscv/include/asm/vendor_extensions/leaprise_hwprobe.h
> @@ -0,0 +1,20 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +
> +#ifndef _ASM_RISCV_VENDOR_EXTENSIONS_LEAPRISE_HWPROBE_H
> +#define _ASM_RISCV_VENDOR_EXTENSIONS_LEAPRISE_HWPROBE_H
> +
> +#include <linux/cpumask.h>
> +
> +#include <uapi/asm/hwprobe.h>
> +
> +#ifdef CONFIG_RISCV_ISA_VENDOR_EXT_LEAPRISE
> +void hwprobe_isa_vendor_ext_leaprise_0(struct riscv_hwprobe *pair, const=
 struct cpumask *cpus);
> +#else
> +static inline void hwprobe_isa_vendor_ext_leaprise_0(struct riscv_hwprob=
e *pair,
> +						   const struct cpumask *cpus)
> +{
> +	pair->value =3D 0;
> +}
> +#endif
> +
> +#endif
> diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/include/u=
api/asm/hwprobe.h
> index 9a121ee3b436..6907ca4648ef 100644
> --- a/arch/riscv/include/uapi/asm/hwprobe.h
> +++ b/arch/riscv/include/uapi/asm/hwprobe.h
> @@ -124,6 +124,7 @@ struct riscv_hwprobe {
>  #define		RISCV_HWPROBE_EXT_ZA64RS	_BITULL(5)
>  #define		RISCV_HWPROBE_EXT_B		_BITULL(6)
>  #define		RISCV_HWPROBE_EXT_ZIC64B	_BITULL(7)
> +#define RISCV_HWPROBE_KEY_VENDOR_EXT_LEAPRISE_0	17
>=20
>  /* Increase RISCV_HWPROBE_MAX_KEY when adding items. */
>=20
> diff --git a/arch/riscv/include/uapi/asm/vendor/leaprise.h b/arch/riscv/i=
nclude/uapi/asm/vendor/leaprise.h
> new file mode 100644
> index 000000000000..9ee13f1ca559
> --- /dev/null
> +++ b/arch/riscv/include/uapi/asm/vendor/leaprise.h
> @@ -0,0 +1,3 @@
> +/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
> +
> +/* LeapRise vendor extensions: none defined yet */
> diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwpr=
obe.c
> index cd7cf272e6e1..e60facabdd86 100644
> --- a/arch/riscv/kernel/sys_hwprobe.c
> +++ b/arch/riscv/kernel/sys_hwprobe.c
> @@ -15,6 +15,7 @@
>  #include <asm/uaccess.h>
>  #include <asm/unistd.h>
>  #include <asm/vector.h>
> +#include <asm/vendor_extensions/leaprise_hwprobe.h>
>  #include <asm/vendor_extensions/mips_hwprobe.h>
>  #include <asm/vendor_extensions/sifive_hwprobe.h>
>  #include <asm/vendor_extensions/thead_hwprobe.h>
> @@ -364,6 +365,9 @@ static void hwprobe_one_pair(struct riscv_hwprobe *pa=
ir,
>  	case RISCV_HWPROBE_KEY_VENDOR_EXT_MIPS_0:
>  		hwprobe_isa_vendor_ext_mips_0(pair, cpus);
>  		break;
> +	case RISCV_HWPROBE_KEY_VENDOR_EXT_LEAPRISE_0:
> +		hwprobe_isa_vendor_ext_leaprise_0(pair, cpus);
> +		break;
>=20
>  	/*
>  	 * For forward compatibility, unknown keys don't fail the whole
> diff --git a/arch/riscv/kernel/vendor_extensions.c b/arch/riscv/kernel/ve=
ndor_extensions.c
> index bb4a75923685..e7372194096e 100644
> --- a/arch/riscv/kernel/vendor_extensions.c
> +++ b/arch/riscv/kernel/vendor_extensions.c
> @@ -6,6 +6,7 @@
>  #include <asm/vendorid_list.h>
>  #include <asm/vendor_extensions.h>
>  #include <asm/vendor_extensions/andes.h>
> +#include <asm/vendor_extensions/leaprise.h>
>  #include <asm/vendor_extensions/mips.h>
>  #include <asm/vendor_extensions/sifive.h>
>  #include <asm/vendor_extensions/thead.h>
> @@ -17,6 +18,9 @@ struct riscv_isa_vendor_ext_data_list *riscv_isa_vendor=
_ext_list[] =3D {
>  #ifdef CONFIG_RISCV_ISA_VENDOR_EXT_ANDES
>  	&riscv_isa_vendor_ext_list_andes,
>  #endif
> +#ifdef CONFIG_RISCV_ISA_VENDOR_EXT_LEAPRISE
> +	&riscv_isa_vendor_ext_list_leaprise,
> +#endif
>  #ifdef CONFIG_RISCV_ISA_VENDOR_EXT_MIPS
>  	&riscv_isa_vendor_ext_list_mips,
>  #endif
> @@ -53,6 +57,12 @@ bool __riscv_isa_vendor_extension_available(int cpu, u=
nsigned long vendor, unsig
>  		cpu_bmap =3D riscv_isa_vendor_ext_list_andes.per_hart_isa_bitmap;
>  		break;
>  	#endif
> +	#ifdef CONFIG_RISCV_ISA_VENDOR_EXT_LEAPRISE
> +	case LEAPRISE_VENDOR_ID:
> +		bmap =3D &riscv_isa_vendor_ext_list_leaprise.all_harts_isa_bitmap;
> +		cpu_bmap =3D riscv_isa_vendor_ext_list_leaprise.per_hart_isa_bitmap;
> +		break;
> +	#endif
>  	#ifdef CONFIG_RISCV_ISA_VENDOR_EXT_MIPS
>  	case MIPS_VENDOR_ID:
>  		bmap =3D &riscv_isa_vendor_ext_list_mips.all_harts_isa_bitmap;
> diff --git a/arch/riscv/kernel/vendor_extensions/Makefile b/arch/riscv/ke=
rnel/vendor_extensions/Makefile
> index bf116c82b6bd..1f76fd4050c7 100644
> --- a/arch/riscv/kernel/vendor_extensions/Makefile
> +++ b/arch/riscv/kernel/vendor_extensions/Makefile
> @@ -1,6 +1,8 @@
>  # SPDX-License-Identifier: GPL-2.0-only
>=20
>  obj-$(CONFIG_RISCV_ISA_VENDOR_EXT_ANDES)	+=3D andes.o
> +obj-$(CONFIG_RISCV_ISA_VENDOR_EXT_LEAPRISE)	+=3D leaprise.o
> +obj-$(CONFIG_RISCV_ISA_VENDOR_EXT_LEAPRISE)	+=3D leaprise_hwprobe.o
>  obj-$(CONFIG_RISCV_ISA_VENDOR_EXT_MIPS)  	+=3D mips.o
>  obj-$(CONFIG_RISCV_ISA_VENDOR_EXT_MIPS)  	+=3D mips_hwprobe.o
>  obj-$(CONFIG_RISCV_ISA_VENDOR_EXT_SIFIVE)	+=3D sifive.o
> diff --git a/arch/riscv/kernel/vendor_extensions/leaprise.c b/arch/riscv/=
kernel/vendor_extensions/leaprise.c
> new file mode 100644
> index 000000000000..bdc2eed288ba
> --- /dev/null
> +++ b/arch/riscv/kernel/vendor_extensions/leaprise.c
> @@ -0,0 +1,12 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +
> +#include <asm/cpufeature.h>
> +#include <asm/vendor_extensions.h>
> +#include <asm/vendor_extensions/leaprise.h>
> +
> +/* LeapRise vendor extensions: none defined yet */
> +
> +struct riscv_isa_vendor_ext_data_list riscv_isa_vendor_ext_list_leaprise=
 =3D {
> +	.ext_data_count =3D 0,
> +	.ext_data =3D NULL,
> +};
> diff --git a/arch/riscv/kernel/vendor_extensions/leaprise_hwprobe.c b/arc=
h/riscv/kernel/vendor_extensions/leaprise_hwprobe.c
> new file mode 100644
> index 000000000000..260a2b38e4d6
> --- /dev/null
> +++ b/arch/riscv/kernel/vendor_extensions/leaprise_hwprobe.c
> @@ -0,0 +1,19 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +
> +#include <asm/vendor_extensions.h>
> +#include <asm/vendor_extensions/leaprise.h>
> +#include <asm/vendor_extensions/leaprise_hwprobe.h>
> +#include <asm/vendor_extensions/vendor_hwprobe.h>
> +
> +#include <linux/cpumask.h>
> +#include <linux/types.h>
> +
> +#include <uapi/asm/hwprobe.h>
> +#include <uapi/asm/vendor/leaprise.h>
> +
> +void hwprobe_isa_vendor_ext_leaprise_0(struct riscv_hwprobe *pair,
> +				   const struct cpumask *cpus)
> +{
> +	/* No LeapRise vendor extensions are defined yet. */
> +	pair->value =3D 0;
> +}
> --=20
> 2.27.0
>=20

--w2lO8lDKTo8h08Wb
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCawBOagAKCRB4tDGHoIJi
0knhAP9LOguClB7nwFXGWd/nmrn5wqCIicxcckRjhUgnHQXYRAEA57IiDA1zjeJ8
hwow30gT5ytRZYMsn9CPchZsHHGi4QI=
=D6Eo
-----END PGP SIGNATURE-----

--w2lO8lDKTo8h08Wb--
