Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D7592951CA
	for <linux-doc@vger.kernel.org>; Tue, 29 Jul 2025 15:43:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753803798; cv=none; b=oEBLS1BjH08b4R6yOG4OifGlswKqs0O1byoTSRwKJAWSfLrJqsECgZ9E1WNqRH4hGSTAWmgi4W3wfqes/ip6jpL5nv6d9d0Pl8pUq0k11h0KN1meRLyCBGP6Nz4tUHuR6GZAXShMJLXMP003qI5SBaRdYh3Q6O803mV0Q5JzJHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753803798; c=relaxed/simple;
	bh=yyzHQv1Wv65hNemtjtxzhBXFqLoOaBEA9TmxWX2IOg0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AmZMx2EhCI1Zo+q8ql+W/K/ziEQbkUbnqc+NIxYGajBC7OomCU6XUIROOKjA52uepEpRjG2d9RMEcl4eQUpoPOvnXckYbJqlissbIEQj4c5HHYPYQ0GdrgkNCZpaNmEag1bo0jci4Lum347V32W5JBdOKG88e8OHG3jhOX6tDPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Zo28KwRp; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Zo28KwRp"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-31ece02ad92so2155914a91.2
        for <linux-doc@vger.kernel.org>; Tue, 29 Jul 2025 08:43:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1753803792; x=1754408592; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vSpJIgrdIeIOJjhVwTw0EcGlPuzf6kCVL4Vd0HFeqjc=;
        b=Zo28KwRpuyR2RkCvSziQ3MWriqRZpo2YR39NbaFSvBwC+FLa8bGyldowJQaO9fQe7w
         djlHxc5J9JPZBqryn4cBfp8eu+CJ1s2Yng8vWwxZGx7JQtUw92Hfv1PtVfXJt4VpUqJI
         BIPBL6oEGDNBrw0Px/vQTTE6DadVlVtIMx6GA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753803792; x=1754408592;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vSpJIgrdIeIOJjhVwTw0EcGlPuzf6kCVL4Vd0HFeqjc=;
        b=cDMb7zRDGN2nTyvzL8BKtbxbqVD77w6qJ1mlQS0vPSE6FHLBPvFMkcfJO3Z30+WZ+p
         0FdrHm55DeDs6+eokKGkJtuzBIWE1aiJX7x5LuWBLZyDHZ/EZeDH9GBIq0U8H2lkwvh1
         r9ok+luk96c+2CxuIES84Qls/XBbHtYp4YG8iKkgSF2WUygUHPl1ZORRdokhjMu1RB4X
         Zo1vkZBs+zhU6NGlJhHaYGoPwfxtlR/Yz8I44dGLZf4TrRZDAOBudf8kLvTiXa6FoqdK
         c+yqPmj4oSeUpo86s0HDgJjoe6f/zcEk4OmjLu5t8zfaK40kKH+UH0de7dqM+Z7b2lUd
         VjTg==
X-Forwarded-Encrypted: i=1; AJvYcCUJdOs+OFaldVpebD53U+2EDdGwsoQjOMYb8xa6i1cVztOle8nz5UJVID11cw1av+VMRtDzVnjfjMM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwM6N5Bn2JAaKjcuH79JiuE8Fl0/u0YBz17Xcgmd7/Ww4fiXtGh
	W9b9ZGFZBV5DpfPg/qe2RaoDYaDlikV+5PMNXppI0dgmJAZv1criDbe8geTwn3re/CXhMDKc61H
	EzT8=
X-Gm-Gg: ASbGncut8JXmdbnEX8DydSaLIonBwp41eHrv6MbuKJcrzPfT0+gXeSI93KWZ8uwdkOf
	7PBdvmtO8fRZS3goVlFU5+oCe/9qpvEOrnIQ8l/0z6fW+lrPICqAtcvFCCJlNtj/NMu1Gjkn9gv
	VF7x85Nako4CO4JsDgonzP24o7x0+87BDB6F9Y3OJ03P9Qxk4kVUl3DqjiFG5WsrO2IFnzkNaVG
	l3KxW4dQdfbYMpQB7yoF1KLJY24JICayMfrZRYZKeEgMrsE891FRfecn8pJD+z5QdfSfSK9u0k8
	Ncrev63tu1/MtPFcrBGFvXs6a66y0NPvtHmlXTUSJT8rMi9ivdAAZ780jMLkq2xYgWHkz53ql6E
	yGx0pQ78bqtcX8Udcf+32/NMZgnohjRQ5FKd3p3d+mIMt9x/tqjdLTv1Qg6AgSpmM0w==
X-Google-Smtp-Source: AGHT+IGgoFly3DKBL8x++Z4YsxT143J3+Zqw4IzeXsbDK5Th82vcYyrJxnRzL24i7t7PlwG7hYNCKw==
X-Received: by 2002:a17:90b:2683:b0:31f:42cd:6900 with SMTP id 98e67ed59e1d1-31f42cd6c5emr2571487a91.12.1753803792089;
        Tue, 29 Jul 2025 08:43:12 -0700 (PDT)
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com. [209.85.215.169])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31f07fcb58fsm4185109a91.3.2025.07.29.08.43.10
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Jul 2025 08:43:10 -0700 (PDT)
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-b170c99aa49so4219787a12.1
        for <linux-doc@vger.kernel.org>; Tue, 29 Jul 2025 08:43:10 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXS1cO/Ihhaw+8wjS+/pxi+A65zYliugh/vDYzL5GLlzdWfeculUIB43CiHkVZlitt4it4B81TYfa0=@vger.kernel.org
