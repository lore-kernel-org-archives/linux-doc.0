Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.181
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795774044;
	b=BIWBtao0jOilbUKzoxc+UGmoHVgITr6/Rfjlm6FSvk/CH8/n55yYQo72RudB9DoE9yDX
	 y6npr6lh75REHwpsTvoJx9Qi8Ax8iwa9CyEzMS15+fG5LvhEOYBxAuSyl0lgnLeiQookm
	 oQqNuArjR445Mvg+RLg3RiOBz6Bvk7DZm/jYyY6a3NJ7mfg4EEsJmqm1jEzphFpXvbZuK
	 PqJ1bUWBx0nmAiVEESuMvPioOfcTNpwGZOVEtbQObfunTA1SNRcbyot3iNalgiIVd6+5x
	 7TiqktSCTjrPu5BNzrzmukJwy639gG34mz9+A83wCNF99/voLIu13F0lrbRUFTeLJGQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795774044;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=M1iyI/0Mp18Cb7k2NsVPz111uBIRPwyZKwcAIivI8ro=;
	b=vO7oi0gbNVz4nVS6XR/84lIY3jou9xQBpFfOPj1hgPBg1gL2jK07ub/Hw/iYleDyj/Zd
	 f8OuoBYOhBrQLH3h8f8QlYZ/q6qRKImGW79AuqgsEtDT/7KH/vTqSV2xsvvPi7/i5RYc6
	 bDmUTm6TzocpvQRqrVOuo9TtWo/rrTckpbsWZk7xrwE1+sZSelM6qqH5KO2RdYfY9Fgtp
	 2ahVC5lSlPmcaeITL1HsFDLIbuKJzL6XnNtfTRzUQVGt00bznscekfLQIOkJet+diSjGF
	 PPrE+Ibo1oKCw8ws4UyEOQHL0Vn8rlNKY+gw6LhyagRso+w+oRe/OX4UnkRAfWUS3sA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=viISSJNK;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.181
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76051606A321
	for <linux-doc@vger.kernel.org>; Fri, 27 Nov 2026 10:07:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 76051606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=viISSJNK
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-3ae85add512so65726511fa.0
        for <linux-doc@vger.kernel.org>; Fri, 27 Nov 2026 02:07:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795774042; cv=none;
        d=google.com; s=arc-20260327;
        b=iU8N9GIR1cV8shyQBHhjhBUx3hgAGX+LXGHGgxezuqjUxx5kBXHONiUHVfunEHNPxa
         HI5l1ONUyRZbGQx6PGj2NtyvdS/PepyeXSKP2J+oODMcFWrvEdh0WHF40yn1mmnEw075
         pp0K3md5KIITRTmtnjU+cxyWzfzNu5yc9RtQufdN5xDAYX5E0b96+qqc26qOGV95KMiJ
         RuNOBM321BDxzWSARU0mX99DiMRpASz5vaJs4eDpmjr/YIcXIoU8bOACkNbLnzPGC/HM
         oOJSOYrmFFQ6NAiLSb8NnG+tt8TAQIF8kcT5odnOWZFbSlQJ9q6hguGL6KL+Dty4QVse
         SEcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=M1iyI/0Mp18Cb7k2NsVPz111uBIRPwyZKwcAIivI8ro=;
        fh=yLdOUqP6SClwBsP9+TJKJz+mD/puX0lD8HBpjopv50Y=;
        b=JwpIT7mfoc8LAt1wQiXiz+XMvyqWkIvaCRS35vxpbn0Z3RFBYCBqUF2D4LTNeGayM1
         CiTu2WTZdjRDlysYDEHYQSUJTJEn08tb/fV2rbqiJVTRFCpfT3KpPbm//bcMOoleCQ2/
         1akefhfpwI9qdpOQZIEnN/9lLm76MijW++9K9wc4/bHVUrRtC22nydWDUZZH8l/TjChL
         3sBUc/4VPZBkZyV6jJH80l32Huu37tnZUWKH8MN4OIEK72ELHkhOVgAsIB/fwvEJLeJ/
         p3GgNOsLAbbslHUwmt1NnEUpMDR2wwitBjWidZhPsD1soaBLp2aPPFmbhL7wd4Kl7Iey
         d0fg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795774042; x=1796378842; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=M1iyI/0Mp18Cb7k2NsVPz111uBIRPwyZKwcAIivI8ro=;
        b=viISSJNKKrCfVwgnqpcx21D5A8sjYsUe1xgoHbLgF/1WiqVhFBhinvCjHO3hb5SdGi
         DDjy+sCxNpLd0qJPAvrpD9ieDpS+Zx+l+bbrKVtgq7b5uQR+8+qlgOW5rUzfc7VgHQAf
         yLq5uRXkAQSsAlnVGHeJKNh709/p4DwEsY5RriTwk9+pp3Wi7aKM+kjKmllDH9Bi3++6
         gvOMnjwO+ztJzqSX/DeIQYicCdCzEJkSamEPekUsvUnBKo4eis3Ft4hIi7kmnpAf4A75
         TsKnET2Kw/eOBh2scDOAHP0Bxy5IE6g6sCGxzVXj7guCtWF4Zq3liE4xCqczhwqiR4bT
         dJDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795774042; x=1796378842;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M1iyI/0Mp18Cb7k2NsVPz111uBIRPwyZKwcAIivI8ro=;
        b=gALV41mDck24bwOX6lsr034nobj7sN6+ro0qA2hPchKWv1lLhodIDycnoDAX8M9ppW
         0dBa2d+Ft11M3XnYptviL9oIE9hKg4UI8NFNcCGLuqFsgqnzqzUn96U8PaRE4QAh7onV
         dVyEHUr3qAKZvRbsVlcIb/pUOHWhqdpzJ225wM6sAKQyxdQZVTdRyumqRcHJ99TMca32
         1R6mTa/M1DohKYbAlcnVjFHd4NJBhj1ipcJqImvyWULAOf8WIocnERu29Io895lQowIH
         FWhHX0uR4WIDGIENGuZc4P+nlh2M/1WVoLsEzII0+w7ZJvk6bi6fNCriD3djNAoRr16t
         o3+w==
