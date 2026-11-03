Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793715571;
	b=b1lqhdFzRLGI7Y0kijwCf9aBWFfDNQqSsAR+g59H0pEWdbaUVKwYXlRMN1Uczg+32oCv
	 s+GCirxd1PLHscNqtQon/bv4OAOy4D93IwpicadgUAsvaGGJeoo2kKfGGOAE7TNBevMWw
	 QRSE5hh6s79jn4ezlFNCN9q5h/fRJYdvx3rPqCgAjRujt/TimktyRBiThet81igPzjXIy
	 F3oniyJ7nD5W+2+DLEjNFG6QBlbqvW7gJQ5gTg5HfGsSa/ZIC/B+A/jDpxH7kSjy0ctFM
	 Lqeild0rzejyiJRqHW5lOBzx3s2ONuDImRhknqSvp8UkyO2T4txdC1URcHcjQguZr3g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793715571;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=HpFqXDcZjRJLrcm2pPsLXGktcBKbRCtBWwGzeKIx7/g=;
	b=LoskUXgWknqKvhs1rb/HZ6/ti02n7zZlxGHKq3DNQJbfyTqqWGht8MLDa+XlOkg7e0R5
	 gDgU4dfsjCTCZ7iZXOZIqLln31ITbYGeW//E33rE0Xl578JqNv7Cdlzi6cIKBSpXL8xlq
	 5O3Jl+TkNzPWTSwFi/bKZkQGDBqzhpqmKxIbVwD+dJ6nuJzccMKovWsJCxI2WdWX/nfM0
	 pTccGYB7zfJ/DlcMjhD3JB/VqAJDIs1LwUrkZxzBgk4zYGPXCXBIwM2yBfqyGCl2wQyEU
	 wQdLGsrvD0FbJEBa7C2Q4mULPMHmdQFShKZIhO0bSdOV2PpM88ac9g3kbhO2o3UFHzg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nYVuS7oN;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.44
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90F0E606D815
	for <linux-doc@vger.kernel.org>; Tue,  3 Nov 2026 14:19:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 90F0E606D815
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nYVuS7oN
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5bfbc25a76aso891015e87.0
        for <linux-doc@vger.kernel.org>; Tue, 03 Nov 2026 06:19:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793715570; cv=none;
        d=google.com; s=arc-20260327;
        b=k0/qf7zci5x30hnkZDW4xayLMLso1dihWrs/DZwyg++yAo8FXjG24js59JBTHVeAbb
         pEfkx+73OuLQoSQNK96oNeCDYo8Ba6LXfpMAVUt42lYOj2R0RCgM7UazOZw7TW+hFgpx
         VKS5wv/Oa69WdcbgbwYinaSgtTatvq6yB6bYUPze6EoAx3DUJ5f55MEvX8muOl+50w7c
         w0Ze34p0YRj+aWk0DjXzs0D4/DMXbsevRdPJ9UiefWuMQXtR3duGxdEyb4lUHaPC0WmM
         pyO+jbS4lfJCchy3MA8WmwwxPTtK/gdo5v/3/FoOVMbh26/tuu6SqSoRh4jWxz5+rdK8
         GmkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=HpFqXDcZjRJLrcm2pPsLXGktcBKbRCtBWwGzeKIx7/g=;
        fh=E3HZeVULP03xG2NGHvYeEGzVIs5ZZasHF/Ja/rdmz0o=;
        b=lksDS9IaXFNlKpEwiS/bwnqoQvFXVK1Lr+KgiEwFdGQGQdPUtbSw078CRoXUFeZtMV
         lrKplXAyfHXtCtx2nT1dXlqaXKnReSZayM7F0/UkQ9gk7OvYmiLNLVk5Wqn1vi/P0dYy
         49IMHYBltntI95n+Yn4N9S7RQa5iAhq4t+EaByTechWLyMxxBwx4spYicI0bvEmrBgcz
         lTad7y/j078Ahy/f7UtcC1qBZORjhFMpP+mMBCxUbmYBQgVuJAHbe8Kf4ZkzSsc/iD1F
         7b2jkzbz5rYgupwWi1tV9pOoKKiz13X0A/RlUnvVzOfBOkySgemtNDVFBl2R60YvARfb
         8SKw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793715570; x=1794320370; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HpFqXDcZjRJLrcm2pPsLXGktcBKbRCtBWwGzeKIx7/g=;
        b=nYVuS7oNjAC5uc7MgThJnLihQh6ecZjNLU3BG73OcVWyDUz/zUpCmKWRdP3Uw7XMsU
         oyjqxVh7rNpgq2yeuVgz346VhA+PrdpJSYX3reNs0H+YTX1Qrt7Atx4AGdLblnf6DXGG
         QUQzf8Gy0xw+PKLt5C3B1MoQFqqGyW3skmOqmH0avdWqG1m9nwVwXE1maS2knPLmckGJ
         dBobYx2IV17qf4yXHSfQG32nQxeiCXnfGdLwQe3G0kJ5mxE8oH6XcqlA6uCDdGdPO7QO
         OWDpjVMnu/9SCrw8VCHgJSW76JtDOenWUU4kWrwMoWCMsSboev1GDzWn5fdoRGOtrOfu
         Bh/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793715570; x=1794320370;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=HpFqXDcZjRJLrcm2pPsLXGktcBKbRCtBWwGzeKIx7/g=;
        b=05As0FzA1SWGjQMoXRuI+bhSbArlgm6QeH4yYmP5jec8Vq7T6Duz6ni9dMZyFiBYKI
         c/s5d7arnEt0TM+hgF/32tvVp5EMuapcUHW0nARv29e0lSKvEiXTiP5byW7bfk9PqTFR
         9znf/ZY9bXVdFpKeacIO7Qo8dRSVCn2sBLO2WZOR+gex00gvE1R+nVFaa2Lz7QX0whwL
         dM3FqV3LeIufV1+rJJsCl6Id6CMZOINO2jxJvqz8zRw6zG8ccemJrHtT3LBB9MCRkqDn
         Ec99o6KOfKZjXfiC3FQpTtaxlheR4d03fgMb3+cvMr8oEVt0KKIeUUA/rCog9iZjGSOu
         Syog==
