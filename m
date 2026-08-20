Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59AD32EEE8A
	for <linux-doc@vger.kernel.org>; Thu, 20 Aug 2026 20:50:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787259001; cv=pass; b=T+TUlBhtRofXobhuDpLYn8FT7U/zz4ZugsGF6BuYwuSardQBTefKt2VQzETjBshTSsrC8VPa/Lya7INNzEAo+q0O0WB3lfd4LlwpbqNG3fHYn4eOmAmYcJu9IlEcX2sIe9kg3SFvwtaos3/rkoWIIzP0Q2IVZfbMidBuXAbrRZU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787259001; c=relaxed/simple;
	bh=WeifkZ8waSG1zQ5SVkzx8LC9mIMj4IJdHzkmu1At7Q0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nkHPmW9b5LSSYJA4P0iokJ1NnySypGUQS7vbLfbHWst3GZX6NI4Z7FlD7hMt5KOFh1XdOQCRztrTZNkQBX38Fn0CY0gBREsXAIcFiNO/5RH/PmkyeGHV8lZfYEChTa32gm4srlto01nFmEsGnjtWgVgNVx85Ltfq7Q6I9S9o+Ns=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lPh45LYp; arc=pass smtp.client-ip=209.85.167.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lPh45LYp"
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-4a453848173so29033b6e.1
        for <linux-doc@vger.kernel.org>; Thu, 20 Aug 2026 13:50:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787258999; cv=none;
        d=google.com; s=arc-20260327;
        b=FBWA9rVxQk7fb47JXnn3Iz2XZvjZyWQzQ2AjYSIE2J3/coOAaUumWfEvWc42WVr3ga
         O+XBUhS2kyBe/GWn6cywsY8yvviK8pB/y5qqIdjKFSyIKnqL3o40gIlm8O0EPLg0czWk
         9MIz676VkQdOq5mgQE3Wt013WX/YkgmVrDcKQCNkd3jnMP/79bCpsN7j9agetpACDUzn
         ec8v85lB9yRVGjUQOPg2vu1Oguo0EHyadC2zhO2zGEVk6qt8fxVrflzWerVfjDkfQYvv
         G41ABBUrn6Elw7hZkS/ynIiUqWUOlBhAaVRMudhonGF3JQg72Kc28vTwcP8L48iKTwIw
         HQAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kL4VnCS6BLfpWe4s99pA0EQMN8CrjjCS8Ah6F2nU+Ts=;
        fh=KIlxnvmUB8jXxZtR62+q3TE+4R3GZpB3+n6QNoe2JpY=;
        b=RbTXv153LLcuKI9X09GKL5OlqBT7T2ggrs4UbmGk4gFnUorSrStq2LbHumSssYCwly
         a6PpXKvCmRUvfBoSduK06QXz9wAczHip6ERdIvfRhpgNGhyz4gxOiAJlAumI9iRqkk9C
         eWktzOju03+UVmkeM0rcscBcxTuc3QRVffv3A16r8XwatCYwDaEDaOkc8glC9YHlScCo
         SvGzeV3kbmx65DAlFIGp7uKMPmYPPG5WNSohu7pfrE9MgYjUUMM2V5A+HrD8sWBF646x
         G9FTCGdE21/BOp3qh63TB1jRnidL5/DUzZQFLEzwaCbQcmMde1ClNCGmJGiHs7V+HuwO
         fQqw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787258999; x=1787863799; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kL4VnCS6BLfpWe4s99pA0EQMN8CrjjCS8Ah6F2nU+Ts=;
        b=lPh45LYpk3JiBJ7KUt7AuvqNy3fRfYdc3MHtxaVWMViu0M4AXPWhm2tcy7lDLKYDPT
         IZyMC02bAMNme29XHhA+58aVCdXezOCxzpzK2pZFeI8Jy0YoCpsezDFQl7LUljANDoEi
         5PYgOlaS3/KWeuO1ceeKhpYBhIaSg479oajML1XI1N/9cCsHK+2cVWq0I1rYkNWXRC+R
         DEoKkjGEuiSaacR6TbGbBiC0Hv6FqR85T9UV/mdM70XUD0QqwGJaAx4L0O+WXlXCCz18
         Qfh3e2+6WkCcGh4azTj/Su8V3047jLCevheRuAcGhU2HrnphJ6SpCLkbmMeRHugHy+f0
         L6xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787258999; x=1787863799;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kL4VnCS6BLfpWe4s99pA0EQMN8CrjjCS8Ah6F2nU+Ts=;
        b=kFBjyJhjQec051T5iPNurmLZZnYkKO57CrgFN+6P48bYyzDae50cGl0UupL9O0WAf0
         ep4+jz9ujPoQ72FY5YGoK/bttWKMOA8IAOx6kkraaJDj35vVW+dBrQKl6PtzrTiRUH4t
         Raa/3M+jgNIuA1z3KekKfdbYXEhk3D0BMXYKvduY1kXLib3XSamxIrCoDJczJuYCk1x3
         mEqIjJa8xsJOuqv2jqJSf5VDPCwDh18IUsNKnPy1vbjGP8Z+dfowIQz51bUwbwbtDMjg
         NwG4UMXn0BmR05oMdSl+9Cwd1N+podyYEjMxDyHLlNtEaHSHcxbAje9dE1AW4CGiTS5r
         qquw==
