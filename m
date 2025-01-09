Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 389B3204C39
	for <linux-doc@vger.kernel.org>; Thu,  9 Jan 2025 19:48:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736452119; cv=none; b=OrV1pgP0wDc9wEayawQy3b2H/LOdJTrk8Qvq+rrikozhQCAb3tMASF/LDI1YZLebs7gtkb94lKzKaYZkZhLZcQ3KJGw9Jb9rbYB4XrBDlAEuGvoeicfoKJWNTYXpWyHeq3xh8PLvEgfGpcJJJSVqjFWC6yAW2oT5c5ufzxz//CM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736452119; c=relaxed/simple;
	bh=A1ZSHCYJmXkn/CmQy4S67LM7KhhQej4dgSmnf6OI8JE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=idfRx8DeI5GKRn+93RsP6CQ/tF34dDlr+ixzTUJI0aJ/zBlS6eUig9tNbxcONyd+UyLUaMIH2hnjW1cXXeWiGP3mF1I5fuxv1FvTt+UEjyNTp7v8+2HhM6zGJdODm+jXCIgn85QrK7YEF7DtuBT9ypylBto81GKBumMQgiFS/QI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=O1LETRJf; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="O1LETRJf"
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-3002c324e7eso11771321fa.3
        for <linux-doc@vger.kernel.org>; Thu, 09 Jan 2025 11:48:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1736452115; x=1737056915; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4nASWSc319MsBi8srS8z1TIiC4jReGLISSvwvsA4in0=;
        b=O1LETRJfXp3Sd5OzsKrqd0+WVwlMgvyoWe8xEDTTGbVskwa9HE9vsSmFNnh4tGDiDV
         gpHWKYgtDzWFq5zBkVEkjfXcJPr7PjZm6cSIUwlCEXL8bxm8J9b5OIxYDpPrK41UuuHc
         SX+OBHytxbd2Ws77nL3NmH8tJafHIQAPQ7TFU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736452115; x=1737056915;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4nASWSc319MsBi8srS8z1TIiC4jReGLISSvwvsA4in0=;
        b=Jd7AGyMXNPzvJ93EJsEbOy6mojbt+bEwQz/HgyqdytTiHVk7IQen+0DQTj+H7wnX1L
         YErruH4xpEZyVLMUL3VfGd9i+dhRbSEg5SLxjyNljJ2RW/ODtVDBY8Gg74OuwAIcpYVm
         gdRnzv2Z2tx2mb18tkqCutN9Uca+OLl4Y23BCKH9sS4YGfPim8LaoNm4VLgUFYo+9q7P
         LatgEbl3b3Xkas2TDinWmiC5xE0mU45D0rXWeoc+kGIDGC7KRHUlCt8UhpL0nxE/zlb1
         kvk0IeZKF5qu5SpBp0sGF97Ay+fEh+S0UhdR+Gb4PWVinO+R1cbv+DgdlDvHlJtlFfTV
         TXtw==
X-Forwarded-Encrypted: i=1; AJvYcCWrpsC9GyV++m+Sxv3eBJbi2i5YvVg67Kyf3UPje2VuXssierY1phnGIbGwn0fX6JyfimQMh63M+Ow=@vger.kernel.org
X-Gm-Message-State: AOJu0YyRNrWiZjY2SGpZ9wc/c3oYrBrB0oMvnTNlYMfZ7FvKUeQneiYh
	Xzt6naniEbr4nOJWiu0DfEJoEjKZr9+25i9YBMIV+AO8duMJW1JQxAANZFOTq5mFRMxK5L1fbJD
	ik1fcupyUBRStj/v4MH42K0RKpqcvX3k8uyRR
X-Gm-Gg: ASbGncss+v2e0VJZvhKseBCKYVL7DmzfWTjqJoyHdM5CzcA4cSnLX7epN2BrCzOKoAn
	T4iJoSLDjV3/AlZ/bXqDjh5WjrnDXPUySTPr/8w==
