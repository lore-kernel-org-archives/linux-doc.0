Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795163803;
	b=xiJi2nzKza9oF64UuNTCM7rQKs2s9BIBS3PB4M5KvqlNhNl6o0DCgKFPw2nL9rDxIbD6
	 6jB1cAhhSlKxqmjjxpaO/HeVsTef/wOWaeItcRVYD9IWNr/njbwSSXG2BGhPZZp6lmHWx
	 pKSo/qZ725vsdxqw6vyJgMsIQvmJO5+HsgO4rjablfawdKKzu5VA/h3TSBBThDGTsHfJF
	 XHZfPtdpkd6NgP6qZTjTm5hbw3w+/9/13H5uBDAc040w5xhcGPG3xAmlAD1gj5LJabeQr
	 nSTHLbscwkwO2QZaOgaFizNdWq68zZWYk/x1jd1QnsGLJ8GcEoQ/3p20Ig4iBoCpO0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795163803;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=FroopTMuPleqi9xrjHNZRUYAbvATL8axnG/vJHY5tGg=;
	b=06T0pMyppdWv/E2mOaE7dGRiKl2CmYpvdgHYvjN+IDjPLXcwQaJkQtmJ33H3fNvdrgSt
	 z9PPfCqFG+CwzoeV+YznBfxfaKDrxXh53HPcnZwXZe4u07OI964G9ydc7ba6M9G4Qharx
	 1NXT5HQFtkpaJ8OwMzzjjRcbwEPLVsmMuAti/z5QXn4kRxJLH6Ywl2kxf3m7zoCaWAi3l
	 RncTqUB7G/Xi5sp7W+ZuAh3/ZJavvE7uoE5p82Sa11VvRhUa0iRTKQz5BYsOnDJXPI3Kt
	 9uX1L9LLX6aSQO4eeae95h3XyJkB5BxBvt+CbY/CCgEcj9L6JqmetZUiqjoZO7NDdTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=AxQH6ZrZ;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66D07606A325
	for <linux-doc@vger.kernel.org>; Fri, 20 Nov 2026 08:36:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 66D07606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=AxQH6ZrZ
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4bb68c197c7so7077215e9.1
        for <linux-doc@vger.kernel.org>; Fri, 20 Nov 2026 00:36:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795163801; x=1795768601; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FroopTMuPleqi9xrjHNZRUYAbvATL8axnG/vJHY5tGg=;
        b=AxQH6ZrZwJ9W/gB2/sdllan6OZ4LeaBTfBKfPRBCT+bx4uIxeRrAtD3oGP6kzXMN7k
         HbC1fbAxzzkJWjipSC2Eblyo1vOzOExgA8/qO1Ic344acKBd3zwu43WcoQUt4Mk3fj2M
         v3cNi0+bCQPBoEX5mbQAkmCL/yAcZez7Av0PRoht88S3RQaIwoohB/zHwrAT1TB0HhdK
         DAvoVUWgcCm+4T6ETWHFCUHgSaen0n4x5s9FkMZG/Z/KKkRcEWhDQQIqSjOPxSMiQKOy
         QLB4+p3JhAD92LCmBlNbFgRX8f1MnlpwL+C32Vy+EVuoWH4LN4JhVN2DbZDpP9KkpzPS
         o0TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795163801; x=1795768601;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FroopTMuPleqi9xrjHNZRUYAbvATL8axnG/vJHY5tGg=;
        b=Z0vpf2jKbTfF7ZV55krNGtioYSVQcnKo2XdkN0ZQb1UFPBO9I2qCWJdCXMcKah96o5
         gEz/aZXqECMDJM6KLCjtd7rqYDiuXOgPiy3INr5P22Tqfk9wZAUzbDN02n70zoKlDHqq
         8xcsmS3PeGkY4kvuWaBhMi6gQUhNwVowCAhLAVAse0Igey2f9P1CyFQCXmfu1PgM2Qds
         hz//WzNK4UH+ihrAGvjM87SIxKEbeRnBKIpYcYDBGMiPNAePNShhm3w8ghEuCPf2lz6t
         zT5oe+E0qdC2W7+X+agTZLQEBZg4oI9TrJ1chGNMMRR85E79CiVZ3Q4aoS6rkoRyUY/W
         +5SA==
X-Forwarded-Encrypted: i=1; AL+hErHfIlXyLfuilnY6tebqkIDZVmWiNKU0jYeu4i4i8uwqsL1wb5fDRC68JQ/u8rOy22ylh0HA8xNXJY4=@vger.kernel.org
X-Gm-Message-State: APuU4Z9mqmIvP2IapPncWNsfHUS1KHxFRhh4nP1foafYJcsseO30KC+E
	llYEuyMlJsefZGNBgCTmAtgtef58Lr2OB+aQk5dlongh66yVG4+7Jh2DBizp7Tz1QGw=
