Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793872913;
	b=zVLCXMuHWTY2zLGFpxHk6CS6gxoA3RbAyq+pWdcnEJSyy9YTqI9+/gUcCjNCRwhVzR68
	 tPN1ngidTp9lLTHfR9iX2az0fxycL0ZTwpPNRHMf89P7i4UiLG62c67633hS9RX3EDQSR
	 hD7bBXlkGwigvpHl+zhl0BP9Wdj4i10WkiRCakZ+sQtg3hyRUv7CFlsZuYtHJEYqzqALG
	 H9AaxN6aen5ChfdLyfWoWtFw59nwfZKekpepEo+rQRB0cR8hW0a6qC6gb4Aw1hockkSvW
	 MuwaO60VFLTjLN4JF/hb9MsJ7VYInbombBd123G4Cy66yb7iLtMjBqqTzq5z+G0Arjw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793872913;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=LrgDMUrSYXpYgkAhfsYKg0ebb/uLgOfOMhqzX4yL0j4=;
	b=16cekCMEbXBEACTUwsqUTrKz6cHxVdJp3nZJs669jrbk5X2naxNxb2FElE2ux5p4q4c9
	 eISCAnE2fcuFknUwdHuaisv0Lde1Sy0jxZbkFSXEtyhzWMiCAGiRHbafEUiM6hbgaOuP6
	 ey0i8UXw+wSJYmJ5XYFPg5cGhq+Mtk25BZQbYfyosmwDKXwqBX8UEN8cHbzwfNfGqgx6O
	 abiuewbYP4XiorhWeL741h88NArucoj93xqGCrMc1OMF4B+7ryNf+j5A7mL4n6JoiYTwv
	 jztcDIRp6Ge9q2wa8zmhqYngzWjrQAU958CNeCYfv5Gw5TxpVF5Iwm+g4716o4RwnoQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.160.175
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFE3E606A326
	for <linux-doc@vger.kernel.org>; Thu,  5 Nov 2026 10:01:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BFE3E606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-53644b28706so24643161cf.3
        for <linux-doc@vger.kernel.org>; Thu, 05 Nov 2026 02:01:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793872912; x=1794477712;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=LrgDMUrSYXpYgkAhfsYKg0ebb/uLgOfOMhqzX4yL0j4=;
        b=OCfLEkoh2rjxVSPdfQTg3eu2pxrfGApYWUYuEhsX7ROFmJ/8AL1H04FdG8cn3LbOrW
         2eDfm5XhDYjyLZ3I/3//cE7VxIqsX6tkuCXVnr1ltNfjq+kPkoZex3yIFGotRdAIufhM
         R1By4Fd3Zff0/HBt2+vwz1Lv1FNliG/Gfhxz5OgUg98CeN7PkryVES+cRqyzrftA1+zM
         OFrN0mWAw+q/1yK9J0nLem4uyDIn748oQoh0XbpPRXoB7uXIJ1O6gRAd27dcjUB65hjA
         PFJ0/EnsbGEhCLCP+GsJlghYMTXQ3v7Jz26lC5lV+UWIXlFPBuyYxyOVmO4ujEtIl256
         E7Iw==
X-Forwarded-Encrypted: i=1; AKwUvBxCrx9wjmGsChHF7FH3RfFfxqOfNFEI0vIKJtuUFuHfC9klnw5ZGyIPqKFTLLuYXLOEiA3hDojOr9Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Qxo1DlW5f7rV+E936VhmKYvFSqoxw3gUFnSorUGZTxZL7hBim
	0FrE2o+zJrnZNkmNgQu/hZXW5lFusCZ8ZZK+bD/a71OgAMn05wqaFT43kKn21/46qNk=
