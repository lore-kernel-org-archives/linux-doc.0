Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBD8337268C
	for <linux-doc@vger.kernel.org>; Fri, 13 Mar 2026 15:28:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773415692; cv=none; b=MqB4ZKV5EVqiOkyWwjmAIanjzVsFnbtULE7tG59nUW7kLpsWCxe9XxcX7Fuz1UwEGeD76WM2SfyCAzzGISes8LvMBw6r6eNuC5KZu00cipNfAsyUlwpDAv2RdkGf5+HFdcs2Cqh1LP3attC5YLr7I7gYJ3hkIfTLrBYx7B1BSt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773415692; c=relaxed/simple;
	bh=7m+ZeQRcpRgtb/SaFbwVvilE1O+fkb7W2MIOpzLNlT4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=usKbwKS+BLfL8TZT6PVqKMMdlYh9zsY4YjmtcnN6ul7CkaES62TknjZb2USNjTS0aibOrkrrVDAj4VkZcJwDf5NbHA0mvRfUszC66DxbWd1z2rC4fJIWPj55f8oEJc3/lsJkR7mvAZaL+vq9OOSsmlu9dLoPThRF3JS1X8vSKBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Lh+zZB+P; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Lh+zZB+P"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6615c461d3fso2312189a12.2
        for <linux-doc@vger.kernel.org>; Fri, 13 Mar 2026 08:28:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1773415687; x=1774020487; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jhbPCYrDRtqQEf/6gwdcMqNMuwVSujw+ohQ7ZaNM770=;
        b=Lh+zZB+PPr35XD5vlba2S5urpQK9cpdtVmGDdL2SAam1IrRAujACuYu523VNKQ5rp4
         o32RsLFq/732aUnggH6RMYAwfPWtmsMZjW2kUWg2I1QlHBC5rzcypmonW3IgXX7uQ7C4
         ajnU1oJjPiGneG312Og33ZxMHRSPgXCfTdfB8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773415687; x=1774020487;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jhbPCYrDRtqQEf/6gwdcMqNMuwVSujw+ohQ7ZaNM770=;
        b=ruRz274/zUGDnhrF6TCrbXvBOdApy0Wy6ZOiDdVV45Tm/XqDCiXk7aQTwxfrbvQhOq
         ABdHYpDbOLmEEI/+2YFDgyi8hpreIsYFU4uORZchYeygy443grtgJ6WgUQpMWs5N5rH1
         /jxMcyuANLhA0P1sCwyXq4fKroOCFjbAu1pujva7ZNK2YogByHLXqkRnkeIBP3ta8SpQ
         tN3q4gthriI3SRbu+4CYfEHZTPgSCjnFej0SS3Oy0fsa7bvGTvXvGtdQJ6ta7mcAe9Tb
         B8p+HHC+b0NKYlG6wCSfWklJxGgG+GyY4sB4DH86R7R0G4rrSf1g18yv+Mw5ziJnRpm5
         TeIQ==
X-Forwarded-Encrypted: i=1; AJvYcCWL/7IpSjs5Z3utHouwUvHSjky8eFFWq2NsGFlwxCuEekP8bNcfZX8UmPmOnML0ucmslanUlJCWXOA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzpVogMoKUVLTDrXYtKw3WrtHxs8Lfkw2gqTQU8GZWPNsR1avAQ
	mJq24ar8YahQx8tEBE5xmNG15SDvrn8au057PUtbUAT7ElxoB1qQ4CoZ67ql83ELTKy0TZFGjnO
	t3kne/P0w
X-Gm-Gg: ATEYQzwEdAII1dosVqrCb52w8UXdWHI9HLWQMclULMG46KidgG2C4EZNDjEwAFHuW8N
	LGf6X/uZjfhmZID4xBE6iab700+1y/W7e4RfYFQEr9bU5bq4lPPnCxZsf+EgDEDCvslObynXACI
	8l7fEyv5tFAiGm75bpQLryahTTzBCZ0zQI8djHiqIOHtbunYw1LQcDy9P3BA1qy6axGeBLl1RNo
	2txq4pqnhnhKBQEMaoS/vfkfOwDAFVY2dK7S8P0H/eDdztFwJm0ds9851Ey5IF4wuNMv+FzbLug
	zsXa1GdSEWPOrnR4/xkGNSeTFD54ejbjVmCru9FV+wgl2koWoDtSy41ylvmyhiXxRWHjaEAfYVB
	/YeZOtKZmNx4MVPXZyouq2ech8dmMG8Zs9OdvDPjI3pBGdgwkWW5ZvT3QBrWtPfSZT0h6JfWDC6
	Y8WiZJ31qJ1rTBBkT7GxPQ/mggg/Y3yN8iDT+uQGFvFJcwG2xEqlxuk9/C0+O1PA==
X-Received: by 2002:a17:907:9481:b0:b8e:d1f3:4744 with SMTP id a640c23a62f3a-b976540242amr196602966b.55.1773415687128;
        Fri, 13 Mar 2026 08:28:07 -0700 (PDT)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com. [209.85.128.47])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b976cbab153sm57370966b.11.2026.03.13.08.28.05
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Mar 2026 08:28:05 -0700 (PDT)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-48557c8ad47so9157455e9.0
        for <linux-doc@vger.kernel.org>; Fri, 13 Mar 2026 08:28:05 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW2C55fUOu65mx666r7fYAxHYZwdSmG3T8u2gqxzuCj7CPr3cbbw+1yet0L88abXkhaCMDwqs8ZCV0=@vger.kernel.org
