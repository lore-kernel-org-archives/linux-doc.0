Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E18AD3803FC
	for <linux-doc@vger.kernel.org>; Tue, 31 Mar 2026 22:22:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774995731; cv=pass; b=cottlYUUEH2Lw0rQ/ih4ovcbC9lhypD0aBnfTkpv4LkAKMDWS8+o3F+jyQTZVcLYKKmKmOnEDmFd4Hlk8nnntZyuWi/THiWj9h6TZhqrxeu6Bv/oQhUQ2GQqeZ9ZofClejEEkfccyS0Yv0t1PsVIE86G8iOfUkikb7DA45P8R9c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774995731; c=relaxed/simple;
	bh=ncPvOsZTJjVK/oQJMKyjLa76VIoIin63WVbHmTcovNQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Jtw6JGBe+3kfqxKyV0Uq3webrszaatsg86z6LiIu5AfIe1mY3B6svPUyMNryDgohN+ioW7bCHaTephIQHWcUeW0GYIk0ailfMwra65LcxztvXEGASWF4Q2864hlSr7g92r5NWPqSHaN/h3+FEEmYx4vZU0VcN5n+PlEfci+n/q8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BAEiuUsC; arc=pass smtp.client-ip=209.85.210.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BAEiuUsC"
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-7d7e565c877so3038265a34.3
        for <linux-doc@vger.kernel.org>; Tue, 31 Mar 2026 15:22:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774995729; cv=none;
        d=google.com; s=arc-20240605;
        b=Q726ZmB20Z5pgHT4ab0Ubdq3J5lLYJakNrEGG6We8N+O6FarcGflLsRb8dsW2ZTC8n
         diRop+Xeh5eY8/cC4L9p1GGT5wZnITAUh5zncraXafi4uKhWFuhfrjz5jkps9WJrbWKJ
         E2C7PZ5C/Iax727MIdYSajv86YiqQK8M17hSbjw5XoglfW7NVJjmM3eL5mhjMnDbu80U
         KoktuBXD2E+fispnz8Eri1+B747pe7a1GJILTcFtvZsU82cv246kLLoN0wY+VCOiTClc
         0ZyKJSI7cS4Qc4uAjyaWGpQ3Y0R3JV+evJL2Zmi+yY12Wjxz4nUy8plo5SV/uFntanO1
         leOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+kH1wdMJ541RvEnZ1TzxQXsetZPCmeLLf4CuJX4ccag=;
        fh=e/zWiZ6VKoUKhdq2x7iai2G4+t6wjKxstCYty8sJIeY=;
        b=DuHZZ0Vaft0GDNNx9Yj25wZWulxFkN6MAOdoZEn0UwWgaC0w1v5OkJzbgY8IQJ7nHU
         gzetaGpiP50O7B5++nOVXhbI8oEsNXXzoATEYBxPquBkp1Ko2C5LqFKRsXV6++qumdAw
         pXE2/iym8siY47jdj+f19waxFoF3Km9YBPd5Lj2+EDkxnDbTztTj2Li0+9edaNqWnFTX
         hoTowO75pCMB5Q1GFlHbvvu93qqA2NPGZN8QXCtjZrgS1wEkkO6pkls1s8Ie7WGgO4cl
         /LttdUtJIWsxyIXgIM4tys++3jChNxqPBctroqZthS/bztPbzEtrQqYV+HLp3gN5V3zy
         PvgA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774995729; x=1775600529; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+kH1wdMJ541RvEnZ1TzxQXsetZPCmeLLf4CuJX4ccag=;
        b=BAEiuUsCisWqErUGrDC7NkGVJx437nC4C3hm0vJzYr+VMcT5yCXOqvVIEnQph9l9od
         ZdAph0U4AE2YXkAIRFSyKzCG9y9qpXkoUYaX5KWfzsaqNNBYAcVMqLsxJlPHBIWQX2yz
         dDHRxg78t9XjGE88y9k8vqTXID6DOwU55X2b1Q2mYAIcKnS3ZflSHqWt1dn0tBNxqW9a
         JP/m+QtVxslHMLg6VgKeVtkh9fFB2qktCBTzkdEb2IL3YAowxSxFtTCL6ddBjDTIh71Q
         NV4O79r7jkkKirRgPW9GXajglEQhv68Mllyw9+p1ry3RT+qJ2HrJ2tNvIUtt3ifWa2c2
         ockQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774995729; x=1775600529;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+kH1wdMJ541RvEnZ1TzxQXsetZPCmeLLf4CuJX4ccag=;
        b=ASRhbLkm12Mgl/yJR+Z30VoH2tk8ZyP1Ipah9+DLcGDEoTJYPhNi5irwg7N7bcWwuG
         fi12UKnyTTCEYUMhH1qgnLV5DwE6UoQJ8bKlZXdmh0utJWNal45Rvetma0q48jadw786
         IcetAhU8uAlb/K2MNWLaBsFvKUYlH9uenYP/QzMagCsH8gCQBNl11k3iHq/84usVBJEv
         FnI1zg4sM54ssTxQMWsxq2fPhqybcXz3irw7BiSVMfIRPjSj1b/jw7rTVQdYhvsGApa/
         m6qQnqSr12iOYPyFid/Or82DPHu9ArhlZdKzeBtlxVKXh15FmHeyRbzt5zLMu92AL31o
         xrfA==
