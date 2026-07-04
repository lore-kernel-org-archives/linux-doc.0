Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F265176238
	for <linux-doc@vger.kernel.org>; Sat,  4 Jul 2026 22:03:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783202582; cv=pass; b=hjO0gDae85+hfem9wJ3ixbjKUoDmHRvFC089Q1SAY+EMGtxKNutoD2oulVmn/MeoEBTU/WCuletYTj4dMjJ6hatWq3h5fIaeowbh76DvOs/tjQPmvkYZW3EswYtIvxTce/ROfFRKPOsbZFA/EAhY2KqLJSqXutYE6MrVypNlqJU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783202582; c=relaxed/simple;
	bh=vEEUahoV+mur/93iPTpqzr/pal+4me52rUjFClIki8s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KXaj4Tf9oS3q22/mrhQ47wbFIWJ4H+RaHAroXZzxsCutWkEm9p8jtLPTYb1rXNzRy2KWg+sHAPywZRA6SOT4zAyUkB5YafMj3BexhQR9yMZavTV+oF9EzSEVRojw9Q/+NagSPCbMntYbY3VQqTHW6yNX4QZVvLAaGypi/MsKZBc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Pnafd56e; arc=pass smtp.client-ip=209.85.219.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Pnafd56e"
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-8eeb4508f29so12568626d6.0
        for <linux-doc@vger.kernel.org>; Sat, 04 Jul 2026 15:03:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783202580; cv=none;
        d=google.com; s=arc-20260327;
        b=JDAzy15MP0+CLLRspulgY4jFwqzl9rN2iw9ZUbcUXlgmoF2Qlt6Ls3Vz9yuYzroeb3
         neioQjZqwEwOm9d02deFBp2MChJs+mq1C1LO63vTeEHiPRTXHCQMM5xeXK9YBJUj/9nD
         q+Yjhh18l+9SZkXGg7ABI+ST/41QTsOBE9SXjmFRUQqBAbUtT2v/kX3WwTdE06bUsMjO
         7ieSeBgCDom3o9cjxQeajbkPBfQchyBdgZg9iFn7Bj00Qhj6Rei0ch+rv/b+w3VrJ124
         J8QpkNyND098eW1uKbT1t8UQe4r5u7H+kSzP9bTLbHbZ6SvVa60dP6JJPMQ4AgbbA+Rb
         XmHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1zPyY2OeKPrWZqnytS7uEpFuTJC6BzvvWgIcjQYL5ls=;
        fh=ypXvQZ/ZpkXK8Ee/dpFp2aSLA4ag94SjQOPBS8tVjUc=;
        b=rlMih4PM/qOefTJBRindGGkIQkG9pEZPTsYjyTItIO6sqgSSCNfFrbBt4KX3t/dFRL
         2UK/zMP4jVHRnJWmpYTs3vYZAk89ii04dfbTvLjgZqJXr7El7jKQfoE9uGiJfGdHoIi4
         VS6E0/tm4G+7i3gfc6FdFmEi61M1FxxTZhK9a6qFZtM8Y6hvzNiXE8bxrp4s+JMe7eEw
         JZC2KH7gSzBVV7QaRXm+ANIya3+nPtj3RE/Ipg6XJWf3Rqoi6Ht0XYvOU5O5s3P5IIhi
         zD+/Sm9ZBVaUZp9oW1pz8PmSjUwfuClBjTO/4cebyQYXQOgJkIPDVaxNVxN0I2dm9JJ5
         uvtg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783202580; x=1783807380; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1zPyY2OeKPrWZqnytS7uEpFuTJC6BzvvWgIcjQYL5ls=;
        b=Pnafd56emlGmN+fgf6Rk2hX+dJvaJvuGblPefhnay8AXDAc1ofZ53WELdZ34aEdV9/
         XrtAyHGW3Cjg+j/NgX5O6xoBn8jQYaJZEAT30eX9dKPRUBKcnP42RgPeml7sk0Tr1aU1
         EiGANLltwJYBrb7kf1RB9O2K3pupPXeLSNxN0HRDyRhLorTi2wAGhSEACHDT4szAsdJi
         vFLkYvBwiTw55M5WrkO8jdEj8acWArvIZPAM5cHJntivXdyWj5Kesz119ldy9ef/PHoY
         DCAXPU5x2OBcvpeRzDfKdxuqFh9Z0EfumrMHZ546s75WG6X6b3wEOnQgrWuSsS+xP+yQ
         Y3OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783202580; x=1783807380;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1zPyY2OeKPrWZqnytS7uEpFuTJC6BzvvWgIcjQYL5ls=;
        b=KjGbJG+inQJfXi3g8sxgY9sLLhq2Nwi29le6hlKWni8Whh5meI57IWlpwCbFRq8JWM
         CxA71UQ06q5t/xJwBitSmvVfWVCAE7g+70akEI/tgTwQmF0GkRU2vq83eWMNfWvtt1IN
         n/p9LtsO+gvxf1L/BvCugH6FjR57xPfEZ1N/q8vVeN599ULaMIChkNWBNq98u+fg4IPU
         I5WoVF420ayXKl254fr4yD9TheHhmljUoL07Vi4SnQs6nH9VAyd4ftOn4XOeLmbkFbKW
         0tzYu2Ry4QgOK/S757LPzC3mdCVejWyVizb7InJtAknUTz1L5PUZUbShelTqaLaTzddf
         t99A==
