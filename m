Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2593743CED3
	for <linux-doc@vger.kernel.org>; Tue,  5 May 2026 14:26:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777991205; cv=none; b=raFaymR9owuXhGTwGfZl40VHgE0niUtxBI49xJKOCgwREa4qvp5Tee2JPR4yVpyngaH8Qv6DMGngVwdfD4jUWjYOj3OsE2xh6OVtDE9s3sMqtzp7UA4eP3nevFRdNgcDG4GV+9NUKnKpXYsGn+jP+NcWi4HzTR5sP6hcTcStI6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777991205; c=relaxed/simple;
	bh=R+Bl4Tihft3hXjytWck/czW9kH+Ro3JoXapjuLVVGCo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a6782ra6f1+KKNAmGePRe6+KGND7znQF+XCJVdEwsDzJ6H+MF+9x1KhmcSCNK2KZQQTqF04sGsovFu9o07GoSLxNZDxT+ppgY/pNBpZVRvrJ24ItJi54g/Fcl0U/nAacBuvdncKhw310/ti3Q7RGThdOti02cdxd5fE3b6panqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=X9GuZZ6y; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="X9GuZZ6y"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-488ab2db91aso63610865e9.3
        for <linux-doc@vger.kernel.org>; Tue, 05 May 2026 07:26:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1777991202; x=1778596002; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=iYyeBIbryO8JN51e301x9bqZZvN4oLOHjzKYFZ6iv5U=;
        b=X9GuZZ6yNVHWn9oWcIeb2TWBoian3NCJZtlIE1w5/ffc8Rx/T3aGOjw5omfkxYuoJD
         we0DGkg/eV4jeS54XBekGmRdIuoLzlsSAf6VJ45JLTmYwhyXFIfI2VfqnQtf1OOQg04i
         OxfivW/69Kx5T7dAvQYnl63yfX8ibhDFHpJHqxihQIaVAUIuy+vXHTYtS05S/5M5Jc7d
         ijVgFs+2EOO07w+q33jw6kMuGf8Lh/8wN945x0KIFESaOu0OtnSNaGFSKH37X44wsoWq
         SdplrFypUaTM31H6KCuVD2BgYNcUmCwD13Xe+vkDNV1T60NeeY6Mebs9P9I+CpjBZ6Lz
         eenQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777991202; x=1778596002;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iYyeBIbryO8JN51e301x9bqZZvN4oLOHjzKYFZ6iv5U=;
        b=DS8dg+GN9jxjoTkhyLXdTAAYuo/285WbfH6skwez0Bs0IzJWd5ZsUlR7ovmtHruvHJ
         w+SJkUuRETtqqSDikyM8YqRfUTBVZbNUoQy1jkdr12yahUOfHN/NHPGzpwUlAmaqEuLr
         bYKhpzsCZ16Sg3PbPAHOSFdEXTdwHwuSsEWfAEd9UjYzMihPIaU5Dyo67ad4NyloEgji
         nCgLoIkccDYRc0TlOJqm5/5+iWyYUKP5jtyPvXDaV/3WTSbX2XiLPhm5lD/Ij74NrKGm
         jZpGmt3opXJt4sN/tlLY1gmPLa4jQ9Itc2vFX8VwnwEw/fRE08Hio9/kuwX6IZyshgQn
         nDmA==
X-Forwarded-Encrypted: i=1; AFNElJ91W5BDWIMDV1Ry/HFJmiVOhEiu/DNRE0b9MD3EOJLTqdiBwVLCxvlygW2P41i1kkLHPhJDEIQRG0o=@vger.kernel.org
X-Gm-Message-State: AOJu0YyU/6iYedtqo3xuMoCwaAyPdgEyKIHdOoDvfJQsF5SU72B9wSr0
	SNN5pmavWTscjiU6ZBrE0mHF88GhL8BFCU25gk+JzrLy0xEZz1Nq2Lt2xiXAiWXvP94=
