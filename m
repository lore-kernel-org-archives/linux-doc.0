Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793671951;
	b=vIp/0s89S6mM+uZP8lNlojeWHGFBa9N9N6+8WjI07LdvO5xDNMD/sqM+CuNeguvlt8D5
	 p5aI4wbNjnkUeIJdgz3aLTAhdYfLzHD9D2CDg+qxTxOJmueqH2rXgn6ToGxyGYjTWK+KM
	 0vcAUyFOQ5bXRRMbtBvhRs8h3RQKk8/vB79+YvHfZL8isEbYKY2Xuv9eoJqK0YG2AXsiG
	 dnOvq/6lN9n+hhC5Rf4q1NmEJB37dYdghlf6Mu61yEkV9srCgTJf0AbuKkoDcgDjSDBCv
	 06Rb7Mou4pzTnkR2Tq+55SodUKq7nRqFI44I6s1H2n4CCGfdaXOcjmz6EJNoQK24Imw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793671951;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=gbxtANkKD+no5T6EiXK6Tea/adYVuoSud4wUlEix+Yo=;
	b=nXBcP/KV88hlgS4A6h3Zeg+Y/er1fIkt+QMji958drNVmQNiP0QFjMwXovASbEr8D4CM
	 cgmRY5OB5BhSs5dg16QAFIMUwQuC2qZ2aSZ4VoXEHTND0lFwNBdQEzMdy2W78QkkZAkZX
	 Gk0xkjntPvqfeF7oUuAhzCsXmO2JZbIE7YdV/1ReMGrlzvspQZXtEI/Wa8C32zJJCGlv0
	 9+8cvedg1f98zXepXnuLSv9HCtyPcyd0PS6YLgvg1HoNrXHsvcUdwwdqIYYPEhUJaYxQP
	 eS4wLftqsnZrg+f9lg1x1BLf8zCAVtIqP3KdBUobLQF2YGNL2lsvTxgaCOrWYF86PHQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fF6G9Jhk;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.47
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE6F4606A326
	for <linux-doc@vger.kernel.org>; Tue,  3 Nov 2026 02:12:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AE6F4606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fF6G9Jhk
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-917bab38b14so47016746d6.3
        for <linux-doc@vger.kernel.org>; Mon, 02 Nov 2026 18:12:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793671950; cv=none;
        d=google.com; s=arc-20260327;
        b=P/nvL8WEpiUU710vzt8HTj5Xvdhn0+kZ/eIbbQeG0U/4HghY/lFSLa/hlsoOJmB/9x
         iqRBcLYYlFdG8kiyL+MFGT/JtuPPIZm0HHf5aHe9VIRBeR4Jxbr6OAgPBZsSeN3CqEvU
         WLkdmdyAsnKuno6GWhvgHg2Ky6sr+dVX9l3cqZ1x8RqbmylCb5GkF8zt2zs26d+P78jV
         y8XfR2z+IPL2df8zJydt68DcYhlNSsKMoky8WcEXiNt0lh1gL/0VcZtCkppQRZfZFlgq
         JiNNvy8ullGST65A2/SX6+1lPvREMBClGES9bdcEv8z/OoOL4/6bisqpTErO7C9rQEiU
         bHHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=gbxtANkKD+no5T6EiXK6Tea/adYVuoSud4wUlEix+Yo=;
        fh=ycWY0+/2cDvmHu491G/XrwcBq64MyQSnbsV7Cj7UzpY=;
        b=QEfVzuGx8hbjrelWoOvsCAO+eUUzOM1xO2ig2f3GOBYORnIzwNTcq6CYYlGLf4DR5L
         idA8kej+0/ZMG0jK9ew05mvqxmKo9tzOzQHsKM/JdqRAJpo8TMBoWj7Q32WUeKjVZV5K
         ut3Hgbc2gMPbB47SGjaepLrInFUHq63XdyGL9jTcY9BBv//OGdaaKlD1E62t/qx0KVl6
         JgQpWHRYTBgxkabVKWlSEaKQzFhBwG7rh4VIreUmYG7oC9TAOQzSGqRh2bVhwRKj1jWZ
         LM+BhkOtn13EFn817O5o2f6+3Hpmk5LPiE4Nc7UG/87rIB19yHumUbydv5czSOm/qltT
         MO9g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793671950; x=1794276750; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gbxtANkKD+no5T6EiXK6Tea/adYVuoSud4wUlEix+Yo=;
        b=fF6G9Jhk66eL2YXQUxSOw+szWa/NhEq79A2zPZQQzPiUgVMfgGeuZOOKG8KL4Qf5/f
         /Vlq7oZGdPTmWtI2vO/ONJ9ixUgGU+hQnkxA86yN5VBnHpMLfQdA/CSv/TtV29ZvNY9d
         +bvU24SjSIrs5JoFQsMrQ2wfXz7F53jvyRwVJSieB4K05orjtGfa7jHaRAOL1Ya+SKqC
         gCqKxVTHJpwXhdON6MwmTMWbQD+bNNJ7JYrnNbmlDevNYPY6nOnpnstG1f2xma4oZPNc
         JgfJ3GbMPdRN3jfaWDpwbFtioHNzS9yJXyXsy4u07dlfU3ccv/Hi5fb2zrU1yTHTEor6
         dWdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793671950; x=1794276750;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=gbxtANkKD+no5T6EiXK6Tea/adYVuoSud4wUlEix+Yo=;
        b=y1bnhnRll/rrUMdjD+F8YAvHso3dyg4EYNQRqRkqbmBbJ93Jce9wLFg9xg3yKzWU4o
         TD8Q46OuaqlNu74t7gbuIxAa2agylfw2HXSIsIfrtspJKt1zzG8T0bsNog17TcTesPo0
         mNt1B105cp8ZZcnbh8BnOddLbqsmxT7h9+PyOEgplqH7vD3wM/yIAupTGbuAjtCVJ9BB
         uOK4bBvpZwtAysgu8d0gZgWwwADWBOI3OeawYnJzIR7hcW5BJUdOGKa3Tx5OJ9mjUdeT
         6HebtduEjECt5SAn85/twe0+GlKsGL6bUkSkQafH0cvwLvMBdlljz/URle26R/jJkgbg
         CNhQ==
