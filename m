Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6801041C308
	for <linux-doc@vger.kernel.org>; Thu,  9 Jul 2026 12:32:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783600345; cv=pass; b=I/r/Kkq8j1mWjS3a9r0dTxYOyoS0DEyo9Vc1apBVeoxS6NgUMj3WdBUch1HTkWkZnAQRLrUd2HuNyKYwVFXiRpsB28jaPFZRHDOcFFugQijMV2ToCHHRCCIW/3h5/NWbrUSq7oOxFqrV1F6ttdIZIfAUl3R4N12nRJB1vOkj9tI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783600345; c=relaxed/simple;
	bh=HpM5oyfiz/PBhye6COIAJQLw8QryulxM6H5RQMFWI74=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Mud286IJqqvjq2pmt4m3zYk9mcl/lreecGFN2FRorjyiV8D5Rz6euVDNrPQeL879rE5gP6GQef7YgELTnHVP8Rpftra3/myGAEKCpY/Bs6BCjJwb2fJIfLQtCkbhOTOw/8OB5iCBo91LS+AFqt6025h7gNRzv3dmD+CKxylCdT0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk; spf=pass smtp.mailfrom=thegoodpenguin.co.uk; dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20251104.gappssmtp.com header.i=@thegoodpenguin-co-uk.20251104.gappssmtp.com header.b=ZHPE9wRn; arc=pass smtp.client-ip=209.85.210.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20251104.gappssmtp.com header.i=@thegoodpenguin-co-uk.20251104.gappssmtp.com header.b="ZHPE9wRn"
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-7e9f69eeb6cso998816a34.1
        for <linux-doc@vger.kernel.org>; Thu, 09 Jul 2026 05:32:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783600342; cv=none;
        d=google.com; s=arc-20260327;
        b=ewGoC4glD06vihrmtWN9pV0nPgCFxj8MwAyTb2cy7vq+3ZZhdmkrvx0Y80m6jIxIB6
         6rurT+/7XH/0wy+pgck7Zz/WD6zAzNSJdXyiBG0Ze1E/MAMbRqtSFvkItUBESiabdpiP
         UbqmzCLzpSDJa0JHl7KNBNwZSnLLlqCmJCk3fc32/3tjmqnRGPDTz4Q4GLwOh4fSQX/V
         bw6mkRj4N5xRBVVfRtiUsqEIy1tfG8m5IewSjwGxLJVbwLdj3f7H5TouPJyVmxNml+Uu
         R/domv16c8F9G5jHY8kHp7nltmHb4gVZeypdJyuqAao2RJsN8hPPwbG187ZJc+vEsBDS
         65SA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Q6uaaRn1apsA/2p+t1DBPwc+zrUv3t/8R7VmEga46LQ=;
        fh=vEHNC7DBge0hamco2aRru3US34cw+KR0Bsj0V9BBaqc=;
        b=UdkyCB+M0t6KSAyJ1Zx8S5kRy1gixS1CO+w1ZlJY5lyxlMBfXi56b/J2yujv+QHNw8
         opc5gmN1udVoFi20TQX5kD4LhRhY805PIjovF7xx16aXKHiLdyyWoRRwclJHFBJaFtdp
         6fa0mp+jYZznD7RxhYlTUFox2dgO2vpAW7acGWzl9V6jOskjbyJkQiBG02APWvBTg8ao
         k8jTr1BW26PivOmT/DSGpWmfXhQ2hX3GxkE4qp4MvxlhYmCf2ssKKVsXK9LdY4rUKqaJ
         zzd1CLavkmSq4xG3XPYEHGN47E/QM+mYd41cfQ+sFw85tyyRQGp+ovu/HrBpPHKChd5R
         n6ug==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20251104.gappssmtp.com; s=20251104; t=1783600342; x=1784205142; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Q6uaaRn1apsA/2p+t1DBPwc+zrUv3t/8R7VmEga46LQ=;
        b=ZHPE9wRn/dvk1Z0TpzB4U78xf9l1k3d/03n8G4l/IPpzRC6KAqLWWB5TtaLRyXuc/l
         /Fok29DrYTBRik2MVwgvRvdcrRmLDFFx6uhfbm9lBg1F/P3/aA0+Jk3pZpSSQXKf6wdx
         qyc+j7LY3XD3TveFzw9/kL4ozIO/WAF5LN/YbF2Tmwz7RHgDxE4yMcD1TWordTqyivde
         Sjbf9bWM9j8sxbboKrzXE/eoXBcrvCe0qFgB0XMkyOkijk7+6XfR85BuvCgPvmQqNE4C
         2mUlJ75MT+7PENlAa1ikjUfaXffwemSBgn/Uy72fUme+L6yWQdhn/0grUsJEvo/Zn/X4
         Ul4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783600342; x=1784205142;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Q6uaaRn1apsA/2p+t1DBPwc+zrUv3t/8R7VmEga46LQ=;
        b=WGw9HQlG66Gt/Ei/m+dKJlctaqfPS1XoGS8e7jx7+Fu/9X8+eaVAGoONzl4B2cQefN
         NSoeVoMRNd6jsY1PIG6yddmgL3nYt42TrGBogIrN50DLvSlMR8DB//Qbku4l+dhPCayl
         MDmREUMV3ejX5OufIpibigKhA8MHssiHFBAgNcWBFNReaYwt8oUFEln+NTrPoKd7Hnwk
         8JawZ/AsXbOsqUxDrhQ/HPxokkWYTnlcPmhwoKObGZ8PDHUvEAfkxJn6+aidnpNJTefr
         IQCKnEwAExLAzQWvY8d97gzRSAWp1wjWGcJ8qL4nd6jDTSQ6nDCiH2ydSwMw6M1PgL51
         WWYg==
