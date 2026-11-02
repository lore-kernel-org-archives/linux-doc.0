Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793642779;
	b=ke929mJ9ya/tSzjQWqi4dUflaaGnqLy/g9H9ZzSyb2aauGrBMsOrzaIxv46cyM/YlrlE
	 656o5Lf+4BKK77p4TqUZpdULZxD05Z81mMomtPjXRXZNOPWxMJYsa8s7lFnSvONeB6HT8
	 b6nVBOvoBJGS6NmMRyimnAfmYd4pSUIskXe4XtTgTrfyZ9awdIY0Ccg3kAjIta1VYo/Ym
	 1XiqW3pCbAQssjnac22fuQntraPaA61yYOFMK475dMxtNttbr4SRHsMRIZxz09FsGkfa9
	 TUcHv8rbvSydRfvkIhscXZ1plU+/cl9sghhlty7WwpvAg7nrHuVuyLZd9WKocGK6Xaw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793642779;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=/vXXDZI2TLqXD/tqTZGHj/cF0YcMq0fXP1TpWYkM2ME=;
	b=3hA2YRFuNiztqL2Z+kTWIaWSEAQi26hMutp+itXSUn9oYKOOOffRN2l17Cg8RqXHtkMe
	 X5vgj4LEoJPogdkPzl+ZvdkXARMEzWVgIbGBOiArZKjO8YMgfe6edS/R/Jrw9HmUIusQG
	 I1W3YENcXJPa2WV1GunBfsh5sXouMBFf/69G7us/wZ0NEfzIS7zAcbVystSSd7ZC6CQWh
	 RDtlsjNj9dpL+wD4uG/tp0jC6ryL2qyw0p0llckE4gYkGAQGIwxREbxACuYOA+RMxwbPC
	 DfexLjVLTQL20BBJxy0oa/6+sbqsvte1brdr+kWY+vBnQ/A6Et06ghRfY2gaSrmizlg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-foundation.org;
	spf=pass smtp.mailfrom=linuxfoundation.org;
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=RuuE2slb;
	arc=none smtp.remote-ip=209.85.167.44
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7174B606A329
	for <linux-doc@vger.kernel.org>; Mon,  2 Nov 2026 18:06:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7174B606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=RuuE2slb
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5be4fea434bso3802261e87.1
        for <linux-doc@vger.kernel.org>; Mon, 02 Nov 2026 10:06:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1793642778; x=1794247578; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/vXXDZI2TLqXD/tqTZGHj/cF0YcMq0fXP1TpWYkM2ME=;
        b=RuuE2slbhZYiEhLTGxRKxkz2xS1l5VL5zCf6OEFTxM+WK+2Sf5+YqJkFJkEDaOAfHS
         /lnOhzSjmx4r4nI/zPAbaPoZ5PuIOY81ZKJ1q7yNacLEojX231hJlGsbLjeMRc2w88NE
         tQG2SczCLXabSkQP5/F4Php36F0l8zEpSG6h8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793642778; x=1794247578;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/vXXDZI2TLqXD/tqTZGHj/cF0YcMq0fXP1TpWYkM2ME=;
        b=xs9yJgjbC3Dy3Wn2Vskt4310dGXGGiBPdxHwIIYy1UyhuVNcrABuu3wjCoXCkTny92
         L2A0iXqbvTgvAu3LNM6gBuRCIGSbYaJ0n+RIrdt7G6sBYElWxKdX95Ar7uHDz90iBaXM
         S6k/BXdUz9cRPKTOOIRYSX2pEGjkPpK/Wkte5bvXxq7g0MEFxXzqvx23sVnVmrinIvVG
         yNA2OlRuQFmxRQ28PBZX3LXb/a0oh3w/RcKIhh2xPSOO5GfKW7S4QvLW1rzeCdOS/F3W
         DsNIgDV7HqNoi9eDhluWUyjQnK537ph9V8cCd76qWyM4XDUnZSTv/uzF+kwQrpdUtI2a
         1uXw==
X-Forwarded-Encrypted: i=1; AKwUvByTwA+KtGpKbB12ou+F8AH6IxwOsNQnDg421OkMbHrr2BjggJBpEAtwQxOUENsfUc2kfjQjxR4MYi8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/ghmj6e/EZznJ4apLtSoZyQmTMGz7TUxvV5edC94hI+032X65M
	cddMu94DbWKbXwBkUwHYcdNzYKBn5FMBA4+wppVseOC8Lu9YcaGvJVzimelJDNoUxhKZ5luUt4A
	ddPBpkYqxVg==
