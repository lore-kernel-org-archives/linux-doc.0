Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63926627E3
	for <linux-doc@vger.kernel.org>; Tue, 13 Feb 2024 21:40:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707860422; cv=none; b=uYYfmP9LP1iRFGWR/COBMfMj5+XvZH3/GWIaAZB9a0ipD2pz8o9I1pezFbRYuvmQl4ALP4cKP+hsBFh1feOEY1t+ggre7/1auueIY63MSSAiJQW2XB0Rzb+0b74xG6hRSLugpjd3EpN/qTg6QSd2R9RK20kS4IPbma14ukzKpXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707860422; c=relaxed/simple;
	bh=dbFTyn7f3Bl53OcK8D9X/nWjgslx47eYuZAqktCtuuk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZjBPk4NsGs7i1AeSmT8hgoNZ0WXEeZgqJmraod6BpYnElqlAxbVGZKWfEWYDVVExOchqvrJprDSrgsHveQMDijVKQqcz7+91PqbIgNZ0pv55V/fwP2kFR79M1oH2aqVaTAPHLPKwOyLSHYYOnvxOgAJtwJLcvS+VdaZnBKz0bWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Nu+rDl5z; arc=none smtp.client-ip=209.85.219.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Nu+rDl5z"
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-dc745927098so4075169276.3
        for <linux-doc@vger.kernel.org>; Tue, 13 Feb 2024 13:40:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707860419; x=1708465219; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dbFTyn7f3Bl53OcK8D9X/nWjgslx47eYuZAqktCtuuk=;
        b=Nu+rDl5zo4iTrqjqPj78xjkzT4cMscx1PPubPBWe5N2cMjjLIDO18lFH3dM1JFSKZq
         26UjzIah0cH/OWRiTC0v2MkcZ3kh8jFe6Nlwtqfe3yS7f2EmM8iPK64w3r05XpiJxnNh
         RcjkbuHwbZxK+J1HqDufXLVPgSXUQ29zYnFPWGti6W7VxOgddSZcfIBHjTpHg6wpQ4Rs
         CWQU0ydzXJNutGwSBXpJWpJ8ETw40aPHfruES92QxaBFcp90uiR8oOQRhAPE24GfTRGb
         z2LpAPJ3LVxEoRrd5o3OczWvjTD9cQpM62f2ZRG1qjiNpY+Z4snzZ+N/X4Z5j2jxhcH8
         rVIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707860419; x=1708465219;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dbFTyn7f3Bl53OcK8D9X/nWjgslx47eYuZAqktCtuuk=;
        b=Zig2jrTeNbUkeowp9TZ0vztRA+NwvnkRy0g3QYmKiTa48Kh7r9H0ehIrQ52ke4afdl
         HZD0vWdLxzTWFrK9eV1QDmb9UzzaMc4krtzlXoWTwVZKb5AVO1wukseEvOgQw0O1q+x1
         +FD5XDi+HDYMaKqyyiYEkUoYOcmRnl2nWGox2hIVyaFREEKAi52m9hq0A0BL0Fnt+1Wq
         6XSMIMLd0CHqgC8CF55lIHSh/E+nEOYamBE/xKPFLQKyo6BNPqyZuQN7hunthu7cISd6
         B8aTjV/6J8Gcusp9SxR/mKNQPhib1JKnBtSoTCkqjLhkh3dFoMk4xXnixl++HzHdsncs
         12DA==
X-Forwarded-Encrypted: i=1; AJvYcCWyb7IRekzpjtqE9EEhGz7WFJQ0nBHzFyASKG0GrrpIs3sA2k1XGbU+tDwMYalN2wGv3OsesJv2oA5Rr1ZL7knO0MQ3SD2IQVry
X-Gm-Message-State: AOJu0Yz2wzm3Fc48QyJtKmgDNctYt+hN9pccc+Qz78eyQkF7uwI7D16l
	JMwZhfYjSVNKkvhVlIIDyFQxE66dm7gb39D6hGuM4RzRlcrFAGfwC7dagnfVtyBaCG64n8u8YzZ
	6AoC9+L2/BTDKN8h/HF/v0zThTUfJi0aYO8KAZQ==
X-Google-Smtp-Source: AGHT+IG+DrTkq+6t5fDsH9BhBPiao8mavkN9+7BGb5kbh070ERv4KU9R3wW6RVskOso+QLGC3mPrRgt0YTpbyg4aQl0=
X-Received: by 2002:a25:ac18:0:b0:dcc:787:e8f9 with SMTP id
 w24-20020a25ac18000000b00dcc0787e8f9mr426631ybi.51.1707860419256; Tue, 13 Feb
 2024 13:40:19 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240213141222.382457-1-warthog618@gmail.com>
In-Reply-To: <20240213141222.382457-1-warthog618@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 13 Feb 2024 22:40:08 +0100
Message-ID: <CACRpkdYGTay1s=yK6nWXar-AoVzyZhd=i-h2Ff9xdH7_CO=gdA@mail.gmail.com>
Subject: Re: [PATCH] Documentation: gpio: consistent use of logical line value terminology
To: Kent Gibson <warthog618@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-doc@vger.kernel.org, brgl@bgdev.pl, andy@kernel.org, corbet@lwn.net
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 13, 2024 at 3:12=E2=80=AFPM Kent Gibson <warthog618@gmail.com> =
wrote:

> Consistently use active/inactive to describe logical line values, rather
> than high/low, which is used for physical values, or asserted/de-asserted
> which is awkward.
>
> Signed-off-by: Kent Gibson <warthog618@gmail.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
