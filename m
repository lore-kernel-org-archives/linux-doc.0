Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.178
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792513436;
	b=sbbIRZT9bdFlLhwk1cf8Sr/qw9r7ggzM2uaY6DpcTSKizLpBQkAhgNRpxDRuSDq4s9V3
	 UlIACcl12ELffdDYV1sT65I9OunDmlxkw1PCcQb9bbTtT6wYcHhrTC6FL+9B8Ur9LzmMt
	 ZG3KtPEFk9SfxxRNBhS8egAjnLrqa9WNmQ8P23Gq1Y41ITiRmpcJiBwmnr1eXw6MEue7r
	 hV0WpSw39Xq9H1cgdTWg89f/O4tzuJzxBQ2lZ071PMcmUvEqQW4EodwZdsx1nUePF8YzY
	 OHc/YsSPqSayRzXPb0XWn69DTqL+Byfxkjh1WXATijrqJGXMlwtXjyfxc06fHtvrG0g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792513436;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=1/TU1fx5Q7KS3NNxFTqPhkwN2RAGL4ewSYUEXSsjILU=;
	b=fkcuwjScIvv8oYZRui8/rNA5tio8gsMsBCAg35TMJDpS1u9PnTxFJmwdW6tDM00CSgLK
	 1kdpoMMTLgXrjRdu0CQmBPgCJt4sm5ntFqExWzTlC8MwVfm/UOHzCT6ddwO4ASX1VhLxI
	 ge5SHPwf0PRDlZCW26UvUP0ocHaxAadBn476dB2+w10llybjawkgpCuHX4IsfzR3IEQAn
	 T7o4BGwhB/y2zPoWjI6UpXFuIE//ZdNuwAq6UImqYAbnYNKV5qrwR8ggxwiZmUXsVapag
	 e2CQ/oOyBBYl6zLM6uydSuWEOMBMzYhO4r5wsHrLw+cznZbQNu9czRKzCiF12OEarRg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=nNJAyjCA;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8D97606A320
	for <linux-doc@vger.kernel.org>; Tue, 20 Oct 2026 16:23:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A8D97606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=nNJAyjCA
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-35e8253292cso230454eec.3
        for <linux-doc@vger.kernel.org>; Tue, 20 Oct 2026 09:23:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792513435; cv=none;
        d=google.com; s=arc-20260327;
        b=hrkW2L8EQX/Tn5ABF9+XgeuNE9uSGUAX4oTDlgx24eJv/vzks6pkRaQUv9jAF2SFxi
         y9KIiRPpT1KYs3wM3BQchYaoiXh7QnSMGOIwm21rkw8YMOiiH7IEaEtqISNy119hTx4g
         qxh7r59iainLCiv46A6BFB0sgECmH5wshs8yXvoi6MhGJdEjceEqEgMkcJEkmpUn88Tl
         gA1CO3bBUvZZKLQRxKVaQJNsBdm/YSsYI3ffe+wacnVHLfZQ5V0AZ07DSkaf3GRkXqUi
         RdE3+xCyUms/8GUuf6mQKol402na/8SwbvGxhtHxoYIwFU6RJF12jByoGQzSV8iDC8+j
         6Wig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1/TU1fx5Q7KS3NNxFTqPhkwN2RAGL4ewSYUEXSsjILU=;
        fh=UfqLxf2HCv2yFB+FMA9AN2rupKu1hH23kGZol19qSDo=;
        b=gyvRUx3UWeNZRxk0JbGKJtJoxv/obJ07N2W8sK64zgXBUPbMicl1318LNpzbxVB+rZ
         GGrbdkDvevF4oLvONoFm0Vlx6U+JzJnOG2AEsvBLHqAvfHN4qz2bEIgd9PwFgwgO7W/k
         5wGni12ihh3bwh1VO+OViNThlEeDSUF+6DW6cn6pTidxic51cueT25B2WNaFfmxOvegl
         2TdKE4C+vbhOuYRXqh/FLTN1FwDYTwesYmQ699xhBliWiIqCb8gET7sVhIKMo/oabqrV
         JX18uZFRVmdwo3ZKGQQyMxSwm+VFXgxD3RZWIip/h1LQTbRCmXbKeucM337eo4Dop1t5
         oUOg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792513435; x=1793118235; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1/TU1fx5Q7KS3NNxFTqPhkwN2RAGL4ewSYUEXSsjILU=;
        b=nNJAyjCA1cBtwTNsbNVgKbr42Fi2rxrR0AfP1I3EeNVC2GFOPbZzecenbHeKcp0763
         qlUTrtVJHbBz+kOuCzFOkQsDsTFo4W3CIiQxL+dXKPxYMKuPL9MGv3c2JIPRu/SGDt9t
         wRGSzHBAxq2gIQaYhRjmaoOVm6IvWlSd2hLmnzUoEEI7PDenhNsNoHVAnGWxBXqp6Z4G
         4GUiA+/JjyrtHoXM38Ik1qjtKbQ3+epNp+KSjx1NeRqAu3AI4TtVaPgITFEMLjJW3Rrz
         xE2SQkOuL1B20fBoNghYNTqsAnWLHLpp52JYVQUAcXlWWX+22A2MP8MlLzcVKezcpgIO
         5yFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792513435; x=1793118235;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1/TU1fx5Q7KS3NNxFTqPhkwN2RAGL4ewSYUEXSsjILU=;
        b=YB3aWTjq2BtcovK78QGbz9nWbTpUv7v9DtI4FrVzNEaoUpepoKr9sXdgf8O3BmcEFv
         N/SFUHtl6sEZKqqIcRT80fw1EGYo4dc3xRb7ZZmnGgiN2AvJDNm3ciZwc3EkBQ22HKTz
         3/4GTM+IwZzT1qThfBv7BigduDsfozvbXpYm0xDKRfHNZ1WY1jQ3Vx2G4SUcAG4Ek0nC
         KWUcm+/msTV2kfVROfhpQNDIaj15yYCwibXecZ4zmS60h9EqUeoMAUWhJ8KEwrg9gtKB
         wrbVq2kvd1pg7IS4wFJaiPqqHpxR86fH/DuYDrHepBNf8iqicQkHNznRGDFzda8S5I5E
         as3g==
