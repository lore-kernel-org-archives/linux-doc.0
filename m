Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2BA83C5849
	for <linux-doc@vger.kernel.org>; Thu, 16 Jul 2026 23:25:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784244342; cv=pass; b=c7hyuRNwtgwdvPdvA5SkaTXJIX3niRdYX25Po3+1o8z3LcsWdPM6gJpDvJ3qvGor5gf6FdZRSJwDH9Zi8EjUWK35f7GMotjIMXfMrTl0tZq/xMMNor/IokVHAnJ25QfOJrshEexRRVk/hPYuT38wspFd68G48YNoh9kVJv/EEnc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784244342; c=relaxed/simple;
	bh=4h7xhtMJGdpGVsSu0kS4HBwr3mEevW2o4UeSWPChcp4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JJh5kdsC93RTZi7hMuDqY/uaBHaWSvFEyacTTK1AxMj+TevLGh+kxoqo/26uCLfKKoFwloxc7wOGvyHzmlestIaa7lHoh9mE0JaGaajIu6JS8Rz9mAqE3ZnV7UoMeMHN+td4qtAGNqHPbo+UAtBHKUEUE38olK9AG0rHiO3id7I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L1GUPfw5; arc=pass smtp.client-ip=209.85.219.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L1GUPfw5"
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-8f0d6853360so50874986d6.0
        for <linux-doc@vger.kernel.org>; Thu, 16 Jul 2026 16:25:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784244340; cv=none;
        d=google.com; s=arc-20260327;
        b=ijE1lGf3Kla3Skbn51rQRxYdCwsEq+MwMlMf5Wqe3DEHKx7QdN9yHpY0J54zCv53wP
         efkJY/6GeZ7WeaX8Tq38O8Ig7YSH+OWOPtG9Z60LcOgrqIVVxsMHQgxkQnbWixp1rPbR
         2QRvKNTNiHYEt6jyhypIHPFjubmCF7FiDGUur5X30MwDm2lt4xD2BCeYg4e+jKDdn355
         8qyUPQY3fTYDZKjfgD/XikTMMym7L6ktsXdHbfCJ5ihkq9s8iMhrOcpydIVDO21CSrWG
         HIxHS7tNVchaHPMRbyoqRG2RnwZd3mC6jewToAFFyLnyU/5HxC8LBaJ34k41PINm2kcj
         ulLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=yndt/cVTHld9O2iHVB49sNJNZBoyax6h5L1SZnhazsU=;
        fh=CvAoNJxu24rG0D2SJaE2994iI9FE2xtVN6/18KyIvjo=;
        b=EQawNNcYFZFkaMlR+NJA+g5x2jTlPQU6KvrAaWAzLm5HOtNm2yDJpfYowphsSwJI6e
         F07PMKJe4tifVc2ZA/XCr8zFrAEGayDy1BzmcJZFkmmLGQLYczrnc1Z5GBHcm6Q6KLlx
         CmRclbwugDxeGWxiu+h7UJonkUUUcxZVFE5ocqp84leXsTUEhYrtXfxdoItgurt0rKod
         JSqD1Z9TNQ6PI1UQ18pH59v+E+4z7bQudMuVqg8YywyYRiv/izGoDlSYdUDp75s1uex0
         cox3k6GEi8mwgl5UJurms48Jdw5VxvkmxewN04Z/Lzt2hw4QsDxd4kUN+GwahSgCbGLT
         xlVw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784244340; x=1784849140; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yndt/cVTHld9O2iHVB49sNJNZBoyax6h5L1SZnhazsU=;
        b=L1GUPfw5hcyyQ/FwDEJkFe6gYoFaLUP+U21kEmnBn7NbxIRqJnLXitWBbOenOFNI6e
         oltS5do7O72NK30s9uA8mvLxQKsUEBPFl2IYYYDR9PAqOnDHhWqxEeimf8ganMmzwzLv
         XoATRKWa2N80xqTCbG1TYxl3EWmjcyXCK2VAQtLgZ7SOl5NKPtLwP8aUKgZaI4EpJP0L
         yc4/gpZpDtwqlu4JrNaIiIQpL6H4mMABqHjxESI2ppDZQ9ltWrXJLoXh/ZUvSxlVuQLQ
         sXEMhGN7/+/Q0y9pdMGbGbc+XgoJ79rp0hzbfOlthDNgE6OswnDEuTf8m1bwuTNsaP5z
         876Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784244340; x=1784849140;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yndt/cVTHld9O2iHVB49sNJNZBoyax6h5L1SZnhazsU=;
        b=Lq5BI3FobEAJ8N34dN8/I5hEt5bstp1bL+b8XD0HXTerMJ3ImmuQDZ26MxrHjHarq4
         PI6CjUAWExHJhKPaNXOSK4hrpN6VaURV298NmmG6wxEkAuPRPvIOL+tDp1HzEIFeEh8X
         K1UicKaHI9l7C5Oo22b72ni7Y2CcxDuouS3qRQM6qzydxdy+UjEbaZE0+qQv4Ny5Jjkv
         Zny8ChUJP39B6zr0QrSpKzjYIQzFmtRiTj1qbUkbh5wGDeqgWrEOUDzEeW7exBhD1Ox0
         ctOghjBKMLbb2awWa1+FUpuWB7JFZTdrtrZsLs+WJ8m08rYoQ5GLjkiZ7MnGrET6SLoD
         VoWA==
