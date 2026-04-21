Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD7083DD532
	for <linux-doc@vger.kernel.org>; Tue, 21 Apr 2026 20:05:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.129.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776801960; cv=pass; b=CpqaI3KxxjaWx6ft2DpsnT1ebbojYCNrXn4oMHWB2B06e8sw7xYbqh17QSMDtZhKVZVo1bukLgrwG8GMTvI18SXFerOCdyi9PINYtZnwt9PO0Xr6DKEJ83nEyQkqyJ6nIbnrJCo0DOOOFr05fPafD19GziMFJycR5O5lM9y4bRk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776801960; c=relaxed/simple;
	bh=Y1PLoj4e8iOjKgpTO1Z2p5qecvDaS7epvI5R7dinmlE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WQbjKnXV35XuIfoHpxuG4+2nocx/igihyiR3sRpmMsL0oWQeberAmPG8wnDy6UuslZI1lzDZJ4i9LPzmSKK7z7JFKSdE+zWSdJ6caZpLRdtsVh2iTU9ibxeZEPFCGbC4uo0MrRbu5M3nbAD3aNKxA8MQ9wmvKfevQIsl2wVgFKE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bK70RxBA; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=boWnkarr; arc=pass smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bK70RxBA";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="boWnkarr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1776801956;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XeHr6DVVipYM8wZRZ3joTJjeppE08pl393d8VJrbaO8=;
	b=bK70RxBAjBkXkA/jCCxLxAxUcUlK/cU1o8zYiiDVRJwdYgSHOdBB96Ocpuz6fIFNNZBarG
	8Wd1MX+3Ecpqhp1HIOo/bosx8gq1yxxpoAGZ1jaXxQtxZ3GmbjMIAt3H25TgrmE3cn+kZg
	H8p/1DlVS00p20rrF/LCdIkww9ZeQbE=
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com
 [74.125.82.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-365-uvRv8BuhOXmc1TJzLl3tdQ-1; Tue, 21 Apr 2026 16:05:54 -0400
X-MC-Unique: uvRv8BuhOXmc1TJzLl3tdQ-1
X-Mimecast-MFC-AGG-ID: uvRv8BuhOXmc1TJzLl3tdQ_1776801953
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-1273dfdaf5dso4070418c88.0
        for <linux-doc@vger.kernel.org>; Tue, 21 Apr 2026 13:05:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776801953; cv=none;
        d=google.com; s=arc-20240605;
        b=ZRkSfGxobSQZYDuXSiSqB0nssXKwxs+AF7+kzj2RF+FJBKjHdQ7XLp4bTXDufSy55l
         Np9fsjQSOZiZ88DvTlY/xSUdzPstpMSF5ukanNXbzTU31JdHoqDaFp5M1fk24tkHDkdt
         KdDZE1Sr/fBE14YyBxQxcRKf12Riz3WQNZLICSgZlS4uChq50NvmJLh32fhDMzNhlVw+
         tX5gsEcivO+JwhEvYkBKq4BeBw0UAjbIz9JMTHj9N6JaJpHBj9PfA0SPRnjPmzH48RQD
         xVt79GhvLqUiYEV5Wo1jshKwF5GCqPZNts07Dnuqj6FNszUqJ0K/MqDJtOov9x95uv3u
         ur0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=XeHr6DVVipYM8wZRZ3joTJjeppE08pl393d8VJrbaO8=;
        fh=xogMo72ryIJWFzVFz7jZxhVY224oN15AXyhFse8atzI=;
        b=D2C4vokkZDoLALvlSVIqseci9KbJ6LTVXS4TNB1QG9+iEeTq3GOpDQGPZ342jvpt8k
         oSg7ypqbepwH+UpTtekAt6MvE6Ox7j+1pprvlhj+7pHUJ8WapsGQlQDgDOceKsLm3JP9
         FneNDXvsi6FL2M31JR9FUIEMITz1j9MMPrqYYzj6GCRiOu8pYlWs5R75MQdqNEXyvKUs
         XUULfcEhJfm4Fo1cnmMP6ZzM7TpYr3CP2StxsIzeXMjc9MGIwG/EM/vIKGvmeVEvAZjf
         vVFcFkEjOLxNfNTBYPMtU4BMQc7KfTyl9jaOGvaxxu9Ba0s8+9lLIEpbPZ7rb8VZkvXR
         42vA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1776801953; x=1777406753; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XeHr6DVVipYM8wZRZ3joTJjeppE08pl393d8VJrbaO8=;
        b=boWnkarrESPOMUmMVm98ZwQtxNh3XEyMkTo4+uWXgH1b9pDbBhXhwryrKU9vJQOw83
         uYfSGYeHoKTehsV88BEidvfZ71tdHgjnCJhVQXRHSvn4oSQTOKO9iASj2v/RnnJ3Y35K
         YCPwccoLsjdEYMHOkrgm5ttEMDlXMmyBJ2Dv9EbJzfGKn6hZmy+S5won9tmHl7lq5wnP
         IVoSwaRiMxM4zNeqFbMRCxZqEmHp1QmJ6QRmmXC95tlBWtKPQGBZ+vQJhanFwXRIyC9w
         E6mrdgHVE2250+XKfvAwHJnrmhIXdc5WdM0UiLT0D8No8YlL7k/uFneXmXZL8FRXLeml
         +kxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776801953; x=1777406753;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XeHr6DVVipYM8wZRZ3joTJjeppE08pl393d8VJrbaO8=;
        b=M+aeM2RE7ILzZpNl6O+PziONIM+E7b3t9ZLaCoCT4WJ6QUK98TIDCuNTghPmaSmtBS
         QE3KJVoxwsv0X9vNp5+gStL3ihMkOlYfFnH6sMm2Ph0vWev2QSuhk4W1APeGhiwtMsSg
         ofK0Dkl6JED+3aFsuU2ayt4WMIAaIsonUpeQ/b5jz70eYCmlMH6pZcq+RyyiM3q9Hz1M
         pAy2tdHU/7GxrS6RHlqHiPvn7h8HIfATA0b5y3XwpJ3NsX8IXIUAe4CZM/JKrB6cJuRk
         xRqzVJEoCPS4qqLACeFW8jhdH30vPIiZx5rjRAX/bsuXxXK7Z7QWWU3IxuoQi+wyrumx
         +LiQ==
X-Forwarded-Encrypted: i=1; AFNElJ8IrzS4evPF62upK2BeVQEHu32iNHfO3sYFJSxCEtGwTjvz46Ab3khe76qgxPY4pUYyEfUDKiu28Hk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyE+QYva7KfyUfBtMY2kXL78WG8+t+n3kMPrnTk5H58Krvn/PF4
	KGQUBjK4CniVOcvPcpfnJtqb2KwogP9SF8lXX7MikCUdbTHy8GjhSyqBlatT1FLd2rQZbMYtHsb
	v/2XguYNsHBUFItzdCIesGRPSSB8mK9TBOfEe6WhFBeI8/UiTvyj5USjhHVmF/TsBPqB/PM50W3
	Qz0eZhXBQ2qiwdCwlZH2HPgyye7dv6GXajmz4H
X-Gm-Gg: AeBDiesTieJ3tJpAzJgfbgTIES7injG0mf68Nwyr/+ZMpBQ6/UnxPPgcrzJ9HyVBPaH
	iaq4tLYWsp6qNgBkTgAWvXuJ2/DY74P5T5oRU8z07hG+tzJQ5YoR+Xr/vttSld9jkznimCaO7NK
	xGmlC2BXR3lFS6s5KAYCNgCHsI+wukHePJcDRmDwBKbtCNChQWBumhdXgXdoDYDj+5dQvU9QbLh
	2GugH5YrxRQWgiZWKrIUUnuGK57iFGlgzHUfX6jDc0eCb4=
X-Received: by 2002:a05:7022:e985:b0:12d:b2ca:a9e9 with SMTP id a92af1059eb24-12db2caab80mr2009976c88.8.1776801952717;
        Tue, 21 Apr 2026 13:05:52 -0700 (PDT)
X-Received: by 2002:a05:7022:e985:b0:12d:b2ca:a9e9 with SMTP id
 a92af1059eb24-12db2caab80mr2009922c88.8.1776801952185; Tue, 21 Apr 2026
 13:05:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260415210548.3776595-1-joelagnelf@nvidia.com>
 <20260415210548.3776595-2-joelagnelf@nvidia.com> <b0c5267d-ea77-41c5-94d4-39c651761b3c@nvidia.com>
 <20260421145521.GA51176@joelbox2>
In-Reply-To: <20260421145521.GA51176@joelbox2>
From: David Airlie <airlied@redhat.com>
Date: Wed, 22 Apr 2026 06:05:41 +1000
X-Gm-Features: AQROBzAsZiSzIuFbaTfYEhScUqQNnqcYEoqTT_Ur4O9PkcMB0Af7pJH5n1PBSF4
Message-ID: <CAMwc25o2qmaYnfsh-cW4M4PEbmpYb_1x4qg1_2155P0orzCnOQ@mail.gmail.com>
Subject: Re: [PATCH v11 02/20] gpu: nova-core: gsp: Extract usable FB region
 from GSP
To: Joel Fernandes <joelagnelf@nvidia.com>
Cc: John Hubbard <jhubbard@nvidia.com>, linux-kernel@vger.kernel.org, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	Bjorn Roy Baron <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Koen Koning <koen.koning@linux.intel.com>, 
	dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
	Nikola Djukic <ndjukic@nvidia.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Jonathan Corbet <corbet@lwn.net>, 
	Alex Deucher <alexander.deucher@amd.com>, Christian Koenig <christian.koenig@amd.com>, 
	Jani Nikula <jani.nikula@linux.intel.com>, 
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, 
	Tvrtko Ursulin <tursulin@ursulin.net>, Huang Rui <ray.huang@amd.com>, 
	Matthew Auld <matthew.auld@intel.com>, Lucas De Marchi <lucas.demarchi@intel.com>, 
	Thomas Hellstrom <thomas.hellstrom@linux.intel.com>, Helge Deller <deller@gmx.de>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, Edwin Peer <epeer@nvidia.com>, 
	Alexandre Courbot <acourbot@nvidia.com>, Andrea Righi <arighi@nvidia.com>, 
	Andy Ritger <aritger@nvidia.com>, Zhi Wang <zhiw@nvidia.com>, Balbir Singh <balbirs@nvidia.com>, 
	Philipp Stanner <phasta@kernel.org>, Elle Rhumsaa <elle@weathered-steel.dev>, alexeyi@nvidia.com, 
	Eliot Courtney <ecourtney@nvidia.com>, joel@joelfernandes.org, linux-doc@vger.kernel.org, 
	amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
	intel-xe@lists.freedesktop.org, linux-fbdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 22, 2026 at 12:55=E2=80=AFAM Joel Fernandes <joelagnelf@nvidia.=
com> wrote:
>
> On Thu, Apr 16, 2026 at 04:26:48PM -0700, John Hubbard wrote:
> > On 4/15/26 2:05 PM, Joel Fernandes wrote:
> > ...
> >
> > Apologies, I found one more minor thing, while looking at a
> > subsequent patch in this series:
> >
> > >  impl MessageFromGsp for GetGspStaticInfoReply {
> > >      const FUNCTION: MsgFunction =3D MsgFunction::GetGspStaticInfo;
> > >      type Message =3D GspStaticConfigInfo;
> > > -    type InitError =3D Infallible;
> > > +    type InitError =3D Error;
> > >
> > >      fn read(
> > >          msg: &Self::Message,
> > > @@ -205,6 +209,7 @@ fn read(
> > >      ) -> Result<Self, Self::InitError> {
> > >          Ok(GetGspStaticInfoReply {
> > >              gpu_name: msg.gpu_name_str(),
> > > +            usable_fb_region: msg.first_usable_fb_region().ok_or(ENO=
DEV)?,
> >
> > OK, failing out is correct here. But in addition, we should also
> > log this at dev_err!() level. This is rare, surprising, and actionable,
> > so perfect for that level of logging.
>
> Sure, that works for me. Will add it in for v12.

Just fyi when we get to spark later this will not matter, we will have
no usable_fb_region, though maybe it could just return 0s in that
case.

Dave.

