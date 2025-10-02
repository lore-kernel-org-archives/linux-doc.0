Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 932655464D
	for <linux-doc@vger.kernel.org>; Thu,  2 Oct 2025 14:27:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759415258; cv=none; b=ZPPD529Hs61B9jcdFGXOwjmpCimMz0T1ukjU5D2NDh8qQQzlPCO2v/lqROEaM1F3RbkyP0jrqaAYIjjjbjXN7nhgXl7tBKA4CakFv+BZsvZ/QRst5FMy6rlbZC1rYe04O6Zon7tkmt2H1ITRRj86PtQb9kANV8uGROau7+hCi8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759415258; c=relaxed/simple;
	bh=YTG7szQs2JR/dObAb+3xV9cY70G9O99B7xlKAdiV5RQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=in2hdK77tN+o/Dm6oGT/XFmHoAAQPnbe0VYBFGN16bBUlxCEn7kbPc7WEQqCoPZ/jszTlJvQsr7Pi8PYjSMC7VtwLsm/UFOYNOjrW4Ec4wCzkGLAwTSriVRggMVutl1yLPvuBr5Pritehfp1nE6A4hY49DwDa/0Jf3TyQKZT4lQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nbHZ9H+W; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nbHZ9H+W"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-b456d2dc440so177856166b.0
        for <linux-doc@vger.kernel.org>; Thu, 02 Oct 2025 07:27:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759415255; x=1760020055; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q1LvzQTRrBMgTypEWqnXg8U4XrMLxFbUK9hsr681A6k=;
        b=nbHZ9H+WP7pqNt0AZyTNkVtIe+E/6rBRsq1kRUvQKOr0Dy6ylXS8eP11QwzhUo51r1
         qFGqTY2ULj1BoMy4MatBdbN9L1dC0WcGi/OGl+TUK6qT222G3FYsi5Max7g8QTM3cfOF
         AquN81Mjo8wIR27TfasbJPnpYaLYMz7aRFXstmOECNUanMcXvV2NvY1K9z0DBFRa1+9Y
         3vjQQsDAWUprlYBhJo6S/Aud4BtsM6jVDxGUfO/0rhwW5FNhAY2fnO6Y18l3MVOYcdYu
         8hCtf7jihctjOBv3ntglEdLZ6KKiiIFlnaiJtLLapZk0kSki3xPH0mQQhSqCzLfHahby
         64Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759415255; x=1760020055;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q1LvzQTRrBMgTypEWqnXg8U4XrMLxFbUK9hsr681A6k=;
        b=f2IP7I6Q0rFGvViB2SKFyJn+z0XflaSdjcWpdGCag/M/1iFud7NSpPt1dfu+t18p8o
         7V+jMXcOeUSJ3VKv9X6uv4NQIvFC1eWzU2X20HEc7pfRnFu/LsUnBqkMbPtIOygg249Z
         3vnRsWhND0BOgiF/rgqYpX+HzdCE7CSYmPvf8b0acDjW0eNWkQagDg37bh25r4v8pSVT
         YEHchb63JjWQFhA6g0NdD7yYJWCbmXBTM4WyyWBlAAJ0Zr2wS01pysKvesFT1YY8CWEE
         jPxqFkV+JqYyYpj2m+k8O7f7Kq/cCVirhPr9E4hoGn6xVEhJDCTkf6H1kqLLh/tDPBE9
         DCmQ==
X-Forwarded-Encrypted: i=1; AJvYcCUvd2yZkEBzx1RwOHAaib7MRqet2sctf3WD/0/dvW6iDs5f1hShm6v3Su/U3/MNiLl2BYGKv54rytc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwUGLXDGPDR33oMqewAX/XXuCSTB4SBvvbllumeC4jJkYaMrHss
	QQEL+Ei8FwwpqRcTTkuAjQJxVx3Js+UdjNLbfRmqASutkr9RTFkFX4SYzYA9NGHU65bXy2No9AU
	+R4TI7mp+l5qkv1yFGcOPgJMyf3qqPNU=
