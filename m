Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E9BE15E5D4
	for <linux-doc@vger.kernel.org>; Wed, 18 Dec 2024 10:16:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734517018; cv=none; b=kq/qPdz8UXL7nPuW3bFP5NaqmcZdqAs6qHFhOY5YXoLSBIX8LQUaJ8lqvRI8ruKw8jr12nb+xA98dEZHaWBAu1xDCDcAhim42UikjGDJJoZgONFxlTwKftbpJ3SVT+yHyS9rjvU5WLosQwhBzwtzHN0ELCbhyIJrwLJ5QcpW3bs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734517018; c=relaxed/simple;
	bh=iU6z1gcGIvyQRI/iOTPq2I99wpCZIhlViQR5bRycBLA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=ShP+1lImStPBYhIk7ygyb7CR8h1CD/zVn4Q42xqWuZAo7hc9ardse2tz9YRSOeN3oeDGGZnoDHXOdL+11AQ+EeK4py09XPvze+W41mB05xOALYYYVp+7DFhJ3sHuHkmZ7BOvRRYw77d2G7LSdgcYq2MXgNcWPQX9dj4enq7/gq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rasmusvillemoes.dk; spf=pass smtp.mailfrom=rasmusvillemoes.dk; dkim=pass (1024-bit key) header.d=rasmusvillemoes.dk header.i=@rasmusvillemoes.dk header.b=UkUZAo4B; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rasmusvillemoes.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rasmusvillemoes.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rasmusvillemoes.dk header.i=@rasmusvillemoes.dk header.b="UkUZAo4B"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5401bd6ccadso6384845e87.2
        for <linux-doc@vger.kernel.org>; Wed, 18 Dec 2024 02:16:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rasmusvillemoes.dk; s=google; t=1734517013; x=1735121813; darn=vger.kernel.org;
        h=mime-version:user-agent:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AeFCiN7vXYoo1AytV3a9icS7bqm4Eq3nEjhnUXrbDYE=;
        b=UkUZAo4Bcgu5K681pv2NpwukbYqaGpwQPm6AOJhIwtRL9646QXjFytcqHXMju3/4/G
         swbM7dLAchsA3Kw0gKUG6xd0A+H1ahwv1U0qmt0J8aR5GbDMCAXQ1GjHMPMhiRzr8Uv1
         l+pTzJoCkd6eXX6Lzcm3//HqlCdaiurd9TEqc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734517013; x=1735121813;
        h=mime-version:user-agent:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AeFCiN7vXYoo1AytV3a9icS7bqm4Eq3nEjhnUXrbDYE=;
        b=agut9hSohQmjqNoqVodLmLiYuCc7o/Yjkb0xjQBd5zfrvQax2G81J2ZrJG1Yz/GW8B
         ee/sXINz24nviJiUIoUAZiXH78OCJUv911pg+flL5kbP6F34mWc7uscV107zd/s7PWh2
         nTkPSrnNO647Z9NS8+GNk1+V9juThzz9c6i9UNH1ld7Ew+GhlPY/rjQGCHurx78OlIhh
         5H/PQBdHQRYK1OLV0fo62xlBo54Vw2WxybmU99VC6R4MyFdcODUAJPxD7sUzS+8ns2Sm
         tpdw0jepRkgZmiKDYJvholJWbGUlriGskTD5RkXMVyKNnq01i5vCV9Hx+nCYUX7sy6nl
         9kDQ==
X-Forwarded-Encrypted: i=1; AJvYcCXYzBISyjl/JRiQZMeEybEEX2q1TBqE/amt+KKnXqYRi5kxH32gJOww2yyCabt5TftQ1y/PBEgQ5JE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5unioEuh1QwDaIS82Vs/B7JJSmrQvLWqD92w7Z2T90ejU2Gxr
	3PDSwy3gEvNKV86UmJeok0zvvlyGBnMa6VWx+MzJ22YXm7roIxOLmWfzwJzgZIk=
X-Gm-Gg: ASbGnct4q43DcWGcK/j7JKlvpnzHzH4CamDxnXP1D97n6iMQojpgdmtvrG7DWUdRPwX
	AIrKdueOQhAtiLRYG8qKxQUbR9r5X6pOfogjWnej6TSO3prg2AlFvG4TVyDMvOMuneYyBRaJY8o
	kXHWge52DSUqkKqid4D2u+biS1Q7r/kfm6IkXaAKj/Igr+7QFfNd5xn0xHlCXGTMZWZ9gm2wcG2
	GHginqB4j8Ph4c1jmsffidlSM2yBRmHGaS9F30/ExHaT5s34t1ZF+2fXw==
X-Google-Smtp-Source: AGHT+IGu/Vjy2xFcd+GzaKZxrfSMFc6S6HvZMTcBqU1mLfnD774H4Nc1cW7ZOXoUgKN1cs7ZHwEVRw==
X-Received: by 2002:a05:6512:3c86:b0:540:20f5:be77 with SMTP id 2adb3069b0e04-541e673d973mr887719e87.3.1734517013335;
        Wed, 18 Dec 2024 02:16:53 -0800 (PST)
Received: from localhost ([81.216.59.226])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54120ba9ac8sm1419550e87.76.2024.12.18.02.16.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2024 02:16:53 -0800 (PST)
From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Petr Mladek <pmladek@suse.com>,  Steven Rostedt <rostedt@goodmis.org>,
  Andy Shevchenko <andriy.shevchenko@linux.intel.com>,  Sergey Senozhatsky
 <senozhatsky@chromium.org>,  Jonathan Corbet <corbet@lwn.net>,  Saravana
 Kannan <saravanak@google.com>,  Andrew Morton <akpm@linux-foundation.org>,
  Zijun Hu <quic_zijuhu@quicinc.com>,  linux-doc@vger.kernel.org,
  linux-kernel@vger.kernel.org,  devicetree@vger.kernel.org
