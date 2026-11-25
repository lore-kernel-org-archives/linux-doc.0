Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795634657;
	b=osJY0ik7P2rBPBTG1iSHqV2N0b9+q6ktX9TrowJbUEnPVg5V9yd4gh5CRMtn7RLtAp17
	 o/JXKXwdIYWan/SyWVcu04eYv7RCypbm3wWlqhfAfoKHy5+jfTTlz3IgAkh20TZ3yTh/4
	 ZFNzUqTzoliIBsaS6OsV401obvARVyRyxM8HRbfKL+R+AZ+DMBfw7HZx8VY05D9ZyVYGb
	 1FZheul5R2EdWZPA6LEBsJLYxJ1NwPfxK9X2tEzpOTLK7FPbiPifu3ztkqjdEUVW6+p0Y
	 Lymlh1VFxjLJjK7DBkcYK1cYmise2T9D8BQsoi7MvxpasB9cLtVT9Wci8sqaKbqRV2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795634657;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=N55gjPKFtoyQEkpZ+mulBFdiGvAn3buEDUMJWwRWBLA=;
	b=HZhDxmbWE1sfxvXMvaID+lMcMA++ozQvED/4y5tF7W5LpGE5Xu7fsrnTDcWeWDytbQmu
	 dDShD184n3aT1rxJz8nDzaTEk5FIiIDPgKtoYjwWKOWOD3l/5vbQM46+vxKB+9yVQ2Sdv
	 Pl1uHQ9Tl52/6fDMYxhy318gl5OwmPLX+TKKoYWUZqI3Z6lfFSPsVUhCz5kuDp398tjrZ
	 xg9R5yiWc1rEmTiUE6ojEIMRSixhcQi05DXOXOUKDSj1f89+NNXbdQrGdmZfUzuQ0eH6S
	 Bk3CHNCJQaUJHJT8h2GtmrZOkzSzxmUY+2nIgqiqC/b0Ji/1kDZxGTJkmtZSibLVtPA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=oCGp0YcP;
	arc=none smtp.remote-ip=209.85.210.169
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47F29606A33F
	for <linux-doc@vger.kernel.org>; Wed, 25 Nov 2026 19:24:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 47F29606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=oCGp0YcP
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-8ca6a12efd9so2079929b3a.1
        for <linux-doc@vger.kernel.org>; Wed, 25 Nov 2026 11:24:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795634656; x=1796239456; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=N55gjPKFtoyQEkpZ+mulBFdiGvAn3buEDUMJWwRWBLA=;
        b=oCGp0YcPvUHi0mkvNJzYjDzOqfg0gHs6ETaxOw6iHkwvvSF4tYjvsaGjV95aPOdQou
         dmAQRQLqlhN3jiNznQ2pOjzWEW/G2t/wbqDp6HuYWHKE0XMdFq9FvURpTwt3LZNjNOiI
         XwXkQTulincExFaiUQD3ExWzaLJgh5f90EbERJvf+q5dn2l8/In7F6eLtSCHApz045QY
         AGa84JuoW96MF2RwV40xmLUxu2P+/+qEsF28w8+r12XoJqwGJeCssnVaJxVXWHGiUXGn
         ECyAOK186fme41Oi47Fv+x2wiNPNPpqw/d4+KhlG9F3LQdPCn4i+tof3zaLzJI7SrBz8
         moaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795634656; x=1796239456;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N55gjPKFtoyQEkpZ+mulBFdiGvAn3buEDUMJWwRWBLA=;
        b=WUx1Ytgfnq1CQZhAYHaVZ5hZmxiBju0BAxdz6GNOkwJR59JQ8o3XHmS04xilXnJFCh
         ARTk5bPCI1N/dGi9XnH2Lx4WH9mEVoVKbwWWVodQBhbmybb89zRPKmlp3/Lxz2jhQPNK
         FRYPqHTwN0x8x//C16YYg2Gx9EU2Tnjk8E4igea2/nfcgwqt460l++3Pb9x0ZfRx4FED
         w08+d55kBxquUeooNikKp+pl8nm1AcBXJv+XBVLaofkIZgdEStytmEfaAvZAbu8BgUHu
         u/eP/UKHuQkvvrXT1pDHvDEynB9hZw+5Lu4ky3OXnkTxCmcn6/ydssNmS+Is/pJMmxkX
         OQfg==
