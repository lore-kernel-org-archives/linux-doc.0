Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD4C1371CE3
	for <linux-doc@vger.kernel.org>; Mon, 31 Aug 2026 02:21:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788142917; cv=pass; b=EhmWjUFB/xgWnXl/TBZBiptkvkR6acbRCBjZQ1xWVKqTPN6BRNxHUBT5ruhbJrNn9dwUkVQkz/GD9nuZisyiO3WOBieckyzI5jHdJvxFePxjEQQz+4KOdsc6Rns73APMa9o4Ts1fPuhIaGXNuS5j/U48Umn3/RqhCTLw6BjRRwA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788142917; c=relaxed/simple;
	bh=GPWW4oVRcCCMAoA06PGoDCiq79cqQiubkV98jZZ6S0U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=T6FoXt+ZaY2DBfyE+c1Y6kTrXuNHNNycS94Xacqod6M9PinCD59df5JFo/nw0Ay894DOvE0tKN69uVOoj0oSNfg0sPTjIr0K1a0NpwdaeGqQjGTT1zmTQhgvH2NOHRZaStHEmZeKoFRKuHLL6xTzZK1ChezEBkul8G/FDYW/EpM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Isp91Hab; arc=pass smtp.client-ip=209.85.222.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Isp91Hab"
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-930c0f9c1b1so200697585a.1
        for <linux-doc@vger.kernel.org>; Sun, 30 Aug 2026 19:21:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788142906; cv=none;
        d=google.com; s=arc-20260327;
        b=iKOAvVOHxzeY7bRCcHdFD2pYnB82NqA/awKxWnqyoAr3s2HTxNewHPftmHfpJsHM+k
         b6oS0bsmJASM8gdOJGf/gzkybSqSVQrZbrnElhkQ0xPgEMmjCvCTJ5JghAkF8orqW/Cg
         kV8DzpX9LTI8E76QvWeavaiaP/MzXlkTFGPUuNBPnFcm5SZva6dfIFthJeOWCMwK6Tao
         QTcLoCjKsn7LX3h1g2UIOE9vQgq1cmevDm+WlBAJXDHWbYtLR3pBR9YjhJADwVMIk8we
         KascoBKbz9FDCDao0zgGvLgC4pUbV9REudU7/eqZNgIWGg8O/OTkZ2+eStzOiwPI3YMQ
         PbmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=X+gtQUN8+/MkCJHijWyZYutLZlt3TuwYMwG2se0HQyE=;
        fh=VrWVlOrD1uEwtom6FspxCP+oQsxm8mVyjc+1El5xJ/I=;
        b=RSxVEpFeSL25/DRagnWb0ZDsSllmlZkRcTVZ7ARf3ZtM4tUj6JxDd/8vjdTLe/aemH
         PVX0o5R4hbb/eAcUkVQunnU2H7tuOfazJizRk73EWctL4R/Y4zI5ZOpGyeft2RIHj3GS
         U9r79uhDpkxJK9WZ/rBYloNTTD/6+zRZMyuoCYURgEB9vfdCf1MrNb0d1mQJB7DZLoNY
         Tl7MnP1tFW4MEG5tweFMneIDi0fVS+zesQ6ARoOkkfk/GWlLJuA/uCUao3DBNobf/nQX
         uf79YFGLYQ541GU+txfb9VOCz2K/gKsPn0/Xa8FHizWfZpTa4SBXb+EqyzPGTfHX4zNN
         Wpsg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788142906; x=1788747706; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=X+gtQUN8+/MkCJHijWyZYutLZlt3TuwYMwG2se0HQyE=;
        b=Isp91HabdgQtsZUkRJ7nNKemqpQ6wDNRB6IwNLDAdXLeZnxIXkM7jgAIMN7b7ftqE9
         YK6NC9Llz9nwEf3SvS5PohNPajvPRbbfbu7StkQA0dOA6HTIz1OSj6g2CO2wxpKE7NEa
         eWxoqGp9NfWrOlfz0toRBPZuK0LkAuItmvuKvLGA7Ul6aNxQNdpSN8AtfVfMgV1XlD7E
         m103tHgGkkken/ZsyUvavvPr069Qzamauv7pBprDk8BnFVHjZYtOGJp0dw2AhIv8isxm
         nMZX02MS7UZPk5J+La3E9Z1Tx6S0WecG5+KPdyBjJEOMp5suHee7baGSWeBelGMrBVF9
         ah9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788142906; x=1788747706;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X+gtQUN8+/MkCJHijWyZYutLZlt3TuwYMwG2se0HQyE=;
        b=os+6ajf0o4zHP/1fQ/00Ie00HaO+XVN0TmGOckAUeDDHrMf3b2xrgtM3091FxK1Xni
         tSOuY3RogNhhFeilohwmBE2r3b/SrxfXlfRP1wb95/RDm8RnDOk0qqEP7v6CmTT36hjA
         AjSyZYoMHrKE6b3Ui3+MISdvKizW4xUYrsUfm0eNWCU/bef+TA7E/ZNpFK+w66hCENv9
         xnQOvDzhrRIEawd3suN0aJzTiXdz7wzJ/7Uu6d3biwmref8agVQCm7jlwcMVywDhqjZ8
         5+C6+otvrwcgGQ7YX8pEG4vSzc1Fdffl+W0IjbMbsv0EhwCyVbhemliuY5hinlPjnOBN
         JIAg==
