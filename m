Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEB70223327
	for <linux-doc@vger.kernel.org>; Thu, 12 Jun 2025 09:07:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749719260; cv=none; b=XR00SitOhQ48JQIFaNPzl8TVkeCHkUa90uGuHesjuo+wqMen6RSN313duMi8CxCp8WeKhMAjODLaZ6vfs5jwAnqZVl0KXlbEAp+orh682PWxvlSLUy7/uLdmmjF1QVhmvGTYT7ISnOP83AHHzJfDtmsuRlLhyFRpRC3pomDUMpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749719260; c=relaxed/simple;
	bh=y6b6QvQl+bRwXvl+wjLTqMdjZCkwY36Ul1Tt+SBOz3g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eB/3TX6k5VucEY2mE6U7XHu4ux2xKp7HJgbvb47zn8+0MvmOLNSur8dk55Cu5kw1POcY79NhfVxa4IAnmLZlU6AWE2ncj9zT1FFBApxfjzoWJ+EVXC23f54H+163wn31hP0wDo1JpIwic2dx1PfNS6YTYTmYmweRUdsycu17L/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=IGa3Y1JI; arc=none smtp.client-ip=209.85.219.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="IGa3Y1JI"
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-6fb28d4ab79so12902216d6.0
        for <linux-doc@vger.kernel.org>; Thu, 12 Jun 2025 02:07:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1749719256; x=1750324056; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=y6b6QvQl+bRwXvl+wjLTqMdjZCkwY36Ul1Tt+SBOz3g=;
        b=IGa3Y1JIVHWcAYzWj6EC+GINk5yozgwSVWowNZWA/ywKxlSYsVxpz2rVC9FijLDgBV
         IC2tyF5vCYDibsP7olM4JO4na8O853AjvcQRlEMISvizjucflB2hV9AHw0T4qy9aF+SC
         eSspDY0ptnBFH7Xl2wv9SWM/hU4Yqn1i5gCQE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749719256; x=1750324056;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y6b6QvQl+bRwXvl+wjLTqMdjZCkwY36Ul1Tt+SBOz3g=;
        b=dScjxpVqXxdgalvPsdMXFgkJFRa5CKQN1zQNVp5U5KIoil7t/JMdU8/khJIV1R3FEE
         mRiknx1X7Wji7t2rQ98XIouBgIgM+hHhHh1Qai9JLeDnDvV7HvroxH+VE1FXDa2z8v5y
         dhc2x6PnfHIK8RxXuVyNeBqyZbk9sSvcgbsVfz9M/iRI9B4+DNpvtDjWRdXL1NEkmWKc
         JKjvnUkZDja330RRWi+nt0EGBo1NVizAM5QogBf1ziR2l5eCUskOm1wnYyyMbFm6Vuk1
         pChgyVfdrsgIhOphiLz1UeieGw9LQkb5sDtdXJBQ8xj2yUiaskULR8kMIV9MbCP8BQsi
         mENg==
X-Forwarded-Encrypted: i=1; AJvYcCXyyudqrgYre/ldk3ZmBvUs2yzt34qH8UlYk/8fUHRoTbDaMcxJR1rtxN6IrMtd8g1Q0PpmLaDhf1Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YzV7HgaOjsW9ljZIRWPXjA3PAOGGFOebN4Nd8nF9e2eX+/qZUMu
	XdtUcTuUFwCHVpaT3DDEjoWAnobtOW9NU5SFdjueOwdXwOjoBXSMt2VnTQxk7wPFblvjMTZucYZ
	+6HtOWMxMJs27meyev50CxAbR/6s2zaEeHQBL99zM+yMA9xLLaUNY
X-Gm-Gg: ASbGncsU9X6/usljEYVE/eTos5v1XtivbLA80yJ7ErhbAxrXU6WHqTHkMowzMTmhkTc
	GcGckXk8swwQ+vUmGb6gsWgVwK577g5pqDPUIdjGkSWjPgHJ1s9s9m89BRRQnyNFBwAr8jKudZj
	xvXo90pAFTry/Z9JunARBf5UR+i7uHxekR7FzBtJdLNM00
X-Google-Smtp-Source: AGHT+IFOnNrzWjLT5ibrVv8Y2BGK48j7B6UvhBgwO8fx8UkM8EQpMGJyxzvavWuXra0V85HOmQFH97ajXAajekRIaps=
X-Received: by 2002:a05:622a:2596:b0:4a4:2d7a:994b with SMTP id
 d75a77b69052e-4a72293dcadmr52269271cf.19.1749719243891; Thu, 12 Jun 2025
 02:07:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250612032239.17561-1-bagasdotme@gmail.com>
In-Reply-To: <20250612032239.17561-1-bagasdotme@gmail.com>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Thu, 12 Jun 2025 11:07:13 +0200
X-Gm-Features: AX0GCFsOlxUaPAtzGm57tBtxM91bCOFZq--Te855323YXxbAnNwlfNn2nirhb38
Message-ID: <CAJfpegvKvKB+1Q23Gm8TKAmb4hPNnSHpK5W29JmDjHVWrWk73Q@mail.gmail.com>
Subject: Re: [PATCH] Documentation: fuse: Consolidate FUSE docs into its own subdirectory
To: Bagas Sanjaya <bagasdotme@gmail.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Documentation <linux-doc@vger.kernel.org>, 
	Linux Filesystems Development <linux-fsdevel@vger.kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Luis Henriques <luis@igalia.com>, Bernd Schubert <bschubert@ddn.com>, Amir Goldstein <amir73il@gmail.com>, 
	Chen Linxuan <chenlinxuan@uniontech.com>, Christian Brauner <brauner@kernel.org>, 
	"Darrick J. Wong" <djwong@kernel.org>, Jeff Layton <jlayton@kernel.org>, Jan Kara <jack@suse.cz>, 
	James Morse <james.morse@arm.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 12 Jun 2025 at 05:22, Bagas Sanjaya <bagasdotme@gmail.com> wrote:
>
> All four FUSE docs are currently in upper-level
> Documentation/filesystems/ directory, but these are distinct as a group
> of its own. Move them into Documentation/filesystems/fuse/ subdirectory.
>
> Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>

Applied, thanks.

Miklos