X-Forwarded-Encrypted: i=1; AKwUvBzGeuihyEpcvOwApptYRaMqy6i/b50tpO6+ikEsD6Y1+tfhbdNS2y7tl1DLmATQQHE9cg/an9eu52s=@vger.kernel.org
X-Gm-Message-State: AFq9FYItpV9ikJ0u1MgL01Wjwek5jSHjrfdpZ/uKT/glBJ4Tc+6gY8VJ
	JFRY/h/Er7XRqdgY+UZI/tpnuYCMzY8IwfQ8UHYlwhb/aOA/ktYPeyY5rWGNYSPtd79hELNYZC1
	DFlTSut3m+Tk1z+XIj8r2I3PuJtRtZRE=
X-Gm-Gg: AYBFou3IDlpu0S1KMO8AAMYM20AoUyaJdU2IHo3cLD760+5oFmGPrHvQeEzMYKnORQF
	eu0f7xVh0oqeVP4y9m3oCJ38IViY8j5cIO+ET7dEcTYHZnVahSCiB8wI0VZ5gRXcbF0/Y5hosvz
	XBsDC2hu3tg8TkU8JOTQr5lUot0xjzt1vVuV0iUvSfbN89KIwp7ot6shNBEDakXC18q6+ZB+vsE
	BEqiGM2Y06eQScy75Vwx+3Dhdt7HoEnhzto2v92/kpFS+EgVcEDMRuU8ZeT53uC13FcEZpF+pvd
	6LdAJAY+v676Y2G/nr/9DXD1GwTuSa0AxrtiQ9mE6vGACXkekUuR+s/u48HwsK7rYQMSQpJIpU2
	0svzezg31vwBTeGwQOzpvAUoVsdOG3AztfmZW/c2qQhe8lXGh8mnWULUbguUD8WgIjKGYi0nksj
	5eO9fNFF/JUKxrkHfJo2yRTuIB4mKZHkLA7yYUjtiRN29qqUmD/g+WDLvUj0KTKDye8b0tniDv0
	GVKUv9Ap+fPCBjiv9jLSLKOM1scJQ9IFSA/
X-Received: by 2002:a05:693c:409c:b0:35b:cb8a:8ce7 with SMTP id
 5a478bee46e88-361a06a6544mr28167645eec.1.1792513434719; Tue, 20 Oct 2026
 09:23:54 -0700 (PDT)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261016152828.3765695-1-sashal@kernel.org> <20261016160030.118973-1-ojeda@kernel.org>
 <20261020133156.3153106-1-sashal@kernel.org>
In-Reply-To: <20261020133156.3153106-1-sashal@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 20 Oct 2026 18:23:41 +0200
X-Gm-Features: AclHuK9Pd22EdXpHIfqU5N44FLer_q0ZOIvVGA7MYMY15OzC7aZuyhpkAko0zds
Message-ID: <CANiq72n9q93=usmoPqey_ohnrZ_nQOwvZfPYLAXgb0h1-NSjEw@mail.gmail.com>
Subject: Re: [PATCH v3 0/7] agents: add skills for Fixes tags, stable tags,
 similar bugs, and commit messages
To: Sasha Levin <sashal@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, broonie@kernel.org, corbet@lwn.net, error27@gmail.com, 
	geert@linux-m68k.org, gregkh@linuxfoundation.org, kees@kernel.org, 
	konstantin@linuxfoundation.org, ksummit@lists.linux.dev, 
	laurent.pinchart@ideasonboard.com, leon@kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux@leemhuis.info, mst@redhat.com, 
	rdunlap@infradead.org, skhan@linuxfoundation.org, stable@vger.kernel.org, 
	tytso@mit.edu, workflows@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 20, 2026 at 3:31=E2=80=AFPM Sasha Levin <sashal@kernel.org> wro=
te:
>
> Could you send it as a separate patch to Greg and stable@? It doesn't rea=
lly
> depend on this series.
>
> 3/7 only drops rules that LLMs follow more strictly than the stable trees
> actually apply them. Adding a new kind of fix to the list is a policy
> change, and it should get its own review rather than ride along here.

Sounds good, I saw you split it in v4.

(To clarify, it is already the policy in practice and it is documented
on our side too; but I agree it is a good idea to discuss it
separately).

Cheers,
Miguel
