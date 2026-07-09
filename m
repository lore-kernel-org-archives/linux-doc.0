Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8AE23D3334
	for <linux-doc@vger.kernel.org>; Thu,  9 Jul 2026 20:33:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783629224; cv=pass; b=IZvPl7VmhqWCnCgJeLAmM8Ic3Y+Xvv5cVEOKiEJ/JAQjup9LACo353Bz/0eEQL3eNZo5LlKh6X2ulQ1lX5QoRWM8bO3KJzujOD0bveknsFsbMlni8hrcee6otJ9/9lTqScYBcFNAgXRWfepYBov1DmMa3E+uy1Rrik5kB9Htp6o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783629224; c=relaxed/simple;
	bh=jMtcbdMjpbPZxFzIQEO/tWpTrxEOHPXtdEvc/wBne44=;
	h=In-Reply-To:References:MIME-Version:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ra8yUC1JJFrzYsSAkslq+KKt0XRjFhpwVFLzuQlr7w1pmUaWRiEHjd7wYJVbBxLiFAIGou8CHCua3UzDjYB5ITSv+J65Xa+yUAcEpoyJ21eSWXVZB47QlMhhgWch0au1LvaNxaE91Yr6Hp833GhNK8q1XaJ8N5Mdqb80MhPCWjY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=starlabs.systems; spf=pass smtp.mailfrom=starlabs.systems; dkim=pass (2048-bit key) header.d=starlabs-systems.20251104.gappssmtp.com header.i=@starlabs-systems.20251104.gappssmtp.com header.b=VlRCHdPy; arc=pass smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=starlabs.systems
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starlabs.systems
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=starlabs-systems.20251104.gappssmtp.com header.i=@starlabs-systems.20251104.gappssmtp.com header.b="VlRCHdPy"
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-8114a4542b2so3063767b3.1
        for <linux-doc@vger.kernel.org>; Thu, 09 Jul 2026 13:33:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783629219; cv=none;
        d=google.com; s=arc-20260327;
        b=nOtvkyqFjXwaExErLgBCYa69chwWkW1lIqCeIqEay58RWTfECAicqK6E26TTjgfsOA
         dDBXrU2uSpDbARQvXOsblP6R0eakZkxrmfgE2R8AAkrqKeBLt7sZqbh9c094eGSF6jJr
         RsNHfOnVpuU7jUWcKQVah66IPyD3BcalZ6BJ6DHq9PWaIhqteKx0WotNTWU8/Xvlegrj
         rBBY6hpP1bXunHjB3jUOMUFvF82bvVGeEl1eiW8eAVEQggwG5ebKaKlCXne/xuzJBYkH
         Ta2KhTynDF9fmONFG5cvK4zTJcjbAHmWyrePry3dctcezOB7krF4JjxaF/JVYY5BolEL
         /vfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:references
         :in-reply-to:dkim-signature;
        bh=jMtcbdMjpbPZxFzIQEO/tWpTrxEOHPXtdEvc/wBne44=;
        fh=bLzGK0xb43pybj9HWVk/NlhpIKZTTaviaVD9gCPbT2M=;
        b=rbTNXgPJIdKzK0hXjSt0jJTLqfRdy00gedbCMGoHUQFTx6kSOOZTHVkSjvpwRRk9jm
         XfYEEsK+UfM4ScqBP1x1vPGgafpIZj3ZDSNM01CUyd1xiDjfcWtBURh+5iJAHhVOIzDQ
         ltId/Tpj45iU7HslBDFjNZUcAERiqfi0rF6QeBkqVd3e5/PYSpfkEWfZxgvHbwLvk7DG
         3otOyzkL19l6efYSbRezzxuuM9LSS/F3qOyRtP8zb7mZDOld+byyiSHJEbsU2Y/URje5
         35IHdNTpXul+/NSREcWfMgOvDXhfjboNq0EIV+vP8XLDW/f/lAF1DjZosK/0VT2uzZ/k
         xhig==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=starlabs-systems.20251104.gappssmtp.com; s=20251104; t=1783629219; x=1784234019; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :references:in-reply-to:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jMtcbdMjpbPZxFzIQEO/tWpTrxEOHPXtdEvc/wBne44=;
        b=VlRCHdPybmmI1KGrJj+aMkKKEwH0FhtUNHdc0R49LkPVSH0KLwLVF2HqBsz26sihYC
         JzGRzq+EjrXNwSGcfDoosmtiryQsP4nNjMI6VZg7n2LGrrx40G5+QwffHlxo4N9gNWzU
         05eWV/gB929ljDO2a0GF8uNXbiE//CH1nfPbQw2ZpkFmu1MH0VmMa5KmpLj4vRKkd4xr
         YXCwLzV0FNy79s47pTx9c8me4PY9Po+8CIIyoO8udqZr4VZ3lsum6NQEe7vu9S2DyYFc
         zquNBeUlPkfl8pIgqVcmmo9VJGGRgPFw+6BN4Az/iL3uTStTLO2DRKcU3NC7qCfS6UDb
         4PBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783629219; x=1784234019;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :references:in-reply-to:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=jMtcbdMjpbPZxFzIQEO/tWpTrxEOHPXtdEvc/wBne44=;
        b=JCPfNBLmexLQG9U4cidQm5hhI8nTQqn8ZlxfDKrHnCWOdfgdgPaOZBEjqUJlGFxjZS
         wMtk/w4JS6Ah2uFS/rqOhc7vcAeRQjHM+sWs6cWtwdWYBjNQqrX3IxZTVVQwt8qLJhtT
         xn523c0oEz3Lqpm/I+6LZ598cENsLhWb1rLRwxIVLjHoNoteBwE9iQRLrNwIQ9bwK2Wy
         MHKTFkQEywnODK5ydFB/CnUcXku9sXOpD+qqcQJw2RBQQU950A1nH5Y77lq9CAtIctbI
         OUAgXG0ckMwDGAwJp571QcXVB/5NdIb4fKLJ5qnWqVRo028wAjqvD2VfdINxTGqFcGZr
         7HvQ==
