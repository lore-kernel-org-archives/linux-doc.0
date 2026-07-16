Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 369B0280318
	for <linux-doc@vger.kernel.org>; Thu, 16 Jul 2026 03:54:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784174066; cv=pass; b=Kk7+qMJ4fGk2+PBbFnb+ipvVKVPoDQU2jtATWgsoel2H9uRTMls1ns5YR1A9t9SAGrXk+XANdYQWU0t7p6okvCENnM9dJxL5EEUV6NpKEgQ9oeB2Vvmyx4Pqh+MJyyAXVu5mkOJA6TS7lUzr7zKLtGOf4f8VviCCMY9PNNXYWVQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784174066; c=relaxed/simple;
	bh=ugaUrHtzm0nXjpCscntYbTjTWa+4E7/k13Pg59CdCZs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=c6QUxZ8/MQd2Op9hBjXq4Qz02ghzPzLV2U3Oxt2V8cToxqDHz5E577YiMjbIebNJhTI/NS6yiGZ34kSYZBNMSFib3pUGFZ9vTa12Sdx+eMr1MB/O5TrXCr3nh1kbTJmJ/JJh+qj3A+N5ybs3WOfpWR6D8iZooXpyQ78SugnvsZY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IOt30zlz; arc=pass smtp.client-ip=209.85.219.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IOt30zlz"
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-9034b6b7674so46609466d6.0
        for <linux-doc@vger.kernel.org>; Wed, 15 Jul 2026 20:54:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784174064; cv=none;
        d=google.com; s=arc-20260327;
        b=kO5jUuXsIj7phtVhVkqRsgZMNPMs8qR2aKY4y+JLzjgt3BgFaYdhIXPGS4I5IWwOjZ
         +XM+t04toPfRRdi9MDitT9lmOP2zJWSM5cwA22SG30yP/zentYf4hH9nJftHKvp7c0/J
         VAuc+qamIVd2i2TU2S6HfpZz2Ar/RMQnSTl/Jv6klQ48UO/B/p78sGzmlhGV02JYLvVf
         WIjTwE1MoTrMOadDw6DD+UcjjUHSKBmO/APLwgNBRwgwOu133ZKPqdnW+0QOKyx82Pss
         gb8SR3dd/hWoK45ex3Rdg/SRx2FBZGhtESdZDODjellt75dXkBM93hchZPHm5TSaulMD
         +ohQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ugaUrHtzm0nXjpCscntYbTjTWa+4E7/k13Pg59CdCZs=;
        fh=MrEuju4FK4iljCFH2UsbVJfCW/CGquxOlTBW2d+x2J4=;
        b=hlupp3YR81IrMH3t5Wy9080C3xxBuMj0BDu5/HsT30YTrTrzYqmJlTqrYFj/61Pfv4
         o86WcROxy5F5IEsoLWHn0QOnwJrhql8TcsV4xXd9NXZfzNThs6EPr8ej2N9ewlxdj0aq
         OMee46keQzvKFWC6exPRkkaESRZViFi+gQAY5HufV9JLyoxV8StRZr1fyuVrhBNP0MAF
         VzSfWcV+UelkkU/1tWlvE+8taE/aw1lr9+9dPvZ/pSNT4Ev4VEX1zTqRbf50XjlcaqPo
         0TAHPSkSzud9f4wMzIi6GAdj0Q6gFzSl0SUgk4C+nmChPmiD0vS9k2RHlxdrtyPPSn6r
         alNw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784174064; x=1784778864; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ugaUrHtzm0nXjpCscntYbTjTWa+4E7/k13Pg59CdCZs=;
        b=IOt30zlzAzz8DoVyKJjuRuaUQsRv/H+pNBEpeg/DLlJIUIFQLQZyCMS1gDJ9u6e68G
         OAiS7bfGJbuLa3CXTcOc+/17MLRxTX4+t4CvjuD6giWAMTpFVOAlXpOTPnXx1GNu5BWn
         vl9fpgANP9J6nSlmktEZqUnsTd8kEP9mj54BJCw0PEZtoXHjHuYNiGKi7hSoI61aHPJp
         pemgF/e85lcX14dCyKhi28xvMjEeB2hGCOrO6X2bkdn+ewEW/jEmqoWB7H6vADsm7MbS
         obfxJ5g4jwhsEbCzUooDLEKPEVMRSdsOSPJlUoYd5FhqQq2DdYhLnJGb2OncDwen+F0F
         cykg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784174064; x=1784778864;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ugaUrHtzm0nXjpCscntYbTjTWa+4E7/k13Pg59CdCZs=;
        b=Nsfyl2eIN0D37BNLsaoPjschbCTE5qTycRHU8ALtbLQfy3eE6q9dXlV0FKKuea3fka
         EK6SBfRLDHlB2g1oayvS89Es1SQa3Y1+XQbvN8AWUEUVf0ATloq6aTpTuxrBk49D7Pfg
         sroFXBCPRU9yzgvYpgfN66zQjC7BTHFtB08XGZEt11dRf3QdDThAyHJAkHe9nSKvyqRX
         0tAVSOaxv+vbS7lj566cDVZnkAfqnbv6xA5gu5kRwPD+syqrALTbDgRuBLVgWBvTaj0m
         PQUMewcJdu10mA88AJwmZFzxUlgHQD1KAGnxOQXITDfuIK5t/laORJ3Fo/g+fDrfrdHj
         hpbQ==
