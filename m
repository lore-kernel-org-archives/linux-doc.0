Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794872519;
	b=U4f0oRuQi8gJxenFJAmoNE5CgBImhRDijX5eGA+t7bVL6V/vY/SlGfVe/XTwem6P7Srh
	 m35b2VdPH0ogcTscmwZ2Ls7fplAQ8f9tSsRCSSfA4SMH8kHWeUguJK4k8Ii/BzdS6Q3K2
	 ry0jllUrJ5la3G/IVdfM6NZOz4/pJoIlF4rOGPA1/broQ7cSe4ymOmiAQKwsZL+f7aGag
	 wmgujsOx9fNBxpraRnpbNmsBkhAlnVEzYhaw7u05ZqN3XFTtA+RqppYhCdxCW1+abOOmo
	 fayU6Ixllmq4M7BJ4tPn8Tfl8C+vq2eUGcd8YS6GjpI3wBSWoewg9zo7D1i4PwQ1gIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794872519;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:Autocrypt:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=LfK0P8wpQhjKU73faMZJ7aS0+N+WOnHsL569QrZcsKU=;
	b=gE7A59NJJffnB2kPbAtGeCf1zXxK2X0xLHl97ts3AhHCxp7Rpm+q9Dunnpt3zxi+C5vG
	 o7uYj6gMyJhwPjHP0K1AWrcv0bfFi5uU9liZXAhjomLq5djtyJAZJodD8OwOuHxYPFne5
	 vHWG3vkMjX3HSClcTS6WwkNufzz25325lr3xjc6fp19Bzs3lJll2OuH40eC4trOyqXoCn
	 G15i2aeOu0ki1UcRTNET3HYBAC6i4UY9zPcjeFGPd136AeHcmuAkPXF+dKhoqdVwPgmV/
	 oVaDgYUFhRfM1CRXAu0VOXabVIpoj1qroKgCDeb0LxmlkY0l4DD2UCfi2YtSF+/MHgA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=JdtTDxg2;
	arc=none smtp.remote-ip=209.85.208.42
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD28B606A31C
	for <linux-doc@vger.kernel.org>; Mon, 16 Nov 2026 23:41:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CD28B606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=JdtTDxg2
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6b2237b596cso9041590a12.0
        for <linux-doc@vger.kernel.org>; Mon, 16 Nov 2026 15:41:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1794872516; x=1795477316; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LfK0P8wpQhjKU73faMZJ7aS0+N+WOnHsL569QrZcsKU=;
        b=JdtTDxg2OshVl5HbGUg/g/K8tqtpzSXsRw+dWKvLKKXmTrDoJenmWSadRI/ljuJccf
         7wk0mZn38OFN2LDLLbyGrlHWWq6f5pwNt2qbKdRXPXUQMeSDZjij66Y9MaJPPfn34Nrm
         n2hV7TprcOLQ34PZpxKvGrWxA2Qjg+J+mm+F7BysHJoYt0ZpHVZ0VRkSH1EH3JJ42tde
         7P2cLOnRkwBjiOlI28fM/z9y1dUJVzdkS5+UnzrzIryL6R8xGgDH4deKFO+FPqqo5759
         MfozIS3U46rx+lkCDA8uTpidJQmKhl3cp2CAliW7D+h+kNkntoC6DR728pbgrgLn+jDF
         4WTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794872516; x=1795477316;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LfK0P8wpQhjKU73faMZJ7aS0+N+WOnHsL569QrZcsKU=;
        b=vj62NASkPMl3fLmAdd1cxiIC9q+elPtyr8v1JmuCSaCImIi3zR/+gbdFO2TvMwxG1i
         XfIgcrcpweOjkRtpsB7Doiyuw9492Ke+X84UOUmreXDN150hkeR820OwExIsl83MjC5Y
         4h0mCO2T4PJ7AO7IiB3qsqQB1a8+RkVvSduHX7ObHayLTOpsepTp8LmDQ9uLOBZ1UKBH
         z5TM2tTCwY/GA2wh5QbQ3xf2WhVZS/KjHUraWZQZ6xVfja3x8dqxblTVgOIU7ZoqszjN
         5ABvo4y5GislxGGTyyxOAiYQ8TwRhig/QC02QDadIiHHE1oxT+qPTjk98X38altr9/JI
         YOjA==
X-Forwarded-Encrypted: i=1; AL+hErEix9qWCtnjw1xZLGFrCyIVEEnGI2ioQfsp6dJyvlOPQUX1WusTJFVKSYFkuZyYmUR4NZZ9vn2e6Wo=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Ana6O3FdWWFYpUf3+vLhPPv/rpmfcJ9F0Et9teAT9GRVjoMmn
	Zi7ajzKtBgIfXZl0/v9ijUZzq92XzT/kULKVffJbTO7YcRNU/i3ymx7SP+mCTIUOj7I=
