Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794164398;
	b=wgbfD+Ukyzqd+kKstWWy4+v82kNYL+yH8xl76uNLsn8LNSq4AscQdfvDnlPrgbZvDBhX
	 2nWxMfBNkif9Lur6Ou6RtPig4m4fG2FHsrs6yGqq/HyptlbPT9zy5G1ap3oGW4KDoMpna
	 cSAxy7EXSWgivfziENIlAHh6zJPMOnaT2HABDkJFYNpEj2S4nrCcNVsz9HCSnfQtd3z4x
	 lisWeqLuPLNvmwHz47qPBwZxB8T/bpRUCvQHfFk4UGQcLXLvFVbwZUD/9sigcumJAWn25
	 51lqwQtNbx9+z0UdnRACBQIko73yCcOMoZMxxX4GG7kpf09DgZ5bj4vs1z7ixljPhyw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794164398;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=JLhUwzup1lwefYy8NOOFjthYnrByVfTsqIe79kkV+Lk=;
	b=jpHNRXPzTCtPnOd8rvBJcnXIXNjm9jY95coQsx6YmoiYx5wPoFfGZ7gVsOFRQJOye6BZ
	 V/pJvQAP2dXd8gEB5IBRhVFg0Mp4kw1zO1zHLvWl/98G7kpkQKx+17t6xsW2yDSuJVag3
	 i7/cL9a7fft9AXwIWMyQ1ZxH6fYb4gs3BL2N4NEs9wD6wsQJAIW0OjAd1otbhIYY5/c5J
	 FSlOdjZNYoppLhRChOiwUzMKrHAl1Q/PYDSuXg4SyJbzHF0UIVhmWmfvIUNcMa1U6tybE
	 9D/E3HuxfSHqZPSmmxYYOXtzWoXtxSsWFpAlWOJqYwcauoypa56Dg4prrw471jiaz8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XrEUEgHU;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E800606A33F
	for <linux-doc@vger.kernel.org>; Sun,  8 Nov 2026 18:59:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3E800606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XrEUEgHU
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4b79502c27aso1791545e9.1
        for <linux-doc@vger.kernel.org>; Sun, 08 Nov 2026 10:59:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794164397; x=1794769197; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JLhUwzup1lwefYy8NOOFjthYnrByVfTsqIe79kkV+Lk=;
        b=XrEUEgHUwv+lt2Z0T4RzlOQuYT1yMbnY/MJrtF5HY2pc8m0ujKE+1IGJbqc3A1SsPJ
         Pz+po0Wh7ECcrOl1hyNdZBme+OsO/r11IeCA1lW9KMbstFhlOkC0Hm7Ef+TTavGsfrDk
         7T2AE8nlcorDhYFpLo0KTCt4xOv09AacMRilfH2h4PS2mZ0iBReAF8XAcgtI3iT+qlRY
         EJQPYUIUlDRCCjadf1+24R8V0flZyhCZpLCroCVsidoQ510350k4POOaAcSXgGRrBTWF
         rbpUnz5O6K0TOR8uz/zwLHiObwDAqnCJFWP0+ssCNYCBYnXJwQ2yMfUqdKkv6ro/lp/q
         XMaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794164397; x=1794769197;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JLhUwzup1lwefYy8NOOFjthYnrByVfTsqIe79kkV+Lk=;
        b=zOQ2hYUr+g1hUaxHbzhBXXijyjdIPWYn1ufax91phw3fQ9lKWP4HGJVYa2tcWEytYn
         e4DfpwINulKGueh2lpTMaT9yQ3Dyd6chi1MJsv6bO7c8r4NWDCzn59c45P4tWmdAweCI
         F98UZACIl6opBQHEAhBfL4Mar2zePg/l2XUIQbZhoKC80KbugTCZ2TM2ZKUVWT4S/Tl1
         d0q43pUURipYbfrdkXlwHpvzfh2ZaAGqOFpeUR12YuIH3Fu5aXfTEElSBxAUAUd15OqL
         wPdVB6XOqu5UxGxPTnICayjbm+jiVCGCq1H8uzvlu92OfPP16CcxG3EwneOYbUxh2JD+
         3P9w==
X-Forwarded-Encrypted: i=1; AL+hErErvEidBJSj1x6Kon9qdO6tmy/8Hi2hLAvmBMnpebOuHjI92QjAp94geJdSJks4GOwS9Wt8q+l81dU=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Lf7MWPVI0HpdiOdBHEkgAvYmUFHxbPHgb8rjzvjyR2+wRgXZg
	ssDiCwEOS+u8lCzcsjW+cdvCjtzosQ8lwsqohXahZyXs4i0Xt+7fnidB