X-Forwarded-Encrypted: i=1; AL+hErEFXuxFkbrdgIZRCM5BY/aWS7HfgM/wogCKr8GFWkTQ1I4uRopeMDRJN/v4v6yMStxumN4oakzUWJk=@vger.kernel.org
X-Gm-Message-State: APuU4Z+cH1A9pLnuLMXYE3N+rrHZoau0zcBhL25Jv8zE6W+FI8FmgMVD
	E6jvoVoOPecP5RafZUSe0Bc+G67K8v/prvAJIV9Y2gt4lJgBnPZAGXpJODfGo4lPcg==
X-Gm-Gg: AZFdTZfGj7zPJ1nlb8vKe/94PZ5UaQHKarBrKJ3YQS0eFFM1kfjeNXM4wiFWLSsk/t1
	aV0JLoPq5Gaoc8b5bPBkLFiNC0MdY8X6OjkZdJnXVxJ2nqiIYY7m1a7M4CrCskA4J+m2LZ+MDi9
	UnOiNE6K4PCGxNMYzxECdsd7Vw9ggMxwUYjj6ufPB57pmOQeI4tfDA5bli+lls5IxnvbBzIIfb1
	oteN1hfliCf2gwOi2Y1Uwf0/YbCP425R4+hRaN6yvngYfZHXNLaG3eHgwBVwLvuuw/Z1Lvfgntg
	T4n4kgzcXy8GnDYAbomgafZSzyo1HWVrnbz4d9hCEeBRqHhEhyWUnUAlqS8yVJy4xRM9FgLk5LH
	hcqMFW9B+54raGQcrkRcnC9bo+VM9LyzJ01qDfTzaeoG3eQ6/pnNJEzrmQ3pi095i2VOvzQMIAW
	7/wOtbB3YW0sqqre0rJVivvr7DHfk7rvEoq4VRyIBeJIoh5hinh2zUoLrSSu4KCGhl7wEIMfLxv
	NWMRewh9+r5ruhtjfdDjpvcAhD8vd3BGWDtm1vqt9clt25cj1hlJB/rYBU/fgxH2P1Jkp2noE9P
	Kp0e35Ol2EFFHnZCP1ZfmqL/OwS/8G1lH6z8YRkyC0GyXaSwo3TKphB4IQh3G4+DsRpvYy2Vzfz
	nuWsw0jLelYrIvym1hqZ0YpXjFVYLMi0Z9M+90/bokpCef/GHWni/RW1YiKuXZ9DAAs7iyj2h/Z
	SknKIh+rTjNw==
X-Received: by 2002:a05:6a00:a908:b0:886:773d:a6a with SMTP id d2e1a72fcca58-8c87c199463mr15925448b3a.28.1795634654761;
        Wed, 25 Nov 2026 11:24:14 -0800 (PST)
Received: from google.com (196.126.197.35.bc.googleusercontent.com. [35.197.126.196])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c87077bc47sm9717494b3a.6.2026.11.25.11.24.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 11:24:13 -0800 (PST)
Date: Wed, 25 Nov 2026 11:24:10 -0800
From: Benson Leung <bleung@google.com>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org,
	David Hildenbrand <david@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Jason Gunthorpe <jgg@nvidia.com>,
	Leon Romanovsky <leonro@nvidia.com>, linux-mm@kvack.org,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org, Jens Axboe <axboe@kernel.dk>,
	linux-block@vger.kernel.org, Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	linux-bluetooth@vger.kernel.org,
	Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
	Jason Wang <jasowangio@gmail.com>, David Heidelberg <david@ixit.cz>,
	oe-linux-nfc@lists.linux.dev, Chas Williams <3chas3@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org, Helge Deller <deller@gmx.de>,
	linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
	MPT-FusionLinux.pdl@broadcom.com,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
	"Martin K. Petersen" <mkp@kernel.org>, linux-scsi@vger.kernel.org,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Zhihao Cheng <chengzhihao1@huawei.com>,
	linux-mtd@lists.infradead.org, Neill Kapron <nkapron@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org, Hans de Goede <hansg@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>,
	Sean Christopherson <seanjc@google.com>,
	Paolo Bonzini <pbonzini@redhat.com>, kvm@vger.kernel.org,
	virtualization@lists.linux.dev, Jan Kara <jack@suse.cz>,
	linux-fsdevel@vger.kernel.org, Theodore Ts'o <tytso@mit.edu>,
	linux-ext4@vger.kernel.org, Mike Marshall <hubcap@omnibond.com>,
	devel@lists.orangefs.org, Paulo Alcantara <pc@manguebit.org>,
	Namjae Jeon <linkinjeon@kernel.org>, linux-cifs@vger.kernel.org,
	Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>,
	linux-f2fs-devel@lists.sourceforge.net,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Benson Leung <bleung@chromium.org>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Alex Deucher <alexander.deucher@amd.com>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	amd-gfx@lists.freedesktop.org,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Tvrtko Ursulin <tursulin@ursulin.net>,
	intel-gfx@lists.freedesktop.org,
	Matthew Brost <matthew.brost@intel.com>,
	Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
	intel-xe@lists.freedesktop.org
