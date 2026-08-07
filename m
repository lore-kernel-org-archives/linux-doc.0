Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E843A3AA9CA
	for <linux-doc@vger.kernel.org>; Fri,  7 Aug 2026 17:12:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786122761; cv=pass; b=IGGZFBDC6uFTTRZTrln9ieD+GQeGJxRsrNZkfIWkOLC8uQ9u7pCA3niOWzlzGdJjl/eGtBA2GY4MwziLTiMJgbYfbIIeXExzvdkJ8k+n/kfjh8RiGlTR6zZeuxJ4klzlNK1DcCwhxQfpCRLkfYsy8QppGaUHza25TF7+qtIO7Bw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786122761; c=relaxed/simple;
	bh=rYN3WqMlSBD8p+Coyo0jjeKucvb7gFDKdiYxoZH2MVw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sJ2cF/pNHw9nYqsOvPiQ79qnckdFiO4/zPx8bg3vlcd16A5vNhlWMCiJT3WMs0szkx94ItVRWvZLpf64TjInoHXvhgmCY1SCIhIzm8zcoA1jRgMMseRkgSC27TesToBu9HiHAAQAb74gFrFJHrWie8BnstlpRTBpoYcbIyT3e6Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EHYPMaZB; arc=pass smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EHYPMaZB"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-c8612812170so271409a12.2
        for <linux-doc@vger.kernel.org>; Fri, 07 Aug 2026 10:12:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786122759; cv=none;
        d=google.com; s=arc-20260327;
        b=dblH5rFltc3JUOzAOD/wL16m2sgoVGps0ulkYQkvgs/7O2eRVOIYUmSevseV2DZYe+
         XutYKqfpafBMAq5Q1nMyPTKNOovC05OlAxWW/TTLFTgl0HJthdxiCivk3Fphq3Y2Em5p
         J4PaWe3hsNjT9voqJ8PywXVVzvQZyhWnlIf3I/z9OcNMzHdh1jfbMGe2FEodQ7jX40gf
         Bh19AUH/mRCwfCa0TGfOz8oSsHCY1M8HZmVMkz2Bniqw+WkvMZ/Cqa5HzBMI/PF+n3Td
         5g5Cj6sQQoZZmjIMSYnIRPUaoUCk0/8nagVqWPTX1V5dtl1LaQ8Jor92e56mG8Ju/t5x
         3EtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rYN3WqMlSBD8p+Coyo0jjeKucvb7gFDKdiYxoZH2MVw=;
        fh=y2yyNuYPjgIn82U5mbXvBEw3lse+H/AXTyBkiz8eF5U=;
        b=mtFXFtiFnOsPuMK77yXIh1jexko8EExvNG4zJ9x2Tiz7nm9+WLU0L8qexqXYk2Czjh
         9HCOBGju21uu+oxrfP5nDpgzg+Qni9bFAxf+gKMk1j1yhy4iXjoNYQmTto08sl/tsLzL
         8XcOWUjPJ+czNCIBQo8cvRnhEYmoF0+nWRhmmdenyfLl1Q5KrFzbNgd+bRYuTCdK4Ns9
         tP2J+LXH/RBamwrq17iIvo2Hrdam5OpIlsQqnc8uDK8FUmJMYgtswYH89ne+o43z3Loc
         kl9IvE0K2vXFFnWnc8Dtf7D895c/s96/VNd+E5fZ06gQ2iES0wKOCLpCaoJvgTZkT5IH
         D0mw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786122759; x=1786727559; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rYN3WqMlSBD8p+Coyo0jjeKucvb7gFDKdiYxoZH2MVw=;
        b=EHYPMaZBMz+4qGl436AEPpxDhPsRGe8iGQvvRzyUuHBYC4iNDJykV3dND4upD6TXVE
         ggSneTgwnyqbXe3QasXupXScDQoNKrbEMFOoCbhppHt+tYo+CNZv7aWVCXmvjQSi3J2e
         dQb09Jz/6eKr0+ars72RuFzqMQFFtMOlEapyoJulN0h4HbNBvxuPuznanu7h7J+UuEoJ
         C0jiS+ez4H68dEt1ZVI/vD6pzie9muzozUcTJv7PeHe6X2uQByAJwwXA8QJINlN/3jpz
         +XKQkDg//rZbUCrMY7jh/UeGR8cg91BIolAFu/vgFeWEMFf5X1EtNFzSs9WfbpGEx/tm
         UJfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786122759; x=1786727559;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rYN3WqMlSBD8p+Coyo0jjeKucvb7gFDKdiYxoZH2MVw=;
        b=lSFUnuZfHJKLvFxkl02eZuQOnBY/VI2BUrJMN5p8fPlJkQgJzl6UhxXvxLCMyaXTDK
         /ByeJ2wC9tPoxdOgRuRYCGIx6u6mjXqFibvug5WwVwfo964dkomj6wK6sKTv6eawmhIC
         60lS9OsJPxtdzyiL4bqzGRaH8/MBaNsZ4tv6UusZ9MCSW11zffN3K8N1o8MTfIXPAKCM
         nh80RDyRki+uy/SuUA0w0Gr3A5ofYTmopXcrlqm7z+ojClTJRZV+bKZNmFsy3S98OxCY
         ozbzE0xYPU69OtOxx4ft/VHCqtNrZjOCmX81sldEs3BWuFvrezGDs+r958K9JGbY6vGI
         AWmA==