X-Gm-Message-State: AOJu0Yzh2T6Y+LNxK7HgcyqSp14BN+EifnfqLFU+5tAsFH6vEvRw+Eaa
	0btalshU0DTett3KuTEXhGPl9vfUa4qlb7By45YyzT+1SWo3FFHkUt8BOp/1ylcyGqItfFmw+IM
	QFqf0sHxi6Lv+GwxAiHiDETuDWHF+Clwzuykcw28=
X-Gm-Gg: AfdE7cn269N9lo6WnNqHlfAaOcrAMboip6wKeeKesYR935REFDJoVjGwbBXtjPlvpCK
	DbD5qUEo+nqbESDQrnCmlPdOP424cTuw08fFPTc7gkKCbZGQNWZNOLV0ispyCu5n8fo4pXWxEPx
	LYYxm/kAHBlNu/lX6a71GtclzmhxRhWQfOTRNq12Da/YyNr/b4+pQKEZVMGoFu1R2iAQCXPxa5w
	9jAnw8fNrlQFmfm4XB56/IkywOUf1I0xdyMCScceYzecoMW9WxI7DaxMIceGbWOVhgLhvHlH7KX
	CyS2+lMGoxLXRLnhIMpdC7bbnZdo0yF+bwS478Y80vd7TsG+Irw+I+Y1UgVuf4pbcdEZF6aou5E
	C
X-Received: by 2002:a05:6214:4487:b0:8f2:34b0:c6b2 with SMTP id
 6a1803df08f44-90747cf42c6mr121561096d6.46.1784174063969; Wed, 15 Jul 2026
 20:54:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260716021013.48025-1-danielmaraboo@gmail.com>
In-Reply-To: <20260716021013.48025-1-danielmaraboo@gmail.com>
From: Daniel Pereira <danielmaraboo@gmail.com>
Date: Thu, 16 Jul 2026 00:54:11 -0300
X-Gm-Features: AUfX_mz1sU2eBspDCPKfwYcwrJwmSPYi3t-LreTS6tZTvet6i1qxek8M28WhJEc
Message-ID: <CAMAsx6dqyq=ayb9+mug81y_XzWO2_qD=TFxh1oUoXDOEfoycTw@mail.gmail.com>
Subject: Re:
To: corbet@lwn.net
Cc: linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Em qua., 15 de jul. de 2026 =C3=A0s 23:10, Daniel Pereira
<danielmaraboo@gmail.com> escreveu:
>
> Subject: [PATCH 0/4] doc: pt_BR: Add translations for process and guideli=
nes
>

Hello Corbet,

I am writing to apologize for a formatting issue in my recent patch
submission. I mistakenly included an extra space when generating the
cover letter, which caused the title to be omitted.

Please let me know if you would like me to send a v2 of the patch
series with this corrected. I am happy to address this immediately if
needed.

Best regards,

Daniel Pereira