Subject: Re: [PATCH v3 11/12] docs: ioctl-number: update platform entries
Message-ID: <awc12oWB5WDJi8XZ@google.com>
References: <20261125061340.3402300-1-rdunlap@infradead.org>
 <20261125061340.3402300-12-rdunlap@infradead.org>
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
	protocol="application/pgp-signature"; boundary="Kk3dCghKBQNrocaf"
Content-Disposition: inline
In-Reply-To: <20261125061340.3402300-12-rdunlap@infradead.org>


--Kk3dCghKBQNrocaf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 24, 2026 at 10:13:38PM -0800, Randy Dunlap wrote:
> Update the list of platform/ files where ioctls are defined and update
> the ranges of function numbers that are used.
>=20
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Acked-by: Tzung-Bi Shih <tzungbi@kernel.org> # cros_ec

For cros_ec as well:

Reviewed-by: Benson Leung <bleung@chromium.org>


> ---
> v2: no change
> v3: rebase
>=20
> [Since having multiple maintainers trying to merge these would
> cause some conflicts, it would be more manageable for Jon to
> take all of these through the docs-next tree.]
>=20
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: Shuah Khan <skhan@linuxfoundation.org>
> Cc: linux-doc@vger.kernel.org
> Cc: Florian Fainelli <florian.fainelli@broadcom.com>
> Cc: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadc=
om.com>
> Cc: Tzung-Bi Shih <tzungbi@kernel.org>
> Cc: Benson Leung <bleung@chromium.org>
>=20
>  Documentation/userspace-api/ioctl/ioctl-number.rst |    3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> --- linux-next-20261123.orig/Documentation/userspace-api/ioctl/ioctl-numb=
er.rst
> +++ linux-next-20261123/Documentation/userspace-api/ioctl/ioctl-number.rst
> @@ -434,6 +434,7 @@ Code  Seq#    Include File
>  0xBA  00-0F  uapi/linux/liveupdate.h                                   P=
asha Tatashin
>                                                                         <=
mailto:pasha.tatashin@soleen.com>
>  0xC0  00-0F  linux/usb/iowarrior.h
> +0xC4  00-1F  platform/raspberrypi/vchiq-interface/vchiq_ioctl.h
>  0xCA  00-0F  uapi/misc/cxl.h                                           D=
ead since 6.15
>  0xCA  10-2F  uapi/misc/ocxl.h
>  0xCA  80-BF  uapi/scsi/cxlflash_ioctl.h                                D=
ead since 6.15
> @@ -446,7 +447,7 @@ Code  Seq#    Include File
>  0xDD  00-3F                                                            Z=
FCP device driver see drivers/s390/scsi/
>                                                                         <=
mailto:aherrman@de.ibm.com>
>  0xE5  00-3F  linux/fuse.h
> -0xEC  00-01  linux/platform_data/cros_ec_chardev.h                     C=
hromeOS EC driver
> +0xEC  00-02  linux/platform_data/cros_ec_chardev.h                     C=
hromeOS EC driver
>  0xEE  00-09  uapi/linux/pfrut.h                                        P=
latform Firmware Runtime Update and Telemetry
>  0xEF  00-0F  uapi/linux/ntfs.h                                         N=
TFS
>  0xF3  00-3F  drivers/usb/misc/sisusbvga/sisusb.h                       s=
isfb

--Kk3dCghKBQNrocaf
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQQCtZK6p/AktxXfkOlzbaomhzOwwgUCawc12gAKCRBzbaomhzOw
wuvSAP9FFr45oXAv5Psc3n5xsSYyPFouusI/XwRnWy3tYxQspAD+KIeOTWQfcOeC
TWeqyAANog5rg68r7xNPxeH8I/R6xAQ=
=Fk2v
-----END PGP SIGNATURE-----

--Kk3dCghKBQNrocaf--
