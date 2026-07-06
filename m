Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AFD62F361E
	for <linux-doc@vger.kernel.org>; Mon,  6 Jul 2026 17:05:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783357524; cv=pass; b=uS5mGnFfDM6qeQqVNGIuvEP4tdnlx+c91KHSH7TqwPPAiz+z0gjF00JzXo+TwWj/Kex2PDw6/cr1ry5sREGV4nnTtP4yLVg9uufAATCKFu2EyxyDQajHl8Yizj/St97ujgtRZ9UDFy2AEH5eQWVX+FtWQdA9h0fOqmAbsVRCD2c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783357524; c=relaxed/simple;
	bh=VO6PHtsgdagbB7FtJTbI+v2k78zEYcWzywMO5KXVgHI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Y96vSzZtKQWRfgxd4iGpXwvBLojYn1OGgxGVRF7lbhRmwbkqdxweoYaD0a4jLLHuX1K7QgPZoYprDjEbVugX/Lr+6NdrUpHMOtAXM0aPGJgVsTRI+ZJ9Yggg4QVhv+fL/SKhdNcO7ikZdBnDNmcfiyYfATpyGSTWXkx4daBdOro=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk; spf=pass smtp.mailfrom=thegoodpenguin.co.uk; dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20251104.gappssmtp.com header.i=@thegoodpenguin-co-uk.20251104.gappssmtp.com header.b=vLVvuR8F; arc=pass smtp.client-ip=209.85.160.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20251104.gappssmtp.com header.i=@thegoodpenguin-co-uk.20251104.gappssmtp.com header.b="vLVvuR8F"
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-446f87b6de1so1450526fac.3
        for <linux-doc@vger.kernel.org>; Mon, 06 Jul 2026 10:05:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783357522; cv=none;
        d=google.com; s=arc-20260327;
        b=RL9j6kJYDM26FInWjDhtJz836Xtxcgy14G85ToPxbg87AG3Q4mKI3qdvTrdcDfdF4a
         IZ3wyAK+3O/qdOJ7DAzCIK0gh8+28BKbGgkXdCm44wXsQmdGS+gxb4me7kvYChmkuvxw
         VtUclqntfH6RiZohzjgOT/iuiPUbKO+DvBOZp9XN2S5RDcEAOFCe6fmo70XMqliTXcxL
         TF3rib/qNuG8CWpJKtXdT/iPNQ4034K23CnQGPaTN2kn5R7lWtcIdaqFB38b8L4RXgS4
         QAAHY9BozECKI/cAoLuUjvuDUN3phVhT2j4Sr9asmoZZ/G1tZveoMXw+S5oEVE1UuSLD
         Qc7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=67X5LYINdi0M9S36BvC7qBNu0eKXvr2elw+XJ07fWOc=;
        fh=Z740I0EDr+pCfhSverMXz0Vm09TVhvEwYeXvRlyn4Pc=;
        b=KQdCrwdezqKvhrAGz31QIQtFzO4dPLsAdqIeqBzSG/LfNizEdqvWrjjRQjcMqBVAuI
         JUf208D5MdUa77E7ujq678pK1RXXKrOVtD+L26b354LZ2H2Pro+uiqLmPnXG3obR1XNk
         Sv0ylxTO0us39QFyeVR4hcNd4bh588oS/oHoVLgt3Z24B4eTqNUMz7exLhhJn4kT5DVw
         kpmX/mlXlc7UC05klEc6csTvWJSAyC0Yb/GLyYh7hiDBKpjo5kWueILCytE35XcdNJse
         BuYRCYfSkRToaG9+JOpJP9yUbAtPWzz8vj/a4RX15FUcsJXzVeELVPx2WAM7EY9gLJcR
         Aaww==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20251104.gappssmtp.com; s=20251104; t=1783357522; x=1783962322; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=67X5LYINdi0M9S36BvC7qBNu0eKXvr2elw+XJ07fWOc=;
        b=vLVvuR8FIGywSezBlp24cMp204aTrcQfNgpoZCkDTz1iE2QH495jx9fMzOd69lJrOj
         tXzSqx7U07HmuKMs8qmNXw7ij16LT46uRaaeRKG99jQPoVXB5/TG46ZOhVki+MONJ92o
         ASHwqdR4K410WLL6kkCn5CuUr/b1qOORznddVi8jQU658OddMNI0+hLXqcbghscpcZkO
         W2AhYhDUXkAYtSS/wRFjuiAm0a4A1K6SmxIV60g2QPISuBm98nRbrxYlajlBSH8ZqTjx
         XWFwwG822H1zOTZPZM+ITHuZgE1t8kSH5jhDZJ9fRMOTUXdV4mpO46oFih2//Uzcgf8G
         GuJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783357522; x=1783962322;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=67X5LYINdi0M9S36BvC7qBNu0eKXvr2elw+XJ07fWOc=;
        b=jebwthKidK+29gfIKQ4d+HJmP0sKblk/geHuHntj7cec/OmFidU1EtzEl5HurzL/Ql
         1eABjDTULn/ruST0dtbhzUvlrAFIxa1mBwXgOzD/IiZsQTh3xGhZGPfbOhY2Rjz90ZVh
         veeHz1Py3OehfT1EBxyBs+oiwT7dwLXgLQ8H3nZLKJzi0iTPChKegnGJkcnc0uA/0YRt
         eI2+56Wlp8fcusF5N7UzkVVR4ITOHSJSr8jRa1Juc69xhFavd/9gBH7ojTX/zR1uyntd
         OyYSsB3bX4Vpx9ZO+jz3VlchH4PixkDPlGX8JO6coMySy38LL3LMEBhm0iSVeikwB1MP
         dfhg==
