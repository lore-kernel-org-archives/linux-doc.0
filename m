Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC65C348C7B
	for <linux-doc@vger.kernel.org>; Sat, 29 Aug 2026 10:57:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788001058; cv=pass; b=DFJsBVbuk/ERB5Gdcw5R+IDhXD6KdITC8jSRbpgvlk09QRpQ2Pz0dicvXpWbF/2GbULYhKhe9rKTPkD84uPcDVcOUCjYmdq+d0RaXATQf2UmtzX8hR/ovOm0bVz+FUiIqJNNsvC/MN6r9G/fIjcG754PU6fbT25va3jzKd05WGA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788001058; c=relaxed/simple;
	bh=hsBKohLfCZd0jfnALC1cEzA++W2MrcDhahlgqPLVM7Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HtIqfx7bo/5B1QuN3HDQxm/C2mp20JrtKhbiy4/ofxT1GrLN4wrWacnEGUxqcxEm5Y9cZ1V0tdWfDeKPohUTdUuJy0j+1W/Hs7Jwm3UR+5WqreZTnWXPYDmBMwJbFBlF2y0aBmtR5fqW7miafTHyxU3waCRdbYMbyEobKB5oiCk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qxB9/ucO; arc=pass smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qxB9/ucO"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2d8f2ed7bdcso461475ad.2
        for <linux-doc@vger.kernel.org>; Sat, 29 Aug 2026 03:57:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788001056; cv=none;
        d=google.com; s=arc-20260327;
        b=JmjiCmUBGkHhsgIRYE0IpZBT9ClOkVrXA60evujBpMBrUKKHHZ5PDvXNJjtRDHuxxi
         czTT91oWhQZkfwz9lzcOjMl/muptZ/z6dQ7CvPQU5afUz0dHLZt2rOcacTL1xt0G9c6x
         gNORqKltPAuMgMuSgqPrvmue5BfDES4+aNWYQlp1J4sbHnfPMKKw2uFCYfAUo/s2q3Oh
         icVlUzYah7aAfIBGqTsknWMFX/SyG/iRMQDhrBU4rZWd87fi40p2/4FqhpmsbnaVXpTr
         j/Raml5Ei/BKOwy3FaTR4Q36yiR3HWCmRg5FPymsrYDfA7E5cUz+TCbdB/1ceNdWLpOt
         4I9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3yoXZjSinVl6bLZjtfCsRoIy2CcONJCPzcPUWytAk2w=;
        fh=9oojOvwVca88leYhTJ3Sa8xY4PJY8hHSgHS0rMWbfo0=;
        b=nqMyKN39UoN0GI04BU/gIM5VcTLjcGHhBTEZJa7v1P7xX5z0nAcxqfQjY3m9MyBspC
         72bZWZzO9tv2dGHpx8Dc+4g9Gj84QoasKutgYjFtTdWPJn5ndEaaIWtu+tjoRIsyOodf
         91cD5CipTd/UyQKSeDsNz/pLgyLKfyBxuUKUyVc4Ek5TrwQRAYKvTAAXZtqAbFFkyOoF
         ZcLzWeyZ+ixDcoTbbMZlDwN15/Ej7ycDMa9H3wMGGMFVnfAzr5GZvFT26gF/Q9o3e4iX
         rksPrZIQWWihKTdOmvRq8QCszBWl8ttdYDk33sqAC0dadDG9ipRGH1TzuCh4GXvckIxj
         HM/g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788001056; x=1788605856; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3yoXZjSinVl6bLZjtfCsRoIy2CcONJCPzcPUWytAk2w=;
        b=qxB9/ucOSNJYhkRxeEyJuIaaChnbkIeziSSD+2tZkrRhLbLNtPwwaw4AnOsFMkGHgH
         g8av33wNg8aFOi0uNrjq+Yypt2oDfrdfygCqbkDmAzG5fuTS1GaoG3u/rzSOQp64bZcr
         Wr8t+It1pfy/S1oP/PjrrW6Lt8BGDP9OyfNZoC6PKX9aTpe0hvxrhZVOb2JooagrMlPz
         TUMkgAqwJXV3g83TJ0bJH6Fnm2rHWOxxW7ClpQ3zjd3BOyBL4NDx9juMBCRdInYkLope
         g97Vy96kHGCKy87vUJsdUFVo8/sZJhGJwdy6K//5s348jFOgAAUIsevfCJRcwtlGtwCE
         +tfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788001056; x=1788605856;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3yoXZjSinVl6bLZjtfCsRoIy2CcONJCPzcPUWytAk2w=;
        b=aCwbmj53c9/bqNU/GlVvsCFiUl2YXR7NBnII7Q2OtBsF0C3plSbannJNPQrC/Be1wB
         j2dSd7b6aHoKB94JN7SEzI05O/oGnnHQ6+YoQPwTnn03mQRyBsml97iAESeRlLDOUprY
         89agm0G/FcKZ55rd/ahSjwhr7eD8/i5WsybQyVvtc0xclP3SQb9qZ30pmr/bh3hdB9oz
         wVDMWLKIkDMgjzIaZprCUUCZhih+Qo4iD/dE/UDe+VyWxTBooN2vOtgZZPlEEP4h+GwY
         iPPCedMSeMAdnkQ5vo7lSJYOr2iU476pwVa3WgqkEpD2cOEgtkDqJtRWBOPNOsCSiJAX
         4cmQ==
