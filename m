Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A958A50C299
	for <linux-doc@vger.kernel.org>; Thu, 15 Oct 2026 09:46:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792057615; cv=pass; b=ARUyeAos405hJTRWPAB0xa58x3l10Yyb3Gjf3TYFb3hwJksq11hVzoOXnjYjKk89zlCupLLBc7niz+eesPla7DPR3yXkHEdj+Op+tn6UcbKeBGlF+FzkcZOsZOoolYff/JYFep0GYRcKgFptibvOav8ykaXjX6ziqCCEJEtrols=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792057615; c=relaxed/simple;
	bh=ICrTBQhAcFMBle4ZO3IusjWW50Bxu9MMe+LD1licGqo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Nat5hRqgHB4sxi8VzDIq7vjCsCrvzX/XmjjEE7C3/7Y4KpBjxf8H1msoIFUOVafnUyRiSC6jItxPxSbWaqdp4gAZMLBhFB//XK4KtExWGFHYUnA5Z+FFxd4FvNc7bY9mHcBfMWgrc5bqM+5L4bq1Y2CVZcox++r9G/IDW8Uzs8w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=P8s3zewn; arc=pass smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="P8s3zewn"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5be3ed646a5so334325e87.1
        for <linux-doc@vger.kernel.org>; Thu, 15 Oct 2026 02:46:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792057612; cv=none;
        d=google.com; s=arc-20260327;
        b=gABmkoVv+sKCKY/y+t+mRYclDM7+Cr39DUW2ZBBpfm6GQkAP/y5Dv4HOtl42C1X9Rv
         HKq7t1Wyue3AhqUNo6lZk2F3nQWGNM0P2/prAh88p7drwrI5YGvH91TXa3vfeb7EOy4+
         TlLwhm60tF+iplSe7RcYDD0q8ZfWYZp533lLxMK0WjaO7LRraUh5WSR4NXutiNiih0D2
         V4tuX5dAqiTOLZFrlZCbN44siiAN5ZhF6y4+p39ypsoVng2A3zBQtql+Iw3oI1n9IgiR
         ZV8zsKdOpASiWGcVpzZQZeZzkyNpgblkXzOpsycB6O2eMoUG1pDDnD2ioDiWq3Xbaqzc
         16yA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KZ5hcI7sSvmMGW83CeAYEeOw/S5ozCHpu45O4BxP46g=;
        fh=ec8KqmEFmvhTy/UReY+t3KZXge4Rc2XubTH1MbJGMpw=;
        b=gSG7gEHkMDX2BxjXQTjlPdWeeNfXzcd/AbAGsJkB4QxB2BntPeoCAeHSSxhrrM89+p
         FoPc00BdMQKofTDO+S0ZMLNcEDP2rvc8cj8soiXEBb5STCHhj3bA03/EWLvLJtngXqLw
         kTO60qoWD+0NiRKHKrPaAzjK7zB72xkz3/SzUrF+0BbysaistXzTIWUnr87PaAzJ8jEe
         sZagpZSyAzDz3hbnAhrRyeCU9jLbycCLRojSSEyzDTojNg+nI0lACS2+CbV0zsGPb9kc
         l00Rz9Bdi7tMD4GxdyK3fW72WvAZWUpQeFzQmBNIOCnXBdDxmoXqaOwyocxLoop3Usgv
         Ps9w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1792057612; x=1792662412; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KZ5hcI7sSvmMGW83CeAYEeOw/S5ozCHpu45O4BxP46g=;
        b=P8s3zewnfLUipatq+GqLCGSvx1i+EJ7DV6ToSXJXwViWZ5+6/8kf8sUXAmHYA0WqF5
         dOGILgLTSYULGBXFCZaNARNcqmTUgIZZkHroeS1typd4X1bbk13RmWviU1ePgAhFRBpg
         EdOqKN4VwLFl0wNQbBTtDQbOicOqSBAJ8TWFBAVl6EG5RhHG6RWYWGhEtir9/DYxKXP1
         MGKazALbGicfMHQyJGxpTs4luLDCo0j62vDl87NXtfOUhnO6JNVZZTX3AuEZpV+ejq18
         vcbh4Rm5+MZ/+513KO5SxXN0Su6jVTq8fJCvIckEb6F48Z2/HeS3ATacZI9Dse5YgjvH
         GCIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792057612; x=1792662412;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KZ5hcI7sSvmMGW83CeAYEeOw/S5ozCHpu45O4BxP46g=;
        b=TU/Pt89gxuYo5Zgkx0vlLLK0Bd/cwHPRztjbsbGAsd+erjl0r0RPFZqQVAF9ws+t6f
         CHcf4x2hqnhfG77noH73VpSaUac660dOfdc3yaRurYbiAxNHIx9k2VfFhUgKVJbp4+EE
         LLsE7EHIdQiVQ14lYvzje+EHs2gIjEvGB/3/lG9auAmdSAxrKR6m8xNYvKfRNVXS77n3
         sBTEPneKWu46pLyT9AlDFiucW9EFqatu4CulntJICfl3Em6Eu5Vwoi2cj+VXEneMSWXN
         Be/iuPBtsTAs/sNS5K8UfAvQyKy7vpqEa5GjzzYw/I0gyjURkdLfs4eqxGFYQwLBru0N
         MpQQ==
