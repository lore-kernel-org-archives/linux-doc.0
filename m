Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FB6D243946
	for <linux-doc@vger.kernel.org>; Sat,  8 Feb 2025 20:38:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739047082; cv=none; b=bOdLSse5AAPGS0vFf5frqIVqEu9GUlew+gVPrrCoRkaLNl+QQoZeqoaNlgG9G/eHTX7Bqjlkdf8pzB/1divOYfLVZS8SE/nyYkmhCdRff/cL/ViG0I5t1RYkLBkEyV2gi+ZnppeznWMZAjvC30HBahdWdpzqi8DVhcrw05neAo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739047082; c=relaxed/simple;
	bh=aLXDtqwkQRLpryu9rC+CUz7k+xX8tB/DDrhNDrtPAJE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kPxG0W8m9iy8kXujmYRixr4IbeoSqBp2c7rMNcF0inQU/2Y/3WxEAA2bv4mo5Wgx4j7cH9NtkGIx/qJNqgsCcU/PkY/+FpI0AY029C7kgREkibxUhYohi/bH/Rgyj3VJenTn7Uetq/BNALRGdMTdiENbFqxzmlwW+71IHYNiF3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=IbAbY/ya; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="IbAbY/ya"
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-3061f1e534bso30560231fa.1
        for <linux-doc@vger.kernel.org>; Sat, 08 Feb 2025 12:38:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1739047077; x=1739651877; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aLXDtqwkQRLpryu9rC+CUz7k+xX8tB/DDrhNDrtPAJE=;
        b=IbAbY/ya4lJmP+GkqIpf5UMICb1r/JEAxP3yZM/0ory3GPOxHUi5T8O1Eyo+lIOTHz
         9nRvfLFZkJo9do0oUvpnrlQeXC7jqqBCcM6GYzKmPgavfQDCEGCDtmE6N6D11+9yl5qM
         mn6nT3odf9vgYV9HCciEviMgHhw1Wv7sp3tzU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739047077; x=1739651877;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aLXDtqwkQRLpryu9rC+CUz7k+xX8tB/DDrhNDrtPAJE=;
        b=oUxgj2m2KZhX/CrDxAE1O5GjkbTjS/Nef35js2fsFpvSAnlKRnhtl/wSZHNpgr3S2+
         Y1Cltl7wd84zP5qW3kkWsnCDxvZSzqL1FHx0Wh4WYHy/KfmRKZW08UoCxZwYNq8/H7co
         9RDdLx5wFNUUtSxfyKAVA2HlGFMRYZQGRpLqi8imNOojqm3t4eIH0zKV77WTL7Ym7iLC
         VQo+BMDeuORirKGSckRlWEyWSTYV1h0T+j9s/dNWsa0X35syueO4ZZ3qGEN2VdGDE3QL
         itapn73gg5IgSSkW9EknXfshlMvU4xRhr4L68xjoZpGb1cwEpsj93bII9RUFibw4c4Qm
         mN4w==
X-Forwarded-Encrypted: i=1; AJvYcCU0XilO9sUZEZPtMzUp5iuWrnzRKppOAeH6oXaHyQfFoM/XgkqHrEUhWvLSWS2wpRA/XdHa2R5pkdo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwwAjT50RqLRqm+x4uYJWwXUwaDkpxGqs/I4/587NFsyNqsxc3V
	I9fDmYIDmrD7yMdroT3HoIT5NHGEF8B6MHnOd+fLNP/L7yrQWVbRWMXPSeQ2UOmXxxUwsGRSBIZ
	okibb
X-Gm-Gg: ASbGnct2TLwVmAMeL2rF91u+sMrBVgrO6vQjw3XN2HlSmG2usIG6q7kFyql92bWGZn2
	7HnWsfvRgglA3Zcl3eiW57SYqxR0ZueNeJirBu+Bqi6j9V9g11w26tZyfIaXIatMDpOBWrFiFfh
	4DSEBzdhL0d1xtWb2KnhyCOSGaUPHLA00E4n4rl2O8botXgHQVLquJFTiA5MWGMlbw8X6JzfUa7
	tshVUHsESBwuxSl3aQv1Godr6Zof+MqQS5Wu0bEbqDoSUWmCKUZC66ZSEjc2Q+ivYUdgG1pGmi5
	Jx9JTgpeavDx9cuJd913ro5mqrzYqG7ZXLxCkoKtdvakdUxe+wXN5sG0Uwo=