X-Google-Smtp-Source: AGHT+IE2pUxNr9y8auDkQkOmn0RFC0afiW6kU6wLyV8qzA0mGIOwVF43JjW+X9L5FohPrZsluloTiO1+i+5PG9bHCLc=
X-Received: by 2002:a2e:bea4:0:b0:302:4a4e:67da with SMTP id
 38308e7fff4ca-305f45d63c1mr22909751fa.36.1736452115272; Thu, 09 Jan 2025
 11:48:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241218203740.4081865-1-dualli@chromium.org> <20241218203740.4081865-3-dualli@chromium.org>
 <Z32cpF4tkP5hUbgv@google.com> <Z32fhN6yq673YwmO@google.com>
 <CANBPYPi6O827JiJjEhL_QUztNXHSZA9iVSyzuXPNNgZdOzGk=Q@mail.gmail.com>
 <Z4Aaz4F_oS-rJ4ij@google.com> <Z4Aj6KqkQGHXAQLK@google.com>
In-Reply-To: <Z4Aj6KqkQGHXAQLK@google.com>
From: Li Li <dualli@chromium.org>
Date: Thu, 9 Jan 2025 11:48:24 -0800
X-Gm-Features: AbW1kvYT36YsREJhGRA4AjMBM6CD1GV5E-7pI5qOkbX1jFhtIZzRamOCWqsWipg
Message-ID: <CANBPYPjvFuhi7Pwn_CLArn-iOp=bLjPHKN0sJv+5uoUrDTZHag@mail.gmail.com>
Subject: Re: [PATCH v11 2/2] binder: report txn errors via generic netlink
To: Carlos Llamas <cmllamas@google.com>
Cc: dualli@google.com, corbet@lwn.net, davem@davemloft.net, 
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, 
	donald.hunter@gmail.com, gregkh@linuxfoundation.org, arve@android.com, 
	tkjos@android.com, maco@android.com, joel@joelfernandes.org, 
	brauner@kernel.org, surenb@google.com, arnd@arndb.de, masahiroy@kernel.org, 
	bagasdotme@gmail.com, horms@kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, netdev@vger.kernel.org, hridya@google.com, 
	smoreland@google.com, kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thank you for the suggestion!

Cleaning up in the NETLINK_URELEASE notifier is better since we
register the process with the netlink socket. I'll change the code
accordingly.

On Thu, Jan 9, 2025 at 11:30=E2=80=AFAM Carlos Llamas <cmllamas@google.com>=
 wrote:
>
> On Thu, Jan 09, 2025 at 06:51:59PM +0000, Carlos Llamas wrote:
> > Did you happen to look into netlink_register_notifier()? That seems lik=
e
> > an option to keep the device vs netlink socket interface from mixing up=
.
> > I believe we could check for NETLINK_URELEASE events and do the cleanup
> > then. I'll do a quick try.
>
> Yeah, this quick prototype worked for me. Although I haven't looked at
> the api details closely.
>
> diff --git a/drivers/android/binder.c b/drivers/android/binder.c
> index 536be42c531e..fa2146cf02a7 100644
> --- a/drivers/android/binder.c
> +++ b/drivers/android/binder.c
> +static int binder_netlink_notify(struct notifier_block *nb,
> +       +       +       +        unsigned long action,
> +       +       +       +        void *data)
> +{
> +       struct netlink_notify *n =3D data;
> +       struct binder_device *device;
> +
> +       if (action !=3D NETLINK_URELEASE)
> +       +       return NOTIFY_DONE;
> +
> +       hlist_for_each_entry(device, &binder_devices, hlist) {
> +       +       if (device->context.report_portid =3D=3D n->portid)
> +       +       +       pr_info("%s: socket released\n", __func__);
> +       }
> +
> +       return NOTIFY_DONE;
> +}
> +
> +static struct notifier_block binder_netlink_notifier =3D {
> +       .notifier_call =3D binder_netlink_notify,
> +};
> +
>  static int __init binder_init(void)
>  {
> +       int ret;
> @@ -7244,6 +7259,8 @@ static int __init binder_init(void)
> +       +       goto err_init_binder_device_failed;
> +       }
>
> +       netlink_register_notifier(&binder_netlink_notifier);
> +
> +       return ret;
>
>  err_init_binder_device_failed:
>
>
> With that change we get notified when the socket that registered the
> report exits:
>
>   root@debian:~# ./binder-netlink
>   report setup complete!
>   ^C[   63.682485] binder: binder_netlink_notify: socket released
>
>
> I don't know if this would be the preferred approach to "install" a
> notification callback with a netlink socket but it works. wdyt?
>
> --
> Carlos Llamas