X-Forwarded-Encrypted: i=1; AHgh+RoMru+L7ZbPwyVXhuGw5/9H4m1RoWmp2ju/dg77XrKdBUIPZ3v1UV8fFOvQpk+n814RRuD8wGebs2k=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0UXyNSULhuwL6Vr1C5Aprlq2zk8e9I3cyd4Mt7ahZbl7/0BHE
	OFUu00DotLbf/FNH94QhYxRP9hdaklXAbl7S3OZqooR/cHCxJMFe1oQa32Req9+qf2oiOMHWV2f
	ep8V2N+DbbcatBOn2cEQmCedkQCECTic=
X-Gm-Gg: AR+sD10FzZ92K83mPAORP6BMtUA3HEisYqVQ/BS4mvx1T9PN392my+Uvw23jw0VYry7
	uo6Pum8ZMlzV18DChaLr0g3Lj6jMXYCuzGlA86gymHFMCgauwHzXtDTmRoK5B0zeDo7c9+qSTGc
	E1hUBgFstOsHkYiq1kScFvzq2BjKcYTV8k8w7NtgTVIkdLeLN4bKWMVoCKHz0ZQBbeB07zMcJCD
	AiqvXimEr+/YdpvxVJp25UQrT+ldcKCxMopt/oTE+DXBTq1z9ufbQxyI1U6ug6Focgc+KQonNTB
	mVx4rlw4z7qWaGI+U4uKAUXL+TyHqbs1VW8YEyiIOiU77fF5rq6IemUVY9g=
X-Received: by 2002:a05:6808:178e:b0:495:f643:2785 with SMTP id
 5614622812f47-4b2ef459dc7mr601810b6e.3.1787258999047; Thu, 20 Aug 2026
 13:49:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260818-netcons_ratelimit-v1-0-8c5d2d17789c@debian.org> <20260818-netcons_ratelimit-v1-4-8c5d2d17789c@debian.org>
In-Reply-To: <20260818-netcons_ratelimit-v1-4-8c5d2d17789c@debian.org>
From: Gustavo Luiz Duarte <gustavold@gmail.com>
Date: Thu, 20 Aug 2026 21:49:47 +0100
X-Gm-Features: AcwNN1UZ8BHLW-xlVhw8Rsj5Md0elven6hi7UKRdpaKG-ODdLl-u6nPmZ3yH5Bc
Message-ID: <CAGSyskXshZTuBwiOPzp1j-d3He07Sx9OZGqRq4k6SG_kBwuKMA@mail.gmail.com>
Subject: Re: [PATCH net-next RFC 4/6] netconsole: tell the target when the
 rate limit drops messages
To: Breno Leitao <leitao@debian.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Shuah Khan <shuah@kernel.org>, paulmck@kernel.org, 
	davej@codemonkey.org.uk, riel@surriel.com, asantostc@gmail.com, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	samuelcrossley@gmail.com, kernel-team@meta.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 18, 2026 at 11:30=E2=80=AFAM Breno Leitao <leitao@debian.org> w=
