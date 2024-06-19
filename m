Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48AA37E56C
	for <linux-doc@vger.kernel.org>; Wed, 19 Jun 2024 09:08:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718788125; cv=none; b=cbNukuS42CQFEHPXITITam1n5ojXn2bNxFQfODli2YtAie1ZtipKQvGKMNzMHm0NhiF/+hWhE+y7y2wg8J+3xbpEfHMrBKwJAficI8hv28z3K6Fe0qJmiapF/pd2uOTqnQAQvsPTCfpZ3IOE004yVtNnzgoOUcX/ocYidm+DugQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718788125; c=relaxed/simple;
	bh=l5ExirGQyRAtIOk0NhDOS9E3Rwzt/v5G6frBd1Eto7s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=vDsaymf5bWc3W0Jch5aNMb6MBjM+JiDp3UHqUHHdvug9W2l8d6iqbSNjRWllE0xe0X0dcPUn/+iJJX87HQoenmG6EUqT3zNUq0X2f7WLa2S7w7YB0urZLz9Yq838qnMHrWiBqtWofIMDc9HsdEhsMq5qQvanW15YjRhQzddhHik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=YxUESXmH; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YxUESXmH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1718788121;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=H6etdIHf+vLceRRGRQM9DwQ8BkpeTzkHdW5ywbuRdZ8=;
	b=YxUESXmHoEKmvjteEhnW1RQ0Ii71b5H9qCKXN9LLlZUUFvnP6OoHo88kJYaLLVt87FJJA7
	6+lOklSuX1Kfy8Y73Ocv4eYhKBpd8H0BGtzE9qEwAbQ9PiEUMvs6ITqGNPFjyWhGY7x+Dw
	8yR/ihi71uBdvA6pFxW4hT8iz2eZ4BQ=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-633-LV-72_0SOpqP1jE0C8gisg-1; Wed, 19 Jun 2024 05:08:39 -0400
X-MC-Unique: LV-72_0SOpqP1jE0C8gisg-1
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4247047e74aso15850265e9.3
        for <linux-doc@vger.kernel.org>; Wed, 19 Jun 2024 02:08:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718788119; x=1719392919;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H6etdIHf+vLceRRGRQM9DwQ8BkpeTzkHdW5ywbuRdZ8=;
        b=o0k4NAKBCQfK3ivIQAiwIychWKMBKpVQij+R6Zxtw9gZF3cSMovwmZLMZkcXmcXcRG
         B7XYumjiNz3NOA/67mn5VmxpTV2qgyZejYbrxu1b1mOZsLkNFeU5yLneitDLYbkzFWB+
         G/fjGQDXpV3A7luOCl4vzCiCU+sY0u0deIX/y/yLpCcrI39VfjDlInkwCOifsGSS3nqE
         yP3YcPxlcZo63OrlTmdCaM3C3IyJ2/dZ2xxVmr3NS9Pc/Qg3QrrGC7OsuieV152ter9M
         +QPqhHZw2olxCEew+MGQVyEUNIps4FHo0+B5713olJTaY1uO6rxSXhZo5j0VKamPnEr1
         PBsw==
X-Forwarded-Encrypted: i=1; AJvYcCWKjRNqSYcF+IUnUPeclaDuBtjOPUWQ2dNVWfPN1YVVHfSUhZ0pDZ/DG/SrBBHyQPdac05z1ANpbaFdDUr9IV7D/lhPX9eA76wH
X-Gm-Message-State: AOJu0Yx0Ic/6V2TlneDlRjC0RLu0DCPshHxu4/OE13VV3BeNWHgBmwH0
	QSfb2BkQDXeSW1IcttqjTOYTr8l70yvIsA2MC3fceccOLh4+eBqvuANawH3RJbZW7H7gxWQduwA
	9ZQd6mjEa+Cjmg3J8uhDSz3Lk78qRIymEvq50iIaEcEmmAi3iKy8U82ewCg==
X-Received: by 2002:a05:600c:214c:b0:422:683b:df31 with SMTP id 5b1f17b1804b1-424750796a4mr16406225e9.7.1718788118663;
        Wed, 19 Jun 2024 02:08:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEDmHDeUKSzvwFZloG+Wasg47pkCbBVp7dtO2iM2/FT/vYQ18GUuBHQi2kxayKUmsy2s8xgdg==
