Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E82F390C9A
	for <linux-doc@vger.kernel.org>; Tue, 24 Mar 2026 15:30:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774366239; cv=none; b=fTRDRRSbFgK1Pc6bDgWsvr+3CNSo5uXJSjJhhykK7To1GTWceNH7r5q8XWrAAyyqbwPTHyi2jRDDP2MDwkHLwTP9dhapD5eVTP28p29XD2WljrjzmGSs09X3ZJoJuAAWw++U81bOY5fFwU87JwwNEgyWO/e2HEAMOeITnDMYVks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774366239; c=relaxed/simple;
	bh=gAfLzcxzb5imxOXbOMzClv6ppwCmz/QiaDAaLw0iWak=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JoFmcuqDGW07FIUObEwz0XH95HpdrPXtnuWTaGlvcoxTjOtEN87AglsiSzw3lq8yWV42BaTVHi6QDY4bNZrXk8CZoYzK026TRP2ME7rGSp8h9WwP49E/9qR1PJLW/hkEfXUr7vGM+LvetmCWzDHOdgPuh28KCGjrmvAA2fJmpGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=XV2pXuWG; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="XV2pXuWG"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-486fd3a577eso35608445e9.1
        for <linux-doc@vger.kernel.org>; Tue, 24 Mar 2026 08:30:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774366236; x=1774971036; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EYKECZ+c2+1LaN0ZpFAMYQ/fUaZTTSWm0KVzZuhW4Vk=;
        b=XV2pXuWG7rxFy5ipjK9CA18xJUvder5LDpvT+L/Li6pTg23usRSINUk9udkN8adrQ0
         9ThbsJKLArHhkgGnnMxlphnVrYXZHi0cDcrJ4KoGv1V5M+pb93/QMQlX3Vy8QKzk+6oM
         aTncfP9WM8JjSmr70VMcuSR3YV50pafVWvYAWdKussborjmYdMFkUyhzwDhEbEEVklj1
         ALgjT8iIiaQux7zfwKKFAH8/ianFnZZct3tpKWYokJPbVBU3PxIsduoTRNZSKn4HdfH3
         b+3k+WU6+1Rd21BLU1yRMQOL9L2DTa76Wp++71qddu4YcSUT+mvEZ7uaB3S0GwTYPpAu
         nzww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774366236; x=1774971036;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EYKECZ+c2+1LaN0ZpFAMYQ/fUaZTTSWm0KVzZuhW4Vk=;
        b=LyqVoOhelAI8Xv8ZL+VGXcohhGQcTg0awvKB/TODmeLp1n1vq19paXGN6eR5rqTh6G
         lgeBMyorRJGTFM5rH0hggm3gsiHhkW8E860ofe9t7cI7c9p/NLQW+JpP2KFFFGj2AIPi
         Bw/+ZL+8x5dRDgRPbvUjzeK1tzJMtvxiDsIRTv/4DWoVqB13XV+0HMkSQjWEaQLETu6t
         5M2/W1gLSvDRgzVOnznJFxBtInPbiW6s+1ED3oub64y+Wxl60kTNaUbdOCmkSnMIeDo1
         Mxy+vnle8rTbAsMOSEpZsPk/P00HPlAtW3oSgo/NAToDGD7/G3ucvET2jRD8aZkDbIyh
         skoQ==
X-Forwarded-Encrypted: i=1; AJvYcCWcKCgKS0NEfHQva0rR3ij7aCJ4Szs53jnHWGbx8ZzBzhcoXG1QOybB+94Hpfq7PW4QWfnnMbtxY+M=@vger.kernel.org
X-Gm-Message-State: AOJu0YxLnFpSmSJszio3DNDhbDJ8WO+K9bFQYoJmy55rJ5TgJDAU21rn
	C7pGYKlRgQZh20Q3F5rVhbXXScjXaTHyYADZY3TySYdg/oIV556YvIy/xTNIg9d2OA==
X-Gm-Gg: ATEYQzwPp7V9EF1DT8K+CjkMeRWiaA86df5rG8TBombQfQ9J4bT2GMNRPEvgSMo7F/m
	Qq9a2yzPhLnvVu87nVhQ2HTfRm64uHsoKshHL41l+UbiZhBf/SD+1HeUic8DLc//GhiMzsEfb9o
	YJTBD4lPTDLGb5yJU3ASJ3TcmV7/b2Rh4MUL9MWv/VejW7UL1vy/cZB1NK3R2YBeJo/Fh04zLGl
	fSN/5oVZ0+tvyHHv9Wt0N60+5mNh4pTBLIhcxBqO1NQYnYSkfuG4GkJ340+PYjMHNrvfMPtQy4+
	jrg72QTJZlJ0uMzqKo3TzL61jPhyDnI6RmJWbvfrlHtiC030TCaNaTQLfyAyWXX3k+E+LF0A4n3
	O6FZLBZyT+w4NncpyEW1KXUtI+KJ5Kq5cxyhwynu76aRb7BUQLqeAj53bqAebWcusRAEWdppzBi
	EjMriTR7WCr6YjJQlbiO7WtpWCQT8upC+omCXKCf/Tdsx+sOfRMxDrGg==
X-Received: by 2002:a05:600d:8:b0:483:1403:c47f with SMTP id 5b1f17b1804b1-48715fb7246mr2891295e9.6.1774366235189;
        Tue, 24 Mar 2026 08:30:35 -0700 (PDT)
Received: from google.com ([2a00:79e0:288a:8:820c:ac9a:1d85:a65e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4871105c799sm26733795e9.20.2026.03.24.08.30.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 08:30:33 -0700 (PDT)
Date: Tue, 24 Mar 2026 16:30:27 +0100
From: =?utf-8?Q?G=C3=BCnther?= Noack <gnoack@google.com>
To: =?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>
Cc: "Panagiotis \"Ivory\" Vasilopoulos" <git@n0toose.net>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-security-module@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, Dan Cojocaru <dan@dcdev.ro>
Subject: Re: [PATCH v4] landlock: Expand restrict flags example for ABI
 version 8
Message-ID: <acKuE2X2PWsRkfpR@google.com>
References: <20260304-landlock-docs-add-tsync-example-v4-1-819a276f05c5@n0toose.net>
 <20260323.sheiHaR5uRoo@digikod.net>
 <acJa_56LtPeeH956@google.com>
 <20260324.aqu5Eic7Thee@digikod.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260324.aqu5Eic7Thee@digikod.net>

On Tue, Mar 24, 2026 at 04:06:01PM +0100, Mickaël Salaün wrote:
> On Tue, Mar 24, 2026 at 10:48:29AM +0100, Günther Noack wrote:
> > Apologies for the delay, this must have slipped through the cracks.
> > Thanks for bringing it up again.  Yes, this looks good.
> > 
> > Signed-off-by: Günther Noack <gnoack@google.com>
> 
> Shouldn't it be a Reviewed-by?

Absolutely, thanks! I meant to send a Reviewed-by.
Please ignore the previous message.

Reviewed-by: Günther Noack <gnoack@google.com>

—Günther