X-Gm-Gg: AeBDiescwYBF9FGt8UFdwMpvwnTkf+JJwkEbRGkLMrTtZ1DCtr/NeB/Gs8ZS1kYtwhK
	v66NcfssH9JMOy7lbZSWulj7yS+jkXHPZDlp9ZL/jQOn+AfAQ16xGUk44pe48BeF8Sd+I4uYkkk
	2guZV7pK5zSlxvRQs8VoVXxQOWO5WBYQBpMpsBq9mWINSEHnuyNfCRg8gOP/XNjEOTNyOJXQA39
	SE77DqL6Jil2UsLVGG+qduYfBXEZWVqwjtfAgx58iCpU3YNs5IvrMFCcDmmKbfGsmus3eO144k4
	RLpE8zxpESQ8IkNyMgaIPmud1vNw8qMvwCLPQG812hMHyTlF9kQ9BgGQinxStaMMaIcROlmlXbX
	3wXc9RR0v7+rDxaHHcd9rL6ErNDHtxLSaJtZtBQsqKVvffSWGljUj7HbNAZFl9256Vu0TZM/dZo
	OMS4/hPbWu3BvObCkoxBMpcKWSI+0ym65dtPwb
X-Received: by 2002:a05:600c:4ed2:b0:488:a639:b772 with SMTP id 5b1f17b1804b1-48a98639ca9mr248173345e9.7.1777991202385;
        Tue, 05 May 2026 07:26:42 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48d17ff35eesm19631165e9.14.2026.05.05.07.26.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 07:26:41 -0700 (PDT)
Date: Tue, 5 May 2026 16:26:39 +0200
From: Petr Mladek <pmladek@suse.com>
To: Andrew Murray <amurray@thegoodpenguin.co.uk>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Russell King <linux@armlinux.org.uk>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	John Ogness <john.ogness@linutronix.de>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Randy Dunlap <rdunlap@infradead.org>,
	Clark Williams <clrkwllms@kernel.org>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-rt-devel@lists.linux.dev,
	Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH RFC] printk: remove BOOT_PRINTK_DELAY
Message-ID: <afn-H1EQJxnDs0BZ@pathway.suse.cz>
References: <20260505-printk_delay-v1-1-5dba51d7f17c@thegoodpenguin.co.uk>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260505-printk_delay-v1-1-5dba51d7f17c@thegoodpenguin.co.uk>

On Tue 2026-05-05 14:45:00, Andrew Murray wrote:
> The CONFIG_BOOT_PRINTK_DELAY option enables support for the boot_delay
> kernel parameter, this allows for a configurable delay to be added before
> each and every printk is emitted. This is DEBUG_KERNEL option that is
> helpful for debugging as kernel output can be slowed down during boot
> allowing messages to be seen before scrolling off the screen, or to
> correlate timing between some physical event and console output.
> 
> However, since the introduction of nbcon and the legacy printer thread for
> PREEMPT_RT kernels, printk records are now emited to the console
> asynchronously to the caller of printk and its boot_delay. The delay added
> by boot_delay continues to slow down the calling process, but may not have
> any impact to the rate in which records are emited to the console. For
> example, if delay_use is set to 100ms, and the printer thread has a
> backlog of more than 100ms, perhaps due to a slow serial console, then the
> records will appear to be printed without any delay between them.
> 
> It would be unhelpful to add a delay to the printer thread, and it would
> not be possible to disallow selection of CONFIG_BOOT_PRINTK_DELAY at build
> time as it's not possible to detect which consoles are nbcon enabled at
> build time. Therefore, let's remove this feature.

Heh, Randy proposed to remove "boot_delay" few days ago.
This RFC goes even further and remove both "boot_delay" and
"printk_delay".

Honestly, I do not feel comfortable by this. The delay seems to
be handy when there is only graphical console. I would suggest
to do:

   1. Obsolete "boot_delay" with "printk_delay" as
      proposed in Randy's thread, see
      https://lore.kernel.org/all/afn2sYKKsqG4QBVX@pathway.suse.cz/

   2. Move printk_delay() from vprintk_emit() to
      console_emit_next_record() and nbcon_emit_next_record().

      For nbcon console, even better would be to use a sleeping
      wait in nbcon_kthread_func(). But it would need some
      changes to call it only when a record was really emitted.
      Also we would need to use the busy wait in
      __nbcon_atomic_flush_pending_con().

IMHO, the only drawback might be that the delay might be multiplied
when more consoles are registered. But I would ignore it. People
would use this option only when the graphical console is the only
one. It does not make sense for serial or network consoles.

Best Regards,
Petr
