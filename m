Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 870DE3264C8
	for <linux-doc@vger.kernel.org>; Fri, 10 Jul 2026 21:49:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783720169; cv=pass; b=ikoe8iV9IcY/Vu1OW/iyq5jk/UNofp0Q4cb6rzsefyXELXHYg4AC07CfqgPJ9/xewak8BYeYDRZO/nFLLfc5EAR3kJXVtvqrTBNNbxwdmIBWQrOI7qMNVMkYA+9mOtlWMPkOckGV3eXCFA7jHUxsLiRXybL0O6nHc2p6WORCFsY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783720169; c=relaxed/simple;
	bh=C48jzYSddH3EoJGyWKvhrzEBN36de2rVF/7OCoPEX7I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NcCneRM8CdSM7/pbLFPqxCfjKuo921zvCz0xgFDvtmCZvHF5isw05KDZadfzQwiiwDpRSzHyICVWUTRwININRoTsc0WkrsVnwMKfwpZqF7Ox431ONiOYOALnxYCaMjLZJXfJv19Be3v6+NwNn5+QiGk5XMiiE9hjusYHBiBC/2w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MJf93cP1; arc=pass smtp.client-ip=209.85.219.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MJf93cP1"
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-8ee43b3e5abso9962026d6.3
        for <linux-doc@vger.kernel.org>; Fri, 10 Jul 2026 14:49:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783720167; cv=none;
        d=google.com; s=arc-20260327;
        b=Q7Ia9rzGtCwOE3FEh7LlZag7H1WDjW957giaZZKWRFXrP5KoDRNthYJ7eb7LvPE/d4
         H4dJz3LAoBeIbSLeL8e12AN5U/U8IIDl13M5wJlZrwUhf14gGzR+g2fKn1BPkZ9EKBcD
         ixMPDkitt2wyapmsJwjz+ZJJ6swDWseyKc8qCJ8LxW5d6twrnUsVc42Qo6H0wwbEYaUt
         Yili3kaaHSHvcf3qWzgAhDTiC9EoL4Qmb2SKBvPDZlo7Frts4vTcfhuxRwFq6hRVtRYX
         gQLblsd9X7O6JmlawAIZI2JhcgKlusc80Qy5Z5fLZOYc7gDT1bqqwUcDVdjqZxj9IVS2
         Vj6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FnFIkE/w/7PZkG795+BpgFkK9Bqx6yUw4d2KF56dPKI=;
        fh=RzNMLrEGaslcNHxkuLWYAH4qAJvkKQKqLP9SsoHxJbU=;
        b=LVwKMFYnA6dBobOYbagtEeP5jUvkt6U5/tBju1I8cGD+UhN9Du2NSM5AF+mFTvhx1j
         pCD/qhdE2LMvBslB7BeXghX8+/NrnZdGvk7zexM/NPjTyNIA23Qj9E4mupIRDejjLFJ/
         k2/DSCM1rb9wAzGENMxAiKMB+T+S04gohSxYr8xGX0FHC0Mf3JLpeAp8rq6Pg9IgaiFJ
         nacJu1lfrIv9ldWBmUpZc43cDia1bsHeQys93QtcgH7kKURI9oEKpt9GU2gwewm9EHfp
         muvEGP+PGPHoWouTJfxlSQoGdIoB/1ko3DmSYZJONUeX2ypRrfpSscbzUdGTG7solVgs
         qIMw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783720167; x=1784324967; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FnFIkE/w/7PZkG795+BpgFkK9Bqx6yUw4d2KF56dPKI=;
        b=MJf93cP1YLC0cvgOmlgCGtQgOj8cRqxs2VENLtj0JhHGfN0+dmvtMitu381J2GHhnk
         8oDaW+2C3yuwTatEZImx8a9UZbJI8nk8hkvtaJHGK5cqoK+1sl2QKshLb+K/MfNpS+bZ
         /6DwS1Qv3w2EtKWjnlUZ4p9tXtql00rv0MgAajfnnDMMczXMchktp+21P2xl33J3RdDw
         ZSr5EXXwszKy/LjtCIFD2FIov47+Px6GjEYnSGJ12MDz2blYcFzr/0wdO68nkx6rI2jA
         ibTCnlKb4YER4xCOvl6hjpN7u6kVX3DG2/1nQ41hoCl8BehnubSPeB1puB1hhzeoSU9N
         G9Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783720167; x=1784324967;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FnFIkE/w/7PZkG795+BpgFkK9Bqx6yUw4d2KF56dPKI=;
        b=LY8Gx79yRVRHUPsbGLeSPtqa1389P5I8dJVQelPDXTnGoc0xsfdu09FHVozYezbhSN
         Y1BPPivMVt8IELKVyc4IgPT+bVt8XdMLrUIqfi5ZNTkfAaMimnOwRs5XUvjGb7HJ46mH
         RJUHQiAuaAIiqDATJt4/uUcl4EQiQXHg9cgZ1CKRKq2u6DDA7wspQ7ZCPDtGLtGEWTZD
         p+SvFD06vh8syVP/eUzdQ/kPQ4lFRav/Usnl9vcS7zwh8rv1o7KLs+F0Vck2IzSAZkxC
         XcdKcETtA5B+JwI8LGQYIWstpgr4W1j8UdCvhcF5KBAoFo/yLnUiaDfEzOTRXwfXg0PT
         a12A==