X-Forwarded-Encrypted: i=1; AKwUvBzT7aGrakzzmrAXVWiqxV5LevgiGeFoI5pP10XbCm4O5tF7KvI1xbBOms/nNYzX8yDTXeLrECo8pfE=@vger.kernel.org
X-Gm-Message-State: AFq9FYLV21aSNlZvsFVYSIdW2kA1gPkIRpsTynPAD4V1FyfEWku19tYI
	reKn87mJNRN3mwKspI271H2OsVPDTxzaJYmKBEwoEYG9vRsqkpGhO+/yrenHYA50qYDDtlKHrtC
	k3ljef+dM0Avp8lHfmGSJkESnss4wgwpOPdkBEVf9b2/PHFoK3TTglxO/JA==
X-Gm-Gg: AYBFou0ut0s4aJe48L8ef+PxH88ifxyfnjDw/A7FzlWsepcQIGEeFeNurUdhF7zGJP5
	40+BdwEtsfSCAf5Y1euF0TUdPDaPDlM2iCLoAiZ3Y28gaH4ZzTxHVNzSJwWy3qY2YHDo6aq9gTf
	znIndEV+A+7KZEtAfyjH9XOHgvCAevT7CvwY2pYuHFT9JmbW3NwPniW1Fb6tUPpiknjlsZ8x9Ju
	pk79T7fbkrcZ25v1/Ehe6BEMlhU7g+Tou/FrRgHMNb0xS5cW7Df/BpYAkO9peK6Vbnc/qopr0Vz
	ymGCd7PoyBg2akSEu8yIdP9GIPgaxyCmWNGYW95+vNDeBz3wkHKvl18l+1qA0McVPx3CBQmI/BQ
	X0cJmPDL4WH9RF05iVIEgWjeg
X-Received: by 2002:a05:6512:3b8a:b0:5bc:cbe1:8ac4 with SMTP id
 2adb3069b0e04-5bcde35d84cmr7124226e87.4.1792057611692; Thu, 15 Oct 2026
 02:46:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261014-rust-workqueue-system-fix-v2-1-c018b8f870f9@google.com>
In-Reply-To: <20261014-rust-workqueue-system-fix-v2-1-c018b8f870f9@google.com>
From: Marco Crivellari <marco.crivellari@suse.com>
Date: Thu, 15 Oct 2026 11:46:40 +0200
X-Gm-Features: AclHuK-V4MMe-c4XgIPiZC8N9eZ4vEYkszRRk_SEIQzq_Xg0na_JHo_eBAyU_j8
Message-ID: <CAAofZF4m3Fus+SizDwAdDEMr9V8RSgybveMhNg=nbM3dZj=JNw@mail.gmail.com>
Subject: Re: [PATCH v2] rust: workqueue: replace deprecated system_wq with system_{percpu,dfl}_wq
To: Alice Ryhl <aliceryhl@google.com>
Cc: Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Alex Shi <alexs@kernel.org>, 
	Yanteng Si <si.yanteng@linux.dev>, Dongliang Mu <dzm91@hust.edu.cn>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Carlos Llamas <cmllamas@google.com>, 
	rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 14, 2026 at 11:08=E2=80=AFAM Alice Ryhl <aliceryhl@google.com> =
wrote:
>
> From: Danilo Krummrich <dakr@kernel.org>
>
> system_wq is deprecated and triggers a runtime warning:
>
>         [    0.857414] workqueue: work func ...WorkItemPointerKy0_E3runB7=
_ enqueued on deprecated workqueue. Use system_{percpu|dfl}_wq instead.
>
> Replace system() with system_percpu() and system_dfl(), to match the
> previous behavior of the deprecated system() and convert doc examples
> and tests to system_dfl().
>
> system_unbound_wq is deprecated in the same way, in favor of
> system_dfl_wq. Since system_unbound() has no users, just remove it as
> well.
>
> Fixes: 64d8eae3f895 ("workqueue: Add warnings and fallback if system_{unb=
ound}_wq is used")
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>
> Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
> Reviewed-by: Boqun Feng <boqun@kernel.org>
> Reviewed-by: Dongliang Mu <dzm91@hust.edu.cn>
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>

Acked-by: Marco Crivellari <marco.crivellari@suse.com>

Thanks!
--=20

Marco Crivellari

SUSE Labs