X-Received: by 2002:a17:90b:4e8d:b0:31f:2558:46cb with SMTP id
 98e67ed59e1d1-31f25584712mr6855560a91.16.1753803789967; Tue, 29 Jul 2025
 08:43:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250722015313.561966-1-me@brighamcampbell.com>
In-Reply-To: <20250722015313.561966-1-me@brighamcampbell.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 29 Jul 2025 08:42:58 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Vpk+sWt6n5+OFrOSa9bUf=5xbcGH6TA2D58HnDcrzArw@mail.gmail.com>
X-Gm-Features: Ac12FXy2DrlKwozrm4Lh8eKlO3PrClRoMybwweQhMtq-dXfeG8sVqMiOcJ65aGQ
Message-ID: <CAD=FV=Vpk+sWt6n5+OFrOSa9bUf=5xbcGH6TA2D58HnDcrzArw@mail.gmail.com>
Subject: Re: [PATCH v6 0/4] drm: Fix bug in panel driver, update MIPI support macros
To: Brigham Campbell <me@brighamcampbell.com>
Cc: tejasvipin76@gmail.com, diogo.ivo@tecnico.ulisboa.pt, 
	skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev, 
	dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Jul 21, 2025 at 6:53=E2=80=AFPM Brigham Campbell <me@brighamcampbel=
l.com> wrote:
>
> This series removes the unintuitive mipi_dsi_generic_write_seq() macro
> and related mipi_dsi_generic_write_chatty() method from the drm
> subsystem. This is in accordance with a TODO item from Douglas Anderson
> in the drm subsystem documentation. Tejas Vipin (among others) has
> largely spearheaded this effort up until now, converting MIPI panel
> drivers one at a time.
>
> The second patch of the series removes the last remaining references to
> mipi_dsi_generic_write_seq() in the jdi-lpm102a188a driver and updates
> the driver to use the undeprecated _multi variants of MIPI functions. It
> fixes a bug in the driver's unprepare function and cleans up duplicated
> code using the new mipi_dsi_dual* macros introduced in the first patch.
>
> changes to v6:
>  - Fix various style and kerneldoc issues in patch 1/4
>  - Fix typo mpi_dsi_dual... -> mipi_dsi_dual...
>  - Fix incorrectly named "data" and "len" variables
>  - Make _seq argument of mipi_dsi_dual_dcs_write_seq_multi macro
>    variadic
>  - Remove duplicate definition of mipi_dsi_dual_dcs_write_seq_multi
>    macro from novatek display driver
>
> changes to v5:
>  - Rework mipi_dsi_dual to explicitly not support passing macros into
>    _func and add "dual" variants of the generic and dcs write macros.
>  - Make jdi-lpm102a188a use the new
>    mipi_dsi_dual_generic_write_seq_multi macro.
>  - Make local struct variable in jdi-lpm102a188a conform to reverse
>    christmas tree order.
>
> changes to v4:
>  - Fix whitespace (I forgot to run checkpatch. Thanks for your patience
>    as I familiarize myself with the kernel development process)
>  - Initialize mipi_dsi_multi_context struct
>
> changes to v3:
>  - Define new mipi_dsi_dual macro in drm_mipi_dsi.h to reduce code
>    duplication.
>  - Fix bug in lpm102a188a panel driver's unprepare function which causes
>    it to return a nonsensical value.
>  - Make lpm102a188a panel driver's unprepare function send "display off"
>    and "enter sleep mode" commands to both serial interfaces regardless
>    of whether an error occurred when sending the last command.
>
> changes to v2:
>  - Remove all usages of deprecated MIPI functions from jdi-lpm102a188a
>    driver instead of just mipi_dsi_generic_write_seq().
>  - Update TODO item in drm documentation instead of removing it
>    entirely.
>
> Brigham Campbell (4):
>   drm: Create mipi_dsi_dual* macros
>   drm/panel: jdi-lpm102a188a: Fix bug and clean up driver
>   drm: Remove unused MIPI write seq and chatty functions
>   drm: docs: Update task from drm TODO list
>
>  Documentation/gpu/todo.rst                    |  22 +-
>  drivers/gpu/drm/drm_mipi_dsi.c                |  82 +-
>  drivers/gpu/drm/panel/panel-jdi-lpm102a188a.c | 196 ++---
>  drivers/gpu/drm/panel/panel-novatek-nt36523.c | 804 +++++++++---------
>  include/drm/drm_mipi_dsi.h                    | 118 ++-
>  5 files changed, 614 insertions(+), 608 deletions(-)

Pushed all 4 to drm-misc-next. Technically one of them has a minor
bugfix as mentioned in the commit message, but it's VERY minor (I
didn't even think it needed a Fixes tag) so I didn't worry about
trying to get it into drm-misc-fixes...

[1/4] drm: Create mipi_dsi_dual* macros
      commit: d94a2a00d2b8878678607c2969fee3b4e59126cb
[2/4] drm/panel: jdi-lpm102a188a: Fix bug and clean up driver
      commit: a6adf47d30cccaf3c1936ac9de94948c140e17dd
[3/4] drm: Remove unused MIPI write seq and chatty functions
      commit: 79b6bb18f849818140dd351f6e76a097efe99e9f
[4/4] drm: docs: Update task from drm TODO list
      commit: 85c23f28905cf20a86ceec3cfd7a0a5572c9eb13

-Doug