X-Forwarded-Encrypted: i=1; AHgh+Rpr9cNa5uvSpDULWcEMl2UD0W81mAu8I4vrdug/slf4OepwZWo8b5ZiofTFb41y1SyjaYiDTILTKEk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwS1471vHYxgLvQ20MjvjDOxAZDD7IiDNmOWNqFK6p/bfwvkuG7
	YLRzyH5lbYMaZXq1M5+V9JbXBi7yrlAA04IXqqcl5z6DxA7BeLP5uYTU2mamwYMslNU5opg3aQZ
	jpYxaVLvoVxKr52QeOGYCOzguCyLt5DQ=
X-Gm-Gg: AR+sD102C7PcJRpLhZqK6pCB/f/gj6cvCFhKoyzV/Ite3PJefiIgikeWXrna7PielN/
	TX3ysU8ys35col3u0MizRdQSilCxzHgQQF5vhhL+v8yZ4poRzeXm2OJuST6JNPJhdBo+fJ1xaOv
	lzwWYzzxZp55umrKy3jI8xi+H1LSyMCz0P+c86RnnCGwnTiHz+vM0/HGSuOD76Ni/BCa/mGwUpx
	Q5twN1xiU0KbZQLEZtNpsImzVCcg/96Ge/jeqJscwiaB3udyx3vd4UUumV3fCpeV+Qbtsc1g8vN
	0aQoGEWbjz9WMaaVgfsbgn+5wNGO2+6JGlr+efnElWkg9jBNBDbOoSEPu+pM/WXcnE0sp86Ei5v
	9p4+zdLhDbfQLjUuRCyCuT7apiYIGgtmqSdhF2tOzt9APDIjexKVeotXwwIT6
X-Received: by 2002:a17:90b:1fc8:b0:38e:ab3f:2c99 with SMTP id
 98e67ed59e1d1-3903c628181mr18187876a91.2.1786122759120; Fri, 07 Aug 2026
 10:12:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260805-pramin-split-v1-0-ff3e84a75dac@nvidia.com>
 <20260805-pramin-split-v1-2-ff3e84a75dac@nvidia.com> <DKIRNHGHK4O6.2IRJZGM6W79B@nvidia.com>
In-Reply-To: <DKIRNHGHK4O6.2IRJZGM6W79B@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 7 Aug 2026 19:12:25 +0200
X-Gm-Features: AUfX_mw-cYa1MKRYuhH-uVGjXrAOGt3b9pyVqsuViit8BjsQ3XkXMD2u-qTWwOs
Message-ID: <CANiq72kYqPySwS8ci84CEsvjJqCTBjrveSx14xxnNWJZWRFAuw@mail.gmail.com>
Subject: Re: [PATCH 02/12] rust: num: reject Bounded::shr overshifts at build time
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Eliot Courtney <ecourtney@nvidia.com>, Danilo Krummrich <dakr@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Tamir Duberstein <tamird@kernel.org>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Yury Norov <yury.norov@gmail.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, driver-core@lists.linux.dev, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	nova-gpu@lists.linux.dev, dri-devel@lists.freedesktop.org, 
	linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 7, 2026 at 4:03=E2=80=AFPM Alexandre Courbot <acourbot@nvidia.c=
om> wrote:
>
> Indeed it looks like this would panic with the kernel build, and can be
> easily caught at build-time since `SHIFT` is a constant.
>
> Acked-by: Alexandre Courbot <acourbot@nvidia.com>

Do you want me to take it this cycle? And maybe the next one too?

Cheers,
Miguel