X-Gm-Gg: AYBFou28t/1vfd/dJAOao2STpr09BiHTesu/5JnCMHhpoRjGQjUOlx4WhgSNc0eqC/L
	RzgZiNkPBCOW9Nm/YtdmLQUvX7K8oic/8Or2rlfBqnHYbmY/of8bKurbb23yiPW0V6OaaDZELR5
	+2dLVYVGcAdNDKl3q4vvGEvaOAYLSWW2R4N0veKa2wsZnOEh3EJfOB8jNE3aovLp2ZHOMjliGuR
	C1nYOoc5Nc7a5AsKg54o2Rhv8L1zuaEohiqFubnWMKIVKTlNh5bTzLo+LNfh1UAcdALoDal3zHT
	1sDu0E8ZET7N5eyUKQHTAfXQHoJUeJYCVyZcohOaMvRi3E+otm96Gkyrekv74ijln1djYbcN4Yx
	LE5wrAJpaeSZxW6leRVpukC1bZmqrHxgeBCQqJFFzlVVni3R35+7O4tj21D5HL1SaNp/4IxdeoK
	TptmmXKbcpTf/7+dlmc99gcJie1syZQxiDK8Ff0nMibQrY3z1qgkCFCLwKRHWQViVCMATnG+9K/
	nt5M6p4etp8OO11RsXFIGFkrb6jlh4IG2UwaKN+xHP5JRqcga86SBF9kwFDec7AWjlXqAqKOFx6
	rBn+DYUFKnTiYTutFEwkVX6FQkNRpdGTT1g7Gnng3lIS
X-Received: by 2002:a17:907:3e13:b0:c2e:3ed7:7db4 with SMTP id a640c23a62f3a-c5096340feamr1038815166b.23.1794872516213;
        Mon, 16 Nov 2026 15:41:56 -0800 (PST)
Received: from [172.16.0.229] ([159.196.52.54])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3ac2550e1sm1103294a91.3.2026.11.16.15.41.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Nov 2026 15:41:53 -0800 (PST)
Message-ID: <fc1f9f58-71ad-410e-bf03-8b27e607ab76@suse.com>
Date: Tue, 17 Nov 2026 10:11:46 +1030
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/8] btrfs: assemble a multi-device root filesystem
 without an initrd
To: Ismael Luceno <ismael@iodev.co.uk>, linux-kernel@vger.kernel.org,
 linux-btrfs@vger.kernel.org
Cc: David Sterba <dsterba@suse.com>, Chris Mason <mason@kernel.org>,
 Christian Brauner <brauner@kernel.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>,
 linux-fsdevel@vger.kernel.org, linux-doc@vger.kernel.org