X-Forwarded-Encrypted: i=1; AJvYcCXL+LKZvGFi99c2XoN9aeiGat6EesGdtKJrk5PJI+nXwGXb7vV+fq24m1uOMMPQCa28j+L6PCdJUmg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0WVPiV77pVPFYVtdGBD9rZuJItJOrJb5QUtLzDm2LRYZPwtuV
	SQdu2Xy8E5jUmXxioVT2d3yQgqTzclY9eIf1I1KIy7vyL7np7JO0uPY8P3jRgrPt+IBVTsRR7os
	MOEcOSyWYBXgPcR6FiltmdSLhI2JaRhZPKDrk
X-Gm-Gg: ATEYQzyYGB6f7nbcTk977ND9iq2AvyfIV3qBncEM3pKZcvI5zUmaZRKSHOJqQRH4RXs
	+oVp8EkADmKQ9P+tjO1PjOxAUfijp7IlQg23Ge5jHIT4bnbTdAChSSnH4I3yzZylrS8HC5rifua
	4Mg1PenlxpOXNItICBZ+Uo/RHfirczyUYeAenYCsqBe50upYaa4+jehB14MZgD71U9xtMUmvdkC
	lIqEsQ8U1/v6XY9etfWJuHLvudxZ4k1bk+petT7TThNsCbTOXYusoSz6TGoGC53epdUSbA8AUQm
	cHAkzqpSQw5ojba1sAAV0ygkvQBGW+/KKiYIhYFreVGm04eTQ1BcDWUE3dfAaNLDfKCQj7eW/Q=
	=
X-Received: by 2002:a05:6820:168a:b0:661:1188:4b99 with SMTP id
 006d021491bc7-67fabbd5f6dmr558097eaf.3.1774995728407; Tue, 31 Mar 2026
 15:22:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260329165041.831369-1-danielmaraboo@gmail.com>
 <20260329165041.831369-4-danielmaraboo@gmail.com> <177488383992.1817745.6595454759376079201.b4-review@b4>
In-Reply-To: <177488383992.1817745.6595454759376079201.b4-review@b4>
From: Daniel Pereira <danielmaraboo@gmail.com>
Date: Tue, 31 Mar 2026 19:21:57 -0300
X-Gm-Features: AQROBzAsmrlTUYAw5Ijx7c9_2Bew-GW-oHDqKtSJacutapXza4h8kI89-MMcZ_w
Message-ID: <CAMAsx6fwUqsLSyLeY0VmynGHwPizraK1EoZoKoiMvz3dHAFrPQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/5] docs: pt_BR: continue PGP guide translation
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 30, 2026 at 12:17=E2=80=AFPM Konstantin Ryabitsev
<konstantin@linuxfoundation.org> wrote:
>
> On Sun, 29 Mar 2026 13:50:37 -0300, Daniel Pereira <danielmaraboo@gmail.c=
om> wrote:
> > diff --git a/Documentation/translations/pt_BR/process/maintainer-pgp-gu=
ide.rst b/Documentation/translations/pt_BR/process/maintainer-pgp-guide.rst
> > index 93f0759e94b2..f7b31201499a 100644
> > --- a/Documentation/translations/pt_BR/process/maintainer-pgp-guide.rst
> > +++ b/Documentation/translations/pt_BR/process/maintainer-pgp-guide.rst
> > @@ -200,3 +200,292 @@ offline; portanto, se voc=C3=AA tiver apenas uma =
chave **[SC]** combinada, voc=C3=AA dev
> > [ ... skip 23 lines ... ]
> > +est=C3=A1 criptografada com essa frase secreta e, se voc=C3=AA algum d=
ia alter=C3=A1-la, voc=C3=AA
> > +n=C3=A3o se lembrar=C3=A1 de qual era quando criou o backup -- *garant=
ido*.
> > +
> > +Coloque a c=C3=B3pia impressa resultante e a frase secreta escrita =C3=
=A0 m=C3=A3o em um
> > +envelope e guarde-os em um local seguro e bem protegido, de prefer=C3=
=AAncia longe
> > +de sua casa, como o cofre de um banco.
>
> I'm okay if you change it if the recommendation to store the backup in a
> bank deposit box isn't really useful for non-North-American locations.