X-Forwarded-Encrypted: i=1; AHgh+RqeP+atv1Rle7UaK4e7WwvYlaDVN2Eya0W602iQNGZmPTKhwqPgO2PnjQfdaL9RD4Bs6TTT91Ri/3I=@vger.kernel.org
X-Gm-Message-State: AOJu0YxWzJVxpVaTr2kpjfegApY3iJdH8+APdvPtcV23a6geExrimUwo
	g71/BkycnEyjjLe48xyvv0arHhKqmBDnSOWogZ7/shmVZTgHhvkS2TEk7eSOll5SfDWJcZWuZQT
	yP0bLz8DOqzcOtgwJQpqdfBW2T2mhAohnobrHjaw9
X-Gm-Gg: AfdE7cneKKqV5wxYNCw63zb2Gw+USD612MDINp9DB30efjEgDoM14xw8Qk85iLSuExv
	TmiBDDVfLVBxC1NSQZrqZmGPoAooVxxGeL5rpP+UcN4mZbI4s8HMR+5IlGMXlhpoLEtBhUdVwuE
	oTcH3w/YIelhWCQbJQ3vDNNC84UJxZlVNMDyK6ojJhGG2Oo4B4uSXRKraAC2ZNz56gFCv5CMeXb
	cTgS2XPInw5guIxa9nNOozRvzF+1B20oHgScXB2L3KoswYP0jEn4c6wOTSSUd8HOaB91JBDcDqD
	qfbYeaWqmq5iG1+gq4T+/Jlpon0=
