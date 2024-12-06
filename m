Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 531921465AB
	for <linux-doc@vger.kernel.org>; Fri,  6 Dec 2024 15:27:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733498828; cv=none; b=IyTlQxXHf6Ow4YTKkKTMHa8lDwmcbRoB+H2uIXrYq5gHww27TI/5szauRS6QUPwv6TFQKVwtK3K0a7RBC7XxJhdi2ch2G51QBh3Rf6psDnndKvEcPn4vyLlGkdgzBQJvwQuD5q+5EQAyB4kCupDwNXU1dWb3QWQOv5OzI+jV5Hg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733498828; c=relaxed/simple;
	bh=DZ4iBJ/iWM8KSa7H29avWC680AIZt2rf5AWA6M/3SAs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NlB6dic9twJph3CcdJhddiaqyA5I0ypoG0L1f7Rj4POYl/RsUbAfhIJlfgK7hD0SldkLVZIwkhEUtMa/HQaWM2n1VpXeo8RwnUEBSWqfF7oQxlUtVfMgdNr148TAYDTVYxcB3dcMQWcFg/EwHJZB0Hle/m9CKI0reIbXfYZOiKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=lWc1IZGV; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="lWc1IZGV"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-53e3778bffdso591673e87.0
        for <linux-doc@vger.kernel.org>; Fri, 06 Dec 2024 07:27:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1733498823; x=1734103623; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tZUn4bZBalbJgAp7xW/bITYcNU46rh/GtC4lpWqRHs4=;
        b=lWc1IZGVzgOULjBdDUf0VtaAnKBv0FVAimNIfEeHXlM2QTWDx2jh6GPeqb0pXGqnfv
         xh6ReG38HIO5eZf3Yp6EncXUJEBwcu3jKSiuirc7LRnqmeJ9F9k2W5MejbCY9ETw1i1Z
         52yzARay2ZoyTNtsbHW/ZGDChD5OxraA+1o/s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733498823; x=1734103623;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tZUn4bZBalbJgAp7xW/bITYcNU46rh/GtC4lpWqRHs4=;
        b=iBm/gubsuu0v7qh0bofNlnu1kDV5sww9UXiLf6eIQqaHsuA0OJ0AG+taacmikKJaKL
         s2VfELvoMDFJjHCLVvbs3bDOURLxo0iDKpT1G4najA69KluGV4vdqKY2Fr8JZKWEOhEI
         z1UTL3rrZVV+o0i3D9rYs4B42U6viObXzKCmvLdIkUSlfjoD83nHLWGbtGX6g0kp0ZO/
         HdIrWDyW1AybUU5dpsJPMNLcGoZCTL72f9yGDjyL0bdMulEq+SOal8VL0XQ1uYKQ0TA4
         BWx1XNWyI3PDdpBd0KIonS4Hsblks0dwcrp5E7v4wpnOB5aXtBCkpsSMc1M8zMOkefVq
         kMkg==
X-Gm-Message-State: AOJu0YwqJr32axx/Uj8kR9qPEa2FLgodBeVFVRm9erlZcwTOWag6bMNC
	FNlSGUjgX+62Yf5lH8HwYA6U6i69IlHx2zhD1bSpzrDzCH8OdC/dQJUbSXUvWflh2Fplhr6AVeo
	5BA==
X-Gm-Gg: ASbGnctgdv4S4J/AYM5lqVbsU83ygeaa8QBdNdcdREaFhjo5TkyP2Qq1fJsuzW2R3DS
	mQsdUztyG7xm5Fb2OotuO0wfsWHDbctCAygxIM1y17RJz/whMuHPd5dWPikNnOeFmLrKfKPqHiZ
	QdD2eN65z+M1askZZzc7lW7pbRgJ0YyvIvVMtbVzLWwL8yM7llmigDcGXmY1KptjjZDGYAHf7Mj
	hQqWzJmcoX61fOKfB2wDWhRB3nAS/1xIDSUXUQHim68Iw5NE7lapI0AAFGgNY5Xm+EhDXAXbxiF
	RxvHdjd05NB3/d53Qg==
