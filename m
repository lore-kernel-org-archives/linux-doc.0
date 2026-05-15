Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4DE53AF64B
	for <linux-doc@vger.kernel.org>; Fri, 15 May 2026 14:25:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.133.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778855129; cv=pass; b=gmGXTD6JAoBya1BZTDKwlozWYVxgP6WMbLzxlV0hsuEl1cGcbxWVjEJa5lMLyIx6VsrTEQX3QJOf2UkN37WYJ1XKyvr46M2lQxpeEoIIRNDtxY+tSTPFvtq6AbK2QX/EgroW/fTl6VODCYrexjaUtcbzyFsh6w+EirU5vOdQDLs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778855129; c=relaxed/simple;
	bh=TA5ESWaxk/ziiyS01LtpqfhWIycxEsFgwAIPwQRU0UY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RPhHsWElLRAYWW2hRa/FD4/+chat+T8SMQRKCectEPqbwoRnriD3y+iAuJG6uC3CXKKiaSFeai+yQ/pDL4EoGvOVhJxdGLyUSQ/mcErutH/P/6oF/s0Z2vucMlBj3oIJ3EOBBEyLK+Zu2VPHle7NR/M1sAy60mXdkRlyiINJh14=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=K0PW0xV1; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=kmAqZPm7; arc=pass smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="K0PW0xV1";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="kmAqZPm7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1778855126;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=x7Embi/4WSTFlWQtHoiZCAOUQi9JugMiQF8nvMXYC0Y=;
	b=K0PW0xV1+81YwAXVqpf7OmSNpZfrEHsssxl+bFB+jeaBufZ4eoVkDxGQdgijdLs8f35dpH
	yysLGsrlz1Y8iz5HNTDt8B4/46zxJ99Fehj5iB5s0K845kO5nKjOZNCFBCKvLFxbu2YLR7
	CxRsgbIjWVDwK9xg6EBPOeFeF/7Iqkg=
