Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8520279329
	for <linux-doc@vger.kernel.org>; Sun, 28 Jun 2026 06:23:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782627806; cv=pass; b=MVAZXBoVNuc5QQt7k4CNRRp9kpMVjsNROK+WfmpT2UtORxiUfIAWxxUjw2bHisPldTHq+BTqRy3yUy0ayGgcowvvRVXvI2+CyVVxgimBAUkg6sAfmOgBEUxfKYSE7pBi5n1H+ryxCyeanRoo8LohrnYsYILR8DwaSsztIyuWrg4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782627806; c=relaxed/simple;
	bh=vTzRYgBgZOamBxw1WiYenNhfQ94/nUWzB9wfTPJ1rsQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bXsWyQasjp60W5g0bm8ZslqHqddQ5U15v7bUrmVpXOfnVmWrfpFalqQIBAuj5cnC++GBY+p7Woe4vYBZNfi6hws7kI4gMo0rWjXFSpzSrIuL23TrUGa/+TYwWh4oPPMXyw+TtYSy6snWVNSp4IKdot8zQrMEqk57k3dbMwREMBA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EPNoA4iQ; arc=pass smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EPNoA4iQ"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c1226a096a2so241938466b.2
        for <linux-doc@vger.kernel.org>; Sat, 27 Jun 2026 23:23:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782627803; cv=none;
        d=google.com; s=arc-20260327;
        b=B6hrqm83OvqMwVS5Z3wRtEsZz1EdNMPUDNRAtt+/S35ZhDNaS6aVASBfmVmUeulvVl
         wUpMvWe0FMaXsY/9KqZAaZJBU0mVHRLTRyyGyd+DA7WTw7NreollcCU6bKreUIRO2WJn
         vOnnAvSLcMbKJ96+5+Ya6h1BSd88OIatY8pStMRFu/sFoaxHSWXFDdFrMe39yM7T1YT6
         ZCOW3IG8HtJQMYuT1rJprt/j0zly1GSzwmt76VpJ4G2fCHR6neYiDaNKF2dig+18tCOg
         mGinhFj9qBwgAaktKk1fxyp8R0xdDsZPS4jEKTxIdbPCNvANTny18+zMAbm/dW5GIyuX
         trog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vTzRYgBgZOamBxw1WiYenNhfQ94/nUWzB9wfTPJ1rsQ=;
        fh=qWn+/osXs0iCD0RIiWTVuTymj+w2uqG5vi6lJtDIC0g=;
        b=QEXFjIsGWEtggpoSlqtiOc4RUJAaYPZ2kShHRQr8BfHz6FH2gzWmqmXwBi+xGPMJq/
         cYDCMvW772ll5p6jkP6DRBQKBtk5PV/K5hxLU4N6gYxybC5aQ+18yGKSibt4TsnhjvzP
         MLZWUy6jt/fQPEA4gc/G8kZERVc8e8Sj84ykGVT8XKXPTHzOKe6kYRFZVMzSX+HilWvL
         KGmjq47ZcPcZ5dslt1Ik+mtjRaucp0wDdrnCjSGC6bhIu2ts5UQwvc6pcfZaHzMTwvBV
         4JuGElpZljiMt+Cjx5jdi6Zr7r1zD+YJjKz8FMTdG6oNvD7nurpbtgSDIR6OiOWJHEnl
         iCQw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782627803; x=1783232603; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vTzRYgBgZOamBxw1WiYenNhfQ94/nUWzB9wfTPJ1rsQ=;
        b=EPNoA4iQlIzz9NigehdKIO7AMaJMUw0QzNlWS1vlbWdOdFHpW7M2PSJzvBNlZMYCZ8
         BWukGH8w5kvrwt+DZwyMdnHLJkkmFQaPIfpVntipk8PHVsN51Gqb/KhBHzuznggYyS1w
         zAcBmcfyLPtQN99HcTfOTse/4Xe434Y+QyaLDGqMBRLb0nuiq7Ps/UnErKc4+auyBj6x
         hb+WZsIVuc2ujVZc4fASPRLdig/MCxW6S+AURcfiYien3/iIQ2wICPb7fo3HekdNCoVd
         eFBZ7rn0pl5ZOUhcYRVNzKOGy4McSm5KpmmWSDCVWTRZ7/xv+jqekHj8Jy/0KlaTm89u
         Mvnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782627803; x=1783232603;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vTzRYgBgZOamBxw1WiYenNhfQ94/nUWzB9wfTPJ1rsQ=;
        b=lq6LL2yIetlqJVAxeQS13KfyOlN0N0IP+w2Io3Ubc0pHNX7JhscPSIk9+acWJDHWxX
         nVdYZZ7RU15zHMI966j1K014kO+jBXRYAco9yziDU5EUwBDTCFNZ+A3F1eYOKMdZ4a3/
         9oHmaSZKhXalaI9ASGyuFiPD51Ae+2TQty2tbAiFnXe1ILgJg1RNWDKULoUsAboFyloQ
         Y81X9VG1EFF9NY8Y+2JChjtGii7a6kPOd/tMpJ1f9BzAbw02j5mKShwOgbHBZzOCwPS2
         yHIWUQ/btq17H9lUEFAi+9DWOQeCr37RMkv/QXRMWnXMbnE98NJmYW0S8rfKm1eHB8e/
         YxaQ==
