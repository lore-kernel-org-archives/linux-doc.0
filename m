Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD30330E83F
	for <linux-doc@vger.kernel.org>; Sat, 22 Aug 2026 14:45:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787409961; cv=pass; b=dTCpEgZaxoqwvkpDoVkvqYhXof4ZR7dgbzi3C4TFyfEpWRsJIATEMpGXrt6NTkq9yXpZgxhsCRpwkx1qiNhpls2JYVzWWduQWjBm+AJRkje48iKc6ystj2Uyw5SxBAr+lmPD/vMMTQZcxEsU8O2VxUgGSXdc1S2bh0yJ/lZz18E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787409961; c=relaxed/simple;
	bh=yc5u4/Eo0P/jdqKH23wj95cqK9BxnmKceJUQpwekhrY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=COcrSWPBCFuDbpLK3liXcjiteNGL/ML588svs5ioltPafKryspsW49eq4TSupBN9BeriTeyKuvBwRr8QDVtRRAgSU1j3kgd266WJsUHsvJYUgNykFsTpefmSrXYOOe9E1Z7gBFuAeFD6LSa0hNmPAHljSXf6h+erwOaNL1siOQI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sNalURWE; arc=pass smtp.client-ip=209.85.219.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sNalURWE"
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-8fcc43c48f7so23822766d6.2
        for <linux-doc@vger.kernel.org>; Sat, 22 Aug 2026 07:45:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787409959; cv=none;
        d=google.com; s=arc-20260327;
        b=AgnjjnxGA0JcDyE5YfRi+o+Yl2v5CGq9KufoTOPiCFmbUQGdkF59mntEtffbrUElhn
         hVjkuZt9jmlO3425wlSV7V5g62GpzDQiKmFsomo9tKqGglVwfK/LuzgIsS1jdS9FYpyR
         9An2U/DqcwqTzHBR6Vw7+C4pJutNW1yQX5bZIS/tyafRet2s/3ohuWiV2KbAqBLM8bDg
         XCNQBTdfXProyogVLnMbOJwEAe15rTsoVA2Mhrij/zXYl9TaPr83RVFCOuhTW8PNMhQK
         oxFavGiWMEjQ3zOaDti054BKf7gWhGhLYF/b5vS+/U2L2iAOeQiIYokelKKz8vL8ky0d
         kIEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OJUL7WuHeuC0bjHnEkwlCJbkBx9gtzbrMCK+egRudSE=;
        fh=/MdBh4GBoqxA7Wia08RGGOxd/RVlRPPsrn6oAxFK6Qs=;
        b=HsVIIFcMVu2MYy6xpVXehmBaEx+zBSI+E9vPj5D/tSw5Eg3odzPfHCn+gxK6Pxtk0v
         GUEJkgcicS8IBVTqX3z2BQtzl1qTJmMQYXxBPBfwhtG6+vw59greLR1qlmaeXnH+9YPj
         RzFkOW4MNT7n9RQBfhH5F97r9fESvmeCuTJnKhX686SSPrG1+QMpCeLppNMRowVzquRU
         3PaCdbPuwDfXd0n27ilNpAZXy0DRd78KJp3bskNg06MW2H+sUXUv8Oz0taqcscFGBOOz
         CZkURnwQc0rc/DEjjh4DYOinOzMKSuHNnemRvZo+CbxGbQ1c7C04CqkXBFIOMXZLs9hh
         F5SQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787409959; x=1788014759; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OJUL7WuHeuC0bjHnEkwlCJbkBx9gtzbrMCK+egRudSE=;
        b=sNalURWE00jG26PadZgW//hdvzt9PK7nEESV2VJ2LEuBJxN6PXc+XtIuOyBilgAoOO
         CxkakEDugHlrrE8ZVQQPuwn7AMtYBaZtQNgPkRNyjtkSFFyoUWSqX3ciYDpBMgm1G5ZS
         ho4h/h10tijL95OwiomffE2rGa3ROvcc9ZEov7p1I/GRCfjAHcA1YaPjb2U1s1fdFrDT
         FAxUoDmd8o44OY2MYKh/xbN0Rg0W6FKbJFyoa6ajpLn8r/TbB8Ue28wkxxwSlk7rLG85
         J3zu7U+sIasPRC+/rLXXOmQACr5JntL54sYlJOe0SyFDFzPR3pLhZW/dwEdYoMRtC56h
         VN1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787409959; x=1788014759;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OJUL7WuHeuC0bjHnEkwlCJbkBx9gtzbrMCK+egRudSE=;
        b=T+BXxOfE2bmwSEEXn/SWLAI3Sobv1oWvx+VGr17iKzQtKlzhAfeZlkrkQK3THnRKol
         WsD710QOhwuxrQnrDHhDD12poSPdHOdSCiDTTKNMgQjIoXLumb2eJ15z/k5W3+0C9XQs
         NKtsieZxj/og8zMLcuoML/O0hjGkQIX1agsJH1umE0PxpEcWM0rfN+AADnkqttIim3tD
         EhMM1BU0DeXR9JwWEVrb1Rtb59cwrK6PhUodjNB4NnmaV+lJl0KOvfwd7Em3krThl8t2
         fsrlI2mN8R7v9mEA8lvzepuswIQOSahev0LzbnX9cyr9LDUgaaEamBpJmbdXsugIR5ch
         Sr1A==