X-Received: by 2002:a05:690e:150b:b0:664:ae6d:ad28 with SMTP id
 956f58d0204a3-6679f15451cmr5789029d50.66.1783629219309; Thu, 09 Jul 2026
 13:33:39 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Thu, 9 Jul 2026 16:33:38 -0400
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Thu, 9 Jul 2026 16:33:38 -0400
In-Reply-To: <CABtds-0AUr1jD2Sri6ViiFiqyBbjc3-6xeAOr12YLJA9ux-2BA@mail.gmail.com>
References: <CABtds-0AUr1jD2Sri6ViiFiqyBbjc3-6xeAOr12YLJA9ux-2BA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Sean Rhodes <sean@starlabs.systems>
Date: Thu, 9 Jul 2026 16:33:38 -0400
X-Gm-Features: AUfX_myqQ-bWDD15nf3rkjgivCsr_EhsGHyEecNL3wwNc7IvLT4cfvzbzaUymKw
Message-ID: <CABtds-1d8uYi5YbxgbL5MwZOXTUgBmeLQWiggVhBKtqct5VC-g@mail.gmail.com>
Subject: Re: [PATCH] PM: hibernate: Allow hibernation opt-in when locked down
To: rafael@kernel.org
Cc: lenb@kernel.org, pavel@kernel.org, corbet@lwn.net, 
	skhan@linuxfoundation.org, paul@paul-moore.com, jmorris@namei.org, 
	serge@hallyn.com, nicolas.bouchinet@oss.cyber.gouv.fr, xiujianfeng@huawei.com, 
	keescook@chromium.org, linux-pm@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Please ignore this patch; the approach was wrong.

I'll follow up with a v2.

On Thu, 9 Jul 2026 12:23:11 -0700, Sean Rhodes <sean@starlabs.systems> wrote:
> Kernel lockdown disables hibernation because the resume image cannot be
> verified before it is restored. On systems where external platform or
> storage policy protects the hibernation image from offline modification,
> users may still need hibernation while lockdown is active.
>
> Add a hibernate=allow_locked_down command line option to make that opt-in
> explicit. This only bypasses the LOCKDOWN_HIBERNATION gate; nohibernate,
> secretmem and CXL memory restrictions still apply.
>
> The kernel does not validate the external policy or authenticate the image
> with this option.
>
> Build-tested with Fedora config:
> make O=../linux-lockdown-hibernate-build kernel/power/hibernate.o
>
> Signed-off-by: Sean Rhodes <sean@starlabs.systems>
> ---
> Documentation/admin-guide/kernel-parameters.txt | 5 +++++
> kernel/power/hibernate.c | 6 +++++-
> 2 files changed, 10 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
> index b5493a7f8f22..0d20ad9c7d78 100644
> --- a/Documentation/admin-guide/kernel-parameters.txt
> +++ b/Documentation/admin-guide/kernel-parameters.txt
> @@ -1967,6 +1967,11 @@ Kernel parameters
> protect_image Turn on image protection during restoration
> (that will set all pages holding image data
> during restoration read-only).
> + allow_locked_down
> + Allow hibernation even when kernel lockdown would
> + otherwise disable it. The kernel does not verify
> + the hibernation image; only use this when external
> + policy protects the image from offline modification.
>
> hibernate.compressor= [HIBERNATION] Compression algorithm to be
> used with hibernation.
> diff --git a/kernel/power/hibernate.c b/kernel/power/hibernate.c
> index d2479c69d71a..71232eece9a3 100644
> --- a/kernel/power/hibernate.c
> +++ b/kernel/power/hibernate.c
> @@ -41,6 +41,7 @@
> static int nocompress;
> static int noresume;
> static int nohibernate;
> +static bool allow_locked_down_hibernation;
> static int resume_wait;
> static unsigned int resume_delay;
> static char resume_file[256] = CONFIG_PM_STD_PARTITION;
> @@ -109,7 +110,8 @@ bool hibernation_in_progress(void)
> bool hibernation_available(void)
> {
> return nohibernate == 0 &&
> - !security_locked_down(LOCKDOWN_HIBERNATION) &&
> + (allow_locked_down_hibernation ||
> + !security_locked_down(LOCKDOWN_HIBERNATION)) &&
> !secretmem_active() && !cxl_mem_active();
> }
>
> @@ -1433,6 +1435,8 @@ static int __init hibernate_setup(char *str)
> } else if (IS_ENABLED(CONFIG_STRICT_KERNEL_RWX)
> && !strncmp(str, "protect_image", 13)) {
> enable_restore_image_protection();
> + } else if (!strncmp(str, "allow_locked_down", 17)) {
> + allow_locked_down_hibernation = true;
> }
> return 1;
> }
> --
> 2.53.0
