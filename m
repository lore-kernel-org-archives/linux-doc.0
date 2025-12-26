Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E63725771
	for <linux-doc@vger.kernel.org>; Fri, 26 Dec 2025 02:47:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766717225; cv=none; b=fV1JWAxhI9Db7RC0SDWsoZGMYpP7pGJnirrcmwn1htOsFO5WH2mELGaA4oaQSTbpyCBeQKF2zrjJdiA9VckXRfulYyn6dFMFXaO+o62sg4yNJ2WUJEIKlxlVUJBLXFn1aLITUNIavBTt2unomHQrztAAwm/owK3gdgSUzzCgFdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766717225; c=relaxed/simple;
	bh=xJiiTZNZCL31DvVz90Wx0EslqHC3mu+ygpLgc6tnU0k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WROZxzhxBGSUbcE4x6n3xP2JDCgQ0HHiHehohR4PU3iY2aJTLp+ekp2BonDUbayzJiGMac30EGi3fuTI2p2vR8bJJkJglKJUS3jxUxUT0CyetORPDbi+7XMKldvT9MDHNoirrEwxupfNmcD1MrU5YH+N5CnmSoEni98MCvDpPsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IYxrDFvX; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IYxrDFvX"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-64b92abe63aso10820392a12.0
        for <linux-doc@vger.kernel.org>; Thu, 25 Dec 2025 18:47:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766717221; x=1767322021; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Sc6VFXAWg98c93WjxpNUKPTmn+y7MpCFPtCQUe/fiGU=;
        b=IYxrDFvXirNlaYZhCO4Ed5lMBHRKYrqSPdbo4a9almOQ3pVoMtVuG5z8iMyYV+0avf
         smA+2iCugSw6cRA3nxnEYBF6qdDJ6KvdJ4j2c8imtZ4iv+OuIoqoAScgpemvfsIUL3s6
         i+UPCELFVMrCjIg8RUiW4JPIKM2Q2N3oLqKLZybrV78GK/jfBjpjYmzfd0AABdpAj2zU
         87RxrifbZ25QHGDI5cRpfpbqMBvX3mHxcvPwdGIrLjkG5+29ssJ2xQYF8agZVXuYcJSL
         YvPh5d2mFWP8lcCvPBXZyC0Hwaokx5y/mVOEW9A32kh/1tzA8UdWZWPo5y7MC9E4M31O
         OmUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766717221; x=1767322021;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Sc6VFXAWg98c93WjxpNUKPTmn+y7MpCFPtCQUe/fiGU=;
        b=NCY3ePZ0UWY+xopxA//sCXmHIhId2P89Ig/f5ppqgoUP6FO3eultaMwT4eCruO0h33
         Rjq+HlfGA1uP4Hal5r2lLwN6CfLhsCc0LoAyZzYCuWXup8pb821lPml65+H4KS761fC1
         jz9c1urjPEjftlCyEBHwKKSWzrbgwcq18rqCv1VTC/A6Vbsn+y0OUcyKdObg0aiX6GsW
         3p/7jI6hMHkyJttUFqvzdGv3wV1oWlC6yzutRnDVGpgznR8s8iXah1W5juGaFyVaPdpV
         GV4JQMho+tZeQXz8Gos2AR30MtRUS7JrQQfLQURs3EMmIgm5J5FN9RAqOYoJOuPYA4v0
         poYg==
X-Forwarded-Encrypted: i=1; AJvYcCVy02qYpPdCA6L1TJU9bdCBrIR1DyZ5R/ZSumYCy0W3lJi3xrZYIholwdKFUeh0pMlbE3KizRdd5ug=@vger.kernel.org
X-Gm-Message-State: AOJu0YzmzBYy+OBQJ435Y0p7SpsK5t6cKRBAfb51lZZhhVZmWMe8i3Gf
	Evd7rqvQeVu9t4Rt2zBJkH8zGcUBTGiV9pMxc70DqvAIM02cxQ9Re3HrfwRGcnHNLRpENKq0ulT
	05AUBdlzlt98b0sIU21j3Nu8DsD7Z8L4=
