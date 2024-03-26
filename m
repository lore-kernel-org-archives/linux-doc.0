Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com [209.85.217.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53C9C749A
	for <linux-doc@vger.kernel.org>; Tue, 26 Mar 2024 06:31:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711434708; cv=none; b=Ymi46H6TFWa2EC2AhGz5ofG+tu+VY9cPgPj0ZIC1krd0H03vA6K7kNvB+kCRlC50SqYFnuzGaWDWjZ1xbne26dPDQVpIE+gOcwHBR2EZWs9rA0t5HDEqQwr4i16aDUajGST40YndSCnqvFCQ6Xr/oRyecHERhlx7tbpH6fpK+uI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711434708; c=relaxed/simple;
	bh=woda4IhRSYdLKE4CGfVddcLjIWN7cR9ISpX9NT31M9A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UaJMfKFmfDQHI5vSccZ0KAK3ct6PRbEjfE65IEzy/yVYawnZVFBSNoNecRhfRtcn3Ghx2V3q29KIk5cQrPnqHrIlfW/1AjKQryjbZEYe1V6+KOm7CciQ/PPZmt/P8L6Z5NS8XiTv6kQZr9drSa7mJQ7QV3OMqpH74beVlDTXL0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wU+FD787; arc=none smtp.client-ip=209.85.217.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wU+FD787"
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-47603a066daso1717184137.2
        for <linux-doc@vger.kernel.org>; Mon, 25 Mar 2024 23:31:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711434705; x=1712039505; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=YctYs7kdin6cPDpRchLG2jgUpLaFzkmZhAQ7snqIC/Q=;
        b=wU+FD787YFIPigIHlsEDlBTG+nDEqV9iqRo258/Oxy1HSrJ+nGVDPwoIKRRYpSgrtz
         c/96LCORH4cRCMcLvBunVc6vMbHM9pi08sD5xm0wCt4jiSFCwh+N22zMT9tRq5zwpezX
         qadq8iFMm/cLGWpzc0hinHHj3c/vJr2rxI73vHlAvAl1zJ4HEy3KfkjGwGYzttXqSG1B
         HEb5eh9kMuFsFbP32wZUE1oAQGQpeTZ3Xa9ObYRC06nXPlqnbmip+hQLQmOfNmXmaHM6
         h8IR+bXraYdxMTdN6HrbS/9S1LaYQLuHAB9BE2uaxBIdyAQqcEXIlZpMc2VYaTsWpaqb
         jRyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711434705; x=1712039505;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YctYs7kdin6cPDpRchLG2jgUpLaFzkmZhAQ7snqIC/Q=;
        b=Dnvum/lELO2YFvf51zRA5I5yIbwDR1g75vV+UDmjn25pDzN5ihyjmWGNwDngRzuAv0
         sEb47balTz1iUNslCRZQ9vdnrle89zMt9lhFD+o1xSkK06rTrn4T+SUcKE8QJGeO0/0L
         iCYsKEVkSVUZRgB3qGzb6DL386wlavWpePpe7n3/p2zuWnQYdj13IIfQ9aEBs5GlzRQv
         0QmxslTBjL61XgAyb7iUK+/xXYa90QDjICrLNA5o8L9fUR6c9vLWuRm+qOTlzmWHxq1p
         /5f4lq5Cs/FusIlyIASy/hN1A2ioN/VT9VqSjn7ONUc+qkstb+DmecYAxJPjdO7fL8RQ
         oajQ==
X-Forwarded-Encrypted: i=1; AJvYcCWiwZPNnfQpP65uvFXjnY7kovrtqcLJWcXzkaDvBrGyTg9jfAMpZZ65VH8mSuLklvssNomEUoZygQRmZFK/7lPu2UfWaNtZfFVQ
X-Gm-Message-State: AOJu0YwYjBQdtM3zQaQnGaTSkfmg7shzq6s1y56T9DL5/j64mXtsjL3S
	3yaa8UwM+COqnLusW06EvMB9PSCxyTL8gsIwSw99RvIwinIZv3Yxt9kYFMHf9uw1x+zIs0CCFnd
	JJA3rjXnJTDKl1lhpvkZM5nig9IiB6sIhQMk+IA==
X-Google-Smtp-Source: AGHT+IEkqDIV1vYx54TwRHeqtyGyUvzEln98uuXYKNulu1dgHGTaEnLD9+8LwLIu4ccMpPwNYU2HKFigQiVlEzK8jg8=
X-Received: by 2002:a67:ee8e:0:b0:476:df35:630d with SMTP id
 n14-20020a67ee8e000000b00476df35630dmr7185909vsp.26.1711434705311; Mon, 25
 Mar 2024 23:31:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240325151105.135667-1-balint.dobszay@arm.com> <20240325151105.135667-6-balint.dobszay@arm.com>
In-Reply-To: <20240325151105.135667-6-balint.dobszay@arm.com>
From: Sumit Garg <sumit.garg@linaro.org>
Date: Tue, 26 Mar 2024 12:01:34 +0530
Message-ID: <CAFA6WYPghVHUG_4WkT7b00CxP=jWXfK=twPEn5DrbZabQon9Qg@mail.gmail.com>
Subject: Re: [PATCH v4 5/5] MAINTAINERS: tee: tstee: Add entry
To: Balint Dobszay <balint.dobszay@arm.com>
Cc: op-tee@lists.trustedfirmware.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	jens.wiklander@linaro.org, corbet@lwn.net, sudeep.holla@arm.com, 
	rdunlap@infradead.org, krzk@kernel.org, gyorgy.szing@arm.com
Content-Type: text/plain; charset="UTF-8"

On Mon, 25 Mar 2024 at 20:42, Balint Dobszay <balint.dobszay@arm.com> wrote:
>
> Create an entry for the newly added Trusted Services TEE driver, with
> Sudeep and myself as maintainers.
>
> Signed-off-by: Balint Dobszay <balint.dobszay@arm.com>
> ---
>  MAINTAINERS | 9 +++++++++
>  1 file changed, 9 insertions(+)
>

Reviewed-by: Sumit Garg <sumit.garg@linaro.org>

-Sumit

> diff --git a/MAINTAINERS b/MAINTAINERS
> index fd221a7d4d1c..eaa89feabd25 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -22470,6 +22470,15 @@ F:     Documentation/ABI/testing/configfs-tsm
>  F:     drivers/virt/coco/tsm.c
>  F:     include/linux/tsm.h
>
> +TRUSTED SERVICES TEE DRIVER
> +M:     Balint Dobszay <balint.dobszay@arm.com>
> +M:     Sudeep Holla <sudeep.holla@arm.com>
> +L:     linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
> +L:     trusted-services@lists.trustedfirmware.org
> +S:     Maintained
> +F:     Documentation/tee/ts-tee.rst
> +F:     drivers/tee/tstee/
> +
>  TTY LAYER AND SERIAL DRIVERS
>  M:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>  M:     Jiri Slaby <jirislaby@kernel.org>
> --
> 2.34.1
>
