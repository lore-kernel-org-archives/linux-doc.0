Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67870227EAE
	for <linux-doc@vger.kernel.org>; Fri, 20 Jun 2025 07:44:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750405476; cv=none; b=DTboUglp3H99q9fs1BKbqs9phaBznjmUUbwfO0tbDqcjUuL200XkAtVsUY0lMvWpFDoaqq32hQmIXTR9URlRtHG+SygD+kuvdak53ylKRnnsFRTa/lqj3SfXs08+uBVSOvagBy6pbvi+lKxR8s/bTTFK8hJUGwaJ2syDMy5FzDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750405476; c=relaxed/simple;
	bh=lkh9Yrc9oEqe7zuRow4LJI+LdrznQvYhBYqFKBf3rCk=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UapJT1nRunqDYDD8cNPjtWwKGiLpYcF20reqHhWpYDHAVI2bp5u/xUlCaTkK1V+X2KRkRYDc1bfLAcY1nDvymbyT0v/yQCzX7gT1oBBp7/iofztp+LwPlAOFFg6i8DBs1CIWxcb5/0AKWMvzKw5OEE8rNpMyfH9J3oK526iEG6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j79QhJqP; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j79QhJqP"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-ad89c32a7b5so267367266b.2
        for <linux-doc@vger.kernel.org>; Fri, 20 Jun 2025 00:44:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750405473; x=1751010273; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0CWfoyyHqqYcOf5Hg3f23ABr9GnIPMX1Zj7qOnG9G3k=;
        b=j79QhJqPQpPhspbQddqAPnKDnQJ0aK8Ql6GYodZyuoGMQj3iQXbcpXD8fkeR4GWqWh
         uFFyHMNlZe8drbB+Hnu1d9JgsIUHrVg37ncuYLOVBEqbYGBli8k0ya8+zChM/og6FRIk
         d0yqx7mjz2ZGOYxGMXpEFhzFe2H5ff4riYK+FL0U7cHPZuv2UjH2Fmkv6x6XE9f7AiW8
         xj8F32JswA0zUCMg5HNkgQ8XxtZlSUKEV/RZMcjdQD4SXzBFoT8aJkNwv2lMEyLv+MLA
         Iz9yENiqFCaYmhOOoeNsreHpWfIlanepdXDbbN+o1kiDOjbGr648sJviIrerGkWQsP/N
         bDSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750405473; x=1751010273;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0CWfoyyHqqYcOf5Hg3f23ABr9GnIPMX1Zj7qOnG9G3k=;
        b=rE+hKcAZ//ZOnVYv9mascdBKZ1pzBz2cerxaqgnQ+8ecq9PDEI5JjNDmuU3wMKWkO/
         Lt09e7FwzXNKRx8/izRghas8nK+XCcSY1/c+a/DPBPBx/ZF6yUUAnqcDE3Mk0U3dmPEa
         TYQWpvR0C3QtBQu4eSpGa/f6Sh9hdtskG08caMndiLGsyH9lek7jZVkZz2Kkyez0mxc5
         27cHgK3B9iO1sFB88XXRPklQPxhf+IrjHdacrNNXwXh8NnhGWgte9uLky/ZfnmbfdA/s
         nD4bv1vbGsv9DHhPgE1x1AlF2xgrlrFY8ow6TWLw4pyg3NBLbH5sIy/dbTlQ3L+zwXI0
         59vg==
X-Forwarded-Encrypted: i=1; AJvYcCU0kEGAKkKkRnVTU6zSdf/whend9aldZL/vK7nRX32Pbt9HFNu4qFq5s/vG+hqic8tCsed5E8iUi5Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YwOBUEidrvpWPO30ipmV3SeJE6kWhO9tCBoYJg/alL4gjrtliBe
	V16Xui5F0KxpHR9K+mKYR0FGDVPbD9pW/b6wl2bfIqWzoE0R61+HyHdTLaAtyg==
X-Gm-Gg: ASbGnct7Kq3ORWh/TCZi9CSzXtM93RqUBYwaiZkH/Gp/Lxq3qYOAH7LT/WUDkADopQu
	eHXwENEcBKv+xUEH+CejnVcDxYOhxi4eWok5uBC1jQk9SZDJDac9fBEZINuAqiVv+qOidxuYK3q
	IdRsPzHttZu1/SFyjn1RAokPIE20wwEbo+cvis0JrObz2qcqmdCOcAxNasfwiaJzRCtw79RyVGn
	lBu2vUFk+re4Iua0hnSas+GiN35KVHpIZjv03IJ4EEP2Qmfat+bSuY/cPK0rz6ZzUqiSRu05lSS
	qKOz+X2YLI2mMNwl1TMgbpKZqWkw1bNPMz4Agz4RYK3nNC/5kqJ+FrVklg==
