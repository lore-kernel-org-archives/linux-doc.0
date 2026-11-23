Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795396633;
	b=hIbukLg+KwpKdXxMGiM6Vg38nSG9/WgOCQSCdH1ymdZfkgMwMJZwrxabFK+VPDa0xZUI
	 IHNpxkk/uAfPP2z9lue91pfeLD5YFhe6ctln05svyIE4rUtT/NteZ4TPACAohLpl6nIhf
	 P3952gojZBw5Y+zDTqzwHUvaadeWaNBFQLRdo8JkAM65s0Y6jPV4zIjAwUx9xNOJHgYKX
	 ao7AyWz1oQJ1bxuXcctKtuRTXhDA4Rw0dY8Ov1gQEEtWygAMDsLomZZjqMaQHR7FX20BE
	 2bablOz6hNOcCrV7txTx2R8Bve+shpsX6bN3thCHDP47Lhu+IVjVz0mu/VytFcpMrUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795396633;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=7UgZ/UaOfprcYE1+TJLcwuO2nl1zM9v7WpMLhsF+tYU=;
	b=A65iPBjogdHWjoVky4k71imNey7TLCgTvUQbDwfRE8d6QlcRjMxoQdABhMDkEM49bd1t
	 X8M61tiLYfrIJT5c9VRx24QbDoU5BqeAnjmbbTGoKJm7LxgN2pZbpSKeWqRqibp501vhT
	 6UkV0T9aVcGiTzB8JIS223SvH7hLWruDugpiZb6Tsvu+Kp3HXQk4N01KxbxzyNI9mdGaw
	 huOoeb699jqOraEpQeHjN+MJq5txuHJkV2RaZxLTTY8G8o/YGYcjOAPTS7JGt84nE+NUy
	 bH49W4ivsaYvYD+7SSOEYFUKFs6xaUSavn5yozoIm8xpNDaTZjqNrmf0Q7HcJxwMByA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=D3oiXrb7;
	arc=none smtp.remote-ip=74.125.82.49
Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A701606A320
	for <linux-doc@vger.kernel.org>; Mon, 23 Nov 2026 01:17:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7A701606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=D3oiXrb7
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-1b546061d58so6280282c88.1
        for <linux-doc@vger.kernel.org>; Sun, 22 Nov 2026 17:17:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795396632; x=1796001432; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7UgZ/UaOfprcYE1+TJLcwuO2nl1zM9v7WpMLhsF+tYU=;
        b=D3oiXrb7ZmV6BWAyg9ScNT/pB4kPE7fyRC3Fy7kYNpwrjx3he5btiKZvcUhIe41p/G
         JhAEMuGmmzQPQd4cLdMi6Pji+ComVY+E5+WpVWCvDkb/KE2VjWuqoPzDYDw+vNYAoZHm
         vh9EZrh06QHbkwflnvIKtYD8TWxfbCB9hquDR+zecgKzlth6KSPemD9z+BExFCcES+5c
         mERpZRe01ozEDuHbKLe1TRWij5M38D8FHyCfRGJq9CB6LPzvK6hIlkzov7jmAe2JvRdQ
         +P4NMcO4Vox5Eh/HgYXXkOjWQ/n2T3ZWjhmWkYnLVc5+4WbXYzFcr3PblxFCJhAlcePW
         OtPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795396632; x=1796001432;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7UgZ/UaOfprcYE1+TJLcwuO2nl1zM9v7WpMLhsF+tYU=;
        b=YFX0MGd2/wqhD/xiCqWWAUoFZRL287Yr8E0Y10mAjJlUG1/MYcm22nAkTFVptZpD4/
         ZdyKorEgdFChAluZWRzR5i1fntAnsukHaXjDR7HsOuYypE6heM5dPHQKbvQZUzumCo5a
         gs7tTQY3Vvr+231zQcACjqbkeGP+HO240wgnziI+5FUt2hkGL1fClHgZ411cdM8J9vn2
         s2ZVEvLliGfayZKACqNIQiFpc7fHTEHR1qSYytwSx3BTX6s9uzMrfxQTwgoiUhagPm8W
         MEDYXUQcxxQVR5w7ozD2R5dIKc1BW9mnvhWnAHzUBhPH0mKOs06vvde0lEUvgjokq8jW
         3f5g==