X-Forwarded-Encrypted: i=1; AFNElJ/kQr993L1K/dOFVYorr8hGMACTa7+Lr0Vapf2sCGqAi8dnL1SeaSFR/4LKQihdRDEf2HT+VhC4KXY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzos7qL8hxSk/EM3IkBRp+dZPkmmFEvWc409PvRRh3lYs41Vswf
	aqrKv/ZMTLbS654M/fQ0HHT31jdA56o/eczM62klNuZMRy4OFLGwCln5GQAajvjqlSJ0sSPiCDf
	I08Il490CA1f5u6Y3XNyBOECCNsK7wEh/2j3fGpIokA==
X-Gm-Gg: AfdE7cmwSitcZKhA0Tn+t5308fuozKDVziGS8Uq5CQLYH6XEau2d+VFDe1QVpamT/74
	KNOEqnKBvPEaC/I3ogCCBmNoyRw7soZ+Ry8HLmHFHWL8RSdCy3afNzA8uHwi9R/xvaAs2SoSs/F
	xIEHizVNYmhAKjY7hEPpPfkJijceARCfSp09ZlIbTa45zTdfCFqAS4gPLT262C4kE6pkcLoWWF8
	CqhtYBhYLdhU6P8HtD0d298wG0Zs865Qv/d+91mpxOWCQflV1Exas3GOVKef9JR4CUlwpg4XHFV
	ZiAqDE177eDAqCVBy7Ir+Z7ARvlJmCe9u8mStHf2LpJOz5JXlgxsuv5E+ZGL2IsIyY4zougZYhF
	usxNMQWRWVlizULfDBbfcGPfF3gAc
X-Received: by 2002:a05:6808:d51:b0:489:f088:5f70 with SMTP id
 5614622812f47-49fdc43fd75mr863942b6e.12.1783357518923; Mon, 06 Jul 2026
 10:05:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260630-deprecate_boot_delay-v2-0-f9883d36aa4b@thegoodpenguin.co.uk>
 <20260630-deprecate_boot_delay-v2-3-f9883d36aa4b@thegoodpenguin.co.uk> <20260703165654.71be8707@mitra>