Regarding the bank deposit box comment, I chose to keep the phrase
"cofre de um banco"
 (bank vault) because in Brazil, bank vaults are considered extremely
secure and restricted places.
The intention was to use an expression that strongly conveys the idea
of a highly protected, off-site storage location, which this phrase
achieves here.

> > [ ... skip 56 lines ... ]
> > +  de PDF, etc.)
> > +- por meio de coa=C3=A7=C3=A3o ao cruzar fronteiras internacionais
> > +
> > +Proteger sua chave com uma boa frase secreta ajuda muito a reduzir o r=
isco
> > +de qualquer um dos itens acima, mas as frases secretas podem ser desco=
bertas
> > +por meio de keyloggers, shoulder-surfing (observa=C3=A7=C3=A3o direta)=
 ou qualquer n=C3=BAmero

> I think "observa=C3=A7=C3=A3o clandestina" would work better than "direta=
" here.

I think "observa=C3=A7=C3=A3o clandestina" would work better than "direta" =
here.

> > +
> > +Assim que concluir isso, certifique-se de excluir o arquivo ``secring.=
gpg``
> > +obsoleto, que ainda cont=C3=A9m suas chaves privadas.
> > +
> > +Mova as subchaves para um dispositivo criptogr=C3=A1fico dedicado
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
> I think this needs a  _smartcards_pt: label before this section. The
> commit message says this label exists, but it is not present in the
> patch.

I think this needs a _smartcards_pt: label before this section. The
commit message says this label exists, but it is not present in the
patch.

> > [ ... skip 30 lines ... ]
> > +
> > +A menos que todos os seus laptops e esta=C3=A7=C3=B5es de trabalho ten=
ham leitores de
> > +smartcard, o mais f=C3=A1cil =C3=A9 obter um dispositivo USB especiali=
zado que implemente
> > +a funcionalidade de smartcard. Existem v=C3=A1rias op=C3=A7=C3=B5es di=
spon=C3=ADveis:
> > +
> > +- `Nitrokey Start (pt)`_: Hardware aberto e Software Livre, baseado no=
 `Gnuk_pt`_ da FSI
>
> I think (pt) here would be confusing to readers, because this implies
> that if they follow the link, the site will be in Portuguese. There's
> also an inconsistency with `Gnuk_pt` here. I think a better strategy is
> to use inline anonymous hyperlinks like:
>
> - `Nitrokey Start <https://www.nitrokey.com/products/nitrokeys>`__:
>   Hardware aberto e ...
>
> This should avoid clashing with the English version and not create
> confusion for readers.

I think (pt) here would be confusing to readers, because this implies
that if they follow the link,
the site will be in Portuguese. There's also an inconsistency with
Gnuk_pt here. I think a better strategy is to
use inline anonymous hyperlinks like:

Nitrokey Start <https://www.nitrokey.com/products/nitrokeys>__:
Hardware aberto e ...

> > [ ... skip 22 lines ... ]
> > +.. _`se qualifica para um Nitrokey Start gratuito`: https://www.kernel=
.org/nitrokey-digital-tokens-for-kernel-developers.html
> > +
> > +Configure seu dispositivo smartcard
> > +-----------------------------------
> > +
> > +Seu dispositivo smartcard deve simplesmente funcionar (Just Work - TM)=
 no
>
> Does the "Just Work TM" joke still make sense in the translation? :)

Good point. I've removed the joke to keep the text more formal.

I've applied all these changes and will send the v3 series shortly.

Thanks for the review!

Best regards, Daniel Pereira
