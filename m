Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E1CB1BEF77
	for <linux-doc@vger.kernel.org>; Tue, 11 Mar 2025 13:20:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741699230; cv=none; b=Y7sm36gw79Q+XXn41cYqnTZox5lHwqjU0kpvbSqB0UhNGMaIJBOUM5W6R0Ef7moNui/fDrh21I0KgXtMnTV9ShOkcrDcJ7zH/igFHVQ2T8MRGD+VpmyKgFt2ux+K5Tyj58F/L1N1PpDH38gSJZ+XYhFaXX/6m5LoGTt5Yd7RZCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741699230; c=relaxed/simple;
	bh=CT15IIAP1j3z5KXNjog/OnWaC0n2EV8wBw6ODsx5KwI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=q23eUQ3yrsPu/8VdisZZJd5R+pyBgJxQB93kPDDPWsKqPYq6DAb1H0dMUq0/eiyVynSr6d5vjnxpO6zQ1lcXQCIlsYXTTpSsMbWsxkSYYKhNgfLCgK8M8heiFAAl9cjfKMgz4glYk/JYKEYm0Z2+R3HDW45R+C1uE00bBWfLTjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=SZW1xyzL; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="SZW1xyzL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741699227;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CT15IIAP1j3z5KXNjog/OnWaC0n2EV8wBw6ODsx5KwI=;
	b=SZW1xyzLE/24CnVwndDmIDNNcUpevMf+SMFFd+oka8bHHMBZ+UHQxk2MOtzCzG2wuW8vTu
	haKtXBOZB2BuqWzHmTPhsoP1p79ACDF+pSjmEc2k1Z50oYvWqLodiOHxWThXRwnq1wvm8k
	npcGCXCFzDwzBZUIZZcyIX+/k5QmZZo=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-169-2QBT62_gPJ2_7PNmd3v1OA-1; Tue, 11 Mar 2025 09:20:25 -0400
X-MC-Unique: 2QBT62_gPJ2_7PNmd3v1OA-1
X-Mimecast-MFC-AGG-ID: 2QBT62_gPJ2_7PNmd3v1OA_1741699225
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-abf497da6c4so529868066b.3
        for <linux-doc@vger.kernel.org>; Tue, 11 Mar 2025 06:20:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741699225; x=1742304025;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CT15IIAP1j3z5KXNjog/OnWaC0n2EV8wBw6ODsx5KwI=;
        b=MGvGArPqxE12POQrpd2D11geej2k6kks6Wgkq5UbvXY1yYLBsfG3+v/Wd44nXvr3T2
         Qer64SWsd38PAj67NO05MKVoVxrKvLVhODOqRMTYqfyCU9XL2S2NbjdbDbRgmatL/B2q
         jxQDy+wmfjZclnBBigE9Ramwq8QeqzJbD/AmLZuCmZGczLslPc6nXUZV8MU1n2qKN+Kw
         lc79boehNPCHG/61RRkskYMkwwPU7XsAOGMet2dsyfXJCJy5AGsUoQqncxYAYkkiI/6b
         Y1piB+H0SM6jRW6zgGNM2l4/6q8JPL1Dcyf8cUhGb5H1YCxgiYl0rFz9h7YMEsIIwjIy
         ZAuA==
X-Forwarded-Encrypted: i=1; AJvYcCWNrgRIDDkijPvO/9JH5VkxV53MTmo5S/onKDVSmAK/yWClSJO9Okcj3sPNT4h2Q8Bi5QgLbzBU5Xg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxh1etvX2RQV12bdiC0T2yFow/2Vg3Fe+tvY13Cl7TurBQxrTEh
	/hV0ctovZnMo+FXHxNR1KQvG8LF7TMB+MuDqXVvpEn4kyMDR4mfwL/Lrejm/9hbaZ+b7hNdOVcZ
	2F1Wfps5qwUnCtJvv+QTzX0TECHwidHRzI1QQOHHhKoaSCCD2FoB8mC0dhlkmkSBKPxjDUW00od
	GP2BjUckmrAwbCHG9YrFnlszNpm8ZU2VG0
X-Gm-Gg: ASbGncsM9OkpxZNi19PriHp1/5fX1j7mcr1TMgf2B37yF+V9/lEfnWJGKxp8FujfF5j
	mKGNVhkTYf0elSH31344+8BXxQH+w/LZqFdxZ9tJFHi3nFQf0UTDzA5yDWkw5awMenLB7UI+o
X-Received: by 2002:a17:906:dc8e:b0:abf:67de:2f1f with SMTP id a640c23a62f3a-ac252ba467fmr2029920066b.44.1741699224632;
        Tue, 11 Mar 2025 06:20:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEKYnj8F9Jf4SwA5xwmTqfm/NOh+ZyOvFJjWLkViuxqCpeNhUyvZDmEsh7nVvGxJdktqfaid7A4f0abzVZFRF0=
X-Received: by 2002:a17:906:dc8e:b0:abf:67de:2f1f with SMTP id
 a640c23a62f3a-ac252ba467fmr2029916166b.44.1741699224220; Tue, 11 Mar 2025
 06:20:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250311114936.148012-1-tglozar@redhat.com> <20250311114936.148012-5-tglozar@redhat.com>
 <Z9A1oN_XdMguNgHy@uudg.org>
In-Reply-To: <Z9A1oN_XdMguNgHy@uudg.org>
From: Tomas Glozar <tglozar@redhat.com>
Date: Tue, 11 Mar 2025 14:20:13 +0100
X-Gm-Features: AQ5f1JreteHiyUMcyR3gnnzJJK9jqv2cIeQ3zXcakcHBGBF6xFg1-fV0um1ZFkQ
Message-ID: <CAP4=nvRCtRwXReMt8+vxjLVqtL_pR9OyKo0HS417+93QR84mUA@mail.gmail.com>
Subject: Re: [PATCH 4/4] Documentation/rtla: Include BPF sample collection
To: "Luis Claudio R. Goncalves" <lgoncalv@redhat.com>
Cc: Steven Rostedt <rostedt@goodmis.org>, Jonathan Corbet <corbet@lwn.net>, 
	linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, John Kacur <jkacur@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=C3=BAt 11. 3. 2025 v 14:07 odes=C3=ADlatel Luis Claudio R. Goncalves
<lgoncalv@redhat.com> napsal:
>
> In the last phrase, s/is/are/. So that "If either... or... are unavailabl=
e".
>
> Luis
>

All references I found on this topic say the verb should be singular
(since both "BPF" and "the osnoise:timerlat_sample tracepoint" are
singular). Search for "either or subject verb agreement", e.g. [1].

[1] https://www.englishgrammar.org/subjectverb-agreement-2/

Tomas

