Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CF7B2DB791
	for <linux-doc@vger.kernel.org>; Fri, 12 Jun 2026 09:19:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781255991; cv=none; b=EyMvbxD+x4fWvYjJmzG3CzSYZYCeLJMl+1XqD2rsyqdEOM0POfzWZsfaA99cS6OEQmn3fUKJPHXL7MK4IEccb2ilUD4t+iLu/HmthdJIfhwKX4x5aCteltZ1HY+1R8ydev33eHNhb7knt0T5n6SfVdh0Xz41GmpNiYo3SQGmrs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781255991; c=relaxed/simple;
	bh=SbmTGWvc0FOhj12ebJqMZ3T8dM+uZs29bl/4qr57bgY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QATT3qolMe5szDCuMiTU7YIhkzbQ5cqYTQcTvEfMkHpHlJ9nnu1pOInupLooUMnx7Kqxs1G6JI31hYXmKmMbk4uhKBUKTLSQPNk9aKq9iHIJqVgjJrtu+q6eZ+jALzNNM/Ubrp5Jaxc2InlW1Pne070BWLjEdlV+O9BYsWYl0rQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=FeCXj5H0; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="FeCXj5H0"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-490aaeabdb4so4648355e9.1
        for <linux-doc@vger.kernel.org>; Fri, 12 Jun 2026 02:19:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1781255988; x=1781860788; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=71oGCFxYWbuyn3cYv7RICT96Uu1k+wrgJKqPwxGnJ+8=;
        b=FeCXj5H0XCTnB4Z9QjCJPbWDLOv0jb0S/VlmfXLassmomFWL7qQPlWtKH3h7z7x43G
         qqeXdDyGfDLVBJcW2MQOq/EjP0AGwAXP7Y9NI/MTzqcpf/UCn2DLHK0HEYrzb9SPwrFo
         AvlwfRYr/3X5cPYSv8Z0OA4dJTU3tJUqgXCKQFeAnVeDKyfj/GWkUcOHAvAhxha8x20/
         5keJPG/3VwMmLhqC6r6iLKpiozlt15ed68Ma8KXOtLMjzxgPctq0CB+yISqkMkhcD/LL
         MzZ6vvJRMEn6B0L35AnRAfO/HIAdHMZcfO6N7gQR992gFoQRny3zBmZy4u7Z9vxr4Z3q
         LSgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781255988; x=1781860788;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=71oGCFxYWbuyn3cYv7RICT96Uu1k+wrgJKqPwxGnJ+8=;
        b=TCApIQd21kAIsMsj+gSY6af7nL+T1NYGe+lDMKhWHskzC8Z8XETo/vUTrOD7UbykeZ
         mwahcWSVjbrCH9tOf5mBkmwNkXB7FrBqs7z8ftrV9vZ9qsFkmXTqqu5QyyJ8HZYPgb1A
         aS0nRriELVOt8fbPg03CzbeCrlALnB5B4ioa2xxPTzvNOKa5+fsi9TVyrFnTb1z7BWiU
         teC1jMewD0Ha5khg3Q6VonDdVf4/dkgk2kFzObTy4Z+ppXpOwPce1lwNeVNGOqcwS8JS
         j1x35mcMlfk59Jd3uR4C6+3tLGRMmdH+bj2RwLGyOp2yu2C6kJiUtLeWdmkWAPRpDztB
         1d4A==
X-Forwarded-Encrypted: i=1; AFNElJ9XHdzSif8R3F2jdyMiiv8y29IdfUO+IFC73UlGNuv1/VZLZ+JzWOHr9IrsCCJYlVXUEMIE/sPVr3c=@vger.kernel.org
X-Gm-Message-State: AOJu0YyPJmKh11nu0jiobGN1Uhs0Y/Ew1taE22B4lgPlXRpNASmIEjGF
	5U7PX6abrYh+kZ6WDpX5NIPIGJl+OcU28sZDI4vVcsnwGpVBmHOFOd+89Vw1RfZWRXU=
X-Gm-Gg: Acq92OElcb7hwj7sT14KvuY0frBjIN77kynCbaBWv2Q4to1L0j56F7y8mAiDWJg2T2g
	z6S4bo7IRMwW+93g8JUuoIDiXduMYu6k84aL3kHr8ltcAFYQCWA9sc8Ve8Yr6ha2fVMYK1/+pet
	5592XcapbtovokPLf8bmEjpVKaqZn9Qnam29vVKkfjhUWxy+1IIkxvtrtQsxI62TRPUQVx/bpqI
	VrnaGJfAkVMkeQ048p/IsJsu1s3OP+R+Jd/0KgPmDh4lM8NXOVUDPJjOtdCgLvfM6yL5onyrL1Q
	UzESzc9FmkG8CgpO3EYZuv2ZDZLCjXrPyYqEcm12SJczMyYdIE7P3GQchQWPTpNUcjuRlexuAkW
	ndpT+4LFANRQ7sCzLZwGVdKHxFdhRFwjCSx4O8kYLP/sQm7XMSzi+Pt7N+sCeifETdUdmKQE0Xy
	ZyJXFT2Sy+iR+RJpcyB+qKAlqmeg==
X-Received: by 2002:a05:600c:3105:b0:490:e60b:6860 with SMTP id 5b1f17b1804b1-490ec4b5a3cmr25667615e9.7.1781255988326;
        Fri, 12 Jun 2026 02:19:48 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490ea4b39e9sm36582425e9.0.2026.06.12.02.19.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 02:19:47 -0700 (PDT)
Date: Fri, 12 Jun 2026 11:19:45 +0200
From: Petr Mladek <pmladek@suse.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Jiri Kosina <jikos@kernel.org>,
	"Daniel J. Ogorchock" <djogorchock@gmail.com>,
	Tamir Duberstein <tamird@kernel.org>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
	Steven Rostedt <rostedt@goodmis.org>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH v2 0/2] vsprintf: add upper case to %p[mM] et alia
Message-ID: <aivPMQv5ImhWjpuR@pathway.suse.cz>
References: <20260603104351.152085-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260603104351.152085-1-andriy.shevchenko@linux.intel.com>

On Wed 2026-06-03 12:34:01, Andy Shevchenko wrote:
> The first patch induced by Sashiko rightfully rises a concern on
> potential ABI breakage. To avoid that and allow the user (patch 2)
> to be converted to use unified output introduce %p[mM][...]U for
> printing in upper case. Tests are included and passed.
> 
> Changelog v2:
> - added first patch (Sashiko)
> 
> Andy Shevchenko (2):
>   vsprintf: Add upper case flavour to %p[mM]
>   HID: nintendo: Use %pM format specifier for MAC addresses

For the whole series:

Reviewed-by: Petr Mladek <pmladek@suse.com>

I am going to queue it via printk tree.

Best Regards,
Petr

PS: I am sorry for "late" review. My queue is quite long
    at the moment...
    