X-Forwarded-Encrypted: i=1; AL+hErGWLFwrqRc6EROAikGRBRcch0NjfHxXuvFe0z9oCixNRCZTDke3WRPpGTQ1EnRx0eqnXRmBoMm/zwU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+eVSG6LKizbwSa6Ymf1B3BqLXtPPZ1DQltHEQX+IU+Fp6m5+A2
	0fMxM8352c8M52osV+7jJExd8xq29ZhQnuUu/BytVGsuW5ufyXjkjXImhVP7X1ud/qv22D+9ZmB
	/+4eXFCfM6kMsvMYtg1KkA5ARC4EFo88=
X-Gm-Gg: AZFdTZeDTimXx3BAqJIFh9F7tnptjQ/oEZfFLGybnP6FQwWlq4Cab4T/MShuTB4ravS
	8owpqvD41nLmahzET6ZMPpE6E4bvy2Q00fGn+mjIU+bUax/ONLd7qIZTVu4dmi+xdR6FrapPtxR
	dbxXz2d4rh1yzIsyNgTgXal//YkoQJzM/KAfP7eVgoqqAbH/Hoxt7nXhUU9dGwO7jKbQn0Zb5KX
	yAfdaABG24kOw+9lD7NyeiEGhmFyXTOi9yRSmOvkM75QFeaV1h9RZFwGg+/KBgGNFKoK+9UhDeR
	RHhBLTReTUeJFlDGF9X81bxiFvwqzouKqBLAhkDkTz8PfRZpN6jhKT7Wrpsv6rYE6HuwAliFWQv
	VYnJtM5c1v5+BsZpl9ZDf7qtqWljcJz5/lOP4E+nUYRhMNxy1/Jfo6LdiDuddlfFYkCJvQOQsbJ
	SCQbQpycmbi7IThDKddl3/XYLz+zDh0Tg=
X-Received: by 2002:a05:651c:a344:b0:3ac:436e:4084 with SMTP id
 38308e7fff4ca-3ae7f9b2126mr75337521fa.4.1795774041405; Fri, 27 Nov 2026
 02:07:21 -0800 (PST)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261121-at550-rfc-v1-v2-0-b0309d0789b2@gmail.com>
 <20261121-at550-rfc-v1-v2-10-b0309d0789b2@gmail.com> <awQEjpz2572Y9wsB@monoceros>
In-Reply-To: <awQEjpz2572Y9wsB@monoceros>
From: =?UTF-8?B?57Gz55Sw5oKg56KB?= <yogo.0917.sabu@gmail.com>
Date: Fri, 27 Nov 2026 19:07:09 +0900
X-Gm-Features: Aa3M54qQEDKdWrHJxIfU9kb7QVNH017aRUBBckb6jwRibhb7ERXk9zIWhsR6uho
Message-ID: <CAJGK9zbBc94aMeXLuUZXrPOT+TbcD6HAejS1PgaCU-wO=ysY0Q@mail.gmail.com>
Subject: Re: [PATCH RFC v2 10/13] mmc: sdhci-at550: add SiRF AT550
 programmed-I/O host driver
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Ulf Hansson <ulfh@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Russell King <linux@armlinux.org.uk>, 
	Arnd Bergmann <arnd@arndb.de>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Linus Walleij <linusw@kernel.org>, Drew Fustini <fustini@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-input@vger.kernel.org, linux-mmc@vger.kernel.org, 
	linux-doc@vger.kernel.org, soc@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 23, 2026 at 10:17:35AM +0100, Uwe Kleine-K=C3=B6nig wrote:
> Hello,
>
> On Sat, Nov 21, 2026 at 09:43:20PM +0900, Yuugo Yoneda via B4 Relay wrote=
:
> > diff --git a/drivers/mmc/host/sdhci-at550.c b/drivers/mmc/host/sdhci-at=
550.c
> > new file mode 100644
> > index 000000000..11c9de0c9
> > --- /dev/null
> > +++ b/drivers/mmc/host/sdhci-at550.c
> > @@ -0,0 +1,51 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/* Standard SDHCI PIO only: do not assume CPU/PCI DMA address equivale=
nce. */
> > +#include <linux/mmc/host.h>
> > +#include <linux/mod_devicetable.h>
> > +#include <linux/module.h>
> > +#include <linux/platform_device.h>
>
> <linux/platform_device.h> already provides of_device_id without the
> implied dependencies you get by including <linux/mod_devicetable.h>. So
> please drop the latter.

Hi Uwe,

Thanks, I'll drop <linux/mod_devicetable.h> here as well in v3.

Best regards,
Yuugo
