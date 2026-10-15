Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 117A83D8903
	for <linux-doc@vger.kernel.org>; Thu, 15 Oct 2026 14:34:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792074880; cv=pass; b=iqIFYE8o5LYNN4LIDIBX5kDJdmcgFVIQmqXmshoIj5UD6AnoGfQ7EcLK9oU4taoT7kY4t4ms8S8YBvQ4gt/Zy2HGpJr+ZbwdzRS5C1NmguOIYa3Dle2H0fv0fKwV+mGT3FglMUS60hqcjahutbq3qjlLNqi1YNo9nkxN3JWqQ7w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792074880; c=relaxed/simple;
	bh=0qgS0UO1kcmwhXpK5KzPjRFjdmmHM4Qfpm9Hq9l0y94=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fw3RNnWnZ4arJ5oS/0dC9IuwzJF4MybFbLBGAJayoExwim59mC5yTXIo0poj2jxiKDvlLbMSLZ1G/EAieqohrzYxUbvbMETGGvGPk1I7XA7vrycrV2L3YIHnmsjEqHd2MtveyMmIUXMDR4ZE1zkzJapxavK9M1JuicIR47txMg4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=kki8MEN0; arc=pass smtp.client-ip=74.125.82.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="kki8MEN0"
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-1419d3416ceso3906549c88.0
        for <linux-doc@vger.kernel.org>; Thu, 15 Oct 2026 07:34:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792074878; cv=none;
        d=google.com; s=arc-20260327;
        b=Mc+iA0GJ4eP8ekkixSzDaBfVyD+FtsBwHnIWKGFf8MBGkuQ9Io+y/L1lu6OtEJFNCH
         lyXJKJOZqKLQP2bczPkctuK2khkSdOPZLcuiwWeQrP0Ihps3AlQ1lHcWhUipLtMGGs09
         U85WC4ByueTYgkPeFmIdjvHt3kai0mJc4+CglGiMv1me3e/7pO5nl/zc9Z+oup2io0ve
         OxH11vvmje4bjro4s1LzIB9GkmG/N6EWA6mtwVUDdesHNgW45h7Dc2ODnISWUuDgvBCP
         w4hfuk+V+Ki1EZb30XKwQG/R/NQmq/BSG2KKHlUzFzhUslX7BXCCRHE+M1sFD9watcGm
         Csww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=F6fmcBNM8ahIowcwsWLF3jcUhFNGW6deuYFquaOGjh4=;
        fh=CINnQGihQ2LfWjx9Mz84QVSUptdSBf6+vfvALb5uSFI=;
        b=oOzF7nDMbIMyxIVDzLMm/fXsxvnhpJroWcbsrAvOD1KqnvRiw8bhWmfY7s9Kg56feQ
         Gau/jp1p8JNICHuzcJL53jpTIARyuS7lGeWxEqE9iWwHXZ6bFSzZAQn88PeFYPryR0vR
         0JE+RZZF9Sxqa1GW5bHKMp1bUgH7XfcJmTjzjJuP7oTyxNQH/d87UvIIfO6ePep+g2+4
         ByXxFNaHDga0J+YvJxh3VnmMIoqgz9sQ1ieFYoFFXkRRX/W9NqZ6vCJOlbLwBEVWNAKA
         IyZNl6UakgdsiDeORiCWvla7sq/a3WSHwWv4sNmUXz6RtAz/sJfsv1GDPdIHfG5M4ZtP
         7LgQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792074878; x=1792679678; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F6fmcBNM8ahIowcwsWLF3jcUhFNGW6deuYFquaOGjh4=;
        b=kki8MEN0wBYVFMQ8UYnW98K2Dw2BWXb7ywQ5r4U52c8SxrqSD4GLs6jK36hIL/yPhf
         VQv9DByVceIfDj2e38oZb4Ty1pgKl67+lYphxGv17/+RsZ4t8NBepAUIyYQCoMcAym73
         /UQkSrKSNRXkMvYy6fimKS92tE1a4Z4FB/SmHW5RtMFkKK0FN1+Pk0eTStblfoICPOYz
         uNtIvhgBSYwwBJBAWT/q6TXSbwfJn206YT7BzLLUoyjlMsnBC7E/Ytb3BwvdRjPvSZOU
         BsDAgYWOGkTMcZ3wDO6TrZ1SbdO0C3TTbEgyphuLiPaCDqYyRfexhi7GxJ5MFlWEQQ8p
         ZIRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792074878; x=1792679678;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=F6fmcBNM8ahIowcwsWLF3jcUhFNGW6deuYFquaOGjh4=;
        b=M/98nf1mZjw+gqqaqiArswcEIl9I4XBrbxw9BJSy3VR45qxV/gvhblwQnodMFThR1O
         X3xtjcA5JCt+L4ngfN29xfyI8oYL6rfqZd7ZO28oU+rP6e7FbWZY6nodpp1daBTE4ywq
         6IdAOHvkwhfhoi/8PYf/bBcOhDzoPpTARfDOSc60vIB1fPkr/VqrhVwzGO9zqkig0kbZ
         WeWiL+yHImmtP2WY22RfcYBICADdFwANMhEfkeR/ymGoGEA73vLZyYpHhV7k9JiXUJKX
         2c1IYx76pwXFAeouU7/dbZz0KwX5yTzGpe1pdiMoW3OEK5BXUSxbEekF+QDf+3fc5Z0y
         99ow==