X-Gm-Gg: ASbGncv9bHJV/22PmaWmRSYQPSWZm3pc3GVafPAmOwFzgPJQnHCZwYuyIjKjvC5RKha
	GsX/7KCC3/0EtRYIMZfbuQEnHnIWbSQ26N5ymsDp/O7iVIx1rSehxhc8gUKSqJeGZtc7REkj+P9
	tXDp7kvEy/2Oh/PDiVUL/3gEietUFTCQ5nnIn/1xviqu+E9U1v1x82oMX31bbjyc5+gmI7Bmjev
	NgDoF3UPj9lZRTg3iAaRgeQM8yvCV58gRwCHmVU8Q==
X-Google-Smtp-Source: AGHT+IGG+w7GwQEdAUxrNfXF6Ogahm1jFVMJY6TQrqmHx3CSbXVTLnr3mqqdWUPqcO9XxlAvib5EIcobMkZRaQmQvdc=
X-Received: by 2002:a17:906:7312:b0:b44:fb0c:5c43 with SMTP id
 a640c23a62f3a-b46e985e163mr974639166b.57.1759415254584; Thu, 02 Oct 2025
 07:27:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1757686158.git.doubled@leap-io-kernel.com>
In-Reply-To: <cover.1757686158.git.doubled@leap-io-kernel.com>
From: Alex Shi <seakeel@gmail.com>
Date: Thu, 2 Oct 2025 22:26:57 +0800
X-Gm-Features: AS18NWAt5qPA9tYbO3_NeJcn5JGJoGhCtu4C0C3NcQb09IOf2HlzQ7cN0CiaeyY
Message-ID: <CAJy-Am=XdbW_EfRkBLJL9chTP3rn54+KLBwdkAk-EUServQ7XA@mail.gmail.com>
Subject: Re: [PATCH v3 0/7] Add chinese translation for scsi
To: doubled <doubled@leap-io-kernel.com>
Cc: alexs@kernel.org, si.yanteng@linux.dev, dzm91@hust.edu.cn, corbet@lwn.net, 
	linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Applied Thanks

doubled <doubled@leap-io-kernel.com> =E4=BA=8E2025=E5=B9=B49=E6=9C=8814=E6=
=97=A5=E5=91=A8=E6=97=A5 21:02=E5=86=99=E9=81=93=EF=BC=9A
>
> This patch set adds chinese translations for the SCSI documentation.
>
> doubled (7):
>   docs/zh_CN: Add scsi/index.rst translation
>   docs/zh_CN: Add scsi.rst translation
>   docs/zh_CN: Add scsi_mid_low_api.rst translation
>   docs/zh_CN: Add scsi_eh.rst translation
>   docs/zh_CN: Add scsi-parameters.rst translation
>   docs/zh_CN: Add link_power_management_policy.rst translation
>   docs/zh_CN: Add sd-parameters.rst translation
>
>  .../translations/zh_CN/scsi/index.rst         |   92 ++
>  .../scsi/link_power_management_policy.rst     |   32 +
>  .../zh_CN/scsi/scsi-parameters.rst            |  118 ++
>  .../translations/zh_CN/scsi/scsi.rst          |   48 +
>  .../translations/zh_CN/scsi/scsi_eh.rst       |  482 +++++++
>  .../zh_CN/scsi/scsi_mid_low_api.rst           | 1174 +++++++++++++++++
>  .../translations/zh_CN/scsi/sd-parameters.rst |   38 +
>  .../translations/zh_CN/subsystem-apis.rst     |    2 +-
>  8 files changed, 1985 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/translations/zh_CN/scsi/index.rst
>  create mode 100644 Documentation/translations/zh_CN/scsi/link_power_mana=
gement_policy.rst
>  create mode 100644 Documentation/translations/zh_CN/scsi/scsi-parameters=
.rst
>  create mode 100644 Documentation/translations/zh_CN/scsi/scsi.rst
>  create mode 100644 Documentation/translations/zh_CN/scsi/scsi_eh.rst
>  create mode 100644 Documentation/translations/zh_CN/scsi/scsi_mid_low_ap=
i.rst
>  create mode 100644 Documentation/translations/zh_CN/scsi/sd-parameters.r=
st
>
> --
> 2.25.1
>