X-Forwarded-Encrypted: i=1; AFNElJ/YNadQfYfVHPOA+TZwpEzkqVfjy9lfJUEpkwHxHoHqtX7Q/rjq20fTf6jm4q8cNdT4euN73K3aCUA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyL+Fwl+lIlE68rkWAUMRPZgRq45pNyR1VXce6Ryp07gXhIdkXP
	hx4Jza/I7aTKh3mmXlTJ3VNIS7nE6W/k42OIzNA9lxcq5dNBKiMnbhNFdSh2WoIPs3ozaE/UvUk
	1goqJIrFjJYmwvM0wd1XDfYx2iJC+56nKOpFVnhXOVw==
X-Gm-Gg: AfdE7ckxLQ1qq8KORMXZHkU6Vqpq7XdxDezO4G4+1OHy05zKKiz0NxpgeChflRq/Cv6
	MaNaUcATpmGIrBrFyjnYNQwnpuND0f+q2GXezT9ETth7DU99oYK7rVATEpOUEqqh6YiJ2ZKw4eh
	OLiKycCy4RP50ebqsdRiMUYL+rWvZiKL2HIYMUVVIGu2l7U7IbENhYalmrKlBSKyUS7myCtfeOg
	FA4MCBNfXba58BCIQ/8x9Dx12TVncAKc4YyuebOdFH3LzHOjjP23+H+d498BMiss9Yx8msn9kti
	+DDHJWht6IZriNmijk1XOUl+yO0RaqBlplZy3XUxuy+ddszvAUOR6ofXU2QhIqeNdGKNxcaRv9r
	rp45dCLmzc1jZ6/jV7S9g/kuPCPOEi5sVIZX74ZY=
X-Received: by 2002:a05:6820:1628:b0:6a1:18fc:519f with SMTP id
 006d021491bc7-6a36d6d6ec2mr5214376eaf.0.1783600342380; Thu, 09 Jul 2026
 05:32:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260630-deprecate_boot_delay-v2-0-f9883d36aa4b@thegoodpenguin.co.uk>
 <20260630-deprecate_boot_delay-v2-2-f9883d36aa4b@thegoodpenguin.co.uk> <ak5mPxUdp2pzCMt5@pathway.suse.cz>
In-Reply-To: <ak5mPxUdp2pzCMt5@pathway.suse.cz>
From: Andrew Murray <amurray@thegoodpenguin.co.uk>
Date: Thu, 9 Jul 2026 13:32:10 +0100
X-Gm-Features: AUfX_myRkAQr3RlL8KDtHhqAkW7mutgbWnQw5V1Od8NNNQcLPSvfj_bgH0j4NKw
Message-ID: <CALqELGxjTZAXEp1C1CNO2tLbUpUChZW3DHcNgyhEu4Ma-ct2ow@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] printk: deprecate boot_delay in favour of printk_delay
To: Petr Mladek <pmladek@suse.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Russell King <linux@armlinux.org.uk>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, Steven Rostedt <rostedt@goodmis.org>, 
	John Ogness <john.ogness@linutronix.de>, Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Andrew Morton <akpm@linux-foundation.org>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Clark Williams <clrkwllms@kernel.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Linus Torvalds <torvalds@linux-foundation.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rpi-kernel@lists.infradead.org, linux-rt-devel@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi Petr,

