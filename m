Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 807E624B246;
	Fri, 10 Jan 2025 19:39:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736537975; cv=none; b=eNW03AK+dbBhszBsfMxjDKv5cXATK3wezGDJ+9Ih7w5icVwCncoIJ35wDBjixkzWdBgYQntZ/SngBuYt3DJe7V45WmFbZyXD/pPQwF4hh6m/l52St8gkfMyRDMt1R8rIAydqVbnwWM+AaJ4hxihScDV2uOek82jXSluaw6wIWkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736537975; c=relaxed/simple;
	bh=aTiXj76QI+O1NhtxLmglpZFEnSxQ4gE0LWb6tNZ3RAc=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tKLKeNs61Z3lXan9LVQD8VL4DcbzsfK2p9InTKnnA/ROWFCpaoxj2L8dMhWsIgeX6TQQKk0237sZG1u2VCNiCCHNVJUK3+EZt2dhDGSXCkIbus3IhZLwKGQcwk2AN/5P2AB2estPz2bH13apejF7cOuWC/Gtv0MQXzThspGJoJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OwAzIVxt; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OwAzIVxt"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4362f61757fso23800055e9.2;
        Fri, 10 Jan 2025 11:39:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736537972; x=1737142772; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FvvvGyaELGl+fqDBg6vRv9hw5GxuC4B+ZEuyQjYSLfs=;
        b=OwAzIVxtKaY0cbxDBfzfou2CTH6PVE0uvSeOS15LIlQzxe6F/DPwDx4Fg/ygTFEboL
         lV27sTmKeq+MvtMrj+yXoQjYM8pzOeFJ589VKkZB0nQT8TtjrqRzHrZgqeVGV99x9yxR
         ++1mvwvdZKi4M8K7ssrhM8K8NLqOH9aamrLiLY8lpCMZ33tccuFS1FEXNn2byAguftpa
         3mOQsbxYLUMUnKajKq9a2DjwUbFKKsFpUZ6sfp2A5pp3ipkEv5RkQ7hwCvFzma//hs7s
         MOOf7ZpX8K1pnEextSPUmbyG3knzJf4uRYni8Av3+i3MdgB7lYqNGU5HkXEaHHf06vco
         qJ6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736537972; x=1737142772;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FvvvGyaELGl+fqDBg6vRv9hw5GxuC4B+ZEuyQjYSLfs=;
        b=FwMpS615jsdsGRd0xrNQiFJ9CyM4TxOo3SJtuzkJKkTq+KBDsDt3xewnQS5ljSiNja
         tKWro/IuzplZ4tSPbkAsBQs7SqK6kkgMsL4gQrW2J6bGhyRbD67Rzsy88BGg5QOsVpn2
         omuF7ZwdQEIj9kLSdtI9WtRR4yyo7Z6hgMTP1VcxwbAlIWK66QVEvGJntVGT/LszLuVZ
         mCd7TST8mC/WnPF+Dgyz1yeZVJsDZ+kul1zXK7mCcpj3zFANgNmEbkCt0uoQ+RPhhouu
         fMob8w7+4yfpZX3ZPKP/l2MpwS5HSmHpwHhc2mstwJZjUQH+Aoj+l3VpdjaA/RG6XOyz
         ExTA==
X-Forwarded-Encrypted: i=1; AJvYcCUIJpxVDxgs5CnjTXF1+ZlGBNlMsLwp99kW/xvqRgxmpcE4x/dL6CiB8sCxHOQvaC6IPfoehuA2jxRLFYyT@vger.kernel.org, AJvYcCXJfNs4CWZLStZKZ9pz0LslhH6oiLzVNx210ywI4Sep4Tf4bI6f7LCIOc+Cbsw8MfePTQdKPPwltlI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2IX/nkpq7eB99dFIHRlSYGIxWGS6tmTWQAmadFkE/tNCk1N4C
	Zs/kLt0/aBmqdFMiqMORzcPnnGTaXxTO0+Lykj0Az6HJBBUSoqa2
X-Gm-Gg: ASbGncuowXn5RslxtEovzzOIhRi1djVAjhHbLBzkhteUyXYQji/fgA+kWdFI8PEjqyU
	3PbE29FV0YgBgbENfzfDMq/nt26nknR+kQzVtfp8rMSKnCYmbuWvx5IeNq0edDS7YPbDH7KbJ/1
	/QCt3SFqHQZWwNpvG+Ea5BBmxJA5UkFyJmq1rHgqcRlki0ZvUBSbZqb80TNd2UZBCYLntkKBmqv
	cP+yH2/txerzL+UikOj3Ufs8OIj3HifM6NR9X4MDDNahOLpYA+eO80p6co22+xbSao08F/HPsCU
	utjLbH7g7ijMnhXufQs=
X-Google-Smtp-Source: AGHT+IF+qXl4KwkSrAazwk00crSEfqT7LVMCmKBguBo+i69wuF7Vf0dGAInA5lUIqZGwLhuYrx6rVw==
X-Received: by 2002:a05:600c:4511:b0:436:5165:f1ec with SMTP id 5b1f17b1804b1-436e271d428mr124078975e9.30.1736537971593;
        Fri, 10 Jan 2025 11:39:31 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a8e3853b6sm5251815f8f.44.2025.01.10.11.39.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jan 2025 11:39:31 -0800 (PST)
Date: Fri, 10 Jan 2025 19:39:30 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Petr Mladek <pmladek@suse.com>, Steven Rostedt <rostedt@goodmis.org>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>, Sergey Senozhatsky
 <senozhatsky@chromium.org>, Jonathan Corbet <corbet@lwn.net>, John Ogness
 <john.ogness@linutronix.de>, Andrew Morton <akpm@linux-foundation.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] hexdump: Allow skipping identical lines
Message-ID: <20250110193930.26b08c2f@pumpkin>
In-Reply-To: <20250110-perso-hexdump-v2-2-7f9a6a799170@bootlin.com>
References: <20250110-perso-hexdump-v2-0-7f9a6a799170@bootlin.com>
	<20250110-perso-hexdump-v2-2-7f9a6a799170@bootlin.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 10 Jan 2025 19:42:05 +0100
Miquel Raynal <miquel.raynal@bootlin.com> wrote:

> When dumping long buffers (especially for debug purposes) it may be very
> convenient to sometimes avoid spitting all the lines of the buffer if
> the lines are identical. Typically on embedded devices, the console
> would be wired to a UART running at 115200 bauds, which makes the dumps
> very (very) slow. In this case, having a flag to avoid printing
> duplicated lines is handy.
... 
>  enum {
>  	DUMP_FLAG_ASCII,
> +	DUMP_FLAG_SKIP_IDENTICAL_LINES,
>  };
...
> +		if (flags & DUMP_FLAG_SKIP_IDENTICAL_LINES) {


That doesn't look right to me.
You want:
enum {
	DUMP_FLAG_HEX_ONLY = false,
	DUMP_FLAG_ASCII = true,
	DUMP_FLAG_SKIP_IDENTICAL_LINES = BIT(1),
};

and maybe you can get away with not changing all the other files.

	David
