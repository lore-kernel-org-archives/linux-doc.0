Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 486741A01B0
	for <linux-doc@vger.kernel.org>; Wed,  5 Mar 2025 21:28:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741210135; cv=none; b=G66B8ewpiE3uV6TU6rhM4FkdBfjyObjR+Nx0XGVBd6CoRI0J484JhQXDUjGT4EPearcC7Rabd1bbethxnsQvD5sq8O3m1avCIC/fIrmo8obbffWamzOHul+FwWAOXux1S7U8qiHKgu6/TX3lvxhHKDNAZsH3vWAFwUUS19JSjoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741210135; c=relaxed/simple;
	bh=vw+RYZBYjodU3jVO5MVuSqUFtZUKoNwnBrKTNAcViMA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YQW0EsGBAu9xVV8D988GAOiHWwaDfOjw4ZX07Bg+U+FxIoSNoVPDcTm2jmo8sxndKHgxoUE38xTgm9sTHwS8JdkJciCDjfL3/dfj9NPucDjnN8OQYGb6AIs08EC5vLkqwUPUc2GcVdjMcGoeULfxOsdf5E8HM2recmaqg2QhL20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hMrQeEr8; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hMrQeEr8"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-54965898051so3927707e87.2
        for <linux-doc@vger.kernel.org>; Wed, 05 Mar 2025 13:28:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741210131; x=1741814931; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qgnK/dsQDqVevTIS+vzAayMgUb2QQS8JA32FshFegrE=;
        b=hMrQeEr8b0IXNV7r0Jg2mALtdafZqGQrGwkex3CPykNp58tpRexLR8ROmkwmCO+wu/
         blymSfF5UJNsF+Iwl6kNE0lIff7e1nCH/NzDELj3za/1XfnwCKXWmlS2z70VmCPB//EW
         dbkzAmLwgKQsnR9vx2NA1vl9ziR4jm2Cd+R5pOplZylIr2RXOqoKVGb9yw5+hO3oL3L4
         FIiZsjUBkEVT+xrkmnePmOD+P9/95urfiZx9krQd19rDBIACpuZdIaYsv1TFCLNqRkmM
         EPG0roE/TolaA/+MlGcGX6w4n2J0tRErKGxXHMmnZeUs966HntgYLCwogujd4W2mP9jr
         6AfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741210131; x=1741814931;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qgnK/dsQDqVevTIS+vzAayMgUb2QQS8JA32FshFegrE=;
        b=F5rvaDE9jIKA/T+HJpxm0MkGImdU3PlGs9fO85aI3Js6ydnIda3TbfBG2Gzn032qSr
         4ZzmqxPX3Qu3uht6TFNTuVpfBQC7bZoAb81mchGfD2GtoFVoUPqwBmSS9hHg+eR9JWm7
         pA3lGHexG3/dTLOlf++ZkPL/uBbNql1FuUDN0TRdhJvXfgnmNDQU5wS5qRhyUxnG6Ehy
         XX9UAqnXWk1Wf24I221qQiVnh8c4myhrDQ7/ke61KlSNRJghUp3kDoi2735/KHqQlXEI
         zW9cPS4rWV5doC3hDuxeD10MeuEeOxMC/2o0qrKl5VxmcRMAnTJN1gzJuZX3znmOl5cR
         edfg==
X-Forwarded-Encrypted: i=1; AJvYcCUl8903nAN7MbQYXoobkW0589iID1KJYyU5/ELJdYgnZjUEpuWxZSby+K7K0VJ+wEOdMUDOzJMtiVY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzLROyRRonu2rznoiTldGwGOM8eK/4iZKE0Jt0AUJZjTtFHXD4a
	uc1IocRR/X7AUmq6wHt+00M9Le9zNFHpCqynFK4upjlgCBmWCwcFDMlHLj1Zw9I=
X-Gm-Gg: ASbGncs5sdxkYcHb1oZW/8WwFRVW5rpNMwcdsTVFdsE5tW9LHk+AKpcj+SdsqYOhJ5/
	vuMrEosq1vayVsTF5z1hLu4AZCOgbv7JUxCp4Oo5y9bArZ6H1pqJaszw0Vyjk5w0vkFSgkZQX4h
	0PZW/VsOT8zNfkgoWX5ZaUntxuZDt2MJzyZeKObgOw98w9AoiWMT5CKwIPp9EUiX/e20eTl1aCB
	Js9oJxgQYDksaKMBXOdxPiavHLGm8BzEl71wYTlyU9+OtuXUgAl0xsrND3BDXnAMvgsyLI8sePG
	s9u0Slh/sL2z+H8eqp009uP3Mw8SCKA0EWP/5Gx/5UDnmFyQeJBQVZ4fF0aNEniBqIvg7uY1aVM
	+zUvWu6f9s5N3W3mxxqSWiSil