X-Gm-Message-State: AOJu0YyeapJdy6v0ebIR0v2nad9i5zoIxQ+arHoyEfHdUuugpeVZwekO
	XYsvPNlGbyLvMPMer/m8ZeQ9Qdj0h23E1gqV/98u+nxBpeyJEQ0XAAT8wq6C6Jkr3zDZi77kD9/
	7YRbLPFaY8sLgHLywvrCPOiCv/Yofi8o=
X-Gm-Gg: AfdE7cnCkocD+0O/CdpbYtcdinjb9r1fxnhPDI0rH+0Xy7v1W7+HYZt52KbgfATASvM
	SA/v38LNkC8+UUTXD+MO3ctmkglc4mWqfbORudFs3KU1fnMYL9v08eg1KsdCYUTOcT8PrEQPESf
	AkgptwxT0h7uqd1mq8/GtDmylfhgPc6aI06WDnEHlSc6i8FkWL9THMkHXsYPIKaFnPELfWOXdTI
	/XdniN1ha/Bwvrme6pjNeIr432NtgoBqub3fjqYlrBJTacnQQux45nILtm3vLAk55Y3El4d421w
	cyfrVjQyxPstHbpxGv12C/vWjUbLd0sF8GG9jRHSYhkADFChAvGHi6+2J2U3o4ceX9s36Td+E8Y
	UmhUTvc59domvBkTwRtY=
X-Received: by 2002:a05:6214:21a3:b0:8dc:e4bf:67ec with SMTP id
 6a1803df08f44-8f74a51af46mr66526096d6.5.1783202580404; Sat, 04 Jul 2026
 15:03:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260704202831.112653-1-amandacorreasilvax@gmail.com>
In-Reply-To: <20260704202831.112653-1-amandacorreasilvax@gmail.com>
From: Daniel Pereira <danielmaraboo@gmail.com>
Date: Sat, 4 Jul 2026 19:02:49 -0300
X-Gm-Features: AVVi8CehCx9QBj1mPGZX7hbDqNlLAP-nv22n6wHQ073g1vdAr6Czl8tfH8WsLuQ
Message-ID: <CAMAsx6eBXmw=nqU0d2hO0u5_a0DOOW=-tR_YCnfkROJQ5hZavg@mail.gmail.com>
Subject: Re: [PATCH v2] docs: pt_BR: translate the management-style.rst to
 Brazilian Portuguese
To: =?UTF-8?Q?Amanda_Corr=C3=AAa?= <amandacorreasilvax@gmail.com>
Cc: linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Em s=C3=A1b., 4 de jul. de 2026 =C3=A0s 17:28, Amanda Corr=C3=AAa
<amandacorreasilvax@gmail.com> escreveu:
>
> Key changes include:
> - Translated management-style.rst into and adapted idiomatic expressions
>   and humor to sound natural in Brazilian Portuguese while maintaining
>   the original tone.
>
> Key changes since v1:
> - Fix incorrect author email address
>
> Signed-off-by: Amanda Corr=C3=AAa <amandacorreasilvax@gmail.com>
> ---
>  Documentation/translations/pt_BR/index.rst    |   1 +
>  .../pt_BR/process/management-style.rst        | 265 ++++++++++++++++++
>  2 files changed, 266 insertions(+)
>  create mode 100644 Documentation/translations/pt_BR/process/management-s=
tyle.rst

Hi Amanda, thank you for translating this file! The text is
grammatically validated and compiled with no errors in my repository.
Thanks!

Acked-by: Daniel Pereira <danielmaraboo@gmail.com>