X-Received: by 2002:a05:600c:214c:b0:422:683b:df31 with SMTP id 5b1f17b1804b1-424750796a4mr16405765e9.7.1718788117895;
        Wed, 19 Jun 2024 02:08:37 -0700 (PDT)
Received: from redhat.com ([2.52.146.100])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-422870e9681sm260339195e9.28.2024.06.19.02.08.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jun 2024 02:08:37 -0700 (PDT)
Date: Wed, 19 Jun 2024 05:08:32 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Carlos Bilbao <carlos.bilbao.osdev@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	workflows@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
	ksummit@lists.linux.dev
Subject: Re: [PATCH 2/2] Documentation: best practices for using Link trailers
Message-ID: <20240619050715-mutt-send-email-mst@kernel.org>
References: <20240618-docs-patch-msgid-link-v1-0-30555f3f5ad4@linuxfoundation.org>
 <20240618-docs-patch-msgid-link-v1-2-30555f3f5ad4@linuxfoundation.org>
 <87r0ctfh93.fsf@intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87r0ctfh93.fsf@intel.com>

On Wed, Jun 19, 2024 at 11:50:48AM +0300, Jani Nikula wrote:
> On Tue, 18 Jun 2024, Konstantin Ryabitsev <konstantin@linuxfoundation.org> wrote:
> > Based on multiple conversations, most recently on the ksummit mailing
> > list [1], add some best practices for using the Link trailer, such as:
> >
> > - how to use markdown-like bracketed numbers in the commit message to
> > indicate the corresponding link
> > - when to use lore.kernel.org vs patch.msgid.link domains
> >
> > Cc: ksummit@lists.linux.dev
> > Link: https://lore.kernel.org/20240617-arboreal-industrious-hedgehog-5b84ae@meerkat # [1]
> > Signed-off-by: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
> > ---
> >  Documentation/process/maintainer-tip.rst | 24 ++++++++++++++++++------
> >  1 file changed, 18 insertions(+), 6 deletions(-)
> >
> > diff --git a/Documentation/process/maintainer-tip.rst b/Documentation/process/maintainer-tip.rst
> > index 64739968afa6..57ffa553c21e 100644
> > --- a/Documentation/process/maintainer-tip.rst
> > +++ b/Documentation/process/maintainer-tip.rst
> > @@ -375,14 +375,26 @@ following tag ordering scheme:
> >     For referring to an email on LKML or other kernel mailing lists,
> >     please use the lore.kernel.org redirector URL::
> >  
> > -     https://lore.kernel.org/r/email-message@id
> > +     Link: https://lore.kernel.org/email-message@id
> >  
> > -   The kernel.org redirector is considered a stable URL, unlike other email
> > -   archives.
> > +   This URL should be used when referring to relevant mailing list
> > +   resources, related patch sets, or other notable discussion threads.
> > +   A convenient way to associate Link trailers with the accompanying
> > +   message is to use markdown-like bracketed notation, for example::
> >  
> > -   Maintainers will add a Link tag referencing the email of the patch
> > -   submission when they apply a patch to the tip tree. This tag is useful
> > -   for later reference and is also used for commit notifications.
> > +     A similar approach was attempted before as part of a different
> > +     effort [1], but the initial implementation caused too many
> > +     regressions [2], so it was backed out and reimplemented.
> > +
> > +     Link: https://lore.kernel.org/some-msgid@here # [1]
> > +     Link: https://bugzilla.example.org/bug/12345  # [2]
> > +
> > +   When using the ``Link:`` trailer to indicate the provenance of the
> > +   patch, you should use the dedicated ``patch.msgid.link`` domain. This
> > +   makes it possible for automated tooling to establish which link leads
> > +   to the original patch submission. For example::
> 
> Mostly highlighting my own ignorance here, but s/provenance/origin/
> would've felt more obvious to me, as a non-native speaker.
> 
> BR,
> Jani.

Or even "origin (message id)" to be very explicit.






> 
> > +
> > +     Link: https://patch.msgid.link/patch-source-msgid@here
> >  
> >  Please do not use combined tags, e.g. ``Reported-and-tested-by``, as
> >  they just complicate automated extraction of tags.
> 
> -- 
> Jani Nikula, Intel