X-Google-Smtp-Source: AGHT+IFmeNWAH6frpiC12B/YJzcBf8Ql6poYP/WqU2JS5pe2dqMdepmMiHz8vRbvfj8HZB/Nd4Z5Mg==
X-Received: by 2002:a2e:a803:0:b0:2ff:c027:cf5c with SMTP id 38308e7fff4ca-307e580fd53mr25368001fa.16.1739047077401;
        Sat, 08 Feb 2025 12:37:57 -0800 (PST)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com. [209.85.208.174])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-307de2dbdbasm7683281fa.96.2025.02.08.12.37.56
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 08 Feb 2025 12:37:56 -0800 (PST)
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-3061f1e534bso30560011fa.1
        for <linux-doc@vger.kernel.org>; Sat, 08 Feb 2025 12:37:56 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXGfJhQxUrWhEZS1AEv/476MkpQ1XcCEmTMYutiQLdObs/GUQPrR2X4cLmoptGBgXAZKhDRJMm+BMY=@vger.kernel.org
X-Received: by 2002:a2e:9f47:0:b0:308:e803:118e with SMTP id
 38308e7fff4ca-308e80314f1mr1813521fa.0.1739047076046; Sat, 08 Feb 2025
 12:37:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250206-mipi-cocci-v1-0-4ff0c69e8897@redhat.com>
In-Reply-To: <20250206-mipi-cocci-v1-0-4ff0c69e8897@redhat.com>
From: Doug Anderson <dianders@chromium.org>
Date: Sat, 8 Feb 2025 12:37:43 -0800
X-Gmail-Original-Message-ID: <CAD=FV=WkPefg00R_TAQQA6waRqGdD+3e84JXfPLk2i9BRzW6Yg@mail.gmail.com>
X-Gm-Features: AWEUYZmtp_A3cX_L46ivt1I8hAClJ-sovMP_5NAQXDAfEvF1gvbHGKAwEokNtOY
Message-ID: <CAD=FV=WkPefg00R_TAQQA6waRqGdD+3e84JXfPLk2i9BRzW6Yg@mail.gmail.com>
Subject: Re: [PATCH 00/14] drm/panel: Transition away from using mipi_dsi_*_write_seq()
To: Anusha Srivatsa <asrivats@redhat.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <quic_jesszhan@quicinc.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Joel Selvaraj <jo@jsfamily.in>, Ondrej Jirman <megi@xff.cz>, 
	Javier Martinez Canillas <javierm@redhat.com>, Artur Weber <aweber.kernel@gmail.com>, 
	Jianhua Lu <lujianhua000@gmail.com>, Jonathan Corbet <corbet@lwn.net>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	Tejas Vipin <tejasvipin76@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Feb 6, 2025 at 1:06=E2=80=AFPM Anusha Srivatsa <asrivats@redhat.com=
> wrote:
>
> Transition away from mipi_dsi_generic_write_seq() and
> mipi_dsi_dcs_write_seq() to mipi_dsi_generic_write_seq_multi()
> and mipi_dsi_dcs_write_seq_multi() respectively.
>
> This is addressing one of the gpu todo items [1]
>
> Used Coccinelle to make the code changes.

As Dmitry mentioned [1], I think a real cleanup needs more thought
than can be done in a Coccinelle script. Maybe you can make a script
that's super fancy and does a perfect conversion, but I sorta doubt it
in this case.

A few other note:

* Tejas Vipin has been slowly whittling down this TODO item. It would
be good to CC him on any attempts to avoid duplicating work. He just
submitted a patch [2] that duplicates one of the panels you ran your
script on. It would also be good to look at the patches he has been
posting to see some of the extra complexities.

* I'm happy you CCed on the cover letter, but given that I've been
helping with this TODO entry it would have been nice to have been CCed
on all the patches.

For now I'm not going to review the individual patches in this series.
If there are any where you think your Coccinelle script really got
everything adjusted perfectly then feel free to point them out and
I'll review them. If you want to help with this effort, my own
personal preference would be to at least start w/ one panel at a time
since probably review feedback on all the conversions will be similar.

Thanks!

-Doug

[1] https://lore.kernel.org/r/mz6usiheb2lx6wlk47z3btvf6t6kbo4ja4n6mli5hosrp=
cvdwp@wmvfvhaqhpkm
[2] http://lore.kernel.org/r/20250208051541.176667-1-tejasvipin76@gmail.com