X-Forwarded-Encrypted: i=1; AL+hErHG+o4gUeNigQUN+Ou3pFTKrfj+Vymq0ZskX/vnza+SBWlBfDwRnfbwXubGu+L6JK56N6qkFu3BKS4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/SsXNYMbhHAcJxDNamcNVbbyDDEFBhh0dHFD2aktm2loTmURvZ
	kEz4QDChQNoD5NQA6MDUTn328jcP727W5dFUBoysXadiwxBdZvHrtry5
X-Gm-Gg: AZFdTZeuuE91uFZP+mF6rOEb9SEMMhoL5W8zQrb3m7KuARIyEvr/vNVlKsIikpy7XDO
	iKQVc85swLa1/QmzBgkitQBS6nadyiwhNQX+9CXiwCnD9OHSy3w63pQOsKHutmA4PCG2PcuJueq
	AxRl+Yn+7vK+AOzd1pcR8jYR6I1ObAZik7cmi5HhmukAi9UkO+/prWz8/YK3zcnQ1uuSIaHV4AU
	iWiQbzi7bZ8AfGiuj/nY3bCE7pukuVE8bLgBrwuJSxc5GtLypmdCGjmy0XsHtZ1Qsy4wuPcZYvr
	1yXr58i2QpQFuE4CxVsdn+usKDMwMxiR3qOCyOYgoriXT/PAO+uPe+fEg4G7xgf3HDdSyN+AHNu
	uycVRN7oPmr9P8t0UuqXBcvkGcS1Z5bABMNFCjMEFgc6Dwe3o94COjw+ujWqP4L51p/cpuG5yxS
	yBstRFgEYSwK7D2voynx45rP1RjsYvm9EQV2nxGNjsMUucuBjwWqvm+azjoJsytA7jPw++WIBQv
	ulrjTHegJ2BSE581avV/ISRGCG1AENXCtQMDkiGoo7TqKQ3mUGuj/smKHfXiEX03kCBSyxc8ZSN
	+SpVms7u2u/q4VYVNbKSTWncukmjHhJVZlh3IH5Q/+uRMqeVP94OJqqU7IQZEiZ8rR0fk9w=
X-Received: by 2002:a05:7022:4181:b0:1b0:4272:4282 with SMTP id a92af1059eb24-1b5568ba440mr16998658c88.17.1795396632411;
        Sun, 22 Nov 2026 17:17:12 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:f002:4621:aeeb:e0e7])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5566c3052sm23764321c88.1.2026.11.22.17.17.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 17:17:11 -0800 (PST)
Date: Sun, 22 Nov 2026 17:17:07 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Henk Vergonet <Henk.Vergonet@gmail.com>, 
	Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <chleroy@kernel.org>
Cc: Oliver Neukum <oneukum@suse.com>, Martin Diehl <m-diehl@gmx.de>, 
	"Alfred E . Heggestad" <aeh@db.org>, Thomas Reitmayr <treitmayr@devbase.at>, 
	Slawomir Stepien <sst@poczta.fm>, Jie Wang <jie.wang@intel.com>, 
	Manuel Ebner <manuelebnerli@mailbox.org>, Randy Dunlap <rdunlap@infradead.org>, usbb2k-api-dev@nongnu.org, 
	linux-input@vger.kernel.org, linux-usb@vger.kernel.org, linux-doc@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] Input: remove obsolete yealink USB phone driver
Message-ID: <awOT9WG0ZdNkIm69@google.com>
References: <20261111215723.3802209-1-dmitry.torokhov@gmail.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261111215723.3802209-1-dmitry.torokhov@gmail.com>

On Wed, Nov 11, 2026 at 01:57:21PM -0800, Dmitry Torokhov wrote:
> This short series removes the obsolete yealink driver for the mid-2000s
> Yealink USB-P1K (0x6993:0xb001) USB 1.1 Skype/VoIP telephone handset
> and drops its module selection from ppc6xx_defconfig.
> 
> The hardware relied on dedicated userspace bridge utilities (such as
> usbb2k-api / kb2kskype for the defunct legacy Skype desktop API, or
> yeaphone for liblinphone) to drive its keypad, segmented LCD, and tones
> through custom sysfs attributes. That userspace ecosystem has been
> unmaintained for over 15 years, and the driver itself has seen no
> functional updates, hardware testing, or new device IDs since 2008
> while continuing to attract syzbot USB fuzzing reports and drive-by
> cleanup patches.
> 
> Thanks.
> 
> Dmitry Torokhov (2):
>   powerpc/configs: drop CONFIG_INPUT_YEALINK from ppc6xx_defconfig
>   Input: yealink - remove driver

Applied the lot.

-- 
Dmitry
