Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794273634;
	b=5ny2vlnKW5Ra/hHeD9bSdKx7CgjTB9Pz1wOwRoPLr1fY7OfVQj8qXFKfbztGJ+rAkrwP
	 C6CkizYEz0tvyyY1aDFYPzS/RZCZvzEhlqocYBS8g8h6wU4xSSPll4Ht0Ew0SHurVFJOc
	 H8WIdEUUMpieVNgxuW8HLKYRGWGG3QHivV1596jAqZSiQbE1ETyQtEyZtSv/KMOgAMIfx
	 dW+WYGJICvAltyhr2SZxRgIXhL2iOQE8lEiHiksv/iqWJ8AZEf1OJrC/YuZjl6k1oG4Vc
	 CSUqZsJfpXyXzic653ZcXney9/WlT1qeXI0ItjqkOSFcYm7/z3+bJY1WSxvg9qhVGEA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794273634;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=m2qXctBTC0OPADf0V2KkMb6r2GA0JgabIuFAMe6ERzQ=;
	b=n+0Bjsy5CneEcc6O8xw0pyfD5LqkTtymh/YVD1LIbuhGgyxuTpgZmWajzWEK6XH/7a77
	 fgytenB+VTJ4OP/J5dzV8CdPl2qxWAWDZNfgGrikG+hDKSfmn3FMjpNd+Dfe2qMo27RGC
	 gMAMCsbyA/2UUgUCtHsOclsKnQsVTWtkF46aHxwcl9cLDNwkfnIJBVwXP0g0f2ckwcOMD
	 BXTKtgTrs7oELefucPNo7/l6G/gqiZm9SjSIE2mi/pXRRuczNjtyeQrnAXu6cvSrQudzG
	 niMSUOPTgN/DESubXDP4FjQxlu0RjPQ9f886UPDS4HgIhEZzpLo5GAK52+UgINuoXyg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-foundation.org;
	spf=pass smtp.mailfrom=linuxfoundation.org;
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=HGJGkzR9;
	arc=none smtp.remote-ip=209.85.218.46
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 328DB606A31C
	for <linux-doc@vger.kernel.org>; Tue, 10 Nov 2026 01:20:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 328DB606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=HGJGkzR9
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c450ab1483cso245754166b.3
        for <linux-doc@vger.kernel.org>; Mon, 09 Nov 2026 17:20:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1794273633; x=1794878433; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m2qXctBTC0OPADf0V2KkMb6r2GA0JgabIuFAMe6ERzQ=;
        b=HGJGkzR9YxHqOZTxLwiOE0IzmrJZGAaWLR2JYA4tSOPhN9f8LWbjZRX338LKM1Y6wx
         Q6R5n4ftF0K2yUTWW28biSkr2KunAqThfxhHgsIPru632mgd52zCsJ39a+5592huJ98g
         C0mEc90iCvxQmRprBqvgWcb9s9mSlg6JIFvUk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794273633; x=1794878433;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=m2qXctBTC0OPADf0V2KkMb6r2GA0JgabIuFAMe6ERzQ=;
        b=vCJec3iS3Rli59UhQOgNqlxsNinjIKaSyl2Pep8VcDJI7lVCUmGFy5bag8SYIE0FB+
         aKS7jlK8m3grsO9b4WEDUKvWk5CP47AHUSIsX+PKGeaFFM6sZqjiEFqY/olDJfxRAd1N
         jy4pMTw9R8xRHFxEBfvAqb+jXP2aRYm/k7T9X0X5IehZAYyV0dMUpz9dzEPRJtgK5p8u
         VKV5hxrEVZ2yjtJvC6TsFwvxJn3zzLd0c/aQ+xoF/mnzxRbcw+8s+jvw5FcGXcEGJ9lE
         8DbqA5z5/tL+Wq28l+BmQfYK0oZVtRAOLnthDfw4GJc/kcRVPAuZbikUA7mKxEN0qhtX
         IJaw==
X-Forwarded-Encrypted: i=1; AL+hErEx5Zf/pFxg9nVDixQNd564Wyr/OSCvS7dqLfUutmDlFFkyaDW3FKXjDcpeCiq95K9lRj3shY4CTCE=@vger.kernel.org
X-Gm-Message-State: APuU4Z8k4ZJzlQq0RlDKMDWpMY2q0oTOh04vINM/yrdYpzsnlMDmKqDX
	uzXdxOGLo6ST0hUclo9GGN8b7YV5uBHTaV4A2Q+Ny99kDmZ78rMKcwV2sDRvF0LAdp9CxHY32YU
	C3bDs9AYdhg==
X-Gm-Gg: AYBFou21kLEBLSyy8glHcMr3joQwYceelU+r9ri8w4vTe35ktTcTCavnBVqVqBz+D8H
	B5HF6i7M8y8rEWkdfkfIVlRixADQghdkll3N0uy2Mt+PG26m35aP/lOH70b4LpE5Uiw3S8n9FdE
	HQ1Vz1p6xf2M4Arv5VfrXocCdIith4OvMUdKmbtj3ST9oESdnB0zDQn+OBwFu8bE3wSmgkAzT5R
	KLyko2I4GCcmohzs2LeeMl8yWeELqVoW6NDrbuWWd0+DYdWk84ufu7f70NFJtAV2LhL33i0nsg4
	ZTZU6eqioSPThW3yYtcYFYxW+7ZcUw1CbLiifGYldlgJ1FAGfjLGD1IoXNsD6xnPRWwZryoXm+o
	daFD68iApemDsytu4ewyjLrvGTEYSx+8Wk/yUXwYG2NFtL8hxrHnL62NG0TWSppYUB1i3Kh90vE
	bqlB2xzyTPbw/W4WuJiP+LUXk2NquVuHyCk88MNQwU+cmUELRxqKK2QBUkaE+sq5IvlsBSOHnJ3
	a2FO6zLzAAAg2N9FxBLsEcN7GmU5vDRbcbHDxfBufRNuMu1gh9+05JB93Enc2zgkqq4Hy2C6M0Y
	ekUnjFzUG6g9/Invsff1txkFfrnMUi/i0MCOFNpzEWF+A95Mksr1A1YZoomY5WYTCTBUSWN2HLC
	kVA==
