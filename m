Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 059E124DD17
	for <linux-doc@vger.kernel.org>; Fri, 21 Nov 2025 02:31:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763692323; cv=none; b=cThKU6pF2+6MerDn7QB/GjBMTxWlU7boeGQ4YJqbktRx89sthwZ8RInnRjDoD6jzRfL/dWgYnONgW7JgLuuR1d+Coow9Le7DMo8eryJjdEWJbCS7gS2OxwTtxVSlBWm5+mOaES60qNOr6hrDvaS0lFBR/buBEchQ77ZjduBkt7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763692323; c=relaxed/simple;
	bh=+Wd4lyVDl0DxP0x2gVQD5CGDuhFdSdN9ABXiwi6fyPk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IYeaHMp/ybkVd8thabd1/MzOUd3at63YrUi1OUfKTc+fuy2BItxuYtJULEdwppWYodxX/bgDKZMeCVzVh4juYcvX7SZ/JqPV/phHcTiHxjQG06lL48Snnj5k4RZJ6SM6rGZ1+2MWcds77m+pBmlUMi3JALT9b9XcAo9oTdHeAlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nAre3Wol; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nAre3Wol"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-b734fcbf1e3so274092666b.3
        for <linux-doc@vger.kernel.org>; Thu, 20 Nov 2025 18:31:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763692318; x=1764297118; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AaHzq7hvG5OM5NC46dGTqhmONxxLtjd8Iz5mejTLjoY=;
        b=nAre3WolT5cC5FMyIfn164MNAloK2X0o8bnEIIrNyx3pQZgQf1BhvvoeCceamkLRBF
         ImdfoYEabB7/C5cJ+LNRm8orAe0LlHfaZ/1CNXK55iiClIk7WeT7iytewlos2I2Mo9dB
         1ReUIRfVqFHQ2nC1XCtrrcT72wBpusooXARVlynuoO4lDhDyWHSoh/a/ytnkif3oCZyU
         x6jGrbIPi4F+Vkb74mc0Xc5gEUypVLU4a0BBSYB+zta2tbxWwK6dI7teA9WSk0Njjkbf
         MFbWc5QVQRN/xMPY2c61cJGVh6PAgM/Cn9QdjHg5CnWooVOrC82Yoyz+0+hR2EjOUJ5G
         TrBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763692318; x=1764297118;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AaHzq7hvG5OM5NC46dGTqhmONxxLtjd8Iz5mejTLjoY=;
        b=Dje/3Nm9Q6SzAoSK11VpEzElWC2bsxGEBfdH4uF7XeB9g492NLLjDAyR7Y+KGVsK5E
         9SWgwPrWCVFL0HEiFEZwPF0CplD2vOyHUU/eyfC+OJh4h5p6f/OqGPCPySmeReCY2cvH
         5Cvdfwd07dexlMNaafcAGMR2EIQUA2TSf6UwVHBUOT6XK0O9ptsZOiuMvQlKCpHbrpjT
         BkmrWOv7LTVJ+Ve9uwgIYRmFirX1C6cqcxFESkajnfFvxl9mA1CNoKkiHV7KmaQo4j5g
         KtW1m3v5yPjxRX9aYnsR51ht4T7DdTC9Ex5R4Jsr1fb4qw48nysxezI/VBvnOYTcmKUP
         Z9XQ==
X-Forwarded-Encrypted: i=1; AJvYcCX6LVBmffRgE9R0XonF4i9dNjNjp+Vv16aoXm6D5QQGzmKObYoqiZY4nnod6YfmWhfF8AQSx0zP8aE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw72T5Vr3mD6wLta2X/rVMUcGhritUUZFnoS9LR74obA9FieuMl
	M3sAuMK7F/cnILlHrjINBsIQRBLp5IOhrhr6QK/nJpaKohz04009uErINSYTmOaT6UYUxNyUvhJ
	3Rb2csyoK0Xg5myiD9K8Yejqc6v9wPgo=
X-Gm-Gg: ASbGnctgZdvvPrgcoK/mU+cHUFqoMMCRp/vcXtp+TCOL6XRvJWjpwGXPtw7UBvWPquH
	LLacjvOvpWm9t+HKxW+PYNyA+N3t64RNO5E7ewhsH7//aS0gxrMsWEPtU26ay2pcvXYa3RytNA2
	3Z6VrYhGl5HuwtMF+XfWWHFwvmggks7xHGclsjgF6EHTqOj8vGLvOu2FC8bKVoOvjppDB9stXQE
	vcks5miyprjbw6EEFEWdq4nqf4SuMc0duZljPd3k6PP4QXwm/yyLuIYCJ0hV59Yj9GfYtU=