X-Forwarded-Encrypted: i=1; AKwUvByn+jT72TeJDt7SF5aDLrbWYIlDoshc9IVjCv7BOSxJKSQzd3SsOadtUVg9OfG+5amQ0f7Xa73M1xs=@vger.kernel.org
X-Gm-Message-State: APuU4Z/xKoq6DDfmWaVaapmguIlNU66dYxv6hfarYvY9Um2yULboKKFG
	2YQdZBxet6lb4gqrWYI8pVetDfEcIFNBuVunxFixSR9tOurngGzSOpJaVq3xQw4Tp703uBRXe+A
	x0wTVFMnMpznmH/ACun5vznE5MtPw7D5gLJYfw8p58A==
X-Gm-Gg: AYBFou3a05ozgX1sYUzGMT4W7UDGQoaFrLogHtY6RNDfp3hMDNaYBZ179CztozMHzxQ
	jjrg9tPL88/7jwA5Xo6bSPT5LtbAbBF8EfLvKYPghY69m4YcvVk7chKy9je1tPdKcuYVCq6R3Rn
	SWB7zRq1WiLycvlZOLUixTasqAFdPn6Zhgm3R54DkSjv2pdc4YnDybZJ7NZQ0uirVrOS8xWSP+/
	BoQGaxqEAFM96S1zTE4qSTPBwNcJI8g7eDUyy5cUFf/xYWnw6fKB/qih7NrFilCXi3bV3C45eFz
	Sc7n6FZyNHm7fVKfd/BJ8ch8yLszd9+v8wBhTXuI3/tEtPDUFNX1H7kK7t733gLEtdKrZNZPeTD
	Y7EeWYri/wBBfo6jKlVDHuTSGmu3cyrK0dLlXxg8YxRjDlfn3p+ZsDydtjWnZllwXGK+pauqpnL
	wujYtPmM0rbPGAL1sM2nD5zDjBzsrB2qwWvweOqNngL8ps9B7ZX94QgwSqmgM2s1e/bauQwIkY3
	uI8PMOXtHLqDEjRUQLsIFzcpA==
X-Received: by 2002:a05:6214:e87:b0:91c:7a51:ee57 with SMTP id
 6a1803df08f44-91ca4aeaac5mr203416566d6.15.1793671949650; Mon, 02 Nov 2026
 18:12:29 -0800 (PST)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261101022257.52819-1-mhklinux@outlook.com>
In-Reply-To: <20261101022257.52819-1-mhklinux@outlook.com>
From: Daniel Pereira <danielmaraboo@gmail.com>
Date: Mon, 2 Nov 2026 23:12:17 -0300
X-Gm-Features: AclHuK9uvtjaaPHlebO_GILeXhtM4eF9Xw6fUbaddVzuMdSO3LAS3jPBYG1eB3c
Message-ID: <CAMAsx6eCrbcseb=eM_GW+3k2YF3t38Was35oQHW+3UkidsvKWA@mail.gmail.com>
Subject: Re: [PATCH 1/1] Documentation: hyperv: Update docs for PCI pass-thru
 device support
To: mhkelley58@gmail.com
Cc: mhklinux@outlook.com, haiyangz@microsoft.com, wei.liu@kernel.org, 
	decui@microsoft.com, corbet@lwn.net, skhan@linuxfoundation.org, 
	rdunlap@infradead.org, linux-kernel@vger.kernel.org, 
	linux-hyperv@vger.kernel.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Michael Kelley <mhkelley58@gmail.com> writes:

Hi !

> +and unmask interrupts. It becomes the parent domain for the per
> +device IRQ domain created by the normal Linux driver for the

I think "per-device" should have a hyphen here too, since it's an adjective.

> +"irqchip@<paddr>" domain created by the GICv3 driver when it
> +initiaizes the virtual GICv3 hardware provided to the guest

Is "initiaizes" a typo? Shouldn't it be "initializes"?

> +device's MSI/MSI-X registers/tables. The guest writes a virutal

I think this one is also a typo, right? Shouldn't it be "virtual"?

> +Once the host-valid MSI message is obtained, the guest must treat it
> +as a black-box that the guest does not interpret or modify. The only

"black box" (no hyphen) it's used as a noun here, so it shouldn't be hyphenated.

> +valid guest action is to write it to the MSI/MSI-X registers/tables
> +using the .irq_chip_write_msi_msg function on the HV-PCI-MSIX-<PCIaddr>

struct irq_chip has no .irq_chip_write_msi_msg; shouldn't this be
.irq_write_msi_msg? Same in the last paragraph.

Thanks,
Daniel