References: <20261116224316.11237-10-ismael@iodev.co.uk>
Content-Language: en-US
From: Qu Wenruo <wqu@suse.com>
Autocrypt: addr=wqu@suse.com; keydata=
 xsBNBFnVga8BCACyhFP3ExcTIuB73jDIBA/vSoYcTyysFQzPvez64TUSCv1SgXEByR7fju3o
 8RfaWuHCnkkea5luuTZMqfgTXrun2dqNVYDNOV6RIVrc4YuG20yhC1epnV55fJCThqij0MRL
 1NxPKXIlEdHvN0Kov3CtWA+R1iNN0RCeVun7rmOrrjBK573aWC5sgP7YsBOLK79H3tmUtz6b
 9Imuj0ZyEsa76Xg9PX9Hn2myKj1hfWGS+5og9Va4hrwQC8ipjXik6NKR5GDV+hOZkktU81G5
 gkQtGB9jOAYRs86QG/b7PtIlbd3+pppT0gaS+wvwMs8cuNG+Pu6KO1oC4jgdseFLu7NpABEB
 AAHNGFF1IFdlbnJ1byA8d3F1QHN1c2UuY29tPsLAlAQTAQgAPgIbAwULCQgHAgYVCAkKCwIE
 FgIDAQIeAQIXgBYhBC3fcuWlpVuonapC4cI9kfOhJf6oBQJq3ujyBQkUpLw5AAoJEMI9kfOh
 Jf6o8OIH/0mqW+TQM4m2x3hCsnK+oB4yJH1qnGvIhFF/Lhs48wI02sGh6/4aA0hkCDfd9LHQ
 +ci4FUepZ9y4VS01+oIExbg/8ytzGYTzLtb44jK2GBOBVSJkMiha6jp22XFt7WUkT/tvbreu
 WWdGsaJIRQaZChy7xsMI8lqQ2WdmluZJ4LT0wD3l/l6QU1ZseMGySebdY9sVOQEOJNV7Qj92
 /KOAFNmeZshV/qDI8Iw1RTs6TvLqCcqmlZLCmJkYSVhT1RonWRren8xIRcFEgMe004IDnt7V
 qdQhk/nhTS9x9MBAhMRl0TTE1VKDLvVALsud3iZLrmmtYvwPApzGJk052f0m28vOwE0EWdWB
 rwEIAKpT62HgSzL9zwGe+WIUCMB+nOEjXAfvoUPUwk+YCEDcOdfkkM5FyBoJs8TCEuPXGXBO
 Cl5P5B8OYYnkHkGWutAVlUTV8KESOIm/KJIA7jJA+Ss9VhMjtePfgWexw+P8itFRSRrrwyUf
 E+0WcAevblUi45LjWWZgpg3A80tHP0iToOZ5MbdYk7YFBE29cDSleskfV80ZKxFv6koQocq0
 vXzTfHvXNDELAuH7Ms/WJcdUzmPyBf3Oq6mKBBH8J6XZc9LjjNZwNbyvsHSrV5bgmu/THX2n
 g/3be+iqf6OggCiy3I1NSMJ5KtR0q2H2Nx2Vqb1fYPOID8McMV9Ll6rh8S8AEQEAAcLAfAQY
 AQgAJgIbDBYhBC3fcuWlpVuonapC4cI9kfOhJf6oBQJq3ukKBQkUzDspAAoJEMI9kfOhJf6o
 SNsH/1ysUWOKmzY0rGS3ZdS61QgqMGhSWD/EJ4UiPw+xO4l4+GtX0fOAqxqsmBKqje3vyhBa
 Z5o/1Y+gNiN+E6RBcSz4b1TAd78sQ2bvT5DWOvBjeeVxHdiuQMIn4S8xk5ZpySBw5ifjoiuL
 0M33UVtJOzM8yfAeL+d/Rp4leJw72SutjkLyZTG/gJIp4pJGD/kFHn24OLL0IxEcO0gOekNZ
 os5e1R6jAJ2ILk7+MDnvU8wXHcCiVzuDhJLI1tih1uUIE50muHQJWbYuVBbdJeu8WlIDDssx
 UOCxLylNG3gDXV5MhLubPTOpp9OiFc/XC37nvkgEcrlmlOFBv4/NJCbECpo=
In-Reply-To: <20261116224316.11237-10-ismael@iodev.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



在 2026/11/17 09:13, Ismael Luceno 写道:
> A multi-device btrfs root filesystem is normally assembled by the device
> scanner that an initrd runs before mounting the root.

What is the problem here?

Is generating an initramfs really that complex?

Multi-device filesystems/storage solution requires initramfs to do the 
scan, no matter if it's btrfs or device-mapper, it's already the common 
knowledge.

I just see no strong reasons to do this at all.

And Sashiko is already reporting over 10 high level problems, which is 
not a good sign either.
>  Without an initrd
> nothing runs that scanner, so the root mount names a single device and
> the rest of the array is left out.
> 
> This series lets btrfs assemble such a root filesystem in the kernel:
> 
>    * mount devtmpfs on the initial root before the root filesystem, so
>      device nodes exist to open the other devices by name (init);
>    * let a filesystem tell whether it is mounting the root device and read
>      rootwait, and resolve root=UUID=/root=LABEL= values that name the
>      filesystem rather than a partition (init/VFS);
>    * scan all block devices for the remaining members of a btrfs root
>      filesystem, and wait for all of them to appear before mounting.
> 
> The scan and wait are gated on CONFIG_BTRFS_ROOT_SCAN (default y) and
> only act on the root mount when the user asked for it with rootwait, so
> non-root mounts and systems without the option are unchanged.
> 
> 
> Ismael Luceno (8):
>    btrfs: add config options for the root device scan
>    init: mount devtmpfs before the root filesystem
>    init: let filesystems ask whether they are mounting the root device
>    btrfs: add a helper to scan all block devices
>    btrfs: wait for the root filesystem to have all its devices
>    Documentation: btrfs: document waiting for the root filesystem devices
>    init: let a filesystem resolve a root device by UUID or label
>    btrfs: resolve root=UUID= and root=LABEL=
> 
>   Documentation/filesystems/btrfs.rst |  31 +++++
>   fs/btrfs/Kconfig                    |  25 ++++
>   fs/btrfs/super.c                    | 165 +++++++++++++++++++++++
>   fs/btrfs/volumes.c                  | 196 ++++++++++++++++++++++++++++
>   fs/btrfs/volumes.h                  |  25 ++++
>   fs/filesystems.c                    |  37 ++++++
>   include/linux/fs.h                  |  10 ++
>   include/linux/root_dev.h            |  14 ++
>   init/do_mounts.c                    |  51 +++++++-
>   9 files changed, 553 insertions(+), 1 deletion(-)