X-Gm-Gg: AY/fxX7VhFkWRL4T+to4QOVlnmhTB+WBSftcWRfXMip7kYss+n8Mru8Mnbad9fFu8dv
	Ho8E/y1zv1XHPjl2twp7dLBFnivxCPDAPO5HPWuCWbMtszztJxTbb8hq6gu0MEhCGG5M3dWTMkd
	yMLydQyPZlhtN591Tan+BO1LUbcEgnBg/jxk1kQ/hhbYJGijrN2/LiMq8qcn1o3SVPeQAcxOlFU
	QHu0tGunyeImaICMEuip8sgiV3lkEZo64LtFu5sY2JXEi9V4JmMOvldsZIvKysRGfGnIF9f
X-Google-Smtp-Source: AGHT+IEIYVIBnbesVoRgIXaKl0qIn6Gn7v9LA2ZlbmCmdpsuWPSHYk6K4E/+9S+Uq59Gj5Yu4Th1cjDN8S21bie23E8=
X-Received: by 2002:a05:6402:1454:b0:649:b492:70b1 with SMTP id
 4fb4d7f45d1cf-64b8e2a6fb8mr23973347a12.0.1766717221216; Thu, 25 Dec 2025
 18:47:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251224084821.2092169-1-hsu.yungteng@gmail.com> <490569f8-a434-4297-b11e-ad34ddc4ae1e@kernel.org>
In-Reply-To: <490569f8-a434-4297-b11e-ad34ddc4ae1e@kernel.org>
From: Yungteng Hsu <hsu.yungteng@gmail.com>
Date: Fri, 26 Dec 2025 10:46:50 +0800
X-Gm-Features: AQt7F2rVQjHxlmfBvtqyMd7ayXMOkDaSIbnZF65eOCKeZ-ZxhtBPf_e7OEAJUDo
Message-ID: <CAFT9tykPEt+zTREF9C4AXtGp0qDh_65LjHZCK9F=NFhE-K4dGQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] dt-bindings: hwmon: add STEF48H28
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	devicetree@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Krzysztof Kozlowski <krzk@kernel.org> =E6=96=BC 2025=E5=B9=B412=E6=9C=8824=
=E6=97=A5=E9=80=B1=E4=B8=89 =E4=B8=8B=E5=8D=886:03=E5=AF=AB=E9=81=93=EF=BC=
=9A
>
> On 24/12/2025 09:48, Charles Hsu wrote:
> > Add device tree bindings for the hot-swap controller STEF48H28.
> >
> > Signed-off-by: Charles Hsu <hsu.yungteng@gmail.com>
> > ---
>
>
> Where is any changelog? You keep sending versions but you never
> responded, never said what happened with this.
>
Thank you for your feedback.
I realize now that I misunderstood the process.
I previously thought that the changes needed to be included in the cover le=
tter.
I will follow the proper procedure for discussing updates in the thread.

> >  .../bindings/hwmon/pmbus/st,stef48h28.yaml    | 43 +++++++++++++++++++
> >  1 file changed, 43 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/hwmon/pmbus/st,st=
ef48h28.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/st,stef48h28=
.yaml b/Documentation/devicetree/bindings/hwmon/pmbus/st,stef48h28.yaml
> > new file mode 100644
> > index 000000000000..c6a4b02bcd84
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/hwmon/pmbus/st,stef48h28.yaml
> > @@ -0,0 +1,43 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/hwmon/pmbus/st,stef48h28.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: STMicroelectronics hot-swap controller with PMBus interface
> > +
> > +maintainers:
> > +  - Charles Hsu <hsu.yungteng@gmail.com>
> > +
> > +description: |
> > +  The STEF48H28 is an advanced 30A integrated electronic fuse for
> > +  the 9-80V DC power lines.
> > +
> > +  Datasheet:
> > +    https://www.st.com/resource/en/data_brief/stef48h28.pdf
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - st,stef48h28
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +
> > +unevaluatedProperties: false
> > +
> > +examples:
> > +  - |
> > +    i2c {
> > +        #address-cells =3D <1>;
> > +        #size-cells =3D <0>;
> > +
> > +        pmic@11 {
>
> Your description says something else? Confusing.
Sorry for the confusion in the previous version, the datasheet link
was incorrect.
>
>
> > +            compatible =3D "st,stef48h28";
> > +            reg =3D <0x11>;
>
> You keep ignoring comments. Can you start responding to them?
I have updated the patch accordingly.
This device is not a regulator.
It is a power monitor, so regulator properties like supplies or
adjustable voltage are not applicable.
>
> NAK
>
> > +        };
> > +    };
>
>
> Best regards,
> Krzysztof
