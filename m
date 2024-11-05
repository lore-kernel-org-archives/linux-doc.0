Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F4CD1D318C
	for <linux-doc@vger.kernel.org>; Tue,  5 Nov 2024 13:01:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730811666; cv=none; b=aSy0ZGKCqidh7klABq0JNX96FL2xKSNA48Sysei6ElYwOKlu12eeAwWRphXMhJGJ/yat2gOI1TS3yPiSQsXD0Ce0Cegpgyq0rM+aYzA0pZIX7muyAwcgGrZR6QyTIE8A0n5fwcC3nhqgxjnib5dzA4eJeuHH+55aFqA4qO8KHgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730811666; c=relaxed/simple;
	bh=D0WTw+MUtdg41qhocX1Oe1iRLsKsP8vyHesg6BiksAA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bMGRL2DLkTusUyMOA7ecS94knb8CsGq7i9ThGqC8KkvhVG/mjX1cC11Q7lXKDzv+hvhq02S2t29eCVvEvgXW659QOts9g74104agO/gMkctg06ZmPAlkIhJgnkHSZu6yQWkHyWZ1S/BRQ2rnalxllISvSWP6q0os85BtKH+3QS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pMfwgyvr; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pMfwgyvr"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5c9388a00cfso6351865a12.3
        for <linux-doc@vger.kernel.org>; Tue, 05 Nov 2024 05:01:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730811663; x=1731416463; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=D0WTw+MUtdg41qhocX1Oe1iRLsKsP8vyHesg6BiksAA=;
        b=pMfwgyvr9BHIvYoDsMTV8qvik4euwFpld8TvEJQAbogrITOmthop4cO78gqWWhcymj
         ZbYGMEuUQqIl/biCagL4GOSavABXbj+JnQWGRuzLNIiQHH2gR73cCB5hjTNtmhx4AO1R
         3aDT8XzQ5CLZZXKEHP+z+w1lrNTFB2jvokBlLbwg7miir+5o2Ypax9uN7EMeSNP50GFw
         zq2nU8Aefh6jbF7r556J2jTdI2ESJVvsK/H3EUh3ZugjQruC3jvmTWubzzL9jlytO8ZY
         L3RrM0d6cL+/s8PhlUYkTJ7rILagsxJwPObDun5A+fjc3iDo4+eYzQPjEY9dq+gzAyJ7
         ZwjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730811663; x=1731416463;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D0WTw+MUtdg41qhocX1Oe1iRLsKsP8vyHesg6BiksAA=;
        b=etz41tL8hWWhWr+RE03M5FtCR6oPgaFrk5j3gF/pWjjj+s+uOHSuh8cT2M90iqubjo
         kNfe01TA9NMpvHlncN4w03AdEgEB8c+GVZ5cZOlDknxV/cgDJDSQa9LPGUwUfDurRzq5
         5aubM7qLhn7oJYuzouCfYuK/RRK24DoEaQvXv1xvJ1u4sG/RkjiVHP7J/iCiljHNTvHS
         8/ZtaiOTYoOH+u/uJeuv44oWCfe73++8ewG5TbwT2BKdVwv7GFxZUgJu3ZXoUlHm+OTy
         Lq7N+SFEnKE13tn4MuicqJa8SHS+NMU7ku5crIK/HI5wCoAEu9P/kiQHIaBb0tBi1bPh
         V0pg==
X-Forwarded-Encrypted: i=1; AJvYcCULoJVHCBQcFTASdTKManLD7vYOjmZHvNXe3+MmgzYdD+8hY/rlUrAxnFrA6tctwJSjtXh+TxGs6vU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwyZODMOjgCvJ3qW2KLR9o83h84ydOXAC+Wykeinf1Fr1+8TIc+
	9MUaPjrh7oikHqIdvbUsZtYQGXhIyp48bOHN2+9v/ziVYfCK3bFo8ReoH8/o4ZyVmfIlRk2AA6+
	03pNWbo1tb6yHqC1nLehhK0NvEsNF+ecmTq4uVA==
X-Google-Smtp-Source: AGHT+IGdKsOe4uUI+pQsDjBeFjVYPEKnH5Eo7FvRYwbGqpXjSLbX+ykZRbMa+upNnN9HPEwQU7Vdq7xJqtyj1W3FckE=
X-Received: by 2002:a05:6402:3508:b0:5ce:ddd6:d100 with SMTP id
 4fb4d7f45d1cf-5ceddd6d143mr3955032a12.32.1730811661239; Tue, 05 Nov 2024
 05:01:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241105004749.83424-1-yesanishhere@gmail.com>
In-Reply-To: <20241105004749.83424-1-yesanishhere@gmail.com>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Tue, 5 Nov 2024 06:00:48 -0700
Message-ID: <CANLsYkxKteXHMvG3GfPOKz1G_NfQV8D0D4JxYeF0ZmiYv=Mviw@mail.gmail.com>
Subject: Re: [PATCH 0/3] Documentation: remoteproc: update various sections
To: anish kumar <yesanishhere@gmail.com>
Cc: andersson@kernel.org, corbet@lwn.net, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
	kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 4 Nov 2024 at 17:47, anish kumar <yesanishhere@gmail.com> wrote:
>
> V6:
> divided the patches for each section as suggested by mathieu.
> First patch is updating introduction section
> second patch is for new overview section as suggested
> third patch is for devm version of rprod_add
>
> V5:
> based on comment from mathieu poirier, remove all files
> and combined that in the original file and as he adviced
> nothing with respect to old documentation was changed.
>
> V4:
> Fixed compilation errors and moved documentation to
> driver-api directory.
>
> V3:
> Seperated out the patches further to make the intention
> clear for each patch.
>
> V2:
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202410161444.jOKMsoGS-lkp@intel.com/
>
> Hi Mathieu,
>
> Hopefully this time around, I have not messed up
> patches. I have created three patches.

And the patchset version?

> Thanks,
> anish
