Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FC554657D0
	for <linux-doc@vger.kernel.org>; Mon, 29 Jun 2026 16:47:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782751657; cv=pass; b=Hn4xw5VtF3CyRx0ZoeOa8Ty9BUQEfiOnMpf8/EiPU0d12hbyVfsRrhTUTODW/rnyj96gQVPJ1+HlLIZAf+GHJWibBfWx5PLcFbL0G/mK8BHUyr1Gza/U+/2+VT+JNjBnOYtKTnEnNMksY5ovc0z917g9j7wtAITu0kP+gm/U1lU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782751657; c=relaxed/simple;
	bh=tBpXEs4b12PdFKZ5qWeLI8+rTNsHCCaM/hrxzWpfqDc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hVYPZ9VL/unOoObKy3SQCbU1hfdUeZBZHB7nN2a4QocbqGCfZ5MxTz5POrc9i2IahFWFsvHSDcBx1MOs6KzgXh3mPGBLXrgJ5e64iDuAWcPHl0VP/jSo84kB0D40g/PRNJI2jdlfzHJCp23jbx3dOatWYpFPwpjheONv7k9QsDs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MkHrbVgH; arc=pass smtp.client-ip=74.125.82.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MkHrbVgH"
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-30c965eab27so6759161eec.0
        for <linux-doc@vger.kernel.org>; Mon, 29 Jun 2026 09:47:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782751655; cv=none;
        d=google.com; s=arc-20260327;
        b=nZPjXN7WbEIKCGgTJZb9J8kF29Un39+0kZorDQHDTFzabxUJezLCmN/XrtU76gG5OB
         sCvHfJRQhwigXtCwgFIst5tAO0xaR2Vx58roHqqgCUGww5hcg5XSupDWkZ9Rhf/Q+qdl
         ovtHzTvL/Kse6Qrzb0IzXrPdtnFSeqrjg4V2aV+Q6Z1iXUkU0C7gN3YED3iFXQ9d2WCG
         YJ00H6lmhfBzF2+sr7eDvXwcCr9x1bctX1ZK6aoH0sOwg1/y/bJpEdCJ2/tRFRtmS/ih
         8jMHM3tVYL2SvkhOIHAqBWSOe/w0Pdp6P5Gb+EKnInHeC5wZYJEPAzktRwl9nwNH+2Ne
         dTdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=601baKGJW1PrXMaYCYLVau32k8IxTv3AZbP8T2S5iVI=;
        fh=DLF9Gk4mFh9dAT9tAxmFa2kbqBg9L7aSXndzOXEfjgc=;
        b=b98jR4sUNgc5/knbyyWwvEwExBEwVlc02L7XBdZbwiuXZQvUc+lMej5juckl0mMny7
         KZWAxWq9hiaG2m4piTx5HX8YBrkqwoTuMpFDkWOha2wF6KzO0Je2bzx0hZqi9aLjX0L7
         cu5DVp+/vr3h2pz1AO1Y5sdnaUvB4Q4N3YrzF3uJ89wpmx+bX3hbPeq2+eHMt3usciCE
         Frl/uhhjUJzp9SxdIdT21By4t30Fk/IL3d7KljhP6jVoer5rQqCWqidPA/qaxu4PVzzP
         zIeIV+11JSaxamiOfBAmWXlBS79ZmgM1UtU49GXq5j7JpbkD1F1sZDzUdTl1Uji2Yxah
         eB5w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782751655; x=1783356455; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=601baKGJW1PrXMaYCYLVau32k8IxTv3AZbP8T2S5iVI=;
        b=MkHrbVgHH/mcTxBUJfQDzJ5yQQqVCyTcGa8C/2GC7RiQfkS1gkrpkKKm9DTNnvVxuD
         p97uP9jtkNKFc5HA+wkZKYEroPXwORv3Gp5lZpOYlb5TGd4dHe7LQ3D8dJDt7ZwyLSbY
         q0uglD25mQUv1t/ejNxR6HfGKWjh6GoZsYPT0WbMnYKIa3QWX1BBhDT3wj+8YXZZCPY5
         pU4FYEztGjD29SKfDca0Cau2jccQUvg+Y31uH3YYtkvabrN8GBG7qR8K7GJPzzltsQil
         UWlqsRi0rGYXtuG+LI9dj/IszgF0ntRT4NR6IcyTi/Gc3wktZOY4bP28K5O+l6xv1Ksf
         C2MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782751655; x=1783356455;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=601baKGJW1PrXMaYCYLVau32k8IxTv3AZbP8T2S5iVI=;
        b=neOXecQreA17Wu5AJUY82RLwjPa1ny+DsLZeg3QbSRDYLdNGmknOCsuF5OJxGw6itJ
         gsAEcdE5zZJlQhMPQ01XJSMWKFi30kxaJcFdxmOBrP/2EB1juO1TuWuywuadfehd1Go0
         tBDgTknD7+UBxriJgbfNVRSozN3zGQiUNkCwGaLX2GGtq7rumARFFWlb3Zrh/LEKKcFv
         ufYDbo32eYjfLPS5Vh7WXzv7mbV7blbP0+T05uklwFaaTYQqrxO+htxflIfVZfYNF1pj
         Dcd7pZZAvFfN9P9Nb8fMqQ0FjvP5VANedb8dzzergC5q3umJ7YthD0aBklErSV2cPQox
         NHKg==