X-Google-Smtp-Source: AGHT+IH2qGb5qPmpNY2+Tt7o5llhv1gkGQNprrWhdZNfFd33pV50IdQ/Kc8ny7RCAvA4GDgOXB71KQ==
X-Received: by 2002:a05:6512:b20:b0:545:fba:8a57 with SMTP id 2adb3069b0e04-5497d32f412mr1645346e87.8.1741210131261;
        Wed, 05 Mar 2025 13:28:51 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54957fe5d00sm1467587e87.154.2025.03.05.13.28.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 13:28:49 -0800 (PST)
Date: Wed, 5 Mar 2025 23:28:47 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Anusha Srivatsa <asrivats@redhat.com>
Cc: Doug Anderson <dianders@chromium.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <quic_jesszhan@quicinc.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Joel Selvaraj <jo@jsfamily.in>, Ondrej Jirman <megi@xff.cz>, 
	Javier Martinez Canillas <javierm@redhat.com>, Artur Weber <aweber.kernel@gmail.com>, 
	Jianhua Lu <lujianhua000@gmail.com>, Jonathan Corbet <corbet@lwn.net>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	Tejas Vipin <tejasvipin76@gmail.com>
Subject: Re: [PATCH 00/14] drm/panel: Transition away from using
 mipi_dsi_*_write_seq()
Message-ID: <bifqi2pn4cmefj5sxt26n7xc3kpn4rwaajgxcyv6aujlgpx3dt@tjfignye446u>
References: <20250206-mipi-cocci-v1-0-4ff0c69e8897@redhat.com>
 <CAD=FV=WkPefg00R_TAQQA6waRqGdD+3e84JXfPLk2i9BRzW6Yg@mail.gmail.com>
 <CAN9Xe3S6u1hjp0YifoFC4N9t6Ek3+ZZQPPbL529Y1_+AvnPNLg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAN9Xe3S6u1hjp0YifoFC4N9t6Ek3+ZZQPPbL529Y1_+AvnPNLg@mail.gmail.com>

On Wed, Mar 05, 2025 at 12:29:06PM -0500, Anusha Srivatsa wrote:
> On Sat, Feb 8, 2025 at 3:43 PM Doug Anderson <dianders@chromium.org> wrote:
> 
> > Hi,
> >
> > On Thu, Feb 6, 2025 at 1:06 PM Anusha Srivatsa <asrivats@redhat.com>
> > wrote:
> > >
> > > Transition away from mipi_dsi_generic_write_seq() and
> > > mipi_dsi_dcs_write_seq() to mipi_dsi_generic_write_seq_multi()
> > > and mipi_dsi_dcs_write_seq_multi() respectively.
> > >
> > > This is addressing one of the gpu todo items [1]
> > >
> > > Used Coccinelle to make the code changes.
> >
> > As Dmitry mentioned [1], I think a real cleanup needs more thought
> > than can be done in a Coccinelle script. Maybe you can make a script
> > that's super fancy and does a perfect conversion, but I sorta doubt it
> > in this case.
> >
> > A few other note:
> >
> > * Tejas Vipin has been slowly whittling down this TODO item. It would
> > be good to CC him on any attempts to avoid duplicating work. He just
> > submitted a patch [2] that duplicates one of the panels you ran your
> > script on. It would also be good to look at the patches he has been
> > posting to see some of the extra complexities.
> >
> > * I'm happy you CCed on the cover letter, but given that I've been
> > helping with this TODO entry it would have been nice to have been CCed
> > on all the patches.
> >
> > For now I'm not going to review the individual patches in this series.
> > If there are any where you think your Coccinelle script really got
> > everything adjusted perfectly then feel free to point them out and
> > I'll review them. If you want to help with this effort, my own
> > personal preference would be to at least start w/ one panel at a time
> > since probably review feedback on all the conversions will be similar.
> >
> > Thanks!
> >
> >
> I thought I had replied to this  :( (face-palm) sincere apologies. Luckily
> I bumped into this today.  Thanks for the feedback. I agree with what you
> said. While the script catches the patterns , a little of manual conversion
> and proof checking is needed. I am taking this into account while I spin
> the next version. WIll CC everyone in individual patches who have taken
> their time to take a look at my clearly incomplete approach to this
> redesign.

- Please post them one by one rather than the whole series
- As you are looking into the same set of items as Tejas has been
  working on, please make sure to discuss the order, so that you don't
  do the same job twice.

> 
> Again, thanks Dough
> 
> Anusha
> 
> > -Doug
> >
> > [1]
> > https://lore.kernel.org/r/mz6usiheb2lx6wlk47z3btvf6t6kbo4ja4n6mli5hosrpcvdwp@wmvfvhaqhpkm
> > [2]
> > http://lore.kernel.org/r/20250208051541.176667-1-tejasvipin76@gmail.com
> >
> >

-- 
With best wishes
Dmitry