X-Forwarded-Encrypted: i=1; AHgh+Rr8ZCDUZkcSraxZAgxoxmhCWgRXy8eiXrc6ojUJo2/nzQd+OcPB3i47nd1pfTuI1frZq5GyDzz3KMk=@vger.kernel.org
X-Gm-Message-State: AFuF++lwSy0zLbzdQBqohwhv8LDBIvnsw3zlsTYLGK5skB/kEWpONc5/
	o0Z0yPLGzXnJJYSXo8V1VXsN+O6g6qR6A55EpSJ9xhSjvSLKGX0Kuiu+0oBllNALej1Nn33hHhh
	c/HHXeLMlUxGFGczDWHFd5LxdaVfqu7g=
X-Gm-Gg: AR+sD11MPVwklsjlHOEbm8lVxbMU0qameEpzc5MA2WwqtM1vUUUQ7TLwGbskDys+mrZ
	JCSPue/7WGEvszB9kwwIxO65PRp5w0myzeXZFZswnwfQFFFg0A9+AmiK4/UQKsOTDyXbPpowtUj
	oKInvJtY885OUmMcgZuqFI/FzyYucFc1CiNcqh0bY6JrnBhNS6noFujHAB4TdIk/wroL0ukp+A8
	zSdpnWF/zG0D5Kc37PKXprdmdzfdJtZNYvavghPKUHxY4IdB+Wpn7AkgB4t0JcjLLDpOxVqUfRo
	NcyYyxfJhRhns3BRrrLD+vypguQMT/r8h0jhuAiLl5tm7kVwX3aOEXIKOqqGb3JZ/astBEk45ZO
	cX2QZf135Ssl+BrV+LIGxTArpEuC7BYeQysdRlxtnwd8kIwoNJBtxAF/6aAo=
X-Received: by 2002:a05:620a:839a:b0:939:1fc6:3fd6 with SMTP id
 af79cd13be357-93942856eadmr13875085a.18.1788142905879; Sun, 30 Aug 2026
 19:21:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260830234515.63131-1-giovannamccds@gmail.com> <87o6ejjbvp.fsf@trenco.lwn.net>
In-Reply-To: <87o6ejjbvp.fsf@trenco.lwn.net>
From: Daniel Pereira <danielmaraboo@gmail.com>
Date: Sun, 30 Aug 2026 23:21:34 -0300
X-Gm-Features: AcwNN1V4QODqjfFyFNmTAbfRgnc7G8CdM7nfaUJOd2QfPDYS-p2wNJuEK-dZJpQ
Message-ID: <CAMAsx6dBSRBA4hVAd9SH2sL9BxcCZcDyxn4HYwU8AocV87z1RQ@mail.gmail.com>
Subject: Re: [PATCH] docs: translations: pt_BR: translate coding-assistants.rst
To: Jonathan Corbet <corbet@lwn.net>
Cc: Giovanna Macedo Cox <giovannamccds@gmail.com>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Em dom., 30 de ago. de 2026 =C3=A0s 20:49, Giovanna Macedo Cox
<giovannamccds@gmail.com> escreveu:

> +* Todo c=C3=B3digo deve ser compat=C3=ADvel apenas com GPL-2.0
> +* Use identificadores SPDX de licen=C3=A7a apropriado

Hi!  There is a small typo in the plural agreement here. Since it's
  "identificadores" (plural), it should be "apropriados".

  Could you please fix these and send a v2?

  Thanks!
