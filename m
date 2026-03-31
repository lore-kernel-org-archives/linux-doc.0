Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBDBA4219EA
	for <linux-doc@vger.kernel.org>; Tue, 31 Mar 2026 21:36:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.161.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774993017; cv=pass; b=lDRvzBS5HsgGMRMKi+a/+BBGR1Y/ocrbg7MWK6p0MidsO+nALeldooyj7ZW4PwHZMwvjvXZPjpShdsw5PqJSsIIfaA4apJnGgcA2GGKMt3/Iyh7BC0eiLgtkLr7VfX71VKeGsgKj4cK3YLhLbLhpB5MhqXcAA6UY5OqASEkYHWQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774993017; c=relaxed/simple;
	bh=RmiaURoFL//soo0SanqCZuTXN38oST47l9Q+aEKkfLU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PtO8woIJqh8g6sDhcbSlUs1EQnpZE7IzCNQxot1CBkoLTDpkxFuQteDF1WcG2BmKxkg30xFH5foBND2pqycTn+RS31tmljfo0DAAXgGq5SslbxPZ832KQvRKqOvGHmaCCg0oRMi09g6WaZwHqiZsNHQI9ZJ+oL3ob98VqV3LTbw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HiyzFk6D; arc=pass smtp.client-ip=209.85.161.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HiyzFk6D"
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-67cf1bfc73eso2146393eaf.2
        for <linux-doc@vger.kernel.org>; Tue, 31 Mar 2026 14:36:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774993015; cv=none;
        d=google.com; s=arc-20240605;
        b=TPVxLTh50G43tsonRaaL/RSy+v7i7uWcbnCUGknyH3g/0z5eSxMRaCb/7zRdwH/lfq
         uelOKyKCzpxPYK6B1ax0fUjXizGkR2B/JCaY/5b/Ptucf6FFGp+PN/EL/U2VjCS0YSe4
         1lWghfJAIBDN3ITOmSUNhJCXTAhLC1fhKDms1NypdyhgEcqrJ+xOau5BFnw4a01f9bOn
         xToE0Hc0RWnIN3zpxT90Nz7bEkzNYdmiIcwcw2wUwXKnO8E511SNh0cA5YRQjq3ExFOh
         oPydi5USZR7gN+BNmXtyVxukYRHAhnA1cOE3rj/I7zvHW9IhAVgbNzl/HTptOlUf7h/7
         bD/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RmiaURoFL//soo0SanqCZuTXN38oST47l9Q+aEKkfLU=;
        fh=1SYEjB9j/adrIBLDvOXb4dLKP1HBSEiCJwTCA6izj80=;
        b=LOxVw5Dvll5W1pbe9wMXjHvgYhsUsoqI406/zDc0UtKn9RaKdLEqhKCPKw7M+tuciT
         cFl03+AAAODvFTxgEtwUTZsblw6idnyW1hK+QX88Ou9zd8XpckqSsSqQXU4EAoZ+LbYx
         vqYvzt23O4P65T73Qv8YM6Y/eJ70DY0XVN/hoLqYCbrbFqLSsLHUVvhPMQcFENXRXmvT
         BgTJU+8Fhtjjel9zBKuUv3bWseQ1SJSQCNNKA3Q9yucHl827uuxXjbV6mknH7ufAiYvU
         YO5oWYPDJwd+2F61sDaVDXea4TpK/1oiqow5RKLDi3yBDY6bTYG420QL6bqG3sQMrkru
         Zxvw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774993015; x=1775597815; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RmiaURoFL//soo0SanqCZuTXN38oST47l9Q+aEKkfLU=;
        b=HiyzFk6Dgn7i0zGhqIAZHSOKi0upaKyQ1+KfU47VXbFW469v3C/xWXlS6+RDvVm5GT
         9H23tNYDJM0OPhADd1eb4YF3M+qvV4DsO66R0XpbyGHQBEii5WLr+IludX4N8Zl7x1oe
         WdkK+XTUNe+Bs3L+MEqedmz/PVjaZDNlMiIUd6sCfTyBJCCg5ZGo+vVDws1boU2gAg32
         vWIoj4vflf+zBG0VVULKf6vvV0nRl3AkK87qhyoFghB/Vxi0CxpFqgWjoojyXbvNbTAL
         eDKuGgtCTNoAMmFnW1j6jMv1pmy8zC9JbIcH3CdUETixGKsYGPaVoryWMGCyJl8x05pO
         tk1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774993015; x=1775597815;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RmiaURoFL//soo0SanqCZuTXN38oST47l9Q+aEKkfLU=;
        b=glEJKm6ZT+2JlAULH2i/8WaRj6W7mVCB2nWQPLuIbiwDs90FQouV7oimbgy+JBFf9j
         UKgHmA13FnOfoDYujOnve1+VV9gAUA4oo2Xoi2qnCLlFxl77ZVOpxLXlObQ2J7eKClu2
         NSMeuB9YrBaIOM6sJ5lx3u3okVXHQvLcAZuAm4UWXLMOut1IctyHLy3drxZqbaHoqU1k
         MY3p6VDNTaa+B+V0d3slgbiDmdStSXT5PX8mLfyk4PfiNV0bJnUtRGfGLBA6GWgwytNc
         pDnapVqMDp0Q+PmcN2S4x9HDMdRP5L7xxaFrvD+GvxjqNynepwCmb8uouR3a7OMHWV0q
         cFaw==