X-Forwarded-Encrypted: i=1; AHgh+RoigsM+7b7+AmuUkfsUpe3KhXXKZvSxF3ikQcnnAbKoqdWL1glMrYYhbAXpea7zLGwe/EyG/AoOa3s=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy45FH9KIKZypsI8xCyfPkdSi8qak1si0HA9brzt+Xe3vXQ209p
	28P23ikItMFlTxnYhL67KBOUoUNfcY+3Ot2Qy0FemmJSdjw7lHiBnH4xbZxdwQ1bh/HMTpYTX7w
	xPUyDl+6nSNOFMf7iiGeu179X8Tgk794=
X-Gm-Gg: AfdE7cn7/MHy2HlNgXzr1DMtsfBgW1c/N7z7GN616K2+ikycqP0hM5bNUOxjD+hFDdu
	sOLG7MEJuPChrrEtsvmXbUIees6Pjm+nJ4k1DVUfMZcOlnFU1GxR53xPrhYSdaYJBMWGlqeTo2X
	KV7eLNX81CssSureFEs9O36XNEmZlbS3LH96PKp9GVX3YjBKrVEo0cNwq5GheMbqHc86ruJUMQ/
	3h1snK1mV8ndhPZ2qP9EQauMk4kni3naD6WVf25kTeCrLehZlf36T0dJva+QVHXL/BeN//LCSN2
	1p2KOo4pLNbbF9ZNqafM7z9qQcM7hIcelIaBaRoNL5F9M1xjJHlScB1Q8hgl
X-Received: by 2002:a05:7300:6404:b0:30b:9e56:e547 with SMTP id
 5a478bee46e88-30ee11d7ac9mr202818eec.6.1782751655331; Mon, 29 Jun 2026
 09:47:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260628191337.937-1-kimjinseob88@gmail.com> <9b179166-3057-4867-be04-b071a809f70f@baylibre.com>
In-Reply-To: <9b179166-3057-4867-be04-b071a809f70f@baylibre.com>
From: Kim Jinseob <kimjinseob88@gmail.com>
Date: Tue, 30 Jun 2026 01:47:23 +0900
X-Gm-Features: AVVi8Cc9YZz7_2pOlAonXf0N4-dBQu_ZF09jB20zGNo43CtfKyfG9QaFkvAGcio
Message-ID: <CALMSewKHWfcq5D-0Bi8gAnCAUep6D1=HrgaM5WP-RucdU3fYmw@mail.gmail.com>
Subject: Re: [PATCH RFC v6 0/5] iio: add Open Sensor Fusion IIO driver
To: David Lechner <dlechner@baylibre.com>
Cc: Jonathan Cameron <jic23@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Andy, you are right. I should have included the previous-version links in t=
he
cover letter.

I also did not consistently track and answer all review comments across
revisions. I carried several comments into later revisions, but that was no=
t
sufficient. I should have made sure every reviewer comment was either
addressed in the code or explicitly answered before posting the next revisi=
on.

Sorry for that.

For reference, the earlier public versions are:

v1:
https://lore.kernel.org/r/20260520072843.3593-1-kimjinseob88@gmail.com

v2:
https://lore.kernel.org/r/20260524085312.15369-1-kimjinseob88@gmail.com

v3:
https://lore.kernel.org/r/20260529121005.1470-1-kimjinseob88@gmail.com

v4:
https://lore.kernel.org/r/20260607234343.22109-1-kimjinseob88@gmail.com

v5:
https://lore.kernel.org/r/20260616072242.3942-1-kimjinseob88@gmail.com

v6:
https://lore.kernel.org/r/20260628191337.937-1-kimjinseob88@gmail.com

David, understood. If the next revision is just asking for normal review an=
d
I do not have specific open questions, I will drop the RFC tag. If I still
mark it RFC, I will state the specific questions clearly in the cover lette=
r.

I will not post another revision until I have gone through the previous
review comments and made sure each one is either addressed in the code or
explicitly answered. I will also include the previous-version links in the
next cover letter.

Thanks

Jinseob


2026=EB=85=84 6=EC=9B=94 30=EC=9D=BC (=ED=99=94) =EC=98=A4=EC=A0=84 12:25, =
David Lechner <dlechner@baylibre.com>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> On 6/28/26 2:13 PM, Jinseob Kim wrote:
> > Open Sensor Fusion (OSF) devices expose a UART/serdev host interface
> > for a sensor aggregation hub.  This RFC adds a Linux IIO driver that
> > parses OSF frames and creates IIO devices at runtime from capability
> > reports provided by the device firmware.
> >
> > When the corresponding capabilities are reported, the driver exposes
> > accelerometer, gyroscope, magnetometer, and temperature data as IIO
> > devices named osf-accel, osf-gyro, osf-magn, and osf-temp.
> >
> > This remains RFC while the binding, protocol subset, runtime discovery
> > model, and driver-facing ABI are reviewed.
>
> If you are just looking for review and don't have specific questions,
> then it is time to drop the RFC.
>