X-Google-Smtp-Source: AGHT+IGuk5iepGrcQCr6ZvL+hQA8FauFiUoQ7lDORFmDARjCnlbG+iS+THrP4POKNOotRa35b/Pu+BafS+QoJystw8c=
X-Received: by 2002:a17:907:9708:b0:b73:3af7:b6e5 with SMTP id
 a640c23a62f3a-b76715823c4mr49079566b.15.1763692318072; Thu, 20 Nov 2025
 18:31:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1763605033.git.kezijie@leap-io-kernel.com>
In-Reply-To: <cover.1763605033.git.kezijie@leap-io-kernel.com>
From: Alex Shi <seakeel@gmail.com>
Date: Fri, 21 Nov 2025 10:31:21 +0800
X-Gm-Features: AWmQ_blP5PzYaeEidcg-kwvyGEOVgZPl9fZ6FECPYBeMJxlbrDxeEzUSotdm8rg
Message-ID: <CAJy-AmkdyShoDmBApPtbnesn5MovLuEshQUH5erfDJ5b7YQBqA@mail.gmail.com>
Subject: Re: [PATCH v6 0/3] Add chinese translation for block
To: ke zijie <kezijie@leap-io-kernel.com>
Cc: alexs@kernel.org, si.yanteng@linux.dev, dzm91@hust.edu.cn, corbet@lwn.net, 
	linux-doc@vger.kernel.org, wangyuli@aosc.io, doubled@leap-io-kernel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Applied, Thanks!

ke zijie <kezijie@leap-io-kernel.com> =E4=BA=8E2025=E5=B9=B411=E6=9C=8820=
=E6=97=A5=E5=91=A8=E5=9B=9B 10:42=E5=86=99=E9=81=93=EF=BC=9A
>
> This patch set adds chinese translations for the BLOCK documentation.
>
> Changes in v6:
>  - No content changes
>  - Add missing Reviewed-by tag from Yanteng Si to patches 1/3 and 2/3
>  - Link to v5: https://lore.kernel.org/linux-doc/cover.1763535919.git.kez=
ijie@leap-io-kernel.com/
>
> Changes in v5:
>  - Add Reviewed-by tag from Yanteng Si
>  - Link to v4: https://lore.kernel.org/linux-doc/cover.1763519072.git.kez=
ijie@leap-io-kernel.com/
>
> Changes in v4:
>  - Fix formatting and translation issues (reported by Yanteng Si)
>  - Link to v3: https://lore.kernel.org/linux-doc/cover.1763366835.git.kez=
ijie@leap-io-kernel.com/
>
> Changes in v3:
>  - Add Reviewed-by tag from Wang Yuli
>  - Link to v2: https://lore.kernel.org/linux-doc/cover.1763350407.git.kez=
ijie@leap-io-kernel.com/
>
> Changes in v2:
>  - Fix Chinese/English spacing issues (suggested by Wang Yuli)
>  - Fix make htmldocs warning: "Duplicate C declaration"
>  - Adjust blk-mq translation wording
>  - Link to v1: https://lore.kernel.org/linux-doc/cover.1763105050.git.kez=
ijie@leap-io-kernel.com/
>
> ke zijie (3):
>   docs/zh_CN: Add block/index.rst translation
>   docs/zh_CN: Add blk-mq.rst translation
>   docs/zh_CN: Add data-integrity.rst translation
>
>  .../translations/zh_CN/block/blk-mq.rst       | 130 ++++++++++++
>  .../zh_CN/block/data-integrity.rst            | 192 ++++++++++++++++++
>  .../translations/zh_CN/block/index.rst        |  35 ++++
>  .../translations/zh_CN/subsystem-apis.rst     |   1 -
>  4 files changed, 357 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/translations/zh_CN/block/blk-mq.rst
>  create mode 100644 Documentation/translations/zh_CN/block/data-integrity=
.rst
>  create mode 100644 Documentation/translations/zh_CN/block/index.rst
>
> --
> 2.25.1
>