X-Forwarded-Encrypted: i=1; AKwUvBw9WpRwmHaffysYKPhBYNO19abzCknhNjhHfIL5nPEDI0CrQBP43GA+UnxU9SERIE7XYiGZ9RkUxC8=@vger.kernel.org
X-Gm-Message-State: AFuF++lYYGXZ4TO6/4jcLXhhAD0dohGDLX+Nbm+HjM2s46P586v/KemV
	UQ3st+iylVvYs2rbXTUwp35j8URZDmM6PPBonYWRRiZPRiOrL6ighhZrNfVRtXKs5Al3mrLursh
	n2SC3xUxgucfgKW5V73B4UeWaTLvohh4=
X-Gm-Gg: AR+sD121Js+8yIw6l1/aqgJERg5uemqj+/XCRynHgB7IBw+EEFrcB8EZYz5aKWns2ke
	tpiX2PjI9r7qAqHjbBNbBHy622N+xNMUiQ70UsdIus2heVUxpoWrodcnVYyD26FbtDuTVMOXBMd
	awB2b9WL1FeMWWN3YC73P3IhZpktRiAf5ThLIfYP1gTmDveSUuiIqKbPDgsemBfhAvW7xtBUnb3
	R23YBSIWSwKvtLPkBRk4cy3p1yncGH+SqDr7CeOMPF5ict093h2dAojtBTqa9tQ9Uj/+n0KBDpe
	+GU1H5BMKfDrY50bUPkVuFC+/axTGUzMeEZsUX5iVBFDi8jsKTr5mA6lq4cgpQSbEFNgexL0hB5
	fcK0OeezckrIf0qiMWnE17ISLMovvHd1kRN3h3uumtVim0eDtfKbklOP3sNz7
X-Received: by 2002:a17:903:1104:b0:2c9:8287:fd0d with SMTP id
 d9443c01a7336-2d74df62ccemr115727945ad.3.1788001055774; Sat, 29 Aug 2026
 03:57:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <7d8ba914cd174d716340bb2b88723bef0f330627.1787565460.git.gtucker@gtucker.io>
 <apG3hwaPA8f7SJeI@levanger> <b45e7864-928c-4b3c-aa62-64f4f63d85c7@gtucker.io>
 <CANiq72k6T9Y_Vubih6pFMQBxju2xQq0VQkCXT1WL0qSyCXKxyA@mail.gmail.com> <9a3eabd1-4057-45cf-99b9-9c3c1b6260d3@gtucker.io>
In-Reply-To: <9a3eabd1-4057-45cf-99b9-9c3c1b6260d3@gtucker.io>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 29 Aug 2026 12:57:22 +0200
X-Gm-Features: AcwNN1U4Xd-ZPEH0J5NkeG85FCsQEWIBZhyX8xsSVfYp0sl8uMCqeYTmtDyhT2w
Message-ID: <CANiq72m0eemCPbEAvZSC49OZHyaNvQgbMdSDphT01no1B+YWEA@mail.gmail.com>
Subject: Re: [PATCH 1/2] scripts: add TOML config to container tool
To: Guillaume Tucker <gtucker@gtucker.io>
Cc: Nathan Chancellor <nathan@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Nick Desaulniers <ndesaulniers@google.com>, Miguel Ojeda <ojeda@kernel.org>, linux-doc@vger.kernel.org, 
	workflows@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, automated-testing@lists.yoctoproject.org, 
	"kernelci lists.linux.dev" <kernelci@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 29, 2026 at 11:02=E2=80=AFAM Guillaume Tucker <gtucker@gtucker.=
io> wrote:
>
> See "bc20c56e98e0 docs: changes: better document Python needs"
>
> Also it's explained briefly in the docs here:
>
>    https://www.kernel.org/doc/html/latest/process/changes.html#python
>
> So I guess that if it's needed for at least one build configuration,
> then it's not optional anymore.

Yeah, that is the commit I was referring to, but I am not sure what
that commit meant, i.e. if that were the case, then e.g. Rust would be
mandatory too since it is required for at least one build
configuration... :)

I guess the commit was trying to say "used in enough places" or
perhaps "the default config of at least one architecture" or "some
`make` targets" or a combination of all those, but it is not clear.

Cheers,
Miguel
