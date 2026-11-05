Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793872496;
	b=Y/XycEVZ5wYD68XDuQy3qfX6CPY8CYevphbnGZoUv9rc5sNJ5OxeI2813rgWYP3Uzcwq
	 Fjk72F/MOtpI/HdqWNrPA/MjmxlSzhLG0P78Rx5ztGu/chgUM/epX3qQVwctL+cIzGfZh
	 dYH0mZwCLlwHLBB7d8xLwBiG8IE96EGD0GkDYcot1rk0U+jVR1akv6peaqq+N7NPgrDlx
	 qYjUKscCDhZK/sXW61OxNiXIXXt6F+5xKOPnqcTASF/aKNy+r8XIPJJKiVFJtqJFAER6T
	 CKRhN9mhfbsORKHzv7A3ilgTlApCYC8gAZXNtNVLpx4fOLDXkT9psFsCEPTpUKZBNdQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793872496;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=n+1lmuZTLENNkpqKh8T8PUriZ63OKZ7RGcjsYNzzAGM=;
	b=4yyLMHZh/m+NGw/AnMdU79QMFNvJGq5rmuE/N9b1jYEaeo4nNuzonL49ORIF20whOkIB
	 E7LUeTZL8Nfc8rxU1nu5TORuips5sm6YRzkJBJWRtpX3W+o8iyz8dP9KX8wTxSR1mZVBl
	 OrRpiLDp+VSr15qW2HH2isI0e/Ts3WTpM9EZXMgm9Jf7M+zKkedDNXZbHn6ZWHqdFjhkg
	 36oqYeRFauJSx/hMJew1Xirrp27ZQvWYnzwcfK/MD/5X2B68SDtrAIEZZgdjHgBPAa28T
	 CL9T0aElGuEsa6H+Hf08rFngiL3xjgu73O3JraN/EeDqM6YqkD+7N9a6AkuxX0Qip8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.222.50
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com [209.85.222.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ED45606A32D
	for <linux-doc@vger.kernel.org>; Thu,  5 Nov 2026 09:54:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4ED45606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-9906c85122cso522757241.0
        for <linux-doc@vger.kernel.org>; Thu, 05 Nov 2026 01:54:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793872495; x=1794477295;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=n+1lmuZTLENNkpqKh8T8PUriZ63OKZ7RGcjsYNzzAGM=;
        b=PMvggumvMcg8SpwCJG9wVTd07brVcAxyKuhQV4Kxd9WYFFtR0FCHIKJzlNmu2AUl/H
         Zu7qpENJHww+AqY3Q5AJ+u8rOAGgX5VsrDVKssyvMSizxFiOWPP+kZ0aWzZtUHou412L
         Vqj96NLZWT8u0xb046IMbD9gts3X6YicRDoTpsc7xSaWGDzng00E/I8ThPbtxsZOS0Q+
         0iO50oWBLYK9zJtrJrMatudYXwA7D3NZC7Y/1bxPfEGtaAwqOGJxMKWr1ejjGd28moQL
         9VZiwbTBVSpnnuWCAHEPyrWMAB6TuKm9SVUOY5tbfiPF73uzWm58EkMDUGmu303SobTw
         ynjw==
X-Forwarded-Encrypted: i=1; AKwUvBza10HO3PgW2gM3ewepPki7XjO2AX6YpzE//Z5TmZhDKY5vfmuceceO0HAiOHB0xqMAVTf1cn9MMYs=@vger.kernel.org
X-Gm-Message-State: APuU4Z+CL4ZKnAQiNmEcbp5DEVa3JPnjB6BVJ9DwLpz/R4zRvGijAASb
	0aShzao092yh4Leqem/fypGiSRClDSdZzYRfYWQmzWXo3J+irbctetLGt2NKN20SXHo=
X-Gm-Gg: AYBFou1mur777xNkpRm99YxMRMOULVbPIE0YFPXI9oC7+kZ+RtV5gXjRjAF0HvNoEZ9
	8VOw7jMaYGkOBA4S+mEyvKfcwg6q0Khgur/G1caS8jbgRbRUsqPPgGGPaV/ep0nDgYP4cD6Ckxg
	y2CNJ7pdJVri3/gCEZmgl47fTWqfnNADWWHNzEpqUhQF3k81C5NM7UYIrOzs3FFeWbmPJjFFVt+
	BHpzTw7HuBtwXRoDK8L8JtyAYG8A02NBHK/+p57tF8RL2zdghWD8KiSAnxUj+ba3bYe7XhXjXww
	xQBtZiCPNc9iRWHqQ+b9DmA58jeN/b3KcAyXSnpmSryn+wY+pE6aoqHGsmxTQbK9k8tzx8Gogkv
	XG/onooDWTdd9B73zNNE/c0DIGfrNHQrWn2PiCHDi8hQT4YaP0sBezaC33iZJ0TISUJbngsQl5G
	wPubr92/kXuZHZo2z+PpfZ4u11u2b/eJ9JsbvgBsuJ3UFGmNsjqR5S0NBE8iPLnRXkQItpM7d03
	qkUfD9bZ+HSmS4lyVmzrr8iywlU9tJSfXt1bD4bw6UA3fU6cWPYgQnOiMk0Vb8qfDgh/ZTmQdgF
	bogdwrNc3GJhIUPD/Um9dmZ0+/nq84YqULWLPtUbui0Bsfe73W0kkql5Bc7GvbhP2mp34w==
X-Received: by 2002:a05:6102:1481:b0:7a6:85d6:8ae0 with SMTP id ada2fe7eead31-7d0727aa79fmr8141685137.1.1793872495268;
        Thu, 05 Nov 2026 01:54:55 -0800 (PST)
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com. [209.85.221.173])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7d26fdaf4efsm3523993137.5.2026.11.05.01.54.52
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 01:54:53 -0800 (PST)
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-5e948e56af3so587162e0c.2
        for <linux-doc@vger.kernel.org>; Thu, 05 Nov 2026 01:54:52 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBwYElNvo3/i4a4/dUe9DyidaEO4ASd4zImQ9/DycCiK1dgzJThNU0TXny9yyxOUI8AL1mzNmPR3k+I=@vger.kernel.org
X-Received: by 2002:a05:6102:6449:b0:7cb:bc5e:7dad with SMTP id
 ada2fe7eead31-7d072baa450mr7614890137.10.1793872492413; Thu, 05 Nov 2026
 01:54:52 -0800 (PST)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104-work-procfs-arch-v2-0-2aeb952c9597@kernel.org> <20261104-work-procfs-arch-v2-4-2aeb952c9597@kernel.org>
In-Reply-To: <20261104-work-procfs-arch-v2-4-2aeb952c9597@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 5 Nov 2026 10:54:40 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUNBs_NyhFpXonirMXkYptUWsAizMvVpGHUDLzto1LGJg@mail.gmail.com>
X-Gm-Features: AclHuK_RsrcE7hVRjmpZezBV5tMd490Mza2XAQiqUTgUNqAiHAzRP5z7NIbtMh8
Message-ID: <CAMuHMdUNBs_NyhFpXonirMXkYptUWsAizMvVpGHUDLzto1LGJg@mail.gmail.com>
Subject: Re: [PATCH RESEND v2 04/23] m68k/bootinfo: let procfs copy out reads
 of /proc/bootinfo
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

On Wed, 4 Nov 2026 at 20:36, Christian Brauner <brauner@kernel.org> wrote:
> Implement ->proc_read_buf() so procfs copies what is read to userspace
> after it unpinned the entry.
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