On Wed, 8 Jul 2026 at 16:01, Petr Mladek <pmladek@suse.com> wrote:
>
> On Tue 2026-06-30 17:35:58, Andrew Murray wrote:
> > The boot_delay (BOOT_PRINTK_DELAY) kernel parameter and printk_delay sysctl
> > are two distinct mechanisms for providing similar functionality which add a
> > delay prior to each printed printk message.
> >
> > boot_delay provides a kernel parameter for delaying printk output from
> > kernel start through to boot (SYSTEM_RUNNING), whereas printk_delay is
> > configurable only via sysctl and thus is only used post boot.
> >
> > Let's deprecate the boot_delay feature in favour of printk_delay. In order
> > to preserve functionality, we'll also extend printk_delay such that it can
> > additionally configured via an early kernel parameter.
> >
> > Behavior change:
> >
> > The delay enabled by both "boot_delay" and "printk_delay" continues
> > working even in SYSTEM_RUNNING state. It must be explicitly stopped
> > by setting printk_delay=0 via sysctl.
> >
> > The delay is skipped when the message is suppressed in all system
> > states. It used to skipped only for the boot_delay.
> >
> > Signed-off-by: Andrew Murray <amurray@thegoodpenguin.co.uk>
>
> Looks good to me:
>
> Reviewed-by: Petr Mladek <pmladek@suse.com>
>
> Note that Sashiko AI warns about possible problems with negative
> printk_delay values, see
> https://sashiko.dev/#/patchset/20260630-deprecate_boot_delay-v2-0-f9883d36aa4b%40thegoodpenguin.co.uk
>
> But they should be handled in both the early parameter
> and sysctl interface by the "10 * 1000" and "&ten_thousand"
> limits.

Yes, that was my also view.


>
> The only potential problem might be a warning about possible
> "sign" mismatch from the compiler. But I do not see any
> even with make W=2.

I suspect this will come up everytime a change is made in this area,
or perhaps some W=2 errors will pop up via kernelci or similar. I
propose updating the patch as follows:

diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
index 5278d9cb19e4..fbb67f10c21e 100644
--- a/kernel/printk/printk.c
+++ b/kernel/printk/printk.c
@@ -1338,10 +1338,13 @@ static inline void early_boot_delay_msec(void)

 static int __init printk_delay_setup(char *str)
 {
-       get_option(&str, &printk_delay_msec);
-       if (printk_delay_msec > 10 * 1000)
-               printk_delay_msec = 0;
+       int printk_delay_val = 0;

+       get_option(&str, &printk_delay_val);
+       if (printk_delay_val < 0 || printk_delay_val > 10 * 1000)
+               return 0;
+
+       printk_delay_msec = (unsigned int)printk_delay_val;
        printk_delay_calculate();

        return 0;
diff --git a/kernel/printk/sysctl.c b/kernel/printk/sysctl.c
index f15732e93c2e..f256fc05faaf 100644
--- a/kernel/printk/sysctl.c
+++ b/kernel/printk/sysctl.c
@@ -46,7 +46,7 @@ static const struct ctl_table printk_sysctls[] = {
                .data           = &printk_delay_msec,
                .maxlen         = sizeof(int),
                .mode           = 0644,
-               .proc_handler   = proc_dointvec_minmax,
+               .proc_handler   = proc_douintvec_minmax,
                .extra1         = SYSCTL_ZERO,
                .extra2         = (void *)&ten_thousand,
        },

This makes the cast explict, verifies the range before casting (I
guess a range of negative values could result in a postive value
within the 10,000 range) and also uses the correct proc_handler.

This has the side effect of not showing the following pr_debug for the
lpj calculation when a delay is not set. Though loops_per_msec is only
used during boot, so I don't think there is any loss here.

        pr_debug("printk_delay: %u, preset_lpj: %ld, lpj: %lu, "
                "HZ: %d, loops_per_msec: %llu\n",
                printk_delay_msec, preset_lpj, lpj, HZ, loops_per_msec);

Can I keep your Reviewed-By with these changes?

Thanks,

Andrew Murray

>
> Best Regards,
> Petr
