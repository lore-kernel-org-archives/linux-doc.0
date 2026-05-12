Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2CB73B9950
	for <linux-doc@vger.kernel.org>; Tue, 12 May 2026 15:21:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778599285; cv=pass; b=JE7YYtYUhKQKfg8xIvD2mbQBuf40QN/ftVQtXhYu68HsLtymXC9NjO47f9OGjX6+dDu1ne3sbWWaI/nCba6U0C+sh2yMXItiDGOZODN1m2UoQ5sT4UXENm4p+5pPPK8bgftEvIL89yb+3exYUzdFVp2x3IarQw9tpBT2wGOtmeE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778599285; c=relaxed/simple;
	bh=d6Ai2oZGfRKCbsGfMKcyIjj6RolLAPQ0oieRpFAWaes=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PuBDKHtBk4hleL0LAk2XhkuVfeIVP8d4No67p6jBycWWi+u3QbpENrMwa2Z73v0OWSKLCnQlmoABnck9LaCwSeAQ6dMKjm63rB494D0fxHx5vl3zixR7me5aztHmLsJSAl9efxGw5jHOAVt/qmAzlI5cqKddyKd9X6dpNmkCTqM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Q4RH5Bxu; arc=pass smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Q4RH5Bxu"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-670ab084a39so9595815a12.3
        for <linux-doc@vger.kernel.org>; Tue, 12 May 2026 08:21:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778599282; cv=none;
        d=google.com; s=arc-20240605;
        b=Pn+rTU0RNRxvdVnN8B0dbfCP4PvyFZURTVW143Ch0xIWisMQkhjsYHTNca7nn2vP9M
         Tkw7FIrgD5b38uqA0tT9ux0PxLncXb7iNc14+zgLZ6PWi6VvR4aI8/G2/I+wqWTg7N1R
         P+3tWNfEeWSDw6KmOmJT6o+57ODRv3aeyTiymkpAinu0WvdMg7ZmU4qB/Wf0YRYb4eoT
         ajH+p7TtAaX3r8H9hR48yeouwAHLUBVqUnVxMWjDwKf+cZwPT/9ZTmeapkT5kYWQK1dz
         6zGzianRhfpFMACoY0ijxjiLRMS1NG5ju/0TfYvfXx+367xdHi94dtKR88+N9vSjodPS
         5wIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=t0ujevqgQXDHfoEPkvrwGuNuwg0PASas1+bZlJQ1jQU=;
        fh=oc1NF9jHugqh8OLVMSeT32goVRoddq5e8WEvZiT1KJ4=;
        b=ZGiCD+DQazNcXjuKzK37njIOYodRyZ8jWxips2MWsZgA7IqmtF0biklCK3QdjqHE2y
         LFBl+2Wh/H5SRLNURjkQiKuf1WXEo4mBtnSMECfiTiadRzEDfZjEF3DK93WozRf9hRyI
         tp1oYm4OKO85VxHByDYs7YcnHz6TtpABaabImKUhqoU/O6B5krFuQF9XiuA0zYcyuhGB
         QL5ROyTTOqdhHZ+IrU1uVhoOMngWdjMgOPjvQuW8mrwB80LfaafX+Qcn5PGzRn+hkjtn
         w2rQ2ZSqJRSNJiFzIzcSEEZnHaxdFHXbc6odQ3oeXmFr5wn27fSSAakGr4eAfGokJZrg
         a2mg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778599282; x=1779204082; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=t0ujevqgQXDHfoEPkvrwGuNuwg0PASas1+bZlJQ1jQU=;
        b=Q4RH5BxuUtXZ5bNxuocVfhVepTorYWk17UQerZ1sE267yfrWRTVhDcT3u40DBZzyuy
         fju/g9f0gnWEaDM0ruVcJ/bOE4JrWJFIlGWN0Qzoidvp7bOHz70iit+3yNsCnEm2Je3w
         Y30eUW9JZYdgEtpZq1prESK9fOrr06Wczjg+4aRtry3e9JokzBdfzkgfE4lokgE6p7VD
         qZzHoT0FiAgiGar+7st5qVCh0p2LE2T7YMuOpQbJPloStKSO/Q5BrPNZUtdMDtq/7G/C
         +wZhh/7UNRkszwWrLb9UOmnEuppG9f8RnoB+p6piyNhdvOeZl5/WMwijUVRRd/DFYD84
         yUuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778599282; x=1779204082;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t0ujevqgQXDHfoEPkvrwGuNuwg0PASas1+bZlJQ1jQU=;
        b=oKdrlWSzSxvJo1MYcQZikDt/oQWB8lDHYbOZZeycBWgUJP2kMHL/QUotbdo40hoA0m
         YMT6mI3CJNWKEIfs+JFZrCtoem3aocFj02A3d16tKgUMZRAuSSEqj6JoHf7azEG29rVS
         q7oEt26rjwLGQGrgkBWhRdAL09Q1GYRatLuDcMoIZYUXnobFQq38Uozn9EQcH6OD2K8r
         D2TFwW9yqTGknaNZiUsV1wYFv+Y8CnxwLlm9jqpa0k+wQbThd9eoQM0h1/32NmD0kZza
         gzLhsdRaCxAn19gw19Cyx2lnncIYxFkgG45W1/3e/MqXqKc0mnb4gxrVFaglM/S4yJpZ
         Ht4A==
