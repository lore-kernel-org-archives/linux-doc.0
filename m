Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795313223;
	b=cY+CD6grD8SW6FzgkZL47lFYbme0DNm0J6qYeae+LU7NIWL974mitzE2c/uteU69B1t6
	 8vMaJh3jm7gSjyS2c9r5ZR6US9B814l52RC5sjcUo+9htZFRzgE5VA1aJoNCjJlKaZyms
	 kt3MEPWMej4765ZxS+mYwAVxAAW0JizfZh7jIaNI3glZQnd1IOn+saPOjHQ5AZKETGGwt
	 CHEN3ldbNnE/aBULyy05dRkfAvmoFZo00k+x734KmyAyaLEOZ66hPp15MYm32Bt4w1yZy
	 qoBD9gPOJZv39KSu4ohXWIcMygN0c6lGb2jeI/zU8PL4vAgHevoFmM85qtY6Df/+ANQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795313223;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=tWr8zdTV2KLuJ/hOHndwlDm6I3BIlGs0eo/9rcQ4WvI=;
	b=4QOWSioKLxiS2q7ZS99yZLOxkYoQ4a1PmE855lzYGgWqoY2dubVAULF0SlwIX1Qw9cBy
	 QaSWaQ/g9dDbo9eIguHb2rYatmqDO++WCN2O9DEdgolVWL41oK+KaZto9fx0j1/3rb1VF
	 HB05b7aiJLt9iCUCrnXqtQ5Jzs8HbXDC+CI8mJ3svLjicZQijBTv/gj9vVB7hKcsTSTxU
	 D9qflD7TrkYS2NAcBx6D06+/kB80pZAVTOsH8609r0b1tVsOHstrrE4DZM5/FUHRp858q
	 N2Jl5bilHy92Hb4Zg/SNW7JsQRSqrNYLy9QzDatXl0a6AhVpM2bBbYQVPQGHs3Iv4Dw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="WDAaIY/L";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.44
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FA6D606A320
	for <linux-doc@vger.kernel.org>; Sun, 22 Nov 2026 02:07:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9FA6D606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WDAaIY/L
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-92107df3f13so22454356d6.3
        for <linux-doc@vger.kernel.org>; Sat, 21 Nov 2026 18:07:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795313221; cv=none;
        d=google.com; s=arc-20260327;
        b=LvozffNYJ6QSgdBpygTO5Bq9GEEOgACHhNqk6Who5oRjEEYPxt4aOy+GmM4SbRvYBM
         fxDNXNEZopxx8DgiO7EtHSgJPtb63FagxIMrmxb3XnTTdIBpPiUKiyprp+yHdxdUwqvr
         z1M52eJSRs1GnGxF3oJTQXZQnuT5N2PwRl3xFxMESvrfgncm3VQvtoUQiujFoRUIyn3h
         9KOdKNSTSgyHyN98a525XoYdLV6IRpWK3hcqWmf2Ipe9F5Ighww7vxg8glZTZ0ASO6/t
         LJgYOeI3XpR8eu6e6GQ3n/tsmFSGCbUAiC33iDu6MdMlsOOTKIhIWUCyO6fe10QNfTdS
         REnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tWr8zdTV2KLuJ/hOHndwlDm6I3BIlGs0eo/9rcQ4WvI=;
        fh=Ln2khT4FL7WB5ebMxYoQHUbanMJRfbXBKvI6ANq0DVY=;
        b=OHpZ7iVdKKnU42CGTc+3IY3yt2teMuTmCNs12dwVQa8fkBHs1dqU7JqH8mhOkjAGxu
         +8SAeP4XH50kL5tnZ9DOTmpT60AL1kYRuBZSoQxJ9UB1FDNg8/sKQKZqBiaj9ZPGSXYU
         seQJHp24za2wCsjZTi2h1c0kRaZLUy90ABVELmgcmZQ5FomBT0HZK2N1Wg4425D2xsx3
         Rn/cno8w5n1dpo9DijhblN/1DxTqrncBtwBM3QMb0YBSd9qyQVt+JcDmrljmW8hupmLX
         L6Y6RWBYbd5XDdrP3IwGS3W4HOtpdrDhpbM6DpD1Z9YFvmKkdHJrFjiae0BHgQULE8UW
         bi5g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795313221; x=1795918021; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tWr8zdTV2KLuJ/hOHndwlDm6I3BIlGs0eo/9rcQ4WvI=;
        b=WDAaIY/Lb+2lejouu99PX7fNBJtKpGBUJZixiGJzNhZkL00sU4ZUG5dqww/cnb5qTY
         UTzsNal8UDQikn9hkNv/zIKyqLKMuEaAyyy9LVfZQiMRsr2GX1mj33MGJhm3emOlU2YY
         VryHq8jmBGIkUAwINDj5fjBeJzKPoDIcrOj/GRMyMJZ9LzV7qtXyyFiEYZtw37YmrAqR
         wfzYNaZv9WQbxYqhkMNPaf0EgEle8WyhBWZRco95UteyWuMVoJxHM+KXmNu+dVjw0VFz
         aj6yDmDY/gL96PM0R20huNO1lNKoIk+4oUwf1L4jz5kr1KAMTdruDuZbCfLL707fkenW
         rWbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795313221; x=1795918021;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tWr8zdTV2KLuJ/hOHndwlDm6I3BIlGs0eo/9rcQ4WvI=;
        b=L5WWmMbrLK/TKU4o2z5aTatKT8dau/vkvFbih0N+/0FtRcegQeQS0xcIQJDembR4ic
         BL5FktbH286IyzfBS472cVZvE/vB1RicMZRuFEg7f9DkdAaXOJTZiHyM3wfDW+NWF18X
         B62IiTXGL6H2I+7HvIfmm9ymk0GR4xkPUdnDZjIdxF6zpx5Ky+tVlM2mS9mPmtGdDFYQ
         ya9PuEwLRK474p0w6LXCo4jgjK1PoxWJDvSIrKwLJhbQoRbrz1NlS14FzcGIcfVzX+bo
         elEgVW9Ol8IL3LN4h6dqsl2NIE1+CPW8jZf6E/pHq8Qxjj3QxCtpb+HtDuOLhOcVIKDL
         geew==