X-Gm-Message-State: AOJu0YzADuD7H/8z+OoDKZClomTE7HEmQis9E+pN2S2B9uepzZpgiVuj
	FbiOsBimEjPl8ceReY2huh90QCJDezp9hD2IgtwUavgUUQEk/yv1RswHSCcBtsmz0q3N6DqdZuY
	3sArC5RcRdxd03Dd5Y8ZDGzSM9LWlT/frQmwoI2A=
X-Gm-Gg: AfdE7cko3ufUWFU9uMx6Nmg3fv290V16r+pUpGZI6/LEBHvVbrTOBtaf2XOdO74y75j
	3SZA51eznOlohn/ym/n0VHIsCpN+3pnj+kkooz57CqzPerRyeNKfiniLGrEol0F/0ZFxCQoLJLi
	8Yn88lPG3XOU0G9xBcgX6at/mEVXVB+shPehUQx52D1UnukFj5jW0586uKqHf9xzIlSpGsDEL1H
	RqHmKekl2YGRcMwWrlArg7iia5w+RApfF2GBSmD7GYsR9456YWF2P5THMWQOMDRzOLg/kvoc1VL
	4dl5evX6yescTH8JxwuPL4cdxefa2LFFHBnm/dp4rBAqLFj/GBdFx1p7sEfR8GjPC2dCcZ/Yxnc
	r
X-Received: by 2002:a05:6214:5c07:b0:8be:1620:a95a with SMTP id
 6a1803df08f44-90778375c9fmr3331916d6.27.1784244339596; Thu, 16 Jul 2026
 16:25:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260716021013.48025-1-danielmaraboo@gmail.com> <87ldba5z1u.fsf@trenco.lwn.net>
In-Reply-To: <87ldba5z1u.fsf@trenco.lwn.net>
From: Daniel Pereira <danielmaraboo@gmail.com>
Date: Thu, 16 Jul 2026 20:25:25 -0300
X-Gm-Features: AUfX_mxgmw7OTCtL9A4mZcaPR91Ocsj08hFbz77nyG9trizmpshlqNvoJk-47Ec
Message-ID: <CAMAsx6cO588DcqAT9c=-7aXWLwzAbjrAp=jJ9Ya9dC7draaPZA@mail.gmail.com>
Subject: Re:
To: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Em qui., 16 de jul. de 2026 =C3=A0s 19:50, Jonathan Corbet <corbet@lwn.net>=
 escreveu:
>
> I've applied the series, thanks.
>
> For future reference, a lot of the Portuguese translation patches are
> giving me conflicts on Documentation/translations/pt_BR/index.rst.  That
> happens when you have a big file that everybody just appends to.  Might
> I request that you start managing the index.rst structure in the same
> way as the English docs so that these additions are spread out and don't
> conflict?  That would also yield a more readable result for the
> translation.
>
> Thanks,
>
> jon

Hi Jon,

Thank you for the guidance on managing the index.rst structure.

Regarding the conflict issue, I would be happy to take on the
responsibility of organizing these patches to help save you time.
Would you prefer if I acted as a point of contact for these
translations? I could collect submissions from contributors, merge
them into the structure correctly, and then send them to you as a
single, cleaned-up set of patches.

Please let me know if this workflow would be helpful or if you have a
different preference for how I should handle these conflicts.

Best regards,