X-Gm-Gg: AYBFou20HYuKYj3r17e3cxAfw9lGdZCk16+y1uEeUukjYtN1jBP+osLSl3UqbIccRsv
	Y7MFQO0rRwCBu0yvInI5BVIDQr7AUpweAFKxawl0JOWPe15yIzj+WpfcLazf96eJ1iF77zA5a2N
	a7sVm30VmKCiO9wmfEtlFYSiBMgsuibarcTx/3Pu0QzrwLYqLapojC8kQteD2jYDiHS/kzwr3wN
	qY7l5a4DD6/JVUvkcxkbu8t1akNt0SDsL8QzbYsWUcKSgeFcRWFG5uH2vSJ1tBowF5BG7vXPbxH
	cKzKid5YCKCpsAi3F6/EvwwobwBOAgid6onXuiFPWUY5MAHrYO/jzgLPXj+i81R7xpXJGH/vLvK
	RPEhgOKSpfi8JHBhNs/ind4Kj8AkJwvR5kokUzW+qNvCGmW6ci8IKSerA940gFT1nQmyFOSFHOS
	b3nb5fJz94o7CRfjC1LSD3DLed6HbNSO3nZrreOcysZL/CGU1SCZW1uCBRjc5e9K7DoVziZr6hk
	beIqJIcEI3gJ80igjAmHHIXTTZjBDMsvCIz0igTg+biItOupbvnPQvmYrMIDbu4rx7x719/TDSM
	cYmyXStgg9Jy4eiZWX63SSxwR2MCXmTB/Oliw4sF64aNi88yCAuEWU2jQI313BcU1REWhA==
X-Received: by 2002:a05:622a:58d:b0:537:5488:de83 with SMTP id d75a77b69052e-542b771f0e1mr322331881cf.54.1793872911601;
        Thu, 05 Nov 2026 02:01:51 -0800 (PST)
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com. [209.85.222.182])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-54b10c4dcddsm47999741cf.20.2026.11.05.02.01.50
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 02:01:51 -0800 (PST)
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-93ece7a73b9so195618885a.3
        for <linux-doc@vger.kernel.org>; Thu, 05 Nov 2026 02:01:50 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBypRvkjQW22KB+nhdRvaanUQ3y8/Jg+M9rZsTifVHK84sGc1qMCYkDfvkaBkFJVmIVu4Yjo2IKw2/0=@vger.kernel.org
X-Received: by 2002:a05:6102:5108:b0:7cc:56a:58e5 with SMTP id
 ada2fe7eead31-7d072d84a58mr8269567137.37.1793872526219; Thu, 05 Nov 2026
 01:55:26 -0800 (PST)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104-work-procfs-drivers-v2-0-245e54e87116@kernel.org> <20261104-work-procfs-drivers-v2-2-245e54e87116@kernel.org>
In-Reply-To: <20261104-work-procfs-drivers-v2-2-245e54e87116@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 5 Nov 2026 10:55:15 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVHxQvKnJyKHrOZhaOg9Rn2hMeRU1JnMFFEEi31FPZaGg@mail.gmail.com>
X-Gm-Features: AclHuK_UsJ1nGicdWEWcMLQAICTi1A7pGF3yhNkxXkXRPqohle17eXAHHNBsR6k
Message-ID: <CAMuHMdVHxQvKnJyKHrOZhaOg9Rn2hMeRU1JnMFFEEi31FPZaGg@mail.gmail.com>
Subject: Re: [PATCH RESEND v2 02/26] zorro: let procfs copy out reads
To: Christian Brauner <brauner@kernel.org>
Cc: linux-fsdevel@vger.kernel.org, 
	Linus Torvalds <torvalds@linux-foundation.org>, Jann Horn <jannh@google.com>, 
	Josef Bacik <josef@toxicpanda.com>, Chris Mason <mason@kernel.org>, 
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

On Wed, 4 Nov 2026 at 20:43, Christian Brauner <brauner@kernel.org> wrote:
> Implement ->proc_read_buf() so procfs copies what is read from
> /proc/bus/zorro/<slot> to userspace after it unpinned the entry.
>
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