X-Forwarded-Encrypted: i=1; AL+hErFgfY+DXga6dtjlBBrMu20YgjyFnNT1ITK5bY+gLm/6LKjqBfwE+iqndr5117wG9nEdD05Pmev2GzQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+1xVdxsG4EAEy9pZScuC4Zk+PePpy74Bu4lCUoMCtnQqcO8kva
	Kg7l9Spfz8VzKZS6NSturUFSGTN1FLAbdqYFcL++tJTFtdpSFVRAal0DXzZO5rtEs7Oy2IxdLVa
	VWIpkB4EAL5l09PBgFysHwShUF7O78QU=
X-Gm-Gg: AZFdTZeQSC4TgDaUfrd3cQoECi77Rfi45NNk+o8gWPQD1ddc8Fo2pKqXMcWAZRi2+g/
	u3ksAwP6ZpKzb4/SHNGDl9FQTZquPfK40UiRdHJYij03kz7ERwjZC3SuHJGC+5aa1jBakAc6xTK
	o6ymI1DZN7DBqPg4QafhzCIu3IOulrIjtja11PNbvwZcxWjfETrI4igLpsQw1bpK28KcVzhI8t7
	4VUmQlDbhwgmubUVrz2MB5kLWmfrH6giJwJ2B0IBbgpWZGLXHWolNNtkpX8w+cb1rUSCBf32kOm
	pw0Rv+6lzpI3iR/nDKhsJb1w3G8fwHHzwGS8VSK3SdoyZOCFQCA49wa8fIMwPL5vQfhmV06DrU3
	o+TFAdF5PEJ1KUMgVFDN8CLlw/BVbsYCJYURaLM72ekS/I1VZ7xdq7sN5PhgltCRrENmfHeyQA9
	QxNtiE8UeC+WxYavxfYVQ8xckKRX7Vqm6Hc04t9snXlZw7S9sCsMCeFNgghct9Tn+Ja1gu1ZBus
	/H/nBD+10V4oOBp4b1nhWd/EyVTZ2Tf9jdoSK0TPRFjSKxZL1FsMw==
X-Received: by 2002:ad4:4ee1:0:b0:920:fc6d:7b8d with SMTP id
 6a1803df08f44-92134b63b69mr139798166d6.40.1795313221501; Sat, 21 Nov 2026
 18:07:01 -0800 (PST)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261119-pt-br-submitting-patches-lkml-v1-1-1c7170de926f@gmail.com>
In-Reply-To: <20261119-pt-br-submitting-patches-lkml-v1-1-1c7170de926f@gmail.com>
From: Daniel Pereira <danielmaraboo@gmail.com>
Date: Sat, 21 Nov 2026 23:06:49 -0300
X-Gm-Features: Aa3M54pzUMHfFcxiaB3utOWDAykq7qJzfTkTFML9qfjMghMe4fC2lGQrnYp_Se8
Message-ID: <CAMAsx6dNK3NjZvF-3wd9RH3dy3V7TiUoJJxnoLi0FPVn4eVJSQ@mail.gmail.com>
Subject: Re: [PATCH] docs: pt_BR: submitting-patches: update LKML role as last resort
To: dreduardocruz@gmail.com
Cc: Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>, 
	Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Em qui., 19 de nov. de 2026 =C3=A0s 09:22, Eduardo Pereira Cruz via B4
Relay <devnull+dreduardocruz.gmail.com@kernel.org> escreveu:
>
> From: Eduardo Pereira Cruz <dreduardocruz@gmail.com>
>
> Update the Brazilian Portuguese translation of submitting-patches.rst to =
reflect commit 3a198413bb71 ("docs: submitting-patches: make LKML a list of=
 last resort again"), advising contributors to send patches to a subsystem-=
specific mailing list first and use linux-kernel@vger.kernel.org only as a =
list of last resort.
>
> Signed-off-by: Eduardo Pereira Cruz <dreduardocruz@gmail.com>
> Cc: Daniel Pereira <danielmaraboo@gmail.com>
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: Shuah Khan <skhan@linuxfoundation.org>
> Cc: Randy Dunlap <rdunlap@infradead.org>
> Cc: linux-doc@vger.kernel.org

Hi Eduardo,

Thanks for the update! I'm currently working on a pt_BR glossary to
standardize recurring terms like this across the documentation.

Reviewed-by: Daniel Pereira <danielmaraboo@gmail.com>