X-Received: by 2002:a17:906:4e87:b0:c4c:bff4:200c with SMTP id a640c23a62f3a-c50496aa123mr55610466b.32.1794273632566;
        Mon, 09 Nov 2026 17:20:32 -0800 (PST)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com. [209.85.218.41])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c504a5704aasm41390066b.25.2026.11.09.17.20.32
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 17:20:32 -0800 (PST)
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c450ab1483cso245752866b.3
        for <linux-doc@vger.kernel.org>; Mon, 09 Nov 2026 17:20:32 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHM4D4atm2vgkrgh5Ka76tngzmxay0nknkSkEA7snSYxywR7MQSKD9HcEh04YpG6qbsZduhGVfG/1E=@vger.kernel.org
X-Received: by 2002:a17:907:9451:b0:c41:1750:59a2 with SMTP id
 a640c23a62f3a-c50495dfbd5mr87253466b.12.1794273275844; Mon, 09 Nov 2026
 17:14:35 -0800 (PST)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104-work-procfs-core-v2-14-76ace653a773@kernel.org>
 <CAMuHMdVfakapgBK6TBhO1iWX8qzvLDk8jzRS=t2MVa5G=MCUeg@mail.gmail.com>
 <20261107-akteur-gemieden-eckdaten-21304d085e35@brauner> <20261108185953.28054fb3@pumpkin>
 <alpine.DEB.2.21.2611090504170.17804@angie.orcam.me.uk> <20261109214558.0d9d5228@pumpkin>
In-Reply-To: <20261109214558.0d9d5228@pumpkin>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 9 Nov 2026 17:14:19 -0800
X-Gmail-Original-Message-ID: <CAHk-=whsA3tKcUCBJDj_vmJ11rVGT9rivgnKjGRgMO21CPmCxg@mail.gmail.com>
X-Gm-Features: AclHuK-x8jcOOQUqd2amGoGEAKER9jIFGaeL4LxxWAd0cGV7dz_RR64PtDogpPU
Message-ID: <CAHk-=whsA3tKcUCBJDj_vmJ11rVGT9rivgnKjGRgMO21CPmCxg@mail.gmail.com>
Subject: Re: [PATCH RESEND v2 14/23] proc: let procfs copy in writes before
 pinning the entry
To: David Laight <david.laight.linux@gmail.com>
Cc: "Maciej W. Rozycki" <macro@orcam.me.uk>, Christian Brauner <brauner@kernel.org>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, linux-fsdevel@vger.kernel.org, 
	Jann Horn <jannh@google.com>, Josef Bacik <josef@toxicpanda.com>, Chris Mason <mason@kernel.org>, 
	Jeff Layton <jlayton@kernel.org>, NeilBrown <neil@brown.name>, Eric Dumazet <edumazet@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Al Viro <viro@zeniv.linux.org.uk>, 
	Jonathan Corbet <corbet@lwn.net>, Christoph Hellwig <hch@lst.de>, Greg Kroah-Hartman <gregkh@suse.de>, 
	Joel Granados <joel.granados@kernel.org>, Kees Cook <kees@kernel.org>, Jan Kara <jack@suse.cz>, 
	Jan Kara <jack@suse.com>, linux-kernel@vger.kernel.org, linux-nfs@vger.kernel.org, 
	linux-acpi@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-s390@vger.kernel.org, linux-scsi@vger.kernel.org, 
	linux-um@lists.infradead.org, linux-wireless@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, netdev@vger.kernel.org, ntfs3@lists.linux.dev, 
	platform-driver-x86@vger.kernel.org, coreteam@netfilter.org, 
	kexec@lists.infradead.org, linux-pci@vger.kernel.org, 
	linux-sound@vger.kernel.org, netfilter-devel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, ibm-acpi-devel@lists.sourceforge.net, 
	jfs-discussion@lists.sourceforge.net, linux-alpha@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-cifs@vger.kernel.org, 
	linux-fbdev@vger.kernel.org, linux-hwmon@vger.kernel.org, linux-mm@kvack.org, 
	linux-sh@vger.kernel.org, linux-usb@vger.kernel.org, 
	samba-technical@lists.samba.org, sparclinux@vger.kernel.org, 
	linux-m68k@lists.linux-m68k.org, linux-doc@vger.kernel.org, 
	linux-serial@vger.kernel.org, linux-atm-general@lists.sourceforge.net, 
	Takashi Iwai <tiwai@suse.de>, linux-input@vger.kernel.org, linux-raid@vger.kernel.org, 
	linux-ext4@vger.kernel.org, linux-modules@vger.kernel.org, 
	linux-debuggers@vger.kernel.org, Chuck Lever <cel@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, 9 Nov 2026 at 13:46, David Laight <david.laight.linux@gmail.com> wrote:
>
> Just that the cast would have to be:
>         u8 *foo = (u8 *)bar;
> where 'bar' is 'char *', and I don't think you need a cast there when
> char is unsigned.

.. and just to clarify: 'char' is always unsigned in the kernel on all
architectures since commit 3bc753c06dd0 ("kbuild: treat char as always
unsigned") back four years ago...

            Linus