X-Gm-Gg: AYBFou0rFy8XZtDnIFVfPaxnTM5ivn9c8jDbA78jhFJ0HWGwvBRc/JQPlc0lUSeO5s3
	ukcbzUBT+gvz8JQHvAnfLkBryc2nuAyFuW6XDSNbRLdi2IxGmlfTdnF/7EEnlsdTZEjp2aLLHoh
	IoZeS6dOBjqga3FQUUM4FLrc0r97BThNf7no3C3DC8kCOjQFA28iby4qTf44SzvCJks5WLFyqW/
	8MnlbxggDdQXidJe7CP8aiiwqCbrMuKwq+e3naAXZV9FNi55jrFOPI96fUuYmv0HIEnyxHJ2vny
	GN6jBdpgHoBoUkFA1uIqM6TiPYaIUZWsyT86le4m5aQFDrjZ7GUanexEI8eBYEKguCzkDHMJFRm
	ckpcoAtUrdPSug0ewIPmBDq8vt9fsEDRP1oWlweqWe2jqGzI8OkKj/8PIR+KFcalwxbrAxPROzh
	Auteh42uzavTjcDIgZdh04bIF5WFl5P2OFHhd+Nr5DDOozGfjibLULPn54v76anmxP+ERWpit52
	yvzwEAQANstxj1N+/k3UyHzRmihkOxXNM0ew45fXwNY75KM+F7WZ/VQJ7wv3OOhAA0pgry09C7F
	i03LKk8FnLz6dZJD5nybo4FvMorggHhHlt84JqWWUg==
X-Received: by 2002:a05:600c:4e16:b0:4bb:6f77:1e35 with SMTP id 5b1f17b1804b1-4bb88810991mr53940545e9.21.1795163800697;
        Fri, 20 Nov 2026 00:36:40 -0800 (PST)
Received: from pathway ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8526cbd0sm126587935e9.0.2026.11.20.00.36.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 00:36:40 -0800 (PST)
Date: Fri, 20 Nov 2026 09:36:37 +0100
From: Petr Mladek <pmladek@suse.com>
To: Zack Rusin <zack.rusin@broadcom.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Baoquan He <baoquan.he@linux.dev>, Mike Rapoport <rppt@kernel.org>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Dave Young <ruirui.yang@linux.dev>, Borislav Petkov <bp@alien8.de>,
	Ajay Kaher <ajay.kaher@broadcom.com>,
	Alexey Makhalov <alexey.makhalov@broadcom.com>, x86@kernel.org,
	Joel Granados <joel.granados@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>, virtualization@lists.linux.dev,
	bcm-kernel-feedback-list@broadcom.com, linux-kernel@vger.kernel.org,
	John Ogness <john.ogness@linutronix.de>,
	Steven Rostedt <rostedt@goodmis.org>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Kees Cook <kees@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Bo Gan <bo.gan@broadcom.com>,
	Brennan Lamoreaux <brennan.lamoreaux@broadcom.com>,
	kexec@lists.infradead.org, linux-doc@vger.kernel.org,
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>,
	Maaz Mombasawala <maaz.mombasawala@broadcom.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Stephen Brennan <stephen.s.brennan@oracle.com>,
	Michael Kelley <mhklinux@outlook.com>,
	Ian Forbes <ian.forbes@broadcom.com>,
	Bradley Morgan <brads@mainlining.org>
Subject: Re: [PATCH v4 1/4] panic: Add a platform panic notifier list
Message-ID: <awAGlQhpaLtrHCAR@pathway>
References: <cover.1794980455.git.zack.rusin@broadcom.com>
 <3d156f7b5ec4f3d6f91e288a38f87d2368f1365f.1794980455.git.zack.rusin@broadcom.com>
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
In-Reply-To: <3d156f7b5ec4f3d6f91e288a38f87d2368f1365f.1794980455.git.zack.rusin@broadcom.com>

On Wed 2026-11-18 01:01:48, Zack Rusin wrote:
> Some platforms set crash_kexec_post_notifiers so their crash handlers
> run before kdump. That also runs every other panic notifier and kmsg
> dumper before the crash kernel.
> 
> Add panic_notifiers_platform_list for platform callbacks that need to
> run early and are safe while other CPUs are still running. Call it
> from vpanic() before kdump and before stopping the other CPUs,
> independently of crash_kexec_post_notifiers.
> 
> Also call it from __crash_kexec() if a crash kernel is loaded, since a
> fatal oops can enter kdump without panic(). Call it before taking the
> kexec lock, so a callback that panics can still enter kdump. Run the
> list at most once, including when a callback panics.
> 
> Add disable_panic_notifiers_platform_list to skip these callbacks
> when debugging panic or kdump failures.
> 
> Suggested-by: Petr Mladek <pmladek@suse.com>
> Link: https://lore.kernel.org/r/ateYxCu63pRY9EGq@pathway.suse.cz
> Signed-off-by: Zack Rusin <zack.rusin@broadcom.com>

JFYI, it looks reasonable from my POV:

Reviewed-by: Petr Mladek <pmladek@suse.com>

Best Regards,
Petr