X-Forwarded-Encrypted: i=1; AKwUvByaj3l2MQKj9GY1gi3QP/Ym0/7jxZwLtOenB0oDHCwzXt+HE0CtlKUPn9cTA6iOOEJ1L/kBLvqErAY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/iMCN5lHxU8ns9+Fm7rLUqZZKoMGG95PhZdK+EnOkQvyo7Z+ew
	GX6q0Prv9crzQfM9ZUWPKZcR2Mnpo6/z/lxHnzXBP3waTMnwrIkXl+/tufN+b3KqFKHF9Nk3DE3
	j8Y+vX/ieoML4Tq0M5t0uptJS2adVHnI=
X-Gm-Gg: AYBFou1gNqBtuwCqXQTx3M6LwGo9rX7XuR62Xo1Olxn7D5dz7VA8FpVHhbPtcOdOfr2
	qyY+rZEFLVQzJJ0dztkyiJB1qsGp4OY/tdvhgEtD+O9rly8Mu7+kUX2mpY2cVK5TlvEx0A2SlhO
	mMj5SF+frrtCKwUe3iloWB/5n+OSu8nTM37jwbjqktvXp51wZBPHdNjnw6Iw3vR8a4WsK8d4tKu
	Yz8X8HwBWdkvrzlAtoEs9NNE91ozSQPl5OaDN77XBpQxNNqEKXI5qKj9hjacIiQDGrjtrUallz4
	3mZtz+kqIyjHyxaCQ788DIbPzBXcS9iGa1WKxGYxcXdC6xNh6B3Qg0g93CmlBm9gkjONh7k0KNC
	mped94N1VPtn1GDvtuoB2jlLVhEmxHLeeygvMyiINyTSai3BWIx659DieV2bIRKLicikMapAkns
	6DLQ5gu0HevS1FA4JGwmDm/ygI1wtUZp5rXfVeawT98Filr5NahEP9MadJia8oAECjXXY3GdErW
	s3Rb6jzJFn3pQNpr5tkdZ19tH6uVGK+V9Gh0IAdLzoI
X-Received: by 2002:a05:6512:361a:b0:5bf:d2aa:abeb with SMTP id
 2adb3069b0e04-5bfd2aaacb1mr3055248e87.20.1793715569649; Tue, 03 Nov 2026
 06:19:29 -0800 (PST)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261102-v4-v4-0-88f2f24a5f0b@qti.qualcomm.com> <20261102-v4-v4-1-88f2f24a5f0b@qti.qualcomm.com>
In-Reply-To: <20261102-v4-v4-1-88f2f24a5f0b@qti.qualcomm.com>
From: Daniel Pereira <danielmaraboo@gmail.com>
Date: Tue, 3 Nov 2026 11:19:16 -0300
X-Gm-Features: AclHuK8iuWx_PT6P7N_TCJlCYwfej936uif1OBa0Pk_vlcx5ZLqlhS-8ZHFWdXc
Message-ID: <CAMAsx6cNcqHLHHgS5ZxvnK2fjrV74WmsZ+8peLvu0gwPjFr+6w@mail.gmail.com>
Subject: Re: [PATCH v4 01/25] accel/qda: Add QDA driver documentation
To: ekansh.gupta@oss.qualcomm.com
Cc: srini@kernel.org, dri-devel@lists.freedesktop.org, 
	linux-arm-msm@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sun, Nov 01, 2026 07:37 PM, Ekansh Gupta
<ekansh.gupta@oss.qualcomm.com> wrote:
>
Hi Ekansh,

The document reads well. I only have a few wording and consistency nits:

> +The driver binds to the device-tree nodes described by

The kernel documentation spells it "devicetree" (no hyphen). The same
applies to the other "device-tree" occurrences in the file.

> +4. **Context banks** (``qda_cb``): creates a platform device for each
> ...
> + They are created before the accel device is registered

"They" is ambiguous here (the platform devices or the context banks).
Consider naming the subject.

Thanks,
Daniel
