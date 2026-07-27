Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AB833F4DF8
	for <linux-doc@vger.kernel.org>; Mon, 27 Jul 2026 12:10:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785154251; cv=pass; b=EE9FZLl6GRFSNET5JC94UOztiBpaASEvhg7/7IgvL0eQeZmVWJk8yzAd8Fm9v05LreE3+rJpmEBZdOn9PBqgf9cFt0byl2OpIZANEOnH+E43ZIeDu+8rmQcTFsyOQjYRW/giMkY5VE420S1fusbhXe38n4HcXGLzDkTmxRJX508=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785154251; c=relaxed/simple;
	bh=9G3NcN+Ocp9Ph4MecnFF/ukqkr7n9mkrYAPOVdqUqwo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=F/yS5sg5KprW7zjHcf5lKIh3FC2ejmHmR7961cYEorKFPtBkEwoREcdh5CL7FxzIdBdZ1xyidJWHPfFdVoQYp2jrJZfHPSIq0gwS3NThHzhL2lQcck8H+9uyByqoqfeR/oNbe1oEeA4Ae3vb1A5erC+Xwh5RG+d5I5PujY5wQcQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YfG+S39M; arc=pass smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YfG+S39M"
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-51bfe810293so14164461cf.1
        for <linux-doc@vger.kernel.org>; Mon, 27 Jul 2026 05:10:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785154249; cv=none;
        d=google.com; s=arc-20260327;
        b=R447SdFC+nHOBkXgN3Z9W8Sy9ZQK7BvBKNCbEfAM8cOOZxtsA646L5xIxQbmT6MQKX
         Mavz9udCCXxtwl/vIAdx8eTQ/ZU00ShIVig2zzYKdSE89VoMcyo2WhkBgIAfZV509Kki
         1RSPVvkik2ob4TDcwsOssXLk6ym137UaLvcxMlO6hKWBuAfBiZw2/Y94epEbvb3pazGF
         4SurnhyUF1Osaq1IHPrSBs648wzEhacqDttl2F9Y8QUmKpVnKUX7fhX2+5B7NtaAW0ws
         oILC3WMmETRLxAQ240sE/5pgBZnF3MDpfJOAcr2n4d1Jekv6rHf5TvC3sWdka9n2JdbG
         7tjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9G3NcN+Ocp9Ph4MecnFF/ukqkr7n9mkrYAPOVdqUqwo=;
        fh=vxXzX62FjKW718TzrSabJCCP3ZgZ3nHbgs6BKJNAh20=;
        b=JYXz02yQtKYIn+GruqNwdRzPpwaqV70J6YygP5rbEKmtTT8jNuLlwKd2TWRwZJiODR
         llx9ssdk5/5QvazbVv/tK0XrbH1Q9wwIixbFMJuEqHKjWQQmUxIssaGfdWUTt4HHtDQI
         7ByxjQvwiTbjeRg1ZTPQ0+fS84bxN5KXfDPW7rsEPJ79C4EIMSB/JrIVNRC06sj0Iv1o
         3zVo9A4BBIDJYKh+Jo6LYo3fgyVWip0U5aa4MJxFrIU1l0JbGrhN2lTFaC0XZv/FXKve
         /LftPhVgZCKNSM9zqlNonAhCBDBXqwAjOqdFFiIS2pdGjLoutcaXhrq1JpxT2Cgn36Dd
         w8fQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785154249; x=1785759049; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9G3NcN+Ocp9Ph4MecnFF/ukqkr7n9mkrYAPOVdqUqwo=;
        b=YfG+S39MmUaqD26a7bUbZE/mruNj8XH7gXmfd+rM06+D3rHnGMmYAzkttfZIvvicQb
         HBa/6FtyMH5b5JYESS6qqvJb3IkcCCXlHpZ311UkWHng9q8AtLqRE9ktATwIYA1rXE2p
         OMvWoDc+6eCjhoMR6iEttHJ+zUC0YKyJZ0XqpL9JwHNLmDtl0qDFWodlLKf1FXAnfQFQ
         ZB9wPo0lJSvGGdMZbuCML9eG2KYbZStE687FfjonvyDnQbzgGLvSw/ERfgrZIeWEA8Mx
         cMbqIdcPVT3W6d/fFl5V0xm9w/5PofswAAmk9GDNAcxzHgU4mlvskjlKao/lH+qjRmtP
         3QGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785154249; x=1785759049;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9G3NcN+Ocp9Ph4MecnFF/ukqkr7n9mkrYAPOVdqUqwo=;
        b=JCJ8n4RfW5vY2+9eRT8yAxLJE29qmpzSp8dYVgSVSGBF0x/EdGsERGIarHEqMrAlj/
         qUHOwqQozdnff9ACp5wESoAfZGWmFMQSSttXPNcbvpYoml85cTVBxLp1mcaRafx42xiE
         vBRuyG+saXFWUm+xq/nHwdYP+Hf1YxDBtcpYdwPA4ciardiq6tfCAsLoMr0GKAP/jNt6
         j/AqNwM/GoJUK4iIvMbffcbZkPc1ZPliNAId723ZY6Gaalx/k+r4NmbmNT+5oQlAmzlF
         zGdnQNLa3tYz4K7CXnJ88ginef3qnyyseLYbvw2cJakHXZE03+JAmFxicIZY17G+XU2C
         7oxA==