X-Google-Smtp-Source: AGHT+IEuKFuyzLfBpdPUJPrItDb6k39INWXv5Fel6g5IXbrUJ+OY4A7vUg0fWinmOhAd+pqOdQN2gQ==
X-Received: by 2002:a17:907:f48f:b0:ad8:8621:9253 with SMTP id a640c23a62f3a-ae057c22546mr162555566b.50.1750405472379;
        Fri, 20 Jun 2025 00:44:32 -0700 (PDT)
Received: from foz.lan ([95.90.158.170])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae0542080adsm117452366b.151.2025.06.20.00.44.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 00:44:31 -0700 (PDT)
Date: Fri, 20 Jun 2025 09:44:30 +0200
From: Mauro Carvalho Chehab <maurochehab@gmail.com>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, linux-doc@vger.kernel.org
Subject: Re: docs: sphinx: avoid using the deprecated node.set_class()
Message-ID: <20250620094430.212779e5@foz.lan>
In-Reply-To: <03285fe4-61f5-429f-9535-5c826536d4b7@gmail.com>
References: <87wm97fmn3.fsf@trenco.lwn.net>
	<03285fe4-61f5-429f-9535-5c826536d4b7@gmail.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Fri, 20 Jun 2025 11:22:48 +0900
Akira Yokosawa <akiyks@gmail.com> escreveu:

> Hi Jon,
> 
> On Thu, 19 Jun 2025 15:26:56 -0600, Jonathan Corbet wrote:
> > Docutils emits a deprecation warning when the set_class() element method is
> > used; that warning disappears into the ether, but it also causes a crash
> > with docutils 0.19 when combined with certain versions of Sphinx.  
> 
> To be accurate, I'd rather say:
>                                                 but it also causes a crash
>   with docutils 0.19 when combined with any version of Sphinx whose
>   requirement accepts it.
> 
> > 
> > Avoid the deprecated function and just append directly to the "classes"
> > attribute like the documentation says instead.  
> 
> Nice!  This is the kind of fix I wish I could have come up with by myself.
> 
> Tested OK against debian:12's Sphinx 5.3.0, as well as Sphinx 3.4.3 of
> debian:11 and almalinux:9, Sphinx 4.2.0 of Ubuntu 22.04 and other recent
> distro Sphinx packages.
> 
> > 
> > Reported-by: Akira Yokosawa <akiyks@gmail.com>  
> 
> Closes: https://lore.kernel.org/de7bae91-3200-481f-9db2-c0dc382c91dd@gmail.com/
> 
> > Fixes: d6d1df92c25f ("docs: automarkup: Mark up undocumented entities too")
> > Signed-off-by: Jonathan Corbet <corbet@lwn.net>  
> 
> Tested-by: Akira Yokosawa <akiyks@gmail.com>

I didn't test it yet, but yesterday I wrote a script which allows us to test
for Sphinx version breakages on multiple versions in one go.

Using it (and again before this patch, but after my parser-yaml series), I 
noticed that 6.0.1 with "-jauto" with those packages:

alabaster==0.7.13
babel==2.17.0
certifi==2025.6.15
charset-normalizer==3.4.2
docutils==0.18.1
idna==3.10
imagesize==1.4.1
importlib_metadata==8.7.0
Jinja2==3.1.2
MarkupSafe==2.0.0
packaging==25.0
Pygments==2.19.1
PyYAML==5.3.1
requests==2.32.4
snowballstemmer==3.0.1
Sphinx==6.0.1
sphinxcontrib-applehelp==1.0.4
sphinxcontrib-devhelp==1.0.2
sphinxcontrib-htmlhelp==2.0.1
sphinxcontrib-jsmath==1.0.1
sphinxcontrib-qthelp==1.0.3
sphinxcontrib-serializinghtml==1.1.5
urllib3==2.4.0
zipp==3.23.0

is crashing. It sounds to me that the issue is internal to Sphinx, as it
runs well with -j1. One possible solution would be to modify:

	Documentation/sphinx/parallel-wrapper.sh

To force "-j1" if Sphinx version is 6.0.1 (and probably 6.0).

---

Jon,

If you prefer, 
Maybe you could run the test script before, to check if no regressions
happened with other versions.

I'll prepare a new version of my patch series today placing the check
script at the beginning.

Regards,
Mauro

> 
> > ---
> > TODO for the future: figure out where the warning is going
> >
> >  Documentation/sphinx/automarkup.py | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/Documentation/sphinx/automarkup.py b/Documentation/sphinx/automarkup.py
> > index e67eb8e19c22..563033f764bb 100644
> > --- a/Documentation/sphinx/automarkup.py
> > +++ b/Documentation/sphinx/automarkup.py
> > @@ -240,7 +240,7 @@ def add_and_resolve_xref(app, docname, domain, reftype, target, contnode=None):
> >      # mark it as a broken xref
> >      #
> >      if contnode:
> > -        contnode.set_class("broken_xref")
> > +        contnode['classes'].append("broken_xref")

Just in case, I would change it to:

	if 'classes' in countnode:
		contnode['classes'].append("broken_xref")

just to avoid eventual surprises.

Regards,
Mauro