X-Gm-Gg: AYBFou0i9uEYWKe+K3LCXERoPDp484gezvu4+pHLwO9tGBWb6mywZfelkUkbonRpTMy
	UEwTY1aBuwlEVkh6RY2xxDXS6BZNYg7eQLldfbVD+DqcFdQEgeWEmILlEzSdnQfYSG1pQ+UVCyA
	VnO32FylM0UfbIZjc94Wvbc/40az3SYS5q7T1I9s4xQIvEk8n52HitYoBgsu3hHumuf1oDa8uaT
	NODUcSlL6pof5kjtHhptzGtiZIxOHPSfjcT3gXRAdyJr0bcbnC62VEeGCqpuk+BlQrBRv1XAg3H
	06ykNPc1O6WTNhWdeG/Z5reZhXn6Xk8eOpEnVLuug88JBj/DiqFVMSkOQDBe79jtuFDXll5qjxD
	SXIHbcq9FTV2oViHatFG/Zl16Kllplp2ncISceuFXjJLFGdlRJhEVz1rpWQgWt4Nvgtzz32G8N0
	VMRN7yQctxHWpQA1Nm1con9NKKXR0jwZ25gz0g1mhIe6oopuW71N+N+7HiUswYBk8Hd2WsCcfoR
	z1N7OSnd55GHjwUjmj1Fp8hE2bXOTNuzAnnKRoLHCvTnTOzcdaacZoIrH4lJrs7SA3vwBd0h1W5
	yyMvU62tJKb2EsurWtJlOS0FiBn9sTAiUIo3e8DmKWcLiXncVCAlFxy7SHpWc6AjwmfwWda5kmj
	ZG73KWTCBaF1sTfhJmtDz5U4=
X-Received: by 2002:ac2:4c54:0:b0:5be:ab1f:f04d with SMTP id 2adb3069b0e04-5bfd11fc9b6mr4098436e87.23.1793642777613;
        Mon, 02 Nov 2026 10:06:17 -0800 (PST)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com. [209.85.167.43])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfe1f61482sm1707295e87.13.2026.11.02.10.06.17
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 10:06:17 -0800 (PST)
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5bfbc25a76aso4764576e87.0
        for <linux-doc@vger.kernel.org>; Mon, 02 Nov 2026 10:06:17 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBya+IIlZ+VIKXNeS86ffaJbt4X06nHVoBkRrvtxGy+1nWhGhHdaIVSOxdWVYgah6vgImXeitJT1N8g=@vger.kernel.org
X-Received: by 2002:a17:907:d94:b0:c2d:c80e:8366 with SMTP id
 a640c23a62f3a-c4ca7426f6emr874452266b.0.1793642348398; Mon, 02 Nov 2026
 09:59:08 -0800 (PST)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261102-work-procfs-bugfixes-v1-0-59422ed3e465@kernel.org> <20261102-work-procfs-bugfixes-v1-1-59422ed3e465@kernel.org>
In-Reply-To: <20261102-work-procfs-bugfixes-v1-1-59422ed3e465@kernel.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 2 Nov 2026 09:58:51 -0800
X-Gmail-Original-Message-ID: <CAHk-=wiSA7-mqmAjTQDaU7UjUyWt0TxYwXHafL8ZAPudy+B_uQ@mail.gmail.com>
X-Gm-Features: AclHuK_qZTBVsLQIdymgRHScSFenC6XsGggUDmcuOugjrSTbuVkeASUmC_hYPZo
Message-ID: <CAHk-=wiSA7-mqmAjTQDaU7UjUyWt0TxYwXHafL8ZAPudy+B_uQ@mail.gmail.com>
Subject: Re: [PATCH RFC 01/38] PCI/proc: don't truncate the position of config
 space accesses
To: Christian Brauner <brauner@kernel.org>
Cc: linux-fsdevel@vger.kernel.org, Jann Horn <jannh@google.com>, 
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
	linux-debuggers@vger.kernel.org, Chuck Lever <cel@kernel.org>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 2 Nov 2026 at 06:22, Christian Brauner <brauner@kernel.org> wrote:
>
> proc_bus_pci_write() truncates the file position to an int. A pwrite()
> at an offset like 0xfffff000 turns it negative [..]

I think this would actually be better with rw_verify_area() just
checking a per-file maxbytes.

We already have that logic for lseek and friends - using that fairly
hacky combination of s_maxbytes and !unsigned_offsets().

We should combine s_maxbytes and unsigned_offsets() at file open time
into f_maxbytes and check that not just at lseek but in
rw_verify_area.

And then things like proc_bus_pci could set it's size limit in one single place.

Hmm?

                   Linus