X-Received: by 2002:a05:600c:4ed0:b0:485:35ba:1d8a with SMTP id
 5b1f17b1804b1-4855670e7bbmr61314635e9.27.1773415684721; Fri, 13 Mar 2026
 08:28:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260312-hardlockup-watchdog-fixes-v2-0-45bd8a0cc7ed@google.com> <20260312-hardlockup-watchdog-fixes-v2-2-45bd8a0cc7ed@google.com>
In-Reply-To: <20260312-hardlockup-watchdog-fixes-v2-2-45bd8a0cc7ed@google.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 13 Mar 2026 08:27:53 -0700
X-Gmail-Original-Message-ID: <CAD=FV=X99R1VLKmgV5mOJ6s5LjZyuP-_rQQUgZd0RmQrXeqbtg@mail.gmail.com>
X-Gm-Features: AaiRm51n087hAbE4miH9-uCcXXxIq3b13NjejoBWh2LlueBOUNWRbVV7_vYwAn8
Message-ID: <CAD=FV=X99R1VLKmgV5mOJ6s5LjZyuP-_rQQUgZd0RmQrXeqbtg@mail.gmail.com>
Subject: Re: [PATCH v2 2/5] watchdog: Update saved interrupts during check
To: mrungta@google.com
Cc: Petr Mladek <pmladek@suse.com>, Jinchao Wang <wangjinchao600@gmail.com>, 
	Yunhui Cui <cuiyunhui@bytedance.com>, Stephane Eranian <eranian@google.com>, 
	Ian Rogers <irogers@google.com>, Li Huafei <lihuafei1@huawei.com>, 
	Feng Tang <feng.tang@linux.alibaba.com>, Max Kellermann <max.kellermann@ionos.com>, 
	Jonathan Corbet <corbet@lwn.net>, Andrew Morton <akpm@linux-foundation.org>, 
	Florian Delizy <fdelizy@google.com>, Shuah Khan <skhan@linuxfoundation.org>, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Mar 12, 2026 at 4:22=E2=80=AFPM Mayank Rungta via B4 Relay
<devnull+mrungta.google.com@kernel.org> wrote:
>
> From: Mayank Rungta <mrungta@google.com>
>
> Currently, arch_touch_nmi_watchdog() causes an early return that
> skips updating hrtimer_interrupts_saved. This leads to stale
> comparisons and delayed lockup detection.
>
> I found this issue because in our system the serial console is fairly
> chatty. For example, the 8250 console driver frequently calls
> touch_nmi_watchdog() via console_write(). If a CPU locks up after a
> timer interrupt but before next watchdog check, we see the following
> sequence:
>
>   * watchdog_hardlockup_check() saves counter (e.g., 1000)
>   * Timer runs and updates the counter (1001)
>   * touch_nmi_watchdog() is called
>   * CPU locks up
>   * 10s pass: check() notices touch, returns early, skips update
>   * 10s pass: check() saves counter (1001)
>   * 10s pass: check() finally detects lockup
>
> This delays detection to 30 seconds. With this fix, we detect the
> lockup in 20 seconds.
>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> Signed-off-by: Mayank Rungta <mrungta@google.com>
> ---
>  kernel/watchdog.c | 18 +++++++++++++-----
>  1 file changed, 13 insertions(+), 5 deletions(-)
>
> diff --git a/kernel/watchdog.c b/kernel/watchdog.c
> index 4c5b47495745..431c540bd035 100644
> --- a/kernel/watchdog.c
> +++ b/kernel/watchdog.c
> @@ -159,21 +159,28 @@ void watchdog_hardlockup_touch_cpu(unsigned int cpu=
)
>         per_cpu(watchdog_hardlockup_touched, cpu) =3D true;
>  }
>
> -static bool is_hardlockup(unsigned int cpu)
> +static void watchdog_hardlockup_update(unsigned int cpu)
>  {
>         int hrint =3D atomic_read(&per_cpu(hrtimer_interrupts, cpu));
>
> -       if (per_cpu(hrtimer_interrupts_saved, cpu) =3D=3D hrint)
> -               return true;
> -
>         /*
>          * NOTE: we don't need any fancy atomic_t or READ_ONCE/WRITE_ONCE
>          * for hrtimer_interrupts_saved. hrtimer_interrupts_saved is
>          * written/read by a single CPU.
>          */
>         per_cpu(hrtimer_interrupts_saved, cpu) =3D hrint;
> +}
> +
> +static bool is_hardlockup(unsigned int cpu)
> +{
> +       int hrint =3D atomic_read(&per_cpu(hrtimer_interrupts, cpu));
> +
> +       if (per_cpu(hrtimer_interrupts_saved, cpu) !=3D hrint) {
> +               watchdog_hardlockup_update(cpu);
> +               return false;
> +       }
>
> -       return false;
> +       return true;
>  }
>
>  static void watchdog_hardlockup_kick(void)
> @@ -191,6 +198,7 @@ void watchdog_hardlockup_check(unsigned int cpu, stru=
ct pt_regs *regs)
>         unsigned long flags;
>
>         if (per_cpu(watchdog_hardlockup_touched, cpu)) {
> +               watchdog_hardlockup_update(cpu);

In the new solution, we read `hrtimer_interrupts twice instead of
once. That means that (potentially) those two reads could give us back
different values. I spent time thinking about whether this is a
problem, and I don't think it is.

The first time we read `hrtimer_interrupts`, we only care about
whether the value is the same as the saved value. If it is the same,
we won't read `hrtimer_interrupts` again anyway. If it isn't the same,
then we will read it agian. ...but that's OK. All we cared about was
whether it was the same as the (old) saved value. The second time we
read `hrtimer_interrupts` it could only have become more different (by
getting incremented again).

That's a longwinded way of saying:

Reviewed-by: Douglas Anderson <dianders@chromium.org>