Received: from mail-yx1-f72.google.com (mail-yx1-f72.google.com
 [74.125.224.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-548-WJM5ncrlMMe5YsuJY3xmsA-1; Fri, 15 May 2026 10:25:24 -0400
X-MC-Unique: WJM5ncrlMMe5YsuJY3xmsA-1
X-Mimecast-MFC-AGG-ID: WJM5ncrlMMe5YsuJY3xmsA_1778855124
Received: by mail-yx1-f72.google.com with SMTP id 956f58d0204a3-65c62ca395cso18263646d50.1
        for <linux-doc@vger.kernel.org>; Fri, 15 May 2026 07:25:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778855124; cv=none;
        d=google.com; s=arc-20240605;
        b=JncEo9Mnztf90uESjTn+iCUgMzqtpl91nwXYUnv38nhxGsZl7TBd6zxMpYijGeOEql
         XZIOeY33geAyrsG0k9Ht1IVrw71R7GVnTv7sbrmu0lqjPABna1n7JSOg6SqyAKfxq3bf
         k+b9sdDHZ6N7Io0pk5xMh4HnZXPb9Jy9mzfR+QJNS0JRx7NiUsN/b7Df6H+ykaRz7Zii
         qKgUAYvU1WO/OVBOPEdpxcdxIN05BdcjLWGkCrhLsK3zW5/cgb/nSCImmMN6B1l1+p/9
         JHnA+1s7u9+sF1VDdjGFf5KQTchAu4+Qk6Ns3gf5eolqNFldGyALnbYXii/x0lpHj0YO
         KDsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=x7Embi/4WSTFlWQtHoiZCAOUQi9JugMiQF8nvMXYC0Y=;
        fh=EpJuBfZlRlocgMemcXN53WK4A4npMhBcyYetrT79Vfg=;
        b=UjzU/OjhY8ODrG6UhUbli1RTXz5v5WMho2M6cP6v7AO/6AJ/iR7z4pJnHQnCoHfmqX
         Lltb1AMoSH+9qy5uaHWvJCVLkCvmd+S/HFdXjjhOVccMffnVKYEO57HNON7aawgu1dEt
         Dfrf7jlVAyKp8mLCYIh0SDCKDhTQuGBZthWdXKZST4pwFwYlpcQw5iH+NfyOi1M18XNV
         PoOiDje1v+EPRwRjUcy3aGl0l0H8p9jqcJC4G5xd2o+RJ06GebZ/8DaJUWpmgoNv5z3t
         3MdNewUNjP+yzBUtoSYgQWJfx466CYCnoprUPBx6wDwzdcGm6mfR8lkH4sMXidw/M1f5
         cUNA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1778855124; x=1779459924; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x7Embi/4WSTFlWQtHoiZCAOUQi9JugMiQF8nvMXYC0Y=;
        b=kmAqZPm7P2kazLN8aFT1PqnhpeWMx3ydoEe/A61h+v5zME7GK8LZkuTQYW2OlPyBJ6
         Mf7KA5/24cfQliXQIOLmy/M0+kABsZO0U5Gb2dpoitHO8AM/PYTjn/C7f7OXtJoZ32QY
         3d3QIyZzdr8X2UZHBg38/kM3UYTDA0cDQRE2qiHmUt/QPgDDNV2V0LyHfZiXHgeTRPhO
         UfpEBDprETLXCjthon3nRz7grBk0xK8fxreWjorzjsaltUbEYbIu/dQ7ejZXuyQ9EAZd
         azjkukyNfApgW2ko/Kig2i8hwPfgkhM5zAn2wWrQ2MPxJ2xrCjJ/pfsHfKIYoTOsaaC/
         O5wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778855124; x=1779459924;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=x7Embi/4WSTFlWQtHoiZCAOUQi9JugMiQF8nvMXYC0Y=;
        b=k3GKnBeq8GsBb/T+PTJfUmwzgPdPtzTyAcFRxVgZaBLNfmwccqYS2TdiIH5vqz4Pyd
         pOCMyHUuf58A+W46UxXR7rKpdr2Pajb7/Tr8roP++d7e4atnFS7DW0vQ8/psJBZSgMAe
         AnYQweQj1jDmDgzQ+cfO+y/VUcq+kHUXwxlMYLa7s34DzL+ZhqquvMrZgEKycLt7/mB3
         yXxQrernQpn41GOe2svz9uTGKQaxtM5eis0o1bC/f2Hh61PCSWxBbktRl+kJzpikoT/V
         jBCLAgHp9BK6ZjwLueBmm9LyZzRqaXXNuVoHYkzIVP9AZ8VKlxemz0WPGmmPhZsfwxbe
         RctA==
X-Forwarded-Encrypted: i=1; AFNElJ+NttTox/rR3BVSrZ7gAlzSU06oPjSY1eyamnHMjCtawFQiEFfLCtazl3l4eZpQIJ5tYDHh3RsO7/o=@vger.kernel.org
X-Gm-Message-State: AOJu0YzZOYSeAYOqlyxOV9qnyl2CbwgCVgwstMgOqLBCIiberWqc/fWJ
	aH8mas9i6Z2aVHKfvm70hypCkWu6MgKW9N8KcR9r9f5FbfYjgiY6EUYQ6SuMzOIpRJKwPIy2ZTb
	VMQdwYs2otryZkUf+0Oa9HykAg7PrhZ+b0Nxu2lO3CJf86tdWXP9r9DjTl5P+KvjwA6ipDlJpsX
	Cqzk2yFzbGeC7iVxI8Yt4MKiFhEMpWpfmsukWC
X-Gm-Gg: Acq92OHyY8/VbkmKtxFjIwUYO2PupvGTqrxG31DK8m5HYNx4AryD2EDJ2flaBO6sfDN
	kMHOU1VtGNKY301lGCGbge6RTCO5aY7opLKbfJFBt9s9FD++BIp1G6SHrlb9MnjrwkpgcizrR7j
	fCt1mS1HdKg8ifGZIZujmU6wYJdHFetlttLCByBv3JYLFE0RrQDULERtFRoLfmyh0Quaov0mpfd
	XtLWA==
X-Received: by 2002:a05:690c:921a:b0:7b2:136d:240a with SMTP id 00721157ae682-7c95a56fc91mr34928037b3.9.1778855123626;
        Fri, 15 May 2026 07:25:23 -0700 (PDT)
X-Received: by 2002:a05:690c:921a:b0:7b2:136d:240a with SMTP id
 00721157ae682-7c95a56fc91mr34927427b3.9.1778855122973; Fri, 15 May 2026
 07:25:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260515-kunit_add_support-v13-0-18ee42f96e7b@redhat.com> <7bcead90-7d96-4101-bd13-dde2c5ded1aa@roeck-us.net>
In-Reply-To: <7bcead90-7d96-4101-bd13-dde2c5ded1aa@roeck-us.net>
From: Albert Esteve <aesteve@redhat.com>
Date: Fri, 15 May 2026 16:25:11 +0200
X-Gm-Features: AVHnY4II_A6w9jZTl5s671EZUUpKeCpv5nVKmn-MiUqfHzgEw_QM_N-JJo0K588
Message-ID: <CADSE00JVgP50vud_3uvvjg6HDeEwc1TsK0E=gSKV07jKtT+vMQ@mail.gmail.com>
Subject: Re: [PATCH v13 0/4] kunit: Add support for suppressing warning backtraces
To: Guenter Roeck <linux@roeck-us.net>
Cc: Arnd Bergmann <arnd@arndb.de>, Brendan Higgins <brendan.higgins@linux.dev>, 
	David Gow <david@davidgow.net>, Rae Moar <raemoar63@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
	dri-devel@lists.freedesktop.org, workflows@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-doc@vger.kernel.org, 
	peterz@infradead.org, Alessandro Carminati <acarmina@redhat.com>, Kees Cook <kees@kernel.org>, 
	Linux Kernel Functional Testing <lkft@linaro.org>, =?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>, 
	Dan Carpenter <error27@gmail.com>, Simona Vetter <simona.vetter@ffwll.ch>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 15, 2026 at 3:51=E2=80=AFPM Guenter Roeck <linux@roeck-us.net> =
wrote:
>
> Hi Albert,
>
> On 5/15/26 05:29, Albert Esteve wrote:
> ...
>
> > Guenter Roeck (3):
> >        kunit: Add backtrace suppression self-tests
> >        drm: Suppress intentional warning backtraces in scaling unit tes=
ts
> >        kunit: Add documentation for warning backtrace suppression API
> >
>
>
> How much of that is from me at this point ? Wouldn't it make sense to dro=
p me
> as "author" of those patches ?

Hi Guenter,

I do not mind authorship either. Signed-off-by lines already attest to
everyone's contribution.

In principle I am done with Sashiko's reviews. I addressed all
comments in their respective patches. Some lead to the rabbit holes I
put myself into for previous versions.

I do not plan to send a new version unless a human review requires a change=
.

If that happens, I may update the authorship. Otherwise, I'd keep it
as is, since you said you do not mind :)

Thanks!

BR,
Albert.

>
> I would not mind. I had the idea, but others like you are doing the hard =
work
> of pushing it through.
>
> Thanks,
> Guenter
>