X-Gm-Message-State: AOJu0YyqP25V8MlarOoXlTAd1G0eccPhNYs0A1VvFHLQ+ixi9QX14ouF
	14o068GeFdJtumLEI/6btEx9o4HZcI+2cUiYooIIYejLzR8b9wdRTRpj8iwLHEZpgfwXbibjBj2
	nxkgBq834X7CwQ1gQPXBuK8STCtVyEblannZbdjTuMw==
X-Gm-Gg: AR+sD13Np/O5N8CHLx1ZTnIjNIh43v82KGR7Q8N3vHaea7Lt1pWLenolSjQkoFHB73r
	9uFdfQcDxwcfclE+POb0pHkqM5ZK5KXorB0qSe1YTAk9/I9MywfaUALaLsof6kXOwy4lG84XPot
	b841F6uQvQdxFv/z4To0Bhqn0Hkg1bT6vPCbWsw7Oaz52LTklz8KpczRdjYYoYyWfz9oMurH8Kf
	K6TH3zMByhKbdfGDqRCbioWqqE157TFDa4JnL1TxhlaIxIFs7VhByLFflvW3kdPO4XbNsQEfS29
	hPrKmhNpycVorvXpHQbZ3+aLYfff890WJL7l9F9l7+PTVE5huugZ2vnGKEznStVUlu6qEXhCCDU
	=
X-Received: by 2002:ac8:7d91:0:b0:51a:ee21:d342 with SMTP id
 d75a77b69052e-529a835786amr85927851cf.20.1785154248808; Mon, 27 Jul 2026
 05:10:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260726235352.3926-1-ygorotavio.sjc@gmail.com>
In-Reply-To: <20260726235352.3926-1-ygorotavio.sjc@gmail.com>
From: Daniel Pereira <danielmaraboo@gmail.com>
Date: Mon, 27 Jul 2026 09:10:37 -0300
X-Gm-Features: AUfX_myMO3iLYnnlparBXRFfqKDk3c3b9PJKmAFOV6ZxM6c0Lf2-O7_BRMAtgJM
Message-ID: <CAMAsx6cBU9k2xa+4LHaWa=tuaeXpbJKFzZbtpeaKEBeedV0oFg@mail.gmail.com>
Subject: Re: [PATCH v4] docs: translations: pt_BR: fix email-clients.rst and
 add to index
To: Ygor Otavio <ygorotavio.sjc@gmail.com>
Cc: linux-doc@vger.kernel.org, corbet@lwn.net
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Em dom., 26 de jul. de 2026 =C3=A0s 20:54, Ygor Otavio
<ygorotavio.sjc@gmail.com> escreveu:
>
> For V1 Translates the documentation regarding email clients info for
> Linux into Brazilian Portuguese, maintaining consistency with original
> formatting rules.
> For V2, the erros "bullet list ends without a blank line" and "inline
> interpreted text start-string without end-string" were fixed. The others
> erros that appeared after the submission of V2 ware also fixed.
> For V3, the spelling errors pointed out during the review were
> corrected, and the missing index.rst file was added
> For V4, The last spelling and character errors have been corrected.
>
> Signed-off-by: Ygor Otavio <ygorotavio.sjc@gmail.com>
> ---

Hi Ygor,

Thanks for sending v4. The grammatical corrections and adjustments are
all in order.

Acked-by: Daniel Pereira <danielmaraboo@gmail.com>