X-Forwarded-Encrypted: i=1; AFNElJ/0CFP/CydS99Ty/Irx2QFcYEzkiQxc076V/GSPTN5sNONnZMCLYoDxvEHa+uUJA/4/ycp6oZqhqbQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzPdO7dKXG9SQuBiZCKyZu5pcPu1gEU8VFKmLEXIBkk3gyjjDvt
	T4eJBiDNRVVClbu3KQ8byosqO0KdYWnqIP2AIqvQAVQLsKH4QUjNyNuQpnjGNUcffUaZS3AYGxB
	gK+Qc4Y2pci60XlUUzStnH8M5cK7pj9LIBeZriGkyzA==
X-Gm-Gg: Acq92OG+Kz81it7MVNTIliovTHBWsiXr5g/reVXY8092Iib63UNrmV0/uaWWrq0vPKq
	5wZNYgIwSssN5z8QACZYzu1+4sT6WIe/VvjW2OATwmbBK7+QMJzGZQ3a2UReAZTxPV6C7KMXFv0
	KvJ+PhLPlmCJRatAFo0frwWmCmM0p9npNqP6/62k5GNhplPpa8r4rx61UDr28y/PLWVOrU8KWQl
	a9qi+by83BkqfZwXhH509fsCNuvAjCbmWXOtpzXyULHhH9ZVcVbbPTpjMz0h1uAdSwTGJ1c4arH
	gk/OQkiwd+zVzZSFCacyheq5E/PgEOufOJk2yILIWQ==
X-Received: by 2002:a05:6402:4315:b0:66e:8ca6:e79f with SMTP id
 4fb4d7f45d1cf-680cf3642bbmr2086182a12.13.1778599281971; Tue, 12 May 2026
 08:21:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <472f85bd-42c2-40c6-abfd-b76924797069@ti.com> <CANLsYkzt9xUczxSU28u-TfZAAjr0ufZKXAj8Eqfq=45gufXW3w@mail.gmail.com>
 <f7ef3417-eb84-4467-ac72-a9bc8b0c81e8@foss.st.com> <21de8440-adf7-454b-acfc-06e50882e075@ti.com>
 <4c526816-b127-43e7-86e9-eee4dc1152bc@foss.st.com> <c6f68ab5-271a-41ed-b285-75b739f1edd6@amd.com>
 <87850f70-5275-4393-941f-d01146a9cffc@foss.st.com> <da3b79b7-9dad-48cb-b552-cf6df445899f@amd.com>
 <08c815f5-ccbe-404a-95a1-a549aac8a55d@amd.com> <CANLsYkz8HpM_8eS7DjN_jmYs4T7P9xY0jYmdiAx5WO=_1zvFpQ@mail.gmail.com>
 <4ae35920-2539-4b12-8dea-efd407b8aaeb@lunn.ch>
In-Reply-To: <4ae35920-2539-4b12-8dea-efd407b8aaeb@lunn.ch>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Tue, 12 May 2026 09:21:09 -0600
X-Gm-Features: AVHnY4LT22IVt808sLwJL3ajF9BoO5QglODlYYWO0TdL8CMLNQDb8uF-T1sOSus
Message-ID: <CANLsYkwBk0KbN-k9ce+5=oT+scdZ3nU5AOr3Fz4zT=0AFzghDA@mail.gmail.com>
Subject: Re: [PATCH v13 3/4] gpio: rpmsg: add generic rpmsg GPIO driver
To: Andrew Lunn <andrew@lunn.ch>
Cc: tanmay.shah@amd.com, Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>, 
	Beleswar Prasad Padhi <b-padhi@ti.com>, Shenwei Wang <shenwei.wang@nxp.com>, Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Frank Li <frank.li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Shuah Khan <skhan@linuxfoundation.org>, 
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, 
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>, 
	"imx@lists.linux.dev" <imx@lists.linux.dev>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, dl-linux-imx <linux-imx@nxp.com>, 
	Bartosz Golaszewski <brgl@bgdev.pl>
Content-Type: text/plain; charset="UTF-8"

On Mon, 11 May 2026 at 12:18, Andrew Lunn <andrew@lunn.ch> wrote:
>
> > Arnaud, Beleswar, Andrew and I are all advocating for one endpoint per
> > GPIO controller.  The remaining issue it about the best way to work
> > out source and destination addresses between Linux and the remote
> > processor.  I'm running out of time for today but I'll return to this
> > thread with a final analysis by the end of the week.
>
> How many of the participants here will be in Minneapolis next week for
> the Embedded Linux Conference? There is even a talk about this:
>
> https://osselcna2026.sched.com/event/2JQpx/building-virtual-drivers-with-rpmsg-key-design-principles-challenges-trade-offs-beleswar-prasad-padhi-texas-instruments?iframe=yes&w=100%&sidebar=yes&bg=no
>
> Maybe we can get together and decide on the final design after the
> session.
>

I will not be in Minneapolis next week.  At this point I think things
are converging into 2 main takeaways:

1) A serious refactoring of the protocol to include only what is
available in the virtio-gpio specification [1].
2) The specification of GPIO controller number in an extension of the
namespace announcement [2].

Shenwei proposed embedding the GPIO controller number in the
endpoint's source address [3], something I'm ambivalent about and
still have to look into.  I also have to read Tanmay's latest
comments.  I'm hoping to be done with all that by the end of the week.
With the above (1) and (2), a new patchset will be required to reset
this thread.

Thanks,
Mathieu

[1]. https://lwn.net/ml/all/afjyH5JT0JS2j0L5@p14s/
[2]. https://lwn.net/ml/all/afzIABSh1xtMEGbf%40p14s/
[3]. https://lwn.net/ml/all/PAXPR04MB9185BFA6E7375FAD0B15B021893C2@PAXPR04MB9185.eurprd04.prod.outlook.com/

>         Andrew
