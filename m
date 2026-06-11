Received: from mail-yx1-f45.google.com (mail-yx1-f45.google.com [74.125.224.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98FD03E6DF4
	for <linux-doc@vger.kernel.org>; Thu, 11 Jun 2026 11:31:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781177484; cv=pass; b=b24vvxvg06Wrk+9rCdSnefADWm1THatNjxItOS1DzVF9B9SZNf/W5OVuLSowqsXynE94sBvT5wHfKsaWX4pbGKgasohdTiYfWavb/EP1Y3cMyunei41/Mx4sYWVbsOnnw86iR7rQBrzy0xglv4sH4muPqI/HwHAYmH9G/RsVSys=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781177484; c=relaxed/simple;
	bh=rkPyzTcsuTtCf2t2tLha6H3hi23Cy4jWEal7QvWBuvc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Xk0UApovMKOHjxAiD/nuywjWbbU/rr/7b/ZwC/3Xf6+TOiUURIPckvy/Udd+s4Bbs+ie7+MmBXQmsJ8QxKUaEH2apcczDo8h6WX7NhKepm30ERPp2k1IOudOsWbCtookblwHxJ1h9wFOUDMDtbOZmmaKgEN3p/TA5mKGFvpL+RE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=fVVhNx8Y; arc=pass smtp.client-ip=74.125.224.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="fVVhNx8Y"
Received: by mail-yx1-f45.google.com with SMTP id 956f58d0204a3-66077f6c438so7055980d50.2
        for <linux-doc@vger.kernel.org>; Thu, 11 Jun 2026 04:31:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781177482; cv=none;
        d=google.com; s=arc-20240605;
        b=A5p4Cw6QnXF8YWhanhY0ygY2sddQJt8p4oIjqf+fQKS7qSepfTeeCnZ5nB/zj1Ijyz
         tYjIVVUtJt+eOx1nQjtmWUurtHYDMxzC0TZHZnK98eWf/ExYigoFpV1aJYs/qC05/AaP
         bgFQ7Ih4cEYQHwst+GAvAmkpKkEPUOhEazmyCtGYCoJS6sOUldw3+BAzDRXkWrGTewgY
         R7K2mwiCYeZkCET3ARgFJoVQE/a2C51us1041Z5JGnCiKqXK36nvC5xHdZXDjRp/kqTd
         Z6kY2itZDIpeEdSPsSq5Rm7OfYrMb0IXmdiNu4q7TqBGy3Do5IojSANmO/F5wPdjXR11
         mnBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rkPyzTcsuTtCf2t2tLha6H3hi23Cy4jWEal7QvWBuvc=;
        fh=/5ED6P2QMPVhtRAWfyIUAyT7wasuGTPUyGSvh6antAg=;
        b=UY7uriF/Xi2zyOCpLtbRz+Yps74+7YVhSchtzuGxR8W4Puji+O0pvB5FmX0U6vul2z
         Mb4ZUNxvE/m+WsboYZglQlN8nVu865rqlWWIqr9F0RG5jahASI7ce/HvjIX0n5p/1hDC
         zsc2cFg80r7LDNOv6BXVUfl0lIuZ4JghZuvdhHrsZgLK0xiytWgpUuFP6eyLA5vbLAcu
         Tpj9vMLfyTty1LKoNCiw3ykGyJLfACNkgN6nYaaeGXRtZIoihZM8HVl+E6rGJ5sa9KpL
         61qfSuWzKu00iZ3sJe7hSQrj5JY2CNM4WCvi7mL5p519SxwKQo7aaB6Kp8oHtlRdCPGI
         /mGg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781177482; x=1781782282; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rkPyzTcsuTtCf2t2tLha6H3hi23Cy4jWEal7QvWBuvc=;
        b=fVVhNx8Yl+zWaPs9AJo585ei6wpI6uOSZ2uLOyUApLQRbLsAnpfo8V8oWwQ3pL1CVC
         g9IF9rba7fjBAHpi99Z3R61yZcLbpypAlxPOg0NmaTm3oW74dOx65M55Y2jgMOcX09ML
         uwoStyOCAnv5K6LNoDhylNYpWzjUcp/NJbi9JyWmDQhbzT13jllcZG8ngSNPT1XMXRD3
         2Cx2vm8LouZpgKqwhA+fUp/jiuoEU8xl1J0CAzornvaWp8uuEYI3GTGYG0qSg4oIA1va
         kKZq8+DaahkVNyq/0Z+gv46s/XphhLRrdXcx76mYzSRGsY5LSUix2Iq4Y1uiu4LH06gg
         XNiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781177482; x=1781782282;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rkPyzTcsuTtCf2t2tLha6H3hi23Cy4jWEal7QvWBuvc=;
        b=Uim+oyq6ApUq6H24iO2XqkCwCTZmqo6t9F94SY/N/fHbkgPgp1zVJ42w3NacUxirUS
         ruT/eaCWPx0/0MLwqHvD+mqetFtq2kkqc88hPGELt6A0l84bwc1Xyf62LPJskFvXshyZ
         P2GnujMMUPwnoSnhCyzZuaVc2HQCkMVVIhxwBNnAv6k6F7aMtitQ2wQMP7u0oqqAX9gj
         ipNIyhkiI7FknrTNqhgaRvgh+iQhCxS6fkpZ05sfDsMVGGmkMkOZ75Cg5EiF6tf112NY
         O3ikeo9OOUbm2QlNjWfmE3ggM6Hm1bkaQCSV6+cOQdekY7JVhcydHdtfrsit+5ptpE+m
         QHJA==
X-Forwarded-Encrypted: i=1; AFNElJ9ckMUdhl0VFqJgVCBS5GHkOCjCxb+NVQbDvBQnpL7KE5KHohjHxCt+r9jzBgeNx+/y23olDL3RlYA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyf/m4hPWaYKAq9LABvliTwKZ+UKXFiMkIYuzSkBcII4VbWqXBD
	aPWQFATXkzipPO5zXYBY9mSotrR0BkpJbhBoMzp0q9hRbxNKMbHtvsAwrnE9KbzOFuYOIgWnEd0
	55gL4VEAE7wO8Sf+VCj0Phn2smh/qXroJ0SMv16up
X-Gm-Gg: Acq92OETTZk5B11kSu+kLChzBx/F+UlNDnEIXyZM1pedoIXtCz8M+5td8hhMwr5ZUBP
	B8DvdM8W1oSy+X2z391AqJ3WpcEQ874pQUj4pftwopZ1XWF4FQrzojKyf6rPM8kF56eVCTLF5Ir
	OiDaJsQTol8gPp2E9e/bXcoNGhQB2gJuwT7nzqflzUsAXW9JQ6Tde9koxnyaH6AOPklIVFK+Tkt
	mAMEhjZGEP7arb8MPmnenU1WFBDCkju8gGK5gbLdv/IvKgJ2DexMREMJBhZ+FfpAauEUi56oX5N
	WRf/5vfBC6zi+eUXdyvCj87YYhlK9cpTF9b9K8e1qEX2mdzpZ/EON/NjVnMdISgvi2GIyVr3OzO
	24KMh4SedO+UksFq352Vd8BVid6zx
X-Received: by 2002:a05:690e:400d:b0:660:4b21:6ca9 with SMTP id
 956f58d0204a3-662696bef78mr1797434d50.26.1781177480983; Thu, 11 Jun 2026
 04:31:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1781165969.git.sd@queasysnail.net> <1f30e73275c07bf879f547589872d0916025a52e.1781165969.git.sd@queasysnail.net>
In-Reply-To: <1f30e73275c07bf879f547589872d0916025a52e.1781165969.git.sd@queasysnail.net>
From: Eric Dumazet <edumazet@google.com>
Date: Thu, 11 Jun 2026 04:31:08 -0700
X-Gm-Features: AVVi8Cd1uuBY7qU7bTgjxyQo8MaoMPQFFwULSrOFCaHbtgyAmu9gW5waSPUt1q4
Message-ID: <CANn89iLhV+rJqZK7_A84VagVApz_D8GNU=0Y3NRVF7A=PhJy-A@mail.gmail.com>
Subject: Re: [PATCH net-next v2 1/2] tls: remove tls_toe and the related driver
To: Sabrina Dubroca <sd@queasysnail.net>
Cc: netdev@vger.kernel.org, Ayush Sawal <ayush.sawal@chelsio.com>, 
	John Fastabend <john.fastabend@gmail.com>, Jakub Kicinski <kuba@kernel.org>, 
	"David S. Miller" <davem@davemloft.net>, Alexander Gordeev <agordeev@linux.ibm.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Heiko Carstens <hca@linux.ibm.com>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Sven Schnelle <svens@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, linux-s390@vger.kernel.org, 
	linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 11, 2026 at 3:21=E2=80=AFAM Sabrina Dubroca <sd@queasysnail.net=
> wrote:
>
> The tls_toe feature and its single user (chelsio chtls) have been
> unmaintained for multiple years. It also hooks into the core of the
> TCP implementation, and bypasses most of the networking stack.
>
> Signed-off-by: Sabrina Dubroca <sd@queasysnail.net>
> ---

Reviewed-by: Eric Dumazet <edumazet@google.com>