X-Forwarded-Encrypted: i=1; AJvYcCViU2Dk0PzYemvHEGTrWPeRORctSwaaBRB9MG/69zS4CrLzEuBlOIHwvDAn8AUn/fbQ1d7YUDdA2uQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwFvDNQJdMOGvBDhjkqYU6qAT6W8mWU2CcC5LPAAhJ/ubRwU24I
	l6tX3h2Y1fHYSIpqSGjV1qvXg0f3DW3kY4Q8V2Fq0dUYnKBDQanciM9iZf/Ay80MeQCaK6MbSvY
	9Drv3h0QMpoNp/PjT1g4rchZxMYnxNCM=
X-Gm-Gg: ATEYQzzmYdqSimIt94K/aabqw89ygJCkIp5S3exfQVb4bVszXfTMgiOhvipJDYlkADN
	uC3wXqynWwST7FNwVo/a71QU9rFMCM2oHS8q+/4Q3WDq5hQAoRbAyQ+mPLFehP+w3iSdBg8cuwi
	Ya815itLEKYN2h2QlCV0KgEYIwsRt0PMluqKQRQaNO+iH5zsRoXyjzgsWroQpGFeQdR0dI+n6Ju
	VQ6L1+5vjI+jkJ7MYZL4B3+FAAPjTIrwhNyty/J+Q9rVg/KOV3xfTbKW8uI+KFoAnchwx84MYFR
	IowR2aMuWDeNYs4tEYEgtNiHWOE3ZocqyoAqJpDa9QzO2bVmGatOxLv5Fd8c9BABlT+35B4APw=
	=
X-Received: by 2002:a05:6820:80f:b0:67e:447e:d1a with SMTP id
 006d021491bc7-67fabbd5b04mr535153eaf.6.1774993014482; Tue, 31 Mar 2026
 14:36:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260329165041.831369-1-danielmaraboo@gmail.com>
 <20260329165041.831369-3-danielmaraboo@gmail.com> <177488383990.1817745.13341460240426478773.b4-review@b4>
In-Reply-To: <177488383990.1817745.13341460240426478773.b4-review@b4>
From: Daniel Pereira <danielmaraboo@gmail.com>
Date: Tue, 31 Mar 2026 18:36:43 -0300
X-Gm-Features: AQROBzAihIvYo5OWMbhelQtMqcKwyOzogv9lj0NPVePrEXpm7juUnYOpc0Skq3E
Message-ID: <CAMAsx6fHPWV3iqUvVjsez_0GgnwYv+E4umuD22Ro8t6PZTsk-A@mail.gmail.com>
Subject: Re: [PATCH v2 2/5] docs: pt_BR: start translation of the PGP
 maintainer guide
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> The "para download" jumped out at me. Like I said, I'm not very well
> versed in pt_BR, but shouldn't this be "baixar"? Looking at other docs
> in the pt_BR translation, I think they use "baixar/baixando" there. I do
> realize that technical jargon is normal, though.

Hello Konstantin,

Thank you for your feedback.


Regarding the translation of "para download" versus "baixar," we use
both terms in Brazil. In the context of technology, the word
"download" is extremely common and, in many cases, the most used.
"Baixar" would also work, but I prefer to keep "download" as it fits
well within the technical jargon of the area.

Regards,

Daniel Pereira


> > [ ... skip 80 lines ... ]
> > +
> > +Voc=C3=AA tamb=C3=A9m deve criar uma nova chave se a sua atual for inf=
erior a 2048
> > +bits (RSA).
> > +
> > +Voc=C3=AA tamb=C3=A9m deve criar uma nova chave se a sua atual for inf=
erior a 2048
> > +bits (RSA).
>
> Looks like this got duplicated.


You are correct about the duplication in the section:

Voc=C3=AA tamb=C3=A9m deve criar uma nova chave se a sua atual for inferior=
 a 2048
+bits (RSA).

This was indeed a mistake and will be fixed in v3 of the patch.