Subject: Re: [PATCH] of: Add printf '%pOFm' for generating modalias
In-Reply-To: <20241217183711.2525863-1-robh@kernel.org> (Rob Herring's message
	of "Tue, 17 Dec 2024 12:37:09 -0600")
References: <20241217183711.2525863-1-robh@kernel.org>
Date: Wed, 18 Dec 2024 11:16:52 +0100
Message-ID: <87wmfxfg8b.fsf@prevas.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Tue, Dec 17 2024, "Rob Herring (Arm)" <robh@kernel.org> wrote:

> The callers for of_modalias() generally need the module alias as part of
> some larger string. That results in some error prone manipulation of the
> buffer prepend/append the module alias string. In fact,
> of_device_uevent_modalias() has several issues. First, it's off by one
> too few characters in utilization of the full buffer. Second, the error
> paths leave OF_MODALIAS with a truncated value when in the end nothing
> should be added to the buffer. It is also fragile because it needs
> internal details of struct kobj_uevent_env. add_uevent_var() really
> wants to write the env variable and value in one shot which would need
> either a temporary buffer for value or a format specifier.
>
> Fix these issues by adding a new printf format specifier, "%pOFm". With
> the format specifier in place, simplify all the callers of
> of_modalias(). of_modalias() can also be simplified with vsprintf()
> being the only caller as it avoids the error conditions.
>
> Cc: Zijun Hu <quic_zijuhu@quicinc.com>
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  Documentation/core-api/printk-formats.rst |  1 +
>  drivers/of/device.c                       | 25 ++--------------
>  drivers/of/module.c                       | 35 +++++------------------
>  drivers/of/unittest.c                     |  2 ++
>  include/linux/of.h                        |  8 +++---
>  lib/vsprintf.c                            |  7 +++--
>  6 files changed, 22 insertions(+), 56 deletions(-)

This diffstat lacks a lib/test_printf.c line. Please do add test cases
when extending vsnprintf().

>  
> diff --git a/drivers/of/module.c b/drivers/of/module.c
> index 1e735fc130ad..80879d2abea8 100644
> --- a/drivers/of/module.c
> +++ b/drivers/of/module.c
> @@ -8,21 +8,14 @@
>  #include <linux/slab.h>
>  #include <linux/string.h>
>  
> -ssize_t of_modalias(const struct device_node *np, char *str, ssize_t len)
> +/* Do not use directly, use %pOFm format specifier instead */
> +size_t of_modalias(const struct device_node *np, char *str, size_t len)
>  {
>  	const char *compat;
>  	char *c;
>  	struct property *p;
> -	ssize_t csize;
> -	ssize_t tsize;
> -
> -	/*
> -	 * Prevent a kernel oops in vsnprintf() -- it only allows passing a
> -	 * NULL ptr when the length is also 0. Also filter out the negative
> -	 * lengths...
> -	 */
> -	if ((len > 0 && !str) || len < 0)
> -		return -EINVAL;
> +	size_t csize;
> +	size_t tsize;
>  
>  	/* Name & Type */
>  	/* %p eats all alphanum characters, so %c must be used here */


I took a look at of_modalias() with that change applied. While it does
seem to end up returning the required "total size had the buffer been
big enough", this part

                csize = snprintf(str, len, "C%s", compat);
                tsize += csize;
                if (csize >= len)
                        continue;

seems that it will overwrite/replace a longer compat string with a
shorter, later one, if we happen to be close to the end of the available
space. That's _probably_ not a problem for vsnprintf() itself, or
callers such as kasprintf() that do need the exact size but don't care
about what might have been produced on the first call to determine that
size, but the printf test suite does expect the result of a truncated
vsnprintf() to match the full string up to the truncation point. We can
probably allow certain test cases to opt out of certain sanity checks if
absolutely needed, but perhaps it's simpler to fix of_modalias(). 

Unrelated, I think the space replacement could be simplified to

  if (len > 0)
    strreplace(str, ' ', '_');
  
>  static inline int of_request_module(const struct device_node *np)
> diff --git a/lib/vsprintf.c b/lib/vsprintf.c
> index 9d3dac38a3f4..6a4f99b39de0 100644
> --- a/lib/vsprintf.c
> +++ b/lib/vsprintf.c
> @@ -2169,10 +2169,10 @@ char *device_node_string(char *buf, char *end, struct device_node *dn,
>  
>  	/* simple case without anything any more format specifiers */
>  	fmt++;
> -	if (fmt[0] == '\0' || strcspn(fmt,"fnpPFcC") > 0)
> +	if (fmt[0] == '\0' || strcspn(fmt,"fnpPFcCm") > 0)
>  		fmt = "f";
>  
> -	for (pass = false; strspn(fmt,"fnpPFcC"); fmt++, pass = true) {
> +	for (pass = false; strspn(fmt,"fnpPFcCm"); fmt++, pass = true) {
>  		int precision;
>  		if (pass) {
>  			if (buf < end)
> @@ -2226,6 +2226,9 @@ char *device_node_string(char *buf, char *end, struct device_node *dn,
>  				has_mult = true;
>  			}
>  			break;
> +		case 'm':
> +			buf += of_modalias(dn, buf, end - buf);
> +			break;

This is definitely wrong. I think it's fixable by using

  buf < end ? end - buf : 0

Rasmus