rote:
>
> Keep the number of messages dropped since the last report on the target
> and send it to the receiver as soon as a message gets through again:
>
>   netconsole: 45 messages dropped by rate limit
>
> netconsole formats that record itself rather than calling printk(),
> which would feed the console it is currently servicing. Nothing here has
> a printk sequence number, so the extended header carries a zero.
>
> The timestamp comes from local_clock(), the same clock printk stamps its
> records with, but it is taken when the notice goes out rather than when
> the message was logged. It can therefore read a few microseconds later
> than the message it precedes.
>
> The notice rides on the next message the bucket lets through, so a
> target that goes quiet right after a burst of drops only reports them
> once the host logs again, and a target with ratelimit_burst set to zero
> never reports at all.
>
> Signed-off-by: Breno Leitao <leitao@debian.org>
> ---
>  drivers/net/netconsole.c | 53 ++++++++++++++++++++++++++++++++++++++++++=
+++++-
>  1 file changed, 52 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/net/netconsole.c b/drivers/net/netconsole.c
> index 6d60a5188bf13..0af2e5b4335c0 100644
> --- a/drivers/net/netconsole.c
> +++ b/drivers/net/netconsole.c
> @@ -50,6 +50,7 @@
>  #include <linux/workqueue.h>
>  #include <linux/delay.h>
>  #include <linux/ratelimit.h>
> +#include <linux/sched/clock.h>
>
>  MODULE_AUTHOR("Matt Mackall <mpm@selenic.com>");
>  MODULE_DESCRIPTION("Console driver for network interfaces");
> @@ -177,6 +178,7 @@ struct netcons_userdata {
>   * @sysdata_fields:    Sysdata features enabled.
>   * @msgcounter:        Message sent counter.
>   * @ratelimit: Opaque structure to ratelimit messages
> + * @pending_drops: Messages dropped since the last notice was sent.
>   * @stats:     Packet send stats for the target. Used for debugging.
>   * @state:     State of the target.
>   *             Visible from userspace (read-write).
> @@ -221,6 +223,7 @@ struct netconsole_target {
>         u32                     sysdata_fields;
>         /* protected by target_list_lock */
>         u32                     msgcounter;
> +       u32                     pending_drops;
>         struct ratelimit_state  ratelimit;
>  #endif
>         struct netconsole_target_stats stats;
> @@ -297,7 +300,20 @@ static bool netconsole_ratelimited(struct netconsole=
_target *nt)
>         if (oops_in_progress)
>                 return false;
>
> -       return !__ratelimit(&nt->ratelimit);
> +       if (__ratelimit(&nt->ratelimit))
> +               return false;
> +
> +       nt->pending_drops++;
> +
> +       return true;
> +}
> +
> +static u32 netconsole_take_drops(struct netconsole_target *nt)
> +{
> +       u32 drops =3D nt->pending_drops;
> +
> +       nt->pending_drops =3D 0;
> +       return drops;
>  }
>
>  #else  /* !CONFIG_NETCONSOLE_DYNAMIC */
> @@ -345,6 +361,11 @@ static bool netconsole_ratelimited(struct netconsole=
_target *nt)
>         return false;
>  }
>
> +static u32 netconsole_take_drops(struct netconsole_target *nt)
> +{
> +       return 0;
> +}
> +
>  #endif /* CONFIG_NETCONSOLE_DYNAMIC */
>
>  /* Check if the target was bound by mac address. */
> @@ -2554,6 +2575,34 @@ static void send_msg_udp(struct netconsole_target =
*nt, const char *msg,
>         }
>  }
>
> +static void send_ratelimit_notice(struct netconsole_target *nt, bool ext=
ended)
> +{
> +       int len =3D 0;
> +       u64 ts_usec;
> +       u32 drops;
> +
> +       drops =3D netconsole_take_drops(nt);
> +       if (!drops)
> +               return;
> +
> +       if (extended) {
> +               /* append the extended headers */
> +               if (nt->release)
> +                       len =3D scnprintf(nt->buf, sizeof(nt->buf), "%s,"=
,
> +                                       init_utsname()->release);
> +
> +               ts_usec =3D div_u64(local_clock(), NSEC_PER_USEC);
> +               len +=3D scnprintf(nt->buf + len, sizeof(nt->buf) - len,
> +                                "%u,0,%llu,-;", LOGLEVEL_WARNING, ts_use=
c);
> +       }

This additional message with sequence number zero in the middle of a
stream looks awkward.
I don't think we need to send a notice about dropped messages to
extended console targets. Those targets can detect dropped messages by
tracking the sequence number in the message header.