X-Forwarded-Encrypted: i=1; AHgh+RouFTsIjNQ1Y3TIivWsGDulQCG0FCxtXgHKFPvhbRlAMJmwiv9MZlOtRyVrqcgYCO3BffieT86LkVk=@vger.kernel.org
X-Gm-Message-State: AFuF++mG98u87rKLhIbHUg8bS3/+DrbRW6xqZ/c9vPAOhNXyLLlppEyY
	OL7y7KvMQQN4uScXleljqRh1Y1hTr+3zEdNh5kx5G05jZ0ExIJsSOTDSpxp1kV0Q0q78lni5N7z
	wH0wqw3AJ2kO0Jnl3F3BdUyZJPau/jec=
X-Gm-Gg: AR+sD129u3HyDYRdKGoeVralcUuBWLyJqf0YQUfntApywVwkrymdz1GU2BZPv+AX/wy
	aBF3jvzQL3duUlKedgS1eewWi6HpDRQb0Oc9XcSUKnhcHsRA1CnrVxRCZ2uerTo8YBTGOAPNX7g
	dfTlk48Q5iXkf8AF8J0JTe3gENQAxLHjFkVnCNYiL7wBzPrVWh9qEyYMlCLK1SsntDYs5itCv28
	vu/ZkK1J0+0BMlxxiH++WPOOYwIEtVT3m/KP/VzMscEG098Rx4ZZnxsIPzH5I2Z+geY8yeiq1W+
	OB9b04fTa6OQKxCXbpYqiTW8IX/9tcUohvs95VSpvL4riJow+0rGWyjfC7XVM607R3octa0aiM8
	yaDINT5KgYiT9tGTF3JjceXETq2dCZmEvaQc3QUlPOJ1s+1/yvYTTfRKCSapzStg2jW5RCA==
X-Received: by 2002:a05:6214:5704:b0:8ee:d9e7:be2d with SMTP id
 6a1803df08f44-90c8f90bef8mr56312696d6.7.1787409958504; Sat, 22 Aug 2026
 07:45:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260821-ptbr-stable-api-nonsense-v2-1-f07df4a0fc3b@gmail.com>
In-Reply-To: <20260821-ptbr-stable-api-nonsense-v2-1-f07df4a0fc3b@gmail.com>
From: Daniel Pereira <danielmaraboo@gmail.com>
Date: Sat, 22 Aug 2026 11:45:47 -0300
X-Gm-Features: AcwNN1XfoUTIZhGPgMnXCjD6HfXxbb5AWVVV-Jngm0StlD1KFODKw6ymLHY0osg
Message-ID: <CAMAsx6fOaf0nPFdP3P5o=pcovFLV6gZ6dXMuMxvx80NRxpeEXQ@mail.gmail.com>
Subject: Re: [PATCH v2] docs: translations: pt_BR: translate stable-api-nonsense.rst
To: Lucas Adryell Ramalho <lucasadramalho@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Em sex., 21 de ago. de 2026 =C3=A0s 10:22, Lucas Adryell Ramalho
<lucasadramalho@gmail.com> escreveu:

Hi Lucas, your translation is flawless, but I need you to make an
adjustment to follow the standard of the other files.

> +  - A qualidade do driver aumentar=C3=A1, enquanto os custos de manuten=
=C3=A7=C3=A3o
> +    (para o desenvolvedor original) diminuir=C3=A3o.
> +
> +  - Outros desenvolvedores adicionar=C3=A3o funcionalidades ao seu drive=
r.
> +
> +  - Outras pessoas encontrar=C3=A3o e corrigir=C3=A3o bugs no seu driver=
.
> +
> +  - Outras pessoas encontrar=C3=A3o oportunidades de otimiza=C3=A7=C3=A3=
o no seu driver.
> +
> +  - Outras pessoas atualizar=C3=A3o o driver para voc=C3=AA quando mudan=
=C3=A7as em
> +    interfaces externas exigirem isso.
> +
> +  - O driver ser=C3=A1 automaticamente distribu=C3=ADdo por todas as dis=
tribui=C3=A7=C3=B5es
> +    Linux, sem que seja necess=C3=A1rio pedir =C3=A0s distribui=C3=A7=C3=
=B5es que o adicionem.

Your translation is flawless, but I need one quick adjustment to align
with the standard of our other files. Could you please remove the
empty lines between the bullet points? Keeping them listed one after
another significantly reduces the line count, which follows the
pattern used in all our existing documentation.