X-Gm-Gg: AYBFou2QUuHdK3/T2J5x7cMj7DWK/+8UxRImE1u2EimPDWY7BQkE94Z8cxjLuVkgL58
	MRPZe/bMW2GS9Bn2ltNnwieYc2mKYWxCrxQ3U5T3Ac5KN3oQkN3YtF77wtwx2MTYlnQXEJvPHyR
	k6kjWfepSIdFMS5ivEYje5bla1yj+8gepEXp+LBzLJBvlHEGIbVCIn2tM9doOLd0kLXDUmvrcrh
	P0bpVFjO6c4eEqIuopPBIz8G/vFVzGA5Zd6XgLeWxExhz6gt9UQonbkWBFmcoSPZtfY1b7eo0/6
	HPkxobPv4ixLzyLeNL+8u63VibtBOduSE/5ndAf69pHN/qHgXPSQF8yoig/eyS9mMchlPuNO38s
	oED4jemg74Cr4xv9ZHoajAPyUeKbbic1SE++3u+cu8qFlVY0xBSu0EmlQUyHFwgd8N1oL2x6jqv
	il2NWb4nKGW6EDjuLVUBQsu2jeOCcWBCyU8hdogc8gf8DL563MU7ncNCqqu15DgAF9i2S0Jup5s
	CG2VMjVyWKXqGnI9kVnmyefyHotSB9dWhRD7aylRTVOphlCjCOtoQ5Td7IEE5J7DFD1w33oSdqy
	vzsgGFqS+KkCS5fkM6hhnnP1A0idoeJlQABWa6b2J0XzKBFhImue4tOadXKn0kZ1
X-Received: by 2002:a05:600c:468f:b0:4a1:7e77:c382 with SMTP id 5b1f17b1804b1-4b960d9b170mr35982125e9.5.1794164396406;
        Sun, 08 Nov 2026 10:59:56 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b7efb1f3acsm185228445e9.14.2026.11.08.10.59.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 10:59:56 -0800 (PST)
Date: Sun, 8 Nov 2026 18:59:53 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Christian Brauner <brauner@kernel.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
 linux-fsdevel@vger.kernel.org, Linus Torvalds
 <torvalds@linux-foundation.org>, Jann Horn <jannh@google.com>, Josef Bacik
 <josef@toxicpanda.com>, Chris Mason <mason@kernel.org>, Jeff Layton
 <jlayton@kernel.org>, NeilBrown <neil@brown.name>, Eric Dumazet
 <edumazet@kernel.org>, Thomas Gleixner <tglx@kernel.org>, Al Viro
 <viro@zeniv.linux.org.uk>, Jonathan Corbet <corbet@lwn.net>, Christoph
 Hellwig <hch@lst.de>, Greg Kroah-Hartman <gregkh@suse.de>, Joel Granados
 <joel.granados@kernel.org>, Kees Cook <kees@kernel.org>, Jan Kara
 <jack@suse.cz>, Jan Kara <jack@suse.com>, linux-kernel@vger.kernel.org,
 linux-nfs@vger.kernel.org, linux-acpi@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-scsi@vger.kernel.org, linux-um@lists.infradead.org,
 linux-wireless@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 netdev@vger.kernel.org, ntfs3@lists.linux.dev,
 platform-driver-x86@vger.kernel.org, coreteam@netfilter.org,
 kexec@lists.infradead.org, linux-pci@vger.kernel.org,
 linux-sound@vger.kernel.org, netfilter-devel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, ibm-acpi-devel@lists.sourceforge.net,
 jfs-discussion@lists.sourceforge.net, linux-alpha@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-cifs@vger.kernel.org,
 linux-fbdev@vger.kernel.org, linux-hwmon@vger.kernel.org,
 linux-mm@kvack.org, linux-sh@vger.kernel.org, linux-usb@vger.kernel.org,
 samba-technical@lists.samba.org, sparclinux@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org, linux-doc@vger.kernel.org,
 linux-serial@vger.kernel.org, linux-atm-general@lists.sourceforge.net,
 Takashi Iwai <tiwai@suse.de>, linux-input@vger.kernel.org,
 linux-raid@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-modules@vger.kernel.org, linux-debuggers@vger.kernel.org, Chuck Lever
 <cel@kernel.org>
Subject: Re: [PATCH RESEND v2 14/23] proc: let procfs copy in writes before
 pinning the entry
Message-ID: <20261108185953.28054fb3@pumpkin>
In-Reply-To: <20261107-akteur-gemieden-eckdaten-21304d085e35@brauner>
References: <20261104-work-procfs-core-v2-14-76ace653a773@kernel.org>
	<CAMuHMdVfakapgBK6TBhO1iWX8qzvLDk8jzRS=t2MVa5G=MCUeg@mail.gmail.com>
	<20261107-akteur-gemieden-eckdaten-21304d085e35@brauner>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 7 Nov 2026 10:48:35 +0100
Christian Brauner <brauner@kernel.org> wrote:

> > While at it, I think it would be good to use this conversion as an
> > opportunity to replace "char *" by "void *", which will probably let
> > you drop several casts from users.  
> 
> So I tried that too. The thing is it drops exactly one u8 * cast in
> ntfs3's label write. 

Since char is now unsigned that one isn't even needed...

David
