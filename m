Received: from mail-vs2-f42.google.com (mail-vs2-f42.google.com [74.125.227.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B73C1429CFC
	for <linux-doc@vger.kernel.org>; Mon, 14 Sep 2026 09:22:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789377779; cv=pass; b=YOjTjsGFHHktNrIst6dPwXp6/LzEVaIplruwudCx2XX6EI4id6fQ6PCh3+dQXTnpa17sbdUhmheNO073mSIt62Zj4kqO7P4a7JY0H/xhiMVV98vsN4QRl8CmP/GkaIj4gFZzo+ZfP3NbsWo8lf/UVMiO9AKvXblqiHzPEo5ZWVM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789377779; c=relaxed/simple;
	bh=OQIDM3IadPguqK9CTcDIpxeqUSPP28I07Cp1akqRRk8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nLeYYDx0OXCJf0CB22sNKXytRUZkZb5Q8rimhrFoYPulByUTqoghjY0IaoV+TK5aQwAyO7TH09idEnWlZdboqd+4omkDroKwDMxOGbJsHNQN3jVsHF+UJq+Ik7aRWedZfzmJ8zKJH0HELVrZ+pt3uGbDYUIWUZ1kqDqrZxsI/GE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gN9yXWj2; arc=pass smtp.client-ip=74.125.227.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gN9yXWj2"
Received: by mail-vs2-f42.google.com with SMTP id 71dfb90a1353d-5c963a787c9so569909e0c.2
        for <linux-doc@vger.kernel.org>; Mon, 14 Sep 2026 02:22:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789377776; cv=none;
        d=google.com; s=arc-20260327;
        b=dB9kfqKWd8C5hU5j3Lzh2/RRQYsX+9+RTnGqRg9rUbi3pOkSPDVX2du2w1CJ/c2AP4
         RNB/1F8jFDTvDqbKR/yxlCHeK/6MU/7elH6rqMsaaCnV+Y+ftlE448nld8a8I0I+Jc7H
         ua3r8hGXUbte2f7LYVfp18KD06jKhvDX98QU8JXSJM9IKZs6OVONCuvLPkGpx975P8HH
         f/ou4Y8EYBMplTZU70PIZ7+AvUGGml460i/FCoVn6b+Pct/xX5b+ZdEIh5wEn08YX+r/
         1mvm1GpFwhEeVwMJQDmaZzhvm8Fb/VMxedrZqgRps5hgy1Hxlf9cfApj8cgUWm1jiaV9
         aVSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=l+fyavDdNifniiSGc7Q4VRxGCTufa+XKjYswJwqMKYc=;
        fh=hsiZw+AjA0HTIlE9/rt66H4jlSmQs7Fra8frniFj6Gc=;
        b=HYV+4ZD1k0O8n5oOO9nN91wHtwwDdMdlk0RNhaLVHV6sI2lnVVDgph08Nr0S7Qdi3d
         3vN6Jr+6DHCicq4oDwZq6hSNkDfIGm/38u9LFhzKSEB4vO7+0k0DUv5ataPrwWun793/
         6L8WN/mUph0T2Rkw2r57r5Q73tP0TDuPSgPkH8pHnrxGj4Ozea9fSgoVnVAQp7Xw+MCT
         cB3TaRYM9EJC6rnp7gVKoGWvvXQOt5J7mJ9AOTU7XdM/dkSfI4JSyQY9AeodoDbosv+d
         vePeGW/7USluPoO/5Yzg89GhcLcWSIK5ij3H9DTx+czzXiPysfmVrXhA0PJOi2pWDThu
         IK/Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789377776; x=1789982576; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=l+fyavDdNifniiSGc7Q4VRxGCTufa+XKjYswJwqMKYc=;
        b=gN9yXWj2NwLeAygJFikNXoAQYCoJ++oqeZ0Y5hC7wNvahvx3+BU6UIP8KB2Wd9G+ha
         z+ppUR8y4ILjC4GZ+mhAqrXxcFu677LT5zmmzXqdmjjJ5v7PQCTFqPBGgjQUVfBOtHao
         JqKeeHpxuHbQsGO3UmboepPwIDyzYXHN//94WiD+d9zzbwxgPrCmTyVXEFgF12CzZCrZ
         eDsDH2CSNepnrpT0GZauLSwYMjN+wTiQo6bt0x9peP01nvXAUEGQE7Wg7ktK841UTmPr
         3XKTHe8qOpa9lnfhV6DjIS1DQ45n9nRqZzHutlRG1bJZjgnR/+AXmcXORoxq2/kxsiXp
         iNJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789377776; x=1789982576;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=l+fyavDdNifniiSGc7Q4VRxGCTufa+XKjYswJwqMKYc=;
        b=swhF6/R/VSjVRF0/zSuYFlXbxnstUvUyWqWGBLKKlMX9jjkP7jiKexn1ANEjEOivgc
         cU35KIL1hvSzxh3wA4ercjXYNMbISUpWgxrHyNYbHLD17rkvkGhSY/nN4HPrDYnDkys4
         7XVZoAyp14f5mve3xFeQ7TEXFScpBV6T0a8qnSQ/DwE2BGQJKxQ3fdCbI+t6s7AXsAVg
         RZKbY23NEcCGh+y40CF++UbIwjQhCn4kQZRJcB3qGoa8ft7CZwKS5EQYLnF+TAiA8DiO
         a7g6PVPbT39IJTG9LcfNBPB3bF6kCjQnTi5ARFauBTaT/C20n3UO6c6qfkas7/a2POaf
         DVww==
X-Forwarded-Encrypted: i=1; AKwUvBxj0jEI6kg3GaieFnznCH3TR3PAc9b7e9gjOO0QW2gxR8WQElEt2Qu7Ld+jgzOAb53sV/e2nmOToo0=@vger.kernel.org
X-Gm-Message-State: AFuF++kw9wWh259wSICYsvRkvYuXfoeFpdfjEu7o41IDVeH0530sPPXJ
	O7LaQCO79eXxemWkelHMbgqE3ubejpKKz5OERYloNYQoPs+rejLYjUKc4oLNUlWCM11CdC1JGKl
	N6V0kyJMZfSjXeo58ZkdefCQmveemNMc=
X-Gm-Gg: AYBFou0lPDM+AYCTZpFVo6cLFwCawQWjKZpYuBlie2ihNMQRk5LPBpKO7SyKwCBTIiI
	pYSCUEgvZA5TVr2xfgRw5OnnaU1rVTxFN4FknxCrgdJJQvSB9bQYFGLYjF3VxIN7PjW6SiiOA2P
	lkjPjSiwDgYQnHgQlRM5ucf0Ms+dqvp58pyfiLOJVR8saaBhAOc8z/AEZ8G9c26ONIaqitTNaYE
	xNNd5dJVQRrJk5gM37nmsL+CRkImHC4gGSVdK4Kn2uZzy3WorserWQle5Q8T/mbwCTsVEY7MqWQ
	dUdbT7JiA77iJ0LMZu8xY85uA/zjS5/PJtrMT8lMlAoHbJ3LyKm/5z2OIA==
X-Received: by 2002:a05:6102:3a0c:b0:790:2ae8:32c3 with SMTP id
 ada2fe7eead31-79b58093728mr573931137.6.1789377776433; Mon, 14 Sep 2026
 02:22:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260910-add-tda38740-and-tda38725-v4-0-dbae7fabce09@gmail.com>
 <20260910-add-tda38740-and-tda38725-v4-1-dbae7fabce09@gmail.com> <20260911-placid-clever-lizard-de1258@quoll>
In-Reply-To: <20260911-placid-clever-lizard-de1258@quoll>
From: Colin Huang <u8813345@gmail.com>
Date: Mon, 14 Sep 2026 17:22:44 +0800
X-Gm-Features: AcwNN1Vq0GUYmtB80Y3cnrvTLaVxABwghCq2riX6lN5HPRWReqpu9nIst8JoDro
Message-ID: <CAPBH0A_-fUYsbweGEu8gkUEYNHp=dXxupxW0bqNkKKr2vJH--Q@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] dt-bindings: hwmon: pmbus: Add Infineon tda38740
 and tda38725
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Colin Huang <colin.huang2@amd.com>, Guenter Roeck <linux@roeck-us.net>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, linux-hwmon@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Krzysztof Kozlowski <krzk@kernel.org> =E6=96=BC 2026=E5=B9=B49=E6=9C=8811=
=E6=97=A5=E9=80=B1=E4=BA=94 =E4=B8=8B=E5=8D=884:49=E5=AF=AB=E9=81=93=EF=BC=
=9A
>
> On Thu, Sep 10, 2026 at 08:35:50PM +0800, Colin Huang wrote:
> > From: Colin Huang <u8813345@gmail.com>
> >
> > Add devicetree bindings for the Infineon TDA38740 and TDA38725
> > single-voltage synchronous buck regulators with PMBus interface.
> >
> > Signed-off-by: Colin Huang <u8813345@gmail.com>
> > ---
> >  .../bindings/hwmon/pmbus/infineon,tda38740.yaml    | 46 ++++++++++++++=
++++++++
> >  1 file changed, 46 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/infineon,tda=
38740.yaml b/Documentation/devicetree/bindings/hwmon/pmbus/infineon,tda3874=
0.yaml
> > new file mode 100644
> > index 000000000000..28eeb85f13df
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/hwmon/pmbus/infineon,tda38740.y=
aml
> > @@ -0,0 +1,46 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +
>
> There is no blank line here. Do not come with own style (like your
> version 1).
>
Hi Krzysztof
  Thanks for review.
  I will remove this blank line in next rev.

Best regards,
Colin Huang

> > +$id: http://devicetree.org/schemas/hwmon/pmbus/infineon,tda38740.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Infineon TDA38740 and TDA38725 PMBus Synchronous Buck Regulator
> > +
> > +maintainers:
> > +  - Colin Huang <u8813345@gmail.com>
> > +
> > +description: |
> > +  The Infineon TDA38740/TDA38725 is a 40A/25A single-voltage synchrono=
us
> > +  buck regulator with a PMBus interface designed for industrial use.
> > +
> > +  Datasheet:
> > +  https://www.infineon.com/row/public/documents/24/49/infineon-tda3874=
0-tda38725-datasheet-en.pdf
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - infineon,tda38725
> > +      - infineon,tda38740
>
> I don't see how you responded to Conor's feedback.
>
Thanks for remind.
I have responded Connor's feedback today.

Best regards,
Colin Huang

> Best regards,
> Krzysztof
>