X-Forwarded-Encrypted: i=1; AKwUvBzHEbmizoePglIPPaw2b2FFPf7dQ7UOAPMAyNeAnHenw469rN/dgKImo8zJy66duFZDXqRjQBqQxSU=@vger.kernel.org
X-Gm-Message-State: AFq9FYKmsL3JFFdeBQfM9wo7u8j22/SzLcrEDTLSrhmqYYgo9cm6Wyo0
	VDqK6J0XtZtIXLk1YdlK2OIE0O7rXqspL3+lnhQ0XErFtpq0wTtjSKCCjr4RW8sXLpWnMJ8xLFC
	GZZku/c2w5Luw0/yFXIuI8qhRBMIy7+IkbDnbM2xu
X-Gm-Gg: AYBFou3v4aO86hjq86EE8An1wJnv/TIdQp1RrhBlcU5+u/jlAkNd7Wm9U+vtz+vwoyZ
	8MORMFw3R+OuxxrcKPdjNR+fHwoaKTcQtw9tqQ1iT1HORkarrah78EaD2szor1h64QWwDSW/8Oz
	TubqZgAi2ng1HOHaWZRXrzpXSGWpyWiBYH35KFF1HKnmj2YGGEqsBY+m9380NLtvC4KhvGPlN68
	GSg5a19Tg6WycvOkb2DOwLPHDMH9VMWY5iIzgeOyI9ErueLiHwb0Ku8VSwErpwUC0euNQJaEpSd
	5+D++UwptrQijwKLqp6BnHhOykc3U0Dz1c/QB7Rp9Cv+l5lE7h7a430pl+TVjzH+3kS6cqjZ7Jv
	0nu0uz4aZsw==
X-Received: by 2002:a05:7023:908:b0:14d:f83b:f678 with SMTP id
 a92af1059eb24-16a63093432mr28786311c88.43.1792074876931; Thu, 15 Oct 2026
 07:34:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261014095238.2132580-2-sh_def@163.com>
In-Reply-To: <20261014095238.2132580-2-sh_def@163.com>
From: Marco Elver <elver@google.com>
Date: Thu, 15 Oct 2026 16:33:59 +0200
X-Gm-Features: AclHuK_nqb0XohDsRgRoJxANfSfWrIowniz6RXwKCNJicgsayXH681Q_GDC1JBM
Message-ID: <CANpmjNN0_EX8Tug6UFp=sap_Zv3QH1PnEn4GPGSKSHEU72W6zg@mail.gmail.com>
Subject: Re: [RFC PATCH 1/4] kcsan: add targeted watchpoint matching
To: Hui Su <sh_def@163.com>
Cc: dvyukov@google.com, kasan-dev@googlegroups.com, corbet@lwn.net, 
	skhan@linuxfoundation.org, rdunlap@infradead.org, workflows@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 14 Oct 2026 at 11:52, Hui Su <sh_def@163.com> wrote:
>
> Add target state and a static key to KCSAN. When a target is set, only
> non-atomic instrumented accesses containing that address are eligible for
> watchpoint setup. Other accesses do not consume the skip interval. Keep
> report filtering independent from target matching.
>
> Signed-off-by: Hui Su <sh_def@163.com>
> ---
>  kernel/kcsan/core.c  | 37 +++++++++++++++++++++++++++++++++++++
>  kernel/kcsan/kcsan.h | 10 ++++++++++
>  2 files changed, 47 insertions(+)
>
> diff --git a/kernel/kcsan/core.c b/kernel/kcsan/core.c
> index 2db82661cd60..2a58a3a53adb 100644
> --- a/kernel/kcsan/core.c
> +++ b/kernel/kcsan/core.c
> @@ -12,10 +12,12 @@
>  #include <linux/delay.h>
>  #include <linux/export.h>
>  #include <linux/init.h>
> +#include <linux/jump_label.h>
>  #include <linux/kernel.h>
>  #include <linux/list.h>
>  #include <linux/minmax.h>
>  #include <linux/moduleparam.h>
> +#include <linux/mutex.h>
>  #include <linux/percpu.h>
>  #include <linux/preempt.h>
>  #include <linux/sched.h>
> @@ -108,9 +110,40 @@ static atomic_long_t watchpoints[CONFIG_KCSAN_NUM_WATCHPOINTS + NUM_SLOTS-1];
>   */
>  static DEFINE_PER_CPU(long, kcsan_skip);
>
> +static DEFINE_STATIC_KEY_FALSE(kcsan_target_key);
> +static DEFINE_MUTEX(kcsan_target_lock);
> +static unsigned long kcsan_target_addr;
> +
>  /* For kcsan_prandom_u32_max(). */
>  static DEFINE_PER_CPU(u32, kcsan_rand_state);
>
> +void kcsan_target_set(unsigned long addr)
> +{
> +       unsigned long old;
> +
> +       mutex_lock(&kcsan_target_lock);
> +       old = READ_ONCE(kcsan_target_addr);
> +
> +       if (!old && addr) {
> +               /* Publish the address before enabling the fast-path branch. */
> +               WRITE_ONCE(kcsan_target_addr, addr);
> +               static_branch_enable(&kcsan_target_key);
> +       } else if (old && !addr) {
> +               /* Disable the fast-path branch before invalidating the target. */
> +               static_branch_disable(&kcsan_target_key);
> +               WRITE_ONCE(kcsan_target_addr, 0);
> +       } else if (old && addr) {
> +               WRITE_ONCE(kcsan_target_addr, addr);
> +       }
> +
> +       mutex_unlock(&kcsan_target_lock);
> +}
> +
> +unsigned long kcsan_target_get(void)
> +{
> +       return READ_ONCE(kcsan_target_addr);
> +}
> +
>  static __always_inline atomic_long_t *find_watchpoint(unsigned long addr,
>                                                       size_t size,
>                                                       bool expect_write,
> @@ -277,6 +310,10 @@ should_watch(struct kcsan_ctx *ctx, const volatile void *ptr, size_t size, int t
>         if (is_atomic(ctx, ptr, size, type))
>                 return false;
>
> +       if (static_branch_unlikely(&kcsan_target_key))
> +               return kcsan_target_matches(READ_ONCE(kcsan_target_addr),
> +                                           (unsigned long)ptr, size);
> +

How does this change the generate asm (say on x86-64) of the fast
path? (E.g. take a look at __tsan_read8 disasm.)

We tried hard to e.g. avoid stack spills in the fast path, and if that
affects fast path codegen negatively, that'd be not so nice.

>         if (this_cpu_dec_return(kcsan_skip) >= 0)
>                 return false;
>
> diff --git a/kernel/kcsan/kcsan.h b/kernel/kcsan/kcsan.h
> index ae33c2a7f07e..2a36813c3a76 100644
> --- a/kernel/kcsan/kcsan.h
> +++ b/kernel/kcsan/kcsan.h
> @@ -25,6 +25,16 @@ extern unsigned int kcsan_udelay_interrupt;
>   */
>  extern bool kcsan_enabled;
>
> +void kcsan_target_set(unsigned long addr);
> +unsigned long kcsan_target_get(void);
> +
> +static __always_inline bool
> +kcsan_target_matches(unsigned long target, unsigned long addr,
> +                    size_t size)
> +{
> +       return size && target >= addr && target - addr < size;
> +}
> +
>  /*
>   * Save/restore IRQ flags state trace dirtied by KCSAN.
>   */
> --
> 2.55.0
>