X-Forwarded-Encrypted: i=1; AHgh+RpYyjLFD8zKmNJKvKL0j31wMsTlf/gq2vDIZ1bd97uS1DqY5whmI12FQbpOuHeVO58PUw6WRZMdeAA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxUYrotxX0kGYDjs29m9x7DNqmfVni2DO8sOvManozthmA3eYBX
	TvDWI8bBVYOCM3XyDagSZwL3XM/UKcsWzTGOsNZt3J38DekLH8Z0hARTnBO8/yh8AhX/r7KyUUl
	Y+jf7iomYVhXP0O/A3ErQrpvXAqCMcRw=
X-Gm-Gg: AfdE7cmqW3C5xRgH/0DvHGsaROvR77sljIRrmt2+TfvLLVwPmgas9u3ld7PHpHV+7v+
	ZO9H9b3lDT2QFaAdRWPBzzICQ12uLAIlx3raEaQWDWhQsvmHSWBcqwMgLVbpBWH8Der20wtUrUM
	QBoh/x7+9kCZyiHbqO6x2CgSLiSlZW43Vq/CGgsYY1lPyv1gwwCq85gC/1NrC1f8kDqJhO3TP9Q
	/DiLSo8zRepGj26GRZtD9kI/ITYLzeKrAgi56SU0jTWcrdVVMPdAhGzrgfpqwLIBdrohoFMy1rv
	6gn12Y0rnAW0eCeq3icQomhy0UVoQKI8dbJdYz/kMqEl7reqnGC+8TPpl3SID6vZgOk6hM5LJcs
	b1XH5kfOoUps=
X-Received: by 2002:ad4:5ce4:0:b0:8db:4069:6e6e with SMTP id
 6a1803df08f44-904004833acmr9772646d6.6.1783720167283; Fri, 10 Jul 2026
 14:49:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260703181326.47524-1-amandacorreasilvax@gmail.com>
 <CAMAsx6ewmXd205h37LDTzj9FgFasgodNzS51KzSEH8M_guNJGQ@mail.gmail.com> <878q7ilkg2.fsf@trenco.lwn.net>
In-Reply-To: <878q7ilkg2.fsf@trenco.lwn.net>
From: Daniel Pereira <danielmaraboo@gmail.com>
Date: Fri, 10 Jul 2026 18:49:15 -0300
X-Gm-Features: AUfX_mytO_ifmQrIP-8ku9-HOxdpDX6_cjSYKFeOPIKD-9VaaHRQeheb9p6HBw0
Message-ID: <CAMAsx6cwhQHHejryFq-8-C9dGjk+YrKOb9pcX_KdJ9=EgBNkNA@mail.gmail.com>
Subject: Re: [PATCH] docs: pt_BR: translate the management-style.rst to
 Brazilian Portuguese
To: Jonathan Corbet <corbet@lwn.net>
Cc: =?UTF-8?Q?Amanda_Corr=C3=AAa?= <amandacorreasilvax@gmail.com>, 
	linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Em sex., 10 de jul. de 2026 =C3=A0s 16:21, Jonathan Corbet <corbet@lwn.net>=
 escreveu:
>
> I don't understand what you are asking for here?  There is one email
> address used consistently in this patch, is there something wrong with
> it?
>
> Thanks,
>
> jon

 Hi Jon,

Apologies for the confusion. Amanda had used a different email address
in the 'From' field of the initial patch compared to the one she sent
it from. To keep our records organized and avoid any mix-ups, I asked
her to resubmit the v2 with consistent information.

She has already submitted that v2.

Thanks