X-Google-Smtp-Source: AGHT+IFjPtub/nBGtgAAyXAiGrR4W+HaWoNOXkdLzwxFI/To83LE5sngK52PvzC8wR1HN2JOe9wsOg==
X-Received: by 2002:a05:6512:138a:b0:53e:228a:859 with SMTP id 2adb3069b0e04-53e2c2b5caemr1110027e87.15.1733498823155;
        Fri, 06 Dec 2024 07:27:03 -0800 (PST)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com. [209.85.208.175])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53e229ca9fcsm518194e87.280.2024.12.06.07.27.02
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Dec 2024 07:27:02 -0800 (PST)
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2ffa49f623cso22687271fa.1
        for <linux-doc@vger.kernel.org>; Fri, 06 Dec 2024 07:27:02 -0800 (PST)
X-Received: by 2002:a05:651c:2119:b0:300:18ed:4313 with SMTP id
 38308e7fff4ca-3002f8bd5ecmr10190331fa.9.1733498821759; Fri, 06 Dec 2024
 07:27:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241206003100.38142-1-rdunlap@infradead.org>
In-Reply-To: <20241206003100.38142-1-rdunlap@infradead.org>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 6 Dec 2024 07:26:50 -0800
X-Gmail-Original-Message-ID: <CAD=FV=WzC=AA7MVX_qN1fsPL3Y8JA__0_cL5UWGoea0kJj5PVQ@mail.gmail.com>
Message-ID: <CAD=FV=WzC=AA7MVX_qN1fsPL3Y8JA__0_cL5UWGoea0kJj5PVQ@mail.gmail.com>
Subject: Re: [PATCH v2] Documentation: move dev-tools debugging files to process/debugging/
To: Randy Dunlap <rdunlap@infradead.org>
Cc: linux-doc@vger.kernel.org, 
	Sebastian Fricke <sebastian.fricke@collabora.com>, Jonathan Corbet <corbet@lwn.net>, 
	workflows@vger.kernel.org, Jason Wessel <jason.wessel@windriver.com>, 
	Daniel Thompson <danielt@kernel.org>, linux-debuggers@vger.kernel.org, 
	kgdb-bugreport@lists.sourceforge.net, Alex Shi <alexs@kernel.org>, 
	Yanteng Si <siyanteng@loongson.cn>, Hu Haowen <2023002089@link.tyut.edu.cn>, 
	Andrew Morton <akpm@linux-foundation.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	linux-serial@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Dec 5, 2024 at 4:31=E2=80=AFPM Randy Dunlap <rdunlap@infradead.org>=
 wrote:
>
> Move gdb and kgdb debugging documentation to the dedicated
> debugging directory (Documentation/process/debugging/).
> Adjust the index.rst files to follow the file movement.
> Adjust files that refer to these moved files to follow the file movement.
> Update location of kgdb.rst in MAINTAINERS file.
>
> Note: translations are not updated.
>
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Sebastian Fricke <sebastian.fricke@collabora.com>
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: workflows@vger.kernel.org
> Cc: Jason Wessel <jason.wessel@windriver.com>
> Cc: Daniel Thompson <danielt@kernel.org>
> Cc: Douglas Anderson <dianders@chromium.org>
> Cc: linux-debuggers@vger.kernel.org
> Cc: kgdb-bugreport@lists.sourceforge.net
> Cc: Doug Anderson <dianders@chromium.org>
> Cc: Alex Shi <alexs@kernel.org>
> Cc: Yanteng Si <siyanteng@loongson.cn>
> Cc: Hu Haowen <2023002089@link.tyut.edu.cn>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: linux-serial@vger.kernel.org
> ---
> v2: Make process/debugging/index alpha by filename.
>     Update references to the moved files.
>
>  Documentation/admin-guide/README.rst                                  | =
4 ++--
>  Documentation/dev-tools/index.rst                                     | =
2 --
>  .../{dev-tools =3D> process/debugging}/gdb-kernel-debugging.rst         =
| 0
>  Documentation/process/debugging/index.rst                             | =
2 ++
>  Documentation/{dev-tools =3D> process/debugging}/kgdb.rst               =
| 0
>  MAINTAINERS                                                           | =
2 +-
>  include/linux/tty_driver.h                                            | =
2 +-
>  lib/Kconfig.debug                                                     | =
2 +-
>  lib/Kconfig.kgdb                                                      | =
2 +-
>  9 files changed, 8 insertions(+), 8 deletions(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
