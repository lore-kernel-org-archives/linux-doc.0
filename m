Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 393EC28BAA5
	for <linux-doc@vger.kernel.org>; Thu, 22 May 2025 13:43:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747921425; cv=none; b=RXFxJzMfB+iC2cZhZObNiZVWTCJ6Ooah1sjhguGpaRw0668c1uBRxzlbHyz2pbrNEQGi+qrhRs38/8w50S3czQOarYyzDy7Ipij4Eglt6yDuoBZ6sWTxtVL9fmLVCttJFFQNzgrTrkc9v0qPVxMUu+qjYB5VOG8UpX63Ru/QS5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747921425; c=relaxed/simple;
	bh=A+7j37YM8CLHuf4M8TE4bEC4Qqh65RglyR9XdNxjmCg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QuSZHDNHIKfNeNjav/CoKt6bzMDTZ3ybZNE6rItbpmMcsvt6qxMdW5VlPaVBZVWrrZNCxloW5PGhYRJNI2dyigNtO1wE9dAgEx9pcRNrFzrykXXnj0DCZiZIVp6mNjWePSU68Cxl40hWujWR1g7smO+UCVR1lo8Z/w6QWAG2gME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=X9yn/Ryx; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="X9yn/Ryx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747921423;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ki4PGz9MoGwpt59sUdcbcs5elurUJNkygM0DwmzXjgk=;
	b=X9yn/RyxSldV4tN6YPeDi0wWxqu13sfSzg2uc/zjY2nUmJx/syafFrRj6iGzTUZWzI2YON
	RINhXSz6iRSDQTtne00DSGOrcYV0Ht28TWKQxdADW9fGSyloxTCNsUMP/yo+u9XuXTKjJz
	eFWHXsPIFdJxJIWiHD5SxBnsqN6xE5E=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-201-hpmd4_l7MQKvNVTPZw4-SA-1; Thu, 22 May 2025 09:43:42 -0400
X-MC-Unique: hpmd4_l7MQKvNVTPZw4-SA-1
X-Mimecast-MFC-AGG-ID: hpmd4_l7MQKvNVTPZw4-SA_1747921421
Received: by mail-ed1-f72.google.com with SMTP id 4fb4d7f45d1cf-601a4d2913fso6029996a12.0
        for <linux-doc@vger.kernel.org>; Thu, 22 May 2025 06:43:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747921421; x=1748526221;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ki4PGz9MoGwpt59sUdcbcs5elurUJNkygM0DwmzXjgk=;
        b=Dlm76Jfk4kqPYhu4QFq23HwlaIwDi6JFN3U5i2Dts+GyxT+QVTA4w401wqXFuqxBX9
         3e37vwPDVYzOBJjN0DeNkqafdBrFO8EHoF/2sIN6NU/PBdlvAUXnR1xyV35jdmeK3xUE
         U1LZKNLUR0eJItFWvj84SUfUMHCYs+hI1gLmOpoVClt4pHz/U0oMaTpnEyeAnj412Omn
         PrzuW0xB/0xaYQYybRqDT9q5PkI8C+ULkxkscmBWyb3HHBYzVOVFDU9irxI64DL9+QwH
         iHKjPWf9jDVvN0oK20o6eby/CVbRvQwn4tS1pbsmwdivxdpySdySSkdG4LgN0O5FW6L8
         DAeA==
X-Forwarded-Encrypted: i=1; AJvYcCUwEzzm/4akVLf69kZREDCwgf1X1+aAL/PBNETLm8dQOGxTCzmsi0ZC7w3/M8cTdCnXArLcvFUg1PQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwUsnSjlJwMLsR/xlQwB1o0UWhCZQcciwayuxQhm/I6zAjILIPY
	drWU2WY6ecWj+FgbAK6vtSZzPsYrZjMrVbH27MaK/wmXcIBwhi/RZoOp0SFVKAVyzeLy52kVLTu
	raXznJyPvKx31GJ5O7TCjIoughl+JYRs85LpGTeqDEV0hiNSFpwQ5Yh6nzIVybaDQIZ64umaeVx
	L7BXAN/ysjosHPfPaPIiFnhgRthCxHPLZI/99c
X-Gm-Gg: ASbGncu5asKrdkuBX2Af/4zvCobPgt4VN38gtfRRcJOMxnFH+e8tQU+5gB6X8U8DpMx
	7yV0IznZfrz2GLpMIChxNp/a2epYmBETJ+FVOPmvGlEjFXhJYgDP92alKzXaOeoLgysQ=
X-Received: by 2002:a17:907:d0c:b0:ad2:24e5:27c9 with SMTP id a640c23a62f3a-ad536dce79fmr1894669366b.44.1747921420847;
        Thu, 22 May 2025 06:43:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFApJlcKWeBv+I/SZdgDY/l7/3GBrRjoB1/uHm1DvRsrdhnUNEd+PLOFGC7roeOx4o5yrW+a52CQxM2LWr2/4k=
X-Received: by 2002:a17:907:d0c:b0:ad2:24e5:27c9 with SMTP id
 a640c23a62f3a-ad536dce79fmr1894667766b.44.1747921420478; Thu, 22 May 2025
 06:43:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250515162133.29507-1-costa.shul@redhat.com>
In-Reply-To: <20250515162133.29507-1-costa.shul@redhat.com>
From: Tomas Glozar <tglozar@redhat.com>
Date: Thu, 22 May 2025 15:43:28 +0200
X-Gm-Features: AX0GCFt-etal4vUs3hVowp4ARgqzJUvnCHub4_m7VLxKDnkkY-r7AMpHp_xdrdw
Message-ID: <CAP4=nvR06=j8WpNbHay60_f3bNtYD+0yHdvzEnm3O+7oT6BZww@mail.gmail.com>
Subject: Re: [PATCH v3] rtla: Set distinctive exit value for failed tests
To: Costa Shulyupin <costa.shul@redhat.com>
Cc: Steven Rostedt <rostedt@goodmis.org>, Jonathan Corbet <corbet@lwn.net>, John Kacur <jkacur@redhat.com>, 
	Daniel Bristot de Oliveira <bristot@kernel.org>, "Luis Claudio R. Goncalves" <lgoncalv@redhat.com>, 
	Eder Zulian <ezulian@redhat.com>, Dan Carpenter <dan.carpenter@linaro.org>, 
	Gabriele Monaco <gmonaco@redhat.com>, Jan Stancek <jstancek@redhat.com>, 
	linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=C4=8Dt 15. 5. 2025 v 18:35 odes=C3=ADlatel Costa Shulyupin
<costa.shul@redhat.com> napsal:
>
> Add documentation
> - update Documentation/tools/rtla/common_appendix.rst.
>   add SPDX-License-Identifier
>   add section 'EXIT STATUS'
> - include common_appendix.rst into
>   Documentation/tools/rtla/rtla-timerlat-hist.rst - the only file of
>   rtla-*.rst still without common_appendix.rst.

Those are three distinct changes that should be in three separate
Documentation patches, and not together with the code change.

Tomas