In-Reply-To: <20260703165654.71be8707@mitra>
From: Andrew Murray <amurray@thegoodpenguin.co.uk>
Date: Mon, 6 Jul 2026 18:05:06 +0100
X-Gm-Features: AVVi8CcK4KThiGNbLieHoBIY_N240yIFnZsI-soA1OiCf8SyfTEOi9AvBW_Bzmk
Message-ID: <CALqELGz-KSrGq5JYvLedZiO-p21pjpRKbceO+jiSfwZGyx+91Q@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] printk: nbcon: move printk_delay to console
 emiting code
To: Benedikt Spranger <b.spranger@linutronix.de>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Russell King <linux@armlinux.org.uk>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, Petr Mladek <pmladek@suse.com>, 
	Steven Rostedt <rostedt@goodmis.org>, John Ogness <john.ogness@linutronix.de>, 
	Sergey Senozhatsky <senozhatsky@chromium.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Clark Williams <clrkwllms@kernel.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Linus Torvalds <torvalds@linux-foundation.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rpi-kernel@lists.infradead.org, linux-rt-devel@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi Benedikt,

On Fri, 3 Jul 2026 at 15:56, Benedikt Spranger <b.spranger@linutronix.de> wrote:
>
> On Tue, 30 Jun 2026 17:35:59 +0100
> Andrew Murray <amurray@thegoodpenguin.co.uk> wrote:
>
> > The printk_delay and boot_delay features are helpful for debugging
> > as kernel output can be slowed down during boot allowing messages to
> > be seen before scrolling off the screen, or to correlate timing
> > between some physical event and console output.
> By now, it slows down the boot process, which is the handy part of that
> feature.
>
> > However, since the introduction of nbcon and the legacy printer thread
> > for PREEMPT_RT kernels, printk records are now emited to the console
> > asynchronously to the caller of printk. Thus, any printk delay added
> > by boot_delay/printk_delay continues to slow down the calling process
> > but may not have any impact to the rate in which records are emited
> > to the console.
> Using this feature to slow down the boot/suspend/resume process and
> implicit make printk() happen, is the usefull part of that feature.
> Imagine this sequence (which hit me on suspend/resume on i.MX after
> shutting down all secondary CPUs)
>
>   printk("A");
>   (do some stuff)
>   printk("B");
>   read from peripheral --> system got stuck here since peripheral was
>   not clocked or powered or both any more.
>
> The delay (and later on a ugly patch to make printk() synchrounous)
> helped to locate where the failed access happend. JTAG did not help,
> since the CPU got stuck --> no JTAG communication to that CPU.

I understand the use-case, you sprinkle printk's so you can find the
point where a read to a register causes the CPU to stop. This requires
that the printk happens before the read, and the output from the
printk is printed before the read.


>
> With your purposed change you *may* see "A", but never "B".
> Quite challenging...

At present you may see 'A' and you may see 'B'.

Prior to the changes in this patchset, and assuming an nbcon console
(which may not be your usecase, but is perhaps representative of
future use-cases), then the printk delay will always happen within the
call to printk (and always before emitting). However, depending on the
context, that printk call may return (and proceed to your CPU halting
register read), before the message is actually emitted to the console.
I.e. it's a race.

This series moves the delay to the emit side, as well as moving the
delay after the emit. Thus the calling code may make progress more
quickly, but depending on the context, it may also flush/emit before
returning from printk.

In my view, with or without this series, there are no guarantees that
you will see 'A' and 'B'. And in any case, achieving the functionality
for debugging required you to modify the printk anyway.


>
> So please leave the delay on the calling side - it is helpfull there.

If you want to ensure printk is synchronous, perhaps you could call
nbcon_cpu_emergency_enter() prior to your printk, or perhaps there are
already printk wrappers that do somthing similar whilst debugging?
Would that provide a more reliable way to guarantee output?

Thanks,

Andrew Murray

>
> Regards
>     Bene Spranger