X-Forwarded-Encrypted: i=1; AHgh+RowGUvUmR70RjFVGTchR4cTHhqgcfSBqTdpOFXILM2K3eKm/+1OsjSE871i3fQa0xuLxk+e9isRt3c=@vger.kernel.org
X-Gm-Message-State: AOJu0YzT3T3j4Cj1R1H+NSFCaTM/kKuyM7OQp8nvprANUMuMvpTl3Wlv
	BgjWO8e6pk5k+b4Zxrl8qu2FFGhTaZu0PtvjW4fAGBA+z2RFdoRXUw6j9xgHf3XfwYyVVO/v1+h
	UXKDXKqkXjxkZlOmx+PMd83nTM1Yyolr7yJ6/yHI=
X-Gm-Gg: AfdE7ckA6OgC1av3/fFOQ0CzBDY0oqdTyEndj19OWgSrC9snr/eeR/8zt6+CECdFZJh
	3thMZJrgke9w8Z0hrkZkq6+nq5wKzyDnvc4QnW7XCrFNTetpWdnopJDyogjhT3KVY77uRfEaRBv
	nYEaJCRoH4SIBi1SC0BMhZHzkbwGY1MD0BA104+uXTJyHgGOjOb+S2U8JxtORJ70Snc+RiMf3FQ
	dbu3ASto2rkHSox05R/0PmWXfIyQLQre8+AM1K7p88Kl5BQkohVpKPHu6KWdxyNuy8hJNGLMdd7
	uVHRAis=
X-Received: by 2002:a17:907:7b99:b0:c12:1d42:6cd1 with SMTP id
 a640c23a62f3a-c121d426fc1mr437953166b.9.1782627802896; Sat, 27 Jun 2026
 23:23:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260623161035.5792-1-nikhilsolanke5@gmail.com>
 <567e8866-4308-4e5f-819c-fe778dbf74f8@rowland.harvard.edu>
 <CAFgddhJk0EYG71fnKdio=RHC-cH+JmL-EZ7-oVD-LdHoa2TBSA@mail.gmail.com>
 <5159fd69-dddf-4073-a8e7-95fa77de0b7f@rowland.harvard.edu>
 <CAFgddhJ2HeJ=oTBX_axMJcgJq7GXH9abe+LH+x9NGekGO4BMyw@mail.gmail.com> <eb0dfd45-91c5-49ba-a297-b183dbc52c8c@rowland.harvard.edu>
In-Reply-To: <eb0dfd45-91c5-49ba-a297-b183dbc52c8c@rowland.harvard.edu>
From: Nikhil Solanke <nikhilsolanke5@gmail.com>
Date: Sun, 28 Jun 2026 11:53:09 +0530
X-Gm-Features: AVVi8CdvfZ8_HcAxzQ6YMXiRMTaitnhhJ0mCfb8fG-r-MuhUVjsbTL_143EGKF0
Message-ID: <CAFgddhLZ9SuOzG_6mW09j9aDkCp6TedpNkzJ6TUD+DnR3TDLKA@mail.gmail.com>
Subject: Re: [PATCH v2] usbcore: Add quirk for 255-bytes initial config read
To: Alan Stern <stern@rowland.harvard.edu>
Cc: linux-usb@vger.kernel.org, gregkh@linuxfoundation.org, 
	linux-kernel@vger.kernel.org, michal.pecio@gmail.com, stable@vger.kernel.org, 
	corbet@lwn.net, skhan@linuxfoundation.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I need some help with the USB_QUIRK_DELAY_INIT part. I can't figure
out how to make it properly work with my patch because of the
following reasons:

1. I don't want to move it to the top because, from my pov, there must
have been some reason for placing that quirk where it is now. so i
don't want to mess with it.

2. Regarding my idea of adding a condition =E2=80=94 so that it doesn't cha=
nge
the behavior when the quirk isn't set =E2=80=94 if the full configuration s=
et
exceeds 255 bytes, we would have to issue a 2nd request. In this case
the existing behavior would be more justified.

So, I'm a bit confused about how to implement this properly. Adding
yet another condition to fix the second case doesn't feel right to me.
It would look unnecessarily complicated. I would appreciate a bit of
help and advice.

Thanks,
Nikhil Solanke
